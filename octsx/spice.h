/* spice.h
 *
 * Copyright (C) 2021-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef SPICE_H__
#define SPICE_H__

#include "octbx.h"

#define SPC_ADC_MAX 10
#define SPC_DAC_MAX 10
#define SPC_MEA_MAX 10

typedef struct spice_dac {
  char *name;				/* spice name */
  iopin_t *pin;				/* connection */
  double av[2];				/* int'val beg, end values */
} spice_dac_t;

typedef struct spice_adc {
  char *name;				/* spice name */
  iopin_t *pin;				/* connection */
} spice_adc_t;

typedef spice_adc_t spice_mea_t;

typedef struct spice {
  void *hdl;				/* handle */
  int dt_ns;				/* tmsch delta-T (ns) */
  tmevt_t *evt;
  int nadc;
  char **adc_names;
  spice_adc_t adcs[SPC_ADC_MAX];
  int ndac;
  char **dac_names;
  spice_dac_t dacs[SPC_DAC_MAX];
  int nmea;
  char **mea_names;
  spice_mea_t meas[SPC_MEA_MAX];
  double tv[2];
  logr_t *logr;
} spice_t;

void spice_init(spice_t *, struct tmsch *clk, int argc, char **argv);
void spice_fini(spice_t *);

//#include "N_CIR_XyceCInterface.h"

#endif
/* --- last line --- */
