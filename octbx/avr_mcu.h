/* avr_mcu.h
 * 
 * Copyright (C) 2019-2023 Matthew R. Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * No license to use is granted.
 */
#ifndef BX_MCU_H_
#define BX_MCU_H_

#include <stdint.h>
#include "sched.h"
#include "avr_cpu.h"
#include "avr_pin.h"
#include "cpuint.h"

/* 
 * wrt the @code{wr} routine, the mask is an @i{inverse} and is used for I/O 
 * writes (at index 0x20-0x3F) only
 */
typedef struct mcu {
  cpu_t cpu;				/* generic cpu */
  uint64_t irmsk;			/* interrupts requested */
  uint64_t nimsk;			/* non-maskable requested */
  char *device;				/* device (e.g., "mega4809") */
  char *code;				/* code (e.g., "mcu1.hex") */
  char *name;				/* name (e.g., "mcu1") */
  tkosc_t osc20m;			/* on avr0 */
  tkosc_t osculp32k;			/* on avr0 */
  tkosc_t xosc32k;			/* on avr0 */
  tkclk_t clk_per;			/* peripheral clock */
  cpuint_t cpuint;
  struct {
    void (*rt)(void *_mcu, int flags);	 /* reset w/ reason */
    uint8_t (*rd)(void *_mcu, int addr); /* data read */
    void (*wr)(void *_mcu, int addr, uint8_t val); /* data write */
    void (*bs)(void *_mcu, int addr, uint8_t val, uint8_t msk); /* bit set */
    void (*ir)(void *_mcu, int ivec);	  /* req intr */
    //void (*ix)(void *_mcu, int ivec);	  /* NMI req intr */
    void (*ia)(void *_mcu, int ivec);	  /* ack intr */
    iopin_t *(*pn)(void *_mcu, char *name); /* pin from name */
    void (*wdr)(void *_mcu);		    /* watchdog reset */
  };
  struct {
    void (*rt_hook)(void *_mcu, int flags);
    uint8_t (*rd_hook)(void *_mcu, int addr);
    void (*wr_hook)(void *_mcu, int addr, uint8_t val);
    void (*bs_hook)(void *_mcu, int addr, uint8_t val, uint8_t msk);
    void (*ir_hook)(void *_mcu, int ivec);
    void (*ia_hook)(void *_mcu, int ivec);
  };
} mcu_t;

typedef mcu_t *(*mcu_gen_t)(tmsch_t *);

/* note interrupt */
static void mcu_reset(mcu_t *host, int flags) {
  if (host->rt_hook) host->rt_hook(host, flags);
  host->rt(host, flags);
}

/* read byte value */
static uint8_t mcu_rd(mcu_t *host, int addr) {
  if (host->rd_hook) host->rd_hook(host, addr);
  return host->rd(host, addr);
}
/* write byte value */
static void mcu_wr(mcu_t *host, int addr, uint8_t val) {
  if (host->wr_hook) host->wr_hook(host, addr, val);
  host->wr(host, addr, val);
}
/* bit set in io reg */
static void mcu_bs(mcu_t *host, int addr, uint8_t val, uint8_t msk) {
  if (host->bs_hook) host->bs_hook(host, addr, val, msk);
  host->bs(host, addr, val, msk);
}
/* req interrupt 
 * If iv < 0, then non-maskable.
*/
static void mcu_ir(mcu_t *host, int iv) {
  if (host->ir_hook) host->ir_hook(host, iv);
  host->ir(host, iv);
}
/* cpu->per interrupt ACK */  /* -1 means RETI: needed? */
static void mcu_ia(mcu_t *host, int iv) {
  if (host->ia_hook) host->ia_hook(host, iv);
  host->ia(host, iv);
}

uint8_t def_rd(void *_mcu, int addr);
void def_wr(void *_mcu, int addr, uint8_t val);
void def_bs(void *_mcu, int addr, uint8_t val, uint8_t msk);
void def_ir(void *_mcu, int ivec);
void def_ia(void *_mcu, int ivec);
void def_rt(void *_mcu, int flags);

/* 
 * if ni ivec is -1 then RETI issued, return if pending intr
 */

int mcu_next_ivec(mcu_t *mcu);
  

void mcu_req_intr(mcu_t *mcu, int iv);
void mcu_ack_intr(mcu_t *mcu, int iv);
uint32_t mcu_clr_iv(mcu_t *mcu, uint32_t iv);

#endif
/* --- last line --- */
