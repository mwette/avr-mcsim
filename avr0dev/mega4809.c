/* mega4809.c
 * 
 * Copyright (C) 2020-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>			/* write() */
#include <errno.h>			/* read() => errno */

#include "octbx.h"
#include "avr0per.h"
#include "mega4809.h"

/* === basics ======================= */

mcu_t *make_mega4809(tmsch_t *tmsch) {
  mcu_t *mcu = malloc(sizeof(mega4809_t));
  mega4809_init(mcu, tmsch);
  return mcu;
}

#define NO_DRIFT 0

/*
 * iobase: if AVR_ARCH >= 100: 0; else: 0x20
 * $ avr-gcc -c -B.. -mmcu=atmega4809 -dM -E - </dev/null | grep AVR_ARCH
 * #define __AVR_ARCH__ 103
 */
void mega4809_init(void* _mcu, tmsch_t *tmsch) {
  mega4809_t *mega = _mcu;
  mcu_t *mcu;
  cpu_t *cpu;
  tkosc_t *tkosc;
  tkclk_t *tkclk;

  /* Right now parent make_mcu() does load program and reset.
   * So make sure ...
   */
#if NO_DRIFT
  printf("mega4809 w/ no clock drift\n");
#endif
 
  memset(mega, 0, sizeof(mega4809_t));
  mcu = &mega->base;
  mcu->rt = mega4809_rt;
  mcu->rd = mega4809_rd;
  mcu->wr = mega4809_wr;
  mcu->bs = mega4809_bs;
  mcu->ir = def_ir;
  mcu->ia = mega4809_ia;
  mcu->wdr = mega4809_wdr;
  mcu->pn = mega4809_pn;

  cpu = &mcu->cpu;
  cpu->show_ba = 1;
  cpu->vers = CPU_VERS_AVRxt;
  cpu->regs = mega->regs;
  cpu->prog = mega->prog;
  cpu->progsize = sizeof(mega->prog)/2;
  cpu->data = mega->data;
  cpu->datasize = sizeof(mega->data);
  cpu->onio = mega->onio;
  cpu->iobase = 0;
  cpu->EIND_IX = 0;
  cpu->RAMPZ_IX = 0;
  cpu->host = mcu;

  tkosc = &mcu->osc20m;
  tkosc_init(tkosc, tmsch);
  tkosc->tick_per = 0.05e-6;		/* 20.0 MHz */
  tkosc->allan_dev = 80.0e-6;		/* Allan deviaion (ppu) */
  tkosc->drift_dev = 30.0e-6;		/* (thermal) drift deviaion (ppu) */
  tkosc->drift_rate = 1/3600.0;		/* 1 / drift time constant (s-1) */
#if NO_DRIFT
  tkosc->allan_dev = 0.0e-6;		/* Allan deviaion (ppu) */
  tkosc->drift_dev = 0.0e-6;		/* (thermal) drift deviaion (ppu) */
#endif
  
  tkosc = &mcu->osculp32k;
  tkosc_init(tkosc, tmsch);
  tkosc->tick_per = 30.51757813e-6;	/* 32768 Hz */
  tkosc->allan_dev = 80.0e-6;
  tkosc->drift_dev = 30.0e-6;
  tkosc->drift_rate = 1/3600.0;
#if NO_DRIFT
  tkosc->allan_dev = 0.0e-6;		/* Allan deviaion (ppu) */
  tkosc->drift_dev = 0.0e-6;		/* (thermal) drift deviaion (ppu) */
#endif

  tkosc = &mcu->xosc32k;		/* FIXME: external hookup */
  tkosc_init(tkosc, tmsch);
  tkosc->tick_per = 30.51757813e-6;	/* 32768 Hz */
  tkosc->allan_dev = 8.0e-6;
  tkosc->drift_dev = 30.0e-6;
  tkosc->drift_rate = 1/3600.0;
#if NO_DRIFT
  tkosc->allan_dev = 0.0e-6;		/* Allan deviaion (ppu) */
  tkosc->drift_dev = 0.0e-6;		/* (thermal) drift deviaion (ppu) */
#endif

  // vport_init(&mega->vportA, mcu, 0x0000);
  // vport_init(&mega->vportB, mcu, 0x0004);
  // vport_init(&mega->vportC, mcu, 0x0008);
  // vport_init(&mega->vportD, mcu, 0x000C);
  // vport_init(&mega->vportE, mcu, 0x0010);
  // vport_init(&mega->vportF, mcu, 0x0014);
  rstctrl_init(&mega->rstctrl, mcu, 0x0040);
  // slpctrl_init(&mega->slpctrl, mcu, 0x0050);
  clkctrl_init(&mega->clkctrl, mcu, 0x0060);
  // bod_init(&mega->bod, mcu, 0x0080);
  // vref_init(&mega->vref, mcu, 0x00A0);
  wdt_init(&mega->wdt, mcu, 0x0100);
  cpuint_init(&mega->base.cpuint, mcu, 0x0110);
  // crcscan_init(&mega->crcscan, mcu, 0x0120);
  // rtc_init(&mega->rtc, mcu, 0x0140);
  // evsys_init(&mega->evsys, mcu, 0x0180);
  // ccl_init(&mega->ccl, mcu, 0x01C0);
  port_init(&mega->portA, mcu, 0x0400);
  port_init(&mega->portB, mcu, 0x0420);
  port_init(&mega->portC, mcu, 0x0440);
  port_init(&mega->portD, mcu, 0x0460);
  port_init(&mega->portE, mcu, 0x0480);
  port_init(&mega->portF, mcu, 0x04A0);
  // portmux_init(&mega->portmux, mcu, 0x05E0);
  adc_init(&mega->adc0, mcu, 0x0600);
  // ac_init(&mega->ac0, mcu, 0x0680);
  usart_init(&mega->usart0, mcu, 0x0800);
  usart_init(&mega->usart1, mcu, 0x0820);
  usart_init(&mega->usart2, mcu, 0x0840);
  usart_init(&mega->usart3, mcu, 0x0860);
  twi_init(&mega->twi0, mcu, 0x08A0);
  // spi_init(&mega->spi0, mcu, 0x08C0);
  tca_init(&mega->tca0, mcu, 0x0A00);
  tcb_init(&mega->tcb0, mcu, 0x0A80);
  tcb_init(&mega->tcb1, mcu, 0x0A90);
  tcb_init(&mega->tcb2, mcu, 0x0AA0);
  tcb_init(&mega->tcb3, mcu, 0x0AB0);
  syscfg_init(&mega->syscfg, mcu, 0x0F00);
  // nvmctrl_init(&mega->nvmctrl, mcu, 0x1000);
  // sigrow_init(&mega->sigrow, mcu, 0x1100);
  // fuse_init(&mega->fuse, mcu, 0x1280);
  // lockbit_init(&mega->lockbit, mcu, 0x128A);
  // userrow_init(&mega->userrow, mcu, 0x1300);
  
  /* interrupt vectors */
  mega->wdt.reset_vn = 0;
  mega->portA.port_vn = 6;
  mega->tca0.ovf_vn = 7;
  mega->tca0.lunf_vn = 7;
  mega->tca0.hunf_vn = 8;
  mega->tca0.lcmp0_vn = 9;
  mega->tca0.cmp0_vn = 9;
  mega->tca0.cmp1_vn = 10;
  mega->tca0.lcmp1_vn = 10;
  mega->tca0.cmp2_vn = 11;
  mega->tca0.lcmp2_vn = 11;
  mega->tcb0.int_vn = 12;
  mega->tcb1.int_vn = 13;
  mega->twi0.twis_vn = 14;
  mega->twi0.twim_vn = 15;
  // mega->spi0.int_vn = 16;
  mega->usart0.rxc_vn = 17;
  mega->usart0.dre_vn = 18;
  mega->usart0.txc_vn = 19;
  mega->portD.port_vn = 20;
  // mega->ac0.ac_vn = 21;
  mega->adc0.resrdy_vn = 22;
  mega->adc0.wcomp_vn = 23;
  mega->portC.port_vn = 24;
  mega->tcb2.int_vn = 25;
  mega->usart1.rxc_vn = 26;
  mega->usart1.dre_vn = 27;
  mega->usart1.txc_vn = 28;
  mega->portF.port_vn = 29;
  // mega->nvmctrl.ee_vn = 30;
  mega->usart2.rxc_vn = 31;
  mega->usart2.dre_vn = 32;
  mega->usart2.txc_vn = 33;
  mega->portB.port_vn = 34;
  mega->portE.port_vn = 35;
  mega->tcb3.int_vn = 36;
  mega->usart3.rxc_vn = 37;
  mega->usart3.dre_vn = 38;
  mega->usart3.txc_vn = 39;

  mega->syscfg.reg->REVID = 0xFF;
}

void mega4809_fini(void* _mcu) {
  mega4809_t *mcu = _mcu;
}

/* reset */
void mega4809_rt(void *_mcu, int flag) {
  mega4809_t *mega = _mcu;
  mcu_t *mcu = (mcu_t*)mega;
  cpu_t *cpu = &mega->base.cpu;

  tkclk_init(&cpu->clk_cpu, &mcu->osc20m, 6);
  tkclk_init(&mcu->clk_per, &mcu->osc20m, 6);
  /* Do I need to clear all events in all peripherals? 
   * Maybe each peripheral should have a reset handler.
   */

  memset(mega->data, 0, 0x1000);	/* clear I/O registers */
  mega->data[SREG_IX] = 0;		/* init status reg */
  mega->data[SPL_IX] = 0x3FFF % 256; 	/* highest sram address */
  mega->data[SPH_IX] = 0x3FFF / 256;

  mega->adc0.reg->CALIB = 0x01;
  //mega->bod.reg->CTRLA = fuse.SAMPFREQ;
  mega->clkctrl.reg->MCLKCTRLB = 0x11;
  //mega->crcscan.reg->STATUS = 0x02;
  //mega->???.SYSCFG0 = ??;
  //mega->???.FUSE_CRCSRC = ??;
  //mega->???.SYSCFG1 = ??;
  //mega->???.LOCKBIT = ??;
  //mega->rtc.reg->PERL = 0xFF:
  //mega->rtc.reg->PERH = 0xFF:
  mega->syscfg.reg->REVID = 0xFF;

  mega->adc0.pin[ 0] = &mega->portD.pin[0];
  mega->adc0.pin[ 1] = &mega->portD.pin[2];
  mega->adc0.pin[ 2] = &mega->portD.pin[2];
  mega->adc0.pin[ 3] = &mega->portD.pin[3];
  mega->adc0.pin[ 4] = &mega->portD.pin[4];
  mega->adc0.pin[ 5] = &mega->portD.pin[5];
  mega->adc0.pin[ 6] = &mega->portD.pin[6];
  mega->adc0.pin[ 7] = &mega->portD.pin[7];
  mega->adc0.pin[ 8] = &mega->portE.pin[0];
  mega->adc0.pin[ 9] = &mega->portE.pin[1];
  mega->adc0.pin[10] = &mega->portE.pin[2];
  mega->adc0.pin[11] = &mega->portE.pin[3];
  mega->adc0.pin[12] = &mega->portF.pin[2];
  mega->adc0.pin[13] = &mega->portF.pin[3];
  mega->adc0.pin[14] = &mega->portF.pin[4];
  mega->adc0.pin[15] = &mega->portF.pin[5];

  mega->tcb0.pin_out = &mega->portA.pin[2];
  mega->tcb1.pin_out = &mega->portA.pin[3];
  mega->tcb2.pin_out = &mega->portC.pin[0];
  mega->tcb3.pin_out = &mega->portB.pin[5];

  mega->twi0.m.sda_pin = &mega->portA.pin[2];
  mega->twi0.m.scl_pin = &mega->portA.pin[3];
  mega->twi0.s.sda_pin = &mega->portA.pin[2];
  mega->twi0.s.scl_pin = &mega->portA.pin[3];

  cpu_reset(cpu);
}

/* 
new strategy

if addr < 0x0030 special
if addr < 0x1000 &0x00f, >>4 so 0-256
   0xA8 => tcb_rd, tcb0 => tcb_rd(tcb0, addr)
   0xA9 => tcb_rd, tcb1
or table w/ { tcb_rd, OFF(tcb0), 0xA8
 */

uint8_t mega4809_rd(void *_mcu, int addr) {
  mega4809_t *mega = _mcu;
  uint8_t val;

  switch (addr & 0xfff0) {
  case 0x000:
#   if 0
    switch (addr & 0x0C) {
    case 0x0: val = vport_rd(&mega->vportA, addr); break;
    case 0x4: val = vport_rd(&mega->vportB, addr); break;
    case 0x8: val = vport_rd(&mega->vportC, addr); break;
    case 0xC: val = vport_rd(&mega->vportD, addr); break;
    }
#   endif
    break;
  case 0x010:
    switch (addr & 0x0C) {
#   if 0
    case 0x0: val = vport_rd(&mega->vportE, addr); break;
    case 0x4: val = vport_rd(&mega->vportF, addr); break;
#   endif
    case 0x8: val = mega->data[addr]; break; /* unallocated? */
    case 0xC: val = mega->data[addr]; break; /* GPIO */
    }
    break;
  case 0x020: val = mega->data[addr]; break;
  case 0x030: val = mega->data[addr]; break; /* CPU */
  case 0x040: val = rstctrl_rd(&mega->rstctrl, addr); break;
  case 0x050: val = slpctrl_rd(&mega->slpctrl, addr); break;
  case 0x060: val = clkctrl_rd(&mega->clkctrl, addr); break;
# if 0
  case 0x080: val = bod_rd(&mega->bod, addr); break;
  case 0x0A0: val = vref_rd(&mega->vref, addr); break;
# endif
  case 0x100: val = wdt_rd(&mega->wdt, addr); break;
  case 0x110: val = cpuint_rd(&mega->base.cpuint, addr); break;
# if 0
  case 0x120: val = crcscan_rd(&mega->crcscan, addr); break;
  case 0x140: val = rtc_rd(&mega->rtc, addr); break;
  case 0x180: val = evsys_rd(&mega->evsys, addr); break;
  case 0x1C0: val = ccl_rd(&mega->ccl, addr); break;
# endif
  case 0x400: case 0x410:
    val = port_rd(&mega->portA, addr); break;
  case 0x420: case 0x430:
    val = port_rd(&mega->portB, addr); break;
  case 0x440: case 0x450:
    val = port_rd(&mega->portC, addr); break;
  case 0x460: case 0x470:
    val = port_rd(&mega->portD, addr); break;
  case 0x480: case 0x490:
    val = port_rd(&mega->portE, addr); break;
  case 0x4A0: case 0x4B0:
    val = port_rd(&mega->portF, addr); break;
# if 0
  case 0x5E0: val = portmux_rd(&mega->portmux, addr); break;
# endif
  case 0x600: val = adc_rd(&mega->adc0, addr); break;
# if 0
  case 0x680: val = ac_rd(&mega->ac0, addr); break;
# endif
  case 0x800: val = usart_rd(&mega->usart0, addr); break;
  case 0x820: val = usart_rd(&mega->usart1, addr); break;
  case 0x840: val = usart_rd(&mega->usart2, addr); break;
  case 0x860: val = usart_rd(&mega->usart3, addr); break;
  case 0x8A0: twi_rd(&mega->twi0, addr); break;
# if 0
  case 0x8C0: val = spi_rd(&mega->spi0, addr); break;
# endif
  case 0xA00: case 0xA10: case 0xA20: case 0xA30:
    val = tca_rd(&mega->tca0, addr); break;
  case 0xA80: val = tcb_rd(&mega->tcb0, addr); break;
  case 0xA90: val = tcb_rd(&mega->tcb1, addr); break;
  case 0xAA0: val = tcb_rd(&mega->tcb2, addr); break;
  case 0xAB0: val = tcb_rd(&mega->tcb3, addr); break;
  case 0xF00: val = syscfg_rd(&mega->syscfg, addr); break;
# if 0
  case 0x000: val = nvmctrl_rd(&mega->nvmctrl, addr); break;
  case 0x100: val = sigrow_rd(&mega->sigrow, addr); break;
  case 0x280: val = fuse_rd(&mega->fuse, addr); break;
  case 0x280: val = lockbit_rd(&mega->lockbit, addr); break;
  case 0x300: val = userrow_rd(&mega->userrow, addr); break;
# endif
  default: val = mega->data[addr]; break;
  }
  return val;
}

void mega4809_wr(void *_mcu, int addr, uint8_t val) {
  mega4809_t *mega = _mcu;
  cpu_t *cpu = &mega->base.cpu;

  assert(addr < 0x4000);
  
  switch (addr & 0xfff0) {
  case 0x000:
#   if 0
    switch (addr & 0x0C) {
    case 0x0: vport_wr(&mega->vportA, addr, val); break;
    case 0x4: vport_wr(&mega->vportB, addr, val); break;
    case 0x8: vport_wr(&mega->vportC, addr, val); break;
    case 0xC: vport_wr(&mega->vportD, addr, val); break;
    }
#   endif
    break;
  case 0x010:
    switch (addr & 0x0C) {
#   if 0
    case 0x0: vport_wr(&mega->vportE, addr, val); break;
    case 0x4: vport_wr(&mega->vportF, addr, val); break;
#   endif
    case 0x8: mega->data[addr] = val; break; /* unallocated? */
    case 0xC: mega->data[addr] = val; break; /* GPIO */
    }
    break;
  case 0x020: mega->data[addr] = val; break; /* GPIO */
  case 0x030:				    /* CPU */
    switch (addr) {
    case 0x34: cpu_ccp_wr(cpu, val); break;
    default: mega->data[addr] = val; break;
    }
    break;
  case 0x040: rstctrl_wr(&mega->rstctrl, addr, val); break;
  case 0x050: slpctrl_wr(&mega->slpctrl, addr, val); break;
  case 0x060: clkctrl_wr(&mega->clkctrl, addr, val); break;
# if 0
  case 0x080: bod_wr(&mega->bod, addr, val); break;
  case 0x0A0: vref_wr(&mega->vref, addr, val); break;
# endif
  case 0x100: wdt_wr(&mega->wdt, addr, val); break;
  case 0x110: cpuint_wr(&mega->base.cpuint, addr, val); break;
# if 0
  case 0x120: crcscan_wr(&mega->crcscan, addr, val); break;
  case 0x140: rtc_wr(&mega->rtc, addr, val); break;
  case 0x180: evsys_wr(&mega->evsys, addr, val); break;
  case 0x1C0: ccl_wr(&mega->ccl, addr, val); break;
# endif
  case 0x400: case 0x410:
    port_wr(&mega->portA, addr, val); break;
  case 0x420: case 0x430:
    port_wr(&mega->portB, addr, val); break;
  case 0x440: case 0x450:
    port_wr(&mega->portC, addr, val); break;
  case 0x460: case 0x470:
    port_wr(&mega->portD, addr, val); break;
  case 0x480: case 0x490:
    port_wr(&mega->portE, addr, val); break;
  case 0x4A0: case 0x4B0:
    port_wr(&mega->portF, addr, val); break;
# if 0
  case 0x5E0: portmux_wr(&mega->portmux, addr, val); break;
# endif
  case 0x600: adc_wr(&mega->adc0, addr, val); break;
# if 0
  case 0x680: ac_wr(&mega->ac0, addr); break;
# endif
  case 0x800: usart_wr(&mega->usart0, addr, val); break;
  case 0x820: usart_wr(&mega->usart1, addr, val); break;
  case 0x840: usart_wr(&mega->usart2, addr, val); break;
  case 0x860: usart_wr(&mega->usart3, addr, val); break;
  case 0x8A0: twi_wr(&mega->twi0, addr, val); break;
# if 0
  case 0x8C0: spi_wr(&mega->spi0, addr, val); break;
# endif
  case 0xA00: case 0xA10: case 0xA20: case 0xA30:
    tca_wr(&mega->tca0, addr, val); break;
  case 0xA80: tcb_wr(&mega->tcb0, addr, val); break;
  case 0xA90: tcb_wr(&mega->tcb1, addr, val); break;
  case 0xAA0: tcb_wr(&mega->tcb2, addr, val); break;
  case 0xAB0: tcb_wr(&mega->tcb3, addr, val); break;
# if 0
  case 0xF00: syscfg_wr(&mega->syscfg, addr, val); break;
  case 0x000: nvmctrl_wr(&mega->nvmctrl, addr, val); break;
  case 0x100: sigrow_wr(&mega->sigrow, addr, val); break;
  case 0x280: fuse_wr(&mega->fuse, addr, val); break;
  case 0x280: lockbit_wr(&mega->lockbit, addr, val); break;
  case 0x300: userrow_wr(&mega->userrow, addr, val); break;
# endif
  default:
    if (addr < 0x2800) {
      /* missed something */
      abort();
    } else {
      mega->data[addr] = val;
    }
    break;
  }
#if 0
	// This should be done in the mcu handler, because peripherals
	// can write to data space too
	// dl->per_col_evts[ss] -- periodic collection events
	uint8_t rec = cpu->cdl->on_write[ix/8];
	if (rec && (rec && (1 << (ix%8)))) {
	  /* save */
	}
#endif
}

void mega4809_bs(void *_mcu, int idx, uint8_t val, uint8_t msk) {
  mega4809_t *mega = _mcu;
  val = mega4809_rd(_mcu, idx) | (val | msk);
  mega4809_wr(_mcu, idx, val);
}

/* intr req from peripheral */
void mega4809_ir(void *_mcu, int ivec) {
  mega4809_t *mega = _mcu;
  mcu_t *mcu = &mega->base;

  if (ivec > 0) {
    mcu->irmsk |= (1 << ivec);
  }
  else if (ivec <  0) {
    mcu->irmsk &= ~(1 << -ivec);
  }
}

/* intr ack back to peripheral */
void mega4809_ia(void *_mega, int ivec) {
  mega4809_t *mega = _mega;

  switch (ivec) {
  case -1: break; // RETI executed
  case 6: break; // PORTA_PORT
  case 7: break; // TCA0_OVF, TCA0_LUNF
  case 8: break; // TCA_HUNF
  case 9: break; // TCA_LCMP0, TCA_CMP0
  case 10: break; // TCA0_CMP1
  case 11: break; // TCA0_CMP2, TCA0_LCMP2
  case 12: break; // TCB0_INT
  case 13: break; // TCB1_INT
  case 14: break; // TWI0_TWIS
  case 15: break; // TWI0_TWIM
  case 16: break; // SPI0_INT
  case 17: break; // USART0_RXC
  case 18: break; // USART0_DRE
  case 19: break; // USART0_TXC
  case 20: break; // PORTD_PORT
  case 21: break; // AC0_AC
  case 22: break; // ADC0_RESRDY
  case 23: break; // ADC0_WCMP
  case 24: break; // PORTC_PORT
  case 25: break; // TCB2_INT
  case 26: break; // USART1_RXC
  case 27: break; // USART1_DRE
  case 28: break; // USART1_TXC
  case 29: break; // PORTF_PORT
  case 30: break; // NVMCTRL_EE
  case 31: break; // USART2_RXC
  case 32: break; // USART2_DRE
  case 33: break; // USART2_TXC
  case 34: break; // PORTB_PORT
  case 35: break; // PORTE_PORT
  case 36: break; // TCB3_INT
  case 37: break; // USART3_RXC
  case 38: break; // USART3_DRE
  case 39: break; // USART3_TXC
  default: abort(); break; // 
  }
}

void mega4809_wdr(void *_mcu) {
  mega4809_t *mega = _mcu;
  wdt_reset(&mega->wdt);
}

iopin_t *mega4809_pn(void *_mcu, char *name) {
  mega4809_t *mega = _mcu;
  iopin_t *pin;
  int ix;

  if (name[0] != 'P') abort();
  ix = name[2] - '0';
  if ((ix < 0) || (7 < ix)) abort();
  switch (name[1]) {
  case 'A': pin = &mega->portA.pin[ix]; break;
  case 'B': pin = &mega->portB.pin[ix]; break;
  case 'C': pin = &mega->portC.pin[ix]; break;
  case 'D': pin = &mega->portD.pin[ix]; break;
  case 'E': pin = &mega->portE.pin[ix]; break;
  case 'F': pin = &mega->portF.pin[ix]; break;
  default: abort(); break;
  }
  return pin;
}

/* --- last line --- */
