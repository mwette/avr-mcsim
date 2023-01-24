/* avr_cpu.c
 * 
 * Copyright (C) 2019-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

/* Notes:
 *  1) Be sure to check out the RAMP_ registers for LD and ST.
 *  2) signals are pair of time and event; should these be at chi level or
 *     pin level?  methinks mcu
 *  3) the 16-bit timer registers have a buffer for the hi8,
 *     but see timer1 text in sec 16.3.1 of m328p datasheet
 */
#define _XOPEN_SOURCE 600
#include <assert.h>
#include <stdint.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include <stdio.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "sched.h"
#include "avr_cpu.h"
#include "avr_mcu.h"
#include "hooks.h"

/* === CPU ================================================================== */

#define AM(CPU,ADDR) ((CPU)->upd.asml.am*(ADDR))

void myabort() { printf("MYABORT\n"); abort(); }

uint8_t def_rd(void *_mcu, int idx) {
  mcu_t *mcu = _mcu;
  cpu_t *cpu = &mcu->cpu;

  return cpu->data[idx];
}

void def_wr(void *_mcu, int idx, uint8_t val) {
  mcu_t *mcu = _mcu;
  cpu_t *cpu = &mcu->cpu;

  cpu->data[idx] = val;
}

void def_bs(void *_mcu, int idx, uint8_t val, uint8_t msk) {
  mcu_t *mcu = _mcu;
  cpu_t *cpu = &mcu->cpu;
  cpu->data[idx] = val | (cpu->data[idx] & ~msk);
}

void def_ni(void *_mcu, int ivec) {
}

static inline uint8_t cpu_rd(cpu_t *cpu, int ix) {
  return mcu_rd(cpu->host, ix);
}


/* === formatting ===========================================*/

static void asmsav0(asmline_t *al, const char *fmt) {
  al->fmt = fmt;
  al->narg = 0;
}

static void asmsav1(asmline_t *al, const char *fmt, int arg1) {
  al->fmt = fmt;
  al->narg = 1;
  al->args[0] = arg1;
}

static void asmsav2(asmline_t *al, const char *fmt, int arg1, int arg2) {
  al->fmt = fmt;
  al->narg = 2;
  al->args[0] = arg1;
  al->args[1] = arg2;
}

static void asmsav3(asmline_t *al, const char *fmt, int rg1, int rg2, int rg3) {
  al->fmt = fmt;
  al->narg = 3;
  al->args[0] = rg1;
  al->args[1] = rg2;
  al->args[2] = rg3;
}

static char *fmtarg(int n, char *bptr, int base, int pad, int wid, char *dc) {
  int i = 0;
  int av = n < 0? -n: n;
  char buf[32];

  do { buf[i++] = dc[av % base]; } while ((av /= base) > 0);
  if (n < 0) buf[i++] = '-';
  while (i < wid) buf[i++] = pad;
  while (i > 0) *bptr++ = buf[--i];
  return bptr;
}

static char cl[] = { '0', '1', '2', '3', '4', '5', '6', '7',
		     '8', '9', 'a', 'b', 'c', 'e', 'e', 'f' };
static char cu[] = { '0', '1', '2', '3', '4', '5', '6', '7',
		     '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

#define izdigit(C) (('0' <= (C)) && ((C) <= '9'))

// support zero pad and one digit of min width
// ba = use byte address
// 'r' format is like 'd' but with address multiplier
int asmstrf(asmline_t *al, int show_ba, char *bufp, int bufsiz) {
  char *bp = bufp;
  const char *fp = al->fmt;
  int ix = 0;
  int am = show_ba? 2: 1;
  int *rgs = al->args;
  int pad, wid;

  if (fp == 0) return 0;
  
  while (*fp != '\0') {
    if (*fp == '%') {
      fp++;
      if (*fp == '+') { fp++; if (rgs[ix] >= 0) *bp++ = '+'; }
      if (*fp == '0') { pad = '0'; fp++; } else pad = ' ';
      if (izdigit(*fp)) { wid = *fp - '0'; fp++; } else wid = 0;
      switch (*fp) {
      case 'c': *bp++ = rgs[ix++]; break;
      case 'd': bp = fmtarg(rgs[ix++], bp, 10, pad, wid, cl); break;
      case 'x': bp = fmtarg(rgs[ix++], bp, 16, pad, wid, cl); break;
      case 'X': bp = fmtarg(rgs[ix++], bp, 16, pad, wid, cu); break;
      case 'a': bp = fmtarg(am*rgs[ix++], bp, 16, pad, wid, cl); break;
      case 'A': bp = fmtarg(am*rgs[ix++], bp, 16, pad, wid, cu); break;
      case 'r': bp = fmtarg(am*rgs[ix++], bp, 10, pad, wid, cl); break;
      case '%': *bp = '%'; break;
      default:
	fprintf(stderr, "octsim: bad char in asmfmt: %c\n", *fp);
	break;
      }
      fp++;
    } else {
      *bp++ = *fp++;
    }
  }
  *bp = '\0';
  return bp - bufp;
} 

/* === breakpoints and watchpoints ===========================================*/

/* Breakpoint 0 is reserved for internal use and has special semantics.  
 * Nominally, when the CPU encounters a breakpoint, the instruction is 
 * placed and decoded, then the breakpoint is replaced.  For bkpt 0 the
 * replacement is not performed.
 */

void brkpt_init(brkpt_t *brkpts, int nbrkpt) {
  memset(brkpts, 0, nbrkpt*sizeof(brkpt_t));
}

int brkpt_alloc(cpu_t *cpu) {
  brkpt_t *brkpts = cpu->brkpts;

  for (int ix = 1; ix < NBRKPT; ix++) {
    if (brkpts[ix].insn == 0) {
      brkpts[ix].pc = 0;
      return ix;
    }
  }
  myabort();
  return -1;
}

void brkpt_dealloc(cpu_t *cpu, int ix) {
  brkpt_t *brkpts = cpu->brkpts;
  
  assert((0 < ix) && (ix < NBRKPT));
  brkpts[ix].pc = 0;
  brkpts[ix].insn = 0;
}

void brkpt_set(cpu_t *cpu, int ix, uint32_t pc) {
  brkpt_t *brkpts = cpu->brkpts;

  assert((0 <= ix) && (ix < NBRKPT));
  assert(cpu->prog[pc] != BREAK_INSN);
  brkpts[ix].pc = pc;
  brkpts[ix].insn = cpu->prog[pc];
  cpu->prog[pc] = BREAK_INSN;
}

uint16_t brkpt_unset(cpu_t *cpu, int ix) {
  brkpt_t *brkpts = cpu->brkpts;
  uint32_t pc;
  uint16_t insn;
  
  assert((0 <= ix) && (ix < NBRKPT));
  pc = brkpts[ix].pc;
  insn = brkpts[ix].insn;
  cpu->prog[pc] = insn;
  return insn;
}

/* restore */
void brkpt_reset(cpu_t *cpu, int ix) {
  brkpt_t *brkpts = cpu->brkpts;
  uint32_t pc;
  
  assert((0 <= ix) && (ix < NBRKPT));
  pc = brkpts[ix].pc;
  cpu->prog[pc] = BREAK_INSN;
}

/* get breakpoint at address */
int brkpt_at(cpu_t *cpu, uint32_t pc) {
  brkpt_t *brkpts = cpu->brkpts;
  
  for (int ix = 0; ix < NBRKPT; ix++) {
    if (brkpts[ix].pc == pc) return ix;
  }
  myabort();
  return -1;
}

/* @deffn {C} static int eval_brkpt(cpu_t *cpu, uint16_t insn)
 * hmmm
 * @end deffn
 */
static int eval_brkpt(cpu_t *cpu, uint16_t insn) {
  insn_rout_t rout;
  int bpid;

  bpid = brkpt_at(cpu, cpu->pc);
  insn = brkpt_unset(cpu, bpid);
  rout = decode_insn(insn, cpu->vers);
  memset(&cpu->upd, 0, sizeof(update_t)); // 06/12/22
  cpu->upd.insn = insn;
  (void) (rout)(cpu, insn);
  brkpt_reset(cpu, bpid);
  return 0;
}

/* @deffn {C} int add_brkpt(cpu_t*,  uint32_t pc_ba)
 * Allocate and set a breakpoint at byte address @var{pc_ba}.
 * @end deffn
 */
int add_brkpt(cpu_t *cpu, uint32_t pc_ba) {
  int ix;

  if (cpu->prog[pc_ba/2] == BREAK_INSN) {
    printf("add_brkpt: already there at 0x%x\n", pc_ba);
    ix = brkpt_at(cpu, pc_ba/2);
    assert(ix >= 0);
    return ix;
  }

  ix = brkpt_alloc(cpu);
  brkpt_set(cpu, ix, pc_ba/2);
  return ix;
}

/* @deffn {C} int rem_brkpt(cpu_t*,  uint32_t pc_ba)
 * user called add a breakpoint
 * @end deffn
 */
int rem_brkpt(cpu_t *cpu, uint32_t pc_ba) {
  int ix = brkpt_at(cpu, pc_ba/2);
  cpu->brkpts[ix].pc = 0;
  return ix;
}


typedef enum {
  ONIO_LOG_WR = 0x01,
  ONIO_LOG_RD = 0x02,
  ONIO_BRK_RD = 0x04,
  ONIO_BRK_WR = 0x08,
} onio_action_t;

void onio_set_log_rd(cpu_t *cpu, int addr) {
  cpu->onio[addr] |= ONIO_LOG_RD;
}

void onio_set_log_wr(cpu_t *cpu, int addr) {
  cpu->onio[addr] |= ONIO_LOG_WR;
}

void onio_set_break_rd(cpu_t *cpu, int addr) {
  cpu->onio[addr] |= ONIO_BRK_RD;
}

void onio_set_break_wr(cpu_t *cpu, int addr) {
  cpu->onio[addr] |= ONIO_BRK_WR;
}

int onio_rd(cpu_t *cpu, int addr) {
  uint8_t reg = cpu->onio[addr];
  
  if (addr) {
    if (addr & ONIO_LOG_RD) {
      // log
    }
  }
  return 0;
}

int onio_wr(cpu_t *cpu, int addr) {
  uint8_t reg = cpu->onio[addr];
  
  if (addr) {
    if (addr & ONIO_LOG_WR) {
      // log
    }
  }
  return 0;
}


/* === instruction execution and cycle count =============================== 
 *
 * If sys == 0, return number of clocks.
 * else return 0 for normal op, or < 0 for error ???
 */

#define RET_INSN 0x9508
#define RETI_INSN 0x9518
#define INTR_INSN 0xffff

typedef union {
  uint16_t w;				/* wide (16 bit) value, unsigned */
  int16_t ws;				/* wide (16 bit) value, signed */
  struct {
#if __BYTE_ORDER == __LITTLE_ENDIAN
    uint8_t lo;
    uint8_t hi;
#else
    uint8_t hi;
    uint8_t lo;
#endif
  };
} wreg_t;

typedef union {
  uint32_t x;				/* extra wide (22 bit) value */
  struct {
#if __BYTE_ORDER == __LITTLE_ENDIAN
    uint8_t lo;
    uint8_t hi;
    uint8_t ex;
    uint8_t _x;
#else
    uint8_t _x;
    uint8_t ex;
    uint8_t hi;
    uint8_t lo;
#endif
  };
} xreg_t;

// 0000 000d dddd 0000
static inline int get_dx(uint16_t code) {
  return ((code & 0x01F0) >> 4);
}

// 0000 00r0 0000 rrrr
static inline int get_rx(uint16_t code) {
  return ((code & 0x0200) >> 5) | (code & 0x000F);
}

// C: carry flag
#define SREG_C_SET(R) ((R) & 0x01)
#define SREG_SET_C(R) ((R) | 0x01)
#define SREG_CLR_C(R) ((R) & 0xFE)

// Z: zero flag
#define SREG_Z_SET(R) ((R) & 0x02)
#define SREG_SET_Z(R) ((R) | 0x02)
#define SREG_CLR_Z(R) ((R) & 0xFD)

// N: negative flag
#define SREG_N_SET(R) ((R) & 0x04)
#define SREG_SET_N(R) ((R) | 0x04)
#define SREG_CLR_N(R) ((R) & 0xFB)

// V: two's compliment overflow
#define SREG_V_SET(R) ((R) & 0x08)
#define SREG_SET_V(R) ((R) | 0x08)
#define SREG_CLR_V(R) ((R) & 0xF7)

// S: sign
#define SREG_S_SET(R) ((R) & 0x10)
#define SREG_SET_S(R) ((R) | 0x10)
#define SREG_CLR_S(R) ((R) & 0xEF)

// H: half carry
#define SREG_H_SET(R) ((R) & 0x20)
#define SREG_SET_H(R) ((R) | 0x20)
#define SREG_CLR_H(R) ((R) & 0xDF)

#define SREG_T_SET(R) ((R) & 0x40)
#define SREG_SET_T(R) ((R) | 0x40)
#define SREG_CLR_T(R) ((R) & 0xBF)

#define SREG_I_SET(R) ((R) & 0x80)
#define SREG_SET_I(R) ((R) | 0x80)
#define SREG_CLR_I(R) ((R) & 0x7F)

static uint8_t set_N(uint8_t sreg, uint8_t reg) {
  if (reg & 0x80) {
    return SREG_SET_N(sreg);
  } else {
    return SREG_CLR_N(sreg);
  }
}

static uint8_t set_H(uint8_t sreg, uint8_t Rd, uint8_t Rr, uint8_t Ru) {
  if (((Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (~Ru & 0x08)) ||
      ((~Ru & 0x08) && (Rd & 0x08))) {
    return SREG_SET_H(sreg);
  } else {
    return SREG_CLR_H(sreg);
  }
}

static uint8_t set_V(uint8_t sreg, uint8_t Rd, uint8_t Rr, uint8_t Ru) {
  if (((Rd & 0x80) && (Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (~Rr & 0x80) && (Ru & 0x80))) {
    return SREG_SET_V(sreg);
  } else {
    return SREG_CLR_V(sreg);
  }
}

static uint8_t set_S(uint8_t sreg) {
  if ((SREG_N_SET(sreg) && !SREG_V_SET(sreg)) ||
      (!SREG_N_SET(sreg) && SREG_V_SET(sreg))) {
    return SREG_SET_S(sreg);
  } else {
    return SREG_CLR_S(sreg);
  }
}

static int8_t set_Z(uint8_t sreg, uint8_t reg) {
  if (reg == 0) {
    return SREG_SET_Z(sreg);
  } else {
    return SREG_CLR_Z(sreg);
  }
}

static uint8_t set_C(uint8_t sreg, uint8_t Rd, uint8_t Rr, uint8_t Ru) {
  if (((Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Ru & 0x80) && (Rd & 0x80))) {
    return SREG_SET_C(sreg);
  } else {
    return SREG_CLR_C(sreg);
  }
}

int insn_wsize(uint16_t insn, cpu_vers_t vers) {
  if (((insn & 0xFE0E) == 0x940E) ||	/* call */
      ((insn & 0xFE0E) == 0x940C)) {	/* jmp */
    return 2;
  }
  switch (vers) {
  case CPU_VERS_AVRxm:
  case CPU_VERS_AVRxt:
    if (((insn & 0xFE0F) == 0x9000) || // LDS
	((insn & 0xFE0F) == 0x9200)) { // STD
      return 2;
    } else {
      return 1;
    }
    break;
  case CPU_VERS_AVRrc:
    return 1;
    break;
  default:
    abort();
    break;
  }
}

/* === instructions ================== */

static int eval_ADC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;
  uint16_t pc;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  Ru = Rd + Rr;
  if (SREG_C_SET(sreg)) Ru += 1;

  if (((Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (~Ru & 0x08)) ||
      ((~Ru & 0x08) && (Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }

  if (((Rd & 0x80) && (Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (~Rr & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  if (((Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Ru & 0x80) && (Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "adc   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_ADD(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd + Rr;

  if (((Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (~Ru & 0x08)) ||
      ((~Ru & 0x08) && (Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }

  if (((Rd & 0x80) && (Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (~Rr & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  if (((Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Ru & 0x80) && (Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "add   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_ADIW(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  wreg_t Rd, Ru;
  uint8_t sreg, K;

  dx = 2*((insn & 0x0030) >> 4) + 24;
  Rd.lo = cpu->regs[dx];
  Rd.hi = cpu->regs[dx+1];
  K = ((insn & 0x00C0) >> 2) | (insn & 0x000F);
  sreg = CPU_SREG(cpu);

  Ru.w = Rd.w + K;

  if ((~Rd.hi & 0x80) && (Ru.hi & 0x80)) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  if (Ru.hi & 0x80) {
    sreg = SREG_SET_N(sreg);
  } else {
    sreg = SREG_CLR_N(sreg);
  }

  sreg = set_S(sreg);

  if (Ru.w == 0) {
    sreg = SREG_SET_Z(sreg);
  } else {
    sreg = SREG_CLR_Z(sreg);
  }

  if ((~Ru.hi & 0x80) && (Rd.hi & 0x80)) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = dx + 1;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "adiw  r%d,%d", dx, K);
  return upd->nclk;
}

static int eval_AND(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd & Rr;

  sreg = SREG_CLR_V(sreg);

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "and   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_ANDI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, K, Ru, sreg;
  uint16_t pc;

  dx = ((insn & 0x00F0) >> 4) + 16;
  K = ((insn & 0x0F00) >> 4) | (insn & 0x000F);

  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  Ru = Rd & K;
  sreg = SREG_CLR_V(sreg);
  
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  
  upd->pc = pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "andi  r%d,0x%02x", dx, K);
  return upd->nclk;
}

static int eval_ASR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;
  uint16_t pc;

  dx = (insn & 0x001F0) >> 4;
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (Rd & 0x01) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }
  Ru = (Rd >> 1);
  Ru |= (Rd & 0x80);

  sreg = set_N(sreg, Ru);

  if ((SREG_N_SET(sreg) && !SREG_C_SET(sreg)) ||
      (!SREG_N_SET(sreg) && SREG_C_SET(sreg))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  upd->pc = pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "asr   r%d", dx);
  return upd->nclk;
}

static int eval_BLD(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, b;
  uint8_t Rd, Ru, sreg;
  uint16_t pc;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  b = (insn & 0x0007);
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_T_SET(sreg)) {
    Ru = Rd | (1 << b);
  } else {
    Ru = Rd & ~(1 << b);
  }
  
  upd->pc = pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav2(&upd->asml, "bld   r%d,%d", dx, b);
  return upd->nclk;
}

/* missing 
BRBC
BRBS
 */

static int eval_BRCC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  int k;
  uint16_t pc;
  int nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_C_SET(sreg)) {
    pc += k;
    nc += 1;
  }
  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brcc  .%+r", k);
  return upd->nclk;
}

static int eval_BRCS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  int k;
  uint16_t pc;
  int nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_C_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brcs  .%+r", k);
  return upd->nclk;
}

static int eval_BREAK(cpu_t *cpu, uint16_t insn) {
  /* Load cpu->upd with actual insn result and re-set BREAK. */
  return eval_brkpt(cpu, insn);
}

static int eval_BREQ(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_Z_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "breq  .%+r", k);
  return upd->nclk;
}

static int eval_BRGE(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_S_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brge  .%+r", k);
  return upd->nclk;
}

static int eval_BRHC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_H_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brhc  .%+r", k);
  return upd->nclk;
}

static int eval_BRHS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_H_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brhs  .%+r", k);
  return upd->nclk;
}

static int eval_BRID(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_I_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brid  .%+r", k);
  return upd->nclk;
}

static int eval_BRIE(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_I_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brie  .%+r", k);
  return upd->nclk;
}

/* BRLO same as BRCS */

static int eval_BRLT(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_S_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brlt  .%+r", k);
  return upd->nclk;
}

static int eval_BRMI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_N_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brmi  .%+r", k);
  return upd->nclk;
}

static int eval_BRNE(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_Z_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brne  .%+r", k);
  return upd->nclk;
}

static int eval_BRPL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_N_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brpl  .%+r", k);
  return upd->nclk;
}

/* BRSH is BRCC */

static int eval_BRTC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_T_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brtc  .%+r", k);
  return upd->nclk;
}

static int eval_BRTS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_T_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brts  .%+r", k);
  return upd->nclk;
}

static int eval_BRVC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (!SREG_V_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brvc  .%+r", k);
  return upd->nclk;
}

static int eval_BRVS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  uint16_t pc;
  int k, nc = 1;

  k = (insn & 0x03F8) >> 3;
  if (k > 63) k -= 128;
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (SREG_V_SET(sreg)) {
    pc += k;
    nc += 1;
  }

  upd->pc = pc + 1;
  upd->nclk = nc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "brvs  .%+r", k);
  return upd->nclk;
}

static int eval_BST(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, b;
  uint8_t Rd, sreg;
  uint16_t pc;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  b = (insn & 0x0007);
  sreg = CPU_SREG(cpu);
  pc = cpu->pc;

  if (Rd & (1 << b)) {
    sreg = SREG_SET_T(sreg);
  } else {
    sreg = SREG_CLR_T(sreg);
  }
  
  upd->pc = pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "bst  r%d,%d", dx, b);
  return upd->nclk;
}

/* 32 bit insn */
static int eval_CALL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  wreg_t sp;			   /* stack pointer, return address */
  uint32_t k, ra;
  int nclk;

  assert(insn == cpu->prog[cpu->pc]);

  k = cpu->prog[cpu->pc + 1];
  k |= ((insn & 0x01F0) << 12) | ((insn & 0x0001) << 16);

  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];
  ra = cpu->pc + 2;

  nclk = 3;
  if (cpu->vers == CPU_VERS_AVRe) nclk = 4;
  if (cpu->pc_22bits) nclk += 1;

  upd->pc = k;
  upd->nclk = nclk;
  upd->nval = 4;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = sp.w;
  upd->vals[0].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = sp.w;
  upd->vals[1].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  if (cpu->pc_22bits) {
    upd->nval += 1;
    upd->vals[2].tg = TG_DAT;
    upd->vals[2].ix = sp.w;
    upd->vals[2].dv = ra & 0x3F;
    sp.w--;
  }
  upd->vals[upd->nval-2].tg = TG_DAT;
  upd->vals[upd->nval-2].ix = SPL_IX+cpu->iobase;
  upd->vals[upd->nval-2].dv = sp.lo;
  upd->vals[upd->nval-1].tg = TG_DAT;
  upd->vals[upd->nval-1].ix = SPH_IX+cpu->iobase;
  upd->vals[upd->nval-1].dv = sp.hi;
  if (cpu->gen_asml) asmsav1(&upd->asml, "call  0x%a", k);
  upd->insn_hook = cpu_call_hook;
  return upd->nclk;
}

static int eval_CBI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int Ax, b;
  uint8_t RA;

  Ax = (insn & 0x00F8) >> 3;
  b = (insn & 0x0007);
  RA = cpu_rd(cpu, Ax+cpu->iobase);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_IOB;
  upd->vals[0].ix = Ax+cpu->iobase;
  upd->vals[0].dv = 0;
  upd->vals[0].mk = 1 << b;
  if (cpu->gen_asml) asmsav2(&upd->asml, "cbi   0x%02X,%d", Ax, b);
  return upd->nclk;
}

static int eval_CLC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_C(cpu->data[cpu->iobase+SREG_IX]);
  if (cpu->gen_asml) asmsav0(&upd->asml, "clc");
  return upd->nclk;
}

static int eval_CLH(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_H(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "clh");
  return upd->nclk;
}

static int eval_CLI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_I(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "cli");
  return upd->nclk;
}

static int eval_CLN(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_N(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "cln");
  return upd->nclk;
}

/* can use EOR*/

static int eval_CLR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t sreg;

  dx = get_dx(insn);
  sreg = CPU_SREG(cpu);

  sreg = SREG_CLR_V(sreg);
  sreg = SREG_CLR_N(sreg);
  sreg = SREG_CLR_S(sreg);
  sreg = SREG_SET_Z(sreg);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = 0;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "clr   r%d", dx);
  return upd->nclk;
}

static int eval_CLS (cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_S(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "cls");
  return upd->nclk;
}

static int eval_CLT (cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_T(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "clt");
  return upd->nclk;
}

static int eval_CLV (cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_V(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "clv");
  return upd->nclk;
}

static int eval_CLZ (cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_CLR_Z(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "clz");
  return upd->nclk;
}

static int eval_COM(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = ~Rd;
  
  sreg = SREG_CLR_V(sreg);
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  sreg = SREG_SET_C(sreg);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "com   r%d", dx);
  return upd->nclk;
}

static int eval_CP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - Rr;

  if (((~Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }
  if (((Rd & 0x80) && (~Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (Rr & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  if (((~Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "cp    r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_CPC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - Rr;
  if (SREG_C_SET(sreg)) Ru -= 1;

  if (((~Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }
  if (((Rd & 0x80) && (~Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (Rr & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = ((Ru == 0) && SREG_Z_SET(sreg))? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  if (((~Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "cpc   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_CPI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, K, Ru, sreg;
  
  dx = ((insn & 0x00F0) >> 4) + 16;
  K = ((insn & 0x0F00) >> 4) | (insn & 0x000F);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - K;

  if (((~Rd & 0x08) && (K & 0x08)) ||
      ((K & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }
  if (((Rd & 0x80) && (~K & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (K & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  if (((~Rd & 0x80) && (K & 0x80)) ||
      ((K & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "cpi   r%d,0x%02X", dx, K);
  return upd->nclk;
}

static int eval_CPSE(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx, inc;
  uint8_t Rd, Rr;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];

  if (Rd != Rr) {
    inc = 1;
  } else {
    inc = 1 + insn_wsize(cpu->prog[cpu->pc + 1], cpu->vers);
  }
  
  upd->pc = cpu->pc + inc;
  upd->nclk = inc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav2(&upd->asml, "cpse  r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_DEC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - 1;

  sreg = (Ru == 0x7F)? SREG_SET_V(sreg): SREG_CLR_V(sreg);
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "dec   r%d", dx);
  return upd->nclk;
}

static int eval_DES(cpu_t *cpu, uint16_t insn) {
  /* SKIP */
  printf("no DES\n"); abort();
}

static int eval_EICALL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint32_t pc, ra;
  uint8_t eind;
  wreg_t Z, sp;
  int nclk;

  Z.lo = cpu->regs[REGZ_IX+0];
  Z.hi = cpu->regs[REGZ_IX+1];
  eind = cpu->data[cpu->EIND_IX+cpu->iobase];
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];

  ra = cpu->pc + 1;
  pc = Z.w | (eind << 16);

  nclk = 3;
  if (cpu->vers == CPU_VERS_AVRe) nclk = 4;
  
  upd->pc = pc;
  upd->nclk = nclk;
  upd->nval = 5;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = sp.w;
  upd->vals[0].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = sp.w;
  upd->vals[1].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = sp.w;
  upd->vals[2].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  upd->vals[3].tg = TG_DAT;
  upd->vals[3].ix = SPL_IX+cpu->iobase;
  upd->vals[3].dv = sp.lo;
  upd->vals[4].tg = TG_DAT;
  upd->vals[4].ix = SPH_IX+cpu->iobase;
  upd->vals[4].dv = sp.hi;
  if (cpu->gen_asml) asmsav0(&upd->asml, "eicall");
  upd->insn_hook = cpu_call_hook;
  return upd->nclk;
}

static int eval_EIJMP (cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint8_t eind;
  wreg_t Z;

  Z.lo = cpu->regs[REGZ_IX+0];
  Z.hi = cpu->regs[REGZ_IX+1];
  eind = cpu->data[cpu->EIND_IX+cpu->iobase];

  upd->pc = (Z.w | (eind << 16));
  upd->nclk = 2;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav0(&upd->asml, "eijmp");
  return upd->nclk;
}

static int eval_ELPM_(cpu_t *cpu, int ix) {
  update_t *upd = &cpu->upd;
  uint8_t rampz, Ru;
  wreg_t Z, pv;
  int addr;

  Z.lo = cpu->regs[REGZ_IX+0];
  Z.hi = cpu->regs[REGZ_IX+1];
  rampz = cpu->data[cpu->RAMPZ_IX+cpu->iobase];

  addr = Z.w | (rampz << 16);
  pv.w = cpu->prog[addr/2];
  Ru = (addr % 2)? pv.hi: pv.lo;

  upd->pc = cpu->pc + 1;
  upd->nclk = 3;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = ix;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav0(&upd->asml, "elpm");
  return upd->nclk;
}

static int eval_ELPM_1(cpu_t *cpu, uint16_t insn) {
  return eval_ELPM_(cpu, 0);
}

static int eval_ELPM_2(cpu_t *cpu, uint16_t insn) {
  return eval_ELPM_(cpu, get_dx(insn));
}

static int eval_ELPM_3(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int nclk, nval;
  wreg_t Z;

  Z.lo = cpu->data[REGZ_IX+0];
  Z.hi = cpu->data[REGZ_IX+1];

  nclk = eval_ELPM_(cpu, get_dx(insn));
  nval = upd->nval;
  Z.w++;
  upd->vals[nval].ix = 30;
  upd->vals[nval].dv = Z.lo;
  nval++;
  upd->vals[nval].ix = 31;
  upd->vals[nval].dv = Z.hi;
  nval++;
  upd->nval = nval;
  return nclk;
}

static int eval_EOR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd ^ Rr;

  sreg = SREG_CLR_V(sreg);

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "eor   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_FMUL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, sreg;
  wreg_t Ru;

  dx = ((insn & 0x0070) >> 4) + 16;
  rx = (insn & 0x0007) + 16;
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru.w = Rd*Rr;

  sreg = Ru.w == 0? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru.w & 0x8000)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  
  Ru.w = Ru.w << 1;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = REG0_IX;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = REG1_IX;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "fmul  r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_FMULS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, sreg;
  wreg_t Ru;

  dx = ((insn & 0x0070) >> 4) + 16;
  rx = (insn & 0x0007) + 16;
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru.ws = ((int8_t)Rd)*((int8_t)Rr);

  sreg = (Ru.w == 0)? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru.w & 0x8000)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  
  Ru.w = Ru.w << 1;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = REG0_IX;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = REG1_IX;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "fmuls r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_FMULSU(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, sreg;
  wreg_t Ru;

  dx = ((insn & 0x0070) >> 4) + 16;
  rx = (insn & 0x0007) + 16;
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru.ws = ((int8_t)Rd)*((uint8_t)Rr);

  sreg = (Ru.w == 0)? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru.w & 0x8000)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  
  Ru.w = Ru.w << 1;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = REG0_IX;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = REG1_IX;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "fmulsu r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_ICALL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  wreg_t sp, Z;
  uint32_t ra;
  int nclk;

  Z.lo = cpu->regs[REGZ_IX+0];
  Z.hi = cpu->regs[REGZ_IX+1];
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];
  ra = cpu->pc + 1;

  switch (cpu->vers) {
  case CPU_VERS_AVRe: nclk = 3; break;
  case CPU_VERS_AVRxm: nclk = 2; break;
  case CPU_VERS_AVRxt: nclk = 2; break;
  case CPU_VERS_AVRrc: nclk = 3; break;
  default: abort(); break;
  }
  if (cpu->pc_22bits) nclk += 1;

  upd->pc = Z.w;
  upd->nclk = nclk;
  upd->nval = 4;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = sp.w;
  upd->vals[0].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = sp.w;
  upd->vals[1].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  if (cpu->pc_22bits) {
    upd->nval += 1;
    upd->vals[2].tg = TG_DAT;
    upd->vals[2].ix = sp.w;
    upd->vals[2].dv = ra & 0x3F;
    sp.w--;
  }
  upd->vals[upd->nval-2].tg = TG_DAT;
  upd->vals[upd->nval-2].ix = SPL_IX+cpu->iobase;
  upd->vals[upd->nval-2].dv = sp.lo;
  upd->vals[upd->nval-1].tg = TG_DAT;
  upd->vals[upd->nval-1].ix = SPH_IX+cpu->iobase;
  upd->vals[upd->nval-1].dv = sp.hi;
  if (cpu->gen_asml) asmsav0(&upd->asml, "icall");
  upd->insn_hook = cpu_call_hook;
  return upd->nclk;
}

static int eval_IJMP (cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  wreg_t K;

  K.lo = cpu->regs[REGZ_IX+0];
  K.hi = cpu->regs[REGZ_IX+1];

  upd->pc = K.w;
  upd->nclk = 2;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav0(&upd->asml, "ijmp");
  return upd->nclk;
}

static int eval_IN(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, Ax;

  dx = get_dx(insn);
  Ax = ((insn & 0x0600) >> 5) | (insn & 0x000F);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = cpu_rd(cpu, Ax+cpu->iobase);
  if (cpu->gen_asml) asmsav2(&upd->asml, "in    r%d,0x%02X", dx, Ax);
  return upd->nclk;
}

static int eval_INC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd + 1;

  sreg = Ru == 0x80? SREG_SET_V(sreg): SREG_CLR_V(sreg);
  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "inc   r%d", dx);
  return upd->nclk;
}

/* maybe only for 22bit PC */
static int eval_JMP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint32_t k;

  assert(insn == cpu->prog[cpu->pc]);

  k = ((insn & 0x01F0) << 12) | ((insn & 0x0001) << 16);
  k |= cpu->prog[cpu->pc + 1];

  upd->pc = k;
  upd->nclk = 3;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "jmp   0x%a", k);
  return upd->nclk;
}

/* only on xmega: load and clear; untested */
static int eval_LAC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru;
  wreg_t Rz;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  Rz.lo = cpu->regs[REGZ_IX+0];
  Rz.hi = cpu->regs[REGZ_IX+1];

  Ru = cpu_rd(cpu, Rz.w) & ~Rd;
    
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Rd;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = Rz.w;
  upd->vals[1].dv = Ru;
  if (cpu->gen_asml) asmsav1(&upd->asml, "lac   Z,r%d", dx);
  return upd->nclk;
}

/* only on xmega : load and set; untested */
static int eval_LAS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru;
  wreg_t Rz;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  Rz.lo = cpu->regs[REGZ_IX+0];
  Rz.hi = cpu->regs[REGZ_IX+1];

  Ru = cpu_rd(cpu, Rz.w) | Rd;

  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Rd;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = Rz.w;
  upd->vals[1].dv = Ru;
  if (cpu->gen_asml) asmsav1(&upd->asml, "las   Z,r%d", dx);
  return upd->nclk;
}

/* only on xmega: load and toggle: untested */
static int eval_LAT(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru;
  wreg_t Rz;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  Rz.lo = cpu->regs[REGZ_IX+0];
  Rz.hi = cpu->regs[REGZ_IX+1];

  Ru = cpu_rd(cpu, Rz.w);
  Ru = (Ru & ~Rd) | ((Ru ^ Rd) & Rd);

  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Rd;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = Rz.w;
  upd->vals[1].dv = Ru;
  if (cpu->gen_asml) asmsav1(&upd->asml, "lat   Z,r%d", dx);
  return upd->nclk;
}

static int eval_LD_(cpu_t *cpu, uint16_t insn, int _x, char _n) {
  update_t *upd = &cpu->upd;
  int dx, inc, nclk;
  uint8_t Ru;
  wreg_t R_;

  dx = get_dx(insn);
  inc = (insn & 0x0003) + 1;		/* case in manual i ii iii */
  R_.lo = cpu->regs[_x+0];
  R_.hi = cpu->regs[_x+1];

  if (inc == 3) R_.w -= 1;
  Ru = cpu_rd(cpu, R_.w);
  if (inc == 2) R_.w += 1;

  nclk = 2;
  if ((cpu->vers == CPU_VERS_AVRxm) && (inc == 3)) {
    nclk = 3;
  } else if (cpu->vers == CPU_VERS_AVRrc) {
    nclk = 2; /* HACK: FIXME can be 1 2 or 3*/
  }
  
  upd->pc = cpu->pc + 1;
  upd->nclk = nclk;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (inc == 1) {
    upd->nval = 1;
  } else {
    upd->vals[1].tg = TG_REG;
    upd->vals[1].ix = _x+0;
    upd->vals[1].dv = R_.lo;
    upd->vals[2].tg = TG_REG;
    upd->vals[2].ix = _x+1;
    upd->vals[2].dv = R_.hi;
    upd->nval = 3;
  }
  if (cpu->gen_asml) {
    switch (inc) {
    case 1: asmsav2(&upd->asml, "ld    r%d,%c", dx, _n); break;
    case 2: asmsav2(&upd->asml, "ld    r%d,%c+", dx, _n); break;
    case 3: asmsav2(&upd->asml, "ld    r%d,-%c", dx, _n); break;
    }
  }
  return upd->nclk;
}

static int eval_LDD_(cpu_t *cpu, uint16_t insn, int _x, char _n) {
  update_t *upd = &cpu->upd;
  int dx, q, nclk;
  uint8_t Ru;
  wreg_t R_;

  dx = get_dx(insn);
  q = ((insn & 0x2000) >> 8) | ((insn & 0x0C00) >> 7) | (insn & 0x0007);
  R_.lo = cpu->regs[_x+0];
  R_.hi = cpu->regs[_x+1];

  Ru = cpu_rd(cpu, R_.w + q);		// WAS cpu->data[R_.w + q];

  nclk = 2;
  if (cpu->vers == CPU_VERS_AVRxm) nclk = 3;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = nclk;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav3(&upd->asml, "ldd   r%d,%c+%d", dx, _n, q);
  return upd->nclk;
}

static int eval_LD_X(cpu_t *cpu, uint16_t insn) {
  return eval_LD_(cpu, insn, REGX_IX, 'X');
}

static int eval_LD_Y(cpu_t *cpu, uint16_t insn) {
  return eval_LD_(cpu, insn, REGY_IX, 'Y');
}

static int eval_LDD_Y(cpu_t *cpu, uint16_t insn) {
  return eval_LDD_(cpu, insn, REGY_IX, 'Y');
}

static int eval_LD_Z(cpu_t *cpu, uint16_t insn) {
  return eval_LD_(cpu, insn, REGZ_IX, 'Z');
}

static int eval_LDD_Z(cpu_t *cpu, uint16_t insn) {
  return eval_LDD_(cpu, insn, REGZ_IX, 'Z');
}

static int eval_LDI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t K;

  dx = ((insn & 0x00F0) >> 4) + 16;
  K = ((insn & 0x0F00) >> 4) | (insn & 0x000F);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = K;
  if (cpu->gen_asml) asmsav2(&upd->asml, "ldi   r%d,0x%02X", dx, K);
  return upd->nclk;
}

/* (insn & 0xFE0F) == 0x9000 => 2-word version */
static int eval_LDS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, nclk;
  uint8_t Rd, Ru, Rv;
  uint16_t k;

  assert(insn == cpu->prog[cpu->pc]);

  dx = get_dx(insn);
  k = cpu->prog[cpu->pc + 1];

  Ru = cpu_rd(cpu, k);

  nclk = 3;
  if (cpu->vers == CPU_VERS_AVRe) nclk = 2;
  
  upd->pc = cpu->pc + 2;
  upd->nclk = nclk;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav2(&upd->asml, "lds   r%d,0x%04X", dx, k);
  return upd->nclk;
}

static int eval_LDS16(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Ru;
  uint16_t k;

  dx = ((insn & 0x00F0) >> 4) + 16;
  k = ((insn & 0x0700) >> 4) | (insn & 0x000F);

  Ru = cpu_rd(cpu, k);			// WAS cpu->data[k];

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav2(&upd->asml, "lds   r%d,0x%04X", dx, k);
  return upd->nclk;
}

static int eval_LPM_(cpu_t *cpu, int dx, int inc) {
  update_t *upd = &cpu->upd;
  uint8_t Ru;
  wreg_t Z;

  Z.lo = cpu->regs[REGZ_IX+0];
  Z.hi = cpu->regs[REGZ_IX+1];

  if (Z.w % 2 == 0) {
    Ru = cpu->prog[Z.w/2] & 0xFF;
  } else {
    Ru = (cpu->prog[Z.w/2] >> 8) & 0xFF;
  }
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 3;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (inc) {
    Z.w++;
    upd->nval += 2;
    upd->vals[1].tg = TG_REG;
    upd->vals[1].ix = 30;
    upd->vals[1].dv = Z.lo;
    upd->vals[2].tg = TG_REG;
    upd->vals[2].ix = 31;
    upd->vals[2].dv = Z.hi;
  }
  return upd->nclk;
}

static int eval_LPM_1(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int nclk;

  nclk = eval_LPM_(cpu, 0, 0);
  if (cpu->gen_asml) asmsav0(&upd->asml, "lpm");
  return nclk;
}

static int eval_LPM_2(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, nclk;

  dx = get_dx(insn);
  nclk = eval_LPM_(cpu, dx, 0);
  if (cpu->gen_asml) asmsav1(&upd->asml, "lpm   r%d,Z", dx);
  return nclk;
}

static int eval_LPM_3(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, nclk;

  dx = get_dx(insn);
  nclk = eval_LPM_(cpu, dx, 1);
  if (cpu->gen_asml) asmsav1(&upd->asml, "lpm   r%d,Z+", dx);
  return nclk;
}

static int eval_LSL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = (insn & 0x001F0) >> 4;
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = (Rd << 1);
  Ru &= 0xFE;

  sreg = (Rd & 0x80)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  sreg = (Rd & 0x08)? SREG_SET_H(sreg): SREG_CLR_H(sreg);
  sreg = (Ru & 0x80)? SREG_SET_N(sreg): SREG_CLR_N(sreg);

  if ((SREG_N_SET(sreg) && !SREG_C_SET(sreg)) ||
      (!SREG_N_SET(sreg) && SREG_C_SET(sreg))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "lsl   r%d", dx);
  return upd->nclk;
}

static int eval_LSR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = (insn & 0x001F0) >> 4;
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  if (Rd & 0x01) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }
  Ru = (Rd >> 1);
  Ru &= 0x7F;

  sreg = SREG_CLR_N(sreg);
  sreg = (Rd & 0x01)? SREG_SET_C(sreg): SREG_CLR_C(sreg);

  if ((SREG_N_SET(sreg) && !SREG_C_SET(sreg)) ||
      (!SREG_N_SET(sreg) && SREG_C_SET(sreg))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "lsr   r%d", dx);
  return upd->nclk;
}

static int eval_MOV(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rr, Ru;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rr = cpu->regs[rx];

  Ru = Rr;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav2(&upd->asml, "mov   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_MOVW(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  wreg_t Rr, Ru;

  dx = ((insn & 0x00F0) >> 4)*2;
  rx = (insn & 0x000F)*2;
  Rr.lo = cpu->regs[rx+0];
  Rr.hi = cpu->regs[rx+1];

  Ru.lo = Rr.lo;
  Ru.hi = Rr.hi;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx+0;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = dx+1;
  upd->vals[1].dv = Ru.hi;
  if (cpu->gen_asml) asmsav2(&upd->asml, "movw  r%d,r%d", dx, rx); 
  return upd->nclk;
}

static int eval_MUL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, sreg;
  wreg_t Ru;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru.w = Rd*Rr;

  sreg = Ru.w == 0? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru.w & 0x8000)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = REG0_IX;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = REG1_IX;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "mul   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_MULS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, sreg;
  wreg_t Ru;

  dx = ((insn & 0x0070) >> 4) + 16;
  rx = (insn & 0x0007) + 16;
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru.ws = ((int8_t)Rd)*((int8_t)Rr);

  sreg = Ru.w == 0? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru.w & 0x8000)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = REG0_IX;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = REG1_IX;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "muls  r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_MULSU(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, sreg;
  wreg_t Ru;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru.ws = ((int8_t)Rd)*Rr;

  sreg = Ru.w == 0? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru.w & 0x8000)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = REG0_IX;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = REG1_IX;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "mulsu r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_NEG(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = 0 - Rd;

  sreg = ((Ru & 0x08) || (Rd & 0x08))? SREG_SET_H(sreg): SREG_CLR_H(sreg);
  sreg = (Ru == 0x80)? SREG_SET_V(sreg): SREG_CLR_V(sreg);
  sreg = (Ru & 0x80)? SREG_SET_N(sreg): SREG_CLR_N(sreg);
  sreg = set_S(sreg);
  sreg = (Ru == 0)? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);
  sreg = (Ru == 0)? SREG_CLR_C(sreg): SREG_SET_C(sreg);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "neg   r%d", dx);
  return upd->nclk;
}

static int eval_NOP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav0(&upd->asml, "nop");
  return upd->nclk;
}

static int eval_OR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd | Rr;

  sreg = SREG_CLR_V(sreg);
  sreg = (Ru & 0x80)? SREG_SET_N(sreg): SREG_CLR_N(sreg);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "or    r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_ORI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Z, Ru, sreg;

  dx = ((insn & 0x00F0) >> 4) + 16;
  Z = ((insn & 0x0F00) >> 4) | (insn & 0x000F);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd | Z;

  sreg = SREG_CLR_V(sreg);
  sreg = (Ru & 0x80)? SREG_SET_N(sreg): SREG_CLR_N(sreg);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "ori   r%d,0x%02X", dx, Z);
  return upd->nclk;
}

static int eval_OUT(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int rx, Ax;
  uint8_t Rr;

  rx = get_dx(insn);
  Ax = ((insn & 0x0600) >> 5) | (insn & 0x000F);
  Rr = cpu->regs[rx];
 
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = Ax+cpu->iobase;	/* to I/O space */
  upd->vals[0].dv = Rr;
  if (cpu->gen_asml) asmsav2(&upd->asml, "out   0x%02X,r%d", Ax, rx);
  return upd->nclk;
}

static int eval_POP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  wreg_t sp;
  uint8_t Ru;

  dx = get_dx(insn);

  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];
  Ru = cpu->data[++sp.w];
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SPL_IX+cpu->iobase;
  upd->vals[1].dv = sp.lo;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SPH_IX+cpu->iobase;
  upd->vals[2].dv = sp.hi;
  if (cpu->gen_asml) asmsav1(&upd->asml, "pop   r%d", dx);
  return upd->nclk;
}

static int eval_PUSH(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, nclk;
  wreg_t sp;
  uint8_t Rd, Ru;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];

  Ru = Rd;
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];

  nclk = 1;
  if (cpu->vers == CPU_VERS_AVRe) nclk = 2;
  
  upd->pc = cpu->pc + 1;
  upd->nclk = nclk;
  upd->nval = 3;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = sp.w;
  upd->vals[0].dv = Ru;
  /* postdecrement stack pointer */
  sp.w -= 1;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SPL_IX+cpu->iobase;	/* ??? stack pointer at 0? */
  upd->vals[1].dv = sp.lo;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SPH_IX+cpu->iobase;
  upd->vals[2].dv = sp.hi;
  if (cpu->gen_asml) asmsav1(&upd->asml, "push  r%d", dx);
  return upd->nclk;
}

static int eval_RCALL(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  uint16_t spl, sph;
  wreg_t sp;			   /* stack pointer, return address */
  uint32_t ra;
  int k, nclk, nv;
  
  k = insn & 0x0FFF;
  if (k > 2047) k -= 4096;
  spl = cpu->data[SPL_IX+cpu->iobase];
  sph = cpu->data[SPH_IX+cpu->iobase];

  sp.lo = spl;
  sp.hi = sph;

  ra = cpu->pc + 1;

  switch (cpu->vers) {
  case CPU_VERS_AVRe: nclk = 3; break;
  case CPU_VERS_AVRxm: nclk = 2; break;
  case CPU_VERS_AVRxt: nclk = 2; break;
  case CPU_VERS_AVRrc: nclk = 3; break;
  default: abort(); break;
  }
  if (cpu->pc_22bits) nclk += 1;

  upd->pc = cpu->pc + k+1;
  upd->nclk = nclk;
  upd->nval = 4;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = sp.w;
  upd->vals[0].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = sp.w;
  upd->vals[1].dv = ra & 0xFF;
  sp.w--; ra >>= 8;
  if (cpu->pc_22bits) {
    upd->nval += 1;
    upd->vals[2].tg = TG_DAT;
    upd->vals[2].ix = sp.w;
    upd->vals[2].dv = ra & 0xFF;
    sp.w--;
  }
  upd->vals[upd->nval-2].tg = TG_DAT;
  upd->vals[upd->nval-2].ix = SPL_IX+cpu->iobase;
  upd->vals[upd->nval-2].dv = sp.lo;
  upd->vals[upd->nval-1].tg = TG_DAT;
  upd->vals[upd->nval-1].ix = SPH_IX+cpu->iobase;
  upd->vals[upd->nval-1].dv = sp.hi;
  if (cpu->gen_asml) asmsav1(&upd->asml, "rcall .%+r", k);
  upd->insn_hook = cpu_call_hook;
  return upd->nclk;
}

static int eval_RET(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  wreg_t sp;
  uint32_t ra;

  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];

  ra = cpu->data[++sp.w];
  ra <<= 8;
  ra |= cpu->data[++sp.w];
  if (cpu->pc_22bits) {
    ra <<= 8;
    ra |= cpu->data[++sp.w];
  }

  upd->pc = ra;
  if (cpu->pc_22bits) {
    upd->nclk = 5;
  } else if (cpu->vers == CPU_VERS_AVRrc) {
    upd->nclk = 6;
  } else {
    upd->nclk = 4;
  }
  upd->nval = 2;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SPL_IX+cpu->iobase;
  upd->vals[0].dv = sp.lo;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SPH_IX+cpu->iobase;
  upd->vals[1].dv = sp.hi;
  if (cpu->gen_asml) asmsav0(&upd->asml, "ret");
  upd->insn_hook = cpu_ret_hook;
  return upd->nclk;
}

static int eval_RETI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int nclk = eval_RET(cpu, RET_INSN);	/* does not touch sreg */
  int n = upd->nval;

  switch (cpu->vers) {
  case CPU_VERS_AVRrc:
    upd->vals[n].tg = TG_DAT;
    upd->vals[n].ix = SREG_IX+cpu->iobase;
    upd->vals[n].dv = SREG_SET_I(CPU_SREG(cpu));
    upd->nval += 1;
    break;
  case CPU_VERS_AVRxm:
  case CPU_VERS_AVRxt:
    break;
  default: abort(); break;
  }
  if (cpu->gen_asml) asmsav0(&upd->asml, "reti");
  upd->insn_hook = cpu_reti_hook;
  return nclk;
}

static int eval_RJMP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int k;

  k = insn & 0x0FFF;
  if (k > 2047) k -= 4096;

  upd->pc = cpu->pc + k + 1;
  upd->nclk = 2;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav1(&upd->asml, "rjmp  .%+r", k);
  return upd->nclk;
}

static int eval_ROL(cpu_t *cpu, uint16_t insn) {
  return eval_ADC(cpu, insn);		/* CHECK THIS */
}

static int eval_ROR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru, sreg;

  dx = (insn & 0x001F0) >> 4;
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd >> 1;
  if (SREG_C_SET(sreg)) {
    Ru |= 0x80;
  } else {
    Ru &= 0x7F;
  }
  
  sreg = (Rd & 0x01)? SREG_SET_C(sreg): SREG_CLR_C(sreg);
  sreg = (Ru & 0x80)? SREG_SET_N(sreg): SREG_CLR_N(sreg);
  if ((SREG_N_SET(sreg) && !SREG_C_SET(sreg)) ||
      (!SREG_N_SET(sreg) && SREG_C_SET(sreg))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "ror   r%d", dx);
  return upd->nclk;
}

static int eval_SBC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - Rr;
  if (SREG_C_SET(sreg)) Ru -= 1;

  if (((~Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }

  if (((Rd & 0x80) && (~Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (Rr & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = ((Ru == 0) && SREG_Z_SET(sreg))? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);

  if (((~Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbc   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_SBCI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, K, Ru, sreg;

  dx = ((insn & 0x00F0) >> 4) + 16;
  K = ((insn & 0x0F00) >> 4) | (insn & 0x000F);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - K;
  if (SREG_C_SET(sreg)) Ru -= 1;

  if (((~Rd & 0x08) && (K & 0x08)) ||
      ((K & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }

  if (((Rd & 0x80) && (~K & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (K & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = ((Ru == 0) && SREG_Z_SET(sreg))? SREG_SET_Z(sreg): SREG_CLR_Z(sreg);

  if (((~Rd & 0x80) && (K & 0x80)) ||
      ((K & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbci  r%d,0x%02X", dx, K);
  return upd->nclk;
}

/* set bit in I/O register */
static int eval_SBI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int Ax, b, nclk;
  uint8_t RA;

  Ax = (insn & 0x00F8) >> 3;
  b = (insn & 0x0007);

  nclk = 1;
  if (cpu->vers == CPU_VERS_AVRe) nclk = 2;

  upd->pc = cpu->pc + 1;
  upd->nclk = nclk;
  upd->nval = 1;
  upd->vals[0].tg = TG_IOB;
  upd->vals[0].ix = Ax+cpu->iobase;
  upd->vals[0].dv = 1 << b;
  upd->vals[0].mk = 1 << b;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbi   0x%02X,%d", Ax, b);
  return upd->nclk;
}

/* skip if bit in io reg clear */
static int eval_SBIC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int Ax, b, inc, nclk;
  uint8_t RA;

  Ax = (insn & 0x00F8) >> 3;
  b = (insn & 0x0007);
  RA = cpu->data[Ax+cpu->iobase];

  if (RA & (1 << b)) {
    inc = 1;
  } else {
    inc = 1 + insn_wsize(cpu->prog[cpu->pc + 1], cpu->vers);
  }

  if (cpu->vers == CPU_VERS_AVRxm) {
    nclk = inc + 1;
  } else {
    nclk = inc;
  }

  upd->pc = cpu->pc + inc;
  upd->nclk = nclk;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbic  0x%02X,%d", Ax, b);
  return upd->nclk;
}

static int eval_SBIS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int Ax, b, inc, nclk;
  uint8_t RA;

  Ax = (insn & 0x00F8) >> 3;
  b = (insn & 0x0007);
  RA = cpu->data[Ax+cpu->iobase];

  if (RA & (1 << b)) {
    inc = 1 + insn_wsize(cpu->prog[cpu->pc + 1], cpu->vers);
  } else {
    inc = 1;
  }
  
  if (cpu->vers == CPU_VERS_AVRxm) {
    nclk = inc + 1;
  } else {
    nclk = inc;
  }

  upd->pc = cpu->pc + inc;
  upd->nclk = nclk;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbis  0x%02X,%d", Ax,b);
  return upd->nclk;
}

static int eval_SBIW(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  wreg_t Rd, Ru;
  uint16_t K;
  uint8_t sreg;

  dx = 2*((insn >> 4) & 0x0003) + 24;
  Rd.lo = cpu->regs[dx];
  Rd.hi = cpu->regs[dx+1];
  K = ((insn >> 2) & 0x0030) | (insn & 0x000F);
  sreg = CPU_SREG(cpu);

  Ru.w = Rd.w - K;

  if ((Ru.hi & 0x80) && (~Rd.hi & 0x80)) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }
  if (Ru.hi & 0x80) {
    sreg = SREG_SET_N(sreg);
  } else {
    sreg = SREG_CLR_N(sreg);
  }
  sreg = set_S(sreg);
  if (Ru.w == 0) {
    sreg = SREG_SET_Z(sreg);
  } else {
    sreg = SREG_CLR_Z(sreg);
  }
  if ((Ru.hi & 0x80) && (~Rd.hi & 0x80)) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 2;
  upd->nval = 3;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru.lo;
  upd->vals[1].tg = TG_REG;
  upd->vals[1].ix = dx + 1;
  upd->vals[1].dv = Ru.hi;
  upd->vals[2].tg = TG_DAT;
  upd->vals[2].ix = SREG_IX+cpu->iobase;
  upd->vals[2].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbiw r%d,%d", dx, K);
  return upd->nclk;
}

static int eval_SBRC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, b, inc;
  uint8_t Rd;

  dx = get_dx(insn);
  b = (insn & 0x0007);
  Rd = cpu->regs[dx];

  if (Rd & (1 << b)) {
    inc = 1;
  } else {
    inc = 1 + insn_wsize(cpu->prog[cpu->pc + 1], cpu->vers);
  }
  
  upd->pc = cpu->pc + inc;
  upd->nclk = inc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbrc  r%d,%d", dx, b);
  return upd->nclk;
}

static int eval_SBRS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, b, inc;
  uint8_t Rd;

  dx = get_dx(insn);
  b = (insn & 0x0007);
  Rd = cpu->regs[dx];

  if (Rd & (1 << b)) {
    inc = 1 + insn_wsize(cpu->prog[cpu->pc + 1], cpu->vers);
  } else {
    inc = 1;
  }
  
  upd->pc = cpu->pc + inc;
  upd->nclk = inc;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sbrs  r%d,%d", dx, b);
  return upd->nclk;
}

static int eval_SEC(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_C(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "sec");
  return upd->nclk;
}

static int eval_SEH(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_H(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "seh");
  return upd->nclk;
}

static int eval_SEI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_I(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "sei");
  return upd->nclk;
}

static int eval_SEN(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_N(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "sen");
  return upd->nclk;
}

static int eval_SES(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_S(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "ses");
  return upd->nclk;
}

static int eval_SET(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_T(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "set");
  return upd->nclk;
}

static int eval_SEV(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_V(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "sev");
  return upd->nclk;
}

static int eval_SEZ(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = SREG_SET_Z(CPU_SREG(cpu));
  if (cpu->gen_asml) asmsav0(&upd->asml, "sez");
  return upd->nclk;
}

static int eval_SLEEP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  wreg_t sp;
  uint32_t ra;
  int nv;
  
  /* push return address on the stack */
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];

  ra = cpu->pc + 1;

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 0;
  if (cpu->gen_asml) asmsav0(&upd->asml, "sleep");
  if (cpu->sleepe) cpu->asleep = 1;
  return upd->nclk;
}

static int eval_SPM(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  
  /* reprogram lock bits etc 
   * uses R1:R0 for data
   */
  
  printf("no SPM\n"); abort();
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;			/* depends on operation, actually  */
  if (cpu->gen_asml) asmsav0(&upd->asml, "spm");
  return upd->nclk;
}

static int eval_ST_(cpu_t *cpu, uint16_t insn, int _x, char _n) {
  update_t *upd = &cpu->upd;
  int dx, inc, nclk;
  uint8_t Ru;
  wreg_t R_;

  dx = get_dx(insn);
  Ru = cpu->regs[dx];
  inc = (insn & 0x0003) + 1;
  R_.lo = cpu->regs[_x+0];
  R_.hi = cpu->regs[_x+1];

  switch (cpu->vers) {
  case CPU_VERS_AVRe:
    nclk = 2;
    break;
  case CPU_VERS_AVRxt:
    nclk = 1;
    break;
  case CPU_VERS_AVRxm:
  case CPU_VERS_AVRrc:
    switch (inc) {
    case 1: nclk = 1; break;
    case 2: nclk = 1; break;
    case 3: nclk = 2; break;
    }
    break;
  default: abort(); break;
  }
    
  upd->pc = cpu->pc + 1;
  upd->nclk = nclk;
  if (inc == 3) R_.w -= 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = R_.w;
  upd->vals[0].dv = Ru;
  if (inc == 2) R_.w += 1;
  if (inc == 1) {
    upd->nval = 1;
  } else {
    upd->nval = 3;
    upd->vals[1].tg = TG_REG;
    upd->vals[1].ix = _x+0;
    upd->vals[1].dv = R_.lo;
    upd->vals[2].tg = TG_REG;
    upd->vals[2].ix = _x+1;
    upd->vals[2].dv = R_.hi;
  }
  if (cpu->gen_asml) {
    switch (inc) {
    case 1: asmsav2(&upd->asml, "st    %c,r%d", _n, dx); break;
    case 2: asmsav2(&upd->asml, "st    %c+,r%d", _n, dx); break;
    case 3: asmsav2(&upd->asml, "st    -%c,r%d", _n, dx); break;
    }
  }
  return upd->nclk;
}

static int eval_STD_(cpu_t *cpu, uint16_t insn, int _x, char _n) {
  update_t *upd = &cpu->upd;
  int dx, q, nclk;
  uint8_t Ru;
  wreg_t R_;

  dx = get_dx(insn);
  Ru = cpu->regs[dx];
  q = ((insn & 0x2000) >> 8) | ((insn & 0x0C00) >> 7) | (insn & 0x0007);
  R_.lo = cpu->regs[_x+0];
  R_.hi = cpu->regs[_x+1];

  nclk = 2;
  if (cpu->vers == CPU_VERS_AVRxt) nclk = 1;

  upd->pc = cpu->pc + 1;
  upd->nclk = nclk;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = R_.w + q;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav3(&upd->asml, "std   %c+%d,r%d", _n, q, dx);
  return upd->nclk;
}

static int eval_ST_X(cpu_t *cpu, uint16_t insn) {
  return eval_ST_(cpu, insn, REGX_IX, 'X');
}

static int eval_ST_Y(cpu_t *cpu, uint16_t insn) {
  return eval_ST_(cpu, insn, REGY_IX, 'Y');
}

static int eval_STD_Y(cpu_t *cpu, uint16_t insn) {
  return eval_STD_(cpu, insn, REGY_IX, 'Y');
}

static int eval_ST_Z(cpu_t *cpu, uint16_t insn) {
  return eval_ST_(cpu, insn, REGZ_IX, 'Z');
}

static int eval_STD_Z(cpu_t *cpu, uint16_t insn) {
  return eval_STD_(cpu, insn, REGZ_IX, 'Z');
}

static int eval_STS(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Ru;
  uint16_t k;

  assert(insn == cpu->prog[cpu->pc]);

  dx = get_dx(insn);
  Ru = cpu->regs[dx];
  k = cpu->prog[cpu->pc + 1];

  upd->pc = cpu->pc + 2;
  upd->nclk = 2;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = k;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sts   0x%x,r%d", k, dx);
  return upd->nclk;
}

static int eval_STS16(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Ru;
  uint8_t k;

  dx = ((insn & 0x00F0) >> 4) + 16;
  k = ((insn & 0x0700) >> 4) | (insn & 0x000F);

  Ru = cpu->regs[dx];

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = k;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sts   0x%x,r%d", k, dx);
  return upd->nclk;
}

static int eval_SUB(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx, rx;
  uint8_t Rd, Rr, Ru, sreg;

  dx = get_dx(insn);
  rx = get_rx(insn);
  Rd = cpu->regs[dx];
  Rr = cpu->regs[rx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - Rr;

  if (((~Rd & 0x08) && (Rr & 0x08)) ||
      ((Rr & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }

  if (((Rd & 0x80) && (~Rr & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (Rr & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  if (((~Rd & 0x80) && (Rr & 0x80)) ||
      ((Rr & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "sub   r%d,r%d", dx, rx);
  return upd->nclk;
}

static int eval_SUBI(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, K, Ru, sreg;

  dx = ((insn & 0x00F0) >> 4) + 16;
  K = ((insn & 0x0F00) >> 4) | (insn & 0x000F);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  Ru = Rd - K;
  
  if (((~Rd & 0x08) && (K & 0x08)) ||
      ((K & 0x08) && (Ru & 0x08)) ||
      ((Ru & 0x08) && (~Rd & 0x08))) {
    sreg = SREG_SET_H(sreg);
  } else {
    sreg = SREG_CLR_H(sreg);
  }

  if (((Rd & 0x80) && (~K & 0x80) && (~Ru & 0x80)) ||
      ((~Rd & 0x80) && (K & 0x80) && (Ru & 0x80))) {
    sreg = SREG_SET_V(sreg);
  } else {
    sreg = SREG_CLR_V(sreg);
  }

  sreg = set_N(sreg, Ru);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Ru);

  if (((~Rd & 0x80) && (K & 0x80)) ||
      ((K & 0x80) && (Ru & 0x80)) ||
      ((Ru & 0x80) && (~Rd & 0x80))) {
    sreg = SREG_SET_C(sreg);
  } else {
    sreg = SREG_CLR_C(sreg);
  }

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 2;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  upd->vals[1].tg = TG_DAT;
  upd->vals[1].ix = SREG_IX+cpu->iobase;
  upd->vals[1].dv = sreg;
  if (cpu->gen_asml) asmsav2(&upd->asml, "subi  r%d,0x%02X", dx, K);
  return upd->nclk;
}

static int eval_SWAP(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, Ru;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];

  Ru = ((Rd & 0xF0) >> 4) | ((Rd & 0x0F) << 4);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_REG;
  upd->vals[0].ix = dx;
  upd->vals[0].dv = Ru;
  if (cpu->gen_asml) asmsav1(&upd->asml, "swap  r%d", dx);
  return upd->nclk;
}

static int eval_TST(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  int dx;
  uint8_t Rd, sreg;

  dx = get_dx(insn);
  Rd = cpu->regs[dx];
  sreg = CPU_SREG(cpu);

  sreg = SREG_CLR_V(sreg);
  sreg = (Rd & 0x80)? SREG_SET_N(sreg): SREG_CLR_N(sreg);
  sreg = set_S(sreg);
  sreg = set_Z(sreg, Rd);
  
  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 1;
  upd->vals[0].tg = TG_DAT;
  upd->vals[0].ix = SREG_IX+cpu->iobase;
  upd->vals[0].dv = sreg;
  if (cpu->gen_asml) asmsav1(&upd->asml, "tst   r%d", dx);
  return upd->nclk;
}

static int eval_WDR(cpu_t *cpu, uint16_t insn) {
  update_t *upd = &cpu->upd;
  mcu_t *mcu = cpu->host;

  upd->pc = cpu->pc + 1;
  upd->nclk = 1;
  upd->nval = 0;
  (*(mcu->wdr))(mcu);
  if (cpu->gen_asml) asmsav0(&upd->asml, "wdr");
  return upd->nclk;
}

static int eval_intr(cpu_t *cpu, int intr_ix) {
  update_t *upd = &cpu->upd;
  uint8_t sreg;
  wreg_t sp;
  int nv, ra;

  sreg = CPU_SREG(cpu);
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];

  if (cpu->vers == CPU_VERS_AVRrc) sreg = SREG_CLR_I(sreg); /* disable */
  ra = cpu->pc;

  upd->pc = 2*intr_ix;			/* FIXME: some cpus are 1x */
  nv = 0;
  upd->vals[nv].tg = TG_DAT;
  upd->vals[nv].ix = sp.w;
  upd->vals[nv].dv = ra & 0xFF;
  nv++; sp.w--; ra >>= 8;
  upd->vals[nv].tg = TG_DAT;
  upd->vals[nv].ix = sp.w;
  upd->vals[nv].dv = ra & 0xFF;
  nv++; sp.w--; ra >>= 8;
  if (cpu->pc_22bits) {
    upd->vals[nv].tg = TG_DAT;
    upd->vals[nv].ix = sp.w;
    upd->vals[nv].dv = ra & 0x3F;
    nv++; sp.w--;
  }
  upd->vals[nv].tg = TG_DAT;
  upd->vals[nv].ix = SPL_IX+cpu->iobase;
  upd->vals[nv].dv = sp.lo;
  nv++;
  upd->vals[nv].tg = TG_DAT;
  upd->vals[nv].ix = SPH_IX+cpu->iobase;
  upd->vals[nv].dv = sp.hi;
  nv++;
  upd->vals[nv].tg = TG_DAT;
  upd->vals[nv].ix = SREG_IX;
  upd->vals[nv].dv = sreg;
  nv++;
  upd->nval = nv;
  upd->nclk = 2;
  if (cpu->gen_asml) asmsav1(&upd->asml, "INTR  %d", intr_ix);
  upd->insn_hook = cpu_intr_hook;
  return upd->nclk;
}

/* version dependencies:
 *  LDS
 *    (insn & 0xFE0F) == 0x9000  not AVRrc 32 bit 
 *    (insn & 0xF800) == 0xA000  AVRrc     16 bit 
 *  SPM
 *    (insn & 0xFFFF) == 0x95E8 AVRe
 *    (insn & 0xFFEF) == 0x95E8 AVRxm,xt
 *  STS
 *    (insn & 0xFE0F) == 0x9200  not AVRrc 32 bit
 *    (insn & 0xF800) == 0xA800  AVRrc     16 bit 
 * xmega only
 *  LAC (insn & 0xFE0F) == 0x9206
 *  LAS (insn & 0xFE0F) == 0x9205
 *  LAT (insn & 0xFE0F) == 0x9207
 */
insn_rout_t decode_insn(uint16_t insn, cpu_vers_t vers) {
  switch ((insn >> 10) & 0x3F) {
  case 0x00:
    if (insn == 0x0000) {
      return eval_NOP;
    } else if ((insn & 0x0300) == 0x0100) {
      return eval_MOVW;
    } else if ((insn & 0x0300) == 0x0200) {
      return eval_MULS;
    } else if ((insn & 0x0088) == 0x0000) {
      return eval_MULSU;
    } else if ((insn & 0x0088) == 0x0008) {
      return eval_FMUL;
    } else if ((insn & 0x0088) == 0x0080) {
      return eval_FMULS;
    } else if ((insn & 0x0088) == 0x0088) {
      return eval_FMULSU;
    }
    break;
  case 0x01:
    return eval_CPC;
    break;
  case 0x02:
    return eval_SBC;
    break;
  case 0x03:
    if (get_dx(insn) == get_rx(insn)) {
      return eval_LSL;
    } else {
      return eval_ADD;
    }
    break;
  case 0x04:
    return eval_CPSE;
    break;
  case 0x05:
    return eval_CP;
    break;
  case 0x06:
    return eval_SUB;
    break;
  case 0x07:
    if (get_dx(insn) == get_rx(insn)) {
      return eval_ROL;
    } else {
      return eval_ADC;
    }
    break;
  case 0x08:
    if (get_dx(insn) == get_rx(insn)) {
      return eval_TST;
    } else {
      return eval_AND;
    }
    break;
  case 0x09:
    if (get_dx(insn) == get_rx(insn)) {
      return eval_CLR;
    } else {
      return eval_EOR;
    }
    break;
  case 0x0a:
    return eval_OR;
    break;
  case 0x0b:
    return eval_MOV;
    break;
  case 0x0c:
  case 0x0d:
  case 0x0e:
  case 0x0f:
    return eval_CPI;
    break;
  case 0x10:
  case 0x11:
  case 0x12:
  case 0x13:
    return eval_SBCI;
    break;
  case 0x14:
  case 0x15:
  case 0x16:
  case 0x17:
    return eval_SUBI;
    break;
  case 0x18:
  case 0x19:
  case 0x1a:
  case 0x1b:
    return eval_ORI; /* and SBR */
    break;
  case 0x1c:
  case 0x1d:
  case 0x1e:
  case 0x1f:
    return eval_ANDI;
    break;
  case 0x20:
  case 0x21:
  case 0x22:
  case 0x23:
  case 0x24:
  case 0x28:
  case 0x29:
  case 0x2a:
  case 0x2b:
    if ((insn & 0xFE0F) == 0x900F) {
      return eval_POP;
    }
    else if ((insn & 0xFE0F) == 0x920F) {
      return eval_PUSH;
    }
    else if ((insn & 0xFE0F) == 0x9000) { 
      return eval_LDS;
    }
    else if (((insn & 0xF800) == 0xA000) && (vers == CPU_VERS_AVRrc)) {
      return eval_LDS16;
    }
    else if ((insn & 0xFE0F) == 0x9200) {
      return eval_STS;
    }
    else if (((insn & 0xF800) == 0xA800) && (vers == CPU_VERS_AVRrc)) { 
      return eval_STS16;
    }
    else if (insn == 0x95C8) {
      return eval_LPM_1;
    }
    else if ((insn & 0xFE0F) == 0x9004) {
      return eval_LPM_2;
    } 
    else if ((insn & 0xFE0F) == 0x9005) {
      return eval_LPM_3;
    } 
    else if (insn == 0x95D8) {
      return eval_ELPM_1;
    } 
    else if ((insn & 0xFE0F) == 0x9006) {
      return eval_ELPM_2;
    } 
    else if ((insn & 0xFE0F) == 0x9007) {
      return eval_ELPM_3;
    } 
    else if (((insn & 0xFE0E) == 0x900C) ||
	     ((insn & 0xFE0F) == 0x900E)) {
      return eval_LD_X;
    }
    else if (((insn & 0xFE0F) == 0x8008) ||
	     ((insn & 0xFE0F) == 0x9009) ||
	     ((insn & 0xFE0F) == 0x900A)) {
      return eval_LD_Y;
    }
    else if (((insn & 0xD208) == 0x8008) && (vers != CPU_VERS_AVRrc)) {
      return eval_LDD_Y;
    }
    else if (((insn & 0xFE0F) == 0x8000) ||
	     ((insn & 0xFE0F) == 0x9001) ||
	     ((insn & 0xFE0F) == 0x9002)) {
      return eval_LD_Z;
    }
    else if (((insn & 0xD208) == 0x8000) && (vers != CPU_VERS_AVRrc)) {
      return eval_LDD_Z;
    }
    else if (((insn & 0xFE0F) == 0x920C) ||
	     ((insn & 0xFE0F) == 0x920D) ||
	     ((insn & 0xFE0F) == 0x920E)) {
      return eval_ST_X;
    }
    else if (((insn & 0xFE0F) == 0x8208) ||
	     ((insn & 0xFE0F) == 0x9209) ||
	     ((insn & 0xFE0F) == 0x920A)) {
      return eval_ST_Y;
    }
    else if (((insn & 0xD208) == 0x8208) && (vers != CPU_VERS_AVRrc)) {
      return eval_STD_Y;
    }
    else if (((insn & 0xFE0F) == 0x8200) ||
	     ((insn & 0xFE0F) == 0x9201) ||
	     ((insn & 0xFE0F) == 0x9202)) {
      return eval_ST_Z;
    }
    else if (((insn & 0xD208) == 0x8200) && (vers != CPU_VERS_AVRrc)) {
      return eval_STD_Z;
    }
    break;
  case 0x25:
    switch (insn & 0x03FF) {
    case 0x008: return eval_SEC; break;
    case 0x009: return eval_IJMP; break; 
    case 0x018: return eval_SEZ; break; 
    case 0x019: return eval_EIJMP; break; 

    case 0x028: return eval_SEN; break; 
    case 0x038: return eval_SEV; break; 
    case 0x048: return eval_SES; break; 
    case 0x058: return eval_SEH; break; 
    case 0x068: return eval_SET; break; 
    case 0x078: return eval_SEI; break; 
      //^ all above: return eval_BSET; /* 1001 0100 0sss 1000 */

    case 0x088: return eval_CLC; break; 
    case 0x098: return eval_CLZ; break; 
    case 0x0A8: return eval_CLN; break; 
    case 0x0B8: return eval_CLV; break; 
    case 0x0C8: return eval_CLS; break; 
    case 0x0D8: return eval_CLH; break; 
    case 0x0E8: return eval_CLT; break; 
    case 0x0F8: return eval_CLI; break; 
      //^ all above: return eval_BCLR; /* 1001 0100 1sss 1000 */

    case 0x00B: case 0x01B: case 0x02B: case 0x03B:
    case 0x04B: case 0x05B: case 0x06B: case 0x07B:
    case 0x08B: case 0x09B: case 0x0AB: case 0x0BB:
    case 0x0CB: case 0x0DB: case 0x0EB: case 0x0FB:
      return eval_DES;
      break;

    case 0x108: return eval_RET; break;
    case 0x109: return eval_ICALL; break;
    case 0x118: return eval_RETI; break;
    case 0x119: return eval_EICALL; break;
    case 0x188: return eval_SLEEP; break;
    case 0x198: return eval_BREAK; break;
    case 0x1A8: return eval_WDR; break;
    case 0x1C8: return eval_LPM_1; break;
    case 0x1D8: abort(); break;
    case 0x1E8: case 0x1F8: return eval_SPM; break;

    default:
      if ((insn & 0x0300) == 0x0200) {
	return eval_ADIW;
      } else if ((insn & 0x0300) == 0x0300) {
	return eval_SBIW;
      } else {
	switch (insn & 0x000F) {
	case 0x0: return eval_COM; break;
	case 0x1: return eval_NEG; break;
	case 0x2: return eval_SWAP; break;
	case 0x3: return eval_INC; break;
	case 0x5: return eval_ASR; break;
	case 0x6: return eval_LSR; break;
	case 0x7: return eval_ROR; break;
	case 0xA: return eval_DEC; break;
	case 0xC: case 0xD: return eval_JMP; break;
	case 0xE: case 0xF: return eval_CALL; break;
	default: abort(); break;
	}
      }
      break;
    }
    break;

  case 0x26:
    switch ((insn & 0x0300) >> 8) {
    case 0x0: return eval_CBI ; break;
    case 0x1: return eval_SBIC; break;
    case 0x2: return eval_SBI ; break;
    case 0x3: return eval_SBIS; break;
    }
    break;
  case 0x27:
    return eval_MUL;
    break;
  case 0x2c:
  case 0x2d:
    return eval_IN;
    break;
  case 0x2e:
  case 0x2f:
    return eval_OUT;
    break;
  case 0x30:
  case 0x31:
  case 0x32:
  case 0x33:
    return eval_RJMP;
    break;
  case 0x34:
  case 0x35:
  case 0x36:
  case 0x37:
    return eval_RCALL;
    break;
  case 0x38:
  case 0x39:
  case 0x3a:
  case 0x3b:
    return eval_LDI;
    break;
  case 0x3c:
    switch (insn & 0x0007) {
    case 0x0: return eval_BRCS; break;
    case 0x1: return eval_BREQ; break;
    case 0x2: return eval_BRMI; break;
    case 0x3: return eval_BRVS; break;
    case 0x4: return eval_BRLT; break;
    case 0x5: return eval_BRHS; break;
    case 0x6: return eval_BRTS; break;
    case 0x7: return eval_BRIE; break;
    default: abort(); break;
    };
    break;
  case 0x3d:
    switch (insn & 0x0007) {
    case 0x0: return eval_BRCC; break;
    case 0x1: return eval_BRNE; break;
    case 0x2: return eval_BRPL; break;
    case 0x3: return eval_BRVC; break;
    case 0x4: return eval_BRGE; break;
    case 0x5: return eval_BRHC; break;
    case 0x6: return eval_BRTC; break;
    case 0x7: return eval_BRID; break;
    }
    break;
  case 0x3e:
    if (insn & 0x0200) {
      return eval_BST;
    } else {
      return eval_BLD;
    }
    break;
  case 0x3f:
    if (0) { // (insn == 0xFFFF) {
      return eval_brkpt;
    } else if ((insn & 0x0208) == 0x0000) {
      return eval_SBRC;
    } else if ((insn & 0x0208) == 0x0200) {
      return eval_SBRS;
    } else if (vers == CPU_VERS_AVRxm) {
      if ((insn & 0x020F) == 0x9206) {
	return eval_LAC;
      } else if ((insn & 0x020F) == 0x9205) {
	return eval_LAS;
      } else if ((insn & 0x020F) == 0x9207) {
	return eval_LAT;
      }
    }
    break;
  default:
    abort();
    break;
  }
  return 0;
}

uint32_t cpu_next_pc(cpu_t *cpu, uint32_t pc) {
  uint16_t insn = cpu->prog[pc];
  int bpid;

  if (insn == BREAK_INSN) {
    bpid = brkpt_at(cpu, pc);
    insn = cpu->brkpts[bpid].insn;
  }
  if ((insn & 0xFE0E) == 0x940E) {	/* CALL */
    return pc + 2;
  } else if (((insn & 0xFFEF) == 0x9509) || /* EICALL,ICALL */
	     ((insn & 0xF000) == 0xD000)) { /* RCALL */
    return pc + 1;
  } else {
    return cpu->upd.pc;
  }
}

void disp_sreg(cpu_t *cpu) {
  uint8_t sreg = CPU_SREG(cpu);
  if (sreg & 0x80) printf("I"); else printf("-");
  if (sreg & 0x40) printf("T"); else printf("-");
  if (sreg & 0x20) printf("H"); else printf("-");
  if (sreg & 0x10) printf("S"); else printf("-");
  if (sreg & 0x08) printf("V"); else printf("-");
  if (sreg & 0x04) printf("N"); else printf("-");
  if (sreg & 0x02) printf("Z"); else printf("-");
  if (sreg & 0x01) printf("C"); else printf("-");
}

void cpu_disp_regs(cpu_t *cpu) {
  wreg_t sp;

  printf(" ");
  for (int i = 0; i < 2; i++) printf(" %02d", i);
  for (int i = 8; i < 26; i++) printf(" %02d", i);
  printf(" --X-- --Y-- --Z--\n");
  printf(" ");
  for (int i = 0; i < 2; i++) printf(" %02X", cpu->regs[i]);
  for (int i = 8; i < 26; i++) printf(" %02X", cpu->regs[i]);
  for (int i = 26; i < 32; i++) printf(" %02X", cpu->regs[i]);
  printf("\n");
  printf("  "); disp_sreg(cpu);
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];
  printf(" sp=%04X  S:", sp.w);
  sp.lo = cpu->data[SPL_IX+cpu->iobase];
  sp.hi = cpu->data[SPH_IX+cpu->iobase];
  for (int i = 0; i < 19; i++) printf(" %02X", cpu->data[sp.w+i]);
  printf("\n");
}

void cpu_disp_data(cpu_t *cpu, int addr) {
  for (int i = 0; i < 4; i++) {
    printf("%04X ", addr);
    for (int j = 0; j < 8; j++) printf(" %02X", cpu->data[addr++]);
    printf(" ");
    for (int j = 8; j < 16; j++) printf(" %02X", cpu->data[addr++]);
    printf("\n");
  }
  printf("\n");
}

void cpu_disp(cpu_t *cpu) {
  tkclk_t *tkclk = &cpu->clk_cpu;
  simtime_t ts = tkclk->osc->time;
  char buf[ASM_LINSIZ];
  int am = cpu->show_ba? 2: 1;
  uint16_t hval = ((uintptr_t) cpu / 0x10000) % 0x10000;
  
  printf("%02d.%09d cpu: %04x\n", ts.sec, ts.nsec, hval);
  cpu_disp_regs(cpu);
  if (cpu->gen_asml && cpu->upd.asml.fmt) {
    asmstrf(&cpu->upd.asml, cpu->show_ba, buf, sizeof(buf));
    printf("  %4x %s\n\n", am*cpu->pc, buf);
  } else {
    printf("  %4x %4x\n\n", am*cpu->pc, cpu->prog[cpu->pc]);
   }
}

static volatile int foo_v = 0;
static int foo() { foo_v = 1; }

/* latch update register, compute next update, return number of clocks
 * This should also deal with write to and reads from I/O registers.
 * maybe split this into execute at tick-Neps and decode at tick+Meps
 */
int cpu_exec(cpu_t *cpu) {
  update_t *upd = &cpu->upd;
  mcu_t *host = cpu->host;
  updval_t *val;
  insn_rout_t rout;
  uint16_t insn;
  uint8_t dv, mk;
  int nclk, ix, ivec;
  int do_intr;				/* handle interrupt */

  RUN_HOOK(cpu_pre_exec, cpu);
  
  if (cpu->ccp_cnt > 0) {
    cpu->ccp_cnt--;
    if (cpu->asleep) cpu->ccp_cnt = 0;
    if (cpu->ccp_cnt == 0) CPU_CCP(cpu) = 0;
  }

  /* Execute instruction. */
  if (!cpu->asleep) {
    if (upd->insn_hook) RUN_HOOK(upd->insn, cpu);
    cpu->pc = upd->pc;
    for (int i = 0; i < upd->nval; i++) {
      val = &upd->vals[i];
      ix = val->ix;
      dv = val->dv;
      switch (val->tg) {
      case TG_REG: cpu->regs[ix] = dv; break;
      case TG_DAT: cpu->ccp_cnt = 1; mcu_wr(host, ix, dv); break;
      case TG_IOB: mcu_bs(host, ix, dv, val->mk); break;
      default: abort(); break;
      }
    }
  }
      
  /* Check interrupt state. */
  ivec = mcu_next_ivec(host);
  do_intr = ivec && (CPU_SREG(cpu) & 0x80);
  if (cpu_like_xm(cpu))
    do_intr = do_intr & (CPU_CCP(cpu) == 0) && (cpu->inisr == 0);

  /* See 4809 datasheet, 13.2: service intr after one insn executed. */
  if ((upd->insn == RETI_INSN) && (cpu_like_xm(cpu))) {
    mcu_ia(cpu->host, -1);		/* tell per RETI - needed? */
    cpu->inisr = 0;
    if (mcu_next_ivec(host)) foo();
  }
  
  RUN_HOOK(cpu_post_exec, cpu);
  
  /* Fetch/decode next instruction, unless interrupt pending, or asleep. */
  if (do_intr) {
    cpu->asleep = 0;
    upd->insn = INTR_INSN;
    nclk = eval_intr(cpu, ivec);
    #if 0
    if (cpu->brkintr) {
      /* TODO: cleanup */
      if (cpu->prog[brkpt[0]->pc] == BREAK_INSN)
	brkpt_unset(cpu, 0); 
      brkpt_set(cpu, 0, ivec*2);	/* FIXME: *2 */
    }
    #endif
    cpu->inisr = 1;			/* in ISR */
    mcu_ia(host, ivec);			/* ack intr */
  } else if (cpu->asleep) {
    nclk = 1;
  } else {
    insn = cpu->prog[cpu->pc];
    rout = decode_insn(insn, cpu->vers);
    memset(&cpu->upd, 0, sizeof(update_t));
    upd->insn = insn;
    nclk = (rout)(cpu, insn);
  }
  
  RUN_HOOK(cpu_post_fetch, cpu);
  
  return nclk;
}

void cpu_tick_evt(void *arg, tkclk_t *clk) {
  cpu_t *cpu = arg;
  int nclk;
  tkevt_t *evt;

  nclk = cpu_exec(cpu);
  if (cpu->trace) cpu_disp(cpu);
  
  if (nclk == 0) {			/* breakpoint */
    evt = tkclk_sched(clk, 0, NEPS_BREAK, tkosc_break_evt, cpu);
    nclk = cpu->upd.nclk;
  }
  cpu->xevt = tkclk_sched(clk, nclk, NEPS_CPU, cpu_tick_evt, cpu);
  cpu->xevt->name = __func__;
}

static uint8_t xtoi(char c) {
  return (c <= '9')? c - '0': c - 'A' + 10;
}

static uint8_t cnvt_pair(uint8_t *buf) {
  return (xtoi(buf[0]) << 4) | xtoi(buf[1]);
}    

int cpu_load_hex(cpu_t *cpu, char *filename) {
  int fd, n, rt;
  uint16_t sect, addr;
  uint8_t buf[8], *text, val, csum, nv;
  
  if (access(filename, R_OK) != 0) { printf("no file\n"); abort(); }
  fd = open(filename, O_RDONLY);
  if (fd < 0) return -1;

  text = (uint8_t*) cpu->prog;
  while (1) {
    csum = 0;
    if (read(fd, buf, 1) < 1) break;
    if (buf[0] != ':') return -1;
    if (read(fd, buf, 2) == 0) return -1;
    nv = cnvt_pair(buf); csum += nv;	/* number of bytes */
    if (read(fd, buf, 2) != 2) return -1;
    addr = cnvt_pair(buf); csum += addr;
    if (read(fd, buf, 2) != 2) return -1;
    val = cnvt_pair(buf); csum += val;
    addr = (addr << 8) | val;		/* address */
    if (read(fd, buf, 2) != 2) return -1;
    rt = cnvt_pair(buf); csum += rt;	/* record type */
    // rt==1 nv==0 => EOF
    if (rt == 4) sect = 0;
    for (int j = 0; j < nv; j++) {
      if (read(fd, buf, 2) != 2) return -1;
      val = cnvt_pair(buf); csum += val;
      switch (rt) {
      case 0:
        if (addr >= 0x800000) { /* flash */
          printf("need help\n"); 
        } else {
          text[addr++] = val;
        }
        break;
      case 4:
        sect = sect << 8;
        sect |= val;
        break;
      default:
	printf("cpu_load_hex: missed record type: %d\n", rt);
	abort();
        break;
      }
    }
    if (read(fd, buf, 2) != 2) return -1;
    val = cnvt_pair(buf); val = (~val) + 1; /* checksum */
    if (val != csum) return -1;
    if (read(fd, buf, 2) != 2) return -1;
    assert((buf[0] == '\r') && (buf[1] == '\n'));
    if (rt == 1) break;
  }
  close(fd);

  return 0;
}

int cpu_load_program(cpu_t *cpu, char *filename) {
  char *tail;

  tail = rindex(filename, '.');
  if (tail == 0) {
    abort();
  } else if (strcmp(tail, ".hex") == 0) {
    return cpu_load_hex(cpu, filename);
  } else {
    abort();
  }
}
  
void cpu_reset(cpu_t *cpu) {
  uint16_t insn;
  int nclk;
  insn_rout_t rout;
  tkclk_t *clk = &cpu->clk_cpu;

  if (cpu->xevt) {
    tkclk_cancel(clk, cpu->xevt);
    cpu->xevt = 0;
  }
  
  cpu->pc = 0;
  //cpu->imsk = 0;

  insn = cpu->prog[cpu->pc];
  rout = decode_insn(insn, cpu->vers);
  if (rout == 0) myabort();
  memset(&cpu->upd, 0, sizeof(update_t));
  nclk = (rout)(cpu, insn);

  cpu->xevt = tkclk_sched(clk, 1, NEPS_CPU, cpu_tick_evt, cpu);
  cpu->xevt->name = "cpu_tick_evt";
}

/* =============== */

/* hmm.  We should probably pass the size here.
 */
cpu_t *make_raw_cpu(uint16_t *prog, uint8_t *data) {
  mcu_t *mcu = malloc(sizeof(mcu_t)+32);
  cpu_t *cpu = &mcu->cpu;

  memset(mcu, 0, sizeof(mcu_t));
  mcu->rd = def_rd;
  mcu->wr = def_wr;
  mcu->bs = def_bs;
  mcu->ir = def_ir;
  mcu->ia = def_ia;

  memset(&mcu->cpu, 0, sizeof(cpu_t));
  cpu->vers = CPU_VERS_AVRxt;		/* FIXME */
  cpu->show_ba = 1;
  cpu->host = mcu;
  cpu->regs = (uint8_t*)mcu + sizeof(mcu_t);
  cpu->prog = prog;
  cpu->data = data;
  
  return cpu;
}

void free_raw_cpu(cpu_t *cpu) {
  free(cpu->host);
}

void cpu_set_pc(cpu_t *cpu, uint32_t pc) {
  cpu->pc = pc;
}

uint32_t cpu_get_pc(cpu_t *cpu) {
  return cpu->pc;
}

uint16_t cpu_get_insn(cpu_t *cpu) { return cpu->prog[cpu->pc]; }

void cpu_set_trace(cpu_t *cpu) { cpu->trace = 1; }
void cpu_clr_trace(cpu_t *cpu) { cpu->trace = 0; }

#if 0
uint64_t cpu_get_iv(cpu_t *cpu) { return cpu->imsk; }

uint64_t cpu_set_iv(cpu_t *cpu, uint32_t iv) {
  cpu->imsk |= (1 << iv);
  return cpu->imsk;
}

uint32_t cpu_clr_iv(cpu_t *cpu, uint32_t iv) {
  cpu->imsk &= ~(1 << iv);
  return cpu->imsk;
}
#endif

void cpu_sei(cpu_t *cpu) {
  cpu->data[SREG_IX] = SREG_SET_I(cpu->data[SREG_IX]);
}

void cpu_cli(cpu_t *cpu) {
  cpu->data[SREG_IX] = SREG_CLR_I(cpu->data[SREG_IX]);
}

/* @deffn {C} char *cpu_show_insn(cpu_t *cpu, int ba, char *buf)
 * ba= 0: word address, 1:byte address
 * buf should be 
 * @end deffn
 */
char *cpu_show_insn_(cpu_t *cpu, int show_ba, char *buf, size_t bsiz) {
  insn_rout_t rout;
  uint16_t insn;
  int nclk, show;

  //if (cpu->pc >= 80) { cpu->gen_asml = 0; }  WTF?
  insn = cpu->prog[cpu->pc];
  rout = decode_insn(insn, cpu->vers);
  if (rout == 0) return 0;
  show = cpu->gen_asml;
  cpu->gen_asml = 1;
  nclk = (rout)(cpu, insn);
  cpu->pc += insn_wsize(insn, cpu->vers);
  asmstrf(&cpu->upd.asml, show_ba, buf, bsiz);
  return buf;
}
char *cpu_show_insn(cpu_t *cpu, int show_ba) {
  static char buf[ASM_LINSIZ];
  return cpu_show_insn_(cpu, show_ba, buf, sizeof(buf));
}

#if 0
/* === cpu data logging ======================= */

void cdl_init(cpu_t *cpu) {
  if (cpu->logs != 0) free(cpu->logs);
  cpu->logs = malloc(CDL_ENT_NDEF*sizeof(cdl_ent_t));
  cpu->mlog = CDL_ENT_NDEF;
  cpu->nlog = 0;
  memset(cpu->logs, 0, CDL_ENT_NDEF*sizeof(cdl_ent_t));
}


cdl_ent_t *cdl_add_ent(cpu_t *cpu, const char *name, int8_t code, uint16_t dim,
		       uint16_t addr, const char *comm) {
  cdl_ent_t *ent;

  if (cpu->logs == 0) return 0;
  if (cpu->nlog >= cpu->mlog) return 0;
  ent = &cpu->logs[cpu->nlog++];
  ent->name = name;
  ent->code = code;
  ent->dim = dim;
  ent->comm = comm;
  return ent;
}
#endif

/* --- last line --- */

