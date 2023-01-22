/* TCB - 16-bit Timer Type B 
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

/* from proj/clkcal:
 * TCB1.EVCTRL = TCB_FILTER_bm|TCB_EDGE_bm|TCB_CAPTEI_bm; // enable input 
 * TCB1.EVCTRL = TCB_CAPTEI_bm; // enable input 
 * TCB1.CTRLB = TCB_CCMPEN_bm | TCB_CNTMODE_FRQ_gc; // capture count on event 
 * TCB1.INTCTRL = TCB_CAPT_bm;			   // and interrupt
 * TCB1.CTRLA = TCB_CLKSEL_CLKDIV1_gc | TCB_ENABLE_bm;
 */
#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "tcb.h"

void tcb_init(tcb_t *tcb, mcu_t *mcu, uint16_t addr) {
  tcb->mcu = mcu;
  tcb->base_addr = addr;
  tcb->reg = (tcb_reg_t *)&mcu->cpu.data[addr];
}

void tcb_fini(tcb_t *tcb) {
}  

#define TCB_CLKSEL_gm 0x6               /* Clock Select */
#define TCB_CLKSEL_bs 1                 /*   bit shift */
#define TCB_ENABLE_bm 0x1               /* Enable */
#define TCB_RUNSTDBY_bm 0x40            /* Run Standby */
#define TCB_SYNCUPD_bm 0x10             /* Synchronize Update */
#define TCB_ASYNC_bm 0x40               /* Asynchronous Enable */
#define TCB_CCMPEN_bm 0x10              /* Pin Output Enable */
#define TCB_CCMPINIT_bm 0x20            /* Pin Initial State */
#define TCB_CNTMODE_gm 0x7              /* Timer Mode */
#define TCB_CNTMODE_bs 0                /*   bit shift */
#define TCB_DBGRUN_bm 0x1               /* Debug Run */
#define TCB_CAPTEI_bm 0x1               /* Event Input Enable */
#define TCB_EDGE_bm 0x10                /* Event Edge */
#define TCB_FILTER_bm 0x40        /* Input Capture Noise Cancellation Filter */
#define TCB_CAPT_bm 0x1                 /* Capture or Timeout */
#define TCB_CAPT_bm 0x1                 /* Capture or Timeout */
#define TCB_RUN_bm 0x1                  /* Run */

typedef enum {
  TCB_CLKSEL_CLKDIV1_gc = (0x00 << 1),  /* CLK_PER (No Prescaling) */
  TCB_CLKSEL_CLKDIV2_gc = (0x01 << 1),  /* CLK_PER/2 (From Prescaler) */
  TCB_CLKSEL_CLKTCA_gc = (0x02 << 1),   /* Use Clock from TCA */
} TCB_CLKSEL_t;

typedef enum {
  TCB_CNTMODE_INT_gc = (0x00 << 0),     /* Periodic Interrupt */
  TCB_CNTMODE_TIMEOUT_gc = (0x01 << 0), /* Periodic Timeout */
  TCB_CNTMODE_CAPT_gc = (0x02 << 0),    /* Input Capture Event */
  TCB_CNTMODE_FRQ_gc = (0x03 << 0),   /* Input Capture Frequency measurement */
  TCB_CNTMODE_PW_gc = (0x04 << 0),  /* Input Capture Pulse-Width measurement */
  TCB_CNTMODE_FRQPW_gc = (0x05 << 0), /* Input Capture Frequency and Pulse-Width measurement */
  TCB_CNTMODE_SINGLE_gc = (0x06 << 0),  /* Single Shot */
  TCB_CNTMODE_PWM8_gc = (0x07 << 0),    /* 8-bit PWM */
} TCB_CNTMODE_t;

#define TCB_CTRLA_OFFSET 0x0		/* Control A */
#define TCB_CTRLB_OFFSET 0x1		/* Control Register B */
#define TCB_EVCTRL_OFFSET 0x4		/* Event Control */
#define TCB_INTCTRL_OFFSET 0x5		/* Interrupt Control */
#define TCB_INTFLAGS_OFFSET 0x6		/* Interrupt Flags */
#define TCB_STATUS_OFFSET 0x7		/* Status */
#define TCB_DBGCTRL_OFFSET 0x8		/* Debug Control */
#define TCB_TEMP_OFFSET 0x9		/* Temporary Value */
#define TCB_CNTL_OFFSET (0xA+0)		/* Count */
#define TCB_CNTH_OFFSET (0xA+1)		/* Count */
#define TCB_CCMPL_OFFSET (0xC+0)	/* Compare or Capture */
#define TCB_CCMPH_OFFSET (0xC+1)	/* Compare or Capture */

static void tcb_bot_act(void *arg, tkclk_t *clk);
static void tcb_cmp_act(void *arg, tkclk_t *clk);

static void tcb_bot_act(void *arg, tkclk_t *clk) {
  tcb_t *tcb = arg;
  tcb_reg_t *reg = tcb->reg;
  osctick_t tick;
  int fact;

  //printf("%d.%06d tcb_bot\n", 0, sch->time.nsec/1000);
  switch (reg->CTRLA & TCB_CLKSEL_gm) {
  case TCB_CLKSEL_CLKDIV1_gc: fact = 1; break;
  case TCB_CLKSEL_CLKDIV2_gc: fact = 2; break;
  case TCB_CLKSEL_CLKTCA_gc: abort(); break;
  default: abort(); break;
  }
  
  if (tcb->pin_out) iopin_wrD(tcb->pin_out, 1);
  tcb->bot_at = clk->osc->tick/clk->div;

  switch (reg->CTRLB & TCB_CNTMODE_gm) {

  case TCB_CNTMODE_INT_gc:
    tcb->cmp_act = tkclk_sched(clk, REG16U(reg->CCMP)*fact,
			       -1, tcb_cmp_act, tcb);
    tcb->cmp_act->name = "tcb_cmp_act";
    break;

  case TCB_CNTMODE_PWM8_gc:
    tcb->cmp_act = tkclk_sched(clk, reg->CCMPL*fact, -1, tcb_cmp_act, tcb);
    tcb->cmp_act->name = "tcb_cmp_act";
    tcb->bot_act = tkclk_sched(clk, reg->CCMPH*fact, -1, tcb_bot_act, tcb);
    tcb->bot_act->name = "tcb_bot_act";
    break;

  default:
    abort();
    break;
  }
  
}

static void tcb_cmp_act(void *arg, tkclk_t *clk) {
  tcb_t *tcb = arg;
  mcu_t *mcu = tcb->mcu;
  tcb_reg_t *reg = tcb->reg;
  osctick_t tick;
  int fact;

  switch (reg->CTRLA & TCB_CLKSEL_gm) {
  case TCB_CLKSEL_CLKDIV1_gc: fact = 1; break;
  case TCB_CLKSEL_CLKDIV2_gc: fact = 2; break;
  case TCB_CLKSEL_CLKTCA_gc: abort(); break;
  default: abort(); break;
  }

  switch (reg->CTRLB & TCB_CNTMODE_gm) {

  case TCB_CNTMODE_INT_gc: // FIXME read doc's
    tcb->cmp_act = tkclk_sched(clk, (REG16U(reg->CCMP) + 1)*fact,
			       -1, tcb_cmp_act, tcb);
    tcb->cmp_act->name = "tcb_cmp_act";
    if (reg->INTCTRL & TCB_ENABLE_bm) mcu_ir(mcu, tcb->int_vn);
    break;

  case TCB_CNTMODE_PWM8_gc:
    if (tcb->pin_out) iopin_wrD(tcb->pin_out, 0);
    tcb->cmp_act = 0;
    if (reg->INTCTRL & TCB_ENABLE_bm) mcu_ir(mcu, tcb->int_vn);
    break;

  default:
    abort();
    break;
  }
}

uint8_t tcb_rd(tcb_t *tcb, int addr) {
  tcb_reg_t *reg = tcb->reg;
  uint16_t offs = addr - tcb->base_addr;
  mcu_t *mcu = tcb->mcu;
  uint16_t tick, fact;
  tkclk_t *clk  = &mcu->clk_per;

  switch (offs) {
  case TCB_CTRLA_OFFSET:		/* Control A */
    return reg->CTRLA;
    break;
  case TCB_CTRLB_OFFSET:		/* Control Register B */
    return reg->CTRLB;
    break;
  case TCB_EVCTRL_OFFSET:		/* Event Control */
    break;
  case TCB_INTCTRL_OFFSET:		/* Interrupt Control */
    return reg->INTCTRL;
    break;
  case TCB_INTFLAGS_OFFSET:		/* Interrupt Flags */
    return reg->INTFLAGS;
    break;
  case TCB_STATUS_OFFSET:		/* Status */
    return reg->STATUS;
    break;
  case TCB_DBGCTRL_OFFSET:		/* Debug Control */
    return reg->DBGCTRL;
    break;
  case TCB_TEMP_OFFSET:			/* Temporary Value */
    return reg->TEMP;
    break;
  case TCB_CNTL_OFFSET:			/* Count */
    if (reg->INTFLAGS &= TCB_CAPT_bm) mcu_ir(mcu, -(tcb->int_vn));
    switch (reg->CTRLA & TCB_CLKSEL_gm) {
    case TCB_CLKSEL_CLKDIV1_gc: fact = 1; break;
    case TCB_CLKSEL_CLKDIV2_gc: fact = 2; break;
    case TCB_CLKSEL_CLKTCA_gc: abort(); break;
    }
    tick = (clk->osc->tick/clk->div - tcb->bot_at)/fact;
    reg->CNTL = tick%256;
    reg->TEMP = tick/256;
    return reg->CNTL;
    break;
  case TCB_CNTH_OFFSET:			/* Count */
    return reg->TEMP;
    break;
  case TCB_CCMPL_OFFSET:		/* Compare or Capture */
    switch (reg->CTRLB & TCB_CNTMODE_gm) {
    case TCB_CNTMODE_CAPT_gc:
    case TCB_CNTMODE_FRQ_gc:
    case TCB_CNTMODE_PW_gc:
    case TCB_CNTMODE_FRQPW_gc:
      reg->INTFLAGS &= ~TCB_CAPT_bm;
      mcu_ir(mcu, -(tcb->int_vn));
      break;
    default:
      break;
    }
    reg->TEMP = reg->CCMPH;
    return reg->CCMPL;
    break;
  case TCB_CCMPH_OFFSET:		/* Compare or Capture */
    return reg->TEMP;
    break;
  default:
    abort();
    break;
  }
  return 0;
}

void tcb_wr(tcb_t *tcb, int addr, uint8_t val) {
  mcu_t *mcu = tcb->mcu;
  tcb_reg_t *reg = tcb->reg;
  tkclk_t *clk = &mcu->clk_per;
  uint16_t offs = addr - tcb->base_addr;
  
  switch (offs) {

  case TCB_CTRLA_OFFSET:		/* Control A */
    if (val & TCB_ENABLE_bm) {
      int fact = 0;
      switch (val & TCB_CLKSEL_gm) {
      case TCB_CLKSEL_CLKDIV1_gc: fact = 1; break;
      case TCB_CLKSEL_CLKDIV2_gc: fact = 2; break;
      case TCB_CLKSEL_CLKTCA_gc: abort(); break; // todo
      default: abort(); break;
      }
      switch (reg->CTRLB & TCB_CNTMODE_gm) {
      case TCB_CNTMODE_INT_gc:
	tcb->cmp_act = tkclk_sched(clk, REG16U(reg->CCMP)*fact, -1,
				   tcb_cmp_act, tcb);
	tcb->cmp_act->name = "tcb_cmp_act";
	break;
      case TCB_CNTMODE_PWM8_gc:
	/* TODO: check if ccnt or what is used here */
	tcb->bot_act = tkclk_sched(clk, reg->CCMPH*fact, -1, tcb_bot_act, tcb);
	tcb->bot_act->name = "tcb_bot_act";
	break;
      default:
	abort();
	break;
      }
    } else {
      if (tcb->bot_act) tcb->bot_act = tkclk_cancel(clk, tcb->bot_act);
      if (tcb->cmp_act) tcb->cmp_act = tkclk_cancel(clk, tcb->cmp_act);
    }
    reg->CTRLA = val;
    break;
    
  case TCB_CTRLB_OFFSET:		/* Control Register B */
    reg->CTRLB = val;
    break;
  case TCB_EVCTRL_OFFSET:		/* Event Control */
    reg->EVCTRL = val;
    break;
  case TCB_INTCTRL_OFFSET:		/* Interrupt Control */
    reg->INTCTRL = val;
    break;
  case TCB_INTFLAGS_OFFSET:		/* Interrupt Flags */
    val &= 0x01;
    if (val & TCB_CAPT_bm) {
      reg->INTFLAGS &= ~TCB_CAPT_bm;
      mcu_ir(mcu, -(tcb->int_vn));
    }
    break;
  case TCB_STATUS_OFFSET:		/* Status */
    reg->STATUS = val;
    break;
  case TCB_DBGCTRL_OFFSET:		/* Debug Control */
    reg->DBGCTRL = val;
    break;
  case TCB_TEMP_OFFSET:			/* Temporary Value */
    reg->TEMP = val;
    break;
  case TCB_CNTL_OFFSET:			/* Count */
    reg->CNTL = reg->TEMP = val;
    break;
  case TCB_CNTH_OFFSET:			/* Count */
    reg->CNTH = val;
    reg->CNTL = reg->TEMP;
    break;
  case TCB_CCMPL_OFFSET:		/* Compare or Capture */
    reg->CCMPL = val;
    if ((reg->CTRLB & TCB_CNTMODE_gm) != TCB_CNTMODE_PWM8_gc)
      reg->TEMP = val;
    break;
  case TCB_CCMPH_OFFSET:		/* Compare or Capture */
    reg->CCMPH = val;
    if ((reg->CTRLB & TCB_CNTMODE_gm) != TCB_CNTMODE_PWM8_gc)
      reg->CCMPL = reg->TEMP;
    break;
  default:
    abort();
    break;
  }
}

  
/* --- last line --- */
