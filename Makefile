# Makefile for xsim

# Copyright (C) 2022-2023 Matthew Wette
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

TOP=$(shell pwd)

MAKEFLAGS += --no-print-directory

CC = gcc
CFLAGS = -g -I. -fpic
LDFLAGS = -g \
	-Loctsx -Lavr0dev -Lavr0per -Loctbx \
	-Wl,-rpath=$(TOP)/avr0dev \
	-Wl,-rpath=$(TOP)/avr0per \
	-Wl,-rpath=$(TOP)/octbx \
	-Wl,-rpath=$(TOP)/octsx
LDLIBS = -loctsx -loctbx -ldl -lm
LIBS = $(LDFLAGS) $(LDLIBS)

default: sublibs

.PHONY: sublibs
sublibs:
	@(cd octbx; $(MAKE))
	@(cd avr0per; $(MAKE))
	@(cd avr0dev; $(MAKE))
	@(cd octsx; $(MAKE))

.PHONY: clean
clean:
	rm -f oct4809 octscm *.so *.o *~
	(cd octbx; $(MAKE) clean; $(MAKE))
	(cd avr0per; $(MAKE) clean; $(MAKE))
	(cd avr0dev; $(MAKE) clean; $(MAKE))
	(cd octsx; $(MAKE) clean; $(MAKE))

.PHONY: all-from-clean AFC
all-from-clean AFC:
	rm -f oct4809 octscm *.so *.o *~
	(cd octbx; $(MAKE) clean; $(MAKE))
	(cd avr0per; $(MAKE) clean; $(MAKE))
	(cd avr0dev; $(MAKE) clean; $(MAKE))
	(cd octsx; $(MAKE) clean; $(MAKE))
	($(MAKE) clean; $(MAKE))

oct4809:
	gcc -g -Wall -Wno-unused -o oct4809 -DNO_DYNLD -I. -I.. -O0 \
		./oct4809.c \
		octsx/system.c \
		\
		avr0dev/mega4809.c \
		avr0per/adc.c \
		avr0per/clkctrl.c \
		avr0per/port.c \
		avr0per/rstctrl.c \
		avr0per/slpctrl.c \
		avr0per/syscfg.c \
		avr0per/tca.c \
		avr0per/tcb.c \
		avr0per/twi.c \
		avr0per/usart.c \
		avr0per/wdt.c \
		\
		octbx/avr_mcu.c \
		octbx/avr_cpu.c \
		octbx/avr_pin.c \
		octbx/cpuint.c \
		octbx/hooks.c \
		octbx/log.c \
		octbx/sched.c \
		octbx/twi_bus.c \
		-lm

# --- last line ---
