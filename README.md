# avr-mcsim: AVR multi-controller simulator

This is yet another simulator for AVR microcontrollers.   The focus has
been to support the ATmega4809 for now, but the CPU simulator handles all
four architectures and should be portable to many AVR-0 micro's.  Not all
4809 peripherals are simulated and ones that are may not be complete.

Features:
* Integrated with Spice, namely XYCE.
* CPU instructions are decoded and executed N cycles apart where N is the instruction time
* Oscillators are modeled with jitter, parameterized by Allan deviation.
* Interconnected multiple MCUs is in progress.
* User-defined hooks for analyzing code as it executes.
* Command-line interface using Guile Scheme.  This could be extended in the future to allow other languages.

Missing:
* It does not have a user-level interface to all registers and variables.

Requires:
* Linux or maybe (untried) Darwin OS
* Guile 2.2 or better.
* gcc to compile

Compile:
```
$ make
$ cd demo; make demo24.asm demo24.hex; cd ..
```

To run the demo, following along with demo/demo24.asm:
```
$ ./octsim -b 0xb8 demo/demo24.hex   # sets breakpoint at main
...
scheme@(guile-user)> (sys-cpu-step sys cpu)
00.000000349 cpu: b8fd
  00 01 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 --X-- --Y-- --Z--
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  -------- sp=3FFF  S: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    a0 clr   r1
```

The format of output is
1. time, cpu hash
2. register names (does not include r2-r7 to keep under 80 columns)
3. register values
4. status register (SREG) bits, stack pointer value, stack
5. PC, and next instruction to execute



