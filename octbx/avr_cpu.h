/* avr_cpu.h
 * 
 * Copyright (C) 2019-2023 Matthew R. Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef AVR_CPU_H_
#define AVR_CPU_H_

#include <stdint.h>
#include "sched.h"

#define REG0_IX 0
#define REG1_IX 1
#define REGX_IX 26
#define REGY_IX 28
#define REGZ_IX 30

#define SREG_IX	0x3F
#define SPH_IX	0x3E
#define SPL_IX	0x3D
#define CCP_IX	0x34

#define TG_REG	1			/* target is register space */
#define TG_DAT	2			/* target is data space */
#define TG_IOB	3			/* target is I/O bit */

#ifndef NBRKPT
#define NBRKPT 8
#endif
#define BREAK_INSN 0x9598

#define ASM_LINSIZ 64			/* buffer size for asmline */

typedef enum {
  CPU_VERS_UNKNOWN,
  CPU_VERS_AVR,			/* original insn set */
  CPU_VERS_AVRe,		/* adds movw and lpm */
  CPU_VERS_AVRep,		/* i.e., AVRe+, adds mul */
  CPU_VERS_AVRxm,		/* adds rmw and des */
  CPU_VERS_AVRxt,		/* modified eP,xm but faster */
  CPU_VERS_AVRrc,		/* reduced, e.g., 16 registers */
} cpu_vers_t;

#define CPU_SREG(CPU)		((CPU)->data[SREG_IX+(CPU)->iobase])
#define CPU_CCP(CPU)		((CPU)->data[CCP_IX+(CPU)->iobase])

typedef struct brkpt {
  uint32_t pc;				/* word address */
  uint16_t insn;			/* instruction saved */
  uint16_t _pad;
} brkpt_t;

/* cpu update */
typedef struct updval {
  uint16_t ix;				/* addr */
  uint8_t dv;				/* data */
  uint8_t mk;				/* I/O mask */
  struct {
    uint8_t tg: 2;			/* target: 0:reg 1:data */
  };
} updval_t;
  
typedef struct asmline {
  const char *fmt;
  int narg;
  int args[3];
} asmline_t;

struct cpu;

typedef struct update {
  uint32_t pc;				/* PC after this insn */
  int nclk;				/* must be signed int */
  uint8_t nval;
  updval_t vals[8];
  uint8_t bpid;				/* breakpoint */
  uint16_t insn;			/* instruction */
  asmline_t asml;
  void (*insn_hook)(struct cpu *);
} update_t;

struct mcu;

typedef struct cpu {
  struct mcu *host;			/* host mcu */
  struct {
    uint8_t gen_asml :1;		/* gen adm for disp */
    uint8_t show_ba :1;			/* disp byte addr */
    uint8_t pc_22bits :1;		/* PC is 22 bits */
    uint8_t trace :1;			/* trace instructions */
    uint8_t asleep :1;			/* processor asleep */
    uint8_t sleepe :1;			/* sleep enabled */
    uint8_t inisr: 1;			/* ISR in progress */
    uint8_t brkintr: 1;			/* break on interrupt */ 
  };
  cpu_vers_t vers;		       /* version, to replace xmega */
  uint8_t iobase;		       /* IO base: 0 or 0x20 */
  struct {
    uint16_t RAMPX_IX;
    uint16_t RAMPY_IX;
    uint16_t RAMPZ_IX;
    uint16_t RAMPD_IX;
  };
  uint16_t EIND_IX;
  tkclk_t clk_cpu;			/* cpu clock */
  uint8_t ccp_cnt;			/* if > 0, insn OK */
  //tksch_t *asy_clk;			/* async clock */
  tkevt_t *xevt;
  //uint64_t imsk;			/* interrupt mask */
  uint32_t pc;				/* covers 16 bit also */
  update_t upd;				/* inst exec update */
  uint8_t *regs;			/* register space */
  uint16_t *prog;			/* address space */
  uint8_t *data;			/* data space */
  uint8_t *onio;			/* on I/O event map */
  uint16_t progsize;			/* text size in 16bit words */
  uint16_t datasize;			/* data size */
  brkpt_t brkpts[NBRKPT];
} cpu_t;

typedef int (*insn_rout_t)(cpu_t *cpu, uint16_t insn);

static inline int cpu_like_xm(cpu_t *cpu) {
  return ((cpu)->vers == CPU_VERS_AVRxm) || ((cpu)->vers == CPU_VERS_AVRxt);
}

int cpu_load_program(cpu_t *cpu, char *filename);
void cpu_tick_evt(void *arg, tkclk_t *clk);

insn_rout_t decode_insn(uint16_t insn, cpu_vers_t vers);

uint32_t cpu_next_pc(cpu_t *cpu, uint32_t addr);
int insn_wsize(uint16_t insn, cpu_vers_t vers);


static uint8_t cpu_sreg(cpu_t *cpu) {
  return cpu->data[SREG_IX+cpu->iobase];
}

int cpu_intr(cpu_t *cpu, int intr_ix);
void cpu_reset(cpu_t *cpu);

void cpu_disp_regs(cpu_t *cpu);
void cpu_disp_data(cpu_t *cpu, int addr);
void cpu_disp(cpu_t *cpu);

int asmstrf(asmline_t *, int show_ba, char *buf, int bufsiz);

/* breakpoints */
void brkpt_init(brkpt_t *brkpts, int nbrkpt);
int brkpt_alloc(cpu_t *cpu);
void brkpt_dealloc(cpu_t *cpu, int ix);
void brkpt_set(cpu_t *cpu, int ix, uint32_t pc);
uint16_t brkpt_unset(cpu_t *cpu, int ix);
void brkpt_reset(cpu_t *cpu, int ix);
int brkpt_at(cpu_t *cpu, uint32_t pc);

int add_brkpt(cpu_t *cpu, uint32_t pc_ba);
int rem_brkpt(cpu_t *cpu, uint32_t pc_ba);

/* watchpoints -- not implemented */
void wchpt_init(void);
int wchpt_alloc(cpu_t *cpu);
void wchpt_dealloc(int ix);
void wchpt_set(int ix, uint16_t addr);
uint16_t wchpt_unset(int ix);

int add_wchpt(cpu_t *cpu, uint16_t addr);
int del_wchpt(cpu_t *cpu, uint16_t addr);

/* for elfen tool: */
cpu_t *make_raw_cpu(uint16_t *prog, uint8_t *data);
void cpu_set_pc(cpu_t *cpu, uint32_t pc);
uint32_t cpu_get_pc(cpu_t *cpu);
uint16_t cpu_get_insn(cpu_t *cpu);
char *cpu_show_insn(cpu_t *cpu, int show_ba);

static inline void cpu_ccp_wr(cpu_t *cpu, uint8_t val) {
  switch (val) {
  case 0x9D: CPU_CCP(cpu) |= 0x02; break; /* SPM write OK */
  case 0xD8: CPU_CCP(cpu) |= 0x01; break; /* IOREG write OK */
  default: break;
  }
  cpu->ccp_cnt = 4;
}

void cpu_sei(cpu_t *cpu);
void cpu_cli(cpu_t *cpu);
void cpu_set_trace(cpu_t *cpu);
void cpu_clr_trace(cpu_t *cpu);

#endif
/* --- last line --- */
