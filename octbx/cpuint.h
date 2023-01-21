/* CPUINT - Interrupt Controller 
 * 
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef BX_CPUINT_H__
#define BX_CPUINT_H__

#include <stdint.h>

struct mcu;

typedef struct cpuint_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t STATUS;                       /* Status */
  uint8_t LVL0PRI;                      /* Interrupt Level 0 Priority */
  uint8_t LVL1VEC;                      /* Interrupt Level 1 Priority Vector */
} cpuint_reg_t;

typedef struct cpuint {
  struct mcu *mcu;
  uint16_t base_addr;			/* base address */
  cpuint_reg_t *reg;			/* pointer to registers */
} cpuint_t;

void cpuint_init(cpuint_t *, struct mcu *mcu, uint16_t addr);
void cpuint_fini(cpuint_t *);

uint8_t cpuint_rd(cpuint_t *, int addr);
void cpuint_wr(cpuint_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
