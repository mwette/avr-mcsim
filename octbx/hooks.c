/* hooks.c
 * 
 * Copyright (C) 2022-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#include <stdlib.h>
#include "hooks.h"


#ifdef USE_GUILE
#include "libguile.h"
#else

struct hook_link {
  struct hook_link *next;
  void (*hook)(struct cpu *cpu);
};

void add_hook(struct hook_link *hooks, void (*hook)(struct cpu*)) {
  struct hook_link *link = malloc(sizeof(struct hook_link));
  link->next = hooks->next;
  link->hook = hook;
  hooks->next = link;
}

void rem_hook(struct hook_link *hooks, void (*hook)(struct cpu*)) {
  struct hook_link *next, *prev = hooks;
  while (prev != 0) {
    next = prev->next;
    if (next->hook == hook) {
      prev->next = next->next;
      free(next);
      break;
    }
    prev = next;
  }
}

void exe_hook(struct hook_link *hooks, struct cpu *cpu) {
  struct hook_link *link = hooks->next;
  while (link != 0) {
    (*link->hook)(cpu);
    link = link->next;
  }
}

#define MAKE_HOOK(N)					\
struct hook_link N ## _hooks;				\
void add_ ## N ## _hook(void (*hook)(struct cpu*)) {	\
  add_hook(&N ## _hooks, hook);				\
}  							\
void rem_ ## N ## _hook(void (*hook)(struct cpu*)) {	\
  rem_hook(&N ## _hooks, hook);				\
} 							\
void N ## _hook(struct cpu *cpu) { 			\
  exe_hook(&N ## _hooks, cpu);				\
} 							\
int N ## _hook_enabled

MAKE_HOOK(cpu_call);
MAKE_HOOK(cpu_ret);
MAKE_HOOK(cpu_intr);
MAKE_HOOK(cpu_reti);
MAKE_HOOK(cpu_pre_exec);
MAKE_HOOK(cpu_post_exec);
MAKE_HOOK(cpu_post_fetch);

#endif
/* --- last line --- */
