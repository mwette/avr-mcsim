/* TCB - 16-bit Timer Type B 
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_TCB_H__
#define PER_TCB_H__

#include <stdint.h>
#include "octbx.h"

typedef struct tcb_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t CTRLB;                        /* Control Register B */
  uint8_t rez02;                        /* reserved */
  uint8_t rez03;                        /* reserved */
  uint8_t EVCTRL;                       /* Event Control */
  uint8_t INTCTRL;                      /* Interrupt Control */
  uint8_t INTFLAGS;                     /* Interrupt Flags */
  uint8_t STATUS;                       /* Status */
  uint8_t DBGCTRL;                      /* Debug Control */
  uint8_t TEMP;                         /* Temporary Value */
  reg16_t_(CNT);                        /* Count */
  reg16_t_(CCMP);                       /* Compare or Capture */
} tcb_reg_t;


typedef struct tcb {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  tcb_reg_t *reg;			/* pointer to registers */
  uint64_t bot_at;			/* count at last bottom */
  tkevt_t *bot_act;			/* bottom action */
  tkevt_t *cmp_act;			/* capture/compare action */
  iopin_t *pin_out;			/* todo */
  uint8_t int_vn;			/* ISR vect num */
} tcb_t;

void tcb_init(tcb_t *, mcu_t *mcu, uint16_t addr);
void tcb_fini(tcb_t *);

uint8_t tcb_rd(tcb_t *, int addr);
void tcb_wr(tcb_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
