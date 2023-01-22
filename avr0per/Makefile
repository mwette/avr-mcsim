# mmod/Makefile

# Copyright (C) 2020,2023 Matthew Wette
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

TOP=$(shell pwd)/..

CC = gcc
CFLAGS = -I.. -g -fPIC
LDFLAGS = -g -L../octbx -Wl,-rpath=$(TOP)/octbx
LDLIBS = -loctbx

#CFLAGS += -fstack-protector-all
#CFLAGS += -pg
#LDFLAGS += -pg

OBJS = \
	adc.o clkctrl.o port.o \
	rstctrl.o slpctrl.o syscfg.o tca.o \
	tcb.o twi.o usart.o wdt.o

all: libavr0per.so libavr0per.a

libavr0per.so: $(OBJS)
	$(CC) -o $@ -shared $^ $(LDFLAGS) $(LDLIBS)

libavr0per.a: $(OBJS)
	$(AR) r $@ $^

i2c_test: i2c_test.o i2c.o
	$(CC) -o $@ $(LDFLAGS) $^

.PHONY: clean
clean:
	rm -f *.so *.o *~

# --- last line ---
