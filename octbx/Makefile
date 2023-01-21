# octbx/Makefile

# Copyright (C) 2022-2023 Matthew Wette
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# liboctbx - basic execution (scheduler, cpu, logger)

TOP=$(shell pwd)/..

CC = gcc
CFLAGS = -g -I.. -fPIC
LDFLAGS = -g
LDLIBS = 

#CFLAGS += -fstack-protector-all
#CFLAGS += -pg
#LDFLAGS += -pg

OBJS = avr_mcu.o avr_cpu.o avr_pin.o cpuint.o sched.o hooks.o log.o twi_bus.o

all: liboctbx.so liboctbx.a

spice.so: N_CIR_XyceCInterface.C N_CIR_XyceCInterface.h
	./build-spice

liboctbx.so: $(OBJS)
	$(CC) -o $@ -shared $^ $(LDFLAGS) $(LDLIBS)

liboctbx.a: $(OBJS)
	$(AR) r $@ $^

system.o: system.c
sched.o: sched.c sched.h
avr_cpu.o: avr_cpu.c avr_cpu.h sched.h
log.o: log.c log.h
twi_bus.o: twi_bus.c twi_bus.h

.PHONY: clean
clean:
	rm -f *.so *.o *~

# --- last line ---
