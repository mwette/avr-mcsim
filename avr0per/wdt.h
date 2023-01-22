/* WDT - Watch-Dog Timer 
 *
 * Copyright (C) 2022-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_WDT_H__
#define PER_WDT_H__

#include <stdint.h>
#include "octbx.h"

typedef struct wdt_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t STATUS;                       /* Status */
} wdt_reg_t;

typedef struct wdt {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  wdt_reg_t *reg;			/* pointer to registers */
  tkclk_t clk_wdt;
  uint16_t win_closed;			/* window closed */
  tkevt_t *winst_act;			/* window start event */
  tkevt_t *tmout_act;			/* timeout event */
  uint8_t reset_vn;			/* timeout interrupt */
} wdt_t;

void wdt_init(wdt_t *, mcu_t *mcu, uint16_t addr);
void wdt_fini(wdt_t *);

uint8_t wdt_rd(wdt_t *, int addr);
void wdt_wr(wdt_t *, int addr, uint8_t val);

void wdt_reset(wdt_t *);


#endif
/* --- last line --- */
