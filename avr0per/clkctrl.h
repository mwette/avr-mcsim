/* CLKCTRL - Clock controller 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_CLKCTRL_H__
#define PER_CLKCTRL_H__

#include <stdint.h>
#include "octbx.h"

typedef struct clkctrl_reg {
  uint8_t MCLKCTRLA;                    /* MCLK Control A */
  uint8_t MCLKCTRLB;                    /* MCLK Control B */
  uint8_t MCLKLOCK;                     /* MCLK Lock */
  uint8_t MCLKSTATUS;                   /* MCLK Status */
  uint8_t rez04;                        /* reserved */
  uint8_t rez05;                        /* reserved */
  uint8_t rez06;                        /* reserved */
  uint8_t rez07;                        /* reserved */
  uint8_t rez08;                        /* reserved */
  uint8_t rez09;                        /* reserved */
  uint8_t rez0A;                        /* reserved */
  uint8_t rez0B;                        /* reserved */
  uint8_t rez0C;                        /* reserved */
  uint8_t rez0D;                        /* reserved */
  uint8_t rez0E;                        /* reserved */
  uint8_t rez0F;                        /* reserved */
  uint8_t OSC20MCTRLA;                  /* OSC20M Control A */
  uint8_t OSC20MCALIBA;                 /* OSC20M Calibration A */
  uint8_t OSC20MCALIBB;                 /* OSC20M Calibration B */
  uint8_t rez13;                        /* reserved */
  uint8_t rez14;                        /* reserved */
  uint8_t rez15;                        /* reserved */
  uint8_t rez16;                        /* reserved */
  uint8_t rez17;                        /* reserved */
  uint8_t OSC32KCTRLA;                  /* OSC32K Control A */
  uint8_t rez19;                        /* reserved */
  uint8_t rez1A;                        /* reserved */
  uint8_t rez1B;                        /* reserved */
  uint8_t XOSC32KCTRLA;                 /* XOSC32K Control A */
} clkctrl_reg_t;

typedef struct clkctrl {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  clkctrl_reg_t *reg;			/* pointer to registers */
  tmevt_t *settled_act;			/* clock settled */
} clkctrl_t;

void clkctrl_init(clkctrl_t *, mcu_t *mcu, uint16_t addr);
void clkctrl_fini(clkctrl_t *);

uint8_t clkctrl_rd(clkctrl_t *, int addr);
void clkctrl_wr(clkctrl_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
