/*
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdint.h>
#include <string.h>			/* memset() */
#include <stdlib.h>			/* abort() */
#include <stdio.h>
#include "i2c.h"
#include "util.h"

/* twi_model.h */
struct twm_reg {
  uint8_t rif:1;
  uint8_t wif:1;
  uint8_t ack:1;
};

struct tws_reg {
  uint8_t dif:1;
  uint8_t apif:1;
  uint8_t ack:1;
  uint8_t dir:1;
  uint8_t ap:1;
};

/* --- last line --- */

struct dev {
  //tksch_t *sch; /* used node.sch instead */
  struct twm_reg mreg;
  struct tws_reg sreg;
  i2c_node_t node;
  i2c_bus_t *bus;			/* connection */
};


/* generate end-of-start */
static void mega0_i2c_eos(void *arg, tksch_t *sch) {
  struct dev *dev = arg;
  int res;

  printf("%p end-of-start event\n", dev);
  res = i2c_eos(dev->bus, &dev->node);
}

/* generate end-of-addr */
static void mega0_i2c_eoa(void *arg, tksch_t *sch) {
  struct dev *dev = arg;

  i2c_eoa(dev->bus, &dev->node);
}

/* bus transaction
 * This is how the bus talks to the node implementation.
 * If the node does not respond to this return -1, else 0.
 * For an address sent on the bus, we need to establish w/o simulation, 
 * which node will be responding, if any.
 */
int mega0_i2c_bx(i2c_node_t *nd, i2c_cmd_t cmd, uint8_t arg) {
  struct dev *dev = nd->dh;
  tksch_t *tksch = nd->sch;
  tmsch_t *tmsch = tksch->tmsch;
  uint32_t at;

  switch (cmd) {
  case I2C_C_SCH_EOS:			/* schedule end-of-start */
    tksch_sync(tksch);
    at = tksch->tick + dev->node.per_tk;
    tksch_sched(tksch, at, 0, mega0_i2c_eos, dev);
    break;
  case I2C_C_SCH_EOA:
    break;
  default:
    abort();
    break;
  }
}

/* processor interrupt */
void tws_vect(void *arg, tmsch_t *sch) {
  /* slave handler */
}


tmsch_t sch0;

i2c_bus_t bus1;
tksch_t sch1, sch2, sch3;
struct dev dev1, dev2, dev3;

int
main()
{
  struct dev *dev;
  tmsch_t *tmsch = &sch0;
  tksch_t *sch;
  i2c_bus_t *bus;
  i2c_node_t *nd;
  systime_t tm;
  int err;
  uint8_t addr;

  tmsch_init(&sch0);
  tm = sch0.time;

  /* bus */
  i2c_bus_init(&bus1);
  bus = &bus1;
  //bus->sch = tmsch;

  /* === device 1 ======================= */
  sch = &sch1;
  tksch_init(sch, tmsch);
  sch->tick_per = 1.0/20.0e6;
  tmsch_sched(tmsch, tm, -1, tksch_evt, sch);
  
  dev = &dev1; addr = 0x11;
  memset(dev, 0, sizeof(struct dev));

  nd = &dev->node;
  nd->bus = bus;
  nd->addr = addr;			/* -1 == any */
  nd->sch = sch;
  nd->per_tk = 200;			/* 20 MHz / 100 kHz = 200 */
  nd->bx = mega0_i2c_bx;
  nd->dh = dev;
  i2c_bus_attach(bus, nd);

  /* === device 2 ======================= */
  sch = &sch2;
  tksch_init(sch, tmsch);
  sch->tick_per = 1.0/20.0e6;
  tmsch_sched(tmsch, tm, -1, tksch_evt, sch);
  
  dev = &dev2; addr = 0x12;
  memset(dev, 0, sizeof(struct dev));

  nd = &dev->node;
  nd->bus = bus;
  nd->addr = addr;			/* -1 == any */
  nd->sch = sch;
  nd->per_tk = 200;			/* 20 MHz / 100 kHz = 200 */
  nd->bx = mega0_i2c_bx;
  nd->dh = dev;
  i2c_bus_attach(bus, nd);

  /* === device 3 ======================= */
  sch = &sch3;
  tksch_init(sch, tmsch);
  sch->tick_per = 1.0/20.0e6;
  tmsch_sched(tmsch, tm, -1, tksch_evt, sch);
  
  dev = &dev3; addr = 0x13;
  memset(dev, 0, sizeof(struct dev));

  nd = &dev->node;
  nd->bus = bus;
  nd->addr = addr;			/* -1 == any */
  nd->sch = sch;
  nd->per_tk = 200;			/* 20 MHz / 100 kHz = 200 */
  nd->bx = mega0_i2c_bx;
  nd->dh = dev;
  i2c_bus_attach(bus, nd);

  /* master @ 0x11 starts transaction when software writes to MADDR 
   * args to start are bus, node, addr, rd-flag.
   * This should come back as a call to mega0_i2c_bx
   */
  err = i2c_start(&bus1, &dev1.node, 0x12, 0);
  if (err == -1) { 
    /* bus busy => ? */
  }

  tm.sec = 1; tm.nsec = 0;
  tmsch_run(tmsch, tm, 0);
}

/* --- last line --- */



