/* hooks.h
 *
 * Copyright (C) 2022-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */
#ifndef HOOKS__
#define HOOKS__

#ifndef HOOKS_ENABLED
#define HOOKS_ENABLED 1
#endif

#if HOOKS_ENABLED
#define RUN_HOOK(N,A)     N ## _hook (A)
#else
#define RUN_HOOK(N,A)     /* hook disabled */
#endif

struct hook_link {
  struct hook_link *next;
  void (*hook)(void *arg);
};

typedef struct hook_link hooks_t;

#define DEF_HOOK(N,T)				\
  void add_ ## N ## _hook(void (*hook)(T));	\
  void rem_ ## N ## _hook(void (*hook)(T));	\
  void N ## _hook(T)

#define MAKE_HOOK(N,T)					\
  struct hook_link N ## _hooks;				\
  void add_ ## N ## _hook(void (*hook)(T)) {		\
    add_hook(&N ## _hooks, (void(*)(void*)) hook);	\
  }  							\
  void rem_ ## N ## _hook(void (*hook)(T)) {		\
    rem_hook(&N ## _hooks, (void(*)(void*)) hook);	\
  } 							\
  void N ## _hook(T arg) {				\
    struct hook_link *link = N ## _hooks.next;		\
    while (link != 0) {					\
      (*link->hook)(arg);				\
      link = link->next;				\
    }							\
  } 							\
  int N ## _hook_enabled

void add_hook(struct hook_link *hooks, void (*hook)());
void rem_hook(struct hook_link *hooks, void (*hook)(void *));
void exe_hook(struct hook_link *hooks, void *arg);

#endif
/* --- last line --- */
