/* RSTCTRL - Reset controller
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "rstctrl.h"

void rstctrl_init(rstctrl_t *rstctrl, mcu_t *mcu, uint16_t addr) {
  rstctrl->mcu = mcu;
  rstctrl->base_addr = addr;
  rstctrl->reg = (rstctrl_reg_t *)&mcu->cpu.data[addr];
}

void rstctrl_fini(rstctrl_t *rstctrl) {
}  

#define RSTCTRL_BORF_bm 0x2             /* Brown out detector Reset flag */
#define RSTCTRL_EXTRF_bm 0x4            /* External Reset flag */
#define RSTCTRL_PORF_bm 0x1             /* Power on Reset flag */
#define RSTCTRL_SWRF_bm 0x10            /* Software Reset flag */
#define RSTCTRL_UPDIRF_bm 0x20          /* UPDI Reset flag */
#define RSTCTRL_WDRF_bm 0x8             /* Watch dog Reset flag */
#define RSTCTRL_SWRE_bm 0x1             /* Software reset enable */

#define RSTFR_OFFSET 0x0                /* Reset Flags */
#define SWRR_OFFSET 0x1                 /* Software Reset */

uint8_t rstctrl_rd(rstctrl_t *rstctrl, int addr) {
  rstctrl_reg_t *reg = rstctrl->reg;
  uint16_t offs = addr - rstctrl->base_addr;

  switch (offs) {
  case RSTFR_OFFSET:                    /* Reset Flags */
    return reg->RSTFR;
    break;
  case SWRR_OFFSET:                     /* Software Reset */
    return reg->SWRR;
    break;
  default:
    abort();
    break;
  }
}

void rstctrl_wr(rstctrl_t *rstctrl, int addr, uint8_t val) {
  rstctrl_reg_t *reg = rstctrl->reg;
  uint16_t offs = addr - rstctrl->base_addr;

  switch (offs) {
  case RSTFR_OFFSET:                    /* Reset Flags */
    reg->RSTFR = val;
    break;
  case SWRR_OFFSET:                     /* Software Reset */
    reg->SWRR = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
