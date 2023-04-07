/* log.c
 * 
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdio.h>			/* debug? */
#include "log.h"

static char ibuf[] = "\t\t\t\t\t\t\t\t\t\t\t\t\t\t";

/* Use to print different threads at differnt indentdations. 
 * Example, twi:
 *   master
 *           bus
 *                   slave
 *
 */
int iprint(int lev, char *fmt, ...) {
  va_list ap;
  
  ibuf[2*lev] = '\0';
  printf("%s", ibuf);
  va_start(ap, fmt);
  vprintf(fmt, ap);
  fflush(stdout);
  ibuf[2*lev] = '\t';
}

void log_tick(void *arg, tkosc_t *osc) {
#if 0
  printf("TICK @ %d == %ld.%09ld\n",
	 osc->tick, osc->time.tv_sec, osc->time.tv_nsec);
#endif
}

void log_intr(void *arg, int ivec, tkosc_t *osc) {
#if 0
  atmega328p_t *chip = arg;
  cpu_t *cpu = &chip->base.cpu;
  printf("INTR %d @ %d = %ld.%09ld\n",
	 ivec, osc->tick, osc->time.tv_sec, osc->time.tv_nsec);
  //printf("oct_wait=%d \n", cpu->data[0x148]);
#endif
}

  
/* --- last line --- */
