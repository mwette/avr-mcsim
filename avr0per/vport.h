/* VPORT - Virtual Ports 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef PER_VPORT_H__
#define PER_VPORT_H__

#include <stdint.h>
#include "octbx.h"

typedef struct vport_reg {
  uint8_t DIR;                          /* Data Direction */
  uint8_t OUT;                          /* Output Value */
  uint8_t IN;                           /* Input Value */
  uint8_t INTFLAGS;                     /* Interrupt Flags */
} vport_reg_t;

typedef struct vport {
  mcu_t *mcu;
  uint16_t base_addr;			/* base address */
  vport_reg_t *reg;			/* pointer to registers */
} vport_t;


#endif
/* --- last line --- */
