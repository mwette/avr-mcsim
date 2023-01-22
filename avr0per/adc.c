/* ADC - Analog to Digital Converter 
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
#include <math.h>
#include "octbx.h"
#include "adc.h"

void adc_init(adc_t *adc, mcu_t *mcu, uint16_t addr) {
  adc->mcu = mcu;
  adc->base_addr = addr;
  adc->reg = (adc_reg_t *)&mcu->cpu.data[addr];
  adc->vref = 5.0;			/* FIXME: hack */
}

void adc_fini(adc_t *adc) {
}  

#define ADC_DUTYCYC_bm 0x1              /* Duty Cycle */
#define ADC_STCONV_bm 0x1               /* Start Conversion Operation */
#define ADC_ENABLE_bm 0x1               /* ADC Enable */
#define ADC_FREERUN_bm 0x2              /* ADC Freerun mode */
#define ADC_RESSEL_bm 0x4               /* ADC Resolution */
#define ADC_RUNSTBY_bm 0x80             /* Run standby mode */
#define ADC_SAMPNUM_gm 0x7              /* Accumulation Samples */
#define ADC_SAMPNUM_bs 0                /*   bit shift */
#define ADC_PRESC_gm 0x7                /* Clock Pre-scaler */
#define ADC_PRESC_bs 0                  /*   bit shift */
#define ADC_REFSEL_gm 0x30              /* Reference Selection */
#define ADC_REFSEL_bs 4                 /*   bit shift */
#define ADC_SAMPCAP_bm 0x40             /* Sample Capacitance Selection */
#define ADC_ASDV_bm 0x10                /* Automatic Sampling Delay Variation */
#define ADC_INITDLY_gm 0xe0             /* Initial Delay Selection */
#define ADC_INITDLY_bs 5                /*   bit shift */
#define ADC_SAMPDLY_gm 0xf              /* Sampling Delay Selection */
#define ADC_SAMPDLY_bs 0                /*   bit shift */
#define ADC_WINCM_gm 0x7                /* Window Comparator Mode */
#define ADC_WINCM_bs 0                  /*   bit shift */
#define ADC_DBGRUN_bm 0x1               /* Debug run */
#define ADC_STARTEI_bm 0x1              /* Start Event Input Enable */
#define ADC_RESRDY_bm 0x1               /* Result Ready Interrupt Enable */
#define ADC_WCMP_bm 0x2	                /* Window Comparator Interrupt Enable */
#define ADC_RESRDY_bm 0x1               /* Result Ready Flag */
#define ADC_WCMP_bm 0x2                 /* Window Comparator Flag */
#define ADC_MUXPOS_gm 0x1f              /* Analog Channel Selection Bits */
#define ADC_MUXPOS_bs 0                 /*   bit shift */
#define ADC_SAMPLEN_gm 0x1f             /* Sample lenght */
#define ADC_SAMPLEN_bs 0                /*   bit shift */
#define ADC_TEMP_gm 0xff                /* Temporary */
#define ADC_TEMP_bs 0                   /*   bit shift */

typedef enum {
  ADC_DUTYCYC_DUTY50_gc = (0x0 << 0),   /* 50% Duty cycle */
  ADC_DUTYCYC_DUTY25_gc = (0x1 << 0),   /* 25% Duty cycle */
} ADC_DUTYCYC_t;

typedef enum {
  ADC_RESSEL_10BIT_gc = (0x0 << 2),     /* 10-bit mode */
  ADC_RESSEL_8BIT_gc = (0x1 << 2),      /* 8-bit mode */
} ADC_RESSEL_t;

typedef enum {
  ADC_SAMPNUM_ACC1_gc = (0x00 << 0),    /* 1 ADC sample */
  ADC_SAMPNUM_ACC2_gc = (0x01 << 0),    /* Accumulate 2 samples */
  ADC_SAMPNUM_ACC4_gc = (0x02 << 0),    /* Accumulate 4 samples */
  ADC_SAMPNUM_ACC8_gc = (0x03 << 0),    /* Accumulate 8 samples */
  ADC_SAMPNUM_ACC16_gc = (0x04 << 0),   /* Accumulate 16 samples */
  ADC_SAMPNUM_ACC32_gc = (0x05 << 0),   /* Accumulate 32 samples */
  ADC_SAMPNUM_ACC64_gc = (0x06 << 0),   /* Accumulate 64 samples */
} ADC_SAMPNUM_t;

typedef enum {
  ADC_PRESC_DIV2_gc = (0x00 << 0),      /* CLK_PER divided by 2 */
  ADC_PRESC_DIV4_gc = (0x01 << 0),      /* CLK_PER divided by 4 */
  ADC_PRESC_DIV8_gc = (0x02 << 0),      /* CLK_PER divided by 8 */
  ADC_PRESC_DIV16_gc = (0x03 << 0),     /* CLK_PER divided by 16 */
  ADC_PRESC_DIV32_gc = (0x04 << 0),     /* CLK_PER divided by 32 */
  ADC_PRESC_DIV64_gc = (0x05 << 0),     /* CLK_PER divided by 64 */
  ADC_PRESC_DIV128_gc = (0x06 << 0),    /* CLK_PER divided by 128 */
  ADC_PRESC_DIV256_gc = (0x07 << 0),    /* CLK_PER divided by 256 */
} ADC_PRESC_t;

typedef enum {
  ADC_REFSEL_INTREF_gc = (0x00 << 4),   /* Internal reference */
  ADC_REFSEL_VDDREF_gc = (0x01 << 4),   /* VDD */
  ADC_REFSEL_VREFA_gc = (0x02 << 4),    /* External reference */
} ADC_REFSEL_t;

typedef enum {
  ADC_ASDV_ASVOFF_gc = (0x0 << 4), /* The Automatic Sampling Delay Variation is disabled */
  ADC_ASDV_ASVON_gc = (0x1 << 4), /* The Automatic Sampling Delay Variation is enabled */
} ADC_ASDV_t;

typedef enum {
  ADC_INITDLY_DLY0_gc = (0x00 << 5),    /* Delay 0 CLK_ADC cycles */
  ADC_INITDLY_DLY16_gc = (0x01 << 5),   /* Delay 16 CLK_ADC cycles */
  ADC_INITDLY_DLY32_gc = (0x02 << 5),   /* Delay 32 CLK_ADC cycles */
  ADC_INITDLY_DLY64_gc = (0x03 << 5),   /* Delay 64 CLK_ADC cycles */
  ADC_INITDLY_DLY128_gc = (0x04 << 5),  /* Delay 128 CLK_ADC cycles */
  ADC_INITDLY_DLY256_gc = (0x05 << 5),  /* Delay 256 CLK_ADC cycles */
} ADC_INITDLY_t;

typedef enum {
  ADC_WINCM_NONE_gc = (0x00 << 0),      /* No Window Comparison */
  ADC_WINCM_BELOW_gc = (0x01 << 0),     /* Below Window */
  ADC_WINCM_ABOVE_gc = (0x02 << 0),     /* Above Window */
  ADC_WINCM_INSIDE_gc = (0x03 << 0),    /* Inside Window */
  ADC_WINCM_OUTSIDE_gc = (0x04 << 0),   /* Outside Window */
} ADC_WINCM_t;

typedef enum {
  ADC_MUXPOS_AIN0_gc = (0x0 << 0),      /* ADC input pin 0 */
  ADC_MUXPOS_AIN1_gc = (0x1 << 0),      /* ADC input pin 1 */
  ADC_MUXPOS_AIN2_gc = (0x2 << 0),      /* ADC input pin 2 */
  ADC_MUXPOS_AIN3_gc = (0x3 << 0),      /* ADC input pin 3 */
  ADC_MUXPOS_AIN4_gc = (0x4 << 0),      /* ADC input pin 4 */
  ADC_MUXPOS_AIN5_gc = (0x5 << 0),      /* ADC input pin 5 */
  ADC_MUXPOS_AIN6_gc = (0x6 << 0),      /* ADC input pin 6 */
  ADC_MUXPOS_AIN7_gc = (0x7 << 0),      /* ADC input pin 7 */
  ADC_MUXPOS_AIN8_gc = (0x8 << 0),      /* ADC input pin 8 */
  ADC_MUXPOS_AIN9_gc = (0x9 << 0),      /* ADC input pin 9 */
  ADC_MUXPOS_AIN10_gc = (0xA << 0),     /* ADC input pin 10 */
  ADC_MUXPOS_AIN11_gc = (0xB << 0),     /* ADC input pin 11 */
  ADC_MUXPOS_AIN12_gc = (0xC << 0),     /* ADC input pin 12 */
  ADC_MUXPOS_AIN13_gc = (0xD << 0),     /* ADC input pin 13 */
  ADC_MUXPOS_AIN14_gc = (0xE << 0),     /* ADC input pin 14 */
  ADC_MUXPOS_AIN15_gc = (0xF << 0),     /* ADC input pin 15 */
  ADC_MUXPOS_DACREF_gc = (0x1C << 0),   /* AC DAC Reference */
  ADC_MUXPOS_TEMPSENSE_gc = (0x1E << 0), /* Temperature sensor */
  ADC_MUXPOS_GND_gc = (0x1F << 0),      /* 0V (GND) */
} ADC_MUXPOS_t;

#define CTRLA_OFFSET 0x00               /* Control A */
#define CTRLB_OFFSET 0x01               /* Control B */
#define CTRLC_OFFSET 0x02               /* Control C */
#define CTRLD_OFFSET 0x03               /* Control D */
#define CTRLE_OFFSET 0x04               /* Control E */
#define SAMPCTRL_OFFSET 0x05            /* Sample Control */
#define MUXPOS_OFFSET 0x06              /* Positive mux input */
#define COMMAND_OFFSET 0x08             /* Command */
#define EVCTRL_OFFSET 0x09              /* Event Control */
#define INTCTRL_OFFSET 0x0A             /* Interrupt Control */
#define INTFLAGS_OFFSET 0x0B            /* Interrupt Flags */
#define DBGCTRL_OFFSET 0x0C             /* Debug Control */
#define TEMP_OFFSET 0x0D                /* Temporary Data */
#define RESL_OFFSET (0x10+0)            /* ADC Accumulator Result */
#define RESH_OFFSET (0x10+1)            /* ADC Accumulator Result */
#define WINLTL_OFFSET (0x12+0)          /* Window comparator low threshold */
#define WINLTH_OFFSET (0x12+1)          /* Window comparator low threshold */
#define WINHTL_OFFSET (0x14+0)          /* Window comparator high threshold */
#define WINHTH_OFFSET (0x14+1)          /* Window comparator high threshold */
#define CALIB_OFFSET 0x16               /* Calibration */


/* conversion done */
void adc_conv_act(void *_adc, tkclk_t *clk) {
  adc_t *adc = _adc;
  adc_reg_t *reg = adc->reg;
  double aval;
  uint16_t res;

  adc->conv_act = 0;
  
  switch (reg->MUXPOS & ADC_MUXPOS_gm) {
  case ADC_MUXPOS_AIN0_gc: aval = adc->pin[0]->aval; break;
  case ADC_MUXPOS_AIN1_gc: aval = adc->pin[1]->aval; break;
  case ADC_MUXPOS_AIN2_gc: aval = adc->pin[2]->aval; break;
  case ADC_MUXPOS_AIN3_gc: aval = adc->pin[3]->aval; break;
  case ADC_MUXPOS_AIN4_gc: aval = adc->pin[4]->aval; break;
  case ADC_MUXPOS_AIN5_gc: aval = adc->pin[5]->aval; break;
  case ADC_MUXPOS_AIN6_gc: aval = adc->pin[6]->aval; break;
  case ADC_MUXPOS_AIN7_gc: aval = adc->pin[7]->aval; break;
  case ADC_MUXPOS_AIN8_gc: aval = adc->pin[8]->aval; break;
  case ADC_MUXPOS_AIN9_gc: aval = adc->pin[9]->aval; break;
  case ADC_MUXPOS_AIN10_gc: aval = adc->pin[10]->aval; break;
  case ADC_MUXPOS_AIN11_gc: aval = adc->pin[11]->aval; break;
  case ADC_MUXPOS_AIN12_gc: aval = adc->pin[12]->aval; break;
  case ADC_MUXPOS_AIN13_gc: aval = adc->pin[13]->aval; break;
  case ADC_MUXPOS_AIN14_gc: aval = adc->pin[14]->aval; break;
  case ADC_MUXPOS_AIN15_gc: aval = adc->pin[15]->aval; break;
  case ADC_MUXPOS_DACREF_gc: aval = 5.0; break;	   // FIXME
  case ADC_MUXPOS_TEMPSENSE_gc: aval = 2.5; break; // FIXME
  case ADC_MUXPOS_GND_gc: aval = 0.0; break; // FIXME ?
  }

  // FIXME get MCU Vref
  if (aval >= 5.0) {
    reg->RESH = 0x3; reg->RESL = 0xff;
  } else if (aval <= 0.0) {
    reg->RESH = 0; reg->RESL = 0;
  } else {
    res = (uint16_t)floor(1024.0*aval/5.0);
    reg->RESH = REG16H(res); reg->RESL = REG16L(res);
  }
  //printf("aval = %f  RES=%d\n", aval, reg->RES);
  reg->INTFLAGS |= ADC_RESRDY_bm;
  reg->COMMAND &= ~ADC_STCONV_bm;
}

uint8_t adc_rd(adc_t *adc, int addr) {
  adc_reg_t *reg = adc->reg;
  mcu_t *mcu = adc->mcu;
  uint16_t offs = addr - adc->base_addr;

  switch (offs) {
  case CTRLA_OFFSET:                    /* Control A */
    return reg->CTRLA;
    break;
  case CTRLB_OFFSET:                    /* Control B */
    return reg->CTRLB;
    break;
  case CTRLC_OFFSET:                    /* Control C */
    return reg->CTRLC;
    break;
  case CTRLD_OFFSET:                    /* Control D */
    return reg->CTRLD;
    break;
  case CTRLE_OFFSET:                    /* Control E */
    return reg->CTRLE;
    break;
  case SAMPCTRL_OFFSET:                 /* Sample Control */
    return reg->SAMPCTRL;
    break;
  case MUXPOS_OFFSET:                   /* Positive mux input */
    return reg->MUXPOS;
    break;
  case COMMAND_OFFSET:                  /* Command */
    return reg->COMMAND;
    break;
  case EVCTRL_OFFSET:                   /* Event Control */
    return reg->EVCTRL;
    break;
  case INTCTRL_OFFSET:                  /* Interrupt Control */
    return reg->INTCTRL;
    break;
  case INTFLAGS_OFFSET:                 /* Interrupt Flags */
    return reg->INTFLAGS;
    break;
  case DBGCTRL_OFFSET:                  /* Debug Control */
    return reg->DBGCTRL;
    break;
  case TEMP_OFFSET:                     /* Temporary Data */
    return reg->TEMP;
    break;
  case RESL_OFFSET:                     /* ADC Accumulator Result */
    reg->INTFLAGS &= ~ADC_ENABLE_bm;	    /* clear intr flag */
    mcu_ir(mcu, -(adc->resrdy_vn));	    /* clear pending intr */
    reg->TEMP = reg->RESH;
    return reg->RESL;
    break;
  case RESH_OFFSET:                     /* ADC Accumulator Result */
    return reg->TEMP;
    //return reg->RESH;
    break;

  case WINLTL_OFFSET:                   /* Window comparator low threshold */
    reg->TEMP = reg->WINLTH;
    return reg->WINLTL;
    break;
  case WINLTH_OFFSET:                   /* Window comparator low threshold */
    return reg->TEMP;
    break;
  case WINHTL_OFFSET:                   /* Window comparator high threshold */
    reg->TEMP = reg->WINHTH;
    return reg->WINHTL;
    break;
  case WINHTH_OFFSET:                   /* Window comparator high threshold */
    //return reg->TEMP;
    return reg->WINHTH;
    break;
  case CALIB_OFFSET:                    /* Calibration */
    return reg->CALIB;
    break;
  default:
    abort();
    break;
  }
}

void adc_wr(adc_t *adc, int addr, uint8_t val) {
  mcu_t *mcu = adc->mcu;
  adc_reg_t *reg = adc->reg;
  uint16_t offs = addr - adc->base_addr;

  switch (offs) {
  case CTRLA_OFFSET:                    /* Control A */
    reg->CTRLA = val;
    break;
  case CTRLB_OFFSET:                    /* Control B */
    reg->CTRLB = val;
    break;
  case CTRLC_OFFSET:                    /* Control C */
    reg->CTRLC = val;
    break;
  case CTRLD_OFFSET:                    /* Control D */
    reg->CTRLD = val;
    break;
  case CTRLE_OFFSET:                    /* Control E */
    reg->CTRLE = val;
    break;
  case SAMPCTRL_OFFSET:                 /* Sample Control */
    reg->SAMPCTRL = val;
    break;
  case MUXPOS_OFFSET:                   /* Positive mux input */
    reg->MUXPOS = val;
    break;

  case COMMAND_OFFSET:                  /* Command */
    // todo: number of samples, reference
    if (val & ADC_STCONV_bm) {
      tkclk_t *clk = &mcu->clk_per;
      uint16_t fact, delta;
      
      /* clock rate should be in [50 kHz, 1.5 MHz] */
      switch (reg->CTRLC & ADC_PRESC_gm) {
      case ADC_PRESC_DIV2_gc: fact = 2; break;
      case ADC_PRESC_DIV4_gc: fact = 4; break;
      case ADC_PRESC_DIV8_gc: fact = 8; break;
      case ADC_PRESC_DIV16_gc: fact = 16; break;
      case ADC_PRESC_DIV32_gc: fact = 32; break;
      case ADC_PRESC_DIV64_gc: fact = 64; break;
      case ADC_PRESC_DIV128_gc: fact = 128; break;
      case ADC_PRESC_DIV256_gc: fact = 256; break;
      default: abort(); fact = 0; break;
      }
      // start delay = fact/2 + 2 ; then 13*fact
      delta = fact/2 + 2 + 13*fact;
      if (adc->conv_act) tkclk_cancel(clk, adc->conv_act);
      adc->conv_act = tkclk_sched(clk, delta, +1, adc_conv_act, adc);
      adc->conv_act->name = "adc_conv_act";
    }
    reg->COMMAND = val;
    break;

  case EVCTRL_OFFSET:                   /* Event Control */
    reg->EVCTRL = val;
    break;

  case INTCTRL_OFFSET:                  /* Interrupt Control */
    if ((val & ADC_ENABLE_bm) == 0) mcu_ir(mcu, -(adc->resrdy_vn));
    reg->INTCTRL = val;
    break;

  case INTFLAGS_OFFSET:                 /* Interrupt Flags */
    //if (/* clr intr */1) mcu->cpu.imsk &= ~(1 << adc->resrdy_vn);
    //if (/* clr intr */1) mcu->mireq &= ~(1 << adc->resrdy_vn);
    reg->INTFLAGS = val;
    break;

  case DBGCTRL_OFFSET:                  /* Debug Control */
    reg->DBGCTRL = val;
    break;
  case TEMP_OFFSET:                     /* Temporary Data */
    reg->TEMP = val;
    break;
  case RESL_OFFSET:                     /* ADC Accumulator Result */
    reg->RESL = val;
    break;
  case RESH_OFFSET:                     /* ADC Accumulator Result */
    reg->RESH = val;
    break;
  case WINLTL_OFFSET:                   /* Window comparator low threshold */
    reg->WINLTL = val;
    break;
  case WINLTH_OFFSET:                   /* Window comparator low threshold */
    reg->WINLTH = val;
    break;
  case WINHTL_OFFSET:                   /* Window comparator high threshold */
    reg->WINHTL = val;
    break;
  case WINHTH_OFFSET:                   /* Window comparator high threshold */
    reg->WINHTH = val;
    break;
  case CALIB_OFFSET:                    /* Calibration */
    reg->CALIB = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
