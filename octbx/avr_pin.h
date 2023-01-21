/* pin 
 *
 * Copyright (C) 2020-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef AVR_PIN_H__
#define AVR_PIN_H__

#include <stdint.h>
#include "sched.h"

//struct port;
struct iopin;

typedef enum {
  PIN_T_NONE,
  PIN_T_IO,
  PIN_T_PWR,
  PIN_T_GND,
} pin_type_t;

/* 
 * pin_chg - per -> pin -> bus (via hey_bus)
 * bus_chg - bus -> pin -> per (via hey_per)
 * dict:
 *   PIN_BOP_
 */
typedef void (*iopin_notify_t)(void *tgt, struct iopin *pin, int op, int val);


// CIR_ANL_
// CIR_DIG_...

/* bus operation : kludge for now -- should be circuit */
typedef enum {
  PIN_BOP_NOP,
  PIN_BOP_DIR,				/* ??? */
  PIN_BOP_LVL,				/* level changed */
  PIN_BOP_PUL,				/* pullup status changed */
} pin_bus_op_t;

typedef enum {
  PIN_OP_PULUP,
  PIN_OP_DIR,
  PIN_OP_OUT,
  PIN_OP_ISC,				/* input sense config */
} pinop_t;

typedef enum {
  PIN_ARG_CLR,
  PIN_ARG_SET,
  PIN_ARG_TGL,
} pinarg_t;

typedef enum {
  PIN_DIR_IN = 0,
  PIN_DIR_OUT = 1,
} pindir_t;

typedef enum {
  PIN_LEV_LOW = 0,
  PIN_LEV_HI = 1,
} pinlev_t;

typedef enum {
  PIN_ISC_INTDISABLE_gc = 0x0,	   /* Intr disabled but in buf ena */
  PIN_ISC_BOTHEDGES_gc = 0x1,	   /* Sense Both Edges */
  PIN_ISC_RISING_gc = 0x2,	   /* Sense Rising Edge */
  PIN_ISC_FALLING_gc = 0x3,	   /* Sense Falling Edge */
  PIN_ISC_INPUT_DISABLE_gc = 0x4,  /* Digital Input Buffer disabled */
  PIN_ISC_LEVEL_gc = 0x5,	   /* Sense low Level */
} pinisc_t;

/* still need to deal with pullups */

typedef struct iopin {
  tkclk_t *clk_per;			/* peripheral clock */
  uint8_t pos;				/* position in port */
  struct {
    uint8_t pullup :1;			/* pullup enabled */
  };
  uint8_t dir;				/* direction */
  uint8_t isc;				/* input sense config */
  uint8_t wrlev;			/* write level */
  uint8_t rdlev;			/* read level, 0 = low */
  double aval;				/* analog value */
  iopin_notify_t hey_bus;		/* pin change, tell bus */
  void *bus;
  iopin_notify_t hey_per;		/* pin change, tell per' */
  void *per;				/* peripheral */
  iopin_notify_t def_hey_per;		/* (port) default */
  void *def_per;			/* (port) default */
} iopin_t;

typedef struct pin {
  union {
    iopin_t iopin;
  };
  pin_type_t type;
} pin_t;

/* ^-notes:
 * 1. client registers 
 */

/* for per to change pin */
void iopin_notify_bus(iopin_t *pin, int op, int val);
/* for bus to change pin */
void iopin_notify_per(iopin_t *pin, int op, int arg);

void iopin_pullup(iopin_t *pin, int ena);

uint8_t iopin_rdD(iopin_t *);
double iopin_rdA(iopin_t *);

/* called by peripheral */
void iopin_wrD(iopin_t *pin, uint8_t lev);
void iopin_wrA(iopin_t *, double val);

#define PIN_CMD_LEVEL 1			/* set level */

typedef void (*pin_func_t)(pin_t*, int cmd, int arg);

#endif
/* --- last line --- */
