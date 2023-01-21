/* twi_bus.h
 *
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * allow bus line states to come from spice
 * fall time is 250 ns
 */

#ifndef TWI_BUS_H_
#define TWI_BUS_H_

#include <stdint.h>
#include "sched.h"

typedef enum {
  TWI_OP_NONE,
  TWI_OP_SCL_LO,
  TWI_OP_SCL_HI,
  TWI_OP_SDA_LO,
  TWI_OP_SDA_HI,
} twi_bus_op_t;

typedef enum {
  TWI_EV_NONE,
  TWI_EV_SCL_LO,			/* SCL H->L */
  TWI_EV_SCL_HI,
  TWI_EV_SDA_LO,			/* SDA H->L */
  TWI_EV_SDA_HI,
  TWI_EV_BOTH_LO,
  TWI_EV_BOTH_HI,
} twi_bus_ev_t;

typedef enum {
  TWI_LS_HI,				/* sig == HI */
  TWI_LS_LO,				/* sig == LO */
  TWI_LS_RS,				/* LO < sig < .3 */
  TWI_LS_FL,				/* .7 < sig < HI */
} twi_linst_t;

struct twi_node;

typedef struct twi_node {
  struct twi_bus *bus;
  void (*bus_changed)(struct twi_node *, twi_linst_t scl, twi_linst_t sda);
} twi_node_t;

typedef struct twi_bus {
  int scl_t_rise_ns;			/* t_rise 1000,300,120 ns */
  int scl_t_fall_ns;			/* t_fall 250,250,120 ns */
  int sda_t_rise_ns;			/* t_rise 1000,300,120 ns */
  int sda_t_fall_ns;			/* t_fall 250,250,120 ns */
  tmsch_t *sch;				/* scheduler */
  int nnode;				/* number of nodes */
  struct twi_node *nodes[64];		/* up to 64 nodes */
  uint64_t nd_scl;			/* bitmap of scl 0=HI */
  uint64_t nd_sda;			/* bitmap of sda 0=HI */
  twi_linst_t scl;
  twi_linst_t sda;
  tmevt_t *scl_evt;
  tmevt_t *sda_evt; 
} twi_bus_t;

void twi_bus_init(twi_bus_t *bus);
int twi_bus_add_node(twi_bus_t *bus, twi_node_t *node);
int twi_bus_action(twi_bus_t *bus, uint8_t id, twi_bus_op_t op);

void twi_node_init(twi_node_t *bus);

#endif
/* --- last line --- */
