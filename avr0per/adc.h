/* ADC - Analog to Digital Converter 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_ADC_H__
#define PER_ADC_H__

#include <stdint.h>
#include "octbx.h"

typedef struct adc_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t CTRLB;                        /* Control B */
  uint8_t CTRLC;                        /* Control C */
  uint8_t CTRLD;                        /* Control D */
  uint8_t CTRLE;                        /* Control E */
  uint8_t SAMPCTRL;                     /* Sample Control */
  uint8_t MUXPOS;                       /* Positive mux input */
  uint8_t rez07;                        /* reserved */
  uint8_t COMMAND;                      /* Command */
  uint8_t EVCTRL;                       /* Event Control */
  uint8_t INTCTRL;                      /* Interrupt Control */
  uint8_t INTFLAGS;                     /* Interrupt Flags */
  uint8_t DBGCTRL;                      /* Debug Control */
  uint8_t TEMP;                         /* Temporary Data */
  uint8_t rez0E;                        /* reserved */
  uint8_t rez0F;                        /* reserved */
  reg16_t_(RES);                        /* ADC Accumulator Result */
  reg16_t_(WINLT);                      /* Window comparator low threshold */
  reg16_t_(WINHT);                      /* Window comparator high threshold */
  uint8_t CALIB;                        /* Calibration */
} adc_reg_t;


typedef struct adc {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  adc_reg_t *reg;			/* pointer to registers */
  tkevt_t *conv_act;			/* conversion done event */
  double vref;				/* TODO: how to route */
  iopin_t *pin[16];			/* mux input */
  uint8_t resrdy_vn;			/* res ready int vect num  */
  uint8_t wcomp_vn;			/* ? int vect num  */
} adc_t;

void adc_init(adc_t *, mcu_t *mcu, uint16_t addr);
void adc_fini(adc_t *);

uint8_t adc_rd(adc_t *, int addr);
void adc_wr(adc_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
