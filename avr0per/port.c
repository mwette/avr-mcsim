/* PORT - I/O Ports 
 *
 * Copyright (C) 2020-2021,2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdio.h>

#include <stdint.h>
#include <stdlib.h>
#include "octbx.h"
#include "port.h"

static void hey_port_per(void *per, struct iopin *pin, int op, int arg);

void port_init(port_t *port, mcu_t *mcu, uint16_t addr) {
  iopin_t *pin;
  
  port->mcu = mcu;
  port->base_addr = addr;
  port->reg = (port_reg_t *)&mcu->cpu.data[addr];

  for (int i = 0; i < 8; i++) {
    pin = &port->pin[i];
    pin->pos = i;
    pin->clk_per = &mcu->clk_per;
    pin->hey_per = hey_port_per;
    pin->per = port;
    pin->def_hey_per = hey_port_per;
    pin->def_per = port;
  }
}

void port_fini(port_t *port) {
}  

#define PORT_INT_gm 0xff                /* Pin Interrupt */
#define PORT_INT_bs 0                   /*   bit shift */
#define PORT_INVEN_bm 0x80              /* Inverted I/O Enable */
#define PORT_ISC_gm 0x7                 /* Input/Sense Configuration */
#define PORT_ISC_bs 0                   /*   bit shift */
#define PORT_PULLUPEN_bm 0x8            /* Pullup enable */
#define PORT_SRL_bm 0x1                 /* Slew Rate Limit Enable */

typedef enum {
  PORT_ISC_INTDISABLE_gc = (0x0 << 0), /* Intr disabled, input buf enabled */
  PORT_ISC_BOTHEDGES_gc = (0x1 << 0),   /* Sense Both Edges */
  PORT_ISC_RISING_gc = (0x2 << 0),      /* Sense Rising Edge */
  PORT_ISC_FALLING_gc = (0x3 << 0),     /* Sense Falling Edge */
  PORT_ISC_INPUT_DISABLE_gc = (0x4 << 0), /* Digital Input Buffer disabled */
  PORT_ISC_LEVEL_gc = (0x5 << 0),       /* Sense low Level */
} PORT_ISC_t;

#define PORT_DIR_OFFSET 0x00		/* Data Direction */
#define PORT_DIRSET_OFFSET 0x01		/* Data Direction Set */
#define PORT_DIRCLR_OFFSET 0x02		/* Data Direction Clear */
#define PORT_DIRTGL_OFFSET 0x03		/* Data Direction Toggle */
#define PORT_OUT_OFFSET 0x04		/* Output Value */
#define PORT_OUTSET_OFFSET 0x05		/* Output Value Set */
#define PORT_OUTCLR_OFFSET 0x06		/* Output Value Clear */
#define PORT_OUTTGL_OFFSET 0x07		/* Output Value Toggle */
#define PORT_IN_OFFSET 0x08		/* Input Value */
#define PORT_INTFLAGS_OFFSET 0x09	/* Interrupt Flags */
#define PORT_PORTCTRL_OFFSET 0x0A	/* Port Control */
#define PORT_PIN0CTRL_OFFSET 0x10	/* Pin 0 Control */
#define PORT_PIN1CTRL_OFFSET 0x11	/* Pin 1 Control */
#define PORT_PIN2CTRL_OFFSET 0x12	/* Pin 2 Control */
#define PORT_PIN3CTRL_OFFSET 0x13	/* Pin 3 Control */
#define PORT_PIN4CTRL_OFFSET 0x14	/* Pin 4 Control */
#define PORT_PIN5CTRL_OFFSET 0x15	/* Pin 5 Control */
#define PORT_PIN6CTRL_OFFSET 0x16	/* Pin 6 Control */
#define PORT_PIN7CTRL_OFFSET 0x17	/* Pin 7 Control */

static uint8_t *pinctrl_ref(port_t *port, int bp) {
  return &(port->reg->PIN0CTRL) + bp;
}

static uint8_t pinctrl(port_t *port, int bp) {
  return (&(port->reg->PIN0CTRL))[bp];
}

void hey_port_per(void *per, struct iopin *pin, int op, int arg) {
  port_t *port = per;
  port_reg_t *reg = port->reg;
  mcu_t *mcu = port->mcu;
  cpu_t *cpu = &mcu->cpu;
  uint8_t port_IN, pin_ctrl;
  
  //printf("hey_port_per %p pin=%p op=%d arg=%d\n", port, pin, op, arg);
  switch (op) {

  case PIN_BOP_LVL:
    port_IN = reg->IN;
    if (arg)
      reg->IN |= (1 << pin->pos);
    else
      reg->IN &= ~(1 << pin->pos);

    if (reg->IN ^ port_IN) {
      /* possible interrupt */
      pin_ctrl = pinctrl(port, pin->pos);
      switch (pin_ctrl & PORT_ISC_gm) {
      case PORT_ISC_INTDISABLE_gc:
	break;
      case PORT_ISC_BOTHEDGES_gc:
	mcu_ir(mcu, port->port_vn);
	break;
      case PORT_ISC_RISING_gc:
	if (port_IN == 0) mcu_ir(mcu, port->port_vn);
	break;
      case PORT_ISC_FALLING_gc:
	if (port_IN != 0) mcu_ir(mcu, port->port_vn);
	break;
      case PORT_ISC_INPUT_DISABLE_gc:
	break;
      case PORT_ISC_LEVEL_gc:
	if (port_IN != 0) mcu_ir(mcu, port->port_vn);
	break;
      }
    }
    break;
  }
}

uint8_t port_rd(port_t *port, int addr) {
  port_reg_t *reg = port->reg;
  uint16_t offs = addr - port->base_addr;

  switch (offs) {
  case PORT_DIR_OFFSET:			/* Data Direction */
    return reg->DIR;
    break;
  case PORT_DIRSET_OFFSET:		/*a Data Direction Set */
    return reg->DIR;
    break;
  case PORT_DIRCLR_OFFSET:		/* Data Direction Clear */
    return reg->DIR;
    break;
  case PORT_DIRTGL_OFFSET:		/* Data Direction Toggle */
    return reg->DIR;
    break;
  case PORT_OUT_OFFSET:			/* Output Value */
    return reg->OUT;
    break;
  case PORT_OUTSET_OFFSET:		/* Output Value Set */
    return reg->OUT;
    break;
  case PORT_OUTCLR_OFFSET:		/* Output Value Clear */
    return reg->OUT;
    break;
  case PORT_OUTTGL_OFFSET:		/* Output Value Toggle */
    return reg->OUT;
    break;
  case PORT_IN_OFFSET:			/* Input Value */
    return reg->IN;
    break;
  case PORT_INTFLAGS_OFFSET:		/* Interrupt Flags */
    return reg->INTFLAGS;
    break;
  case PORT_PORTCTRL_OFFSET:		/* Port Control */
    return reg->PORTCTRL;
    break;
  case PORT_PIN0CTRL_OFFSET:		/* Pin 0 Control */
    return reg->PIN0CTRL;
    break;
  case PORT_PIN1CTRL_OFFSET:		/* Pin 1 Control */
    return reg->PIN1CTRL;
    break;
  case PORT_PIN2CTRL_OFFSET:		/* Pin 2 Control */
    return reg->PIN2CTRL;
    break;
  case PORT_PIN3CTRL_OFFSET:		/* Pin 3 Control */
    return reg->PIN3CTRL;
    break;
  case PORT_PIN4CTRL_OFFSET:		/* Pin 4 Control */
    return reg->PIN4CTRL;
    break;
  case PORT_PIN5CTRL_OFFSET:		/* Pin 5 Control */
    return reg->PIN5CTRL;
    break;
  case PORT_PIN6CTRL_OFFSET:		/* Pin 6 Control */
    return reg->PIN6CTRL;
    break;
  case PORT_PIN7CTRL_OFFSET:		/* Pin 7 Control */
    return reg->PIN7CTRL;
    break;
  default:
    abort();
    break;
  }
}

void port_wr(port_t *port, int addr, uint8_t val) {
  mcu_t *mcu = port->mcu;
  port_reg_t *reg = port->reg;
  uint16_t offs = addr - port->base_addr;
  uint8_t rval;

  switch (offs) {
  case PORT_DIR_OFFSET:			/* Data Direction */
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i)) {
	port->pin[i].dir = 1;
      } else {
	port->pin[i].dir = 0;
      }
    }
    reg->DIR = val;
    break;
  case PORT_DIRSET_OFFSET:		/* Data Direction Set */
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i)) {
	port->pin[i].dir = 1;
      }
    }
    reg->OUT |= val;
    break;
  case PORT_DIRCLR_OFFSET:		/* Data Direction Clear */
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i)) {
	port->pin[i].dir = 0;
      }
    }
    reg->DIR &= ~val;
    break;
  case PORT_DIRTGL_OFFSET:		/* Data Direction Toggle */
    reg->DIRTGL = val;
    break;
  case PORT_OUT_OFFSET:			/* Output Value */
    // if (configured as output) {
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i)) {
	iopin_wrD(&port->pin[i], 1);
      } else {
	iopin_wrD(&port->pin[i], 0);
      }
    }
    reg->OUT = val;
    // }
    break;
  case PORT_OUTSET_OFFSET:		/* Output Value Set */
    // if (configured as output) {
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i)) {
	//printf("port %p writing to bus\n", port);
	iopin_wrD(&port->pin[i], 1);
      }
    }
    reg->OUT |= val;
    // }
    break;
  case PORT_OUTCLR_OFFSET:		/* Output Value Clear */
    // if (configured as output) {
    reg->OUT &= ~val;
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i)) {
	//printf("port %p writing to bus\n", port);
	iopin_wrD(&port->pin[i], 0);
      }
    }
    // }
    break;
  case PORT_OUTTGL_OFFSET:		/* Output Value Toggle */
    reg->OUTTGL = val;
    rval = reg->OUT;
    reg->OUT = (rval & ~val) | (~rval & val);
    for (int i = 0; i < 8; i++) {
      if (val & (1 << i))
	iopin_wrD(&port->pin[i], rval & (1 << i) ? 0 : 1);
    }
    break;
  case PORT_IN_OFFSET:			/* Input Value */
    reg->IN = val;
    break;
  case PORT_INTFLAGS_OFFSET:		/* Interrupt Flags */
    reg->INTFLAGS &= ~val;
    if (reg->INTFLAGS == 0) mcu_ir(mcu, -(port->port_vn));
    break;
  case PORT_PORTCTRL_OFFSET:		/* Port Control */
    reg->PORTCTRL = val;
    break;
  case PORT_PIN0CTRL_OFFSET:		/* Pin 0 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[0], 1);
    }
    reg->PIN0CTRL = val;
    break;
  case PORT_PIN1CTRL_OFFSET:		/* Pin 1 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[1], 1);
    }
    reg->PIN1CTRL = val;
    break;
  case PORT_PIN2CTRL_OFFSET:		/* Pin 2 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[2], 1);
    }
    reg->PIN2CTRL = val;
    break;
  case PORT_PIN3CTRL_OFFSET:		/* Pin 3 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[3], 1);
    }
    reg->PIN3CTRL = val;
    break;
  case PORT_PIN4CTRL_OFFSET:		/* Pin 4 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[4], 1);
    }
    reg->PIN4CTRL = val;
    break;
  case PORT_PIN5CTRL_OFFSET:		/* Pin 5 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[5], 1);
    }
    reg->PIN5CTRL = val;
    break;
  case PORT_PIN6CTRL_OFFSET:		/* Pin 6 Control */
    if (val & PORT_PULLUPEN_bm) {
      iopin_pullup(&port->pin[6], 1);
    }
    reg->PIN6CTRL = val;
    break;
  case PORT_PIN7CTRL_OFFSET: 		/* Pin 7 Control */
  {
    iopin_t *pin = &port->pin[7];
    if (val & PORT_PULLUPEN_bm) iopin_pullup(pin, 1);
    reg->PIN7CTRL = val;
  } break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
