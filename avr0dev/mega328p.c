/* atmega328p.c
 * 
 * Copyright (C) 2019,2023 Matthew Wette
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

#include "mmod/avr_cpu.h"
#include "atmega328p.h"

#define __AVR_ATmega328P__
#define __ASSEMBLER__
#define __SFR_OFFSET 0x20
#include "avr/io.h"

#include "models/util.c"
#include "models/old_timer.c"
#include "models/old_usart.c"
#include "models/old_twi.c"

/* === basics ======================= */


/* reset
 */
void atmega328p_init(void* _chip) {
  atmega328p_t *chip = _chip;
  chip_t *base = &chip->base;
  cpu_t *cpu = &base->cpu;

  memset(chip, 0, sizeof(*chip));
  cpu->am = 2;
  cpu->vers = CPU_VERS_AVRxt;		/* WAG */
  cpu->prog = chip->prog;
  cpu->data = chip->data;
  cpu->iobase = 0x20;
  cpu->EIND_IX = 0;
  cpu->RAMPZ_IX = 0;
  cpu->host = (chip_t *)chip;

  base->rd = atmega328p_rd;
  base->wr = atmega328p_wr;
  base->bs = atmega328p_bs;
  base->ni = atmega328p_ni;

  chip->usart0.tx_fd = 1;		/* stdout */
  chip->usart0.rx_fd = -1;		/* none right now */

  chip->data[UCSR0A] = (1 << UDRE0);
  chip->data[UCSR0C] = (1 << UCSZ01) | (1 << UCSZ00);
  chip->data[TWSR] = 0xF8;		/* TWS7-TWS3 on */
  chip->data[TWDR] = 0xFF;		/* TWD7-TWD0 on */
  chip->data[TWAR] = 0xFE;		/* TWA6-TWA0 on */
}

void atmega328p_fini(void* _chip) {
  atmega328p_t *chip = _chip;

  if (chip->usart0.tx_fd > 2) close(chip->usart0.tx_fd);
  if (chip->usart0.rx_fd > 2) close(chip->usart0.rx_fd);
}



uint8_t atmega328p_rd(void *_chip, int idx) {
  atmega328p_t *chip = _chip;
  cpu_t *cpu = &chip->base.cpu;
  uint8_t val;

  switch (idx) {
  case UDR0: {
    usart_t *usart = &chip->usart0;
    val = cpu->data[UDR0];
    cpu->data[UCSR0A] &= ~(1 << DOR0);	/* reset data overflow flag */
    if (usart->rx_shr_live) {
      cpu->data[UDR0] = usart->rx_reg;
      usart->rx_shr_live = 0;
    } else {
      cpu->data[UCSR0A] &= ~(1 << RXC0); /* reset data ready flag */
    }
  } break;
  default:
    val = cpu->data[idx];
    break;
  }
  return val;
}

void atmega328p_bs(void *_chip, int idx, uint8_t msk) {
  atmega328p_t *chip = _chip;
  cpu_t *cpu = &chip->base.cpu;
  uint8_t val = cpu->data[idx] | msk;
  
  atmega328p_wr(_chip, idx, val);
}

void atmega328p_wr(void *_chip, int idx, uint8_t val) {
  atmega328p_t *chip = _chip;
  cpu_t *cpu = &chip->base.cpu;
  uint8_t dv0, dv1, dxor, ev;
  int at, clkmul;

  if ((idx < 0x20) || (0xFF < idx)) {
    cpu->data[idx] = val;
    return;
  }

  dv0 = cpu->data[idx];
  dv1 = val;
  dxor = dv0 ^ dv1;
  switch (idx) {
  case SREG:
    if ((dxor & 0x80) && (val & 0x80)) {
      // check for newly enabled interrupts TIMSKn+TIFRn etc
    }
    cpu->data[idx] = val;
    break;

  case PRR:
    cpu->data[idx] = (val & 0xEF);
    break;

  case PINB:
    cpu->data[PORTB] ^= (val & cpu->data[DDRB]);
    if (val & cpu->data[DDRB]) printf("toggle PINB @ %ld\n", cpu->sys_clk->tick);
    break;
  case DDRB:
    cpu->data[idx] = val;
    break;
  case PORTB:
    dv0 = cpu->data[DDRB];
    cpu->data[idx] = (dv0 & val) | (~dv0 & cpu->data[idx]);
    break;
    
  case PINC:
    cpu->data[PORTC] ^= (val & cpu->data[DDRC]);
    break;
  case DDRC:
    cpu->data[idx] = val;
    break;
  case PORTC:
    dv0 = cpu->data[DDRC];
    cpu->data[idx] = (dv0 & val) | (~dv0 & cpu->data[idx]);
    break;
    
  case PIND:
    cpu->data[PORTD] ^= (val & cpu->data[DDRD]);
    break;
  case DDRD:
    cpu->data[idx] = val;
    break;
  case PORTD:
    dv0 = cpu->data[DDRC];
    cpu->data[idx] = (dv0 & val) | (~dv0 & cpu->data[idx]);
    break;

  case SMCR:
    cpu->data[idx] = val;
    cpu->sleepe = (val & 0x01)? 1: 0;
    break;
      
  case GTCCR:
    /* general timer/counter control register
     * TSM | x | x | x | x | x | PSRASY | PSRSYNC
     * When TSM is 1, async timer 2 and/or sync-timers 0&1 are held in reset.
     */
    if (dv1 & 0x80) {
      if (dv1 & 0x01) {
	if (chip->t0evt) tksch_cancel(cpu->sys_clk, chip->t0evt);
	chip->t0evt = 0;
	if (chip->t1evt) tksch_cancel(cpu->sys_clk, chip->t1evt);
	chip->t1evt = 0;
      } 
      if (dv1 & 0x02) {
	if (chip->t2evt) tksch_cancel(cpu->sys_clk, chip->t2evt);
	chip->t2evt = 0;
      } 
    }
    cpu->data[idx] = ((dv0 & 0x80) && (dxor & 0x80))? 0: dv1;
    break;
      
  case TCCR0A:
    cpu->data[idx] = val;
    ev = (dv0 & 0x03) | ((cpu->data[TCCR0A] & 0x18) >>  1);
    break;

  case TCCR0B:
    cpu->data[idx] = val;
    if (dxor & 0x07) {		/* change in clock scaling */
      if (chip->t0evt) tksch_cancel(cpu->sys_clk, chip->t0evt);
      chip->t0evt = 0;
      if ((clkmul = clk_mul(val)) != 0) {
	at = cpu->sys_clk->tick + clkmul;
	chip->t0evt = tksch_sched(cpu->sys_clk, at, -1, t0_tick_evt, chip);
      }
    }
    break;
  case TCNT0:
  case OCR0A:
  case OCR0B:
    cpu->data[idx] = val;
    break;
  case TIMSK0:
    cpu->data[idx] = val;
    break;
  case TIFR0:
    cpu->data[idx] = val;
    /* if reset bits 2,1,0 then associated cpu->imsk bits. */
    break;

  case TCCR1A:
  case TCCR1B:
  case TCCR1C:
  case TCNT1H:
  case TCNT1L:
  case OCR1AH:
  case OCR1AL:
    cpu->data[idx] = val;
    break;

  /* 
   * UCSR0A: RCXC0 | TXC0 | UDRE0 | FE0 | DOR0 | UPE0 | U2X0 | MPCM0
   * UCSR0B: RXCIE0 | TXCIE0 | UDRIE0 | RXEN0 | TXEN0 | UCSX02 | RXB80
   * UCSR0C: UMSEL01|UMSEL00 | UMP01|UPM00 | USBS0 | UCSZ01|UCSZ00 | UCPOL0
   */
  case UDR0: {
    /* TODO 9-bit data */
    int nbit;
    uint16_t clks;
    float delay;
    tksch_t *clk = chip->base.cpu.sys_clk;
    usart_t *usart = &chip->usart0;

    cpu->imsk &= ~(1 << USART_RX_vect_num); /* clear interrupt */

    if (chip->data[UCSR0A] & (1 << UDRE0)) {
      chip->udr0_txb = val;
      chip->data[UCSR0A] &= ~(1 << UDRE0);
    } /* else UDRE0 is low, buffer busy, new data ignored. */

    if ((chip->data[UCSR0B] & (1 << TXEN0)) && (!usart->tx_shr_live)) {
      chip->usart0.tx_shr_live = 1;
      chip->usart0.tx_reg = chip->udr0_txb; /* copy value to shift reg */
      chip->data[UCSR0A] &= ~(1 << TXC0); /* reset transfer complete */
      chip->data[UCSR0A] |= (1 << UDRE0); /* UDR now clear for xmit */
      nbit = 12;			  /* assume 1+8+p+2  */
      clks = ((cpu->data[UBRR0H] << 8) | cpu->data[UBRR0L])
	* ((cpu->data[UCSR0A] & 0x02)? 8: 16) * nbit;
      chip->txevt = tksch_sched(clk, clk->tick + clks, 1, usart0_tx_evt, chip);
    }
  } break;
  case UCSR0A:
    /* RXC0 | TXC0 | UDRE0 | FE0 | DOR0 | UPE0 | U2X0 | MPCM0 */
    cpu->data[idx] = val;
    break;
  case UCSR0B:
    /* RXCIE0 | TXCIE0 | UDRIE0 | RXEN0 | TXEN0 | UCSZ02 | RXB80 | TXB80 */
    if (val & 0x10) {
      cpu->data[UDR0] = 0;
      cpu->data[UCSR0A] &= ~(1 << RXC0);
    }
    cpu->data[idx] = (val & 0xFD);
    break;
  case UCSR0C:
    /* UMSEL01 | UMSEL00 | UPM01 | UPM00 | USBS0 | UCSZ01 | UCSZ00 | UCPOL0 */
    cpu->data[idx] = val;
    break;
    
  default:
    cpu->data[idx] = val;
    break;
  }
}

/* note interrupt */
void atmega328p_ni(void *_chip, int ivec) {
  atmega328p_t *chip = _chip;
  cpu_t *cpu = &mcu->base.cpu;
  
  cpu->imsk &= ~(1 << ivec);
  switch (ivec) {
  case TIMER0_COMPA_vect_num:
    chip->data[TIFR0] &= ~(1 << OCF0A);
    break;
  case TIMER0_COMPB_vect_num:
    chip->data[TIFR0] &= ~(1 << OCF0B);
    break;
  case TIMER0_OVF_vect_num:
    chip->data[TIFR0] &= ~(1 << TOV0);
    break;
  case TIMER1_COMPA_vect_num:
    chip->data[TIFR1] &= ~(1 << OCF1A);
    break;
  case TIMER1_COMPB_vect_num:
    chip->data[TIFR1] &= ~(1 << OCF1B);
    break;
  case TIMER1_OVF_vect_num:
    chip->data[TIFR1] &= ~(1 << TOV1);
    break;
  case TIMER2_COMPA_vect_num:
    chip->data[TIFR2] &= ~(1 << OCF2A);
    break;
  case TIMER2_COMPB_vect_num:
    chip->data[TIFR2] &= ~(1 << OCF2B);
    break;
  case TIMER2_OVF_vect_num:
    chip->data[TIFR2] &= ~(1 << TOV2);
    break;
  case USART_UDRE_vect_num:
    break;
  case USART_TX_vect_num:
    chip->data[UCSR0A] &= ~(1 << TXC0);
    break;
//      cpu->data[UCSR0A] &= ~(1 << RXC0); /* reset data ready flag */
  default:
    printf("noting interrupt w/o handler\n");
    break;
  }
}

/* === NOTES ============================ 

 * OSCCAL : trim internal RC oscillator
 * CLKPR  : prescalar for slected clock and intneral clock 

 * fuse-bits low byte, see "Fuse Bits" in data sheet
 * CKDIV8 7 
 * CKOUT 6 clock out
 * SUT 5:4 
 * CLKSEL 3:0 clock select
 * default is internal 8 Mhz w/ DIV8 programmed (logic "0"), for 1 MHz

 * CLKPR (0x61) system clock prescalar
 * TCCR0B: T0 clock select 

   FROM CCU (clock control unit)
   clk_io, clk_cpu, clk_adc, clk_flash driven by the same sys_clk
   clk_asy can be separately clocked I think

   options TO CCU:
   + timer/counter oscillator (external pin)
   + external clock
   + extern xtal
   + low-fre osc ???
   + watchdog oscillator (internal?)
   + internal calibrated RC oscillator (~8 MHz, but /8 fuse => ~1 MHz)
   + internal 128 kHz internal oscillator, aks Watchdog Oscillator

 * note: 16-bit reg R/W: write high byte first, read low byte fisrt

 * 1) exec: sched cpu exec
 * 2) exec: sched I/O
 * 3) oput: sched timer update
 * 4) iput: T0, T1 prescalars
 * 5) iput: clocks
 * 6) iput: sleep mode in SMCR register
  We need to be able to schedule based on clock ticks!
  => more sophisticated scheduler(s)
  tsch => drives csch; each csch can schedule sss

  Thoughts:
  + sys needs to have clock sources (w/ schedulers)
    and clock domains that point to the scheduler
    example: tksch_t cs_xtal; tksch_t *clk_io = &cs_xtal; ???
         or: tksch_t cs[6]; int clk_io = 3;
  + should we allocate internal CSs to the chip and external CSs to the sys?
    yes
  + for clock models, we need
    - 1 sys clock for Low Power, Full Swing, or Low Freq xtal osc
      on XTAL/TOSC pins
    - 1 internal watchdog clock/timer
  + system clock is output on CLKO pin
  + T0 pin is external input option for clk_asy

/* --- last line --- */

