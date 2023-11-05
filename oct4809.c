/* oct4809.c
 * 
 * Copyright (C) 2019-2021 Matthew R. Wette
 *
 * No license to use granted.
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
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dlfcn.h>
#include "octsx.h"
#include "octbx.h"

mcu_t *make_mega4809(tmsch_t *tmsch);

mcu_t *make_4809(tmsch_t *tmsch, char *code) {
  mcu_t *mcu;
  cpu_t *cpu;
  
  mcu = make_mega4809(tmsch);
  mcu->device = strdup("mega4809");
  mcu->code = strdup(code);

  cpu = &mcu->cpu;
  cpu->gen_asml = 1;			/* gen asm line info */
  cpu->show_ba = 1;			/* show byte addresses */
  if (code) {
    cpu_load_program(cpu, code);
    mcu_reset(mcu, 0);
  }
  
  return mcu;
}

enum sim_mode {
  SIM_NONE,
  SIM_ADDR,
  SIM_STEPS,
  SIM_UNTIL,
};

char *mcu_opts[10];

const char *usage = 
  "octsim (-a addr|-s step|-u time) [-b addr] [-t] <hex-file>";

/*
 * oct4809 [-b brkpt]* [-t] (-a addr | -s nstep | -u time) <code>
 * e.g., octsim -u 1.0 demo/01/main.hex
 */
int main(int argc, char *argv[]) {
  char *filename, *cp;
  int opt, nstep, trace = 0;
  uint32_t addr, brkpts[20];
  int n, nbrkpt = 0;
  sys_t *sys;
  mcu_t *mcu;
  cpu_t *cpu;
  simtime_t to;
  enum sim_mode mode;

  //opterr = 0;
  while ((opt = getopt(argc, argv, "a:b:hs:tu:")) != -1) {
    switch (opt) {
    case 'a':				/* -a N (simulate to addr) */
      mode = SIM_ADDR;
      addr = strtol(optarg, 0, 0);
      break;
    case 'b':				/* set breakpoint */
      if (nbrkpt >= 20) break;
      brkpts[nbrkpt++] = strtol(optarg, 0, 0);
      break;
    case 'h':
      fprintf(stdout, "usage: %s\n", usage);
      exit(0);
      break;
    case 's':				/* -s N (simulate N steps) */
      mode = SIM_STEPS;
      nstep = strtol(optarg, 0, 0);
      break;
    case 't':
      trace = 1;
      break;
    case 'u':				/* -u S.NS (simulate until time) */
      mode = SIM_UNTIL;
      to.sec = strtol(optarg, &cp, 10);
      if (*cp == '\0') {
	to.nsec = 0;
      } else if (*cp == '.') {
	n = strlen(++cp);
	if (n > 9) cp[9] = '\0';
	to.nsec = strtol(cp, 0, 10);
	while (n++ < 9) to.nsec *= 10;
      } else {
	fprintf(stderr, "octsim: bad until time\n");
	exit(1);
      }
      break;
    default:
      break;
    }
  }
#if 0
  if (opt != '?') {
    fprintf(stderr, "usage: %s\n", usage);
    exit(1);
  }
#endif
  if ((optind + 1) != argc) {
    fprintf(stderr, "usage: %s\n", usage);
    exit(1);
  }
  sys = make_sys(0, 0);
  mcu = make_4809(&sys->clk, argv[optind+0]);
  cpu = &mcu->cpu;

  /* advance to zero time, allow -neps items to run */
  sys_run_to(sys, (simtime_t){0,0});
  
  cpu->trace = trace;

  for (int i = 0; i < nbrkpt; i++)
    add_brkpt(cpu, brkpts[i]);
  
  switch (mode) {
  case SIM_ADDR:
    sys_run_to_cpu_addr(sys, cpu, addr);
    break;
  case SIM_STEPS:
    sys_cpu_step(sys, cpu, nstep);
    break;
  case SIM_UNTIL:
    sys_run_to(sys, to);
    break;
  default:
    fprintf(stderr, "no sim mode defined\n");
    break;
  }
  sys_cpu_next(sys, cpu, 1);
}

/* --- last line --- */
