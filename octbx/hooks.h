/* hooks.h
 * 
 * Copyright (C) 2022-2023 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 */

#define HOOKS_ENABLED 1

#if HOOKS_ENABLED
#define RUN_HOOK(proc, ...)     proc ## _hook (__VA_ARGS__)
#else
#define RUN_HOOK(proc, ...)     /* hook disabled */
#endif

struct cpu;

#define DEF_HOOK(N)					\
void add_ ## N ## _hook(void (*hook)(struct cpu *));	\
void rem_ ## N ## _hook(void (*hook)(struct cpu *));	\
void N ## _hook(struct cpu *cpu)

DEF_HOOK(cpu_call);
DEF_HOOK(cpu_ret);
DEF_HOOK(cpu_intr);
DEF_HOOK(cpu_reti);

DEF_HOOK(cpu_pre_exec);
DEF_HOOK(cpu_post_exec);
DEF_HOOK(cpu_post_fetch);
  
/* --- last line --- */
