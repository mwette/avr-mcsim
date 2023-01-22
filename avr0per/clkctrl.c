/* CLKCTRL - Clock controller 
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
#include "clkctrl.h"

void clkctrl_init(clkctrl_t *clkctrl, mcu_t *mcu, uint16_t addr) {
  clkctrl->mcu = mcu;
  clkctrl->base_addr = addr;
  clkctrl->reg = (clkctrl_reg_t *)&mcu->cpu.data[addr];
}

void clkctrl_fini(clkctrl_t *clkctrl) {
}  

#define CLKCTRL_CLKOUT_bm 0x80          /* System clock out */
#define CLKCTRL_CLKSEL_gm 0x3           /* clock select */
#define CLKCTRL_CLKSEL_bs 0             /*   bit shift */
#define CLKCTRL_PDIV_gm 0x1e            /* Prescaler division */
#define CLKCTRL_PDIV_bs 1               /*   bit shift */
#define CLKCTRL_PEN_bm 0x1              /* Prescaler enable */
#define CLKCTRL_LOCKEN_bm 0x1           /* lock ebable */
#define CLKCTRL_EXTS_bm 0x80            /* External Clock status */
#define CLKCTRL_OSC20MS_bm 0x10         /* 20MHz oscillator status */
#define CLKCTRL_OSC32KS_bm 0x20         /* 32KHz oscillator status */
#define CLKCTRL_SOSC_bm 0x1             /* System Oscillator changing */
#define CLKCTRL_XOSC32KS_bm 0x40     /* 32.768 kHz Crystal Oscillator status */
#define CLKCTRL_CAL20M_gm 0x7f          /* Calibration */
#define CLKCTRL_CAL20M_bs 0             /*   bit shift */
#define CLKCTRL_LOCK_bm 0x80            /* Lock */
#define CLKCTRL_TEMPCAL20M_gm 0xf      /* Oscillator temperature coefficient */
#define CLKCTRL_TEMPCAL20M_bs 0         /*   bit shift */
#define CLKCTRL_RUNSTDBY_bm 0x2         /* Run standby */
#define CLKCTRL_RUNSTDBY_bm 0x2         /* Run standby */
#define CLKCTRL_CSUT_gm 0x30            /* Crystal startup time */
#define CLKCTRL_CSUT_bs 4               /*   bit shift */
#define CLKCTRL_ENABLE_bm 0x1           /* Enable */
#define CLKCTRL_RUNSTDBY_bm 0x2         /* Run standby */
#define CLKCTRL_SEL_bm 0x4              /* Select */

typedef enum {
  CLKCTRL_CLKSEL_OSC20M_gc = (0x00 << 0), /* 20MHz oscillator */
  CLKCTRL_CLKSEL_OSCULP32K_gc = (0x01 << 0), /* 32KHz oscillator */
  CLKCTRL_CLKSEL_XOSC32K_gc = (0x02 << 0), /* 32.768kHz crystal oscillator */
  CLKCTRL_CLKSEL_EXTCLK_gc = (0x03 << 0), /* External clock */
} CLKCTRL_CLKSEL_t;

typedef enum {
  CLKCTRL_PDIV_2X_gc = (0x00 << 1),     /* 2X */
  CLKCTRL_PDIV_4X_gc = (0x01 << 1),     /* 4X */
  CLKCTRL_PDIV_8X_gc = (0x02 << 1),     /* 8X */
  CLKCTRL_PDIV_16X_gc = (0x03 << 1),    /* 16X */
  CLKCTRL_PDIV_32X_gc = (0x04 << 1),    /* 32X */
  CLKCTRL_PDIV_64X_gc = (0x05 << 1),    /* 64X */
  CLKCTRL_PDIV_6X_gc = (0x08 << 1),     /* 6X */
  CLKCTRL_PDIV_10X_gc = (0x09 << 1),    /* 10X */
  CLKCTRL_PDIV_12X_gc = (0x0A << 1),    /* 12X */
  CLKCTRL_PDIV_24X_gc = (0x0B << 1),    /* 24X */
  CLKCTRL_PDIV_48X_gc = (0x0C << 1),    /* 48X */
} CLKCTRL_PDIV_t;

typedef enum {
  CLKCTRL_CSUT_1K_gc = (0x00 << 4),     /* 1k cycles */
  CLKCTRL_CSUT_16K_gc = (0x01 << 4),    /* 16k cycles */
  CLKCTRL_CSUT_32K_gc = (0x02 << 4),    /* 32k cycles */
  CLKCTRL_CSUT_64K_gc = (0x03 << 4),    /* 64k cycles */
} CLKCTRL_CSUT_t;

#define MCLKCTRLA_OFFSET 0x00           /* MCLK Control A */
#define MCLKCTRLB_OFFSET 0x01           /* MCLK Control B */
#define MCLKLOCK_OFFSET 0x02            /* MCLK Lock */
#define MCLKSTATUS_OFFSET 0x03          /* MCLK Status */
#define OSC20MCTRLA_OFFSET 0x10         /* OSC20M Control A */
#define OSC20MCALIBA_OFFSET 0x11        /* OSC20M Calibration A */
#define OSC20MCALIBB_OFFSET 0x12        /* OSC20M Calibration B */
#define OSC32KCTRLA_OFFSET 0x18         /* OSC32K Control A */
#define XOSC32KCTRLA_OFFSET 0x1C        /* XOSC32K Control A */

static void clkctrl_settled_act(void *arg, tmsch_t *sch) {
  clkctrl_t *clkctrl = arg;
  clkctrl_reg_t *reg = clkctrl->reg;

  reg->MCLKSTATUS |= 0x70;
  reg->MCLKSTATUS &= 0xFE;
  clkctrl->settled_act = 0;
}

static void clkctrl_clk_changed(clkctrl_t *clkctrl) {
  mcu_t *mcu = clkctrl->mcu;
  tmsch_t *sch = mcu->cpu.clk_cpu.osc->tmsch;
  
  if (clkctrl->settled_act != 0) tmsch_cancel(sch, clkctrl->settled_act);
  clkctrl->settled_act = tmsch_sched(sch, tm_add_ns(sch->time, 12000), 16,
				     clkctrl_settled_act, clkctrl);
}

uint8_t clkctrl_rd(clkctrl_t *clkctrl, int addr) {
  clkctrl_reg_t *reg = clkctrl->reg;
  uint16_t offs = addr - clkctrl->base_addr;

  switch (offs) {
  case MCLKCTRLA_OFFSET:                /* MCLK Control A */
    return reg->MCLKCTRLA;
    break;
  case MCLKCTRLB_OFFSET:                /* MCLK Control B */
    return reg->MCLKCTRLB;
    break;
  case MCLKLOCK_OFFSET:                 /* MCLK Lock */
    return reg->MCLKLOCK;
    break;
  case MCLKSTATUS_OFFSET:               /* MCLK Status */
    return reg->MCLKSTATUS;
    break;
  case OSC20MCTRLA_OFFSET:              /* OSC20M Control A */
    return reg->OSC20MCTRLA;
    break;
  case OSC20MCALIBA_OFFSET:             /* OSC20M Calibration A */
    return reg->OSC20MCALIBA;
    break;
  case OSC20MCALIBB_OFFSET:             /* OSC20M Calibration B */
    return reg->OSC20MCALIBB;
    break;
  case OSC32KCTRLA_OFFSET:              /* OSC32K Control A */
    return reg->OSC32KCTRLA;
    break;
  case XOSC32KCTRLA_OFFSET:             /* XOSC32K Control A */
    return reg->XOSC32KCTRLA;
    break;
  default:
    abort();
    break;
  }
}

void clkctrl_wr(clkctrl_t *clkctrl, int addr, uint8_t val) {
  clkctrl_reg_t *reg = clkctrl->reg;
  mcu_t *mcu = clkctrl->mcu;
  cpu_t *cpu = &mcu->cpu;
  uint16_t offs = addr - clkctrl->base_addr;
  clktick_t tick;

  switch (offs) {
  case MCLKCTRLA_OFFSET:                /* MCLK Control A */
    if (CPU_CCP(cpu) | 0x01) {
      switch (val & CLKCTRL_CLKSEL_gm) {
      case CLKCTRL_CLKSEL_OSC20M_gc:
	cpu->clk_cpu.osc = &mcu->osc20m;
	break;
      case CLKCTRL_CLKSEL_OSCULP32K_gc:
	cpu->clk_cpu.osc = &mcu->osculp32k;
	break;
      case CLKCTRL_CLKSEL_XOSC32K_gc:
	cpu->clk_cpu.osc = &mcu->xosc32k;
	break;
      case CLKCTRL_CLKSEL_EXTCLK_gc:
	abort();
	break;
      default:
	abort();
	break;
      }
      mcu->clk_per.osc = cpu->clk_cpu.osc;
      reg->MCLKCTRLA = val;
      reg->MCLKSTATUS = 0x01;
      clkctrl_clk_changed(clkctrl);
    }
    break;
  case MCLKCTRLB_OFFSET:                /* MCLK Control B */
    if (CPU_CCP(cpu) | 0x01) {
      switch (val & CLKCTRL_PDIV_gm) {
      case CLKCTRL_PDIV_2X_gc: cpu->clk_cpu.div = 2; break;
      case CLKCTRL_PDIV_4X_gc: cpu->clk_cpu.div = 4; break;
      case CLKCTRL_PDIV_8X_gc: cpu->clk_cpu.div = 8; break;
      case CLKCTRL_PDIV_16X_gc: cpu->clk_cpu.div = 16; break;
      case CLKCTRL_PDIV_32X_gc: cpu->clk_cpu.div = 32; break;
      case CLKCTRL_PDIV_64X_gc: cpu->clk_cpu.div = 64; break;
      case CLKCTRL_PDIV_6X_gc: cpu->clk_cpu.div = 6; break;
      case CLKCTRL_PDIV_10X_gc: cpu->clk_cpu.div = 10; break;
      case CLKCTRL_PDIV_12X_gc: cpu->clk_cpu.div = 12; break;
      case CLKCTRL_PDIV_24X_gc: cpu->clk_cpu.div = 24; break;
      case CLKCTRL_PDIV_48X_gc: cpu->clk_cpu.div = 48; break;
      default: abort(); break;
      }
      mcu->clk_per.div = cpu->clk_cpu.div;
      reg->MCLKCTRLB = val;
      reg->MCLKSTATUS = 0x01;
      clkctrl_clk_changed(clkctrl);
    }
    break;
  case MCLKLOCK_OFFSET:                 /* MCLK Lock */
    if (CPU_CCP(cpu) | 0x01)
      reg->MCLKLOCK = val;
    break;
  case MCLKSTATUS_OFFSET:               /* MCLK Status */
    reg->MCLKSTATUS = val;
    break;
  case OSC20MCTRLA_OFFSET:              /* OSC20M Control A */
    if (CPU_CCP(cpu) | 0x01)
      reg->OSC20MCTRLA = val;
    break;
  case OSC20MCALIBA_OFFSET:             /* OSC20M Calibration A */
    if (CPU_CCP(cpu) | 0x01)
      reg->OSC20MCALIBA = val;
    break;
  case OSC20MCALIBB_OFFSET:             /* OSC20M Calibration B */
    if (CPU_CCP(cpu) | 0x01)
      reg->OSC20MCALIBB = val;
    break;
  case OSC32KCTRLA_OFFSET:              /* OSC32K Control A */
    if (CPU_CCP(cpu) | 0x01)
      reg->OSC32KCTRLA = val;
    break;
  case XOSC32KCTRLA_OFFSET:             /* XOSC32K Control A */
    if (CPU_CCP(cpu) | 0x01)
      reg->XOSC32KCTRLA = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
