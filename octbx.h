/* octbx.h
 *
 * Copyright (C) 2019-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef OCTBX_H__
#define OCTBX_H__

#include <stdint.h>

#define reg16_t_(N) struct { uint8_t N ## L; uint8_t N ## H; }

#define REG16H(V) (((V) >> 8) & 0xFF)
#define REG16L(V) ((V) & 0xFF)
#define REG16S(N) ((int16_t)(((N ## H) << 8) | (N ## L)))
#define REG16U(N) ((uint16_t)(((N ## H) << 8) | (N ## L)))

#include "octbx/sched.h"
#include "octbx/avr_cpu.h"
#include "octbx/avr_pin.h"
#include "octbx/avr_mcu.h"
#include "octbx/hooks.h"
#include "octbx/log.h"
#include "octbx/twi_bus.h"

#endif
/* --- last line --- */
