/* SYSCFG - System Configuration Registers 
 *
 * Copyright (C) 2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_SYSCFG_H__
#define PER_SYSCFG_H__

#include <stdint.h>
#include "octbx.h"

typedef struct syscfg_reg {
  uint8_t rez00;                        /* reserved */
  uint8_t REVID;                        /* Revision ID */
  uint8_t EXTBRK;                       /* External Break */
  uint8_t rez03;                        /* reserved */
  uint8_t rez04;                        /* reserved */
  uint8_t rez05;                        /* reserved */
  uint8_t rez06;                        /* reserved */
  uint8_t rez07;                        /* reserved */
  uint8_t rez08;                        /* reserved */
  uint8_t rez09;                        /* reserved */
  uint8_t rez0A;                        /* reserved */
  uint8_t rez0B;                        /* reserved */
  uint8_t rez0C;                        /* reserved */
  uint8_t rez0D;                        /* reserved */
  uint8_t rez0E;                        /* reserved */
  uint8_t rez0F;                        /* reserved */
  uint8_t rez10;                        /* reserved */
  uint8_t rez11;                        /* reserved */
  uint8_t rez12;                        /* reserved */
  uint8_t rez13;                        /* reserved */
  uint8_t rez14;                        /* reserved */
  uint8_t rez15;                        /* reserved */
  uint8_t rez16;                        /* reserved */
  uint8_t rez17;                        /* reserved */
  uint8_t OCDM;                         /* OCD Message Register */
  uint8_t OCDMS;                        /* OCD Message Status */
} syscfg_reg_t;

typedef struct syscfg {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  syscfg_reg_t *reg;			/* pointer to registers */
} syscfg_t;

void syscfg_init(syscfg_t *, mcu_t *mcu, uint16_t addr);
void syscfg_fini(syscfg_t *);
uint8_t syscfg_rd(syscfg_t *, int addr);
void syscfg_wr(syscfg_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
