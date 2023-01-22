/* SLPCTRL - Sleep Controller 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_SLPCTRL_H__
#define PER_SLPCTRL_H__

#include <stdint.h>
#include "octbx.h"

typedef struct slpctrl_reg {
  uint8_t CTRLA;                        /* Control */
} slpctrl_reg_t;

typedef struct slpctrl {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  slpctrl_reg_t *reg;			/* pointer to registers */
} slpctrl_t;

void slpctrl_init(slpctrl_t *, mcu_t *mcu, uint16_t addr);
void slpctrl_fini(slpctrl_t *);
uint8_t slpctrl_rd(slpctrl_t *, int addr);
void slpctrl_wr(slpctrl_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
