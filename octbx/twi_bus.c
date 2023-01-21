/* twi_bus.c 
 *
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "twi_bus.h"
#include "sched.h"

void
twi_node_init(twi_node_t *node)
{
  memset(node, 0, sizeof(*node));
}


void
twi_bus_init(twi_bus_t *bus)
{
  memset(bus, 0, sizeof(*bus));
  bus->scl_t_rise_ns = 1000;
  bus->scl_t_fall_ns = 250;
  bus->sda_t_rise_ns = 1000;
  bus->sda_t_fall_ns = 250;
}

int
twi_bus_add_node(twi_bus_t *bus, twi_node_t *node)
{
  int id = bus->nnode;
  
  bus->nodes[id] = node;
  bus->nnode += 1;
  return id;
}

static int
twi_notify_nodes(twi_bus_t *bus)
{
  twi_node_t *nd;
  
  for (int i = 0; i < bus->nnode; i++) {
    nd = bus->nodes[i];
    if (nd) nd->bus_changed(nd, bus->scl, bus->sda);
  }
  return 0;
}

static void
twi_scl_lo_evt(void *_bus, tmsch_t *sch)
{
  twi_bus_t *bus = _bus;

  bus->scl = TWI_LS_LO;
  twi_notify_nodes(bus);
  bus->scl_evt = 0;
}

static void
twi_scl_hi_evt(void *_bus, tmsch_t *sch)
{
  twi_bus_t *bus = _bus;

  bus->scl = TWI_LS_HI;
  twi_notify_nodes(bus);
  bus->scl_evt = 0;
}

static void
twi_sda_lo_evt(void *_bus, tmsch_t *sch)
{
  twi_bus_t *bus = _bus;

  bus->sda = TWI_LS_LO;
  twi_notify_nodes(bus);
  bus->sda_evt = 0;
}

static void
twi_sda_hi_evt(void *_bus, tmsch_t *sch)
{
  twi_bus_t *bus = _bus;

  bus->sda = TWI_LS_HI;
  twi_notify_nodes(bus);
  bus->sda_evt = 0;
}

int
twi_bus_action(twi_bus_t *bus, uint8_t id, twi_bus_op_t op)
{
  tmsch_t *sch = bus->sch;
  simtime_t at;
  
  switch (op) {
  case TWI_OP_SCL_LO:
    bus->nd_scl |= (1 << id);
    break;
  case TWI_OP_SCL_HI:
    bus->nd_scl &= ~(1 << id);
    break;
  case TWI_OP_SDA_LO:
    bus->nd_sda |= (1 << id);
    break;
  case TWI_OP_SDA_HI:
    bus->nd_scl &= ~(1 << id);
    break;
  default:
    abort();
    break;
  }

  switch (bus->scl) {
  case TWI_LS_HI:
    if (bus->nd_scl) {
      bus->scl = TWI_LS_FL;
      at = tm_add_ns(sch->time, bus->scl_t_fall_ns);
      bus->scl_evt = tmsch_sched(bus->sch, at, 1, twi_scl_lo_evt, bus);
    }
    break;
  case TWI_LS_LO:
    if (! bus->nd_scl) {
      bus->scl = TWI_LS_RS;
      at = tm_add_ns(sch->time, bus->scl_t_rise_ns);
      bus->scl_evt = tmsch_sched(bus->sch, at, 1, twi_scl_hi_evt, bus);
    }
    break;
  case TWI_LS_FL:
    abort(); /* do later */
    break;
  case TWI_LS_RS:
    abort(); /* do later */
    break;
  }

  switch (bus->sda) {
  case TWI_LS_HI:
    if (bus->nd_sda) {
      bus->sda = TWI_LS_FL;
      at = tm_add_ns(sch->time, bus->sda_t_fall_ns);
      bus->sda_evt = tmsch_sched(bus->sch, at, 1, twi_sda_lo_evt, bus);
    }
    break;
  case TWI_LS_LO:
    if (! bus->nd_sda) {
      bus->sda = TWI_LS_RS;
      at = tm_add_ns(sch->time, bus->sda_t_rise_ns);
      bus->sda_evt = tmsch_sched(bus->sch, at, 1, twi_sda_hi_evt, bus);
    }
    break;
  case TWI_LS_FL:
    abort(); /* do later */
    break;
  case TWI_LS_RS:
    abort(); /* do later */
    break;
  }

  return 0;
}

/* --- last line --- */
