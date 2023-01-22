/* WDT - Watch-Dog Timer 
 *
 * Copyright (C) 2022-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <assert.h>
#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "wdt.h"

void wdt_init(wdt_t *wdt, mcu_t *mcu, uint16_t addr) {
  wdt->mcu = mcu;
  wdt->base_addr = addr;
  wdt->reg = (wdt_reg_t *)&mcu->cpu.data[addr];
  tkclk_init(&wdt->clk_wdt, &mcu->osculp32k, 32);
}

void wdt_fini(wdt_t *wdt) {
}  

#define WDT_PERIOD_gm 0xf               /* Period */
#define WDT_PERIOD_bs 0                 /*   bit shift */
#define WDT_WINDOW_gm 0xf0              /* Window */
#define WDT_WINDOW_bs 4                 /*   bit shift */
#define WDT_LOCK_bm 0x80                /* Lock enable */
#define WDT_SYNCBUSY_bm 0x1             /* Syncronization busy */

typedef enum {
  WDT_PERIOD_OFF_gc = (0x00 << 0),      /* Off */
  WDT_PERIOD_8CLK_gc = (0x01 << 0),     /* 8 cycles (8ms) */
  WDT_PERIOD_16CLK_gc = (0x02 << 0),    /* 16 cycles (16ms) */
  WDT_PERIOD_32CLK_gc = (0x03 << 0),    /* 32 cycles (32ms) */
  WDT_PERIOD_64CLK_gc = (0x04 << 0),    /* 64 cycles (64ms) */
  WDT_PERIOD_128CLK_gc = (0x05 << 0),   /* 128 cycles (0.128s) */
  WDT_PERIOD_256CLK_gc = (0x06 << 0),   /* 256 cycles (0.256s) */
  WDT_PERIOD_512CLK_gc = (0x07 << 0),   /* 512 cycles (0.512s) */
  WDT_PERIOD_1KCLK_gc = (0x08 << 0),    /* 1K cycles (1.0s) */
  WDT_PERIOD_2KCLK_gc = (0x09 << 0),    /* 2K cycles (2.0s) */
  WDT_PERIOD_4KCLK_gc = (0x0A << 0),    /* 4K cycles (4.1s) */
  WDT_PERIOD_8KCLK_gc = (0x0B << 0),    /* 8K cycles (8.2s) */
} WDT_PERIOD_t;

typedef enum {
  WDT_WINDOW_OFF_gc = (0x00 << 4),      /* Off */
  WDT_WINDOW_8CLK_gc = (0x01 << 4),     /* 8 cycles (8ms) */
  WDT_WINDOW_16CLK_gc = (0x02 << 4),    /* 16 cycles (16ms) */
  WDT_WINDOW_32CLK_gc = (0x03 << 4),    /* 32 cycles (32ms) */
  WDT_WINDOW_64CLK_gc = (0x04 << 4),    /* 64 cycles (64ms) */
  WDT_WINDOW_128CLK_gc = (0x05 << 4),   /* 128 cycles (0.128s) */
  WDT_WINDOW_256CLK_gc = (0x06 << 4),   /* 256 cycles (0.256s) */
  WDT_WINDOW_512CLK_gc = (0x07 << 4),   /* 512 cycles (0.512s) */
  WDT_WINDOW_1KCLK_gc = (0x08 << 4),    /* 1K cycles (1.0s) */
  WDT_WINDOW_2KCLK_gc = (0x09 << 4),    /* 2K cycles (2.0s) */
  WDT_WINDOW_4KCLK_gc = (0x0A << 4),    /* 4K cycles (4.1s) */
  WDT_WINDOW_8KCLK_gc = (0x0B << 4),    /* 8K cycles (8.2s) */
} WDT_WINDOW_t;

#define WDT_CTRLA_OFFSET 0x0            /* Control A */
#define WDT_STATUS_OFFSET 0x1           /* Status */

#define TICKS(V) (1 << ((V) + 2))

static void wdt_tmout_act(void *arg, tkclk_t *clk) {
  wdt_t *wdt = arg;
  mcu_t *mcu = wdt->mcu;
  cpu_t *cpu = &mcu->cpu;

  if (wdt->tmout_act) tkclk_cancel(&wdt->clk_wdt, wdt->tmout_act);
  wdt->tmout_act = 0;
  mcu_ir(mcu, wdt->reset_vn);
}

static void wdt_winst_act(void *arg, tkclk_t *clk) {
  wdt_t *wdt = arg;
  wdt_reg_t *reg = wdt->reg;
  mcu_t *mcu = wdt->mcu;
  cpu_t *cpu = &mcu->cpu;

  if (wdt->winst_act) tkclk_cancel(&wdt->clk_wdt, wdt->winst_act);
  wdt->win_closed = 0;
  wdt->tmout_act = tkclk_sched(&wdt->clk_wdt, TICKS((reg->CTRLA) & 0x0f),
			       2, wdt_tmout_act, wdt);
}


uint8_t wdt_rd(wdt_t *wdt, int addr) {
  wdt_reg_t *reg = wdt->reg;
  uint16_t offs = addr - wdt->base_addr;

  switch (offs) {
  case WDT_CTRLA_OFFSET:                /* Control A */
    return reg->CTRLA;
    break;
  case WDT_STATUS_OFFSET:               /* Status */
    return reg->STATUS;
    break;
  default:
    abort();
    break;
  }
}

void wdt_wr(wdt_t *wdt, int addr, uint8_t val) {
  mcu_t *mcu = wdt->mcu;
  cpu_t *cpu = &mcu->cpu;
  wdt_reg_t *reg = wdt->reg;
  uint16_t offs = addr - wdt->base_addr;

  switch (offs) {
  case WDT_CTRLA_OFFSET:		/* Control A */
    if (cpu->ccp_cnt > 0) {
      reg->CTRLA = val;
      if (val & 0xf0) {
	wdt->winst_act = tkclk_sched(&wdt->clk_wdt, TICKS((reg->CTRLA) >> 4),
				     2, wdt_winst_act, wdt);
	wdt->win_closed = 1;
      } else if (val & 0x0f) {
	wdt->tmout_act = tkclk_sched(&wdt->clk_wdt, TICKS(reg->CTRLA),
				     2, wdt_tmout_act, wdt);
      }
    }
    break;
  case WDT_STATUS_OFFSET:              /* Status */
    reg->STATUS = val & 0x80;
    break;
  default:
    abort();
    break;
  }
}

void wdt_reset(wdt_t *wdt) {
  wdt_reg_t *reg = wdt->reg;

  if (wdt->win_closed) {
    mcu_ir(wdt->mcu, wdt->reset_vn);
  } else {
    if (wdt->tmout_act)
      tkclk_cancel(&wdt->clk_wdt, wdt->tmout_act);
    if (reg->CTRLA & 0xf0) {
      assert(wdt->winst_act == 0);
      wdt->winst_act = tkclk_sched(&wdt->clk_wdt, TICKS((reg->CTRLA) >> 4),
				   2, wdt_winst_act, wdt);
      wdt->win_closed = 1;
    } else if (reg->CTRLA & 0x0f) {
      wdt->tmout_act = tkclk_sched(&wdt->clk_wdt, TICKS(reg->CTRLA),
				   2, wdt_tmout_act, wdt);
    }
  }
}

/* --- last line --- */
