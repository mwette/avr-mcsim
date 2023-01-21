/* avr_pin.c 
 * 
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#include <stdio.h>

#include <stdint.h>
#include <stdlib.h>
#include "avr_pin.h"

/* pin control to bus - called by peripheral */
void iopin_wrD(iopin_t *pin, uint8_t lev) {
  lev = lev? 1: 0;
  pin->wrlev = lev;
  pin->aval = 5.0*lev;
  // FIXME: different if pullup or hi-imped
  if (pin->bus)
    (pin->hey_bus)(pin->bus, pin, PIN_BOP_LVL, lev);
  else
    iopin_notify_per(pin, PIN_BOP_LVL, lev);
}

void iopin_notify_per(iopin_t *pin, int op, int arg) {
  //printf("pin_notify_per (async)\n");
  int lev = arg? 1: 0;
  switch (op) {
  case PIN_BOP_LVL:
    if (pin->hey_per) (pin->hey_per)(pin->per, pin, PIN_BOP_LVL, arg);
    pin->rdlev = lev;
    pin->aval = 5.0*lev;
    break;
  default:
    abort();
    break;
  }
}

void iopin_pullup(iopin_t *pin, int ena) {
  pin->pullup = ena? 1: 0;
  (pin->hey_bus)(pin->bus, pin, PIN_BOP_PUL, ena? 1: 0);
}

void iopin_notify_bus(iopin_t *pin, int op, int arg) {
  iopin_wrD(pin, arg);
}

/* --- last line --- */
