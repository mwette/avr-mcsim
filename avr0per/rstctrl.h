/* RSTCTRL - Reset controller 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_RSTCTRL_H__
#define PER_RSTCTRL_H__

#include <stdint.h>
#include "octbx.h"

typedef struct rstctrl_reg {
  uint8_t RSTFR;                        /* Reset Flags */
  uint8_t SWRR;                         /* Software Reset */
} rstctrl_reg_t;

typedef struct rstctrl {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  rstctrl_reg_t *reg;			/* pointer to registers */
} rstctrl_t;

void rstctrl_init(rstctrl_t *, mcu_t *mcu, uint16_t addr);
void rstctrl_fini(rstctrl_t *);
uint8_t rstctrl_rd(rstctrl_t *, int addr);
void rstctrl_wr(rstctrl_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
