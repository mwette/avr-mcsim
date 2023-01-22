/* atmega328p.h
 * 
 * Copyright (C) 2019,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * Notes:
 * usart model does not support 9 bit data
 */

#ifndef _ATMEGA328P_H
#define _ATMEGA328P_H

#include <stdint.h>
#include "mmod/avr_cpu.h"

typedef struct usart {
  struct {
    uint16_t tx_shr_live:1;		/* tx shreg in use */
    uint16_t rx_shr_live:1;		/* rx shreg in use */
  };
  uint8_t tx_reg;			/* xmit (shift) register */
  uint8_t rx_reg;			/* recv (shift) register */
  int tx_fd;				/* transmit file desc (-1 if none) */
  int rx_fd;				/* receive file desc (-1 if none) */
} usart_t;

/* 32 KB flash, 1 KB EEPROM, 2 KB ram */
typedef struct atmega328p {
  chip_t base;
  tksch_t cal_clk;			/* calibrated 8 Mhz osc */
  tksch_t int_clk;			/* internal 125 kHz osc */
  tkevt_t *t0evt;
  tkevt_t *t1evt;
  tkevt_t *t2evt;
  uint16_t prog[0x4000];
  uint8_t data[0x900];			/* 0x800 SRAM, start 0x100 */
  uint8_t udr0_txb;			/* transmit buffer */
  tkevt_t *txevt;			/* usart xmit done */
  tkevt_t *rxevt;			/* usart recv check */
  usart_t usart0;
} atmega328p_t;


void atmega328p_init(void* _chip);
void atmega328p_fini(void* _chip);
uint8_t atmega328p_rd(void *_chip, int idx);
void atmega328p_wr(void *_chip, int idx, uint8_t val);
void atmega328p_bs(void *_chip, int idx, uint8_t msk);
void atmega328p_ni(void *_chip, int ivec);

#endif
/* --- last line --- */

