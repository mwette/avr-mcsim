/* VPORT - Virtual Ports 
 *
 * Copyright (C) 2020,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "vport.h"

#define VPORT_INT_gm 0xff               /* Pin Interrupt */
#define VPORT_INT_bs 0                  /*   bit shift */

#define DIR_OFFSET 0x0                  /* Data Direction */
#define OUT_OFFSET 0x1                  /* Output Value */
#define IN_OFFSET 0x2                   /* Input Value */
#define INTFLAGS_OFFSET 0x3             /* Interrupt Flags */

uint8_t vport_rd(vport_t *vport, int offs) {
  vport_reg_t *reg = vport->reg;

  switch (offs) {
  case DIR_OFFSET:                      /* Data Direction */
    return reg->DIR;
    break;
  case OUT_OFFSET:                      /* Output Value */
    return reg->OUT;
    break;
  case IN_OFFSET:                       /* Input Value */
    return reg->IN;
    break;
  case INTFLAGS_OFFSET:                 /* Interrupt Flags */
    return reg->INTFLAGS;
    break;
  default:
    abort();
    break;
  }
}

void vport_wr(vport_t *vport, int offs, uint8_t val) {
  vport_reg_t *reg = vport->reg;

  switch (offs) {
  case DIR_OFFSET:                      /* Data Direction */
    reg->DIR = val;
    break;
  case OUT_OFFSET:                      /* Output Value */
    reg->OUT = val;
    break;
  case IN_OFFSET:                       /* Input Value */
    reg->IN = val;
    break;
  case INTFLAGS_OFFSET:                 /* Interrupt Flags */
    reg->INTFLAGS = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
