# demo/Makefile
#
# $ make demo24.asm demo24.hex
#
# Copyright (C) 2021-2023 Matthew Wette
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

AVR_PACK=mega-2.0.12
AVR_TYPE=atmega4809
AVR_FREQ=3333333UL
PROG_BAUD=115200
PROG_TTY=/dev/ttyACM0

ROOT=/opt/local/bin/
CC=$(ROOT)avr-gcc
LD=$(ROOT)avr-ld
OBJCOPY=$(ROOT)avr-objcopy
OBJDUMP=$(ROOT)avr-objdump

PACKDIR= /opt/local/avr/packs/$(AVR_PACK)

CFLAGS+= -mmcu=$(AVR_TYPE) -DF_CPU=$(AVR_FREQ)
CFLAGS+= -Os -B$(PACKDIR)/
LDFLAGS+= -mmcu=$(AVR_TYPE) -B$(PACKDIR)/

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.e: %.c
	$(CC) $(CFLAGS) -E $< -o $@

%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

%.s: %.c
	$(CC) $(CFLAGS) -S $< -o $@

%.elf: %.o
	$(CC) $(LDFLAGS) -o $@ $<

%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.asm: %.elf
	$(OBJDUMP) -D $< > $@

octos.o: ../../avr-octos/octos.S
	$(CC) $(CFLAGS) $(OCT_FLAGS) -c $^ -o $@

.PHONY: clean
clean:
	#rm -f *.elf *.hex *.asm *.bin *.o *.dcl *~
	rm -f *.elf *.bin *.o *.dcl *~

# --- last line ---
