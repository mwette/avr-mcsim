/* mega4809.h
 * 
 * Copyright (C) 2020-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#ifndef MEGA4809_H_
#define MEGA4809_H_

#include <stdint.h>
#include "octbx.h"
#include "avr0per.h"

/* TODO:
 * 1) perif offsets 
 *    module
 *     instance : name "TCB1"
 *      register-group : name "TCB1" offset "0x0A90"
 * 2) signals (e.g., WO = PORTMUX.TCBROUTEA.TCB0) 
 */

/* 32 KB flash, 1 KB EEPROM, 2 KB ram */
/* 0x0000-0x0FFF I/O 
 * 0x1000-0x3FFF NVM I/O and data
 * 0x1400-0x14FF EEPROM
 * 0x2800-0x3FFF SRAM 0x1800
 * 0x4000-0xFFFF flash
 * so data space is 0x4000
 */
typedef struct mega4809 {
  mcu_t base;
  clkctrl_t clkctrl;
  adc_t adc0;
  port_t portA;
  port_t portB;
  port_t portC;
  port_t portD;
  port_t portE;
  port_t portF;
  rstctrl_t rstctrl;
  slpctrl_t slpctrl;
  syscfg_t syscfg;
  tca_t tca0;
  tcb_t tcb0;
  tcb_t tcb1;
  tcb_t tcb2;
  tcb_t tcb3;
  twi_t twi0;
  usart_t usart0;
  usart_t usart1;
  usart_t usart2;
  usart_t usart3;
  wdt_t wdt;
  uint8_t regs[32];			/* reg's not in data space */
  uint16_t prog[0x6000];		/* 48KB (24KW) flash */
  uint8_t data[0x4000];			/* I/O + 6KB SRAM */
  uint8_t onio[0x4000];			/* on I/O event map */
} mega4809_t;

mcu_t *make_mega4809(tmsch_t *);

void mega4809_init(void* _mcu, tmsch_t *tmsch);
void mega4809_fini(void* _mcu);
void mega4809_rt(void* _mcu, int flag);
uint8_t mega4809_rd(void *_mcu, int idx);
void mega4809_wr(void *_mcu, int idx, uint8_t val);
void mega4809_bs(void *_mcu, int idx, uint8_t val, uint8_t msk);
void mega4809_ni(void *_mcu, int ivec);
iopin_t *mega4809_pn(void *_mcu, char *name);
void mega4809_ia(void *_mcu, int ivec);
void mega4809_wdr(void *_mcu);

#endif
/* --- last line --- */

