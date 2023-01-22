/* SYSCFG - System Configuration Registers 
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "syscfg.h"

void syscfg_init(syscfg_t *syscfg, mcu_t *mcu, uint16_t addr) {
  syscfg->mcu = mcu;
  syscfg->base_addr = addr;
  syscfg->reg = (syscfg_reg_t *)&mcu->cpu.data[addr];
}

void syscfg_fini(syscfg_t *syscfg) {
}  

#define SYSCFG_ENEXTBRK_bm 0x1          /* External break enable */
#define SYSCFG_OCDMR_bm 0x1             /* OCD Message Read */

#define REVID_OFFSET 0x01               /* Revision ID */
#define EXTBRK_OFFSET 0x02              /* External Break */
#define OCDM_OFFSET 0x18                /* OCD Message Register */
#define OCDMS_OFFSET 0x19               /* OCD Message Status */

uint8_t syscfg_rd(syscfg_t *syscfg, int addr) {
  syscfg_reg_t *reg = syscfg->reg;
  uint16_t offs = addr - syscfg->base_addr;

  switch (offs) {
  case REVID_OFFSET:                    /* Revision ID */
    return reg->REVID;
    break;
  case EXTBRK_OFFSET:                   /* External Break */
    return reg->EXTBRK;
    break;
  case OCDM_OFFSET:                     /* OCD Message Register */
    return reg->OCDM;
    break;
  case OCDMS_OFFSET:                    /* OCD Message Status */
    return reg->OCDMS;
    break;
  default:
    abort();
    break;
  }
}

void syscfg_wr(syscfg_t *syscfg, int addr, uint8_t val) {
  syscfg_reg_t *reg = syscfg->reg;
  uint16_t offs = addr - syscfg->base_addr;

  switch (offs) {
  case REVID_OFFSET:                    /* Revision ID */
    reg->REVID = val;
    break;
  case EXTBRK_OFFSET:                   /* External Break */
    reg->EXTBRK = val;
    break;
  case OCDM_OFFSET:                     /* OCD Message Register */
    reg->OCDM = val;
    break;
  case OCDMS_OFFSET:                    /* OCD Message Status */
    reg->OCDMS = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
