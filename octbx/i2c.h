/* i2c.h
 *
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef I2C_H__
#define I2C_H__

#include <stdint.h>
#include "util.h"

/* nd11 scenario
 * 1. send START, send ADDR/w
 * 2. recv ERR, NACK or ACK
 *
 */
struct i2c_bus;
struct i2c_node;

typedef enum {
  I2C_C_UNKNOWN,

  I2C_C_SCH_EOS,			/* sched end of start */
  I2C_C_SCH_ARBL,			/* sched arb lost */
  I2C_C_SCH_EOA,			/* sched end of addr */

  I2C_C_DATA,				/* data on bus */
  I2C_C_ACK,
  I2C_C_NACK,
  
} i2c_cmd_t;

typedef enum {
  I2C_ST_IDLE,
  I2C_ST_INIT,				/* START initiated */
  I2C_ST_BUSY,				/* SDA lo, SCL hi */
} i2c_bus_state_t;

typedef int (i2c_bx_t)(struct i2c_node *node, i2c_cmd_t cmd, uint8_t arg);

typedef struct i2c_bus {
  //tmsch_t *sch;				/* bus scheduler */
  i2c_bus_state_t state;		/* bus state */
  struct i2c_node *master;		/* current master */
  /* node command */
  struct i2c_node *dst;			/* destination node */
  i2c_cmd_t cmd;			/* command */
  uint8_t arg;				/* data */
  /* bus structure */
  struct i2c_node *nodes[128];		/* by address */
} i2c_bus_t;

typedef struct i2c_node {
  tksch_t *sch;				/* node's scheduler */
  struct i2c_bus *bus;
  uint8_t addr;				/* address [0-127] */
  int32_t per_tk;			/* i2c clk per in ticks */
  i2c_bx_t *bx;				/* bus trans handler */
  void *dh;				/* device handle */
} i2c_node_t;

void i2c_bus_init(i2c_bus_t *bus);
void i2c_bus_attach(i2c_bus_t *bus, i2c_node_t *node);
void i2c_bus_dettach(i2c_bus_t *bus, i2c_node_t *node);

void i2c_node_init(i2c_node_t *node);

/* node -> bus */
int i2c_start(i2c_bus_t *bus, i2c_node_t *node, uint8_t addr, int rdflag);

int i2c_eos(i2c_bus_t *bus, i2c_node_t *node);
int i2c_eoa(i2c_bus_t *bus, i2c_node_t *node);

#endif
/* --- last line --- */
