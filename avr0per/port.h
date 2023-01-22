/* PORT - I/O Ports 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_PORT_H__
#define PER_PORT_H__

#include <stdint.h>
#include "octbx.h"

typedef struct port_reg {
  uint8_t DIR;                          /* Data Direction */
  uint8_t DIRSET;                       /* Data Direction Set */
  uint8_t DIRCLR;                       /* Data Direction Clear */
  uint8_t DIRTGL;                       /* Data Direction Toggle */
  uint8_t OUT;                          /* Output Value */
  uint8_t OUTSET;                       /* Output Value Set */
  uint8_t OUTCLR;                       /* Output Value Clear */
  uint8_t OUTTGL;                       /* Output Value Toggle */
  uint8_t IN;                           /* Input Value */
  uint8_t INTFLAGS;                     /* Interrupt Flags */
  uint8_t PORTCTRL;                     /* Port Control */
  uint8_t rez0B;                        /* reserved */
  uint8_t rez0C;                        /* reserved */
  uint8_t rez0D;                        /* reserved */
  uint8_t rez0E;                        /* reserved */
  uint8_t rez0F;                        /* reserved */
  uint8_t PIN0CTRL;                     /* Pin 0 Control */
  uint8_t PIN1CTRL;                     /* Pin 1 Control */
  uint8_t PIN2CTRL;                     /* Pin 2 Control */
  uint8_t PIN3CTRL;                     /* Pin 3 Control */
  uint8_t PIN4CTRL;                     /* Pin 4 Control */
  uint8_t PIN5CTRL;                     /* Pin 5 Control */
  uint8_t PIN6CTRL;                     /* Pin 6 Control */
  uint8_t PIN7CTRL;                     /* Pin 7 Control */
} port_reg_t;

typedef struct port {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  port_reg_t *reg;			/* pointer to registers */
  char name;				/* "A" etc */
  iopin_t pin[8];
  uint8_t perovr;			/* peripheral overrides */
  uint8_t port_vn;			/* PORT_vect_num */
} port_t;

void port_init(port_t *, mcu_t *mcu, uint16_t addr);
void port_fini(port_t *);

uint8_t port_rd(port_t *, int addr);
void port_wr(port_t *, int addr, uint8_t val);

#endif
/* --- last line --- */
