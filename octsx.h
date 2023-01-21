/* octsx.h
 * 
 * Copyright (C) 2019-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef OCTSX_H__
#define OCTSX_H__

#include "octbx.h"
#include "octsx/spice.h"

#define OCT_HSIZ	31		/* hash table size */

typedef enum {
  OCT_T_NONE,
  OCT_T_MCU,
  OCT_T_BUS,
  OCT_T_OSC,
  OCT_T_CIR,
  OCT_T__MAX
} devtype_t;

typedef struct device {
  struct device *next;
  struct device *prev;
  char *name;				/* interned name */
  devtype_t type;
  void *guts;
} device_t;

/* simulation environment. */
struct env {
  tmsch_t clk;
  struct {
    unsigned use_spice: 1;
  } flag;
#if 0
  device_t *devlist;
  device_t *htab[OCT_HSIZ];
#else
  device_t htab[OCT_HSIZ];
#endif
  spice_t spice;
};

typedef struct env sys_t;

sys_t *make_sys(int argc, char **argv);
void sys_init(sys_t *sys, int argc, char **argv);
void sys_fini(sys_t *sys);

device_t *dev_insert(sys_t *sys, char *name, devtype_t type, void *dev);
device_t *dev_lookup(sys_t *sys, char *name);
char *dev_name(device_t *dev);
int dev_type(device_t *dev);
void *dev_guts(device_t *dev);


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

bus_t *make_bus(tmsch_t *sch);
void bus_relevel(bus_t *bus);
void bus_conn_to_pin(bus_t *bus, iopin_t *pin);
void bus_pin_changed(void *tgt, struct iopin *pin, int op, int arg);

mcu_t *make_mcu(tmsch_t *tmsch, char *dev, char *code);

//mcu_t *get_sys_mcu(sys_t *sys);
cpu_t *get_mcu_cpu(mcu_t *mcu);
//cpu_t *get_sys_cpu(sys_t *sys);
tmsch_t *sys_tmsch(sys_t *sys);
tkclk_t *sys_cpu_clk(sys_t *sys);
tmsch_t *get_sys_clk(sys_t *sys);
simtime_t get_simtime(sys_t *sys);

void sys_run_to(sys_t *sys, simtime_t to);
void sys_run_ns(sys_t *sys, long ns);
void sys_run_sus(sys_t *sys, long s, long us);
void sys_run_sns(sys_t *sys, long s, long ns);
void sys_run_to_cpu_addr(sys_t *sys, cpu_t *cpu, uint32_t pc);
void sys_run_dt(sys_t *sys, float dt);

void sys_cont(sys_t *sys, cpu_t *cpu);
void sys_cpu_next(sys_t *sys, cpu_t *cpu, int n);
void sys_cpu_step(sys_t *sys, cpu_t *cpu, int n);

iopin_t *mcu_pin_byname(mcu_t *mcu, char *name);
void connect_nodes(iopin_t *a, iopin_t *b);

/* === more general approach ========= */
#if 0

typedef enum {
  XX_TT_ANY,
  XX_TT_I8,
  XX_TT_U8,
  XX_TT_I16,
  XX_TT_U16,
  XX_TT_I32,
  XX_TT_U32,
  XX_TT_F32,
  XX_TT_F64,
  XX_TT_F64,
  XX_TT_PTY,				/* pointer-to */
  XX_TT_ATY,				/* array-of */
  XX_TT_STY,				/* struct */
  XX_TT_UTY,				/* union */
} xx_tytag_t;

/*
pointer-to  PTY
array-of    ATY
struct      STY
union       UTY
 */
typedef struct xx_type {
  xx_tytag_t type;
  uint32_t size;
  uint32_t alin;
  char *name;
  /* aliases?
  struct nlink { struct nlink *next; char *name; };
  nlink_t *aliases;
  */
  char *desc;
  uint32_t nfld;
  struct xx_type *flds;			/* array of fields */
} xx_type_t;

xx_type_t foo_flds[] = {
  { XX_TT_INT32, 4, 4, "x", 0, 0 },
};

typedef uintptr_t xx_type_t;
typedef uintptr_t xx_value_t;

/* non-aggregate value */
typedef union xx_naval {
  int32_t i32;
  uint32_t u32;
  int32_t i32;
  uint32_t u32;
  float f32;
  double f64;
  void *ptr;
} xx_naval_t;

typedef struct xx_binding {
  struct xx_binding *next;
  struct xx_binding *prev;
  char *name;
  xx_type_t *type;
  xx_naval_t *naval;
} xx_binding_t;


xx_type_t types[] = {
  // type, size, alin, name, desc, nfld, flds
  { XX_TY_PTR, sizeof(void*), alignof(void*), "tmsch_t", },
};
/*
  - foo1 -  find name, type by address

types:


  oblique pointer
env contains
 "sch" - scheduler

*/

#endif

#endif
/* --- last line --- */
