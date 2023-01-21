/* avr_mcu.c
 * 
 * Copyright (C) 2021-2023 Matthew R. Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdlib.h>			/* abort() */
#include "avr_mcu.h"

void def_ir(void *_mcu, int ivec) {
  mcu_t *mcu = _mcu;
  uint8_t mask;

  if (ivec > 0) {
    mcu->irmsk |= (1l << ivec);
  }
  else if (ivec <  0) {
    mcu->irmsk &= ~(1l << -ivec);
  }
}

void def_ia(void *_mcu, int ivec) {
  mcu_t *mcu = _mcu;

  if (ivec == -1) {
    switch (mcu->cpuint.reg->STATUS) {
    default: abort(); break;
    }
  }
}

/* @deffn {C} int mcu_next_ivec(mcu_t *mcu)
 * Next ivec for AVR0 CPU interrupt controller
 * @table @code
 * @item = 0
 * no interrupt
 * @item < 0
 * NMI: - interrupt vec
 * @item > 0
 * interrupt vec
 * @end deffn
 */
int mcu_next_ivec(mcu_t *mcu) {
  uint64_t irmsk;
  cpuint_reg_t *reg = mcu->cpuint.reg;

  if (mcu->nimsk != 0) {
    irmsk= mcu->nimsk;
    for (int i = 0; i < 64; i++) {
      if (irmsk & 0x0001) return -i;
      irmsk = irmsk >> 1;
    }
    abort();

  } else if (mcu->irmsk != 0) {
    irmsk = (1l << reg->LVL0PRI);
    for (int i = reg->LVL0PRI; i < 64; i++) {
      if (mcu->irmsk & irmsk) return i;
      irmsk = (irmsk << 1);
    }
    irmsk = 2;
    for (int i = 2; i <= reg->LVL0PRI; i++) {
      if (mcu->irmsk & irmsk) return i;
      irmsk = (irmsk << 1);
    }
  }
  
  return 0;
}


/* user interfaces */
uint64_t mcu_get_irmsk(mcu_t *mcu) {
  return mcu->irmsk;
}

uint64_t mcu_get_nimsk(mcu_t *mcu) {
  return mcu->nimsk;
}

/*
 * peripherals send interrupt requests to the CPU via the
 * (interrrupt controller functionality in) the device file (e.g.,
 * mega4809.c)  This is the \texttt{\_ir} function.
 */
void mcu_req_intr(mcu_t *mcu, int iv) {
  mcu_ir(mcu, iv);
}

/*
 * If/when an interrupt is serviced, the device simulator sends an ack
 * back to the peripheral (from the device).
 */
void mcu_ack_intr(mcu_t *mcu, int iv) {
  mcu_ia(mcu, iv);
}

uint32_t mcu_clr_iv(mcu_t *mcu, uint32_t iv) {
  abort();
  return 0;
}

/* --- last line --- */

