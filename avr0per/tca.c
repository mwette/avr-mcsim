/* TCA - 16-bit Timer/Counter Type A
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "tca.h"

void tca_init(tca_t *tca, mcu_t *mcu, uint16_t addr) {
  tca->mcu = mcu;
  tca->base_addr = addr;
  tca->reg = (tca_reg_t *)&mcu->cpu.data[addr];
}

void tca_fini(tca_t *tca) {
}  

#define TCA_CLKSEL_gm 0xe               /* Clock Selection */
#define TCA_CLKSEL_bs 1                 /*   bit shift */
#define TCA_SINGLE_ENABLE_bm 0x1        /* Module Enable */
#define TCA_SINGLE_ALUPD_bm 0x8         /* Auto Lock Update */
#define TCA_SINGLE_CMP0EN_bm 0x10       /* Compare 0 Enable */
#define TCA_SINGLE_CMP1EN_bm 0x20       /* Compare 1 Enable */
#define TCA_SINGLE_CMP2EN_bm 0x40       /* Compare 2 Enable */
#define TCA_WGMODE_gm 0x7               /* Waveform generation mode */
#define TCA_WGMODE_bs 0                 /*   bit shift */
#define TCA_SINGLE_CMP0OV_bm 0x1        /* Compare 0 Waveform Output Value */
#define TCA_SINGLE_CMP1OV_bm 0x2        /* Compare 1 Waveform Output Value */
#define TCA_SINGLE_CMP2OV_bm 0x4        /* Compare 2 Waveform Output Value */
#define TCA_SINGLE_SPLITM_bm 0x1        /* Split Mode Enable */
#define TCA_CMD_gm 0xc                  /* Command */
#define TCA_CMD_bs 2                    /*   bit shift */
#define TCA_SINGLE_DIR_bm 0x1           /* Direction */
#define TCA_SINGLE_LUPD_bm 0x2          /* Lock Update */
#define TCA_CMD_gm 0xc                  /* Command */
#define TCA_CMD_bs 2                    /*   bit shift */
#define TCA_SINGLE_DIR_bm 0x1           /* Direction */
#define TCA_SINGLE_LUPD_bm 0x2          /* Lock Update */
#define TCA_SINGLE_CMP0BV_bm 0x2        /* Compare 0 Buffer Valid */
#define TCA_SINGLE_CMP1BV_bm 0x4        /* Compare 1 Buffer Valid */
#define TCA_SINGLE_CMP2BV_bm 0x8        /* Compare 2 Buffer Valid */
#define TCA_SINGLE_PERBV_bm 0x1         /* Period Buffer Valid */
#define TCA_SINGLE_CMP0BV_bm 0x2        /* Compare 0 Buffer Valid */
#define TCA_SINGLE_CMP1BV_bm 0x4        /* Compare 1 Buffer Valid */
#define TCA_SINGLE_CMP2BV_bm 0x8        /* Compare 2 Buffer Valid */
#define TCA_SINGLE_PERBV_bm 0x1         /* Period Buffer Valid */
#define TCA_SINGLE_DBGRUN_bm 0x1        /* Debug Run */
#define TCA_SINGLE_CNTEI_bm 0x1         /* Count on Event Input */
#define TCA_EVACT_gm 0x6                /* Event Action */
#define TCA_EVACT_bs 1                  /*   bit shift */
#define TCA_SINGLE_CMP0_bm 0x10         /* Compare 0 Interrupt */
#define TCA_SINGLE_CMP1_bm 0x20         /* Compare 1 Interrupt */
#define TCA_SINGLE_CMP2_bm 0x40         /* Compare 2 Interrupt */
#define TCA_SINGLE_OVF_bm 0x1           /* Overflow Interrupt */
#define TCA_SINGLE_CMP0_bm 0x10         /* Compare 0 Interrupt */
#define TCA_SINGLE_CMP1_bm 0x20         /* Compare 1 Interrupt */
#define TCA_SINGLE_CMP2_bm 0x40         /* Compare 2 Interrupt */
#define TCA_SINGLE_OVF_bm 0x1           /* Overflow Interrupt */

#define TCA_CLKSEL_gm 0xe               /* Clock Selection */
#define TCA_CLKSEL_bs 1                 /*   bit shift */
#define TCA_SPLIT_ENABLE_bm 0x1         /* Module Enable */
#define TCA_SPLIT_HCMP0EN_bm 0x10       /* High Compare 0 Enable */
#define TCA_SPLIT_HCMP1EN_bm 0x20       /* High Compare 1 Enable */
#define TCA_SPLIT_HCMP2EN_bm 0x40       /* High Compare 2 Enable */
#define TCA_SPLIT_LCMP0EN_bm 0x1        /* Low Compare 0 Enable */
#define TCA_SPLIT_LCMP1EN_bm 0x2        /* Low Compare 1 Enable */
#define TCA_SPLIT_LCMP2EN_bm 0x4        /* Low Compare 2 Enable */
#define TCA_SPLIT_HCMP0OV_bm 0x10       /* High Compare 0 Output Value */
#define TCA_SPLIT_HCMP1OV_bm 0x20       /* High Compare 1 Output Value */
#define TCA_SPLIT_HCMP2OV_bm 0x40       /* High Compare 2 Output Value */
#define TCA_SPLIT_LCMP0OV_bm 0x1        /* Low Compare 0 Output Value */
#define TCA_SPLIT_LCMP1OV_bm 0x2        /* Low Compare 1 Output Value */
#define TCA_SPLIT_LCMP2OV_bm 0x4        /* Low Compare 2 Output Value */
#define TCA_SPLIT_SPLITM_bm 0x1         /* Split Mode Enable */
#define TCA_CMD_gm 0xc                  /* Command */
#define TCA_CMD_bs 2                    /*   bit shift */
#define TCA_CMD_gm 0xc                  /* Command */
#define TCA_CMD_bs 2                    /*   bit shift */
#define TCA_SPLIT_DBGRUN_bm 0x1         /* Debug Run */
#define TCA_SPLIT_HUNF_bm 0x2           /* High Underflow Interrupt Enable */
#define TCA_SPLIT_LCMP0_bm 0x10         /* Low Compare 0 Interrupt Enable */
#define TCA_SPLIT_LCMP1_bm 0x20         /* Low Compare 1 Interrupt Enable */
#define TCA_SPLIT_LCMP2_bm 0x40         /* Low Compare 2 Interrupt Enable */
#define TCA_SPLIT_LUNF_bm 0x1           /* Low Underflow Interrupt Enable */
#define TCA_SPLIT_HUNF_bm 0x2           /* High Underflow Interrupt Flag */
#define TCA_SPLIT_LCMP0_bm 0x10         /* Low Compare 2 Interrupt Flag */
#define TCA_SPLIT_LCMP1_bm 0x20         /* Low Compare 1 Interrupt Flag */
#define TCA_SPLIT_LCMP2_bm 0x40         /* Low Compare 0 Interrupt Flag */
#define TCA_SPLIT_LUNF_bm 0x1           /* Low Underflow Interrupt Flag */

typedef enum {
  TCA_SINGLE_CLKSEL_DIV1_gc = (0x00 << 1), /* System Clock */
  TCA_SINGLE_CLKSEL_DIV2_gc = (0x01 << 1), /* System Clock / 2 */
  TCA_SINGLE_CLKSEL_DIV4_gc = (0x02 << 1), /* System Clock / 4 */
  TCA_SINGLE_CLKSEL_DIV8_gc = (0x03 << 1), /* System Clock / 8 */
  TCA_SINGLE_CLKSEL_DIV16_gc = (0x04 << 1), /* System Clock / 16 */
  TCA_SINGLE_CLKSEL_DIV64_gc = (0x05 << 1), /* System Clock / 64 */
  TCA_SINGLE_CLKSEL_DIV256_gc = (0x06 << 1), /* System Clock / 256 */
  TCA_SINGLE_CLKSEL_DIV1024_gc = (0x07 << 1), /* System Clock / 1024 */
} TCA_SINGLE_CLKSEL_t;

typedef enum {
  TCA_SINGLE_WGMODE_NORMAL_gc = (0x00 << 0), /* Normal Mode */
  TCA_SINGLE_WGMODE_FRQ_gc = (0x01 << 0), /* Frequency Generation Mode */
  TCA_SINGLE_WGMODE_SINGLESLOPE_gc = (0x03 << 0), /* Single Slope PWM */
  TCA_SINGLE_WGMODE_DSTOP_gc = (0x05 << 0), /* Dual Slope PWM, overflow on TOP */
  TCA_SINGLE_WGMODE_DSBOTH_gc = (0x06 << 0), /* Dual Slope PWM, overflow on TOP and BOTTOM */
  TCA_SINGLE_WGMODE_DSBOTTOM_gc = (0x07 << 0), /* Dual Slope PWM, overflow on BOTTOM */
} TCA_SINGLE_WGMODE_t;

typedef enum {
  TCA_SINGLE_CMD_NONE_gc = (0x00 << 2), /* No Command */
  TCA_SINGLE_CMD_UPDATE_gc = (0x01 << 2), /* Force Update */
  TCA_SINGLE_CMD_RESTART_gc = (0x02 << 2), /* Force Restart */
  TCA_SINGLE_CMD_RESET_gc = (0x03 << 2), /* Force Hard Reset */
} TCA_SINGLE_CMD_t;

typedef enum {
  TCA_SINGLE_DIR_UP_gc = (0x0 << 0),    /* Count up */
  TCA_SINGLE_DIR_DOWN_gc = (0x1 << 0),  /* Count down */
} TCA_SINGLE_DIR_t;

typedef enum {
  TCA_SINGLE_EVACT_POSEDGE_gc = (0x00 << 1), /* Count on positive edge event */
  TCA_SINGLE_EVACT_ANYEDGE_gc = (0x01 << 1), /* Count on any edge event */
  TCA_SINGLE_EVACT_HIGHLVL_gc = (0x02 << 1), /* Count on prescaled clock while event line is 1. */
  TCA_SINGLE_EVACT_UPDOWN_gc = (0x03 << 1), /* Count on prescaled clock. Event controls count direction. Up-count when event line is 0, down-count when event line is 1. */
} TCA_SINGLE_EVACT_t;

typedef enum {
  TCA_SPLIT_CLKSEL_DIV1_gc = (0x00 << 1), /* System Clock */
  TCA_SPLIT_CLKSEL_DIV2_gc = (0x01 << 1), /* System Clock / 2 */
  TCA_SPLIT_CLKSEL_DIV4_gc = (0x02 << 1), /* System Clock / 4 */
  TCA_SPLIT_CLKSEL_DIV8_gc = (0x03 << 1), /* System Clock / 8 */
  TCA_SPLIT_CLKSEL_DIV16_gc = (0x04 << 1), /* System Clock / 16 */
  TCA_SPLIT_CLKSEL_DIV64_gc = (0x05 << 1), /* System Clock / 64 */
  TCA_SPLIT_CLKSEL_DIV256_gc = (0x06 << 1), /* System Clock / 256 */
  TCA_SPLIT_CLKSEL_DIV1024_gc = (0x07 << 1), /* System Clock / 1024 */
} TCA_SPLIT_CLKSEL_t;

typedef enum {
  TCA_SPLIT_CMD_NONE_gc = (0x00 << 2),  /* No Command */
  TCA_SPLIT_CMD_UPDATE_gc = (0x01 << 2), /* Force Update */
  TCA_SPLIT_CMD_RESTART_gc = (0x02 << 2), /* Force Restart */
  TCA_SPLIT_CMD_RESET_gc = (0x03 << 2), /* Force Hard Reset */
} TCA_SPLIT_CMD_t;

#define TCA_SINGLE_CTRLA_OFFSET 0x00    /* Control A */
#define TCA_SINGLE_CTRLB_OFFSET 0x01    /* Control B */
#define TCA_SINGLE_CTRLC_OFFSET 0x02    /* Control C */
#define TCA_SINGLE_CTRLD_OFFSET 0x03    /* Control D */
#define TCA_SINGLE_CTRLECLR_OFFSET 0x04 /* Control E Clear */
#define TCA_SINGLE_CTRLESET_OFFSET 0x05 /* Control E Set */
#define TCA_SINGLE_CTRLFCLR_OFFSET 0x06 /* Control F Clear */
#define TCA_SINGLE_CTRLFSET_OFFSET 0x07 /* Control F Set */
#define TCA_SINGLE_EVCTRL_OFFSET 0x09   /* Event Control */
#define TCA_SINGLE_INTCTRL_OFFSET 0x0A  /* Interrupt Control */
#define TCA_SINGLE_INTFLAGS_OFFSET 0x0B /* Interrupt Flags */
#define TCA_SINGLE_DBGCTRL_OFFSET 0x0E  /* Degbug Control */
#define TCA_SINGLE_TEMP_OFFSET 0x0F     /* Temporary data for 16-bit Access */
#define TCA_SINGLE_CNTL_OFFSET (0x20+0) /* Count */
#define TCA_SINGLE_CNTH_OFFSET (0x20+1) /* Count */
#define TCA_SINGLE_PERL_OFFSET (0x26+0) /* Period */
#define TCA_SINGLE_PERH_OFFSET (0x26+1) /* Period */
#define TCA_SINGLE_CMP0L_OFFSET (0x28+0) /* Compare 0 */
#define TCA_SINGLE_CMP0H_OFFSET (0x28+1) /* Compare 0 */
#define TCA_SINGLE_CMP1L_OFFSET (0x2A+0) /* Compare 1 */
#define TCA_SINGLE_CMP1H_OFFSET (0x2A+1) /* Compare 1 */
#define TCA_SINGLE_CMP2L_OFFSET (0x2C+0) /* Compare 2 */
#define TCA_SINGLE_CMP2H_OFFSET (0x2C+1) /* Compare 2 */
#define TCA_SINGLE_PERBUFL_OFFSET (0x36+0) /* Period Buffer */
#define TCA_SINGLE_PERBUFH_OFFSET (0x36+1) /* Period Buffer */
#define TCA_SINGLE_CMP0BUFL_OFFSET (0x38+0) /* Compare 0 Buffer */
#define TCA_SINGLE_CMP0BUFH_OFFSET (0x38+1) /* Compare 0 Buffer */
#define TCA_SINGLE_CMP1BUFL_OFFSET (0x3A+0) /* Compare 1 Buffer */
#define TCA_SINGLE_CMP1BUFH_OFFSET (0x3A+1) /* Compare 1 Buffer */
#define TCA_SINGLE_CMP2BUFL_OFFSET (0x3C+0) /* Compare 2 Buffer */
#define TCA_SINGLE_CMP2BUFH_OFFSET (0x3C+1) /* Compare 2 Buffer */
#define TCA_SPLIT_CTRLA_OFFSET 0x00     /* Control A */
#define TCA_SPLIT_CTRLB_OFFSET 0x01     /* Control B */
#define TCA_SPLIT_CTRLC_OFFSET 0x02     /* Control C */
#define TCA_SPLIT_CTRLD_OFFSET 0x03     /* Control D */
#define TCA_SPLIT_CTRLECLR_OFFSET 0x04  /* Control E Clear */
#define TCA_SPLIT_CTRLESET_OFFSET 0x05  /* Control E Set */
#define TCA_SPLIT_INTCTRL_OFFSET 0x0A   /* Interrupt Control */
#define TCA_SPLIT_INTFLAGS_OFFSET 0x0B  /* Interrupt Flags */
#define TCA_SPLIT_DBGCTRL_OFFSET 0x0E   /* Degbug Control */
#define TCA_SPLIT_LCNT_OFFSET 0x20      /* Low Count */
#define TCA_SPLIT_HCNT_OFFSET 0x21      /* High Count */
#define TCA_SPLIT_LPER_OFFSET 0x26      /* Low Period */
#define TCA_SPLIT_HPER_OFFSET 0x27      /* High Period */
#define TCA_SPLIT_LCMP0_OFFSET 0x28     /* Low Compare */
#define TCA_SPLIT_HCMP0_OFFSET 0x29     /* High Compare */
#define TCA_SPLIT_LCMP1_OFFSET 0x2A     /* Low Compare */
#define TCA_SPLIT_HCMP1_OFFSET 0x2B     /* High Compare */
#define TCA_SPLIT_LCMP2_OFFSET 0x2C     /* Low Compare */
#define TCA_SPLIT_HCMP2_OFFSET 0x2D     /* High Compare */

static int tca_fact(tca_reg_t *reg);

static void tca_bot_act(void *arg, tkclk_t *clk);
static void tca_top_act(void *arg, tkclk_t *clk);
static void tca_cmpN_act(void *arg, tkclk_t *clk);
static void tca_cmp0_act(void *arg, tkclk_t *clk);
static void tca_cmp1_act(void *arg, tkclk_t *clk);
static void tca_cmp2_act(void *arg, tkclk_t *clk);

#if 0
static void tca_both_act(void *arg, tkclk_t *clk);
static void tca_hcmpN_act(void *arg, tkclk_t *clk);
static void tca_hcmp0_act(void *arg, tkclk_t *clk);
static void tca_hcmp1_act(void *arg, tkclk_t *clk);
static void tca_hcmp2_act(void *arg, tkclk_t *clk);

static void tca_botl_act(void *arg, tkclk_t *clk);
static void tca_lcmpN_act(void *arg, tkclk_t *clk);
static void tca_lcmp0_act(void *arg, tkclk_t *clk);
static void tca_lcmp1_act(void *arg, tkclk_t *clk);
static void tca_lcmp2_act(void *arg, tkclk_t *clk);
#endif

static int tca_fact(tca_reg_t *reg) {
  int fact;
  
  if ((reg->SINGLE.CTRLD & TCA_SINGLE_SPLITM_bm) == 0) {
    switch (reg->SINGLE.CTRLA & TCA_CLKSEL_gm) {
    case TCA_SINGLE_CLKSEL_DIV1_gc: fact = 1; break;
    case TCA_SINGLE_CLKSEL_DIV2_gc: fact = 2; break;
    case TCA_SINGLE_CLKSEL_DIV4_gc: fact = 4; break;
    case TCA_SINGLE_CLKSEL_DIV8_gc: fact = 8; break;
    case TCA_SINGLE_CLKSEL_DIV16_gc: fact = 16; break;
    case TCA_SINGLE_CLKSEL_DIV64_gc: fact = 64; break;
    case TCA_SINGLE_CLKSEL_DIV256_gc: fact = 256; break;
    case TCA_SINGLE_CLKSEL_DIV1024_gc: fact = 1024; break;
    default: abort(); break;
    }
  } else {
    switch (reg->SPLIT.CTRLA & TCA_CLKSEL_gm) {
    case TCA_SPLIT_CLKSEL_DIV1_gc: fact = 1; break;
    case TCA_SPLIT_CLKSEL_DIV2_gc: fact = 2; break;
    case TCA_SPLIT_CLKSEL_DIV4_gc: fact = 4; break;
    case TCA_SPLIT_CLKSEL_DIV8_gc: fact = 8; break;
    case TCA_SPLIT_CLKSEL_DIV16_gc: fact = 16; break;
    case TCA_SPLIT_CLKSEL_DIV64_gc: fact = 64; break;
    case TCA_SPLIT_CLKSEL_DIV256_gc: fact = 256; break;
    case TCA_SPLIT_CLKSEL_DIV1024_gc: fact = 1024; break;
    default: abort(); break;
    }
  }

  return fact;
}

static void tca_bot_act(void *arg, tkclk_t *clk) {
  tca_t *tca = arg;
  mcu_t *mcu = tca->mcu;
  tca_reg_t *reg = tca->reg;
  int delta, fact, dir_up;

  fact = tca_fact(reg);
  dir_up = !(reg->SINGLE.CTRLE & TCA_SINGLE_DIR_bm);
  delta = reg->SINGLE.PER;
  
  tca->top_act = tkclk_sched(clk, delta*fact, +1, tca_top_act, tca);
  tca->bot_act = 0;
}

/* only occurs for SINGLE */
static void tca_top_act(void *arg, tkclk_t *clk) {
  tca_t *tca = arg;
  mcu_t *mcu = tca->mcu;
  tca_reg_t *reg = tca->reg;
  int fact, dir_up, delta;

  fact = tca_fact(reg);
  dir_up = !(reg->SINGLE.CTRLE & TCA_SINGLE_DIR_bm);
  delta = reg->SINGLE.PER - reg->SINGLE.CNT;
  
  if (tca->bot_act) tca->bot_act = tkclk_cancel(clk, tca->bot_act);
  tca->bot_act = tkclk_sched(clk, fact, +1, tca_bot_act, tca);

  if (dir_up) {
    if (reg->SINGLE.INTCTRL & TCA_SINGLE_OVF_bm) {
      mcu_ir(mcu, tca->ovf_vn);
      reg->SINGLE.INTFLAGS |= TCA_SINGLE_OVF_bm;
    }
  } else { /* TODO: counting down */
    abort();
  }
}

static void cmpN_act(void *arg, tkclk_t *clk, int n) {
  tca_t *tca = arg;
  mcu_t *mcu = tca->mcu;
  tca_reg_t *reg = tca->reg;
  //tkclk_t *clk = &mcu->clk_per;
  //int fact, dir_up, delta;

  switch (n) {
  case 0:
    if (reg->SINGLE.INTCTRL & TCA_SINGLE_CMP0_bm) {
      mcu_ir(mcu, tca->cmp0_vn);
      reg->SINGLE.INTFLAGS |= TCA_SINGLE_CMP0_bm;
    }
    break;
  case 1:
    if (reg->SINGLE.INTCTRL & TCA_SINGLE_CMP1_bm) {
      mcu_ir(mcu, tca->cmp1_vn);
      reg->SINGLE.INTFLAGS |= TCA_SINGLE_CMP1_bm;
    }
    break;
  case 2:
    if (reg->SINGLE.INTCTRL & TCA_SINGLE_CMP2_bm) {
      mcu_ir(mcu, tca->cmp2_vn);
      reg->SINGLE.INTFLAGS |= TCA_SINGLE_CMP2_bm;
    }
    break;
  default:
    abort();
    break;
  }
}

static void tca_cmp0_act(void *arg, tkclk_t *clk) { cmpN_act(arg, clk, 0); }
static void tca_cmp1_act(void *arg, tkclk_t *clk) { cmpN_act(arg, clk, 1); }
static void tca_cmp2_act(void *arg, tkclk_t *clk) { cmpN_act(arg, clk, 2); }

#define CHK_CMP0 0x10
#define CHK_CNT1 0x20
#define CHK_CNT2 0x40
#define CHK_BOT  0x02
#define CHK_TOP  0x01

/* flag = CHK_CNT1 | CHK_CNT2 | CHK_CNT3 | CHK_OVF */
static void check_activities(tca_t *tca, int flag) {
  mcu_t *mcu = tca->mcu;
  tca_reg_t *reg = tca->reg;
  tkclk_t *clk = &mcu->clk_per;
  int fact, dir_up, delta;
	
  fact = tca_fact(reg);
  
  if ((reg->SINGLE.CTRLD & TCA_SINGLE_SPLITM_bm) == 0) {
    /* normal (single) mode */
    if ((reg->SINGLE.CTRLA & TCA_SINGLE_ENABLE_bm) == 0) return;
    if (reg->SINGLE.PER) {
      dir_up = !(reg->SINGLE.CTRLE & TCA_SINGLE_DIR_bm);

      if (dir_up) {
	delta = reg->SINGLE.PER - reg->SINGLE.CNT;
	if (delta < 0) delta += 65536;
	if (tca->top_act) tca->top_act = tkclk_cancel(clk, tca->top_act);
	tca->top_act = tkclk_sched(clk, delta*fact, +1, tca_top_act, tca);
	if (tca->bot_act) tca->bot_act = tkclk_cancel(clk, tca->bot_act);
      } else {
	/* todo */
	abort();
      }
      switch (reg->SINGLE.CTRLB & TCA_WGMODE_gm) {
      case TCA_SINGLE_WGMODE_NORMAL_gc:
	delta = reg->SINGLE.PER;
	if (reg->SINGLE.CTRLB & TCA_SINGLE_CMP0EN_bm) {
	  tca->cmp0_act = tkclk_sched(clk, delta*fact, +1, tca_cmp0_act, tca);
	}
	if (reg->SINGLE.CTRLB & TCA_SINGLE_CMP1EN_bm) {
	  abort();
	}
	if (reg->SINGLE.CTRLB & TCA_SINGLE_CMP2EN_bm) {
	  abort();
	}
	break;

      case TCA_SINGLE_WGMODE_FRQ_gc:
      case TCA_SINGLE_WGMODE_SINGLESLOPE_gc:
      case TCA_SINGLE_WGMODE_DSTOP_gc:
      case TCA_SINGLE_WGMODE_DSBOTH_gc:
      case TCA_SINGLE_WGMODE_DSBOTTOM_gc:
	abort();
	break;

      case 99:
	tca->bot_act = tkclk_sched(clk, delta, -1, tca_bot_act, tca);
	tca->top_act = tkclk_sched(clk, delta, -1, tca_top_act, tca);
	tca->cmp0_act = tkclk_sched(clk, delta, -1, tca_cmp0_act, tca);
	tca->cmp1_act = tkclk_sched(clk, delta, -1, tca_cmp1_act, tca);
	tca->cmp2_act = tkclk_sched(clk, delta, -1, tca_cmp2_act, tca);
	break;
      default:
	abort();
	break;
      }
    }
  } else {
    /* split mode */
    
    if ((reg->SPLIT.CTRLA & TCA_SPLIT_ENABLE_bm) == 0) return;

    if (reg->SPLIT.LPER) {
      abort();
    }

    if (reg->SPLIT.HPER) {
      abort();
    }

  }
}

uint8_t tca_rd(tca_t *tca, int addr) {
  tca_reg_t *reg = tca->reg;
  uint16_t offs = addr - tca->base_addr;
  mcu_t *mcu = tca->mcu;
  osctick_t tick, fact;

  if ((reg->SINGLE.CTRLD & TCA_SINGLE_SPLITM_bm) == 0) {

    switch (offs) {
    case TCA_SINGLE_CTRLA_OFFSET:         /* Control A */
      return reg->SINGLE.CTRLA;
      break;
    case TCA_SINGLE_CTRLB_OFFSET:         /* Control B */
      return reg->SINGLE.CTRLB;
      break;
    case TCA_SINGLE_CTRLC_OFFSET:         /* Control C */
      return reg->SINGLE.CTRLC;
      break;
    case TCA_SINGLE_CTRLD_OFFSET:         /* Control D */
      return reg->SINGLE.CTRLD;
      break;
    case TCA_SINGLE_CTRLECLR_OFFSET:      /* Control E Clear */
      return reg->SINGLE.CTRLE;
      break;
    case TCA_SINGLE_CTRLESET_OFFSET:      /* Control E Set */
      return reg->SINGLE.CTRLE;
      break;
    case TCA_SINGLE_CTRLFCLR_OFFSET:      /* Control F Clear */
      return reg->SINGLE.CTRLF;
      break;
    case TCA_SINGLE_CTRLFSET_OFFSET:      /* Control F Set */
      return reg->SINGLE.CTRLF;
      break;
    case TCA_SINGLE_EVCTRL_OFFSET:        /* Event Control */
      return reg->SINGLE.EVCTRL;
      break;
    case TCA_SINGLE_INTCTRL_OFFSET:       /* Interrupt Control */
      return reg->SINGLE.INTCTRL;
      break;
    case TCA_SINGLE_INTFLAGS_OFFSET:      /* Interrupt Flags */
      return reg->SINGLE.INTFLAGS;
      break;
    case TCA_SINGLE_DBGCTRL_OFFSET:       /* Degbug Control */
      return reg->SINGLE.DBGCTRL;
      break;
    case TCA_SINGLE_TEMP_OFFSET:          /* Temporary data for 16-bit Access */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CNTL_OFFSET:          /* Count */
      reg->SINGLE.TEMP =  reg->SINGLE.CNTH;
      return reg->SINGLE.CNTL;
      break;
    case TCA_SINGLE_CNTH_OFFSET:          /* Count */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_PERL_OFFSET:          /* Period */
      reg->SINGLE.TEMP =  reg->SINGLE.PERH;
      return reg->SINGLE.PERL;
      break;
    case TCA_SINGLE_PERH_OFFSET:          /* Period */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP0L_OFFSET:         /* Compare 0 */
      reg->SINGLE.TEMP =  reg->SINGLE.CMP0H;
      return reg->SINGLE.CMP0L;
      break;
    case TCA_SINGLE_CMP0H_OFFSET:         /* Compare 0 */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP1L_OFFSET:         /* Compare 1 */
      reg->SINGLE.TEMP =  reg->SINGLE.CMP1H;
      return reg->SINGLE.CMP1L;
      break;
    case TCA_SINGLE_CMP1H_OFFSET:         /* Compare 1 */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP2L_OFFSET:         /* Compare 2 */
      reg->SINGLE.TEMP =  reg->SINGLE.CMP2H;
      return reg->SINGLE.CMP2L;
      break;
    case TCA_SINGLE_CMP2H_OFFSET:         /* Compare 2 */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_PERBUFL_OFFSET:       /* Period Buffer */
      reg->SINGLE.TEMP =  reg->SINGLE.PERBUFH;
      return reg->SINGLE.PERBUFL;
      break;
    case TCA_SINGLE_PERBUFH_OFFSET:       /* Period Buffer */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP0BUFL_OFFSET:      /* Compare 0 Buffer */
      reg->SINGLE.TEMP =  reg->SINGLE.CMP0BUFH;
      return reg->SINGLE.CMP0BUFL;
      break;
    case TCA_SINGLE_CMP0BUFH_OFFSET:      /* Compare 0 Buffer */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP1BUFL_OFFSET:      /* Compare 1 Buffer */
      reg->SINGLE.TEMP =  reg->SINGLE.CMP1BUFH;
      return reg->SINGLE.CMP1BUFL;
      break;
    case TCA_SINGLE_CMP1BUFH_OFFSET:      /* Compare 1 Buffer */
      return reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP2BUFL_OFFSET:      /* Compare 2 Buffer */
      reg->SINGLE.TEMP =  reg->SINGLE.CMP2BUFH;
      return reg->SINGLE.CMP2BUFL;
      break;
    case TCA_SINGLE_CMP2BUFH_OFFSET:      /* Compare 2 Buffer */
      return reg->SINGLE.TEMP;
      break;
    default:
      abort();
      break;
    }
    
  } else {
    
    switch (offs) {
    case TCA_SPLIT_CTRLA_OFFSET:          /* Control A */
      return reg->SPLIT.CTRLA;
      break;
    case TCA_SPLIT_CTRLB_OFFSET:          /* Control B */
      return reg->SPLIT.CTRLB;
      break;
    case TCA_SPLIT_CTRLC_OFFSET:          /* Control C */
      return reg->SPLIT.CTRLC;
      break;
    case TCA_SPLIT_CTRLD_OFFSET:          /* Control D */
      return reg->SPLIT.CTRLD;
      break;
    case TCA_SPLIT_CTRLECLR_OFFSET:       /* Control E Clear */
      return reg->SPLIT.CTRLE;
      break;
    case TCA_SPLIT_CTRLESET_OFFSET:       /* Control E Set */
      return reg->SPLIT.CTRLE;
      break;
    case TCA_SPLIT_INTCTRL_OFFSET:        /* Interrupt Control */
      return reg->SPLIT.INTCTRL;
      break;
    case TCA_SPLIT_INTFLAGS_OFFSET:       /* Interrupt Flags */
      return reg->SPLIT.INTFLAGS;
      break;
    case TCA_SPLIT_DBGCTRL_OFFSET:        /* Degbug Control */
      return reg->SPLIT.DBGCTRL;
      break;
    case TCA_SPLIT_LCNT_OFFSET:           /* Low Count */
      return reg->SPLIT.LCNT;
      break;
    case TCA_SPLIT_HCNT_OFFSET:           /* High Count */
      return reg->SPLIT.HCNT;
      break;
    case TCA_SPLIT_LPER_OFFSET:           /* Low Period */
      return reg->SPLIT.LPER;
      break;
    case TCA_SPLIT_HPER_OFFSET:           /* High Period */
      return reg->SPLIT.HPER;
      break;
    case TCA_SPLIT_LCMP0_OFFSET:          /* Low Compare */
      return reg->SPLIT.LCMP0;
      break;
    case TCA_SPLIT_HCMP0_OFFSET:          /* High Compare */
      return reg->SPLIT.HCMP0;
      break;
    case TCA_SPLIT_LCMP1_OFFSET:          /* Low Compare */
      return reg->SPLIT.LCMP1;
      break;
    case TCA_SPLIT_HCMP1_OFFSET:          /* High Compare */
      return reg->SPLIT.HCMP1;
      break;
    case TCA_SPLIT_LCMP2_OFFSET:          /* Low Compare */
      return reg->SPLIT.LCMP2;
      break;
    case TCA_SPLIT_HCMP2_OFFSET:          /* High Compare */
      return reg->SPLIT.HCMP2;
      break;
    default:
      abort();
      break;
    }
  }
}

void tca_wr(tca_t *tca, int addr, uint8_t val) {
  mcu_t *mcu = tca->mcu;
  tca_reg_t *reg = tca->reg;
  uint16_t offs = addr - tca->base_addr;
  tkclk_t *clk = &mcu->clk_per;
  uint16_t delta;
  
  int fact = tca_fact(reg);
	
  if ((reg->SINGLE.CTRLD & TCA_SINGLE_SPLITM_bm) == 0) {
    
    switch (offs) {
    case TCA_SINGLE_CTRLA_OFFSET:         /* Control A */
      reg->SINGLE.CTRLA = val;
      check_activities(tca, 0);
      break;
    case TCA_SINGLE_CTRLB_OFFSET:         /* Control B */
      reg->SINGLE.CTRLB = val;
      break;
    case TCA_SINGLE_CTRLC_OFFSET:         /* Control C */
      reg->SINGLE.CTRLC = val;
      break;
    case TCA_SINGLE_CTRLD_OFFSET:         /* Control D */
      reg->SINGLE.CTRLD = val;
      break;
    case TCA_SINGLE_CTRLECLR_OFFSET:      /* Control E Clear */
      reg->SINGLE.CTRLE &= ~val;
      break;
    case TCA_SINGLE_CTRLESET_OFFSET:      /* Control E Set */
      reg->SINGLE.CTRLE |= val;
      break;
    case TCA_SINGLE_CTRLFCLR_OFFSET:      /* Control F Clear */
      reg->SINGLE.CTRLF &= ~val;
      break;
    case TCA_SINGLE_CTRLFSET_OFFSET:      /* Control F Set */
      reg->SINGLE.CTRLF |= val;
      break;
    case TCA_SINGLE_EVCTRL_OFFSET:        /* Event Control */
      reg->SINGLE.EVCTRL = val;
      break;
    case TCA_SINGLE_INTCTRL_OFFSET:       /* Interrupt Control */
      reg->SINGLE.INTCTRL = val;
      check_activities(tca, 0);
      break;
    case TCA_SINGLE_INTFLAGS_OFFSET:      /* Interrupt Flags */
      if (val & TCA_SINGLE_OVF_bm) {
	reg->SINGLE.INTFLAGS &= ~TCA_SINGLE_OVF_bm;
	mcu_ir(mcu, -(tca->ovf_vn));
      }
      if (val & TCA_SINGLE_CMP0_bm) {
	reg->SINGLE.INTFLAGS &= ~TCA_SINGLE_CMP0_bm;
	mcu_ir(mcu, -(tca->cmp0_vn));
      }
      if (val & TCA_SINGLE_CMP1_bm) {
	reg->SINGLE.INTFLAGS &= ~TCA_SINGLE_CMP1_bm;
	mcu_ir(mcu, -(tca->cmp1_vn));
      }
      if (val & TCA_SINGLE_CMP2_bm) {
	reg->SINGLE.INTFLAGS &= ~TCA_SINGLE_CMP2_bm;
	mcu_ir(mcu, -(tca->cmp2_vn));
      }
      break;
    case TCA_SINGLE_DBGCTRL_OFFSET:       /* Degbug Control */
      reg->SINGLE.DBGCTRL = val;
      break;
    case TCA_SINGLE_TEMP_OFFSET:          /* Temporary data for 16-bit Access */
      reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CNTL_OFFSET:          /* Count */
      reg->SINGLE.CNTL = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CNTH_OFFSET:          /* Count */
      reg->SINGLE.CNTH = val;
      reg->SINGLE.CNTL = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_PERL_OFFSET:          /* Period */
      reg->SINGLE.PERL = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_PERH_OFFSET:          /* Period */
      reg->SINGLE.PERH = val;
      reg->SINGLE.PERL = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP0L_OFFSET:         /* Compare 0 */
      reg->SINGLE.CMP0L = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CMP0H_OFFSET:         /* Compare 0 */
      reg->SINGLE.CMP0H = val;
      reg->SINGLE.CMP0L = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP1L_OFFSET:         /* Compare 1 */
      reg->SINGLE.CMP1L = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CMP1H_OFFSET:         /* Compare 1 */
      reg->SINGLE.CMP1H = val;
      reg->SINGLE.CMP1L = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP2L_OFFSET:         /* Compare 2 */
      reg->SINGLE.CMP2L = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CMP2H_OFFSET:         /* Compare 2 */
      reg->SINGLE.CMP2H = val;
      reg->SINGLE.CMP2L = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_PERBUFL_OFFSET:       /* Period Buffer */
      reg->SINGLE.PERBUFL = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_PERBUFH_OFFSET:       /* Period Buffer */
      reg->SINGLE.PERBUFH = val;
      reg->SINGLE.PERBUFL = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP0BUFL_OFFSET:      /* Compare 0 Buffer */
      reg->SINGLE.CMP0BUFL = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CMP0BUFH_OFFSET:      /* Compare 0 Buffer */
      reg->SINGLE.CMP0BUFH = val;
      reg->SINGLE.CMP0BUFL = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP1BUFL_OFFSET:      /* Compare 1 Buffer */
      reg->SINGLE.CMP1BUFL = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CMP1BUFH_OFFSET:      /* Compare 1 Buffer */
      reg->SINGLE.CMP1BUFH = val;
      reg->SINGLE.CMP1BUFL = reg->SINGLE.TEMP;
      break;
    case TCA_SINGLE_CMP2BUFL_OFFSET:      /* Compare 2 Buffer */
      reg->SINGLE.CMP2BUFL = reg->SINGLE.TEMP = val;
      break;
    case TCA_SINGLE_CMP2BUFH_OFFSET:      /* Compare 2 Buffer */
      reg->SINGLE.CMP2BUFH = val;
      reg->SINGLE.CMP2BUFL = reg->SINGLE.TEMP;
      break;
    default:
      abort();
      break;
    }

  } else {

    switch (offs) {
    case TCA_SPLIT_CTRLA_OFFSET:          /* Control A */
      reg->SPLIT.CTRLA = val;
      break;
    case TCA_SPLIT_CTRLB_OFFSET:          /* Control B */
      reg->SPLIT.CTRLB = val;
      break;
    case TCA_SPLIT_CTRLC_OFFSET:          /* Control C */
      reg->SPLIT.CTRLC = val;
      break;
    case TCA_SPLIT_CTRLD_OFFSET:          /* Control D */
      reg->SPLIT.CTRLD = val;
      break;
    case TCA_SPLIT_CTRLECLR_OFFSET:       /* Control E Clear */
      reg->SPLIT.CTRLE &= ~val;
      break;
    case TCA_SPLIT_CTRLESET_OFFSET:       /* Control E Set */
      reg->SPLIT.CTRLE |= val;
      break;
    case TCA_SPLIT_INTCTRL_OFFSET:        /* Interrupt Control */
      reg->SPLIT.INTCTRL = val;
      break;
    case TCA_SPLIT_INTFLAGS_OFFSET:       /* Interrupt Flags */
      reg->SPLIT.INTFLAGS = val;
      break;
    case TCA_SPLIT_DBGCTRL_OFFSET:        /* Degbug Control */
      reg->SPLIT.DBGCTRL = val;
      break;
    case TCA_SPLIT_LCNT_OFFSET:           /* Low Count */
      reg->SPLIT.LCNT = val;
      break;
    case TCA_SPLIT_HCNT_OFFSET:           /* High Count */
      reg->SPLIT.HCNT = val;
      break;
    case TCA_SPLIT_LPER_OFFSET:           /* Low Period */
      reg->SPLIT.LPER = val;
      break;
    case TCA_SPLIT_HPER_OFFSET:           /* High Period */
      reg->SPLIT.HPER = val;
      break;
    case TCA_SPLIT_LCMP0_OFFSET:          /* Low Compare */
      reg->SPLIT.LCMP0 = val;
      break;
    case TCA_SPLIT_HCMP0_OFFSET:          /* High Compare */
      reg->SPLIT.HCMP0 = val;
      break;
    case TCA_SPLIT_LCMP1_OFFSET:          /* Low Compare */
      reg->SPLIT.LCMP1 = val;
      break;
    case TCA_SPLIT_HCMP1_OFFSET:          /* High Compare */
      reg->SPLIT.HCMP1 = val;
      break;
    case TCA_SPLIT_LCMP2_OFFSET:          /* Low Compare */
      reg->SPLIT.LCMP2 = val;
      break;
    case TCA_SPLIT_HCMP2_OFFSET:          /* High Compare */
      reg->SPLIT.HCMP2 = val;
      break;
    default:
      abort();
      break;
    }
  }
}

/* --- last line --- */
