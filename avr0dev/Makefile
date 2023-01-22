# chip/Makefile

# Copyright (C) 2020,2023 Matthew Wette
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

TOP=$(shell pwd)/..

CC = gcc
CFLAGS = -g -I.. -fPIC
LDFLAGS = -g \
	-L../avr0per  -Wl,-rpath=$(TOP)/avr0per \
	-L../octbx -Wl,-rpath=$(TOP)/octbx
LDLIBS  = -lavr0per -loctbx

#CFLAGS += -fstack-protector-all
#CFLAGS += -pg
#LDFLAGS += -pg

all: mega4809.so

OBJS = mega4809.o

%.so: %.c
	$(CC) -o $@ -shared $^ $(CFLAGS) $(LDFLAGS) $(LDLIBS)

libavr0dev.so:
	$(CC) -o $@ -shared $^ $(CFLAGS) $(LDFLAGS) $(LDLIBS)

libavr0dev.a: $(OBJS)
	$(AR) r $@ $^

.PHONY: clean
clean:
	rm -f *.so *.o *~

# --- last line ---
