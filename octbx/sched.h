/* sched.h
 * 
 * Copyright (C) 2019-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
/* ideas
 *   tmsch keep
 *   tksch => tkosc (oscillator)
 *   tmevt => tmact (action)
 *   tkevt => tmact (action)
 */
#ifndef LIBSIM_SCHED_H__
#define LIBSIM_SCHED_H__

#include <stdint.h>

#define NANOSEC 1000000000
#define PICOSEC 1000000000000
#define FEMPSEC 1000000000000000

/* only in TM */
#define NEPS_OSC	(1)

/* only in TK */
#define NEPS_TICK	(-98)
#define NEPS_CPU	(+5)		/* needs work */
#define NEPS_TICKPOST	(1)

/* in both */
#define NEPS_BREAK	(-99)
#define NEPS_TLMPRE	(-1)
#define NEPS_TLMPOST	(99)

#define TK_INF		(~((osctime_t)0))

typedef struct simtime {
  int32_t sec;				/* seconds */
  int32_t nsec;				/* nano-seconds => ssec ?? */
} simtime_t;

uint32_t u_genseed(void);
uint32_t make_rand();			/* generate random from time */
float nml_rand(unsigned int *seedp);

int tm_lt(simtime_t a, simtime_t b);
int tm_le(simtime_t a, simtime_t b);
int tm_gt(simtime_t a, simtime_t b);
int tm_ge(simtime_t a, simtime_t b);

simtime_t tm_add_ns(simtime_t ts, int nsec);
simtime_t tm_add(simtime_t a, simtime_t b);
float tm_to_float(simtime_t a);
simtime_t tm_from_float(float t);

struct tmsch;

typedef void (tmevt_rout_t)(void *, struct tmsch *);

typedef struct tmevt {
  struct tmevt *prev;
  struct tmevt *next;
  simtime_t when;
  int8_t neps;
  tmevt_rout_t *rout;
  void *arg;
  const char *name;
} tmevt_t;

#define TMSCH_NEVT 64			/* main, spice, one-per-osc */

typedef struct tmsch {
  tmevt_t todo;
  tmevt_t done;
  tmevt_t *evt;
  simtime_t time;
  tmevt_t evts[TMSCH_NEVT];
} tmsch_t;

void tmsch_init(tmsch_t *sch);
tmevt_t *tmsch_sched(tmsch_t *sch, simtime_t when, int8_t neps,
		     tmevt_rout_t *rout, void *arg);
tmevt_t *tmsch_cancel(tmsch_t *sch, tmevt_t *evt);
void tmsch_run(tmsch_t *sch, simtime_t to, int neps);
void tmsch_print(tmsch_t *sch);

void tmsch_break_ev(void *arg, tmsch_t *sch);


/* oscillator, a tkosc, driven by tmsch
 * clock, driven by tkosc, w/ prescalar
 */

typedef uint64_t osctick_t;
typedef uint64_t clktick_t;

int tk_lt(osctick_t a, osctick_t b);
int tk_le(osctick_t a, osctick_t b);
int tk_gt(osctick_t a, osctick_t b);
int tk_ge(osctick_t a, osctick_t b);

#define TKOSC_NEVT 256			/* need a lot here */

struct tkosc;
struct tkclk;

typedef void (tkevt_rout_t)(void *, struct tkclk *);

/* tick event */
typedef struct tkevt {
  struct tkevt *prev;
  struct tkevt *next;
  struct tkclk *clk;
  osctick_t when;
  int8_t neps;
  tkevt_rout_t *rout;
  void *arg;
  const char *name;
} tkevt_t;

/* set up as a scheduler but also view as an event */

typedef struct tkosc {
  tkevt_t todo;				/* scheduled */
  tkevt_t done;				/* free */
  tkevt_t *evt;				/* currently running */

  osctick_t tick;			/* tick */
  simtime_t time;			/* time at tick */
  float drift;				/* drift at tick */
  uint32_t seed;		        /* rand number seed */
  
  tmsch_t *tmsch;			/* scheduler for ticks */
  tmevt_t *tmevt;			/* scheduled tick event */
  uint32_t neps;			/* neps on tmsch */
  tkevt_t *tkevt;			/* tick event */

  /* params */
  float tick_per;			/* nominal tick dur (s) */
  float allan_dev;			/* allan deviation (ppm) */
  float drift_dev;			/* drift deviation (ppm) */
  float drift_rate;			/* 1/ drift time  (s) */
  uint32_t step;		        /* step size in ticks */

  /* event heap */
  tkevt_t evts[TKOSC_NEVT];	        /* event list */
} tkosc_t;

void tkosc_break_evt(void *arg, struct tkclk *clk);

void tkosc_init(tkosc_t *sch, struct tmsch *tmsch);
void tkosc_sync(tkosc_t *sch);
void tkosc_print(tkosc_t *sch);

tkevt_t *tkosc_sched(tkosc_t *sch, osctick_t when, int8_t neps,
		     tkevt_rout_t *rout, void *arg);
tkevt_t *tkosc_cancel(tkosc_t *sch, tkevt_t *evt);


/* oscillator, a tkosc, driven by tmsch
 * clock, driven by tkosc, w/ prescalar
 */

typedef struct tkclk {
  tkosc_t *osc;				/* oscillator */
  clktick_t tick;			/* clock tick = osctick/div */
  uint16_t div;
} tkclk_t;

void tkclk_init(tkclk_t *, tkosc_t *tkosc, uint16_t div);
tkevt_t *tkclk_sched(tkclk_t *clk, uint32_t delta, int8_t neps,
		     tkevt_rout_t *rout, void *arg);
tkevt_t *tkclk_cancel(tkclk_t *clk, tkevt_t *evt);

#endif
/* --- last line --- */
