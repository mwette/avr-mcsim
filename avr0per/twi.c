/* TWI - Two-Wire Interface 
 *
 * Copyright (C) 2021,2023 Matthew Wette
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
#include "twi.h"

void twi_init(twi_t *twi, mcu_t *mcu, uint16_t addr) {
  twi->mcu = mcu;
  twi->base_addr = addr;
  twi->reg = (twi_reg_t *)&mcu->cpu.data[addr];
}

void twi_fini(twi_t *twi) {
}  

#define TWI_ENABLE_bm 0x1               /* Enable TWI Master */
#define TWI_QCEN_bm 0x10                /* Quick Command Enable */
#define TWI_RIEN_bm 0x80                /* Read Interrupt Enable */
#define TWI_SMEN_bm 0x2                 /* Smart Mode Enable */
#define TWI_TIMEOUT_gm 0xc              /* Inactive Bus Timeout */
#define TWI_TIMEOUT_bs 2                /*   bit shift */
#define TWI_WIEN_bm 0x40                /* Write Interrupt Enable */
#define TWI_ACKACT_bm 0x4               /* Acknowledge Action */
#define TWI_FLUSH_bm 0x8                /* Flush */
#define TWI_MCMD_gm 0x3                 /* Command */
#define TWI_MCMD_bs 0                   /*   bit shift */
#define TWI_ARBLOST_bm 0x8              /* Arbitration Lost */
#define TWI_BUSERR_bm 0x4               /* Bus Error */
#define TWI_BUSSTATE_gm 0x3             /* Bus State */
#define TWI_BUSSTATE_bs 0               /*   bit shift */
#define TWI_CLKHOLD_bm 0x20             /* Clock Hold */
#define TWI_RIF_bm 0x80                 /* Read Interrupt Flag */
#define TWI_RXACK_bm 0x10               /* Received Acknowledge */
#define TWI_WIF_bm 0x40                 /* Write Interrupt Flag */
#define TWI_ADDREN_bm 0x1               /* Address Enable */
#define TWI_ADDRMASK_gm 0xfe            /* Address Mask */
#define TWI_ADDRMASK_bs 1               /*   bit shift */
#define TWI_APIEN_bm 0x40               /* Address/Stop Interrupt Enable */
#define TWI_DIEN_bm 0x80                /* Data Interrupt Enable */
#define TWI_ENABLE_bm 0x1               /* Enable TWI Slave */
#define TWI_PIEN_bm 0x20                /* Stop Interrupt Enable */
#define TWI_PMEN_bm 0x4                 /* Promiscuous Mode Enable */
#define TWI_SMEN_bm 0x2                 /* Smart Mode Enable */
#define TWI_ACKACT_bm 0x4               /* Acknowledge Action */
#define TWI_SCMD_gm 0x3                 /* Command */
#define TWI_SCMD_bs 0                   /*   bit shift */
#define TWI_AP_bm 0x1                   /* Slave Address or Stop */
#define TWI_APIF_bm 0x40                /* Address/Stop Interrupt Flag */
#define TWI_BUSERR_bm 0x4               /* Bus Error */
#define TWI_CLKHOLD_bm 0x20             /* Clock Hold */
#define TWI_COLL_bm 0x8                 /* Collision */
#define TWI_DIF_bm 0x80                 /* Data Interrupt Flag */
#define TWI_DIR_bm 0x2                  /* Read/Write Direction */
#define TWI_RXACK_bm 0x10               /* Received Acknowledge */

typedef enum {
  TWI_DEFAULT_SDAHOLD_OFF_gc = (0x00 << 0), /* SDA hold time off */
  TWI_DEFAULT_SDAHOLD_50NS_gc = (0x01 << 0), /* Typical 50ns hold time */
  TWI_DEFAULT_SDAHOLD_300NS_gc = (0x02 << 0), /* Typical 300ns hold time */
  TWI_DEFAULT_SDAHOLD_500NS_gc = (0x03 << 0), /* Typical 500ns hold time */
} TWI_DEFAULT_SDAHOLD_t;

typedef enum {
  TWI_DEFAULT_SDASETUP_4CYC_gc = (0x0 << 0), /* SDA setup time is 4 cycles */
  TWI_DEFAULT_SDASETUP_8CYC_gc = (0x1 << 0), /* SDA setup time is 8 cycles */
} TWI_DEFAULT_SDASETUP_t;

typedef enum {
  TWI_TIMEOUT_DISABLED_gc = (0x00 << 2), /* Bus Timeout Disabled */
  TWI_TIMEOUT_50US_gc = (0x01 << 2),    /* 50 Microseconds */
  TWI_TIMEOUT_100US_gc = (0x02 << 2),   /* 100 Microseconds */
  TWI_TIMEOUT_200US_gc = (0x03 << 2),   /* 200 Microseconds */
} TWI_TIMEOUT_t;

typedef enum {
  TWI_ACKACT_ACK_gc = (0x0 << 2),       /* Send ACK */
  TWI_ACKACT_NACK_gc = (0x1 << 2),      /* Send NACK */
} TWI_ACKACT_t;

typedef enum {
  TWI_MCMD_NOACT_gc = (0x00 << 0),     /* No Action */
  TWI_MCMD_REPSTART_gc = (0x01 << 0),  /* Issue Repeated Start Cond */
  TWI_MCMD_RECVTRANS_gc = (0x02 << 0), /* Recv or Xmit Data, dep. on DIR */
  TWI_MCMD_STOP_gc = (0x03 << 0),      /* Issue Stop Condition */
} TWI_MCMD_t;

typedef enum {
  TWI_BUSSTATE_UNKNOWN_gc = (0x00 << 0), /* Unknown Bus State */
  TWI_BUSSTATE_IDLE_gc = (0x01 << 0),   /* Bus is Idle */
  TWI_BUSSTATE_OWNER_gc = (0x02 << 0),  /* This Module Controls The Bus */
  TWI_BUSSTATE_BUSY_gc = (0x03 << 0),   /* The Bus is Busy */
} TWI_BUSSTATE_t;

typedef enum {
  TWI_SCMD_NOACT_gc = (0x00 << 0),      /* No Action */
  TWI_SCMD_COMPTRANS_gc = (0x02 << 0),  /* Used To Complete a Transaction */
  TWI_SCMD_RESPONSE_gc = (0x03 << 0),   /* Used in Resp to Addr/Data Intr */
} TWI_SCMD_t;

typedef enum {
  TWI_AP_STOP_gc = (0x0 << 0),          /* Stop condition generated APIF */
  TWI_AP_ADR_gc = (0x1 << 0),           /* Address detection generated APIF */
} TWI_AP_t;

#define TWI_CTRLA_OFFSET 0x0	       /* Control A */
#define TWI_DUALCTRL_OFFSET 0x1	       /* Dual Control */
#define TWI_DBGCTRL_OFFSET 0x2	       /* Debug Control Register */
#define TWI_MCTRLA_OFFSET 0x3	       /* Master Control A */
#define TWI_MCTRLB_OFFSET 0x4	       /* Master Control B */
#define TWI_MSTATUS_OFFSET 0x5	       /* Master Status */
#define TWI_MBAUD_OFFSET 0x6	       /* Master Baud Rate Control */
#define TWI_MADDR_OFFSET 0x7	       /* Master Address */
#define TWI_MDATA_OFFSET 0x8	       /* Master Data */
#define TWI_SCTRLA_OFFSET 0x9	       /* Slave Control A */
#define TWI_SCTRLB_OFFSET 0xA	       /* Slave Control B */
#define TWI_SSTATUS_OFFSET 0xB	       /* Slave Status */
#define TWI_SADDR_OFFSET 0xC	       /* Slave Address */
#define TWI_SDATA_OFFSET 0xD	       /* Slave Data */
#define TWI_SADDRMASK_OFFSET 0xE       /* Slave Address Mask */

/* bus observer state */
typedef enum {
  OST_DHCH,				/* SDA hi, SCL hi */
  OST_DHCL,				/* SHA hi, SCL lo */
  OST_DLCH,				/* SHA lo, SCL hi */
  OST_DLCL,				/* SHA lo, SCL lo */
  OST_WAIT,				/* waiting for DHCH */
} twi_ost_t;

typedef enum {
  SIG_NONE,
  SIG_START,
  SIG_STOP,
  SIG_LATCH,
  SIG_SHIFT,
  SIG_TMOUT,
  SIG_CMD_START,
  SIG_SDALO,
  SIG_SDAHI,
} twi_sig_t;

/* master state */
typedef enum {
  MST_UNKN,
  MST_IDLE,
  MST_WAIT,
  MST_EXEC
} twi_mst_t;

/* slave state - not used*/
typedef enum {
  SST_UNKN,
  SST_IDLE,
  SST_WAIT,
  SST_EXEC
} twi_sst_t;



static char *sigstr(twi_sig_t sig) {
  switch (sig) {
  case SIG_NONE: return "SIG_NONE"; break;
  case SIG_START: return "SIG_START"; break;
  case SIG_STOP: return "SIG_STOP"; break;
  case SIG_LATCH: return "SIG_LATCH"; break;
  case SIG_SHIFT: return "SIG_SHIFT"; break;
  case SIG_TMOUT: return "SIG_TMOUT"; break;
  case SIG_CMD_START: return "SIG_CMD_START"; break;
  case SIG_SDALO: return "SIG_SDALO"; break;
  case SIG_SDAHI: return "SIG_SDAHI"; break;
  }
}

static char *mststr(int st) {
  switch (st) {
  case 0: return "MST_UNKN"; break;
  case 1: return "MST_IDLE"; break;
  case 2: return "MST_WAIT"; break;
  case 3: return "MST_EXEC"; break;
  default: abort(); break;
  }
}

static void twi_master_act(void *arg, tkclk_t *clk);
static void twi_slave_act(void *arg, tkclk_t *clk);


/* bus observer */
static twi_sig_t twm_obsv(twi_t *twi, struct iopin *pin, int lev) {
  twi_reg_t *reg = twi->reg;
  iopin_t *sda = twi->m.sda_pin;
  iopin_t *scl = twi->m.scl_pin;
  twi_sig_t msg;

  iprint(0, "M_obsv: %s => %d\n", (pin == sda)? "SDA": "SCL", lev); 
	 
  msg = SIG_NONE;
  if (pin == sda) {
    switch (twi->m.ost) {
    case OST_DHCH:
      if (lev == 0) { twi->m.ost = OST_DLCH; msg = SIG_START; }
      break;
    case OST_DHCL:
      if (lev == 0) { twi->m.ost = OST_DLCL; msg = SIG_SDALO; }
      break;
    case OST_DLCH:
      if (lev == 1) { twi->m.ost = OST_DHCH; msg = SIG_STOP; }
      break;
    case OST_DLCL:
      if (lev == 1) { twi->m.ost = OST_DHCL; msg = SIG_SDAHI; }
      break;
    case OST_WAIT:
      if ((sda->rdlev == 1) && (scl->rdlev == 1)) { twi->m.ost = OST_DHCH; }
      break;
    }
  } else if (pin == scl) {
    switch (twi->m.ost) {
    case OST_DHCH:
      if (lev == 0) { twi->m.ost = OST_DHCL; msg = SIG_SHIFT; }
      break;
    case OST_DHCL:
      if (lev == 1) { twi->m.ost = OST_DHCH; msg = SIG_LATCH; }
      break;
    case OST_DLCH:
      if (lev == 0) { twi->m.ost = OST_DLCL; msg = SIG_SHIFT; }
      break;
    case OST_DLCL:
      if (lev == 1) { twi->m.ost = OST_DLCH; msg = SIG_LATCH; }
      break;
    case OST_WAIT:
      if ((sda->rdlev == 1) && (scl->rdlev == 1)) { twi->m.ost = OST_DHCH; }
      break;
    }
  } else {
    abort();
  }
  return msg;
}

/* master SCL
  1) TMOUT/pin_wrD(scl, 0) -> 2
  2) SHIFT/wait(t_lo) -> 3
  3) TMOUT/pin_wr(scl, 1) -> 1
*/

static void twm_step(twi_t *twi, twi_sig_t sig) {
  twi_reg_t *reg = twi->reg;
  iopin_t *sda = twi->m.sda_pin;
  iopin_t *scl = twi->m.scl_pin;
  tkclk_t *clk = &twi->mcu->clk_per;
  
  printf("M_step: src=%d sig=%s\n", twi->m.xst, sigstr(sig));
  switch (twi->m.xst) {
  case 0:
    if (scl->rdlev == 0) abort();
    if (sig == SIG_CMD_START) {
      printf("  M -> SDA 0\n");
      iopin_wrD(sda, 0);
      twi->m.xst = 10;
      twi->m.evt = tkclk_sched(clk, twi->m.t_su, +1, twi_master_act, twi);
    }
    break;

  case 10:
    switch (sig) {
    case SIG_START:
      break;
    case SIG_TMOUT:
      twi->m.evt = 0;
      printf("  M -> SCL 0\n");
      iopin_wrD(scl, 0);
      twi->m.xst = 11;
      twi->m.cnt = 0x80;
      twi->m.evt = tkclk_sched(clk, twi->m.t_lo, +1, twi_master_act, twi);
      break;
    default:
      abort();
      break;
    }
    break;
  case 11:				/* SCL lo, set SDA */
    if (sig == SIG_SHIFT) {
      printf("  M -> SDA %d %2x\n", (reg->MADDR&twi->m.cnt)?1:0, twi->m.cnt);
      iopin_wrD(sda, (reg->MADDR & twi->m.cnt)? 1: 0);
      twi->m.cnt >>= 1;
      twi->m.xst = 12;
    } else abort();
    break;
  case 12:
    switch (sig) {
    case SIG_SDAHI:
    case SIG_SDALO:
      break;
    case SIG_TMOUT:
      twi->m.evt = 0;
      printf("  M -> SCL 1\n");
      iopin_wrD(scl, 1);
      twi->m.xst = 13;
      break;
    default:
      abort();
    }
    break;
  case 13:
    if (sig == SIG_LATCH) {
      twi->m.xst = 14;
      twi->m.evt = tkclk_sched(clk, twi->m.t_hi, +2, twi_master_act, twi);
    } else abort();
    break;
  case 14:
    /* addr bit held w/ SCL hi, now sink it */
    if (sig == SIG_TMOUT) {
      twi->m.evt = 0;
      printf("  M -> SCL 0\n");
      iopin_wrD(scl, 0);
      twi->m.evt = tkclk_sched(clk, twi->m.t_lo, +1, twi_master_act, twi);
      if (twi->m.cnt == 0) {
	twi->m.xst = 20;
      } else {
	twi->m.xst = 11;
      }
    } else abort();
    break;
    
  case 20:
    if (sig == SIG_SHIFT) {
      printf("  M -> SDA 1 (let slave pull)\n");
      iopin_wrD(sda, 1);		/* release so slave can act */
      twi->m.xst = 21;
    } else abort();
    break;
  case 21:
    /* raise SCL, then wait for SCLhi */
    if (sig == SIG_TMOUT) {
      twi->m.evt = 0;
      printf("  M -> SCL 1\n");
      iopin_wrD(scl, 1);
      twi->m.evt = tkclk_sched(clk, twi->m.t_hi, +1, twi_master_act, twi);
      twi->m.xst = 22;
    }
    break;
  case 22:
    /* latch SDA */
    if (sig == SIG_TMOUT) {
      printf("  M -> SCL 0\n");
      iopin_wrD(scl, 0);
      twi->m.xst = 23;
    }
  case 23:
    if (sig == SIG_SHIFT) {
      if (sda->rdlev == 0) {
	/* ACK */
	printf("  M got ack\n");
	twi->m.xst = 23;
      } else {
	/* NACK */
	printf("  M got nack; TODO: abort transx\n");
	// If NACK, then abort.
	twi->m.xst = 0;
      }
      twi->m.evt = tkclk_sched(clk, twi->m.t_lo, +1, twi_master_act, twi);
    }
    break;

    /* read */
  case 30:
    break;

    /* write */
  case 40:
    break;
    
  default:
    abort();
    break;
  }
}

static void hey_twm_per(void *per, struct iopin *pin, int op, int arg) {
  twi_t *twi = per;
  twi_reg_t *reg = twi->reg;
  twi_sig_t sig;

  if ((reg->MCTRLA & TWI_ENABLE_bm) == 0) return;
  
  if (pin == twi->m.sda_pin) {
    //printf("twm: SDA pin =>%d\n", arg);
  } else if (pin == twi->m.scl_pin) {
    //printf("twm: SCL pin =>%d\n", arg);
  } else {
    abort();
  }
  sig = twm_obsv(twi, pin, arg);
  twm_step(twi, sig);
}


/* bus observer state === SCL|SDA/msg ===> state */
static twi_sig_t tws_obsv(twi_t *twi, struct iopin *pin, int lev) {
  twi_reg_t *reg = twi->reg;
  iopin_t *sda = twi->s.sda_pin;
  iopin_t *scl = twi->s.scl_pin;
  twi_sig_t msg;

  iprint(2, "S_obsv: %s => %d\n", (pin == sda)? "SDA": "SCL", lev); 
	 
  msg = SIG_NONE;
  if (pin == sda) {
    switch (twi->s.ost) {
    case OST_DHCH:
      if (lev == 0) { twi->s.ost = OST_DLCH; msg = SIG_START; }
      break;
    case OST_DHCL:
      if (lev == 0) { twi->s.ost = OST_DLCL; msg = SIG_SDALO; }
      break;
    case OST_DLCH:
      if (lev == 1) { twi->s.ost = OST_DHCH; msg = SIG_STOP; }
      break;
    case OST_DLCL:
      if (lev == 1) { twi->s.ost = OST_DHCL; msg = SIG_SDAHI; }
      break;
    case OST_WAIT:
      if ((sda->rdlev == 1) && (scl->rdlev == 1)) { twi->s.ost = OST_DHCH; }
      break;
    }
  } else if (pin == scl) {
    switch (twi->s.ost) {
    case OST_DHCH:
      if (lev == 0) { twi->s.ost = OST_DHCL; msg = SIG_SHIFT; }
      break;
    case OST_DHCL:
      if (lev == 1) { twi->s.ost = OST_DHCH; msg = SIG_LATCH; }
      break;
    case OST_DLCH:
      if (lev == 0) { twi->s.ost = OST_DLCL; msg = SIG_SHIFT; }
      break;
    case OST_DLCL:
      if (lev == 1) { twi->s.ost = OST_DLCH; msg = SIG_LATCH; }
      break;
    case OST_WAIT:
      if ((sda->rdlev == 1) && (scl->rdlev == 1)) { twi->s.ost = OST_DHCH; }
      break;
    }
  } else {
    abort();
  }
  return msg;
}

/*
 * notes:
 *  t_lo is from iopin_wrD(scl, 0) to iopin_wrD(scl, 1)
 *  t_hi is from SCLHI to iopin_wrD(scl, 0)
 *  ^ see Fig 25-14 in mega4809.pdf
 */

static void tws_step(twi_t *twi, twi_sig_t sig) {
  twi_reg_t *reg = twi->reg;
  iopin_t *sda = twi->s.sda_pin;
  iopin_t *scl = twi->s.scl_pin;
  tkclk_t *clk = &twi->mcu->clk_per;
  
  iprint(2, "S_step: src=%d sig=%s\n", twi->s.xst, sigstr(sig));
  switch (twi->s.xst) {
  case 0:				/* waiting for start */
    if (sig == SIG_START) {
      iprint(2, "  S start/\n");
      twi->s.xst = 10;
      twi->s.cnt = 0x00;
    } else {
      iprint(2, "  S waiting\n");
    }
    break;
  case 10:
    if (sig == SIG_SHIFT) {
      twi->s.cnt = twi->s.cnt? twi->s.cnt >> 1: 0x80;
      twi->s.xst = 20;
    } else abort();
    break;
  case 20:
    switch (sig) {
    case SIG_LATCH:
      twi->s.xst = 0;			/* assume miss unless addr bit match */
      if (twi->s.cnt == 0x01) {
	if (sda->rdlev) {
	  iprint(2, "  S latch / RD\n");
	  //reg->SSTATUS |= 
	  twi->s.xst = 30;		/* ready to ack and read */
	} else {
	  iprint(2, "  S latch / WR\n");
	  /* ack and master write */
	  twi->s.xst = 40;
	}
      } else if ((((twi->s.cnt & reg->SADDR) != 0) && (sda->rdlev != 0)) ||
	  (((twi->s.cnt & reg->SADDR) == 0) && (sda->rdlev == 0))) {
	/* address+rw bit matches */
	iprint(2, "  S addr match %x\n", twi->s.cnt);
	twi->s.xst = 10;
      } else {
	iprint(2, "  S addr mismatch\n");
	twi->s.xst = 0;
      }
      break;
    case SIG_SDALO:
    case SIG_SDAHI:
      break;
    default:
      abort();
      break;
    }
    break;

    /* ack and read */
  case 30: /* ACK */
    /*
      if auto-ack do that, else interrupt
     */
    if (sig != SIG_SHIFT) abort(); // assert
    iprint(2, "  S -> SCL maybe-stretch\n");
    iopin_wrD(scl, 0);			/* SCL maybe stretch */
    iprint(2, "  S -> SDA 0\n");
    iopin_wrD(sda, 0);			/* ACK */
    twi->s.xst = 31;
    break;
  case 31:
    if (sig != SIG_SDALO) abort();
    iprint(2, "  S -> SCL maybe-stretch\n");
    iopin_wrD(scl, 1);			/* SCL release stretch */
    twi->s.xst = 32;
    break;
  case 32:
    if (sig != SIG_LATCH) abort();
    /* check level */
    twi->s.xst = 33;
    break;
  case 33:
    if (sig != SIG_SHIFT) abort();
    iprint(2, "  S -> SDA 1\n");
    iopin_wrD(sda, 1);			/* release SDA */
    twi->s.xst = 99;
    iprint(2, "  S DONE for now.\n");
    break;
    
    /* ack and write */
  case 40: /* ACK */
    if (sig != SIG_SHIFT) abort(); // assert
    iprint(2, "  S -> SCL 0\n");
    iopin_wrD(scl, 0);			/* SCL maybe stretch */
    twi->s.xst = 41;
    twi->s.evt = tkclk_sched(clk, twi->s.t_su, +1, twi_slave_act, twi);
    break;
  case 41:
    switch (sig) {
    case SIG_TMOUT:
      twi->s.evt = 0;
    case SIG_LATCH:
      iprint(2, "  S -> SDA 0\n");
      iopin_wrD(sda, 0);		/* ACK */
      twi->s.xst = 42;
      break;
    default:
      abort();
      break;
    }
    break;
  case 42: /* ACK, done */
    switch (sig) {
    case SIG_TMOUT:
      twi->s.evt = 0;
    case SIG_SDALO:
      iprint(2, "  S -> SCL 1\n");
      iopin_wrD(scl, 1);
      twi->s.xst = 99;
      iprint(2, "  S DONE for now.  need SDA up again\n");
      break;
    }
    break;
    
  case 8: /* NACK */
    if (sig != SIG_SHIFT) abort(); // assert
    iprint(2, "  S -> SCL 0\n");
    iopin_wrD(scl, 0);		    /* SCL already lo, just hold it */
    twi->s.xst = 81;
    twi->s.evt = tkclk_sched(clk, twi->s.t_lo, +1, twi_slave_act, twi);
    break;
  case 81:
    iprint(2, "  S -> SDA 0\n");
    iopin_wrD(sda, 1);		    /* sda lo => ACK */
    twi->s.xst = 82;
    break;
  case 82:
    if (sig == SIG_TMOUT) {
      iprint(2, "  S -> SCL 1\n");
      iopin_wrD(scl, 1);		/* release scl */
      twi->s.xst = 99;
    }
    break;
    
  case 89:
    if (sig == SIG_LATCH) {
      printf("  S latch/\n");
      twi->s.xst = 40;
    }
    break;
  case 99:
    /* hang out */
    break;

    /* ack and write */
  case 17:
    break;
    
  default:
    abort();
    break;
  }
}

static void hey_tws_per(void *per, struct iopin *pin, int op, int arg) {
  twi_t *twi = per;
  twi_reg_t *reg = twi->reg;
  iopin_t *sda = twi->s.sda_pin;
  //iopin_t *scl = twi->s.scl_pin;
  twi_sig_t sig;

  if ((reg->SCTRLA & TWI_ENABLE_bm) == 0) return;
  
  if (pin == twi->s.sda_pin) {
    //printf("tws: SDA pin =>%d\n", arg);
  } else if (pin == twi->s.scl_pin) {
    //printf("tws: SCL pin =>%d\n", arg);
  } else {
    abort();
  }
  
  //printf("TWS:\n");
  sig = tws_obsv(twi, pin, arg);
  tws_step(twi, sig);
}


static void twi_master_act(void *arg, tkclk_t *clk) {
  twi_t *twi = arg;

  twm_step(twi, SIG_TMOUT);
}

static void twi_slave_act(void *arg, tkclk_t *clk) {
  twi_t *twi = arg;

  tws_step(twi, SIG_TMOUT);
}

uint8_t twi_rd(twi_t *twi, int addr) {
  twi_reg_t *reg = twi->reg;
  uint16_t offs = addr - twi->base_addr;
  mcu_t *mcu = twi->mcu;

  switch (offs) {
  case TWI_CTRLA_OFFSET:		/* Control A */
    return reg->CTRLA;
    break;
  case TWI_DUALCTRL_OFFSET:		/* Dual Control */
    return reg->DUALCTRL;
    break;
  case TWI_DBGCTRL_OFFSET:		/* Debug Control Register */
    return reg->DBGCTRL;
    break;
  case TWI_MCTRLA_OFFSET:		/* Master Control A */
    return reg->MCTRLA;
    break;
  case TWI_MCTRLB_OFFSET:		/* Master Control B */
    return reg->MCTRLB;
    break;
  case TWI_MSTATUS_OFFSET:		/* Master Status */
    return reg->MSTATUS;
    break;
  case TWI_MBAUD_OFFSET:	       /* Master Baud Rate Control */
    return reg->MBAUD;
    break;
  case TWI_MADDR_OFFSET:		/* Master Address */
    return reg->MADDR;
    break;
  case TWI_MDATA_OFFSET:		/* Master Data */
    return reg->MDATA;
    break;
  case TWI_SCTRLA_OFFSET:		/* Slave Control A */
    return reg->SCTRLA;
    break;
  case TWI_SCTRLB_OFFSET:		/* Slave Control B */
    return reg->SCTRLB;
    break;
  case TWI_SSTATUS_OFFSET:		/* Slave Status */
    return reg->SSTATUS;
    break;
  case TWI_SADDR_OFFSET:		/* Slave Address */
    return reg->SADDR;
    break;
  case TWI_SDATA_OFFSET:		/* Slave Data */
    return reg->SDATA;
    break;
  case TWI_SADDRMASK_OFFSET:		/* Slave Address Mask */
    return reg->SADDRMASK;
    break;
  default:
    abort();
    break;
  }
}

void twi_wr(twi_t *twi, int addr, uint8_t val) {
  twi_reg_t *reg = twi->reg;
  uint16_t offs = addr - twi->base_addr;
  mcu_t *mcu = twi->mcu;
  iopin_t *sda, *scl;

  switch (offs) {
  case TWI_CTRLA_OFFSET:		/* Control A */
    reg->CTRLA = val;
    break;
  case TWI_DUALCTRL_OFFSET:		/* Dual Control */
    reg->DUALCTRL = val;
    break;
  case TWI_DBGCTRL_OFFSET:		/* Debug Control Register */
    reg->DBGCTRL = val;
    break;

  case TWI_MCTRLA_OFFSET:		/* Master Control A */
    sda = twi->m.sda_pin;
    scl = twi->m.scl_pin;
    if (val & TWI_ENABLE_bm) {
      printf("twm: enable\n");
      twi->m.ost = ((sda->rdlev == 1) && (scl->rdlev == 1))? OST_DHCH: OST_WAIT;
      sda->hey_per = hey_twm_per;
      sda->per = twi;
      iopin_wrD(sda, 1);
      scl->hey_per = hey_twm_per;
      scl->per = twi;
      iopin_wrD(scl, 1);
    } else {
      printf("twm: disable\n");
      if (sda->per == twi) {
	sda->hey_per = sda->def_hey_per;
	sda->per = sda->def_per;
      }
      if (scl->per == twi) {
	scl->hey_per = scl->def_hey_per;
	scl->per = scl->def_per;
      }
    }
    reg->MCTRLA = val;
    break;

  case TWI_MCTRLB_OFFSET:		/* Master Control B */
    reg->MCTRLB = val;
    break;
  case TWI_MSTATUS_OFFSET:		/* Master Status */
    reg->MSTATUS = val;
    break;
  case TWI_MBAUD_OFFSET:	       /* Master Baud Rate Control */
    reg->MBAUD = val;
    twi->m.t_hi = (int)(2*val/mcu->clk_per.osc->tick_per);
    twi->m.t_lo = (int)(10/mcu->clk_per.osc->tick_per);
    twi->m.t_su = twi->m.t_hi/4;
    printf("MBAUD=%d => t_hi=%d t_lo=%d t_su=%d\n", val,
	   twi->m.t_hi, twi->m.t_lo, twi->m.t_su);
    twi->s.t_hi = twi->m.t_hi; twi->s.t_lo = twi->m.t_lo;
    twi->s.t_su - twi->m.t_su;
    break;
  case TWI_MADDR_OFFSET:		/* Master Address */
    printf("twm: 0x%x => MADDR\n", val);
    twi->m.xst = 0;
    twi->m.cnt = 0;			/* clock out 8 addr */
    reg->MADDR = val;
    twm_step(twi, SIG_CMD_START);
    break;
  case TWI_MDATA_OFFSET:		/* Master Data */
    reg->MDATA = val;
    break;

  case TWI_SCTRLA_OFFSET:		/* Slave Control A */
    sda = twi->s.sda_pin;
    scl = twi->s.scl_pin;
    twi->s.xst = 0;
    twi->s.cnt = 0;			/* clock in 8 addr */
    if (val & TWI_ENABLE_bm) {
      printf("tws: enable\n");
      printf("tws: scl=%p\n", scl);
      twi->m.ost = ((sda->rdlev == 1) && (scl->rdlev == 1))? OST_DHCH: OST_WAIT;
      sda->dir = PIN_DIR_OUT;
      sda->wrlev = 1;
      sda->hey_per = hey_tws_per;
      sda->per = twi;
      iopin_wrD(sda, 1);
      scl->dir = PIN_DIR_OUT;
      scl->wrlev = 1;
      scl->hey_per = hey_tws_per;
      scl->per = twi;
      iopin_wrD(scl, 1);
    } else {
      printf("tws: disable\n");
      if (sda->per == twi) {
	sda->hey_per = sda->def_hey_per;
	sda->per = sda->def_per;
      }
      if (scl->per == twi) {
	scl->hey_per = scl->def_hey_per;
	scl->per = scl->def_per;
      }
    }
    reg->SCTRLA = val;
    break;

  case TWI_SCTRLB_OFFSET:		/* Slave Control B */
    reg->SCTRLB = val;
    break;
  case TWI_SSTATUS_OFFSET:		/* Slave Status */
    reg->SSTATUS = val;
    break;
  case TWI_SADDR_OFFSET:		/* Slave Address */
    printf("tws: 0x%x => SADDR\n", val);
    reg->SADDR = val;
    break;
  case TWI_SDATA_OFFSET:		/* Slave Data */
    reg->SDATA = val;
    break;
  case TWI_SADDRMASK_OFFSET:		/* Slave Address Mask */
    reg->SADDRMASK = val;
    break;
  default:
    abort();
    break;
  }
}

/* --- last line --- */
