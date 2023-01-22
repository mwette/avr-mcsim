/* TWI - Two-Wire Interface 
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_TWI_H__
#define PER_TWI_H__

#include <stdint.h>
#include "octbx.h"

typedef struct twi_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t DUALCTRL;                     /* Dual Control */
  uint8_t DBGCTRL;                      /* Debug Control Register */
  uint8_t MCTRLA;                       /* Master Control A */
  uint8_t MCTRLB;                       /* Master Control B */
  uint8_t MSTATUS;                      /* Master Status */
  uint8_t MBAUD;                        /* Master Baurd Rate Control */
  uint8_t MADDR;                        /* Master Address */
  uint8_t MDATA;                        /* Master Data */
  uint8_t SCTRLA;                       /* Slave Control A */
  uint8_t SCTRLB;                       /* Slave Control B */
  uint8_t SSTATUS;                      /* Slave Status */
  uint8_t SADDR;                        /* Slave Address */
  uint8_t SDATA;                        /* Slave Data */
  uint8_t SADDRMASK;                    /* Slave Address Mask */
} twi_reg_t;

/* twi implementation */
typedef struct twi_impl {
  iopin_t *sda_pin;			/* SCL pin */
  iopin_t *scl_pin;			/* SCL pin */
  tkevt_t *evt;				/* event */
  uint8_t xst;				/* transaction state */
  uint8_t cnt;				/* count */
  uint8_t ost;				/* observer state */
  uint16_t t_hi;			/* t_high (clk ticks) */
  uint16_t t_lo;			/* t_high (clk ticks) */
  uint16_t t_su;			/* t_setup (clk ticks) unused */
} twi_impl_t;

typedef struct twi {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  twi_reg_t *reg;			/* pointer to registers */
  uint8_t twis_vn;			/* TWIS ISR vect num */
  uint8_t twim_vn;			/* TWIM ISR vect num */
  twi_impl_t m, s;			/* master, slave twi mach */
} twi_t;

void twi_init(twi_t *, mcu_t *mcu, uint16_t addr);
void twi_fini(twi_t *);

uint8_t twi_rd(twi_t *, int addr);
void twi_wr(twi_t *, int addr, uint8_t val);


#endif
/* --- last line --- */
