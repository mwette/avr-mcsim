/* TCA - 16-bit Timer/Counter Type A
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_TCA_H__
#define PER_TCA_H__

#include <stdint.h>
#include "octbx.h"

//#define CTRLESET CTRLE
//#define CTRLECLR CTRLE

typedef struct tca_single_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t CTRLB;                        /* Control B */
  uint8_t CTRLC;                        /* Control C */
  uint8_t CTRLD;                        /* Control D */
  uint8_t CTRLE;			/* Control E (was CLR/SET) */
  uint8_t CTRLE_X;			/* unused by sim */
  uint8_t CTRLF;			/* Control F (was CLR/SET) */
  uint8_t CTRLF_X;			/* unused by sim */
  uint8_t rez08;                        /* reserved */
  uint8_t EVCTRL;                       /* Event Control */
  uint8_t INTCTRL;                      /* Interrupt Control */
  uint8_t INTFLAGS;                     /* Interrupt Flags */
  uint8_t rez0C;                        /* reserved */
  uint8_t rez0D;                        /* reserved */
  uint8_t DBGCTRL;                      /* Degbug Control */
  uint8_t TEMP;                         /* Temporary data for 16-bit Access */
  uint8_t rez10;                        /* reserved */
  uint8_t rez11;                        /* reserved */
  uint8_t rez12;                        /* reserved */
  uint8_t rez13;                        /* reserved */
  uint8_t rez14;                        /* reserved */
  uint8_t rez15;                        /* reserved */
  uint8_t rez16;                        /* reserved */
  uint8_t rez17;                        /* reserved */
  uint8_t rez18;                        /* reserved */
  uint8_t rez19;                        /* reserved */
  uint8_t rez1A;                        /* reserved */
  uint8_t rez1B;                        /* reserved */
  uint8_t rez1C;                        /* reserved */
  uint8_t rez1D;                        /* reserved */
  uint8_t rez1E;                        /* reserved */
  uint8_t rez1F;                        /* reserved */
  reg16_t_(CNT);                        /* Count */
  uint8_t rez22;                        /* reserved */
  uint8_t rez23;                        /* reserved */
  uint8_t rez24;                        /* reserved */
  uint8_t rez25;                        /* reserved */
  reg16_t_(PER);                        /* Period */
  reg16_t_(CMP0);                       /* Compare 0 */
  reg16_t_(CMP1);                       /* Compare 1 */
  reg16_t_(CMP2);                       /* Compare 2 */
  uint8_t rez2E;                        /* reserved */
  uint8_t rez2F;                        /* reserved */
  uint8_t rez30;                        /* reserved */
  uint8_t rez31;                        /* reserved */
  uint8_t rez32;                        /* reserved */
  uint8_t rez33;                        /* reserved */
  uint8_t rez34;                        /* reserved */
  uint8_t rez35;                        /* reserved */
  reg16_t_(PERBUF);                     /* Period Buffer */
  reg16_t_(CMP0BUF);                    /* Compare 0 Buffer */
  reg16_t_(CMP1BUF);                    /* Compare 1 Buffer */
  reg16_t_(CMP2BUF);                    /* Compare 2 Buffer */
} tca_single_reg_t;

typedef struct tca_split_reg {
  uint8_t CTRLA;                        /* Control A */
  uint8_t CTRLB;                        /* Control B */
  uint8_t CTRLC;                        /* Control C */
  uint8_t CTRLD;                        /* Control D */
  uint8_t CTRLE;			/* Control E (was CLR/SET) */
  uint8_t CTRLE_X;			/* unused by sim */
  uint8_t rez06;                        /* reserved */
  uint8_t rez07;                        /* reserved */
  uint8_t rez08;                        /* reserved */
  uint8_t rez09;                        /* reserved */
  uint8_t INTCTRL;                      /* Interrupt Control */
  uint8_t INTFLAGS;                     /* Interrupt Flags */
  uint8_t rez0C;                        /* reserved */
  uint8_t rez0D;                        /* reserved */
  uint8_t DBGCTRL;                      /* Degbug Control */
  uint8_t rez0F;                        /* reserved */
  uint8_t rez10;                        /* reserved */
  uint8_t rez11;                        /* reserved */
  uint8_t rez12;                        /* reserved */
  uint8_t rez13;                        /* reserved */
  uint8_t rez14;                        /* reserved */
  uint8_t rez15;                        /* reserved */
  uint8_t rez16;                        /* reserved */
  uint8_t rez17;                        /* reserved */
  uint8_t rez18;                        /* reserved */
  uint8_t rez19;                        /* reserved */
  uint8_t rez1A;                        /* reserved */
  uint8_t rez1B;                        /* reserved */
  uint8_t rez1C;                        /* reserved */
  uint8_t rez1D;                        /* reserved */
  uint8_t rez1E;                        /* reserved */
  uint8_t rez1F;                        /* reserved */
  uint8_t LCNT;                         /* Low Count */
  uint8_t HCNT;                         /* High Count */
  uint8_t rez22;                        /* reserved */
  uint8_t rez23;                        /* reserved */
  uint8_t rez24;                        /* reserved */
  uint8_t rez25;                        /* reserved */
  uint8_t LPER;                         /* Low Period */
  uint8_t HPER;                         /* High Period */
  uint8_t LCMP0;                        /* Low Compare */
  uint8_t HCMP0;                        /* High Compare */
  uint8_t LCMP1;                        /* Low Compare */
  uint8_t HCMP1;                        /* High Compare */
  uint8_t LCMP2;                        /* Low Compare */
  uint8_t HCMP2;                        /* High Compare */
} tca_split_reg_t;

typedef union tca_reg {
  tca_single_reg_t SINGLE;		/*  */
  tca_split_reg_t SPLIT;		/*  */
} tca_reg_t;


typedef struct tca {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  tca_reg_t *reg;			/* pointer to registers */
  clktick_t bot_at;			/* count at last bottom */
  tkevt_t *bot_act;			/* bottom action */
  tkevt_t *top_act;			/* capture/compare action */
  tkevt_t *cmp0_act;			/* capture/compare action */
  tkevt_t *cmp1_act;			/* capture/compare action */
  tkevt_t *cmp2_act;			/* capture/compare action */
  iopin_t *pin_out;			/* todo */
  uint8_t ovf_vn;			/* OVF vect num */
  uint8_t lunf_vn;			/* LUNF vect num */
  uint8_t hunf_vn;			/* HUNF vect num */
  uint8_t lcmp0_vn;			/* LCMP0 vect num */
  uint8_t lcmp1_vn;			/* LCMP1 vect num */
  uint8_t lcmp2_vn;			/* LCMP2 vect num */
  uint8_t cmp0_vn;			/* CMP0 vect num */
  uint8_t cmp1_vn;			/* CMP1 vect num */
  uint8_t cmp2_vn;			/* CMP2 vect num */
} tca_t;

void tca_init(tca_t *, mcu_t *mcu, uint16_t addr);
void tca_fini(tca_t *);

uint8_t tca_rd(tca_t *, int addr);
void tca_wr(tca_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
