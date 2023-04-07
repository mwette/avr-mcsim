/* system.c
 * 
 * Copyright (C) 2019-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * Copyright (C) 2019-2021 Matthew R. Wette
 *
 * usage:
 *   1) just a single chip sim
 *   2) multiple items, requiing setup file (in scheme)
 */

#define _XOPEN_SOURCE 600
#define _POSIX_C_SOURCE 1
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <limits.h>
#include <assert.h>
#include <time.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dlfcn.h>
#include "octsx.h"
#include "octbx.h"

struct env *def_env;

#define USE_SPICE 0

#if USE_SPICE 
static int spice_dt_ns = 1000;		/* tmevt delta-T */

void (*xyce_open)(void**);
void (*xyce_close)(void**);
int (*xyce_initialize)(void**, int, char **);
int (*xyce_simulateUntil)(void **, double, double*);
int (*xyce_getNumDevices)(void **, char *, int*, int*);
int (*xyce_getDeviceNames)(void **, char *, int*, char **);
int (*xyce_getTotalNumDevices)(void **, int*, int*);
int (*xyce_getAllDeviceNames)(void **, int*, char **);
int (*xyce_getDACDeviceNames)(void **, int*, char **);
int (*xyce_checkDeviceParamName)(void **, char*);
int (*xyce_getDeviceParamVal)(void **, char*, double*);
int (*xyce_getNumAdjNodesForDevice)(void **, char*, int*);
int (*xyce_getAdjGIDsForDevice)(void **, char*, int*, int*);
int (*xyce_updateTimeVoltagePairs)(void **, char *, int, double *, double *);
int (*xyce_getTimeVoltagePairsADC)(void**,int*,char**,int*,double**,double**);
int (*xyce_getTimeStatePairsADC)(void**, int*, char**, int*, double**, int**); 
int (*xyce_getADCMap)(void**,int*,char**,int*,double*,double*,double*, double*);
int (*xyce_setADCWidths)(void**,int,char**,int*);
int (*xyce_getADCWidths)(void**,int,char**,int*);
int (*xyce_checkResponseVar)(void**,char*);
int (*xyce_obtainResponse)(void**,char*,double*);

  // spice input:
  // pin PA3 => DAC         : ??? = mega.portA.pins[3].dval;
static void spice_act(void *arg, tmsch_t *tmsch) {
  spice_t *spice = arg;
  void **sh = &spice->hdl;
  int ix, res;
  double tact, meas;
  simtime_t at;
  int port_val;
  static int cnt = 0;
  simtime_t tm;
  spice_dac_t *dac;
  spice_adc_t *adc;
  spice_mea_t *mea;
 
  spice->tv[1] = tm_to_float(tmsch->time) + 1.0e-9*spice->dt_ns;
  /* ^--  tv[0] set by simulateUntil last round */

  for (ix = 0; ix < spice->ndac; ix++) {
    dac = &spice->dacs[ix];
    dac->av[0] = dac->av[1];
    if (dac->pin) dac->av[1] = 5.0*dac->pin->dval; /* FIXME */
    res = xyce_updateTimeVoltagePairs(sh, dac->name, 2, spice->tv, dac->av);
    if (res != 1) {
      fprintf(stderr, "spice fail: xyce_updateTimeVoltagePairs\n");
      spice->evt = 0;
      return;
    }
  }

  res = xyce_simulateUntil(sh, spice->tv[1], &spice->tv[0]);
  if (res != 1) {
    fprintf(stderr, "spice: xyce_simulateUntil failed\n");
    spice->evt = 0;
    return;
  }
  
  for (ix = 0; ix < spice->nadc; ix++) {
    adc = &spice->adcs[ix];
  }
  for (ix = 0; ix < spice->nmea; ix++) {
    mea = &spice->meas[ix];
    res = xyce_obtainResponse(sh, mea->name, &meas);
    if (mea->pin) mea->pin->aval = meas;
  }

#if 0
  //res = xyce_obtainResponse(sh, "Vout", &vout);
  //res = xyce_obtainResponse(sh, "Vpin", &vpin);
  //printf("... done\n"); fflush(stdout);
  cnt = (cnt + 1) % 1000;
  tm = tmsch->time;
  if (cnt == 0) {
    printf("vpin %d.%09d %f\n", tm.sec, tm.nsec, vpin);
    printf("vout %d.%09d %f\n", tm.sec, tm.nsec, vout);
    fflush(stdout);
  }
#endif

  at = tm_add_ns(tmsch->time, spice->dt_ns);
  spice->evt = tmsch_sched(tmsch, at, -10, spice_act, arg);
  spice->evt->name = __func__;
}


/* 
 * -l <file>  log to 
 * -quiet     be quiet
 * <file>     circuit file
 */
void spice_init(spice_t *spice, tmsch_t *tmsch, int argc, char **argv) {
  void *dh, **hp;
  int ix, n, res;
  int ndac, nadc;                       /* number of devices */
  int mxlen;                            /* max device name length */
  char **names;
  simtime_t at;
  tmevt_t *evt;

  /* link */
  dh = dlopen("spice.so", RTLD_NOW);
  xyce_open = dlsym(dh, "xyce_open");
  xyce_close = dlsym(dh, "xyce_close");
  xyce_initialize = dlsym(dh, "xyce_initialize");
  xyce_getNumDevices = dlsym(dh, "xyce_getNumDevices");
  xyce_getDeviceNames = dlsym(dh, "xyce_getDeviceNames");
  xyce_updateTimeVoltagePairs = dlsym(dh, "xyce_updateTimeVoltagePairs");
  xyce_simulateUntil = dlsym(dh, "xyce_simulateUntil");
  xyce_obtainResponse = dlsym(dh, "xyce_obtainResponse");

  spice->dt_ns = 1000;			/* 1 us for starters */
  hp = &spice->hdl;

  xyce_open(hp);

  res = xyce_initialize(hp, argc, argv);
  if (res != 1) { fprintf(stderr, "spice_init failed, step 1\n"); return; }
  
  /* Locate ADCs and DACs. */
  res = xyce_getNumDevices(hp, "YADC", &nadc, &mxlen);
  if (res != 1) { fprintf(stderr, "spice_init failed, step 2\n"); return; }
  if (ix > SPC_ADC_MAX) {
    fprintf(stderr, "too many ADCs, skipping some\n");
    nadc = SPC_ADC_MAX;
  }
  spice->nadc = nadc;
  names = spice->adc_names = malloc(nadc*sizeof(char*));
  for (ix = 0; ix < nadc; ix++)
    names[ix] = spice->adcs[ix].name = malloc((mxlen+1)*sizeof(char));
  res = xyce_getDeviceNames(hp, "YADC", &n, names);
  if (res != 1) { fprintf(stderr, "spice_init failed, step 3\n"); return; }

  res = xyce_getNumDevices(hp, "YDAC", &ndac, &mxlen);
  if (res != 1) { fprintf(stderr, "spice_init failed, step 4\n"); return; }
  if (ix > SPC_DAC_MAX) {
    fprintf(stderr, "too many DACs, skipping some\n");
    ndac = SPC_DAC_MAX;
  }
  spice->ndac = ndac;
  names = spice->dac_names = malloc(ndac*sizeof(char*));
  for (ix = 0; ix < ndac; ix++)
    names[ix] = spice->dacs[ix].name = malloc((mxlen+1)*sizeof(char));
  res = xyce_getDeviceNames(hp, "YDAC", &n, names);
  if (res != 1) { fprintf(stderr, "spice_init failed, step 5\n"); return; }

  /* Schedule first run. */
  at = tm_add_ns(tmsch->time, spice->dt_ns);
  evt = tmsch_sched(tmsch, at, -10, spice_act, spice);
  evt->name = "spice_act";
}

void spice_fini(spice_t *spice) {
  int ix;

  xyce_close(&spice->hdl);
  for (ix = 0; ix < spice->nadc; ix++)
    free(spice->adcs[ix].name);
  free(spice->adc_names);
  for (ix = 0; ix < spice->ndac; ix++)
    free(spice->dacs[ix].name);
  free(spice->dac_names);
}
#else

void spice_init(spice_t *spice, tmsch_t *tmsch, int argc, char **argv) {
}

void spice_fini(spice_t *spice) {
}

#endif

struct mcu_info {
  char *device;
  char *group;
} mcu_table[] = {
  { "mega4809", "mega4809", },
  // { "mega328p", "mega328", },
  { 0, 0 },
};

char *find_mcu_group(char *device) {
  struct mcu_info *m;

  for (m = mcu_table; m->device != 0; m++) {
    if (strcmp(device, m->device) == 0) return m->group;
  }
  return 0;
}
  
static void simlib_init() {
  static int init_done = 0;

  if (init_done) return;
  init_done = 1;
}

sys_t *make_sys(int argc, char *argv[]) {
  sys_t *sys;

  sys = malloc(sizeof(sys_t));
  sys_init(sys, argc, argv);
  if (def_env == 0) def_env = sys;
  return sys;
}

void sys_init(sys_t *sys, int argc, char *argv[]) {
  memset(sys, 0, sizeof(sys_t));
  tmsch_init(&sys->clk, 0);
}

void sys_fini(sys_t *sys) {
  /* need to go through and fini all devices */
  if (sys->flag.use_spice) {
    spice_fini(&sys->spice);
  }
}

tmsch_t *get_sys_clk(sys_t *sys) {
  return &sys->clk;
}

simtime_t get_simtime(sys_t *sys) {
  return sys->clk.time;
}

void get_simtime_tp(sys_t *sys, simtime_t *tp) {
  assert(tp);
  *tp = sys->clk.time;
}

#ifndef NO_DYNLD
/* 
 * if code == NULL don't load code, otherwise return NULL if not found.
 */
mcu_t *make_mcu(tmsch_t *tmsch, char *dev, char *code) {
  mcu_t *mcu;
  char *grp;
  void *dh;
  mcu_gen_t make_dev;
  cpu_t *cpu;
  char buf[PATH_MAX];

  grp = find_mcu_group(dev);
  snprintf(buf, sizeof(buf), "%s.so", grp);
  dh = dlopen(buf, RTLD_NOW);
  if (dh == 0) {
    fprintf(stderr, "octsim: error loading %s:\n  %s\n", buf, dlerror());
    return 0;
  }

  snprintf(buf, sizeof(buf), "make_%s", dev);
  make_dev = dlsym(dh, buf);
  if (make_dev == 0) {
    fprintf(stderr, "octsim: error calling %s:\n  %s\n", buf, dlerror());
    return 0;
  }
  mcu = (*make_dev)(tmsch);
  mcu->device = strdup(dev);
  if (code) mcu->code = strdup(code);

  cpu = &mcu->cpu;
  cpu->gen_asml = 1;			/* gen asm line info */
  cpu->show_ba = 1;			/* show byte addresses */
  if (code) {
    if (cpu_load_program(cpu, code) != 0) {
      fprintf(stderr, "MCU code not loaded: %s\n", dev);
      return 0;
    }
    mcu_reset(mcu, 0);
  }
  
  return mcu;
}
#else
mcu_t *make_mcu(tmsch_t *tmsch, char *dev, char *code) {
  abort();
}
#endif

cpu_t *get_mcu_cpu(mcu_t *mcu) { return &mcu->cpu; }


/* === bus-model ========================== */

#define BUS_NPIN 8

#if 0
typedef struct iobus {
  iopin_t *pins[BUS_NPIN];		/* up to 8 pins per conn */
  uint32_t chg_mask;			/* pins changed */
} iobus_t;

#define NPIN 2

typedef enum {
  BUS_LEV_LOW = 0,
  BUS_LEV_HI = 1,
} buslev_t;

typedef struct bus {
   tmsch_t *tmsch;
  int npin;
  iopin_t *pins[4];
  int lev;
  uint32_t t_rise_ns;
  uint32_t t_fall_ns;
  tmevt_t *relevel_act;
} bus_t;

void bus_pin_changed(void *tgt, struct iopin *pin, int op, int arg);

/* ^ bus header */
#endif

static void bus_relevel_act(void *ptr, tmsch_t *sch);
void bus_relevel(bus_t *bus);

void bus_init(bus_t *bus, tmsch_t *sch) {
  memset(bus, 0, sizeof(*bus));
  bus->tmsch = sch;
  bus->t_rise_ns = 500;
  bus->t_fall_ns = 100;
}

/*
 *  speed   t_rise "baud" fscl*baud
 * ======= ======= ====== =========
 * 0.1 MHz 1000 ns   105   ~10
 * 0.1 MHz  500 ns   100   ~10
 * 0.4 MHz  100 ns    19   ~5
 * 0.4 MHz  300 ns    17   ~5
 */


bus_t *make_bus(tmsch_t *sch) {
  bus_t *bus;
  bus = malloc(sizeof(bus_t));
  bus_init(bus, sch);
  return bus;
}

void bus_conn_to_pin(bus_t *bus, iopin_t *pin) {
  bus->pins[bus->npin++] = pin;
  pin->hey_bus = bus_pin_changed;
  pin->bus = bus;
}

void bus_pin_changed(void *tgt, struct iopin *pin, int op, int arg) {
  bus_t *bus = tgt;
  simtime_t t;
  int dt;

  switch (op) {
  case PIN_BOP_LVL:
    if (bus->relevel_act) tmsch_cancel(bus->tmsch, bus->relevel_act);
    dt = (arg == 0)? bus->t_fall_ns: bus->t_rise_ns;
    t = tm_add_ns(bus->tmsch->time, dt);
    //printf("system: schedule bus relevel in %d ns\n", dt);
    bus->relevel_act = tmsch_sched(bus->tmsch, t, +2, bus_relevel_act, bus);
    break;
  case PIN_BOP_PUL:
    bus_relevel(bus);
    break;
  }
}
  
void bus_relevel(bus_t *bus) {
  iopin_t *pn;
  int lev;

  lev = 0;
  for (int i = 0; i < bus->npin; i++) {
    pn = bus->pins[i];
    if (pn->pullup) lev = 1;
  }
  for (int i = 0; i < bus->npin; i++) {
    pn = bus->pins[i];
    if ((pn->dir == PIN_DIR_OUT) && (pn->wrlev == PIN_LEV_LOW)) lev = 0;
  }
  if (bus->lev != lev) {
    if (1 && def_env) {
      device_t *dev = dev_lookup_byaddr(def_env, bus);
      if (dev) iprint(1, "Bus %s: level changed: %d => %d\n",
		      dev->name, bus->lev, lev);
    }
    bus->lev = lev;
    for (int i = 0; i < bus->npin; i++) {
      pn = bus->pins[i];
      if (pn == 0) continue;
      iopin_notify_per(pn, PIN_BOP_LVL, lev);
    }
  }
}

static void bus_relevel_act(void *ptr, tmsch_t *sch) {
  bus_t *bus = ptr;
  
  bus->relevel_act = 0;
  bus_relevel(bus);
}

#if 0
void bus_notify_pins(bus_t *bus, int op, int arg) {
  iopin_t *pn;
  int lev;

  //printf("bus_notify_pins bus.lev=%d arg=%d\n", bus->lev, arg);
  switch (op) {
  case PIN_BOP_LVL:
    lev = 1;
    for (int i = 0; i < bus->npin; i++) {
      pn = bus->pins[i];
      if ((pn->dir == PIN_DIR_OUT) && (pn->wrlev == PIN_LEV_LOW)) lev = 0;
    }
    if (bus->lev != lev) {
      bus->lev = lev;
      for (int i = 0; i < bus->npin; i++) {
	pn = bus->pins[i];
	if (pn == 0) continue;
	iopin_notify_per(pn, PIN_BOP_LVL, lev);
      }
    }
    break;
  default:
    abort();
    break;
  }
  //printf(" %p bus.lev=%d\n", bus, bus->lev);
}
#endif

/* === connects ========================== */

iopin_t *mcu_pin_byname(mcu_t *mcu, char *name) {
  iopin_t *pin = mcu->pn(mcu, name);
  return pin;
}

void connect_nodes(iopin_t *a, iopin_t *b) {
  a->hey_bus = bus_pin_changed;		/* a -> b */
  a->bus = b;
  b->hey_bus = bus_pin_changed;		/* b -> a */
  b->bus = a;
}

/* === config ========================== */

static int oct_name_hash(char *s) {
  int hval = 0;

  while (*s != '\0') {
    hval = (hval + *s++) % OCT_N_HSIZ;
  }
  return hval;
}

device_t *dev_insert(sys_t *sys, char *name, devtype_t type, void *guts) {
  int nx = oct_name_hash(name);
  int ax = OCT_ADDR_HASH(guts);
  device_t *info, *next, *prev;
  
  prev = &sys->n_htab[nx];
  next = prev->n.next;
  info = malloc(sizeof(device_t));
  info->n.prev = prev;
  info->n.next = next;
  info->name = strdup(name);
  info->type = type;
  info->guts = guts;
  prev->n.next = info;
  if (next) next->n.prev = info;

  prev = &sys->a_htab[ax];
  next = prev->a.next;
  info->a.prev = prev;
  info->a.next = next;
  prev->a.next = info;
  if (next) next->a.prev = info;
  
  return info;
}

device_t *dev_lookup_byname(sys_t *sys, char *name) {
  int nx = oct_name_hash(name);
  device_t *hent;

  for (hent = sys->n_htab[nx].n.next; hent; hent = hent->n.next) {
    if (strcmp(hent->name, name) == 0) return hent;
  }
  return 0;
}

device_t *dev_lookup_byaddr(sys_t *sys, void *addr) {
  int ax = OCT_ADDR_HASH(addr);
  device_t *hent;

  for (hent = sys->a_htab[ax].a.next; hent; hent = hent->a.next) {
    if (hent->guts == addr) return hent;
  }
  return 0;
}

char *dev_name(device_t *dev) { return dev->name; }
int dev_type(device_t *dev) { return dev->type; }
void *dev_guts(device_t *dev) { return dev->guts; }

#ifdef USE_GUILE
#define DATA scm_from_utf8_symbol("data")
#define make_foreign(NAME) \
  scm_make_foreign_object_type(scm_from_utf8_symbol(NAME),DATA,NULL)

void init() {
  sys_type = make_guile_type("sys");
  mcu_type = make_guile_type("mcu");
  cpu_type = make_guile_type("cpu");
  cir_type = make_guile_type("circuit");
  scm_c_define_gsubr("make-sys", 0, 0, 1, make_g_sys);
  scm_c_define_gsubr("make-mcu", 0, 0, 1, make_g_mcu);
  scm_c_define_gsubr("make-mcu", 0, 0, 1, make_g_cpu);
  scm_c_define_gsubr("make-circuit", 0, 0, 1, make_g_cir);
}
#endif



/* === running ========================= */

void sys_run_to(sys_t *sys, simtime_t to) {
  simtime_t at;
  
  tmsch_run(&sys->clk, to, 0);
  at = sys->clk.time;
  if (tm_lt(at, to)) printf("break at %d.%09d\n", at.sec, at.nsec);
}

void sys_run_ns(sys_t *sys, long ns) {
  simtime_t to;
  to = tm_add_ns(sys->clk.time, ns);
  sys_run_to(sys, to);
}

void sys_run_sns(sys_t *sys, long s, long ns) {
  simtime_t to;

  to.sec = s; 
  to.nsec = ns; 
  to = tm_add(sys->clk.time, to);
  sys_run_to(sys, to);
}

void sys_run_sus(sys_t *sys, long s, long us) {
  sys_run_sns(sys, s, 1000*us);
}

void sys_run_sms(sys_t *sys, long s, long ms) {
  sys_run_sus(sys, s, 1000*ms);
}

void sys_run_dt(sys_t *sys, float dt) {
  simtime_t to;
  float ti;

  if (dt <= 0.0) return;
  ti = floorf(dt);
  to.sec = (int32_t)ti;
  to.nsec = (int32_t)floorf(1.0e9*(dt - ti));
  to = tm_add(sys->clk.time, to);
  sys_run_to(sys, to);
}

// sys_run_to_cpu_addr sys cpu pc wordaddress
void sys_run_to_cpu_addr(sys_t *sys, cpu_t *cpu, uint32_t pc) {
  simtime_t ts = { -1, 0 };

  if (cpu->prog[pc] == BREAK_INSN) {
    tmsch_run(&sys->clk, ts, 0);	/* CHECK THIS */
  } else {
    brkpt_set(cpu, 0, pc);
    tmsch_run(&sys->clk, ts, 0);
    brkpt_unset(cpu, 0);
  }
}

void sys_cont(sys_t *sys, cpu_t *cpu) {
  simtime_t ts = { -1, 0 };

  tmsch_run(&sys->clk, ts, 0);
  /* If above doesn't print, then do it here: */
  if (cpu && cpu->trace == 0) cpu_disp(cpu);
}
  
/* @deffn {C} void sys_cpu_next(sys_t *sys, cpu_t *cpu, int n)
 * next instruction in code (i.e., if call, execute through ret)
 * @end deffn
 */
void sys_cpu_next(sys_t *sys, cpu_t *cpu, int n) {
  uint32_t pc;

  for (int i = 0; i < n; i++) {
    pc = cpu_next_pc(cpu, cpu->pc);
    sys_run_to_cpu_addr(sys, cpu, pc);
  }
  if (cpu->trace == 0) cpu_disp(cpu);
}

/* @deffn {C} void sys_cpu_step(sys_t *sys, cpu_t *cpu, int n)
 * Execute up to next instruction.  Step into subroutine, if a call.
 * @end deffn
 */
void sys_cpu_step(sys_t *sys, cpu_t *cpu, int n) {
  uint32_t pc;

  for (int i = 0; i < n; i++) {
    pc = cpu->upd.pc;			/* PC for next insn */
    sys_run_to_cpu_addr(sys, cpu, pc);
  }
  if (cpu->trace == 0) cpu_disp(cpu);
}

void sys_dummy() { }

/* --- last line --- */

