/* sched.c
 * 
 * Copyright (C) 2019-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#include <stdio.h>			/* debug only? */
#include <assert.h>
#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>			/* gettimeofday() */
#include "sched.h"

#ifndef MIN
#define MIN(X,Y) ((X)<(Y)?(X):(Y))
#endif

static void foo() { exit(1); }
static void poo() { }

 void
__assert_fail(const char *ass, const char *fil, unsigned lin, const char *ftn)
{
  printf("assert(%s) failed in %s, line %d, %s()\n", ass, fil, lin, ftn);
  foo();
  __builtin_unreachable();
}

#define NML_NVAL 64
float nml_vals[] = {
  0.011306, 0.029920, 0.049304, 0.068830, 0.088423, 0.108068, 0.127766,
  0.147521, 0.167336, 0.187221, 0.207181, 0.227223, 0.247361, 0.267601,
  0.287951, 0.308422, 0.329024, 0.349766, 0.370661, 0.391719, 0.412952,
  0.434371, 0.455994, 0.477832, 0.499901, 0.522217, 0.544795, 0.567655,
  0.590815, 0.614298, 0.638124, 0.662318, 0.686906, 0.711917, 0.737382,
  0.763335, 0.789812, 0.816855, 0.844509, 0.872825, 0.901858, 0.931676,
  0.962344, 0.993945, 1.026571, 1.060329, 1.095345, 1.131757, 1.169736,
  1.209485, 1.251244, 1.295311, 1.342051, 1.391924, 1.445536, 1.503665,
  1.567392, 1.638233, 1.718457, 1.811662, 1.924169, 2.068822, 2.280390,
  2.417564,
};

uint32_t u_genseed(void) {
  struct timeval tv;

  gettimeofday(&tv, 0);
  return 0xfffff & (tv.tv_usec);
}

static uint32_t u_rand(uint32_t *seedp)
{
  assert(seedp != 0);
  *seedp = (*seedp) * 1103515245 + 12345;
  return(((*seedp)/65536) % 32768);
}

float nml_rand(uint32_t *seedp) {
  uint32_t x, rv = u_rand(seedp);
  
  x = (rv/2) % NML_NVAL;
  if (rv & 0x01) {
    return -nml_vals[x];
  } else {
    return +nml_vals[x];
  }
}

simtime_t tm_from_float(float f) {
  simtime_t tm;
  float intg;
  
  intg = floorf(f);
  tm.sec = (int)intg;
  tm.nsec = (int)(1.0e9*(f - intg));
  return tm;
}

float tm_to_float(simtime_t tm) {
  return tm.sec + 1.0e-9*tm.nsec;
}

int tm_eq(simtime_t a, simtime_t b) {
  return (a.sec == b.sec) && (a.nsec == b.nsec);
}

/* @deffn {C} int tm_lt(simtime_t a, simtime_t b)
 * A value of @code{-1} in the @code{sec} field is interpreted as
 * infinitly in the future.
 * @end deffn
 */
int tm_lt(simtime_t a, simtime_t b) {
  if (b.sec == -1) {
    return (a.sec >= 0);
  } else if (a.sec == -1) {
    return 0;
  } else if (a.sec < b.sec) {
    return 1;
  } else if (a.sec > b.sec) {
    return 0;
  } else if (a.nsec < b.nsec) {
    return 1;
  } else {
    return 0;
  }
}

int tm_le(simtime_t a, simtime_t b) {
  return 1 - tm_lt(b, a);
}

int tm_gt(simtime_t a, simtime_t b) {
  return tm_lt(b, a);
}
  
int tm_ge(simtime_t a, simtime_t b) {
  return 1 - tm_lt(a, b);
}

simtime_t tm_add_ns(simtime_t ts, int nsec) {
  ts.nsec += nsec;
  if (ts.nsec >= 1000000000) {
    ts.nsec -= 1000000000;
    ts.sec += 1;
  }
  return ts;
}

simtime_t tm_add(simtime_t a, simtime_t b) {
  simtime_t ts;

  ts = tm_add_ns(a, b.nsec);
  ts.sec += b.sec;
  return ts;
}

#define TMSCH_NEVT_DEF 256		/* main, spice, one-per-osc */

void tmsch_init(tmsch_t *sch, int nevt) {
  tmevt_t *evts;

  if (nevt <= 0) nevt = TMSCH_NEVT_DEF;
  memset(sch, 0, sizeof(tmsch_t));
  evts = sch->evts = malloc(nevt*sizeof(tmevt_t));
  evts = sch->evts;
  sch->done.next = &evts[0];
  evts[0].prev = &sch->done;
  for (int i = 1; i < nevt; i++) {
    evts[i-1].next = &evts[i];
    evts[i].prev = &evts[i-1];
  }
  evts[nevt-1].next = 0;
}

void tmsch_fini(tmsch_t *sch) {
  free(sch->evts);
  memset(sch, 0, sizeof(tmsch_t));
}


void tmsch_print(tmsch_t *sch) {
  tmevt_t *evt;

  printf("tmsch:\n");
  for (evt = sch->todo.next; evt; evt = evt->next) {
    if (evt->name) {
      printf("%4d.%09d %p %s\n", evt->when.sec, evt->when.nsec,
	     (void*)(evt->rout), evt->name);
    } else {
      printf("%4d.%09d %p\n", evt->when.sec, evt->when.nsec, (void*)(evt->rout));
    }
  }
}

tmevt_t *tmsch_sched(tmsch_t *sch, simtime_t when, int8_t neps,
		     tmevt_rout_t *rout, void *arg) {
  tmevt_t *evt, *prev, *next;

  assert((-100 < neps) && (neps != 0) && (neps < 100));

  /* alloc evt */
  if (sch->done.next == 0) abort();
  evt = sch->done.next;
  sch->done.next = evt->next;
  evt->when = when;
  evt->neps = neps;
  evt->rout = rout;
  evt->arg = arg;

  /* place on todo list */
  prev = &(sch->todo);
  next = sch->todo.next;
  while (next != 0) {
    if (tm_lt(evt->when, next->when)) {
      break;
    } else if (tm_eq(evt->when, next->when) && (evt->neps < next->neps)) {
      break;
    }
    prev = next;
    next = next->next;
  }
  if (prev) prev->next = evt;
  if (next) next->prev = evt;
  evt->prev = prev;
  evt->next = next;

  return evt;
}

tmevt_t *tmsch_cancel(tmsch_t *tmsch, tmevt_t *evt) {
  tmevt_t *prev, *next;

  assert(evt != 0);
  prev = evt->prev;
  next = evt->next;
  if (prev) prev->next = next;
  if (next) next->prev = prev;
  memset(evt, 0, sizeof(tmevt_t));
  evt->next = tmsch->done.next;
  tmsch->done.next = evt;
  return 0;
}

void tmsch_break_evt(void *arg, tmsch_t *sch) {
  //printf("breakpoint\n");
}

void tmsch_run(tmsch_t *tmsch, simtime_t to, int neps) {
  tmevt_t *evt, *prev, *next;
  tmevt_rout_t *rout;

  while (1) {
    evt = tmsch->todo.next;
    if (evt == 0) break;
    if (tm_lt(to, evt->when)) break;
    if (tm_eq(to, evt->when) && (neps < evt->neps)) break;
    prev = evt->prev;
    next = evt->next;
    if (prev) prev->next = next;
    if (next) next->prev = prev;
    tmsch->time = evt->when;
    tmsch->evt = evt;
    (*(rout = evt->rout))(evt->arg, tmsch);
    memset(evt, 0, sizeof(*evt));
    evt->next = tmsch->done.next;
    tmsch->done.next = evt;
    if (rout == tmsch_break_evt) return;
  }
  tmsch->time = to;
}

int tk_lt(osctick_t a, osctick_t b) {
  // (int64_t)(b - a) > 0? 1: 0;
  return a < b? 1: 0;
}

int tk_le(osctick_t a, osctick_t b) {
  return a <= b? 1: 0;
  //return (d & 0x8000)? 0: 1;
}

int tk_gt(osctick_t a, osctick_t b) {
  return 1 - tk_le(a, b);
}

int tk_ge(osctick_t a, osctick_t b) {
  return 1 - tk_le(a, b);
}

#define TKOSC_NEVT_DEF 512		/* need a lot here */

void tkosc_init(tkosc_t *tkosc, tmsch_t *tmsch, int nevt) {
  tkevt_t *evts;

  assert(tmsch != 0);
  
  memset(tkosc, 0, sizeof(tkosc_t));
  if (nevt <= 0) nevt = TKOSC_NEVT_DEF;
  evts = tkosc->evts = malloc(nevt*sizeof(tkevt_t));
  tkosc->done.next = &evts[0];
  evts[0].prev = &tkosc->done;
  for (int i = 1; i < nevt; i++) {
    evts[i-1].next = &evts[i];
    evts[i].prev = &evts[i-1];
  }
  evts[nevt-1].next = 0;
  tkosc->tmsch = tmsch;
  tkosc->neps = NEPS_OSC;
  tkosc->tick = 0;
  tkosc->time = tmsch->time;
  tkosc->seed = u_genseed();
  tkosc->step = 1;
}

void tkosc_fini(tkosc_t *tkosc) {
  free(tkosc->evts);
  memset(tkosc, 0, sizeof(tkosc_t));
}

void tkosc_print(tkosc_t *tkosc) {
  tkevt_t *evt;
  int nf;

  for (evt = tkosc->done.next, nf = 0; evt; evt = evt->next) nf++;

  printf("tkosc: tick=%ld  nfree=%d\n", tkosc->tick, nf);
  for (evt = tkosc->todo.next; evt; evt = evt->next) {
    if (evt->name) {
      printf("% 4ld %p %s\n", evt->when, (void*)(evt->rout), evt->name);
    } else {
      printf("% 4ld %p\n", evt->when, (void*)(evt->rout));
    }
  }
}

void tkosc_evt(void *arg, tmsch_t *tmsch);
void tkosc_tick_evt(void *arg, tkclk_t *tkclk);

tkevt_t *tkosc_sched(tkosc_t *tkosc, osctick_t when, int8_t neps,
		     tkevt_rout_t *rout, void *arg) {
  tmsch_t *tmsch = tkosc->tmsch;
  tkevt_t *evt, *prev, *next;
  osctick_t tick;
  simtime_t time;

  /* If not scheduled, start it. 
   * TODO: add osc attr struct arg to _init() and init there
   */
  if (tkosc->tmevt == 0) {
    tick = tkosc->tick; time = tmsch->time; 
    tkosc->tmevt = tmsch_sched(tmsch, time, tkosc->neps, tkosc_evt, tkosc);
  }

  assert((neps == NEPS_BREAK) || ((0 < neps) && (neps < 100)));

  /* alloc evt */
  if (tkosc->done.next == 0) abort();
  evt = tkosc->done.next;
  tkosc->done.next = evt->next;
  memset(evt, 0, sizeof(*evt));
  evt->when = when;
  evt->neps = neps;
  evt->rout = rout;
  evt->arg = arg;

  /* place on todo list */
  prev = &(tkosc->todo);
  next = tkosc->todo.next;
  while (next != 0) {
    if (tk_lt(evt->when, next->when)) break;
    if ((evt->when == next->when) && (evt->neps < next->neps)) break;
    prev = next;
    next = next->next;
  }
  if (prev) prev->next = evt;
  if (next) next->prev = evt;
  evt->prev = prev;
  evt->next = next;

  return evt;
}

tkevt_t *tkosc_cancel(tkosc_t *tkosc, tkevt_t *evt) {
  tkevt_t *prev, *next;

  prev = evt->prev;
  next = evt->next;
  if (prev) prev->next = next;
  if (next) next->prev = prev;
  memset(evt, 0, sizeof(tkevt_t));
  evt->next = tkosc->done.next;
  tkosc->done.next = evt;

  return 0;
}

void tkosc_break_evt(void *arg, tkclk_t *tkclk) {
  tkosc_t *tkosc = tkclk->osc;
  tmsch_t *tmsch = tkosc->tmsch;
  tkevt_t *next;
  tmevt_t *evt;
  
  evt = tmsch_sched(tmsch, tmsch->time, NEPS_BREAK, tmsch_break_evt, arg);
  evt->name = "tmsch_break_evt";

  /* resync tail at tick */
  next = tkosc->todo.next;
  if (next->when == tkosc->tick) {
    if (tkosc->tmevt) tmsch_cancel(tmsch, tkosc->tmevt);
    tkosc->tmevt = tmsch_sched(tmsch, tkosc->time, NEPS_TICK, tkosc_evt, tkosc);
  }
}

static void tkosc_free_evt(tkosc_t *tkosc, tkevt_t *tkevt) {
  memset(tkevt, 0, sizeof(*tkevt));
  tkevt->next = tkosc->done.next;
  tkosc->done.next = tkevt;
}

static tkevt_t *tkosc_grab_evt(tkosc_t *tkosc) {
  tkevt_t *evt, *prev, *next;
  
  evt = tkosc->todo.next;
  if (evt == 0) return 0;
  if (tk_gt(evt->when, tkosc->tick)) return 0;
  prev = evt->prev;
  next = evt->next;
  if (prev) prev->next = next;
  if (next) next->prev = prev;
  return evt;
}

/* This is called by the tm scheduler, to execute tick events. */
void tkosc_evt(void *arg, tmsch_t *tmsch) {
  tkosc_t *tkosc = arg;
  tkevt_t *tkevt;
  tkevt_rout_t *rout;
  float tick_per, drift, dt;
  simtime_t time;

  while (1) {
    tkevt = tkosc->evt = tkosc_grab_evt(tkosc);
    if (tkevt == 0) break;
    assert(tkosc->tick == tkevt->when);
    tkevt->clk->tick = tkosc->tick/tkevt->clk->div;
    tkosc->evt = tkevt;
    (*(rout = tkevt->rout))(tkevt->arg, tkevt->clk);
    tkosc_free_evt(tkosc, tkevt);
    if (rout == tkosc_break_evt) break;
  }
  tkosc->evt = 0;

  /* Schedule the next tick. */
  tick_per = tkosc->step*tkosc->tick_per;

  dt = tick_per;
  if (tkosc->allan_dev > 0.0f) {
    dt += tick_per*tkosc->allan_dev*nml_rand(&tkosc->seed);
  }
  if (tkosc->drift_dev > 0.0f) {
    drift = tkosc->drift;
    drift = (1.0 - tick_per/tkosc->drift_rate)*drift + nml_rand(&tkosc->seed);
    dt += tick_per*tkosc->drift_dev*drift;
    tkosc->drift = drift;
  }
  
  time = tm_add(tkosc->time, tm_from_float(dt));
  tkosc->tmevt = tmsch_sched(tmsch, time, tkosc->neps, tkosc_evt, arg);
  tkosc->tmevt->name = __func__;
 
  tkosc->time = time;
  tkosc->tick = tkosc->tick + tkosc->step;
}

void tkclk_init(tkclk_t *tkclk, tkosc_t *tkosc, uint16_t div) {
  memset(tkclk, 0, sizeof(*tkclk));
  tkclk->osc = tkosc;
  tkclk->div = div;
  tkosc->step = 1;
}

tkevt_t *tkclk_sched(tkclk_t *clk, uint32_t delta, int8_t neps,
		     tkevt_rout_t *rout, void *arg) {
  tkosc_t *osc = clk->osc;
  int32_t div = clk->div;
  tkevt_t *evt;
  osctick_t when;

  when = osc->tick + delta*clk->div;
  when = div*(when / div);
  evt = tkosc_sched(osc, when, neps, rout, arg);
  evt->clk = clk;
  if (rout = tkosc_break_evt) evt->name = "tkosc_break_evt";
  return evt;
}  

/* always return zero to xhx_act = tmclk_cancel(...); */
tkevt_t *tkclk_cancel(tkclk_t *clk, tkevt_t *evt) {
  return tkosc_cancel(clk->osc, evt);
}

/* --- last line --- */
