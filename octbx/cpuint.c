/* CPUINT - Interrupt Controller 
 *
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "cpuint.h"

void cpuint_init(cpuint_t *cpuint, mcu_t *mcu, uint16_t addr) {
  cpuint->mcu = mcu;
  cpuint->base_addr = addr;
  cpuint->reg = (cpuint_reg_t *)&mcu->cpu.data[addr];
}

void cpuint_fini(cpuint_t *cpuint) {
}  

#define CPUINT_CVT_bm 0x20              /* Compact Vector Table */
#define CPUINT_IVSEL_bm 0x40            /* Interrupt Vector Select */
#define CPUINT_LVL0RR_bm 0x1            /* Round-robin Scheduling Enable */
#define CPUINT_LVL0PRI_gm 0xff          /* Interrupt Level Priority */
#define CPUINT_LVL0PRI_bs 0             /*   bit shift */
#define CPUINT_LVL1VEC_gm 0xff        /* Interrupt Vector with High Priority */
#define CPUINT_LVL1VEC_bs 0             /*   bit shift */
#define CPUINT_LVL0EX_bm 0x1            /* Level 0 Interrupt Executing */
#define CPUINT_LVL1EX_bm 0x2            /* Level 1 Interrupt Executing */
#define CPUINT_NMIEX_bm 0x80            /* Non-maskable Interrupt Executing */

#define CPUINT_CTRLA_OFFSET 0x0         /* Control A */
#define CPUINT_STATUS_OFFSET 0x1        /* Status */
#define CPUINT_LVL0PRI_OFFSET 0x2       /* Interrupt Level 0 Priority */
#define CPUINT_LVL1VEC_OFFSET 0x3       /* Interrupt Level 1 Priority Vector */

uint8_t cpuint_rd(cpuint_t *cpuint, int addr) {
  cpuint_reg_t *reg = cpuint->reg;
  uint16_t offs = addr - cpuint->base_addr;
  mcu_t *mcu = cpuint->mcu;

  switch (offs) {
  case CPUINT_CTRLA_OFFSET:             /* Control A */
    return reg->CTRLA;
    break;
  case CPUINT_STATUS_OFFSET:            /* Status */
    return reg->STATUS;
    break;
  case CPUINT_LVL0PRI_OFFSET:           /* Interrupt Level 0 Priority */
    return reg->LVL0PRI;
    break;
  case CPUINT_LVL1VEC_OFFSET:           /* Interrupt Level 1 Priority Vector */
    return reg->LVL1VEC;
    break;
  default:
    abort();
    break;
  }
}

void cpuint_wr(cpuint_t *cpuint, int addr, uint8_t val) {
  cpuint_reg_t *reg = cpuint->reg;
  uint16_t offs = addr - cpuint->base_addr;
  mcu_t *mcu = cpuint->mcu;

  switch (offs) {
  case CPUINT_CTRLA_OFFSET:            /* Control A */
    reg->CTRLA = val;
    break;
  case CPUINT_STATUS_OFFSET:           /* Status */
    reg->STATUS = val;
    break;
  case CPUINT_LVL0PRI_OFFSET:          /* Interrupt Level 0 Priority */
    reg->LVL0PRI = val;
    break;
  case CPUINT_LVL1VEC_OFFSET:          /* Interrupt Level 1 Priority Vector */
    reg->LVL1VEC = val;
    break;
  default:
    abort();
    break;
  }
}


/* --- last line --- */
