/* SLPCTRL - Sleep Controller 
 *
 * Copyright (C) 2020-2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "slpctrl.h"

void slpctrl_init(slpctrl_t *slpctrl, mcu_t *mcu, uint16_t addr) {
  slpctrl->mcu = mcu;
  slpctrl->base_addr = addr;
  slpctrl->reg = (slpctrl_reg_t *)&mcu->cpu.data[addr];
}

void slpctrl_fini(slpctrl_t *slpctrl) {
}  

#define SLPCTRL_SEN_bm 0x1              /* Sleep enable */
#define SLPCTRL_SMODE_gm 0x6            /* Sleep mode */
#define SLPCTRL_SMODE_bs 1              /*   bit shift */

typedef enum {
  SLPCTRL_SMODE_IDLE_gc = (0x00 << 1),  /* Idle mode */
  SLPCTRL_SMODE_STDBY_gc = (0x01 << 1), /* Standby Mode */
  SLPCTRL_SMODE_PDOWN_gc = (0x02 << 1), /* Power-down Mode */
} SLPCTRL_SMODE_t;

#define CTRLA_OFFSET 0x0                /* Control */

uint8_t slpctrl_rd(slpctrl_t *slpctrl, int addr) {
  slpctrl_reg_t *reg = slpctrl->reg;
  uint16_t offs = addr - slpctrl->base_addr;

  switch (offs) {
  case CTRLA_OFFSET:                    /* Control */
    return reg->CTRLA;
    break;
  default:
    abort();
    break;
  }
}

void slpctrl_wr(slpctrl_t *slpctrl, int addr, uint8_t val) {
  slpctrl_reg_t *reg = slpctrl->reg;
  uint16_t offs = addr - slpctrl->base_addr;

  switch (offs) {
  case CTRLA_OFFSET:                    /* Control */
    reg->CTRLA = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
