/* USART - Universal Synchronous and Asynchronous Receiver and Transmitter
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
#include "usart.h"

void usart_init(usart_t *usart, mcu_t *mcu, uint16_t addr) {
  usart->mcu = mcu;
  usart->base_addr = addr;
  usart->reg = (usart_reg_t *)&mcu->cpu.data[addr];
}

void usart_fini(usart_t *usart) {
}  

#define USART_ABEIE_bm 0x4              /* Auto-baud Error Interrupt Enable */
#define USART_DREIE_bm 0x20             /* Data Register Empty Int'r Enable */
#define USART_LBME_bm 0x8               /* Loop-back Mode Enable */
#define USART_RS485_gm 0x3              /* RS485 Mode internal transmitter */
#define USART_RS485_bs 0                /*   bit shift */
#define USART_RXCIE_bm 0x80             /* Receive Complete Interrupt Enable */
#define USART_RXSIE_bm 0x10             /* Receiver Start Frame Int'r Enable */
#define USART_TXCIE_bm 0x40             /* Transmit Complete Interrupt Enable */
#define USART_MPCM_bm 0x1               /* Multi-processor Communication Mode */
#define USART_ODME_bm 0x8               /* Open Drain Mode Enable */
#define USART_RXEN_bm 0x80              /* Reciever enable */
#define USART_RXMODE_gm 0x6             /* Receiver Mode */
#define USART_RXMODE_bs 1               /*   bit shift */
#define USART_SFDEN_bm 0x10             /* Start Frame Detection Enable */
#define USART_TXEN_bm 0x40              /* Transmitter Enable */
#define USART_ABW_gm 0xc0               /* Auto Baud Window */
#define USART_ABW_bs 6                  /*   bit shift */
#define USART_ABMBP_bm 0x80             /* Autobaud majority voter bypass */
#define USART_DBGRUN_bm 0x1             /* Debug Run */
#define USART_IREI_bm 0x1               /* IrDA Event Input Enable */
#define USART_BUFOVF_bm 0x40            /* Buffer Overflow */
#define USART_DATA8_bm 0x1              /* Receiver Data Register */
#define USART_FERR_bm 0x4               /* Frame Error */
#define USART_PERR_bm 0x2               /* Parity Error */
#define USART_RXCIF_bm 0x80             /* Receive Complete Interrupt Flag */
#define USART_DATA_gm 0xff              /* RX Data */
#define USART_DATA_bs 0                 /*   bit shift */
#define USART_RXPL_gm 0x7f              /* Receiver Pulse Lenght */
#define USART_RXPL_bs 0                 /*   bit shift */
#define USART_BDF_bm 0x2                /* Break Detected Flag */
#define USART_DREIF_bm 0x20             /* Data Register Empty Flag */
#define USART_ISFIF_bm 0x8              /* Inconsistent Sync Field Int'r Flag */
#define USART_RXCIF_bm 0x80             /* Receive Complete Interrupt Flag */
#define USART_RXSIF_bm 0x10             /* Receive Start Interrupt */
#define USART_TXCIF_bm 0x40             /* Transmit Interrupt Flag */
#define USART_WFB_bm 0x1                /* Wait For Break */
#define USART_DATA8_bm 0x1              /* Transmit Data Reg (CHSIZE=9bit) */
#define USART_DATA_gm 0xff              /* Transmit Data Register */
#define USART_DATA_bs 0                 /*   bit shift */
#define USART_TXPL_gm 0xff              /* Transmit pulse length */
#define USART_TXPL_bs 0                 /*   bit shift */

typedef enum {
  USART_RS485_OFF_gc = (0x00 << 0),     /* RS485 Mode disabled */
  USART_RS485_EXT_gc = (0x01 << 0),     /* RS485 Mode External drive */
  USART_RS485_INT_gc = (0x02 << 0),     /* RS485 Mode Internal drive */
} USART_RS485_t;

typedef enum {
  USART_RXMODE_NORMAL_gc = (0x0 << 1),  /* Normal mode */
  USART_RXMODE_CLK2X_gc = (0x1 << 1),   /* CLK2x mode */
  USART_RXMODE_GENAUTO_gc = (0x2 << 1), /* Generic autobaud mode */
  USART_RXMODE_LINAUTO_gc = (0x3 << 1), /* LIN constrained autobaud mode */
} USART_RXMODE_t;

typedef enum {
  USART_MSPI_CMODE_ASYNCHRONOUS_gc = (0x00 << 0), /* Asynchronous Mode */
  USART_MSPI_CMODE_SYNCHRONOUS_gc = (0x01 << 0), /* Synchronous Mode */
  USART_MSPI_CMODE_IRCOM_gc = (0x02 << 0), /* Infrared Communication */
  USART_MSPI_CMODE_MSPI_gc = (0x03 << 0), /* Master SPI Mode */
} USART_MSPI_CMODE_t;

typedef enum {
  USART_NORMAL_CHSIZE_5BIT_gc = (0x00 << 0), /* Character size: 5 bit */
  USART_NORMAL_CHSIZE_6BIT_gc = (0x01 << 0), /* Character size: 6 bit */
  USART_NORMAL_CHSIZE_7BIT_gc = (0x02 << 0), /* Character size: 7 bit */
  USART_NORMAL_CHSIZE_8BIT_gc = (0x03 << 0), /* Character size: 8 bit */
  USART_NORMAL_CHSIZE_9BITL_gc = (0x06 << 0), /* Character size: 9 bit read low byte first */
  USART_NORMAL_CHSIZE_9BITH_gc = (0x07 << 0), /* Character size: 9 bit read high byte first */
} USART_NORMAL_CHSIZE_t;

typedef enum {
  USART_NORMAL_CMODE_ASYNCHRONOUS_gc = (0x00 << 0), /* Asynchronous Mode */
  USART_NORMAL_CMODE_SYNCHRONOUS_gc = (0x01 << 0), /* Synchronous Mode */
  USART_NORMAL_CMODE_IRCOM_gc = (0x02 << 0), /* Infrared Communication */
  USART_NORMAL_CMODE_MSPI_gc = (0x03 << 0), /* Master SPI Mode */
} USART_NORMAL_CMODE_t;

typedef enum {
  USART_NORMAL_PMODE_DISABLED_gc = (0x00 << 0), /* No Parity */
  USART_NORMAL_PMODE_EVEN_gc = (0x02 << 0), /* Even Parity */
  USART_NORMAL_PMODE_ODD_gc = (0x03 << 0), /* Odd Parity */
} USART_NORMAL_PMODE_t;

typedef enum {
  USART_NORMAL_SBMODE_1BIT_gc = (0x0 << 0), /* 1 stop bit */
  USART_NORMAL_SBMODE_2BIT_gc = (0x1 << 0), /* 2 stop bits */
} USART_NORMAL_SBMODE_t;

typedef enum {
  USART_ABW_WDW0_gc = (0x0 << 6),       /* 18% tolerance */
  USART_ABW_WDW1_gc = (0x1 << 6),       /* 15% tolerance */
  USART_ABW_WDW2_gc = (0x2 << 6),       /* 21% tolerance */
  USART_ABW_WDW3_gc = (0x3 << 6),       /* 25% tolerance */
} USART_ABW_t;

#define RXDATAL_OFFSET 0x0              /* Receive Data Low Byte */
#define RXDATAH_OFFSET 0x1              /* Receive Data High Byte */
#define TXDATAL_OFFSET 0x2              /* Transmit Data Low Byte */
#define TXDATAH_OFFSET 0x3              /* Transmit Data High Byte */
#define STATUS_OFFSET 0x4               /* Status */
#define CTRLA_OFFSET 0x5                /* Control A */
#define CTRLB_OFFSET 0x6                /* Control B */
#define CTRLC_OFFSET 0x7                /* Control C */
#define BAUDL_OFFSET (0x8+0)            /* Baud Rate */
#define BAUDH_OFFSET (0x8+1)            /* Baud Rate */
#define CTRLD_OFFSET 0xA                /* Control D */
#define DBGCTRL_OFFSET 0xB              /* Debug Control */
#define EVCTRL_OFFSET 0xC               /* Event Control */
#define TXPLCTRL_OFFSET 0xD        /* IRCOM Transmitter Pulse Length Control */
#define RXPLCTRL_OFFSET 0xE           /* IRCOM Receiver Pulse Length Control */

uint8_t usart_rd(usart_t *usart, int addr) {
  usart_reg_t *reg = usart->reg;
  uint16_t offs = addr - usart->base_addr;

  switch (offs) {
  case RXDATAL_OFFSET:                  /* Receive Data Low Byte */
    return reg->RXDATAL;
    break;
  case RXDATAH_OFFSET:                  /* Receive Data High Byte */
    return reg->RXDATAH;
    break;
  case TXDATAL_OFFSET:                  /* Transmit Data Low Byte */
    return reg->TXDATAL;
    break;
  case TXDATAH_OFFSET:                  /* Transmit Data High Byte */
    return reg->TXDATAH;
    break;
  case STATUS_OFFSET:                   /* Status */
    reg->STATUS |= USART_DREIF_bm;
    return reg->STATUS;
    break;
  case CTRLA_OFFSET:                    /* Control A */
    return reg->CTRLA;
    break;
  case CTRLB_OFFSET:                    /* Control B */
    return reg->CTRLB;
    break;
  case CTRLC_OFFSET:                    /* Control C */
    return reg->CTRLC;
    break;
  case BAUDL_OFFSET:                    /* Baud Rate */
    return reg->BAUDL;
    break;
  case BAUDH_OFFSET:                    /* Baud Rate */
    return reg->BAUDH;
    break;
  case CTRLD_OFFSET:                    /* Control D */
    return reg->CTRLD;
    break;
  case DBGCTRL_OFFSET:                  /* Debug Control */
    return reg->DBGCTRL;
    break;
  case EVCTRL_OFFSET:                   /* Event Control */
    return reg->EVCTRL;
    break;
  case TXPLCTRL_OFFSET:            /* IRCOM Transmitter Pulse Length Control */
    return reg->TXPLCTRL;
    break;
  case RXPLCTRL_OFFSET:               /* IRCOM Receiver Pulse Length Control */
    return reg->RXPLCTRL;
    break;
  default:
    abort();
    break;
  }
}

int st = 0; // 0: wf alo; 1: wf ahi; 2: wf len; 3: wf ln bytes
int ln = 0;
uint16_t ad;
uint8_t alo;

void usart_wr(usart_t *usart, int addr, uint8_t val) {
  usart_reg_t *reg = usart->reg;
  uint16_t offs = addr - usart->base_addr;

  switch (offs) {
  case RXDATAL_OFFSET:                  /* Receive Data Low Byte */
    reg->RXDATAL = val;
    break;
  case RXDATAH_OFFSET:                  /* Receive Data High Byte */
    reg->RXDATAH = val;
    break;
  case TXDATAL_OFFSET:                  /* Transmit Data Low Byte */
    reg->TXDATAL = val;
    switch (st) {
    case 0: if (val) { alo = val; st = 1; } break;
    case 1: ad = 256*val + alo; printf("0x%04X\n", ad); st = 2; break;
    case 2: ln = val; printf("%d\n", ln); st = 3; break;
    case 3: printf("0x%02X\n", val); ln--; if (ln == 0) st = 0; break;
    }
    break;
  case TXDATAH_OFFSET:                  /* Transmit Data High Byte */
    reg->TXDATAH = val;
    break;
  case STATUS_OFFSET:                   /* Status */
    reg->STATUS = val;
    break;
  case CTRLA_OFFSET:                    /* Control A */
    reg->CTRLA = val;
    break;
  case CTRLB_OFFSET:                    /* Control B */
    reg->CTRLB = val;
    break;
  case CTRLC_OFFSET:                    /* Control C */
    reg->CTRLC = val;
    break;
  case BAUDL_OFFSET:                    /* Baud Rate */
    reg->BAUDL = val;
    break;
  case BAUDH_OFFSET:                    /* Baud Rate */
    reg->BAUDH = val;
    break;
  case CTRLD_OFFSET:                    /* Control D */
    reg->CTRLD = val;
    break;
  case DBGCTRL_OFFSET:                  /* Debug Control */
    reg->DBGCTRL = val;
    break;
  case EVCTRL_OFFSET:                   /* Event Control */
    reg->EVCTRL = val;
    break;
  case TXPLCTRL_OFFSET:            /* IRCOM Transmitter Pulse Length Control */
    reg->TXPLCTRL = val;
    break;
  case RXPLCTRL_OFFSET:               /* IRCOM Receiver Pulse Length Control */
    reg->RXPLCTRL = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
