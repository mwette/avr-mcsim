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

/* This assumed unused first elements in list as in Knuth's Vol 1. */

void add_hook(struct hook_link *hooks, void (*hook)()) {
  struct hook_link *link;

  for (link = hooks; link; link = link->next) {
    if (link->hook == hook)
      /* silently ignore */
      return;
  }

  link = malloc(sizeof(struct hook_link));
  link->next = hooks->next;
  link->hook = hook;
  hooks->next = link;
}

void rem_hook(struct hook_link *hooks, void (*hook)(void *)) {
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

void exe_hook(struct hook_link *hooks, void *arg) {
  struct hook_link *link = hooks->next;
  while (link != 0) {
    (*link->hook)(arg);
    link = link->next;
  }
}

/* --- last line --- */
