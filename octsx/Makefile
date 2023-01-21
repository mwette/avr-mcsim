# octsx/Makefile

# Copyright (C) 2022-2023 Matthew Wette
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# liboctsx - system execution

TOP=$(shell pwd)/..

CC = gcc
CFLAGS = -g -I.. -fPIC
LDFLAGS = -g \
	-L$(TOP)/octbx -Wl,-rpath=$(TOP)/octbx
#	-L$(TOP)/avr0dev -Wl,-rpath=$(TOP)/avr0dev \
#	-L$(TOP)/avr0per -Wl,-rpath=$(TOP)/avr0per \
#
LDLIBS = -loctbx

#CFLAGS += -fstack-protector-all
#CFLAGS += -pg
#LDFLAGS += -pg

all: liboctsx.so liboctsx.a

spice.so: N_CIR_XyceCInterface.C N_CIR_XyceCInterface.h
	./build-spice

liboctsx.so: system.o
	$(CC) -o $@ -shared $^ $(LDFLAGS) $(LDLIBS)

liboctsx.a: system.o
	$(AR) r $@ $^

system.o: system.c

.PHONY: clean
clean:
	rm -f *.so *.o *~

# --- last line ---
