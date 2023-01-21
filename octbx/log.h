/* log.h
 * 
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef LIBSIM_LOG_H__
#define LIBSIM_LOG_H__

#include <stdio.h>			/* debug? */
#include <stdarg.h>			/* debug? */
#include "sched.h"

void log_tick(void *arg, tkosc_t *osc);
void log_intr(void *arg, int ivec, tkosc_t *osc);

int iprint(int lev, char *fmt, ...);

#if 0

// subsystem data log
typedef struct ssdl {
  void *ss;				/* subsystem handle */
} ssdl_t;

// subsystem interface



// ===============================================

typedef struct cdl_ent {
  const char *name;
  int8_t code;
  uint16_t dim;
  uint16_t addr;
  const char *comm;
} cdl_ent_t;

void cdl_init(cpu_t *cpu);
cdl_ent_t *cdl_add_ent(cpu_t *cpu, const char *name, int8_t code, uint16_t dim,
		       uint16_t addr, const char *comm);
#define CDL_ENT_NDEF	100		/* def # cpu data log ent's */


#if 0
  uint16_t mlog;			/* num total avail entries */
  uint16_t nlog;			/* index of first open */
  cdl_ent_t *logs;
#endif

typedef enum {
  SDL_SRC_UNKOWN,
  SDL_SRC_CPU,
  SDL_SRC_SPICE,
} sdl_src_t;


typedef struct sdl_item {
  union {
    cdl_
  } slog;				/* sub logger */
} sdl_item_t;

typedef struct sdl_logger {
} sdl_logger_t;
#endif

#endif
/* --- last line --- */
