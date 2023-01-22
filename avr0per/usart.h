/* USART - Universal Synchronous and Asynchronous Receiver and Transmitter 
 *
 * Copyright (C) 2020-2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_USART_H__
#define PER_USART_H__

#include <stdint.h>
#include "octbx.h"

typedef struct usart_reg {
  uint8_t RXDATAL;                      /* Receive Data Low Byte */
  uint8_t RXDATAH;                      /* Receive Data High Byte */
  uint8_t TXDATAL;                      /* Transmit Data Low Byte */
  uint8_t TXDATAH;                      /* Transmit Data High Byte */
  uint8_t STATUS;                       /* Status */
  uint8_t CTRLA;                        /* Control A */
  uint8_t CTRLB;                        /* Control B */
  uint8_t CTRLC;                        /* Control C */
  reg16_t_(BAUD);                       /* Baud Rate */
  uint8_t CTRLD;                        /* Control D */
  uint8_t DBGCTRL;                      /* Debug Control */
  uint8_t EVCTRL;                       /* Event Control */
  uint8_t TXPLCTRL;                /* IRCOM Transmitter Pulse Length Control */
  uint8_t RXPLCTRL;                   /* IRCOM Receiver Pulse Length Control */
} usart_reg_t;

typedef struct usart {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  usart_reg_t *reg;			/* pointer to registers */
  uint8_t rxc_vn;			/*  */
  uint8_t dre_vn;			/*  */
  uint8_t txc_vn;			/*  */
} usart_t;

void usart_init(usart_t *, mcu_t *mcu, uint16_t addr);
void usart_fini(usart_t *);
uint8_t usart_rd(usart_t *, int addr);
void usart_wr(usart_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
