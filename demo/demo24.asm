
demo24.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 50 00 	jmp	0xa0	; 0xa0 <__ctors_end>
   4:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
   8:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
   c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  10:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  14:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  18:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  1c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  20:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  24:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  28:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  2c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  30:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  34:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  38:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  3c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  40:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  44:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  48:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  4c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  50:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  54:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  58:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  5c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  60:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  64:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  68:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  6c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  70:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  74:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  78:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  7c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  80:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  84:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  88:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  8c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  90:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  94:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  98:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>
  9c:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__bad_interrupt>

000000a0 <__ctors_end>:
  a0:	11 24       	eor	r1, r1
  a2:	1f be       	out	0x3f, r1	; 63
  a4:	cf ef       	ldi	r28, 0xFF	; 255
  a6:	cd bf       	out	0x3d, r28	; 61
  a8:	df e3       	ldi	r29, 0x3F	; 63
  aa:	de bf       	out	0x3e, r29	; 62
  ac:	0e 94 5c 00 	call	0xb8	; 0xb8 <main>
  b0:	0c 94 7f 00 	jmp	0xfe	; 0xfe <_exit>

000000b4 <__bad_interrupt>:
  b4:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000b8 <main>:
  b8:	2f e9       	ldi	r18, 0x9F	; 159
  ba:	36 e8       	ldi	r19, 0x86	; 134
  bc:	81 e0       	ldi	r24, 0x01	; 1
  be:	21 50       	subi	r18, 0x01	; 1
  c0:	30 40       	sbci	r19, 0x00	; 0
  c2:	80 40       	sbci	r24, 0x00	; 0
  c4:	e1 f7       	brne	.-8      	; 0xbe <main+0x6>
  c6:	00 c0       	rjmp	.+0      	; 0xc8 <main+0x10>
  c8:	00 00       	nop
  ca:	80 e2       	ldi	r24, 0x20	; 32
  cc:	80 93 a6 04 	sts	0x04A6, r24	; 0x8004a6 <__TEXT_REGION_LENGTH__+0x7f44a6>
  d0:	80 93 a1 04 	sts	0x04A1, r24	; 0x8004a1 <__TEXT_REGION_LENGTH__+0x7f44a1>
  d4:	9f e1       	ldi	r25, 0x1F	; 31
  d6:	21 ea       	ldi	r18, 0xA1	; 161
  d8:	37 e0       	ldi	r19, 0x07	; 7
  da:	91 50       	subi	r25, 0x01	; 1
  dc:	20 40       	sbci	r18, 0x00	; 0
  de:	30 40       	sbci	r19, 0x00	; 0
  e0:	e1 f7       	brne	.-8      	; 0xda <main+0x22>
  e2:	00 c0       	rjmp	.+0      	; 0xe4 <main+0x2c>
  e4:	00 00       	nop
  e6:	80 93 a2 04 	sts	0x04A2, r24	; 0x8004a2 <__TEXT_REGION_LENGTH__+0x7f44a2>
  ea:	9f e9       	ldi	r25, 0x9F	; 159
  ec:	26 e8       	ldi	r18, 0x86	; 134
  ee:	31 e0       	ldi	r19, 0x01	; 1
  f0:	91 50       	subi	r25, 0x01	; 1
  f2:	20 40       	sbci	r18, 0x00	; 0
  f4:	30 40       	sbci	r19, 0x00	; 0
  f6:	e1 f7       	brne	.-8      	; 0xf0 <main+0x38>
  f8:	00 c0       	rjmp	.+0      	; 0xfa <main+0x42>
  fa:	00 00       	nop
  fc:	e9 cf       	rjmp	.-46     	; 0xd0 <main+0x18>

000000fe <_exit>:
  fe:	f8 94       	cli

00000100 <__stop_program>:
 100:	ff cf       	rjmp	.-2      	; 0x100 <__stop_program>

Disassembly of section .stab:

00000000 <.stab>:
   0:	01 00       	.word	0x0001	; ????
   2:	00 00       	nop
   4:	00 00       	nop
   6:	09 00       	.word	0x0009	; ????
   8:	58 00       	.word	0x0058	; ????
   a:	00 00       	nop
   c:	01 00       	.word	0x0001	; ????
   e:	00 00       	nop
  10:	64 00       	.word	0x0064	; ????
  12:	00 00       	nop
  14:	b8 00       	.word	0x00b8	; ????
  16:	00 00       	nop
  18:	11 00       	.word	0x0011	; ????
  1a:	00 00       	nop
  1c:	84 00       	.word	0x0084	; ????
  1e:	00 00       	nop
  20:	fe 00       	.word	0x00fe	; ????
  22:	00 00       	nop
  24:	00 00       	nop
  26:	00 00       	nop
  28:	44 00       	.word	0x0044	; ????
  2a:	de 08       	sbc	r13, r14
  2c:	fe 00       	.word	0x00fe	; ????
  2e:	00 00       	nop
  30:	45 00       	.word	0x0045	; ????
  32:	00 00       	nop
  34:	80 00       	.word	0x0080	; ????
  36:	00 00       	nop
  38:	00 00       	nop
  3a:	00 00       	nop
  3c:	4f 00       	.word	0x004f	; ????
  3e:	00 00       	nop
  40:	24 00       	.word	0x0024	; ????
  42:	df 08       	sbc	r13, r15
  44:	fe 00       	.word	0x00fe	; ????
  46:	00 00       	nop
  48:	00 00       	nop
  4a:	00 00       	nop
  4c:	44 00       	.word	0x0044	; ????
  4e:	e1 08       	sbc	r14, r1
	...
  58:	24 00       	.word	0x0024	; ????
	...
  62:	00 00       	nop
  64:	44 00       	.word	0x0044	; ????
  66:	e6 08       	sbc	r14, r6
  68:	fe 00       	.word	0x00fe	; ????
  6a:	00 00       	nop
  6c:	00 00       	nop
  6e:	00 00       	nop
  70:	44 00       	.word	0x0044	; ????
  72:	e8 08       	sbc	r14, r8
  74:	00 01       	movw	r0, r0
	...

Disassembly of section .stabstr:

00000000 <.stabstr>:
   0:	00 2f       	mov	r16, r16
   2:	74 6d       	ori	r23, 0xD4	; 212
   4:	70 2f       	mov	r23, r16
   6:	63 63       	ori	r22, 0x33	; 51
   8:	4c 32       	cpi	r20, 0x2C	; 44
   a:	77 77       	andi	r23, 0x77	; 119
   c:	62 35       	cpi	r22, 0x52	; 82
   e:	2e 73       	andi	r18, 0x3E	; 62
  10:	00 2e       	mov	r0, r16
  12:	2e 2f       	mov	r18, r30
  14:	2e 2e       	mov	r2, r30
  16:	2f 2e       	mov	r2, r31
  18:	2e 2f       	mov	r18, r30
  1a:	2e 2e       	mov	r2, r30
  1c:	2f 67       	ori	r18, 0x7F	; 127
  1e:	63 63       	ori	r22, 0x33	; 51
  20:	2d 38       	cpi	r18, 0x8D	; 141
  22:	2e 33       	cpi	r18, 0x3E	; 62
  24:	2e 30       	cpi	r18, 0x0E	; 14
  26:	2f 6c       	ori	r18, 0xCF	; 207
  28:	69 62       	ori	r22, 0x29	; 41
  2a:	67 63       	ori	r22, 0x37	; 55
  2c:	63 2f       	mov	r22, r19
  2e:	63 6f       	ori	r22, 0xF3	; 243
  30:	6e 66       	ori	r22, 0x6E	; 110
  32:	69 67       	ori	r22, 0x79	; 121
  34:	2f 61       	ori	r18, 0x1F	; 31
  36:	76 72       	andi	r23, 0x26	; 38
  38:	2f 6c       	ori	r18, 0xCF	; 207
  3a:	69 62       	ori	r22, 0x29	; 41
  3c:	31 66       	ori	r19, 0x61	; 97
  3e:	75 6e       	ori	r23, 0xE5	; 229
  40:	63 73       	andi	r22, 0x33	; 51
  42:	2e 53       	subi	r18, 0x3E	; 62
  44:	00 76       	andi	r16, 0x60	; 96
  46:	6f 69       	ori	r22, 0x9F	; 159
  48:	64 3a       	cpi	r22, 0xA4	; 164
  4a:	74 31       	cpi	r23, 0x14	; 20
  4c:	3d 31       	cpi	r19, 0x1D	; 29
  4e:	00 5f       	subi	r16, 0xF0	; 240
  50:	65 78       	andi	r22, 0x85	; 133
  52:	69 74       	andi	r22, 0x49	; 73
  54:	3a 46       	sbci	r19, 0x6A	; 106
  56:	31 00       	.word	0x0031	; ????

Disassembly of section .comment:

00000000 <.comment>:
   0:	47 43       	sbci	r20, 0x37	; 55
   2:	43 3a       	cpi	r20, 0xA3	; 163
   4:	20 28       	or	r2, r0
   6:	47 4e       	sbci	r20, 0xE7	; 231
   8:	55 29       	or	r21, r5
   a:	20 38       	cpi	r18, 0x80	; 128
   c:	2e 33       	cpi	r18, 0x3E	; 62
   e:	2e 30       	cpi	r18, 0x0E	; 14
	...

Disassembly of section .note.gnu.avr.deviceinfo:

00000000 <.note.gnu.avr.deviceinfo>:
   0:	04 00       	.word	0x0004	; ????
   2:	00 00       	nop
   4:	2d 00       	.word	0x002d	; ????
   6:	00 00       	nop
   8:	01 00       	.word	0x0001	; ????
   a:	00 00       	nop
   c:	41 56       	subi	r20, 0x61	; 97
   e:	52 00       	.word	0x0052	; ????
  10:	00 00       	nop
  12:	00 00       	nop
  14:	00 c0       	rjmp	.+0      	; 0x16 <__FUSE_REGION_LENGTH__+0xd>
  16:	00 00       	nop
  18:	00 28       	or	r0, r0
  1a:	00 00       	nop
  1c:	00 18       	sub	r0, r0
  1e:	00 00       	nop
  20:	00 00       	nop
  22:	00 00       	nop
  24:	00 01       	movw	r0, r0
  26:	00 00       	nop
  28:	08 00       	.word	0x0008	; ????
  2a:	00 00       	nop
  2c:	01 00       	.word	0x0001	; ????
  2e:	00 00       	nop
  30:	00 61       	ori	r16, 0x10	; 16
  32:	74 6d       	ori	r23, 0xD4	; 212
  34:	65 67       	ori	r22, 0x75	; 117
  36:	61 34       	cpi	r22, 0x41	; 65
  38:	38 30       	cpi	r19, 0x08	; 8
  3a:	39 00       	.word	0x0039	; ????
  3c:	00 00       	nop
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	86 24       	eor	r8, r6
       2:	00 00       	nop
       4:	02 00       	.word	0x0002	; ????
       6:	00 00       	nop
       8:	00 00       	nop
       a:	04 01       	movw	r0, r8
	...
      14:	02 0f       	add	r16, r18
      16:	00 00       	nop
      18:	00 01       	movw	r0, r0
      1a:	08 03       	fmul	r16, r16
      1c:	17 00       	.word	0x0017	; ????
      1e:	00 00       	nop
      20:	02 07       	cpc	r16, r18
      22:	04 20       	and	r0, r4
      24:	00 00       	nop
      26:	00 00       	nop
      28:	00 14       	cp	r0, r0
      2a:	00 00       	nop
      2c:	00 01       	movw	r0, r0
      2e:	05 03       	mulsu	r16, r21
      30:	80 06       	cpc	r8, r16
      32:	80 00       	.word	0x0080	; ????
      34:	05 26       	eor	r0, r21
      36:	00 00       	nop
      38:	00 00       	nop
      3a:	00 14       	cp	r0, r0
      3c:	00 00       	nop
      3e:	00 01       	movw	r0, r0
      40:	05 03       	mulsu	r16, r21
      42:	84 06       	cpc	r8, r20
      44:	80 00       	.word	0x0080	; ????
      46:	06 2d       	mov	r16, r6
      48:	00 00       	nop
      4a:	00 00       	nop
      4c:	00 14       	cp	r0, r0
      4e:	00 00       	nop
      50:	00 01       	movw	r0, r0
      52:	05 03       	mulsu	r16, r21
      54:	86 06       	cpc	r8, r22
      56:	80 00       	.word	0x0080	; ????
      58:	07 35       	cpi	r16, 0x57	; 87
      5a:	00 00       	nop
      5c:	00 00       	nop
      5e:	00 14       	cp	r0, r0
      60:	00 00       	nop
      62:	00 01       	movw	r0, r0
      64:	05 03       	mulsu	r16, r21
      66:	82 06       	cpc	r8, r18
      68:	80 00       	.word	0x0080	; ????
      6a:	08 3e       	cpi	r16, 0xE8	; 232
      6c:	00 00       	nop
      6e:	00 00       	nop
      70:	00 14       	cp	r0, r0
      72:	00 00       	nop
      74:	00 01       	movw	r0, r0
      76:	05 03       	mulsu	r16, r21
      78:	87 06       	cpc	r8, r23
      7a:	80 00       	.word	0x0080	; ????
      7c:	09 45       	sbci	r16, 0x59	; 89
      7e:	00 00       	nop
      80:	00 00       	nop
      82:	00 14       	cp	r0, r0
      84:	00 00       	nop
      86:	00 01       	movw	r0, r0
      88:	05 03       	mulsu	r16, r21
      8a:	16 06       	cpc	r1, r22
      8c:	80 00       	.word	0x0080	; ????
      8e:	0a 4b       	sbci	r16, 0xBA	; 186
      90:	00 00       	nop
      92:	00 00       	nop
      94:	00 14       	cp	r0, r0
      96:	00 00       	nop
      98:	00 01       	movw	r0, r0
      9a:	05 03       	mulsu	r16, r21
      9c:	08 06       	cpc	r0, r24
      9e:	80 00       	.word	0x0080	; ????
      a0:	0b 53       	subi	r16, 0x3B	; 59
      a2:	00 00       	nop
      a4:	00 00       	nop
      a6:	00 14       	cp	r0, r0
      a8:	00 00       	nop
      aa:	00 01       	movw	r0, r0
      ac:	05 03       	mulsu	r16, r21
      ae:	00 06       	cpc	r0, r16
      b0:	80 00       	.word	0x0080	; ????
      b2:	0c 59       	subi	r16, 0x9C	; 156
      b4:	00 00       	nop
      b6:	00 00       	nop
      b8:	00 14       	cp	r0, r0
      ba:	00 00       	nop
      bc:	00 01       	movw	r0, r0
      be:	05 03       	mulsu	r16, r21
      c0:	01 06       	cpc	r0, r17
      c2:	80 00       	.word	0x0080	; ????
      c4:	0d 5f       	subi	r16, 0xFD	; 253
      c6:	00 00       	nop
      c8:	00 00       	nop
      ca:	00 14       	cp	r0, r0
      cc:	00 00       	nop
      ce:	00 01       	movw	r0, r0
      d0:	05 03       	mulsu	r16, r21
      d2:	02 06       	cpc	r0, r18
      d4:	80 00       	.word	0x0080	; ????
      d6:	0e 65       	ori	r16, 0x5E	; 94
      d8:	00 00       	nop
      da:	00 00       	nop
      dc:	00 14       	cp	r0, r0
      de:	00 00       	nop
      e0:	00 01       	movw	r0, r0
      e2:	05 03       	mulsu	r16, r21
      e4:	03 06       	cpc	r0, r19
      e6:	80 00       	.word	0x0080	; ????
      e8:	0f 6b       	ori	r16, 0xBF	; 191
      ea:	00 00       	nop
      ec:	00 00       	nop
      ee:	00 14       	cp	r0, r0
      f0:	00 00       	nop
      f2:	00 01       	movw	r0, r0
      f4:	05 03       	mulsu	r16, r21
      f6:	04 06       	cpc	r0, r20
      f8:	80 00       	.word	0x0080	; ????
      fa:	10 71       	andi	r17, 0x10	; 16
      fc:	00 00       	nop
      fe:	00 00       	nop
     100:	00 14       	cp	r0, r0
     102:	00 00       	nop
     104:	00 01       	movw	r0, r0
     106:	05 03       	mulsu	r16, r21
     108:	0c 06       	cpc	r0, r28
     10a:	80 00       	.word	0x0080	; ????
     10c:	11 79       	andi	r17, 0x91	; 145
     10e:	00 00       	nop
     110:	00 00       	nop
     112:	00 14       	cp	r0, r0
     114:	00 00       	nop
     116:	00 01       	movw	r0, r0
     118:	05 03       	mulsu	r16, r21
     11a:	09 06       	cpc	r0, r25
     11c:	80 00       	.word	0x0080	; ????
     11e:	12 80       	ldd	r1, Z+2	; 0x02
     120:	00 00       	nop
     122:	00 00       	nop
     124:	00 14       	cp	r0, r0
     126:	00 00       	nop
     128:	00 01       	movw	r0, r0
     12a:	05 03       	mulsu	r16, r21
     12c:	0a 06       	cpc	r0, r26
     12e:	80 00       	.word	0x0080	; ????
     130:	13 88       	ldd	r1, Z+19	; 0x13
     132:	00 00       	nop
     134:	00 00       	nop
     136:	00 14       	cp	r0, r0
     138:	00 00       	nop
     13a:	00 01       	movw	r0, r0
     13c:	05 03       	mulsu	r16, r21
     13e:	0b 06       	cpc	r0, r27
     140:	80 00       	.word	0x0080	; ????
     142:	14 91       	lpm	r17, Z
     144:	00 00       	nop
     146:	00 00       	nop
     148:	00 14       	cp	r0, r0
     14a:	00 00       	nop
     14c:	00 01       	movw	r0, r0
     14e:	05 03       	mulsu	r16, r21
     150:	06 06       	cpc	r0, r22
     152:	80 00       	.word	0x0080	; ????
     154:	15 98       	cbi	0x02, 5	; 2
     156:	00 00       	nop
     158:	00 00       	nop
     15a:	00 1b       	sub	r16, r16
     15c:	00 00       	nop
     15e:	00 01       	movw	r0, r0
     160:	05 03       	mulsu	r16, r21
     162:	10 06       	cpc	r1, r16
     164:	80 00       	.word	0x0080	; ????
     166:	16 9c       	mul	r1, r6
     168:	00 00       	nop
     16a:	00 00       	nop
     16c:	00 14       	cp	r0, r0
     16e:	00 00       	nop
     170:	00 01       	movw	r0, r0
     172:	05 03       	mulsu	r16, r21
     174:	05 06       	cpc	r0, r21
     176:	80 00       	.word	0x0080	; ????
     178:	17 a5       	ldd	r17, Z+47	; 0x2f
     17a:	00 00       	nop
     17c:	00 00       	nop
     17e:	00 14       	cp	r0, r0
     180:	00 00       	nop
     182:	00 01       	movw	r0, r0
     184:	05 03       	mulsu	r16, r21
     186:	0d 06       	cpc	r0, r29
     188:	80 00       	.word	0x0080	; ????
     18a:	18 aa       	std	Y+48, r1	; 0x30
     18c:	00 00       	nop
     18e:	00 00       	nop
     190:	00 1b       	sub	r16, r16
     192:	00 00       	nop
     194:	00 01       	movw	r0, r0
     196:	05 03       	mulsu	r16, r21
     198:	14 06       	cpc	r1, r20
     19a:	80 00       	.word	0x0080	; ????
     19c:	19 b0       	in	r1, 0x09	; 9
     19e:	00 00       	nop
     1a0:	00 00       	nop
     1a2:	00 1b       	sub	r16, r16
     1a4:	00 00       	nop
     1a6:	00 01       	movw	r0, r0
     1a8:	05 03       	mulsu	r16, r21
     1aa:	12 06       	cpc	r1, r18
     1ac:	80 00       	.word	0x0080	; ????
     1ae:	1a b6       	in	r1, 0x3a	; 58
     1b0:	00 00       	nop
     1b2:	00 00       	nop
     1b4:	00 14       	cp	r0, r0
     1b6:	00 00       	nop
     1b8:	00 01       	movw	r0, r0
     1ba:	05 03       	mulsu	r16, r21
     1bc:	80 00       	.word	0x0080	; ????
     1be:	80 00       	.word	0x0080	; ????
     1c0:	1b bc       	out	0x2b, r1	; 43
     1c2:	00 00       	nop
     1c4:	00 00       	nop
     1c6:	00 14       	cp	r0, r0
     1c8:	00 00       	nop
     1ca:	00 01       	movw	r0, r0
     1cc:	05 03       	mulsu	r16, r21
     1ce:	81 00       	.word	0x0081	; ????
     1d0:	80 00       	.word	0x0080	; ????
     1d2:	1c c2       	rjmp	.+1080   	; 0x60c <__LOCK_REGION_LENGTH__+0x20c>
     1d4:	00 00       	nop
     1d6:	00 00       	nop
     1d8:	00 14       	cp	r0, r0
     1da:	00 00       	nop
     1dc:	00 01       	movw	r0, r0
     1de:	05 03       	mulsu	r16, r21
     1e0:	89 00       	.word	0x0089	; ????
     1e2:	80 00       	.word	0x0080	; ????
     1e4:	1d ca       	rjmp	.-3014   	; 0xfffff620 <__eeprom_end+0xff7ef620>
     1e6:	00 00       	nop
     1e8:	00 00       	nop
     1ea:	00 14       	cp	r0, r0
     1ec:	00 00       	nop
     1ee:	00 01       	movw	r0, r0
     1f0:	05 03       	mulsu	r16, r21
     1f2:	8a 00       	.word	0x008a	; ????
     1f4:	80 00       	.word	0x0080	; ????
     1f6:	1e d3       	rcall	.+1596   	; 0x834 <__LOCK_REGION_LENGTH__+0x434>
     1f8:	00 00       	nop
     1fa:	00 00       	nop
     1fc:	00 14       	cp	r0, r0
     1fe:	00 00       	nop
     200:	00 01       	movw	r0, r0
     202:	05 03       	mulsu	r16, r21
     204:	8b 00       	.word	0x008b	; ????
     206:	80 00       	.word	0x0080	; ????
     208:	1f da       	rcall	.-3010   	; 0xfffff648 <__eeprom_end+0xff7ef648>
     20a:	00 00       	nop
     20c:	00 00       	nop
     20e:	00 14       	cp	r0, r0
     210:	00 00       	nop
     212:	00 01       	movw	r0, r0
     214:	05 03       	mulsu	r16, r21
     216:	88 00       	.word	0x0088	; ????
     218:	80 00       	.word	0x0080	; ????
     21a:	20 e3       	ldi	r18, 0x30	; 48
     21c:	00 00       	nop
     21e:	00 00       	nop
     220:	00 14       	cp	r0, r0
     222:	00 00       	nop
     224:	00 01       	movw	r0, r0
     226:	05 03       	mulsu	r16, r21
     228:	c0 01       	movw	r24, r0
     22a:	80 00       	.word	0x0080	; ????
     22c:	21 e9       	ldi	r18, 0x91	; 145
     22e:	00 00       	nop
     230:	00 00       	nop
     232:	00 14       	cp	r0, r0
     234:	00 00       	nop
     236:	00 01       	movw	r0, r0
     238:	05 03       	mulsu	r16, r21
     23a:	c5 01       	movw	r24, r10
     23c:	80 00       	.word	0x0080	; ????
     23e:	22 f2       	brmi	.-120    	; 0x1c8 <__data_load_end+0xc6>
     240:	00 00       	nop
     242:	00 00       	nop
     244:	00 14       	cp	r0, r0
     246:	00 00       	nop
     248:	00 01       	movw	r0, r0
     24a:	05 03       	mulsu	r16, r21
     24c:	c7 01       	movw	r24, r14
     24e:	80 00       	.word	0x0080	; ????
     250:	23 fb       	bst	r18, 3
     252:	00 00       	nop
     254:	00 00       	nop
     256:	00 14       	cp	r0, r0
     258:	00 00       	nop
     25a:	00 01       	movw	r0, r0
     25c:	05 03       	mulsu	r16, r21
     25e:	c8 01       	movw	r24, r16
     260:	80 00       	.word	0x0080	; ????
     262:	24 05       	cpc	r18, r4
     264:	01 00       	.word	0x0001	; ????
     266:	00 00       	nop
     268:	00 14       	cp	r0, r0
     26a:	00 00       	nop
     26c:	00 01       	movw	r0, r0
     26e:	05 03       	mulsu	r16, r21
     270:	c9 01       	movw	r24, r18
     272:	80 00       	.word	0x0080	; ????
     274:	25 0f       	add	r18, r21
     276:	01 00       	.word	0x0001	; ????
     278:	00 00       	nop
     27a:	00 14       	cp	r0, r0
     27c:	00 00       	nop
     27e:	00 01       	movw	r0, r0
     280:	05 03       	mulsu	r16, r21
     282:	ca 01       	movw	r24, r20
     284:	80 00       	.word	0x0080	; ????
     286:	26 19       	sub	r18, r6
     288:	01 00       	.word	0x0001	; ????
     28a:	00 00       	nop
     28c:	00 14       	cp	r0, r0
     28e:	00 00       	nop
     290:	00 01       	movw	r0, r0
     292:	05 03       	mulsu	r16, r21
     294:	cc 01       	movw	r24, r24
     296:	80 00       	.word	0x0080	; ????
     298:	27 23       	and	r18, r23
     29a:	01 00       	.word	0x0001	; ????
     29c:	00 00       	nop
     29e:	00 14       	cp	r0, r0
     2a0:	00 00       	nop
     2a2:	00 01       	movw	r0, r0
     2a4:	05 03       	mulsu	r16, r21
     2a6:	cd 01       	movw	r24, r26
     2a8:	80 00       	.word	0x0080	; ????
     2aa:	28 2d       	mov	r18, r8
     2ac:	01 00       	.word	0x0001	; ????
     2ae:	00 00       	nop
     2b0:	00 14       	cp	r0, r0
     2b2:	00 00       	nop
     2b4:	00 01       	movw	r0, r0
     2b6:	05 03       	mulsu	r16, r21
     2b8:	ce 01       	movw	r24, r28
     2ba:	80 00       	.word	0x0080	; ????
     2bc:	29 37       	cpi	r18, 0x79	; 121
     2be:	01 00       	.word	0x0001	; ????
     2c0:	00 00       	nop
     2c2:	00 14       	cp	r0, r0
     2c4:	00 00       	nop
     2c6:	00 01       	movw	r0, r0
     2c8:	05 03       	mulsu	r16, r21
     2ca:	d0 01       	movw	r26, r0
     2cc:	80 00       	.word	0x0080	; ????
     2ce:	2a 41       	sbci	r18, 0x1A	; 26
     2d0:	01 00       	.word	0x0001	; ????
     2d2:	00 00       	nop
     2d4:	00 14       	cp	r0, r0
     2d6:	00 00       	nop
     2d8:	00 01       	movw	r0, r0
     2da:	05 03       	mulsu	r16, r21
     2dc:	d1 01       	movw	r26, r2
     2de:	80 00       	.word	0x0080	; ????
     2e0:	2b 4b       	sbci	r18, 0xBB	; 187
     2e2:	01 00       	.word	0x0001	; ????
     2e4:	00 00       	nop
     2e6:	00 14       	cp	r0, r0
     2e8:	00 00       	nop
     2ea:	00 01       	movw	r0, r0
     2ec:	05 03       	mulsu	r16, r21
     2ee:	d2 01       	movw	r26, r4
     2f0:	80 00       	.word	0x0080	; ????
     2f2:	2c 55       	subi	r18, 0x5C	; 92
     2f4:	01 00       	.word	0x0001	; ????
     2f6:	00 00       	nop
     2f8:	00 14       	cp	r0, r0
     2fa:	00 00       	nop
     2fc:	00 01       	movw	r0, r0
     2fe:	05 03       	mulsu	r16, r21
     300:	d4 01       	movw	r26, r8
     302:	80 00       	.word	0x0080	; ????
     304:	2d 5f       	subi	r18, 0xFD	; 253
     306:	01 00       	.word	0x0001	; ????
     308:	00 00       	nop
     30a:	00 14       	cp	r0, r0
     30c:	00 00       	nop
     30e:	00 01       	movw	r0, r0
     310:	05 03       	mulsu	r16, r21
     312:	d5 01       	movw	r26, r10
     314:	80 00       	.word	0x0080	; ????
     316:	2e 69       	ori	r18, 0x9E	; 158
     318:	01 00       	.word	0x0001	; ????
     31a:	00 00       	nop
     31c:	00 14       	cp	r0, r0
     31e:	00 00       	nop
     320:	00 01       	movw	r0, r0
     322:	05 03       	mulsu	r16, r21
     324:	d6 01       	movw	r26, r12
     326:	80 00       	.word	0x0080	; ????
     328:	2f 73       	andi	r18, 0x3F	; 63
     32a:	01 00       	.word	0x0001	; ????
     32c:	00 00       	nop
     32e:	00 14       	cp	r0, r0
     330:	00 00       	nop
     332:	00 01       	movw	r0, r0
     334:	05 03       	mulsu	r16, r21
     336:	c1 01       	movw	r24, r2
     338:	80 00       	.word	0x0080	; ????
     33a:	30 7c       	andi	r19, 0xC0	; 192
     33c:	01 00       	.word	0x0001	; ????
     33e:	00 00       	nop
     340:	00 14       	cp	r0, r0
     342:	00 00       	nop
     344:	00 01       	movw	r0, r0
     346:	05 03       	mulsu	r16, r21
     348:	c2 01       	movw	r24, r4
     34a:	80 00       	.word	0x0080	; ????
     34c:	31 85       	ldd	r19, Z+9	; 0x09
     34e:	01 00       	.word	0x0001	; ????
     350:	00 00       	nop
     352:	00 14       	cp	r0, r0
     354:	00 00       	nop
     356:	00 01       	movw	r0, r0
     358:	05 03       	mulsu	r16, r21
     35a:	cb 01       	movw	r24, r22
     35c:	80 00       	.word	0x0080	; ????
     35e:	32 8c       	ldd	r3, Z+26	; 0x1a
     360:	01 00       	.word	0x0001	; ????
     362:	00 00       	nop
     364:	00 14       	cp	r0, r0
     366:	00 00       	nop
     368:	00 01       	movw	r0, r0
     36a:	05 03       	mulsu	r16, r21
     36c:	cf 01       	movw	r24, r30
     36e:	80 00       	.word	0x0080	; ????
     370:	33 93       	.word	0x9333	; ????
     372:	01 00       	.word	0x0001	; ????
     374:	00 00       	nop
     376:	00 14       	cp	r0, r0
     378:	00 00       	nop
     37a:	00 01       	movw	r0, r0
     37c:	05 03       	mulsu	r16, r21
     37e:	d3 01       	movw	r26, r6
     380:	80 00       	.word	0x0080	; ????
     382:	34 9a       	sbi	0x06, 4	; 6
     384:	01 00       	.word	0x0001	; ????
     386:	00 00       	nop
     388:	00 14       	cp	r0, r0
     38a:	00 00       	nop
     38c:	00 01       	movw	r0, r0
     38e:	05 03       	mulsu	r16, r21
     390:	d7 01       	movw	r26, r14
     392:	80 00       	.word	0x0080	; ????
     394:	35 a1       	ldd	r19, Z+37	; 0x25
     396:	01 00       	.word	0x0001	; ????
     398:	00 00       	nop
     39a:	00 14       	cp	r0, r0
     39c:	00 00       	nop
     39e:	00 01       	movw	r0, r0
     3a0:	05 03       	mulsu	r16, r21
     3a2:	60 00       	.word	0x0060	; ????
     3a4:	80 00       	.word	0x0080	; ????
     3a6:	36 ab       	std	Z+54, r19	; 0x36
     3a8:	01 00       	.word	0x0001	; ????
     3aa:	00 00       	nop
     3ac:	00 14       	cp	r0, r0
     3ae:	00 00       	nop
     3b0:	00 01       	movw	r0, r0
     3b2:	05 03       	mulsu	r16, r21
     3b4:	61 00       	.word	0x0061	; ????
     3b6:	80 00       	.word	0x0080	; ????
     3b8:	37 b5       	in	r19, 0x27	; 39
     3ba:	01 00       	.word	0x0001	; ????
     3bc:	00 00       	nop
     3be:	00 14       	cp	r0, r0
     3c0:	00 00       	nop
     3c2:	00 01       	movw	r0, r0
     3c4:	05 03       	mulsu	r16, r21
     3c6:	62 00       	.word	0x0062	; ????
     3c8:	80 00       	.word	0x0080	; ????
     3ca:	38 be       	out	0x38, r3	; 56
     3cc:	01 00       	.word	0x0001	; ????
     3ce:	00 00       	nop
     3d0:	00 14       	cp	r0, r0
     3d2:	00 00       	nop
     3d4:	00 01       	movw	r0, r0
     3d6:	05 03       	mulsu	r16, r21
     3d8:	63 00       	.word	0x0063	; ????
     3da:	80 00       	.word	0x0080	; ????
     3dc:	39 c9       	rjmp	.-3470   	; 0xfffff650 <__eeprom_end+0xff7ef650>
     3de:	01 00       	.word	0x0001	; ????
     3e0:	00 00       	nop
     3e2:	00 14       	cp	r0, r0
     3e4:	00 00       	nop
     3e6:	00 01       	movw	r0, r0
     3e8:	05 03       	mulsu	r16, r21
     3ea:	71 00       	.word	0x0071	; ????
     3ec:	80 00       	.word	0x0080	; ????
     3ee:	3a d6       	rcall	.+3188   	; 0x1064 <__LOCK_REGION_LENGTH__+0xc64>
     3f0:	01 00       	.word	0x0001	; ????
     3f2:	00 00       	nop
     3f4:	00 14       	cp	r0, r0
     3f6:	00 00       	nop
     3f8:	00 01       	movw	r0, r0
     3fa:	05 03       	mulsu	r16, r21
     3fc:	72 00       	.word	0x0072	; ????
     3fe:	80 00       	.word	0x0080	; ????
     400:	3b e3       	ldi	r19, 0x3B	; 59
     402:	01 00       	.word	0x0001	; ????
     404:	00 00       	nop
     406:	00 14       	cp	r0, r0
     408:	00 00       	nop
     40a:	00 01       	movw	r0, r0
     40c:	05 03       	mulsu	r16, r21
     40e:	70 00       	.word	0x0070	; ????
     410:	80 00       	.word	0x0080	; ????
     412:	3c ef       	ldi	r19, 0xFC	; 252
     414:	01 00       	.word	0x0001	; ????
     416:	00 00       	nop
     418:	00 14       	cp	r0, r0
     41a:	00 00       	nop
     41c:	00 01       	movw	r0, r0
     41e:	05 03       	mulsu	r16, r21
     420:	78 00       	.word	0x0078	; ????
     422:	80 00       	.word	0x0080	; ????
     424:	3d fb       	.word	0xfb3d	; ????
     426:	01 00       	.word	0x0001	; ????
     428:	00 00       	nop
     42a:	00 14       	cp	r0, r0
     42c:	00 00       	nop
     42e:	00 01       	movw	r0, r0
     430:	05 03       	mulsu	r16, r21
     432:	7c 00       	.word	0x007c	; ????
     434:	80 00       	.word	0x0080	; ????
     436:	3e 08       	sbc	r3, r14
     438:	02 00       	.word	0x0002	; ????
     43a:	00 00       	nop
     43c:	00 14       	cp	r0, r0
     43e:	00 00       	nop
     440:	00 01       	movw	r0, r0
     442:	05 03       	mulsu	r16, r21
     444:	34 00       	.word	0x0034	; ????
     446:	80 00       	.word	0x0080	; ????
     448:	3f 0c       	add	r3, r15
     44a:	02 00       	.word	0x0002	; ????
     44c:	00 00       	nop
     44e:	00 14       	cp	r0, r0
     450:	00 00       	nop
     452:	00 01       	movw	r0, r0
     454:	05 03       	mulsu	r16, r21
     456:	3e 00       	.word	0x003e	; ????
     458:	80 00       	.word	0x0080	; ????
     45a:	40 10       	cpse	r4, r0
     45c:	02 00       	.word	0x0002	; ????
     45e:	00 00       	nop
     460:	00 14       	cp	r0, r0
     462:	00 00       	nop
     464:	00 01       	movw	r0, r0
     466:	05 03       	mulsu	r16, r21
     468:	3d 00       	.word	0x003d	; ????
     46a:	80 00       	.word	0x0080	; ????
     46c:	41 14       	cp	r4, r1
     46e:	02 00       	.word	0x0002	; ????
     470:	00 00       	nop
     472:	00 14       	cp	r0, r0
     474:	00 00       	nop
     476:	00 01       	movw	r0, r0
     478:	05 03       	mulsu	r16, r21
     47a:	3f 00       	.word	0x003f	; ????
     47c:	80 00       	.word	0x0080	; ????
     47e:	42 19       	sub	r20, r2
     480:	02 00       	.word	0x0002	; ????
     482:	00 00       	nop
     484:	00 14       	cp	r0, r0
     486:	00 00       	nop
     488:	00 01       	movw	r0, r0
     48a:	05 03       	mulsu	r16, r21
     48c:	10 01       	movw	r2, r0
     48e:	80 00       	.word	0x0080	; ????
     490:	43 1f       	adc	r20, r19
     492:	02 00       	.word	0x0002	; ????
     494:	00 00       	nop
     496:	00 14       	cp	r0, r0
     498:	00 00       	nop
     49a:	00 01       	movw	r0, r0
     49c:	05 03       	mulsu	r16, r21
     49e:	12 01       	movw	r2, r4
     4a0:	80 00       	.word	0x0080	; ????
     4a2:	44 27       	eor	r20, r20
     4a4:	02 00       	.word	0x0002	; ????
     4a6:	00 00       	nop
     4a8:	00 14       	cp	r0, r0
     4aa:	00 00       	nop
     4ac:	00 01       	movw	r0, r0
     4ae:	05 03       	mulsu	r16, r21
     4b0:	13 01       	movw	r2, r6
     4b2:	80 00       	.word	0x0080	; ????
     4b4:	45 2f       	mov	r20, r21
     4b6:	02 00       	.word	0x0002	; ????
     4b8:	00 00       	nop
     4ba:	00 14       	cp	r0, r0
     4bc:	00 00       	nop
     4be:	00 01       	movw	r0, r0
     4c0:	05 03       	mulsu	r16, r21
     4c2:	11 01       	movw	r2, r2
     4c4:	80 00       	.word	0x0080	; ????
     4c6:	46 36       	cpi	r20, 0x66	; 102
     4c8:	02 00       	.word	0x0002	; ????
     4ca:	00 00       	nop
     4cc:	00 14       	cp	r0, r0
     4ce:	00 00       	nop
     4d0:	00 01       	movw	r0, r0
     4d2:	05 03       	mulsu	r16, r21
     4d4:	20 01       	movw	r4, r0
     4d6:	80 00       	.word	0x0080	; ????
     4d8:	47 3c       	cpi	r20, 0xC7	; 199
     4da:	02 00       	.word	0x0002	; ????
     4dc:	00 00       	nop
     4de:	00 14       	cp	r0, r0
     4e0:	00 00       	nop
     4e2:	00 01       	movw	r0, r0
     4e4:	05 03       	mulsu	r16, r21
     4e6:	21 01       	movw	r4, r2
     4e8:	80 00       	.word	0x0080	; ????
     4ea:	48 42       	sbci	r20, 0x28	; 40
     4ec:	02 00       	.word	0x0002	; ????
     4ee:	00 00       	nop
     4f0:	00 14       	cp	r0, r0
     4f2:	00 00       	nop
     4f4:	00 01       	movw	r0, r0
     4f6:	05 03       	mulsu	r16, r21
     4f8:	22 01       	movw	r4, r4
     4fa:	80 00       	.word	0x0080	; ????
     4fc:	49 49       	sbci	r20, 0x99	; 153
     4fe:	02 00       	.word	0x0002	; ????
     500:	00 00       	nop
     502:	00 14       	cp	r0, r0
     504:	00 00       	nop
     506:	00 01       	movw	r0, r0
     508:	05 03       	mulsu	r16, r21
     50a:	90 01       	movw	r18, r0
     50c:	80 00       	.word	0x0080	; ????
     50e:	4a 52       	subi	r20, 0x2A	; 42
     510:	02 00       	.word	0x0002	; ????
     512:	00 00       	nop
     514:	00 14       	cp	r0, r0
     516:	00 00       	nop
     518:	00 01       	movw	r0, r0
     51a:	05 03       	mulsu	r16, r21
     51c:	91 01       	movw	r18, r2
     51e:	80 00       	.word	0x0080	; ????
     520:	4b 5b       	subi	r20, 0xBB	; 187
     522:	02 00       	.word	0x0002	; ????
     524:	00 00       	nop
     526:	00 14       	cp	r0, r0
     528:	00 00       	nop
     52a:	00 01       	movw	r0, r0
     52c:	05 03       	mulsu	r16, r21
     52e:	92 01       	movw	r18, r4
     530:	80 00       	.word	0x0080	; ????
     532:	4c 64       	ori	r20, 0x4C	; 76
     534:	02 00       	.word	0x0002	; ????
     536:	00 00       	nop
     538:	00 14       	cp	r0, r0
     53a:	00 00       	nop
     53c:	00 01       	movw	r0, r0
     53e:	05 03       	mulsu	r16, r21
     540:	93 01       	movw	r18, r6
     542:	80 00       	.word	0x0080	; ????
     544:	4d 6d       	ori	r20, 0xDD	; 221
     546:	02 00       	.word	0x0002	; ????
     548:	00 00       	nop
     54a:	00 14       	cp	r0, r0
     54c:	00 00       	nop
     54e:	00 01       	movw	r0, r0
     550:	05 03       	mulsu	r16, r21
     552:	94 01       	movw	r18, r8
     554:	80 00       	.word	0x0080	; ????
     556:	4e 76       	andi	r20, 0x6E	; 110
     558:	02 00       	.word	0x0002	; ????
     55a:	00 00       	nop
     55c:	00 14       	cp	r0, r0
     55e:	00 00       	nop
     560:	00 01       	movw	r0, r0
     562:	05 03       	mulsu	r16, r21
     564:	95 01       	movw	r18, r10
     566:	80 00       	.word	0x0080	; ????
     568:	4f 7f       	andi	r20, 0xFF	; 255
     56a:	02 00       	.word	0x0002	; ????
     56c:	00 00       	nop
     56e:	00 14       	cp	r0, r0
     570:	00 00       	nop
     572:	00 01       	movw	r0, r0
     574:	05 03       	mulsu	r16, r21
     576:	96 01       	movw	r18, r12
     578:	80 00       	.word	0x0080	; ????
     57a:	50 88       	ldd	r5, Z+16	; 0x10
     57c:	02 00       	.word	0x0002	; ????
     57e:	00 00       	nop
     580:	00 14       	cp	r0, r0
     582:	00 00       	nop
     584:	00 01       	movw	r0, r0
     586:	05 03       	mulsu	r16, r21
     588:	97 01       	movw	r18, r14
     58a:	80 00       	.word	0x0080	; ????
     58c:	51 91       	ld	r21, Z+
     58e:	02 00       	.word	0x0002	; ????
     590:	00 00       	nop
     592:	00 14       	cp	r0, r0
     594:	00 00       	nop
     596:	00 01       	movw	r0, r0
     598:	05 03       	mulsu	r16, r21
     59a:	80 01       	movw	r16, r0
     59c:	80 00       	.word	0x0080	; ????
     59e:	52 98       	cbi	0x0a, 2	; 10
     5a0:	02 00       	.word	0x0002	; ????
     5a2:	00 00       	nop
     5a4:	00 14       	cp	r0, r0
     5a6:	00 00       	nop
     5a8:	00 01       	movw	r0, r0
     5aa:	05 03       	mulsu	r16, r21
     5ac:	a8 01       	movw	r20, r16
     5ae:	80 00       	.word	0x0080	; ????
     5b0:	53 a1       	ldd	r21, Z+35	; 0x23
     5b2:	02 00       	.word	0x0002	; ????
     5b4:	00 00       	nop
     5b6:	00 14       	cp	r0, r0
     5b8:	00 00       	nop
     5ba:	00 01       	movw	r0, r0
     5bc:	05 03       	mulsu	r16, r21
     5be:	a0 01       	movw	r20, r0
     5c0:	80 00       	.word	0x0080	; ????
     5c2:	54 ae       	std	Z+60, r5	; 0x3c
     5c4:	02 00       	.word	0x0002	; ????
     5c6:	00 00       	nop
     5c8:	00 14       	cp	r0, r0
     5ca:	00 00       	nop
     5cc:	00 01       	movw	r0, r0
     5ce:	05 03       	mulsu	r16, r21
     5d0:	a1 01       	movw	r20, r2
     5d2:	80 00       	.word	0x0080	; ????
     5d4:	55 bb       	out	0x15, r21	; 21
     5d6:	02 00       	.word	0x0002	; ????
     5d8:	00 00       	nop
     5da:	00 14       	cp	r0, r0
     5dc:	00 00       	nop
     5de:	00 01       	movw	r0, r0
     5e0:	05 03       	mulsu	r16, r21
     5e2:	a2 01       	movw	r20, r4
     5e4:	80 00       	.word	0x0080	; ????
     5e6:	56 c8       	rjmp	.-3924   	; 0xfffff694 <__eeprom_end+0xff7ef694>
     5e8:	02 00       	.word	0x0002	; ????
     5ea:	00 00       	nop
     5ec:	00 14       	cp	r0, r0
     5ee:	00 00       	nop
     5f0:	00 01       	movw	r0, r0
     5f2:	05 03       	mulsu	r16, r21
     5f4:	a3 01       	movw	r20, r6
     5f6:	80 00       	.word	0x0080	; ????
     5f8:	57 d5       	rcall	.+2734   	; 0x10a8 <__LOCK_REGION_LENGTH__+0xca8>
     5fa:	02 00       	.word	0x0002	; ????
     5fc:	00 00       	nop
     5fe:	00 14       	cp	r0, r0
     600:	00 00       	nop
     602:	00 01       	movw	r0, r0
     604:	05 03       	mulsu	r16, r21
     606:	a4 01       	movw	r20, r8
     608:	80 00       	.word	0x0080	; ????
     60a:	58 e2       	ldi	r21, 0x28	; 40
     60c:	02 00       	.word	0x0002	; ????
     60e:	00 00       	nop
     610:	00 14       	cp	r0, r0
     612:	00 00       	nop
     614:	00 01       	movw	r0, r0
     616:	05 03       	mulsu	r16, r21
     618:	a5 01       	movw	r20, r10
     61a:	80 00       	.word	0x0080	; ????
     61c:	59 ef       	ldi	r21, 0xF9	; 249
     61e:	02 00       	.word	0x0002	; ????
     620:	00 00       	nop
     622:	00 14       	cp	r0, r0
     624:	00 00       	nop
     626:	00 01       	movw	r0, r0
     628:	05 03       	mulsu	r16, r21
     62a:	a6 01       	movw	r20, r12
     62c:	80 00       	.word	0x0080	; ????
     62e:	5a fc       	.word	0xfc5a	; ????
     630:	02 00       	.word	0x0002	; ????
     632:	00 00       	nop
     634:	00 14       	cp	r0, r0
     636:	00 00       	nop
     638:	00 01       	movw	r0, r0
     63a:	05 03       	mulsu	r16, r21
     63c:	a7 01       	movw	r20, r14
     63e:	80 00       	.word	0x0080	; ????
     640:	5b 09       	sbc	r21, r11
     642:	03 00       	.word	0x0003	; ????
     644:	00 00       	nop
     646:	00 14       	cp	r0, r0
     648:	00 00       	nop
     64a:	00 01       	movw	r0, r0
     64c:	05 03       	mulsu	r16, r21
     64e:	a9 01       	movw	r20, r18
     650:	80 00       	.word	0x0080	; ????
     652:	5c 14       	cp	r5, r12
     654:	03 00       	.word	0x0003	; ????
     656:	00 00       	nop
     658:	00 14       	cp	r0, r0
     65a:	00 00       	nop
     65c:	00 01       	movw	r0, r0
     65e:	05 03       	mulsu	r16, r21
     660:	aa 01       	movw	r20, r20
     662:	80 00       	.word	0x0080	; ????
     664:	5d 1f       	adc	r21, r29
     666:	03 00       	.word	0x0003	; ????
     668:	00 00       	nop
     66a:	00 14       	cp	r0, r0
     66c:	00 00       	nop
     66e:	00 01       	movw	r0, r0
     670:	05 03       	mulsu	r16, r21
     672:	ab 01       	movw	r20, r22
     674:	80 00       	.word	0x0080	; ????
     676:	5e 2a       	or	r5, r30
     678:	03 00       	.word	0x0003	; ????
     67a:	00 00       	nop
     67c:	00 14       	cp	r0, r0
     67e:	00 00       	nop
     680:	00 01       	movw	r0, r0
     682:	05 03       	mulsu	r16, r21
     684:	ac 01       	movw	r20, r24
     686:	80 00       	.word	0x0080	; ????
     688:	5f 35       	cpi	r21, 0x5F	; 95
     68a:	03 00       	.word	0x0003	; ????
     68c:	00 00       	nop
     68e:	00 14       	cp	r0, r0
     690:	00 00       	nop
     692:	00 01       	movw	r0, r0
     694:	05 03       	mulsu	r16, r21
     696:	ad 01       	movw	r20, r26
     698:	80 00       	.word	0x0080	; ????
     69a:	60 40       	sbci	r22, 0x00	; 0
     69c:	03 00       	.word	0x0003	; ????
     69e:	00 00       	nop
     6a0:	00 14       	cp	r0, r0
     6a2:	00 00       	nop
     6a4:	00 01       	movw	r0, r0
     6a6:	05 03       	mulsu	r16, r21
     6a8:	ae 01       	movw	r20, r28
     6aa:	80 00       	.word	0x0080	; ????
     6ac:	61 4b       	sbci	r22, 0xB1	; 177
     6ae:	03 00       	.word	0x0003	; ????
     6b0:	00 00       	nop
     6b2:	00 14       	cp	r0, r0
     6b4:	00 00       	nop
     6b6:	00 01       	movw	r0, r0
     6b8:	05 03       	mulsu	r16, r21
     6ba:	b3 01       	movw	r22, r6
     6bc:	80 00       	.word	0x0080	; ????
     6be:	62 54       	subi	r22, 0x42	; 66
     6c0:	03 00       	.word	0x0003	; ????
     6c2:	00 00       	nop
     6c4:	00 14       	cp	r0, r0
     6c6:	00 00       	nop
     6c8:	00 01       	movw	r0, r0
     6ca:	05 03       	mulsu	r16, r21
     6cc:	b4 01       	movw	r22, r8
     6ce:	80 00       	.word	0x0080	; ????
     6d0:	63 5d       	subi	r22, 0xD3	; 211
     6d2:	03 00       	.word	0x0003	; ????
     6d4:	00 00       	nop
     6d6:	00 14       	cp	r0, r0
     6d8:	00 00       	nop
     6da:	00 01       	movw	r0, r0
     6dc:	05 03       	mulsu	r16, r21
     6de:	b5 01       	movw	r22, r10
     6e0:	80 00       	.word	0x0080	; ????
     6e2:	64 66       	ori	r22, 0x64	; 100
     6e4:	03 00       	.word	0x0003	; ????
     6e6:	00 00       	nop
     6e8:	00 14       	cp	r0, r0
     6ea:	00 00       	nop
     6ec:	00 01       	movw	r0, r0
     6ee:	05 03       	mulsu	r16, r21
     6f0:	b6 01       	movw	r22, r12
     6f2:	80 00       	.word	0x0080	; ????
     6f4:	65 6f       	ori	r22, 0xF5	; 245
     6f6:	03 00       	.word	0x0003	; ????
     6f8:	00 00       	nop
     6fa:	00 14       	cp	r0, r0
     6fc:	00 00       	nop
     6fe:	00 01       	movw	r0, r0
     700:	05 03       	mulsu	r16, r21
     702:	b7 01       	movw	r22, r14
     704:	80 00       	.word	0x0080	; ????
     706:	66 78       	andi	r22, 0x86	; 134
     708:	03 00       	.word	0x0003	; ????
     70a:	00 00       	nop
     70c:	00 14       	cp	r0, r0
     70e:	00 00       	nop
     710:	00 01       	movw	r0, r0
     712:	05 03       	mulsu	r16, r21
     714:	af 01       	movw	r20, r30
     716:	80 00       	.word	0x0080	; ????
     718:	67 83       	std	Z+7, r22	; 0x07
     71a:	03 00       	.word	0x0003	; ????
     71c:	00 00       	nop
     71e:	00 14       	cp	r0, r0
     720:	00 00       	nop
     722:	00 01       	movw	r0, r0
     724:	05 03       	mulsu	r16, r21
     726:	b0 01       	movw	r22, r0
     728:	80 00       	.word	0x0080	; ????
     72a:	68 8e       	std	Y+24, r6	; 0x18
     72c:	03 00       	.word	0x0003	; ????
     72e:	00 00       	nop
     730:	00 14       	cp	r0, r0
     732:	00 00       	nop
     734:	00 01       	movw	r0, r0
     736:	05 03       	mulsu	r16, r21
     738:	b1 01       	movw	r22, r2
     73a:	80 00       	.word	0x0080	; ????
     73c:	69 99       	sbic	0x0d, 1	; 13
     73e:	03 00       	.word	0x0003	; ????
     740:	00 00       	nop
     742:	00 14       	cp	r0, r0
     744:	00 00       	nop
     746:	00 01       	movw	r0, r0
     748:	05 03       	mulsu	r16, r21
     74a:	b2 01       	movw	r22, r4
     74c:	80 00       	.word	0x0080	; ????
     74e:	6a a4       	ldd	r6, Y+42	; 0x2a
     750:	03 00       	.word	0x0003	; ????
     752:	00 00       	nop
     754:	00 14       	cp	r0, r0
     756:	00 00       	nop
     758:	00 01       	movw	r0, r0
     75a:	05 03       	mulsu	r16, r21
     75c:	87 12       	cpse	r8, r23
     75e:	80 00       	.word	0x0080	; ????
     760:	6b ab       	std	Y+51, r22	; 0x33
     762:	03 00       	.word	0x0003	; ????
     764:	00 00       	nop
     766:	00 14       	cp	r0, r0
     768:	00 00       	nop
     76a:	00 01       	movw	r0, r0
     76c:	05 03       	mulsu	r16, r21
     76e:	81 12       	cpse	r8, r17
     770:	80 00       	.word	0x0080	; ????
     772:	6c b2       	in	r6, 0x1c	; 28
     774:	03 00       	.word	0x0003	; ????
     776:	00 00       	nop
     778:	00 14       	cp	r0, r0
     77a:	00 00       	nop
     77c:	00 01       	movw	r0, r0
     77e:	05 03       	mulsu	r16, r21
     780:	88 12       	cpse	r8, r24
     782:	80 00       	.word	0x0080	; ????
     784:	6d ba       	out	0x1d, r6	; 29
     786:	03 00       	.word	0x0003	; ????
     788:	00 00       	nop
     78a:	00 14       	cp	r0, r0
     78c:	00 00       	nop
     78e:	00 01       	movw	r0, r0
     790:	05 03       	mulsu	r16, r21
     792:	82 12       	cpse	r8, r18
     794:	80 00       	.word	0x0080	; ????
     796:	6e c1       	rjmp	.+732    	; 0xa74 <__LOCK_REGION_LENGTH__+0x674>
     798:	03 00       	.word	0x0003	; ????
     79a:	00 00       	nop
     79c:	00 14       	cp	r0, r0
     79e:	00 00       	nop
     7a0:	00 01       	movw	r0, r0
     7a2:	05 03       	mulsu	r16, r21
     7a4:	85 12       	cpse	r8, r21
     7a6:	80 00       	.word	0x0080	; ????
     7a8:	6f c9       	rjmp	.-3362   	; 0xfffffa88 <__eeprom_end+0xff7efa88>
     7aa:	03 00       	.word	0x0003	; ????
     7ac:	00 00       	nop
     7ae:	00 14       	cp	r0, r0
     7b0:	00 00       	nop
     7b2:	00 01       	movw	r0, r0
     7b4:	05 03       	mulsu	r16, r21
     7b6:	86 12       	cpse	r8, r22
     7b8:	80 00       	.word	0x0080	; ????
     7ba:	70 d1       	rcall	.+736    	; 0xa9c <__LOCK_REGION_LENGTH__+0x69c>
     7bc:	03 00       	.word	0x0003	; ????
     7be:	00 00       	nop
     7c0:	00 14       	cp	r0, r0
     7c2:	00 00       	nop
     7c4:	00 01       	movw	r0, r0
     7c6:	05 03       	mulsu	r16, r21
     7c8:	80 12       	cpse	r8, r16
     7ca:	80 00       	.word	0x0080	; ????
     7cc:	71 d8       	rcall	.-3870   	; 0xfffff8b0 <__eeprom_end+0xff7ef8b0>
     7ce:	03 00       	.word	0x0003	; ????
     7d0:	00 00       	nop
     7d2:	00 14       	cp	r0, r0
     7d4:	00 00       	nop
     7d6:	00 01       	movw	r0, r0
     7d8:	05 03       	mulsu	r16, r21
     7da:	1c 00       	.word	0x001c	; ????
     7dc:	80 00       	.word	0x0080	; ????
     7de:	72 df       	rcall	.-284    	; 0x6c4 <__LOCK_REGION_LENGTH__+0x2c4>
     7e0:	03 00       	.word	0x0003	; ????
     7e2:	00 00       	nop
     7e4:	00 14       	cp	r0, r0
     7e6:	00 00       	nop
     7e8:	00 01       	movw	r0, r0
     7ea:	05 03       	mulsu	r16, r21
     7ec:	1d 00       	.word	0x001d	; ????
     7ee:	80 00       	.word	0x0080	; ????
     7f0:	73 e6       	ldi	r23, 0x63	; 99
     7f2:	03 00       	.word	0x0003	; ????
     7f4:	00 00       	nop
     7f6:	00 14       	cp	r0, r0
     7f8:	00 00       	nop
     7fa:	00 01       	movw	r0, r0
     7fc:	05 03       	mulsu	r16, r21
     7fe:	1e 00       	.word	0x001e	; ????
     800:	80 00       	.word	0x0080	; ????
     802:	74 ed       	ldi	r23, 0xD4	; 212
     804:	03 00       	.word	0x0003	; ????
     806:	00 00       	nop
     808:	00 14       	cp	r0, r0
     80a:	00 00       	nop
     80c:	00 01       	movw	r0, r0
     80e:	05 03       	mulsu	r16, r21
     810:	1f 00       	.word	0x001f	; ????
     812:	80 00       	.word	0x0080	; ????
     814:	75 f4       	brhc	.+28     	; 0x832 <__LOCK_REGION_LENGTH__+0x432>
     816:	03 00       	.word	0x0003	; ????
     818:	00 00       	nop
     81a:	00 14       	cp	r0, r0
     81c:	00 00       	nop
     81e:	00 01       	movw	r0, r0
     820:	05 03       	mulsu	r16, r21
     822:	8a 12       	cpse	r8, r26
     824:	80 00       	.word	0x0080	; ????
     826:	76 fc       	sbrc	r7, 6
     828:	03 00       	.word	0x0003	; ????
     82a:	00 00       	nop
     82c:	00 1b       	sub	r16, r16
     82e:	00 00       	nop
     830:	00 01       	movw	r0, r0
     832:	05 03       	mulsu	r16, r21
     834:	08 10       	cpse	r0, r8
     836:	80 00       	.word	0x0080	; ????
     838:	77 01       	movw	r14, r14
     83a:	04 00       	.word	0x0004	; ????
     83c:	00 00       	nop
     83e:	00 14       	cp	r0, r0
     840:	00 00       	nop
     842:	00 01       	movw	r0, r0
     844:	05 03       	mulsu	r16, r21
     846:	00 10       	cpse	r0, r0
     848:	80 00       	.word	0x0080	; ????
     84a:	78 07       	cpc	r23, r24
     84c:	04 00       	.word	0x0004	; ????
     84e:	00 00       	nop
     850:	00 14       	cp	r0, r0
     852:	00 00       	nop
     854:	00 01       	movw	r0, r0
     856:	05 03       	mulsu	r16, r21
     858:	01 10       	cpse	r0, r1
     85a:	80 00       	.word	0x0080	; ????
     85c:	79 0d       	add	r23, r9
     85e:	04 00       	.word	0x0004	; ????
     860:	00 00       	nop
     862:	00 1b       	sub	r16, r16
     864:	00 00       	nop
     866:	00 01       	movw	r0, r0
     868:	05 03       	mulsu	r16, r21
     86a:	06 10       	cpse	r0, r6
     86c:	80 00       	.word	0x0080	; ????
     86e:	7a 12       	cpse	r7, r26
     870:	04 00       	.word	0x0004	; ????
     872:	00 00       	nop
     874:	00 14       	cp	r0, r0
     876:	00 00       	nop
     878:	00 01       	movw	r0, r0
     87a:	05 03       	mulsu	r16, r21
     87c:	03 10       	cpse	r0, r3
     87e:	80 00       	.word	0x0080	; ????
     880:	7b 1a       	sub	r7, r27
     882:	04 00       	.word	0x0004	; ????
     884:	00 00       	nop
     886:	00 14       	cp	r0, r0
     888:	00 00       	nop
     88a:	00 01       	movw	r0, r0
     88c:	05 03       	mulsu	r16, r21
     88e:	04 10       	cpse	r0, r4
     890:	80 00       	.word	0x0080	; ????
     892:	7c 23       	and	r23, r28
     894:	04 00       	.word	0x0004	; ????
     896:	00 00       	nop
     898:	00 14       	cp	r0, r0
     89a:	00 00       	nop
     89c:	00 01       	movw	r0, r0
     89e:	05 03       	mulsu	r16, r21
     8a0:	02 10       	cpse	r0, r2
     8a2:	80 00       	.word	0x0080	; ????
     8a4:	7d 2a       	or	r7, r29
     8a6:	04 00       	.word	0x0004	; ????
     8a8:	00 00       	nop
     8aa:	00 14       	cp	r0, r0
     8ac:	00 00       	nop
     8ae:	00 01       	movw	r0, r0
     8b0:	05 03       	mulsu	r16, r21
     8b2:	00 04       	cpc	r0, r0
     8b4:	80 00       	.word	0x0080	; ????
     8b6:	7e 2e       	mov	r7, r30
     8b8:	04 00       	.word	0x0004	; ????
     8ba:	00 00       	nop
     8bc:	00 14       	cp	r0, r0
     8be:	00 00       	nop
     8c0:	00 01       	movw	r0, r0
     8c2:	05 03       	mulsu	r16, r21
     8c4:	02 04       	cpc	r0, r2
     8c6:	80 00       	.word	0x0080	; ????
     8c8:	7f 35       	cpi	r23, 0x5F	; 95
     8ca:	04 00       	.word	0x0004	; ????
     8cc:	00 00       	nop
     8ce:	00 14       	cp	r0, r0
     8d0:	00 00       	nop
     8d2:	00 01       	movw	r0, r0
     8d4:	05 03       	mulsu	r16, r21
     8d6:	01 04       	cpc	r0, r1
     8d8:	80 00       	.word	0x0080	; ????
     8da:	80 01       	movw	r16, r0
     8dc:	3c 04       	cpc	r3, r12
     8de:	00 00       	nop
     8e0:	00 00       	nop
     8e2:	14 00       	.word	0x0014	; ????
     8e4:	00 00       	nop
     8e6:	01 05       	cpc	r16, r1
     8e8:	03 03       	mulsu	r16, r19
     8ea:	04 80       	ldd	r0, Z+4	; 0x04
     8ec:	00 81       	ld	r16, Z
     8ee:	01 43       	sbci	r16, 0x31	; 49
     8f0:	04 00       	.word	0x0004	; ????
     8f2:	00 00       	nop
     8f4:	00 14       	cp	r0, r0
     8f6:	00 00       	nop
     8f8:	00 01       	movw	r0, r0
     8fa:	05 03       	mulsu	r16, r21
     8fc:	08 04       	cpc	r0, r8
     8fe:	80 00       	.word	0x0080	; ????
     900:	82 01       	movw	r16, r4
     902:	46 04       	cpc	r4, r6
     904:	00 00       	nop
     906:	00 00       	nop
     908:	14 00       	.word	0x0014	; ????
     90a:	00 00       	nop
     90c:	01 05       	cpc	r16, r1
     90e:	03 09       	sbc	r16, r3
     910:	04 80       	ldd	r0, Z+4	; 0x04
     912:	00 83       	st	Z, r16
     914:	01 4f       	sbci	r16, 0xF1	; 241
     916:	04 00       	.word	0x0004	; ????
     918:	00 00       	nop
     91a:	00 14       	cp	r0, r0
     91c:	00 00       	nop
     91e:	00 01       	movw	r0, r0
     920:	05 03       	mulsu	r16, r21
     922:	04 04       	cpc	r0, r4
     924:	80 00       	.word	0x0080	; ????
     926:	84 01       	movw	r16, r8
     928:	53 04       	cpc	r5, r3
     92a:	00 00       	nop
     92c:	00 00       	nop
     92e:	14 00       	.word	0x0014	; ????
     930:	00 00       	nop
     932:	01 05       	cpc	r16, r1
     934:	03 06       	cpc	r0, r19
     936:	04 80       	ldd	r0, Z+4	; 0x04
     938:	00 85       	ldd	r16, Z+8	; 0x08
     93a:	01 5a       	subi	r16, 0xA1	; 161
     93c:	04 00       	.word	0x0004	; ????
     93e:	00 00       	nop
     940:	00 14       	cp	r0, r0
     942:	00 00       	nop
     944:	00 01       	movw	r0, r0
     946:	05 03       	mulsu	r16, r21
     948:	05 04       	cpc	r0, r5
     94a:	80 00       	.word	0x0080	; ????
     94c:	86 01       	movw	r16, r12
     94e:	61 04       	cpc	r6, r1
     950:	00 00       	nop
     952:	00 00       	nop
     954:	14 00       	.word	0x0014	; ????
     956:	00 00       	nop
     958:	01 05       	cpc	r16, r1
     95a:	03 07       	cpc	r16, r19
     95c:	04 80       	ldd	r0, Z+4	; 0x04
     95e:	00 87       	std	Z+8, r16	; 0x08
     960:	01 68       	ori	r16, 0x81	; 129
     962:	04 00       	.word	0x0004	; ????
     964:	00 00       	nop
     966:	00 14       	cp	r0, r0
     968:	00 00       	nop
     96a:	00 01       	movw	r0, r0
     96c:	05 03       	mulsu	r16, r21
     96e:	10 04       	cpc	r1, r0
     970:	80 00       	.word	0x0080	; ????
     972:	88 01       	movw	r16, r16
     974:	71 04       	cpc	r7, r1
     976:	00 00       	nop
     978:	00 00       	nop
     97a:	14 00       	.word	0x0014	; ????
     97c:	00 00       	nop
     97e:	01 05       	cpc	r16, r1
     980:	03 11       	cpse	r16, r3
     982:	04 80       	ldd	r0, Z+4	; 0x04
     984:	00 89       	ldd	r16, Z+16	; 0x10
     986:	01 7a       	andi	r16, 0xA1	; 161
     988:	04 00       	.word	0x0004	; ????
     98a:	00 00       	nop
     98c:	00 14       	cp	r0, r0
     98e:	00 00       	nop
     990:	00 01       	movw	r0, r0
     992:	05 03       	mulsu	r16, r21
     994:	12 04       	cpc	r1, r2
     996:	80 00       	.word	0x0080	; ????
     998:	8a 01       	movw	r16, r20
     99a:	83 04       	cpc	r8, r3
     99c:	00 00       	nop
     99e:	00 00       	nop
     9a0:	14 00       	.word	0x0014	; ????
     9a2:	00 00       	nop
     9a4:	01 05       	cpc	r16, r1
     9a6:	03 13       	cpse	r16, r19
     9a8:	04 80       	ldd	r0, Z+4	; 0x04
     9aa:	00 8b       	std	Z+16, r16	; 0x10
     9ac:	01 8c       	ldd	r0, Z+25	; 0x19
     9ae:	04 00       	.word	0x0004	; ????
     9b0:	00 00       	nop
     9b2:	00 14       	cp	r0, r0
     9b4:	00 00       	nop
     9b6:	00 01       	movw	r0, r0
     9b8:	05 03       	mulsu	r16, r21
     9ba:	14 04       	cpc	r1, r4
     9bc:	80 00       	.word	0x0080	; ????
     9be:	8c 01       	movw	r16, r24
     9c0:	95 04       	cpc	r9, r5
     9c2:	00 00       	nop
     9c4:	00 00       	nop
     9c6:	14 00       	.word	0x0014	; ????
     9c8:	00 00       	nop
     9ca:	01 05       	cpc	r16, r1
     9cc:	03 15       	cp	r16, r3
     9ce:	04 80       	ldd	r0, Z+4	; 0x04
     9d0:	00 8d       	ldd	r16, Z+24	; 0x18
     9d2:	01 9e       	mul	r0, r17
     9d4:	04 00       	.word	0x0004	; ????
     9d6:	00 00       	nop
     9d8:	00 14       	cp	r0, r0
     9da:	00 00       	nop
     9dc:	00 01       	movw	r0, r0
     9de:	05 03       	mulsu	r16, r21
     9e0:	16 04       	cpc	r1, r6
     9e2:	80 00       	.word	0x0080	; ????
     9e4:	8e 01       	movw	r16, r28
     9e6:	a7 04       	cpc	r10, r7
     9e8:	00 00       	nop
     9ea:	00 00       	nop
     9ec:	14 00       	.word	0x0014	; ????
     9ee:	00 00       	nop
     9f0:	01 05       	cpc	r16, r1
     9f2:	03 17       	cp	r16, r19
     9f4:	04 80       	ldd	r0, Z+4	; 0x04
     9f6:	00 8f       	std	Z+24, r16	; 0x18
     9f8:	01 b0       	in	r0, 0x01	; 1
     9fa:	04 00       	.word	0x0004	; ????
     9fc:	00 00       	nop
     9fe:	00 14       	cp	r0, r0
     a00:	00 00       	nop
     a02:	00 01       	movw	r0, r0
     a04:	05 03       	mulsu	r16, r21
     a06:	0a 04       	cpc	r0, r10
     a08:	80 00       	.word	0x0080	; ????
     a0a:	90 01       	movw	r18, r0
     a0c:	b9 04       	cpc	r11, r9
     a0e:	00 00       	nop
     a10:	00 00       	nop
     a12:	14 00       	.word	0x0014	; ????
     a14:	00 00       	nop
     a16:	01 05       	cpc	r16, r1
     a18:	03 20       	and	r0, r3
     a1a:	04 80       	ldd	r0, Z+4	; 0x04
     a1c:	00 91 01 bd 	lds	r16, 0xBD01	; 0x80bd01 <__DATA_REGION_ORIGIN__+0x9501>
     a20:	04 00       	.word	0x0004	; ????
     a22:	00 00       	nop
     a24:	00 14       	cp	r0, r0
     a26:	00 00       	nop
     a28:	00 01       	movw	r0, r0
     a2a:	05 03       	mulsu	r16, r21
     a2c:	22 04       	cpc	r2, r2
     a2e:	80 00       	.word	0x0080	; ????
     a30:	92 01       	movw	r18, r4
     a32:	c4 04       	cpc	r12, r4
     a34:	00 00       	nop
     a36:	00 00       	nop
     a38:	14 00       	.word	0x0014	; ????
     a3a:	00 00       	nop
     a3c:	01 05       	cpc	r16, r1
     a3e:	03 21       	and	r16, r3
     a40:	04 80       	ldd	r0, Z+4	; 0x04
     a42:	00 93 01 cb 	sts	0xCB01, r16	; 0x80cb01 <__DATA_REGION_ORIGIN__+0xa301>
     a46:	04 00       	.word	0x0004	; ????
     a48:	00 00       	nop
     a4a:	00 14       	cp	r0, r0
     a4c:	00 00       	nop
     a4e:	00 01       	movw	r0, r0
     a50:	05 03       	mulsu	r16, r21
     a52:	23 04       	cpc	r2, r3
     a54:	80 00       	.word	0x0080	; ????
     a56:	94 01       	movw	r18, r8
     a58:	d2 04       	cpc	r13, r2
     a5a:	00 00       	nop
     a5c:	00 00       	nop
     a5e:	14 00       	.word	0x0014	; ????
     a60:	00 00       	nop
     a62:	01 05       	cpc	r16, r1
     a64:	03 28       	or	r0, r3
     a66:	04 80       	ldd	r0, Z+4	; 0x04
     a68:	00 95       	com	r16
     a6a:	01 d5       	rcall	.+2562   	; 0x146e <__LOCK_REGION_LENGTH__+0x106e>
     a6c:	04 00       	.word	0x0004	; ????
     a6e:	00 00       	nop
     a70:	00 14       	cp	r0, r0
     a72:	00 00       	nop
     a74:	00 01       	movw	r0, r0
     a76:	05 03       	mulsu	r16, r21
     a78:	29 04       	cpc	r2, r9
     a7a:	80 00       	.word	0x0080	; ????
     a7c:	96 01       	movw	r18, r12
     a7e:	de 04       	cpc	r13, r14
     a80:	00 00       	nop
     a82:	00 00       	nop
     a84:	14 00       	.word	0x0014	; ????
     a86:	00 00       	nop
     a88:	01 05       	cpc	r16, r1
     a8a:	03 24       	eor	r0, r3
     a8c:	04 80       	ldd	r0, Z+4	; 0x04
     a8e:	00 97       	sbiw	r24, 0x00	; 0
     a90:	01 e2       	ldi	r16, 0x21	; 33
     a92:	04 00       	.word	0x0004	; ????
     a94:	00 00       	nop
     a96:	00 14       	cp	r0, r0
     a98:	00 00       	nop
     a9a:	00 01       	movw	r0, r0
     a9c:	05 03       	mulsu	r16, r21
     a9e:	26 04       	cpc	r2, r6
     aa0:	80 00       	.word	0x0080	; ????
     aa2:	98 01       	movw	r18, r16
     aa4:	e9 04       	cpc	r14, r9
     aa6:	00 00       	nop
     aa8:	00 00       	nop
     aaa:	14 00       	.word	0x0014	; ????
     aac:	00 00       	nop
     aae:	01 05       	cpc	r16, r1
     ab0:	03 25       	eor	r16, r3
     ab2:	04 80       	ldd	r0, Z+4	; 0x04
     ab4:	00 99       	sbic	0x00, 0	; 0
     ab6:	01 f0       	breq	.+0      	; 0xab8 <__LOCK_REGION_LENGTH__+0x6b8>
     ab8:	04 00       	.word	0x0004	; ????
     aba:	00 00       	nop
     abc:	00 14       	cp	r0, r0
     abe:	00 00       	nop
     ac0:	00 01       	movw	r0, r0
     ac2:	05 03       	mulsu	r16, r21
     ac4:	27 04       	cpc	r2, r7
     ac6:	80 00       	.word	0x0080	; ????
     ac8:	9a 01       	movw	r18, r20
     aca:	f7 04       	cpc	r15, r7
     acc:	00 00       	nop
     ace:	00 00       	nop
     ad0:	14 00       	.word	0x0014	; ????
     ad2:	00 00       	nop
     ad4:	01 05       	cpc	r16, r1
     ad6:	03 30       	cpi	r16, 0x03	; 3
     ad8:	04 80       	ldd	r0, Z+4	; 0x04
     ada:	00 9b       	sbis	0x00, 0	; 0
     adc:	01 00       	.word	0x0001	; ????
     ade:	05 00       	.word	0x0005	; ????
     ae0:	00 00       	nop
     ae2:	00 14       	cp	r0, r0
     ae4:	00 00       	nop
     ae6:	00 01       	movw	r0, r0
     ae8:	05 03       	mulsu	r16, r21
     aea:	31 04       	cpc	r3, r1
     aec:	80 00       	.word	0x0080	; ????
     aee:	9c 01       	movw	r18, r24
     af0:	09 05       	cpc	r16, r9
     af2:	00 00       	nop
     af4:	00 00       	nop
     af6:	14 00       	.word	0x0014	; ????
     af8:	00 00       	nop
     afa:	01 05       	cpc	r16, r1
     afc:	03 32       	cpi	r16, 0x23	; 35
     afe:	04 80       	ldd	r0, Z+4	; 0x04
     b00:	00 9d       	mul	r16, r0
     b02:	01 12       	cpse	r0, r17
     b04:	05 00       	.word	0x0005	; ????
     b06:	00 00       	nop
     b08:	00 14       	cp	r0, r0
     b0a:	00 00       	nop
     b0c:	00 01       	movw	r0, r0
     b0e:	05 03       	mulsu	r16, r21
     b10:	33 04       	cpc	r3, r3
     b12:	80 00       	.word	0x0080	; ????
     b14:	9e 01       	movw	r18, r28
     b16:	1b 05       	cpc	r17, r11
     b18:	00 00       	nop
     b1a:	00 00       	nop
     b1c:	14 00       	.word	0x0014	; ????
     b1e:	00 00       	nop
     b20:	01 05       	cpc	r16, r1
     b22:	03 34       	cpi	r16, 0x43	; 67
     b24:	04 80       	ldd	r0, Z+4	; 0x04
     b26:	00 9f       	mul	r16, r16
     b28:	01 24       	eor	r0, r1
     b2a:	05 00       	.word	0x0005	; ????
     b2c:	00 00       	nop
     b2e:	00 14       	cp	r0, r0
     b30:	00 00       	nop
     b32:	00 01       	movw	r0, r0
     b34:	05 03       	mulsu	r16, r21
     b36:	35 04       	cpc	r3, r5
     b38:	80 00       	.word	0x0080	; ????
     b3a:	a0 01       	movw	r20, r0
     b3c:	2d 05       	cpc	r18, r13
     b3e:	00 00       	nop
     b40:	00 00       	nop
     b42:	14 00       	.word	0x0014	; ????
     b44:	00 00       	nop
     b46:	01 05       	cpc	r16, r1
     b48:	03 36       	cpi	r16, 0x63	; 99
     b4a:	04 80       	ldd	r0, Z+4	; 0x04
     b4c:	00 a1       	ldd	r16, Z+32	; 0x20
     b4e:	01 36       	cpi	r16, 0x61	; 97
     b50:	05 00       	.word	0x0005	; ????
     b52:	00 00       	nop
     b54:	00 14       	cp	r0, r0
     b56:	00 00       	nop
     b58:	00 01       	movw	r0, r0
     b5a:	05 03       	mulsu	r16, r21
     b5c:	37 04       	cpc	r3, r7
     b5e:	80 00       	.word	0x0080	; ????
     b60:	a2 01       	movw	r20, r4
     b62:	3f 05       	cpc	r19, r15
     b64:	00 00       	nop
     b66:	00 00       	nop
     b68:	14 00       	.word	0x0014	; ????
     b6a:	00 00       	nop
     b6c:	01 05       	cpc	r16, r1
     b6e:	03 2a       	or	r0, r19
     b70:	04 80       	ldd	r0, Z+4	; 0x04
     b72:	00 a3       	std	Z+32, r16	; 0x20
     b74:	01 48       	sbci	r16, 0x81	; 129
     b76:	05 00       	.word	0x0005	; ????
     b78:	00 00       	nop
     b7a:	00 14       	cp	r0, r0
     b7c:	00 00       	nop
     b7e:	00 01       	movw	r0, r0
     b80:	05 03       	mulsu	r16, r21
     b82:	40 04       	cpc	r4, r0
     b84:	80 00       	.word	0x0080	; ????
     b86:	a4 01       	movw	r20, r8
     b88:	4c 05       	cpc	r20, r12
     b8a:	00 00       	nop
     b8c:	00 00       	nop
     b8e:	14 00       	.word	0x0014	; ????
     b90:	00 00       	nop
     b92:	01 05       	cpc	r16, r1
     b94:	03 42       	sbci	r16, 0x23	; 35
     b96:	04 80       	ldd	r0, Z+4	; 0x04
     b98:	00 a5       	ldd	r16, Z+40	; 0x28
     b9a:	01 53       	subi	r16, 0x31	; 49
     b9c:	05 00       	.word	0x0005	; ????
     b9e:	00 00       	nop
     ba0:	00 14       	cp	r0, r0
     ba2:	00 00       	nop
     ba4:	00 01       	movw	r0, r0
     ba6:	05 03       	mulsu	r16, r21
     ba8:	41 04       	cpc	r4, r1
     baa:	80 00       	.word	0x0080	; ????
     bac:	a6 01       	movw	r20, r12
     bae:	5a 05       	cpc	r21, r10
     bb0:	00 00       	nop
     bb2:	00 00       	nop
     bb4:	14 00       	.word	0x0014	; ????
     bb6:	00 00       	nop
     bb8:	01 05       	cpc	r16, r1
     bba:	03 43       	sbci	r16, 0x33	; 51
     bbc:	04 80       	ldd	r0, Z+4	; 0x04
     bbe:	00 a7       	std	Z+40, r16	; 0x28
     bc0:	01 61       	ori	r16, 0x11	; 17
     bc2:	05 00       	.word	0x0005	; ????
     bc4:	00 00       	nop
     bc6:	00 14       	cp	r0, r0
     bc8:	00 00       	nop
     bca:	00 01       	movw	r0, r0
     bcc:	05 03       	mulsu	r16, r21
     bce:	48 04       	cpc	r4, r8
     bd0:	80 00       	.word	0x0080	; ????
     bd2:	a8 01       	movw	r20, r16
     bd4:	64 05       	cpc	r22, r4
     bd6:	00 00       	nop
     bd8:	00 00       	nop
     bda:	14 00       	.word	0x0014	; ????
     bdc:	00 00       	nop
     bde:	01 05       	cpc	r16, r1
     be0:	03 49       	sbci	r16, 0x93	; 147
     be2:	04 80       	ldd	r0, Z+4	; 0x04
     be4:	00 a9       	ldd	r16, Z+48	; 0x30
     be6:	01 6d       	ori	r16, 0xD1	; 209
     be8:	05 00       	.word	0x0005	; ????
     bea:	00 00       	nop
     bec:	00 14       	cp	r0, r0
     bee:	00 00       	nop
     bf0:	00 01       	movw	r0, r0
     bf2:	05 03       	mulsu	r16, r21
     bf4:	44 04       	cpc	r4, r4
     bf6:	80 00       	.word	0x0080	; ????
     bf8:	aa 01       	movw	r20, r20
     bfa:	71 05       	cpc	r23, r1
     bfc:	00 00       	nop
     bfe:	00 00       	nop
     c00:	14 00       	.word	0x0014	; ????
     c02:	00 00       	nop
     c04:	01 05       	cpc	r16, r1
     c06:	03 46       	sbci	r16, 0x63	; 99
     c08:	04 80       	ldd	r0, Z+4	; 0x04
     c0a:	00 ab       	std	Z+48, r16	; 0x30
     c0c:	01 78       	andi	r16, 0x81	; 129
     c0e:	05 00       	.word	0x0005	; ????
     c10:	00 00       	nop
     c12:	00 14       	cp	r0, r0
     c14:	00 00       	nop
     c16:	00 01       	movw	r0, r0
     c18:	05 03       	mulsu	r16, r21
     c1a:	45 04       	cpc	r4, r5
     c1c:	80 00       	.word	0x0080	; ????
     c1e:	ac 01       	movw	r20, r24
     c20:	7f 05       	cpc	r23, r15
     c22:	00 00       	nop
     c24:	00 00       	nop
     c26:	14 00       	.word	0x0014	; ????
     c28:	00 00       	nop
     c2a:	01 05       	cpc	r16, r1
     c2c:	03 47       	sbci	r16, 0x73	; 115
     c2e:	04 80       	ldd	r0, Z+4	; 0x04
     c30:	00 ad       	ldd	r16, Z+56	; 0x38
     c32:	01 86       	std	Z+9, r0	; 0x09
     c34:	05 00       	.word	0x0005	; ????
     c36:	00 00       	nop
     c38:	00 14       	cp	r0, r0
     c3a:	00 00       	nop
     c3c:	00 01       	movw	r0, r0
     c3e:	05 03       	mulsu	r16, r21
     c40:	50 04       	cpc	r5, r0
     c42:	80 00       	.word	0x0080	; ????
     c44:	ae 01       	movw	r20, r28
     c46:	8f 05       	cpc	r24, r15
     c48:	00 00       	nop
     c4a:	00 00       	nop
     c4c:	14 00       	.word	0x0014	; ????
     c4e:	00 00       	nop
     c50:	01 05       	cpc	r16, r1
     c52:	03 51       	subi	r16, 0x13	; 19
     c54:	04 80       	ldd	r0, Z+4	; 0x04
     c56:	00 af       	std	Z+56, r16	; 0x38
     c58:	01 98       	cbi	0x00, 1	; 0
     c5a:	05 00       	.word	0x0005	; ????
     c5c:	00 00       	nop
     c5e:	00 14       	cp	r0, r0
     c60:	00 00       	nop
     c62:	00 01       	movw	r0, r0
     c64:	05 03       	mulsu	r16, r21
     c66:	52 04       	cpc	r5, r2
     c68:	80 00       	.word	0x0080	; ????
     c6a:	b0 01       	movw	r22, r0
     c6c:	a1 05       	cpc	r26, r1
     c6e:	00 00       	nop
     c70:	00 00       	nop
     c72:	14 00       	.word	0x0014	; ????
     c74:	00 00       	nop
     c76:	01 05       	cpc	r16, r1
     c78:	03 53       	subi	r16, 0x33	; 51
     c7a:	04 80       	ldd	r0, Z+4	; 0x04
     c7c:	00 b1       	in	r16, 0x00	; 0
     c7e:	01 aa       	std	Z+49, r0	; 0x31
     c80:	05 00       	.word	0x0005	; ????
     c82:	00 00       	nop
     c84:	00 14       	cp	r0, r0
     c86:	00 00       	nop
     c88:	00 01       	movw	r0, r0
     c8a:	05 03       	mulsu	r16, r21
     c8c:	54 04       	cpc	r5, r4
     c8e:	80 00       	.word	0x0080	; ????
     c90:	b2 01       	movw	r22, r4
     c92:	b3 05       	cpc	r27, r3
     c94:	00 00       	nop
     c96:	00 00       	nop
     c98:	14 00       	.word	0x0014	; ????
     c9a:	00 00       	nop
     c9c:	01 05       	cpc	r16, r1
     c9e:	03 55       	subi	r16, 0x53	; 83
     ca0:	04 80       	ldd	r0, Z+4	; 0x04
     ca2:	00 b3       	in	r16, 0x10	; 16
     ca4:	01 bc       	out	0x21, r0	; 33
     ca6:	05 00       	.word	0x0005	; ????
     ca8:	00 00       	nop
     caa:	00 14       	cp	r0, r0
     cac:	00 00       	nop
     cae:	00 01       	movw	r0, r0
     cb0:	05 03       	mulsu	r16, r21
     cb2:	56 04       	cpc	r5, r6
     cb4:	80 00       	.word	0x0080	; ????
     cb6:	b4 01       	movw	r22, r8
     cb8:	c5 05       	cpc	r28, r5
     cba:	00 00       	nop
     cbc:	00 00       	nop
     cbe:	14 00       	.word	0x0014	; ????
     cc0:	00 00       	nop
     cc2:	01 05       	cpc	r16, r1
     cc4:	03 57       	subi	r16, 0x73	; 115
     cc6:	04 80       	ldd	r0, Z+4	; 0x04
     cc8:	00 b5       	in	r16, 0x20	; 32
     cca:	01 ce       	rjmp	.-1022   	; 0x8ce <__LOCK_REGION_LENGTH__+0x4ce>
     ccc:	05 00       	.word	0x0005	; ????
     cce:	00 00       	nop
     cd0:	00 14       	cp	r0, r0
     cd2:	00 00       	nop
     cd4:	00 01       	movw	r0, r0
     cd6:	05 03       	mulsu	r16, r21
     cd8:	4a 04       	cpc	r4, r10
     cda:	80 00       	.word	0x0080	; ????
     cdc:	b6 01       	movw	r22, r12
     cde:	d7 05       	cpc	r29, r7
     ce0:	00 00       	nop
     ce2:	00 00       	nop
     ce4:	14 00       	.word	0x0014	; ????
     ce6:	00 00       	nop
     ce8:	01 05       	cpc	r16, r1
     cea:	03 60       	ori	r16, 0x03	; 3
     cec:	04 80       	ldd	r0, Z+4	; 0x04
     cee:	00 b7       	in	r16, 0x30	; 48
     cf0:	01 db       	rcall	.-2558   	; 0x2f4 <__data_load_end+0x1f2>
     cf2:	05 00       	.word	0x0005	; ????
     cf4:	00 00       	nop
     cf6:	00 14       	cp	r0, r0
     cf8:	00 00       	nop
     cfa:	00 01       	movw	r0, r0
     cfc:	05 03       	mulsu	r16, r21
     cfe:	62 04       	cpc	r6, r2
     d00:	80 00       	.word	0x0080	; ????
     d02:	b8 01       	movw	r22, r16
     d04:	e2 05       	cpc	r30, r2
     d06:	00 00       	nop
     d08:	00 00       	nop
     d0a:	14 00       	.word	0x0014	; ????
     d0c:	00 00       	nop
     d0e:	01 05       	cpc	r16, r1
     d10:	03 61       	ori	r16, 0x13	; 19
     d12:	04 80       	ldd	r0, Z+4	; 0x04
     d14:	00 b9       	out	0x00, r16	; 0
     d16:	01 e9       	ldi	r16, 0x91	; 145
     d18:	05 00       	.word	0x0005	; ????
     d1a:	00 00       	nop
     d1c:	00 14       	cp	r0, r0
     d1e:	00 00       	nop
     d20:	00 01       	movw	r0, r0
     d22:	05 03       	mulsu	r16, r21
     d24:	63 04       	cpc	r6, r3
     d26:	80 00       	.word	0x0080	; ????
     d28:	ba 01       	movw	r22, r20
     d2a:	f0 05       	cpc	r31, r0
     d2c:	00 00       	nop
     d2e:	00 00       	nop
     d30:	14 00       	.word	0x0014	; ????
     d32:	00 00       	nop
     d34:	01 05       	cpc	r16, r1
     d36:	03 68       	ori	r16, 0x83	; 131
     d38:	04 80       	ldd	r0, Z+4	; 0x04
     d3a:	00 bb       	out	0x10, r16	; 16
     d3c:	01 f3       	breq	.-64     	; 0xcfe <__LOCK_REGION_LENGTH__+0x8fe>
     d3e:	05 00       	.word	0x0005	; ????
     d40:	00 00       	nop
     d42:	00 14       	cp	r0, r0
     d44:	00 00       	nop
     d46:	00 01       	movw	r0, r0
     d48:	05 03       	mulsu	r16, r21
     d4a:	69 04       	cpc	r6, r9
     d4c:	80 00       	.word	0x0080	; ????
     d4e:	bc 01       	movw	r22, r24
     d50:	fc 05       	cpc	r31, r12
     d52:	00 00       	nop
     d54:	00 00       	nop
     d56:	14 00       	.word	0x0014	; ????
     d58:	00 00       	nop
     d5a:	01 05       	cpc	r16, r1
     d5c:	03 64       	ori	r16, 0x43	; 67
     d5e:	04 80       	ldd	r0, Z+4	; 0x04
     d60:	00 bd       	out	0x20, r16	; 32
     d62:	01 00       	.word	0x0001	; ????
     d64:	06 00       	.word	0x0006	; ????
     d66:	00 00       	nop
     d68:	00 14       	cp	r0, r0
     d6a:	00 00       	nop
     d6c:	00 01       	movw	r0, r0
     d6e:	05 03       	mulsu	r16, r21
     d70:	66 04       	cpc	r6, r6
     d72:	80 00       	.word	0x0080	; ????
     d74:	be 01       	movw	r22, r28
     d76:	07 06       	cpc	r0, r23
     d78:	00 00       	nop
     d7a:	00 00       	nop
     d7c:	14 00       	.word	0x0014	; ????
     d7e:	00 00       	nop
     d80:	01 05       	cpc	r16, r1
     d82:	03 65       	ori	r16, 0x53	; 83
     d84:	04 80       	ldd	r0, Z+4	; 0x04
     d86:	00 bf       	out	0x30, r16	; 48
     d88:	01 0e       	add	r0, r17
     d8a:	06 00       	.word	0x0006	; ????
     d8c:	00 00       	nop
     d8e:	00 14       	cp	r0, r0
     d90:	00 00       	nop
     d92:	00 01       	movw	r0, r0
     d94:	05 03       	mulsu	r16, r21
     d96:	67 04       	cpc	r6, r7
     d98:	80 00       	.word	0x0080	; ????
     d9a:	c0 01       	movw	r24, r0
     d9c:	15 06       	cpc	r1, r21
     d9e:	00 00       	nop
     da0:	00 00       	nop
     da2:	14 00       	.word	0x0014	; ????
     da4:	00 00       	nop
     da6:	01 05       	cpc	r16, r1
     da8:	03 70       	andi	r16, 0x03	; 3
     daa:	04 80       	ldd	r0, Z+4	; 0x04
     dac:	00 c1       	rjmp	.+512    	; 0xfae <__LOCK_REGION_LENGTH__+0xbae>
     dae:	01 1e       	adc	r0, r17
     db0:	06 00       	.word	0x0006	; ????
     db2:	00 00       	nop
     db4:	00 14       	cp	r0, r0
     db6:	00 00       	nop
     db8:	00 01       	movw	r0, r0
     dba:	05 03       	mulsu	r16, r21
     dbc:	71 04       	cpc	r7, r1
     dbe:	80 00       	.word	0x0080	; ????
     dc0:	c2 01       	movw	r24, r4
     dc2:	27 06       	cpc	r2, r23
     dc4:	00 00       	nop
     dc6:	00 00       	nop
     dc8:	14 00       	.word	0x0014	; ????
     dca:	00 00       	nop
     dcc:	01 05       	cpc	r16, r1
     dce:	03 72       	andi	r16, 0x23	; 35
     dd0:	04 80       	ldd	r0, Z+4	; 0x04
     dd2:	00 c3       	rjmp	.+1536   	; 0x13d4 <__LOCK_REGION_LENGTH__+0xfd4>
     dd4:	01 30       	cpi	r16, 0x01	; 1
     dd6:	06 00       	.word	0x0006	; ????
     dd8:	00 00       	nop
     dda:	00 14       	cp	r0, r0
     ddc:	00 00       	nop
     dde:	00 01       	movw	r0, r0
     de0:	05 03       	mulsu	r16, r21
     de2:	73 04       	cpc	r7, r3
     de4:	80 00       	.word	0x0080	; ????
     de6:	c4 01       	movw	r24, r8
     de8:	39 06       	cpc	r3, r25
     dea:	00 00       	nop
     dec:	00 00       	nop
     dee:	14 00       	.word	0x0014	; ????
     df0:	00 00       	nop
     df2:	01 05       	cpc	r16, r1
     df4:	03 74       	andi	r16, 0x43	; 67
     df6:	04 80       	ldd	r0, Z+4	; 0x04
     df8:	00 c5       	rjmp	.+2560   	; 0x17fa <__LOCK_REGION_LENGTH__+0x13fa>
     dfa:	01 42       	sbci	r16, 0x21	; 33
     dfc:	06 00       	.word	0x0006	; ????
     dfe:	00 00       	nop
     e00:	00 14       	cp	r0, r0
     e02:	00 00       	nop
     e04:	00 01       	movw	r0, r0
     e06:	05 03       	mulsu	r16, r21
     e08:	75 04       	cpc	r7, r5
     e0a:	80 00       	.word	0x0080	; ????
     e0c:	c6 01       	movw	r24, r12
     e0e:	4b 06       	cpc	r4, r27
     e10:	00 00       	nop
     e12:	00 00       	nop
     e14:	14 00       	.word	0x0014	; ????
     e16:	00 00       	nop
     e18:	01 05       	cpc	r16, r1
     e1a:	03 76       	andi	r16, 0x63	; 99
     e1c:	04 80       	ldd	r0, Z+4	; 0x04
     e1e:	00 c7       	rjmp	.+3584   	; 0x1c20 <__DATA_REGION_LENGTH__+0x420>
     e20:	01 54       	subi	r16, 0x41	; 65
     e22:	06 00       	.word	0x0006	; ????
     e24:	00 00       	nop
     e26:	00 14       	cp	r0, r0
     e28:	00 00       	nop
     e2a:	00 01       	movw	r0, r0
     e2c:	05 03       	mulsu	r16, r21
     e2e:	77 04       	cpc	r7, r7
     e30:	80 00       	.word	0x0080	; ????
     e32:	c8 01       	movw	r24, r16
     e34:	5d 06       	cpc	r5, r29
     e36:	00 00       	nop
     e38:	00 00       	nop
     e3a:	14 00       	.word	0x0014	; ????
     e3c:	00 00       	nop
     e3e:	01 05       	cpc	r16, r1
     e40:	03 6a       	ori	r16, 0xA3	; 163
     e42:	04 80       	ldd	r0, Z+4	; 0x04
     e44:	00 c9       	rjmp	.-3584   	; 0x46 <__SREG__+0x7>
     e46:	01 66       	ori	r16, 0x61	; 97
     e48:	06 00       	.word	0x0006	; ????
     e4a:	00 00       	nop
     e4c:	00 14       	cp	r0, r0
     e4e:	00 00       	nop
     e50:	00 01       	movw	r0, r0
     e52:	05 03       	mulsu	r16, r21
     e54:	80 04       	cpc	r8, r0
     e56:	80 00       	.word	0x0080	; ????
     e58:	ca 01       	movw	r24, r20
     e5a:	6a 06       	cpc	r6, r26
     e5c:	00 00       	nop
     e5e:	00 00       	nop
     e60:	14 00       	.word	0x0014	; ????
     e62:	00 00       	nop
     e64:	01 05       	cpc	r16, r1
     e66:	03 82       	std	Z+3, r0	; 0x03
     e68:	04 80       	ldd	r0, Z+4	; 0x04
     e6a:	00 cb       	rjmp	.-2560   	; 0x46c <__LOCK_REGION_LENGTH__+0x6c>
     e6c:	01 71       	andi	r16, 0x11	; 17
     e6e:	06 00       	.word	0x0006	; ????
     e70:	00 00       	nop
     e72:	00 14       	cp	r0, r0
     e74:	00 00       	nop
     e76:	00 01       	movw	r0, r0
     e78:	05 03       	mulsu	r16, r21
     e7a:	81 04       	cpc	r8, r1
     e7c:	80 00       	.word	0x0080	; ????
     e7e:	cc 01       	movw	r24, r24
     e80:	78 06       	cpc	r7, r24
     e82:	00 00       	nop
     e84:	00 00       	nop
     e86:	14 00       	.word	0x0014	; ????
     e88:	00 00       	nop
     e8a:	01 05       	cpc	r16, r1
     e8c:	03 83       	std	Z+3, r16	; 0x03
     e8e:	04 80       	ldd	r0, Z+4	; 0x04
     e90:	00 cd       	rjmp	.-1536   	; 0x892 <__LOCK_REGION_LENGTH__+0x492>
     e92:	01 7f       	andi	r16, 0xF1	; 241
     e94:	06 00       	.word	0x0006	; ????
     e96:	00 00       	nop
     e98:	00 14       	cp	r0, r0
     e9a:	00 00       	nop
     e9c:	00 01       	movw	r0, r0
     e9e:	05 03       	mulsu	r16, r21
     ea0:	88 04       	cpc	r8, r8
     ea2:	80 00       	.word	0x0080	; ????
     ea4:	ce 01       	movw	r24, r28
     ea6:	82 06       	cpc	r8, r18
     ea8:	00 00       	nop
     eaa:	00 00       	nop
     eac:	14 00       	.word	0x0014	; ????
     eae:	00 00       	nop
     eb0:	01 05       	cpc	r16, r1
     eb2:	03 89       	ldd	r16, Z+19	; 0x13
     eb4:	04 80       	ldd	r0, Z+4	; 0x04
     eb6:	00 cf       	rjmp	.-512    	; 0xcb8 <__LOCK_REGION_LENGTH__+0x8b8>
     eb8:	01 8b       	std	Z+17, r16	; 0x11
     eba:	06 00       	.word	0x0006	; ????
     ebc:	00 00       	nop
     ebe:	00 14       	cp	r0, r0
     ec0:	00 00       	nop
     ec2:	00 01       	movw	r0, r0
     ec4:	05 03       	mulsu	r16, r21
     ec6:	84 04       	cpc	r8, r4
     ec8:	80 00       	.word	0x0080	; ????
     eca:	d0 01       	movw	r26, r0
     ecc:	8f 06       	cpc	r8, r31
     ece:	00 00       	nop
     ed0:	00 00       	nop
     ed2:	14 00       	.word	0x0014	; ????
     ed4:	00 00       	nop
     ed6:	01 05       	cpc	r16, r1
     ed8:	03 86       	std	Z+11, r0	; 0x0b
     eda:	04 80       	ldd	r0, Z+4	; 0x04
     edc:	00 d1       	rcall	.+512    	; 0x10de <__LOCK_REGION_LENGTH__+0xcde>
     ede:	01 96       	adiw	r24, 0x01	; 1
     ee0:	06 00       	.word	0x0006	; ????
     ee2:	00 00       	nop
     ee4:	00 14       	cp	r0, r0
     ee6:	00 00       	nop
     ee8:	00 01       	movw	r0, r0
     eea:	05 03       	mulsu	r16, r21
     eec:	85 04       	cpc	r8, r5
     eee:	80 00       	.word	0x0080	; ????
     ef0:	d2 01       	movw	r26, r4
     ef2:	9d 06       	cpc	r9, r29
     ef4:	00 00       	nop
     ef6:	00 00       	nop
     ef8:	14 00       	.word	0x0014	; ????
     efa:	00 00       	nop
     efc:	01 05       	cpc	r16, r1
     efe:	03 87       	std	Z+11, r16	; 0x0b
     f00:	04 80       	ldd	r0, Z+4	; 0x04
     f02:	00 d3       	rcall	.+1536   	; 0x1504 <__LOCK_REGION_LENGTH__+0x1104>
     f04:	01 a4       	ldd	r0, Z+41	; 0x29
     f06:	06 00       	.word	0x0006	; ????
     f08:	00 00       	nop
     f0a:	00 14       	cp	r0, r0
     f0c:	00 00       	nop
     f0e:	00 01       	movw	r0, r0
     f10:	05 03       	mulsu	r16, r21
     f12:	90 04       	cpc	r9, r0
     f14:	80 00       	.word	0x0080	; ????
     f16:	d4 01       	movw	r26, r8
     f18:	ad 06       	cpc	r10, r29
     f1a:	00 00       	nop
     f1c:	00 00       	nop
     f1e:	14 00       	.word	0x0014	; ????
     f20:	00 00       	nop
     f22:	01 05       	cpc	r16, r1
     f24:	03 91       	.word	0x9103	; ????
     f26:	04 80       	ldd	r0, Z+4	; 0x04
     f28:	00 d5       	rcall	.+2560   	; 0x192a <__DATA_REGION_LENGTH__+0x12a>
     f2a:	01 b6       	in	r0, 0x31	; 49
     f2c:	06 00       	.word	0x0006	; ????
     f2e:	00 00       	nop
     f30:	00 14       	cp	r0, r0
     f32:	00 00       	nop
     f34:	00 01       	movw	r0, r0
     f36:	05 03       	mulsu	r16, r21
     f38:	92 04       	cpc	r9, r2
     f3a:	80 00       	.word	0x0080	; ????
     f3c:	d6 01       	movw	r26, r12
     f3e:	bf 06       	cpc	r11, r31
     f40:	00 00       	nop
     f42:	00 00       	nop
     f44:	14 00       	.word	0x0014	; ????
     f46:	00 00       	nop
     f48:	01 05       	cpc	r16, r1
     f4a:	03 93       	.word	0x9303	; ????
     f4c:	04 80       	ldd	r0, Z+4	; 0x04
     f4e:	00 d7       	rcall	.+3584   	; 0x1d50 <__DATA_REGION_LENGTH__+0x550>
     f50:	01 c8       	rjmp	.-4094   	; 0xffffff54 <__eeprom_end+0xff7eff54>
     f52:	06 00       	.word	0x0006	; ????
     f54:	00 00       	nop
     f56:	00 14       	cp	r0, r0
     f58:	00 00       	nop
     f5a:	00 01       	movw	r0, r0
     f5c:	05 03       	mulsu	r16, r21
     f5e:	94 04       	cpc	r9, r4
     f60:	80 00       	.word	0x0080	; ????
     f62:	d8 01       	movw	r26, r16
     f64:	d1 06       	cpc	r13, r17
     f66:	00 00       	nop
     f68:	00 00       	nop
     f6a:	14 00       	.word	0x0014	; ????
     f6c:	00 00       	nop
     f6e:	01 05       	cpc	r16, r1
     f70:	03 95       	inc	r16
     f72:	04 80       	ldd	r0, Z+4	; 0x04
     f74:	00 d9       	rcall	.-3584   	; 0x176 <__data_load_end+0x74>
     f76:	01 da       	rcall	.-3070   	; 0x37a <__data_load_end+0x278>
     f78:	06 00       	.word	0x0006	; ????
     f7a:	00 00       	nop
     f7c:	00 14       	cp	r0, r0
     f7e:	00 00       	nop
     f80:	00 01       	movw	r0, r0
     f82:	05 03       	mulsu	r16, r21
     f84:	96 04       	cpc	r9, r6
     f86:	80 00       	.word	0x0080	; ????
     f88:	da 01       	movw	r26, r20
     f8a:	e3 06       	cpc	r14, r19
     f8c:	00 00       	nop
     f8e:	00 00       	nop
     f90:	14 00       	.word	0x0014	; ????
     f92:	00 00       	nop
     f94:	01 05       	cpc	r16, r1
     f96:	03 97       	sbiw	r24, 0x03	; 3
     f98:	04 80       	ldd	r0, Z+4	; 0x04
     f9a:	00 db       	rcall	.-2560   	; 0x59c <__LOCK_REGION_LENGTH__+0x19c>
     f9c:	01 ec       	ldi	r16, 0xC1	; 193
     f9e:	06 00       	.word	0x0006	; ????
     fa0:	00 00       	nop
     fa2:	00 14       	cp	r0, r0
     fa4:	00 00       	nop
     fa6:	00 01       	movw	r0, r0
     fa8:	05 03       	mulsu	r16, r21
     faa:	8a 04       	cpc	r8, r10
     fac:	80 00       	.word	0x0080	; ????
     fae:	dc 01       	movw	r26, r24
     fb0:	f5 06       	cpc	r15, r21
     fb2:	00 00       	nop
     fb4:	00 00       	nop
     fb6:	14 00       	.word	0x0014	; ????
     fb8:	00 00       	nop
     fba:	01 05       	cpc	r16, r1
     fbc:	03 a0       	ldd	r0, Z+35	; 0x23
     fbe:	04 80       	ldd	r0, Z+4	; 0x04
     fc0:	00 dd       	rcall	.-1536   	; 0x9c2 <__LOCK_REGION_LENGTH__+0x5c2>
     fc2:	01 f9       	bld	r16, 1
     fc4:	06 00       	.word	0x0006	; ????
     fc6:	00 00       	nop
     fc8:	00 14       	cp	r0, r0
     fca:	00 00       	nop
     fcc:	00 01       	movw	r0, r0
     fce:	05 03       	mulsu	r16, r21
     fd0:	a2 04       	cpc	r10, r2
     fd2:	80 00       	.word	0x0080	; ????
     fd4:	de 01       	movw	r26, r28
     fd6:	00 07       	cpc	r16, r16
     fd8:	00 00       	nop
     fda:	00 00       	nop
     fdc:	14 00       	.word	0x0014	; ????
     fde:	00 00       	nop
     fe0:	01 05       	cpc	r16, r1
     fe2:	03 a1       	ldd	r16, Z+35	; 0x23
     fe4:	04 80       	ldd	r0, Z+4	; 0x04
     fe6:	00 df       	rcall	.-512    	; 0xde8 <__LOCK_REGION_LENGTH__+0x9e8>
     fe8:	01 07       	cpc	r16, r17
     fea:	07 00       	.word	0x0007	; ????
     fec:	00 00       	nop
     fee:	00 14       	cp	r0, r0
     ff0:	00 00       	nop
     ff2:	00 01       	movw	r0, r0
     ff4:	05 03       	mulsu	r16, r21
     ff6:	a3 04       	cpc	r10, r3
     ff8:	80 00       	.word	0x0080	; ????
     ffa:	e0 01       	movw	r28, r0
     ffc:	0e 07       	cpc	r16, r30
     ffe:	00 00       	nop
    1000:	00 00       	nop
    1002:	14 00       	.word	0x0014	; ????
    1004:	00 00       	nop
    1006:	01 05       	cpc	r16, r1
    1008:	03 a8       	ldd	r0, Z+51	; 0x33
    100a:	04 80       	ldd	r0, Z+4	; 0x04
    100c:	00 e1       	ldi	r16, 0x10	; 16
    100e:	01 11       	cpse	r16, r1
    1010:	07 00       	.word	0x0007	; ????
    1012:	00 00       	nop
    1014:	00 14       	cp	r0, r0
    1016:	00 00       	nop
    1018:	00 01       	movw	r0, r0
    101a:	05 03       	mulsu	r16, r21
    101c:	a9 04       	cpc	r10, r9
    101e:	80 00       	.word	0x0080	; ????
    1020:	e2 01       	movw	r28, r4
    1022:	1a 07       	cpc	r17, r26
    1024:	00 00       	nop
    1026:	00 00       	nop
    1028:	14 00       	.word	0x0014	; ????
    102a:	00 00       	nop
    102c:	01 05       	cpc	r16, r1
    102e:	03 a4       	ldd	r0, Z+43	; 0x2b
    1030:	04 80       	ldd	r0, Z+4	; 0x04
    1032:	00 e3       	ldi	r16, 0x30	; 48
    1034:	01 1e       	adc	r0, r17
    1036:	07 00       	.word	0x0007	; ????
    1038:	00 00       	nop
    103a:	00 14       	cp	r0, r0
    103c:	00 00       	nop
    103e:	00 01       	movw	r0, r0
    1040:	05 03       	mulsu	r16, r21
    1042:	a6 04       	cpc	r10, r6
    1044:	80 00       	.word	0x0080	; ????
    1046:	e4 01       	movw	r28, r8
    1048:	25 07       	cpc	r18, r21
    104a:	00 00       	nop
    104c:	00 00       	nop
    104e:	14 00       	.word	0x0014	; ????
    1050:	00 00       	nop
    1052:	01 05       	cpc	r16, r1
    1054:	03 a5       	ldd	r16, Z+43	; 0x2b
    1056:	04 80       	ldd	r0, Z+4	; 0x04
    1058:	00 e5       	ldi	r16, 0x50	; 80
    105a:	01 2c       	mov	r0, r1
    105c:	07 00       	.word	0x0007	; ????
    105e:	00 00       	nop
    1060:	00 14       	cp	r0, r0
    1062:	00 00       	nop
    1064:	00 01       	movw	r0, r0
    1066:	05 03       	mulsu	r16, r21
    1068:	a7 04       	cpc	r10, r7
    106a:	80 00       	.word	0x0080	; ????
    106c:	e6 01       	movw	r28, r12
    106e:	33 07       	cpc	r19, r19
    1070:	00 00       	nop
    1072:	00 00       	nop
    1074:	14 00       	.word	0x0014	; ????
    1076:	00 00       	nop
    1078:	01 05       	cpc	r16, r1
    107a:	03 b0       	in	r0, 0x03	; 3
    107c:	04 80       	ldd	r0, Z+4	; 0x04
    107e:	00 e7       	ldi	r16, 0x70	; 112
    1080:	01 3c       	cpi	r16, 0xC1	; 193
    1082:	07 00       	.word	0x0007	; ????
    1084:	00 00       	nop
    1086:	00 14       	cp	r0, r0
    1088:	00 00       	nop
    108a:	00 01       	movw	r0, r0
    108c:	05 03       	mulsu	r16, r21
    108e:	b1 04       	cpc	r11, r1
    1090:	80 00       	.word	0x0080	; ????
    1092:	e8 01       	movw	r28, r16
    1094:	45 07       	cpc	r20, r21
    1096:	00 00       	nop
    1098:	00 00       	nop
    109a:	14 00       	.word	0x0014	; ????
    109c:	00 00       	nop
    109e:	01 05       	cpc	r16, r1
    10a0:	03 b2       	in	r0, 0x13	; 19
    10a2:	04 80       	ldd	r0, Z+4	; 0x04
    10a4:	00 e9       	ldi	r16, 0x90	; 144
    10a6:	01 4e       	sbci	r16, 0xE1	; 225
    10a8:	07 00       	.word	0x0007	; ????
    10aa:	00 00       	nop
    10ac:	00 14       	cp	r0, r0
    10ae:	00 00       	nop
    10b0:	00 01       	movw	r0, r0
    10b2:	05 03       	mulsu	r16, r21
    10b4:	b3 04       	cpc	r11, r3
    10b6:	80 00       	.word	0x0080	; ????
    10b8:	ea 01       	movw	r28, r20
    10ba:	57 07       	cpc	r21, r23
    10bc:	00 00       	nop
    10be:	00 00       	nop
    10c0:	14 00       	.word	0x0014	; ????
    10c2:	00 00       	nop
    10c4:	01 05       	cpc	r16, r1
    10c6:	03 b4       	in	r0, 0x23	; 35
    10c8:	04 80       	ldd	r0, Z+4	; 0x04
    10ca:	00 eb       	ldi	r16, 0xB0	; 176
    10cc:	01 60       	ori	r16, 0x01	; 1
    10ce:	07 00       	.word	0x0007	; ????
    10d0:	00 00       	nop
    10d2:	00 14       	cp	r0, r0
    10d4:	00 00       	nop
    10d6:	00 01       	movw	r0, r0
    10d8:	05 03       	mulsu	r16, r21
    10da:	b5 04       	cpc	r11, r5
    10dc:	80 00       	.word	0x0080	; ????
    10de:	ec 01       	movw	r28, r24
    10e0:	69 07       	cpc	r22, r25
    10e2:	00 00       	nop
    10e4:	00 00       	nop
    10e6:	14 00       	.word	0x0014	; ????
    10e8:	00 00       	nop
    10ea:	01 05       	cpc	r16, r1
    10ec:	03 b6       	in	r0, 0x33	; 51
    10ee:	04 80       	ldd	r0, Z+4	; 0x04
    10f0:	00 ed       	ldi	r16, 0xD0	; 208
    10f2:	01 72       	andi	r16, 0x21	; 33
    10f4:	07 00       	.word	0x0007	; ????
    10f6:	00 00       	nop
    10f8:	00 14       	cp	r0, r0
    10fa:	00 00       	nop
    10fc:	00 01       	movw	r0, r0
    10fe:	05 03       	mulsu	r16, r21
    1100:	b7 04       	cpc	r11, r7
    1102:	80 00       	.word	0x0080	; ????
    1104:	ee 01       	movw	r28, r28
    1106:	7b 07       	cpc	r23, r27
    1108:	00 00       	nop
    110a:	00 00       	nop
    110c:	14 00       	.word	0x0014	; ????
    110e:	00 00       	nop
    1110:	01 05       	cpc	r16, r1
    1112:	03 aa       	std	Z+51, r0	; 0x33
    1114:	04 80       	ldd	r0, Z+4	; 0x04
    1116:	00 ef       	ldi	r16, 0xF0	; 240
    1118:	01 84       	ldd	r0, Z+9	; 0x09
    111a:	07 00       	.word	0x0007	; ????
    111c:	00 00       	nop
    111e:	00 14       	cp	r0, r0
    1120:	00 00       	nop
    1122:	00 01       	movw	r0, r0
    1124:	05 03       	mulsu	r16, r21
    1126:	e1 05       	cpc	r30, r1
    1128:	80 00       	.word	0x0080	; ????
    112a:	f0 01       	movw	r30, r0
    112c:	8e 07       	cpc	r24, r30
    112e:	00 00       	nop
    1130:	00 00       	nop
    1132:	14 00       	.word	0x0014	; ????
    1134:	00 00       	nop
    1136:	01 05       	cpc	r16, r1
    1138:	03 e0       	ldi	r16, 0x03	; 3
    113a:	05 80       	ldd	r0, Z+5	; 0x05
    113c:	00 f1       	brcs	.+64     	; 0x117e <__LOCK_REGION_LENGTH__+0xd7e>
    113e:	01 9a       	sbi	0x00, 1	; 0
    1140:	07 00       	.word	0x0007	; ????
    1142:	00 00       	nop
    1144:	00 14       	cp	r0, r0
    1146:	00 00       	nop
    1148:	00 01       	movw	r0, r0
    114a:	05 03       	mulsu	r16, r21
    114c:	e4 05       	cpc	r30, r4
    114e:	80 00       	.word	0x0080	; ????
    1150:	f2 01       	movw	r30, r4
    1152:	a4 07       	cpc	r26, r20
    1154:	00 00       	nop
    1156:	00 00       	nop
    1158:	14 00       	.word	0x0014	; ????
    115a:	00 00       	nop
    115c:	01 05       	cpc	r16, r1
    115e:	03 e5       	ldi	r16, 0x53	; 83
    1160:	05 80       	ldd	r0, Z+5	; 0x05
    1162:	00 f3       	brcs	.-64     	; 0x1124 <__LOCK_REGION_LENGTH__+0xd24>
    1164:	01 ae       	std	Z+57, r0	; 0x39
    1166:	07 00       	.word	0x0007	; ????
    1168:	00 00       	nop
    116a:	00 14       	cp	r0, r0
    116c:	00 00       	nop
    116e:	00 01       	movw	r0, r0
    1170:	05 03       	mulsu	r16, r21
    1172:	e3 05       	cpc	r30, r3
    1174:	80 00       	.word	0x0080	; ????
    1176:	f4 01       	movw	r30, r8
    1178:	bb 07       	cpc	r27, r27
    117a:	00 00       	nop
    117c:	00 00       	nop
    117e:	14 00       	.word	0x0014	; ????
    1180:	00 00       	nop
    1182:	01 05       	cpc	r16, r1
    1184:	03 e2       	ldi	r16, 0x23	; 35
    1186:	05 80       	ldd	r0, Z+5	; 0x05
    1188:	00 f5       	brcc	.+64     	; 0x11ca <__LOCK_REGION_LENGTH__+0xdca>
    118a:	01 c7       	rjmp	.+3586   	; 0x1f8e <__DATA_REGION_LENGTH__+0x78e>
    118c:	07 00       	.word	0x0007	; ????
    118e:	00 00       	nop
    1190:	00 14       	cp	r0, r0
    1192:	00 00       	nop
    1194:	00 01       	movw	r0, r0
    1196:	05 03       	mulsu	r16, r21
    1198:	40 00       	.word	0x0040	; ????
    119a:	80 00       	.word	0x0080	; ????
    119c:	f6 01       	movw	r30, r12
    119e:	cd 07       	cpc	r28, r29
    11a0:	00 00       	nop
    11a2:	00 00       	nop
    11a4:	14 00       	.word	0x0014	; ????
    11a6:	00 00       	nop
    11a8:	01 05       	cpc	r16, r1
    11aa:	03 41       	sbci	r16, 0x13	; 19
    11ac:	00 80       	ld	r0, Z
    11ae:	00 f7       	brcc	.-64     	; 0x1170 <__LOCK_REGION_LENGTH__+0xd70>
    11b0:	01 d2       	rcall	.+1026   	; 0x15b4 <__LOCK_REGION_LENGTH__+0x11b4>
    11b2:	07 00       	.word	0x0007	; ????
    11b4:	00 00       	nop
    11b6:	00 14       	cp	r0, r0
    11b8:	00 00       	nop
    11ba:	00 01       	movw	r0, r0
    11bc:	05 03       	mulsu	r16, r21
    11be:	46 01       	movw	r8, r12
    11c0:	80 00       	.word	0x0080	; ????
    11c2:	f8 01       	movw	r30, r16
    11c4:	d8 07       	cpc	r29, r24
    11c6:	00 00       	nop
    11c8:	00 00       	nop
    11ca:	14 00       	.word	0x0014	; ????
    11cc:	00 00       	nop
    11ce:	01 05       	cpc	r16, r1
    11d0:	03 47       	sbci	r16, 0x73	; 115
    11d2:	01 80       	ldd	r0, Z+1	; 0x01
    11d4:	00 f9       	bld	r16, 0
    11d6:	01 df       	rcall	.-510    	; 0xfda <__LOCK_REGION_LENGTH__+0xbda>
    11d8:	07 00       	.word	0x0007	; ????
    11da:	00 00       	nop
    11dc:	00 1b       	sub	r16, r16
    11de:	00 00       	nop
    11e0:	00 01       	movw	r0, r0
    11e2:	05 03       	mulsu	r16, r21
    11e4:	4c 01       	movw	r8, r24
    11e6:	80 00       	.word	0x0080	; ????
    11e8:	fa 01       	movw	r30, r20
    11ea:	e3 07       	cpc	r30, r19
    11ec:	00 00       	nop
    11ee:	00 00       	nop
    11f0:	1b 00       	.word	0x001b	; ????
    11f2:	00 00       	nop
    11f4:	01 05       	cpc	r16, r1
    11f6:	03 48       	sbci	r16, 0x83	; 131
    11f8:	01 80       	ldd	r0, Z+1	; 0x01
    11fa:	00 fb       	bst	r16, 0
    11fc:	01 e7       	ldi	r16, 0x71	; 113
    11fe:	07 00       	.word	0x0007	; ????
    1200:	00 00       	nop
    1202:	00 14       	cp	r0, r0
    1204:	00 00       	nop
    1206:	00 01       	movw	r0, r0
    1208:	05 03       	mulsu	r16, r21
    120a:	40 01       	movw	r8, r0
    120c:	80 00       	.word	0x0080	; ????
    120e:	fc 01       	movw	r30, r24
    1210:	ed 07       	cpc	r30, r29
    1212:	00 00       	nop
    1214:	00 00       	nop
    1216:	14 00       	.word	0x0014	; ????
    1218:	00 00       	nop
    121a:	01 05       	cpc	r16, r1
    121c:	03 45       	sbci	r16, 0x53	; 83
    121e:	01 80       	ldd	r0, Z+1	; 0x01
    1220:	00 fd       	sbrc	r16, 0
    1222:	01 f5       	brne	.+64     	; 0x1264 <__LOCK_REGION_LENGTH__+0xe64>
    1224:	07 00       	.word	0x0007	; ????
    1226:	00 00       	nop
    1228:	00 14       	cp	r0, r0
    122a:	00 00       	nop
    122c:	00 01       	movw	r0, r0
    122e:	05 03       	mulsu	r16, r21
    1230:	42 01       	movw	r8, r4
    1232:	80 00       	.word	0x0080	; ????
    1234:	fe 01       	movw	r30, r28
    1236:	fd 07       	cpc	r31, r29
    1238:	00 00       	nop
    123a:	00 00       	nop
    123c:	14 00       	.word	0x0014	; ????
    123e:	00 00       	nop
    1240:	01 05       	cpc	r16, r1
    1242:	03 43       	sbci	r16, 0x33	; 51
    1244:	01 80       	ldd	r0, Z+1	; 0x01
    1246:	00 ff       	sbrs	r16, 0
    1248:	01 06       	cpc	r0, r17
    124a:	08 00       	.word	0x0008	; ????
    124c:	00 00       	nop
    124e:	00 1b       	sub	r16, r16
    1250:	00 00       	nop
    1252:	00 01       	movw	r0, r0
    1254:	05 03       	mulsu	r16, r21
    1256:	4a 01       	movw	r8, r20
    1258:	80 00       	.word	0x0080	; ????
    125a:	80 02       	muls	r24, r16
    125c:	0a 08       	sbc	r0, r10
    125e:	00 00       	nop
    1260:	00 00       	nop
    1262:	14 00       	.word	0x0014	; ????
    1264:	00 00       	nop
    1266:	01 05       	cpc	r16, r1
    1268:	03 50       	subi	r16, 0x03	; 3
    126a:	01 80       	ldd	r0, Z+1	; 0x01
    126c:	00 81       	ld	r16, Z
    126e:	02 13       	cpse	r16, r18
    1270:	08 00       	.word	0x0008	; ????
    1272:	00 00       	nop
    1274:	00 14       	cp	r0, r0
    1276:	00 00       	nop
    1278:	00 01       	movw	r0, r0
    127a:	05 03       	mulsu	r16, r21
    127c:	55 01       	movw	r10, r10
    127e:	80 00       	.word	0x0080	; ????
    1280:	82 02       	muls	r24, r18
    1282:	1e 08       	sbc	r1, r14
    1284:	00 00       	nop
    1286:	00 00       	nop
    1288:	14 00       	.word	0x0014	; ????
    128a:	00 00       	nop
    128c:	01 05       	cpc	r16, r1
    128e:	03 52       	subi	r16, 0x23	; 35
    1290:	01 80       	ldd	r0, Z+1	; 0x01
    1292:	00 83       	st	Z, r16
    1294:	02 29       	or	r16, r2
    1296:	08 00       	.word	0x0008	; ????
    1298:	00 00       	nop
    129a:	00 14       	cp	r0, r0
    129c:	00 00       	nop
    129e:	00 01       	movw	r0, r0
    12a0:	05 03       	mulsu	r16, r21
    12a2:	53 01       	movw	r10, r6
    12a4:	80 00       	.word	0x0080	; ????
    12a6:	84 02       	muls	r24, r20
    12a8:	35 08       	sbc	r3, r5
    12aa:	00 00       	nop
    12ac:	00 00       	nop
    12ae:	14 00       	.word	0x0014	; ????
    12b0:	00 00       	nop
    12b2:	01 05       	cpc	r16, r1
    12b4:	03 51       	subi	r16, 0x13	; 19
    12b6:	01 80       	ldd	r0, Z+1	; 0x01
    12b8:	00 85       	ldd	r16, Z+8	; 0x08
    12ba:	02 3f       	cpi	r16, 0xF2	; 242
    12bc:	08 00       	.word	0x0008	; ????
    12be:	00 00       	nop
    12c0:	00 14       	cp	r0, r0
    12c2:	00 00       	nop
    12c4:	00 01       	movw	r0, r0
    12c6:	05 03       	mulsu	r16, r21
    12c8:	41 01       	movw	r8, r2
    12ca:	80 00       	.word	0x0080	; ????
    12cc:	86 02       	muls	r24, r22
    12ce:	46 08       	sbc	r4, r6
    12d0:	00 00       	nop
    12d2:	00 00       	nop
    12d4:	14 00       	.word	0x0014	; ????
    12d6:	00 00       	nop
    12d8:	01 05       	cpc	r16, r1
    12da:	03 44       	sbci	r16, 0x43	; 67
    12dc:	01 80       	ldd	r0, Z+1	; 0x01
    12de:	00 87       	std	Z+8, r16	; 0x08
    12e0:	02 4b       	sbci	r16, 0xB2	; 178
    12e2:	08 00       	.word	0x0008	; ????
    12e4:	00 00       	nop
    12e6:	00 14       	cp	r0, r0
    12e8:	00 00       	nop
    12ea:	00 01       	movw	r0, r0
    12ec:	05 03       	mulsu	r16, r21
    12ee:	2f 11       	cpse	r18, r15
    12f0:	80 00       	.word	0x0080	; ????
    12f2:	88 02       	muls	r24, r24
    12f4:	55 08       	sbc	r5, r5
    12f6:	00 00       	nop
    12f8:	00 00       	nop
    12fa:	14 00       	.word	0x0014	; ????
    12fc:	00 00       	nop
    12fe:	01 05       	cpc	r16, r1
    1300:	03 00       	.word	0x0003	; ????
    1302:	11 80       	ldd	r1, Z+1	; 0x01
    1304:	00 89       	ldd	r16, Z+16	; 0x10
    1306:	02 5f       	subi	r16, 0xF2	; 242
    1308:	08 00       	.word	0x0008	; ????
    130a:	00 00       	nop
    130c:	00 14       	cp	r0, r0
    130e:	00 00       	nop
    1310:	00 01       	movw	r0, r0
    1312:	05 03       	mulsu	r16, r21
    1314:	01 11       	cpse	r16, r1
    1316:	80 00       	.word	0x0080	; ????
    1318:	8a 02       	muls	r24, r26
    131a:	69 08       	sbc	r6, r9
    131c:	00 00       	nop
    131e:	00 00       	nop
    1320:	14 00       	.word	0x0014	; ????
    1322:	00 00       	nop
    1324:	01 05       	cpc	r16, r1
    1326:	03 02       	muls	r16, r19
    1328:	11 80       	ldd	r1, Z+1	; 0x01
    132a:	00 8b       	std	Z+16, r16	; 0x10
    132c:	02 73       	andi	r16, 0x32	; 50
    132e:	08 00       	.word	0x0008	; ????
    1330:	00 00       	nop
    1332:	00 14       	cp	r0, r0
    1334:	00 00       	nop
    1336:	00 01       	movw	r0, r0
    1338:	05 03       	mulsu	r16, r21
    133a:	18 11       	cpse	r17, r8
    133c:	80 00       	.word	0x0080	; ????
    133e:	8c 02       	muls	r24, r28
    1340:	7e 08       	sbc	r7, r14
    1342:	00 00       	nop
    1344:	00 00       	nop
    1346:	14 00       	.word	0x0014	; ????
    1348:	00 00       	nop
    134a:	01 05       	cpc	r16, r1
    134c:	03 19       	sub	r16, r3
    134e:	11 80       	ldd	r1, Z+1	; 0x01
    1350:	00 8d       	ldd	r16, Z+24	; 0x18
    1352:	02 89       	ldd	r16, Z+18	; 0x12
    1354:	08 00       	.word	0x0008	; ????
    1356:	00 00       	nop
    1358:	00 14       	cp	r0, r0
    135a:	00 00       	nop
    135c:	00 01       	movw	r0, r0
    135e:	05 03       	mulsu	r16, r21
    1360:	1a 11       	cpse	r17, r10
    1362:	80 00       	.word	0x0080	; ????
    1364:	8e 02       	muls	r24, r30
    1366:	94 08       	sbc	r9, r4
    1368:	00 00       	nop
    136a:	00 00       	nop
    136c:	14 00       	.word	0x0014	; ????
    136e:	00 00       	nop
    1370:	01 05       	cpc	r16, r1
    1372:	03 1b       	sub	r16, r19
    1374:	11 80       	ldd	r1, Z+1	; 0x01
    1376:	00 8f       	std	Z+24, r16	; 0x18
    1378:	02 9f       	mul	r16, r18
    137a:	08 00       	.word	0x0008	; ????
    137c:	00 00       	nop
    137e:	00 14       	cp	r0, r0
    1380:	00 00       	nop
    1382:	00 01       	movw	r0, r0
    1384:	05 03       	mulsu	r16, r21
    1386:	14 11       	cpse	r17, r4
    1388:	80 00       	.word	0x0080	; ????
    138a:	90 02       	muls	r25, r16
    138c:	a9 08       	sbc	r10, r9
    138e:	00 00       	nop
    1390:	00 00       	nop
    1392:	14 00       	.word	0x0014	; ????
    1394:	00 00       	nop
    1396:	01 05       	cpc	r16, r1
    1398:	03 22       	and	r0, r19
    139a:	11 80       	ldd	r1, Z+1	; 0x01
    139c:	00 91 02 b4 	lds	r16, 0xB402	; 0x80b402 <__DATA_REGION_ORIGIN__+0x8c02>
    13a0:	08 00       	.word	0x0008	; ????
    13a2:	00 00       	nop
    13a4:	00 14       	cp	r0, r0
    13a6:	00 00       	nop
    13a8:	00 01       	movw	r0, r0
    13aa:	05 03       	mulsu	r16, r21
    13ac:	23 11       	cpse	r18, r3
    13ae:	80 00       	.word	0x0080	; ????
    13b0:	92 02       	muls	r25, r18
    13b2:	bf 08       	sbc	r11, r15
    13b4:	00 00       	nop
    13b6:	00 00       	nop
    13b8:	14 00       	.word	0x0014	; ????
    13ba:	00 00       	nop
    13bc:	01 05       	cpc	r16, r1
    13be:	03 24       	eor	r0, r3
    13c0:	11 80       	ldd	r1, Z+1	; 0x01
    13c2:	00 93 02 ca 	sts	0xCA02, r16	; 0x80ca02 <__DATA_REGION_ORIGIN__+0xa202>
    13c6:	08 00       	.word	0x0008	; ????
    13c8:	00 00       	nop
    13ca:	00 14       	cp	r0, r0
    13cc:	00 00       	nop
    13ce:	00 01       	movw	r0, r0
    13d0:	05 03       	mulsu	r16, r21
    13d2:	25 11       	cpse	r18, r5
    13d4:	80 00       	.word	0x0080	; ????
    13d6:	94 02       	muls	r25, r20
    13d8:	d5 08       	sbc	r13, r5
    13da:	00 00       	nop
    13dc:	00 00       	nop
    13de:	14 00       	.word	0x0014	; ????
    13e0:	00 00       	nop
    13e2:	01 05       	cpc	r16, r1
    13e4:	03 03       	mulsu	r16, r19
    13e6:	11 80       	ldd	r1, Z+1	; 0x01
    13e8:	00 95       	com	r16
    13ea:	02 dd       	rcall	.-1532   	; 0xdf0 <__LOCK_REGION_LENGTH__+0x9f0>
    13ec:	08 00       	.word	0x0008	; ????
    13ee:	00 00       	nop
    13f0:	00 14       	cp	r0, r0
    13f2:	00 00       	nop
    13f4:	00 01       	movw	r0, r0
    13f6:	05 03       	mulsu	r16, r21
    13f8:	04 11       	cpse	r16, r4
    13fa:	80 00       	.word	0x0080	; ????
    13fc:	96 02       	muls	r25, r22
    13fe:	e5 08       	sbc	r14, r5
    1400:	00 00       	nop
    1402:	00 00       	nop
    1404:	14 00       	.word	0x0014	; ????
    1406:	00 00       	nop
    1408:	01 05       	cpc	r16, r1
    140a:	03 05       	cpc	r16, r3
    140c:	11 80       	ldd	r1, Z+1	; 0x01
    140e:	00 97       	sbiw	r24, 0x00	; 0
    1410:	02 ed       	ldi	r16, 0xD2	; 210
    1412:	08 00       	.word	0x0008	; ????
    1414:	00 00       	nop
    1416:	00 14       	cp	r0, r0
    1418:	00 00       	nop
    141a:	00 01       	movw	r0, r0
    141c:	05 03       	mulsu	r16, r21
    141e:	06 11       	cpse	r16, r6
    1420:	80 00       	.word	0x0080	; ????
    1422:	98 02       	muls	r25, r24
    1424:	f5 08       	sbc	r15, r5
    1426:	00 00       	nop
    1428:	00 00       	nop
    142a:	14 00       	.word	0x0014	; ????
    142c:	00 00       	nop
    142e:	01 05       	cpc	r16, r1
    1430:	03 07       	cpc	r16, r19
    1432:	11 80       	ldd	r1, Z+1	; 0x01
    1434:	00 99       	sbic	0x00, 0	; 0
    1436:	02 fd       	sbrc	r16, 2
    1438:	08 00       	.word	0x0008	; ????
    143a:	00 00       	nop
    143c:	00 14       	cp	r0, r0
    143e:	00 00       	nop
    1440:	00 01       	movw	r0, r0
    1442:	05 03       	mulsu	r16, r21
    1444:	08 11       	cpse	r16, r8
    1446:	80 00       	.word	0x0080	; ????
    1448:	9a 02       	muls	r25, r26
    144a:	05 09       	sbc	r16, r5
    144c:	00 00       	nop
    144e:	00 00       	nop
    1450:	14 00       	.word	0x0014	; ????
    1452:	00 00       	nop
    1454:	01 05       	cpc	r16, r1
    1456:	03 09       	sbc	r16, r3
    1458:	11 80       	ldd	r1, Z+1	; 0x01
    145a:	00 9b       	sbis	0x00, 0	; 0
    145c:	02 0d       	add	r16, r2
    145e:	09 00       	.word	0x0009	; ????
    1460:	00 00       	nop
    1462:	00 14       	cp	r0, r0
    1464:	00 00       	nop
    1466:	00 01       	movw	r0, r0
    1468:	05 03       	mulsu	r16, r21
    146a:	0a 11       	cpse	r16, r10
    146c:	80 00       	.word	0x0080	; ????
    146e:	9c 02       	muls	r25, r28
    1470:	15 09       	sbc	r17, r5
    1472:	00 00       	nop
    1474:	00 00       	nop
    1476:	14 00       	.word	0x0014	; ????
    1478:	00 00       	nop
    147a:	01 05       	cpc	r16, r1
    147c:	03 0b       	sbc	r16, r19
    147e:	11 80       	ldd	r1, Z+1	; 0x01
    1480:	00 9d       	mul	r16, r0
    1482:	02 1d       	adc	r16, r2
    1484:	09 00       	.word	0x0009	; ????
    1486:	00 00       	nop
    1488:	00 14       	cp	r0, r0
    148a:	00 00       	nop
    148c:	00 01       	movw	r0, r0
    148e:	05 03       	mulsu	r16, r21
    1490:	0c 11       	cpse	r16, r12
    1492:	80 00       	.word	0x0080	; ????
    1494:	9e 02       	muls	r25, r30
    1496:	25 09       	sbc	r18, r5
    1498:	00 00       	nop
    149a:	00 00       	nop
    149c:	14 00       	.word	0x0014	; ????
    149e:	00 00       	nop
    14a0:	01 05       	cpc	r16, r1
    14a2:	03 20       	and	r0, r3
    14a4:	11 80       	ldd	r1, Z+1	; 0x01
    14a6:	00 9f       	mul	r16, r16
    14a8:	02 30       	cpi	r16, 0x02	; 2
    14aa:	09 00       	.word	0x0009	; ????
    14ac:	00 00       	nop
    14ae:	00 14       	cp	r0, r0
    14b0:	00 00       	nop
    14b2:	00 01       	movw	r0, r0
    14b4:	05 03       	mulsu	r16, r21
    14b6:	21 11       	cpse	r18, r1
    14b8:	80 00       	.word	0x0080	; ????
    14ba:	a0 02       	muls	r26, r16
    14bc:	3b 09       	sbc	r19, r11
    14be:	00 00       	nop
    14c0:	00 00       	nop
    14c2:	14 00       	.word	0x0014	; ????
    14c4:	00 00       	nop
    14c6:	01 05       	cpc	r16, r1
    14c8:	03 50       	subi	r16, 0x03	; 3
    14ca:	00 80       	ld	r0, Z
    14cc:	00 a1       	ldd	r16, Z+32	; 0x20
    14ce:	02 41       	sbci	r16, 0x12	; 18
    14d0:	09 00       	.word	0x0009	; ????
    14d2:	00 00       	nop
    14d4:	00 14       	cp	r0, r0
    14d6:	00 00       	nop
    14d8:	00 01       	movw	r0, r0
    14da:	05 03       	mulsu	r16, r21
    14dc:	c0 08       	sbc	r12, r0
    14de:	80 00       	.word	0x0080	; ????
    14e0:	a2 02       	muls	r26, r18
    14e2:	47 09       	sbc	r20, r7
    14e4:	00 00       	nop
    14e6:	00 00       	nop
    14e8:	14 00       	.word	0x0014	; ????
    14ea:	00 00       	nop
    14ec:	01 05       	cpc	r16, r1
    14ee:	03 c1       	rjmp	.+518    	; 0x16f6 <__LOCK_REGION_LENGTH__+0x12f6>
    14f0:	08 80       	ld	r0, Y
    14f2:	00 a3       	std	Z+32, r16	; 0x20
    14f4:	02 4d       	sbci	r16, 0xD2	; 210
    14f6:	09 00       	.word	0x0009	; ????
    14f8:	00 00       	nop
    14fa:	00 14       	cp	r0, r0
    14fc:	00 00       	nop
    14fe:	00 01       	movw	r0, r0
    1500:	05 03       	mulsu	r16, r21
    1502:	c4 08       	sbc	r12, r4
    1504:	80 00       	.word	0x0080	; ????
    1506:	a4 02       	muls	r26, r20
    1508:	52 09       	sbc	r21, r2
    150a:	00 00       	nop
    150c:	00 00       	nop
    150e:	14 00       	.word	0x0014	; ????
    1510:	00 00       	nop
    1512:	01 05       	cpc	r16, r1
    1514:	03 c2       	rjmp	.+1030   	; 0x191c <__DATA_REGION_LENGTH__+0x11c>
    1516:	08 80       	ld	r0, Y
    1518:	00 a5       	ldd	r16, Z+40	; 0x28
    151a:	02 5a       	subi	r16, 0xA2	; 162
    151c:	09 00       	.word	0x0009	; ????
    151e:	00 00       	nop
    1520:	00 14       	cp	r0, r0
    1522:	00 00       	nop
    1524:	00 01       	movw	r0, r0
    1526:	05 03       	mulsu	r16, r21
    1528:	c3 08       	sbc	r12, r3
    152a:	80 00       	.word	0x0080	; ????
    152c:	a6 02       	muls	r26, r22
    152e:	63 09       	sbc	r22, r3
    1530:	00 00       	nop
    1532:	00 00       	nop
    1534:	14 00       	.word	0x0014	; ????
    1536:	00 00       	nop
    1538:	01 05       	cpc	r16, r1
    153a:	03 02       	muls	r16, r19
    153c:	0f 80       	ldd	r0, Y+7	; 0x07
    153e:	00 a7       	std	Z+40, r16	; 0x28
    1540:	02 6a       	ori	r16, 0xA2	; 162
    1542:	09 00       	.word	0x0009	; ????
    1544:	00 00       	nop
    1546:	00 14       	cp	r0, r0
    1548:	00 00       	nop
    154a:	00 01       	movw	r0, r0
    154c:	05 03       	mulsu	r16, r21
    154e:	18 0f       	add	r17, r24
    1550:	80 00       	.word	0x0080	; ????
    1552:	a8 02       	muls	r26, r24
    1554:	6f 09       	sbc	r22, r15
    1556:	00 00       	nop
    1558:	00 00       	nop
    155a:	14 00       	.word	0x0014	; ????
    155c:	00 00       	nop
    155e:	01 05       	cpc	r16, r1
    1560:	03 19       	sub	r16, r3
    1562:	0f 80       	ldd	r0, Y+7	; 0x07
    1564:	00 a9       	ldd	r16, Z+48	; 0x30
    1566:	02 75       	andi	r16, 0x52	; 82
    1568:	09 00       	.word	0x0009	; ????
    156a:	00 00       	nop
    156c:	00 14       	cp	r0, r0
    156e:	00 00       	nop
    1570:	00 01       	movw	r0, r0
    1572:	05 03       	mulsu	r16, r21
    1574:	01 0f       	add	r16, r17
    1576:	80 00       	.word	0x0080	; ????
    1578:	aa 02       	muls	r26, r26
    157a:	7b 09       	sbc	r23, r11
    157c:	00 00       	nop
    157e:	00 00       	nop
    1580:	1b 00       	.word	0x001b	; ????
    1582:	00 00       	nop
    1584:	01 05       	cpc	r16, r1
    1586:	03 8c       	ldd	r0, Z+27	; 0x1b
    1588:	0a 80       	ldd	r0, Y+2	; 0x02
    158a:	00 ab       	std	Z+48, r16	; 0x30
    158c:	02 80       	ldd	r0, Z+2	; 0x02
    158e:	09 00       	.word	0x0009	; ????
    1590:	00 00       	nop
    1592:	00 1b       	sub	r16, r16
    1594:	00 00       	nop
    1596:	00 01       	movw	r0, r0
    1598:	05 03       	mulsu	r16, r21
    159a:	8a 0a       	sbc	r8, r26
    159c:	80 00       	.word	0x0080	; ????
    159e:	ac 02       	muls	r26, r28
    15a0:	84 09       	sbc	r24, r4
    15a2:	00 00       	nop
    15a4:	00 00       	nop
    15a6:	14 00       	.word	0x0014	; ????
    15a8:	00 00       	nop
    15aa:	01 05       	cpc	r16, r1
    15ac:	03 80       	ldd	r0, Z+3	; 0x03
    15ae:	0a 80       	ldd	r0, Y+2	; 0x02
    15b0:	00 ad       	ldd	r16, Z+56	; 0x38
    15b2:	02 8a       	std	Z+18, r0	; 0x12
    15b4:	09 00       	.word	0x0009	; ????
    15b6:	00 00       	nop
    15b8:	00 14       	cp	r0, r0
    15ba:	00 00       	nop
    15bc:	00 01       	movw	r0, r0
    15be:	05 03       	mulsu	r16, r21
    15c0:	81 0a       	sbc	r8, r17
    15c2:	80 00       	.word	0x0080	; ????
    15c4:	ae 02       	muls	r26, r30
    15c6:	90 09       	sbc	r25, r0
    15c8:	00 00       	nop
    15ca:	00 00       	nop
    15cc:	14 00       	.word	0x0014	; ????
    15ce:	00 00       	nop
    15d0:	01 05       	cpc	r16, r1
    15d2:	03 88       	ldd	r0, Z+19	; 0x13
    15d4:	0a 80       	ldd	r0, Y+2	; 0x02
    15d6:	00 af       	std	Z+56, r16	; 0x38
    15d8:	02 98       	cbi	0x00, 2	; 0
    15da:	09 00       	.word	0x0009	; ????
    15dc:	00 00       	nop
    15de:	00 14       	cp	r0, r0
    15e0:	00 00       	nop
    15e2:	00 01       	movw	r0, r0
    15e4:	05 03       	mulsu	r16, r21
    15e6:	84 0a       	sbc	r8, r20
    15e8:	80 00       	.word	0x0080	; ????
    15ea:	b0 02       	muls	r27, r16
    15ec:	9f 09       	sbc	r25, r15
    15ee:	00 00       	nop
    15f0:	00 00       	nop
    15f2:	14 00       	.word	0x0014	; ????
    15f4:	00 00       	nop
    15f6:	01 05       	cpc	r16, r1
    15f8:	03 85       	ldd	r16, Z+11	; 0x0b
    15fa:	0a 80       	ldd	r0, Y+2	; 0x02
    15fc:	00 b1       	in	r16, 0x00	; 0
    15fe:	02 a7       	std	Z+42, r16	; 0x2a
    1600:	09 00       	.word	0x0009	; ????
    1602:	00 00       	nop
    1604:	00 14       	cp	r0, r0
    1606:	00 00       	nop
    1608:	00 01       	movw	r0, r0
    160a:	05 03       	mulsu	r16, r21
    160c:	86 0a       	sbc	r8, r22
    160e:	80 00       	.word	0x0080	; ????
    1610:	b2 02       	muls	r27, r18
    1612:	b0 09       	sbc	r27, r0
    1614:	00 00       	nop
    1616:	00 00       	nop
    1618:	14 00       	.word	0x0014	; ????
    161a:	00 00       	nop
    161c:	01 05       	cpc	r16, r1
    161e:	03 87       	std	Z+11, r16	; 0x0b
    1620:	0a 80       	ldd	r0, Y+2	; 0x02
    1622:	00 b3       	in	r16, 0x10	; 16
    1624:	02 b7       	in	r16, 0x32	; 50
    1626:	09 00       	.word	0x0009	; ????
    1628:	00 00       	nop
    162a:	00 14       	cp	r0, r0
    162c:	00 00       	nop
    162e:	00 01       	movw	r0, r0
    1630:	05 03       	mulsu	r16, r21
    1632:	89 0a       	sbc	r8, r25
    1634:	80 00       	.word	0x0080	; ????
    1636:	b4 02       	muls	r27, r20
    1638:	bc 09       	sbc	r27, r12
    163a:	00 00       	nop
    163c:	00 00       	nop
    163e:	1b 00       	.word	0x001b	; ????
    1640:	00 00       	nop
    1642:	01 05       	cpc	r16, r1
    1644:	03 9c       	mul	r0, r3
    1646:	0a 80       	ldd	r0, Y+2	; 0x02
    1648:	00 b5       	in	r16, 0x20	; 32
    164a:	02 c1       	rjmp	.+516    	; 0x1850 <__DATA_REGION_LENGTH__+0x50>
    164c:	09 00       	.word	0x0009	; ????
    164e:	00 00       	nop
    1650:	00 1b       	sub	r16, r16
    1652:	00 00       	nop
    1654:	00 01       	movw	r0, r0
    1656:	05 03       	mulsu	r16, r21
    1658:	9a 0a       	sbc	r9, r26
    165a:	80 00       	.word	0x0080	; ????
    165c:	b6 02       	muls	r27, r22
    165e:	c5 09       	sbc	r28, r5
    1660:	00 00       	nop
    1662:	00 00       	nop
    1664:	14 00       	.word	0x0014	; ????
    1666:	00 00       	nop
    1668:	01 05       	cpc	r16, r1
    166a:	03 90       	.word	0x9003	; ????
    166c:	0a 80       	ldd	r0, Y+2	; 0x02
    166e:	00 b7       	in	r16, 0x30	; 48
    1670:	02 cb       	rjmp	.-2556   	; 0xc76 <__LOCK_REGION_LENGTH__+0x876>
    1672:	09 00       	.word	0x0009	; ????
    1674:	00 00       	nop
    1676:	00 14       	cp	r0, r0
    1678:	00 00       	nop
    167a:	00 01       	movw	r0, r0
    167c:	05 03       	mulsu	r16, r21
    167e:	91 0a       	sbc	r9, r17
    1680:	80 00       	.word	0x0080	; ????
    1682:	b8 02       	muls	r27, r24
    1684:	d1 09       	sbc	r29, r1
    1686:	00 00       	nop
    1688:	00 00       	nop
    168a:	14 00       	.word	0x0014	; ????
    168c:	00 00       	nop
    168e:	01 05       	cpc	r16, r1
    1690:	03 98       	cbi	0x00, 3	; 0
    1692:	0a 80       	ldd	r0, Y+2	; 0x02
    1694:	00 b9       	out	0x00, r16	; 0
    1696:	02 d9       	rcall	.-3580   	; 0x89c <__LOCK_REGION_LENGTH__+0x49c>
    1698:	09 00       	.word	0x0009	; ????
    169a:	00 00       	nop
    169c:	00 14       	cp	r0, r0
    169e:	00 00       	nop
    16a0:	00 01       	movw	r0, r0
    16a2:	05 03       	mulsu	r16, r21
    16a4:	94 0a       	sbc	r9, r20
    16a6:	80 00       	.word	0x0080	; ????
    16a8:	ba 02       	muls	r27, r26
    16aa:	e0 09       	sbc	r30, r0
    16ac:	00 00       	nop
    16ae:	00 00       	nop
    16b0:	14 00       	.word	0x0014	; ????
    16b2:	00 00       	nop
    16b4:	01 05       	cpc	r16, r1
    16b6:	03 95       	inc	r16
    16b8:	0a 80       	ldd	r0, Y+2	; 0x02
    16ba:	00 bb       	out	0x10, r16	; 16
    16bc:	02 e8       	ldi	r16, 0x82	; 130
    16be:	09 00       	.word	0x0009	; ????
    16c0:	00 00       	nop
    16c2:	00 14       	cp	r0, r0
    16c4:	00 00       	nop
    16c6:	00 01       	movw	r0, r0
    16c8:	05 03       	mulsu	r16, r21
    16ca:	96 0a       	sbc	r9, r22
    16cc:	80 00       	.word	0x0080	; ????
    16ce:	bc 02       	muls	r27, r28
    16d0:	f1 09       	sbc	r31, r1
    16d2:	00 00       	nop
    16d4:	00 00       	nop
    16d6:	14 00       	.word	0x0014	; ????
    16d8:	00 00       	nop
    16da:	01 05       	cpc	r16, r1
    16dc:	03 97       	sbiw	r24, 0x03	; 3
    16de:	0a 80       	ldd	r0, Y+2	; 0x02
    16e0:	00 bd       	out	0x20, r16	; 32
    16e2:	02 f8       	bld	r0, 2
    16e4:	09 00       	.word	0x0009	; ????
    16e6:	00 00       	nop
    16e8:	00 14       	cp	r0, r0
    16ea:	00 00       	nop
    16ec:	00 01       	movw	r0, r0
    16ee:	05 03       	mulsu	r16, r21
    16f0:	99 0a       	sbc	r9, r25
    16f2:	80 00       	.word	0x0080	; ????
    16f4:	be 02       	muls	r27, r30
    16f6:	fd 09       	sbc	r31, r13
    16f8:	00 00       	nop
    16fa:	00 00       	nop
    16fc:	1b 00       	.word	0x001b	; ????
    16fe:	00 00       	nop
    1700:	01 05       	cpc	r16, r1
    1702:	03 ac       	ldd	r0, Z+59	; 0x3b
    1704:	0a 80       	ldd	r0, Y+2	; 0x02
    1706:	00 bf       	out	0x30, r16	; 48
    1708:	02 02       	muls	r16, r18
    170a:	0a 00       	.word	0x000a	; ????
    170c:	00 00       	nop
    170e:	00 1b       	sub	r16, r16
    1710:	00 00       	nop
    1712:	00 01       	movw	r0, r0
    1714:	05 03       	mulsu	r16, r21
    1716:	aa 0a       	sbc	r10, r26
    1718:	80 00       	.word	0x0080	; ????
    171a:	c0 02       	muls	r28, r16
    171c:	06 0a       	sbc	r0, r22
    171e:	00 00       	nop
    1720:	00 00       	nop
    1722:	14 00       	.word	0x0014	; ????
    1724:	00 00       	nop
    1726:	01 05       	cpc	r16, r1
    1728:	03 a0       	ldd	r0, Z+35	; 0x23
    172a:	0a 80       	ldd	r0, Y+2	; 0x02
    172c:	00 c1       	rjmp	.+512    	; 0x192e <__DATA_REGION_LENGTH__+0x12e>
    172e:	02 0c       	add	r0, r2
    1730:	0a 00       	.word	0x000a	; ????
    1732:	00 00       	nop
    1734:	00 14       	cp	r0, r0
    1736:	00 00       	nop
    1738:	00 01       	movw	r0, r0
    173a:	05 03       	mulsu	r16, r21
    173c:	a1 0a       	sbc	r10, r17
    173e:	80 00       	.word	0x0080	; ????
    1740:	c2 02       	muls	r28, r18
    1742:	12 0a       	sbc	r1, r18
    1744:	00 00       	nop
    1746:	00 00       	nop
    1748:	14 00       	.word	0x0014	; ????
    174a:	00 00       	nop
    174c:	01 05       	cpc	r16, r1
    174e:	03 a8       	ldd	r0, Z+51	; 0x33
    1750:	0a 80       	ldd	r0, Y+2	; 0x02
    1752:	00 c3       	rjmp	.+1536   	; 0x1d54 <__DATA_REGION_LENGTH__+0x554>
    1754:	02 1a       	sub	r0, r18
    1756:	0a 00       	.word	0x000a	; ????
    1758:	00 00       	nop
    175a:	00 14       	cp	r0, r0
    175c:	00 00       	nop
    175e:	00 01       	movw	r0, r0
    1760:	05 03       	mulsu	r16, r21
    1762:	a4 0a       	sbc	r10, r20
    1764:	80 00       	.word	0x0080	; ????
    1766:	c4 02       	muls	r28, r20
    1768:	21 0a       	sbc	r2, r17
    176a:	00 00       	nop
    176c:	00 00       	nop
    176e:	14 00       	.word	0x0014	; ????
    1770:	00 00       	nop
    1772:	01 05       	cpc	r16, r1
    1774:	03 a5       	ldd	r16, Z+43	; 0x2b
    1776:	0a 80       	ldd	r0, Y+2	; 0x02
    1778:	00 c5       	rjmp	.+2560   	; 0x217a <__DATA_REGION_LENGTH__+0x97a>
    177a:	02 29       	or	r16, r2
    177c:	0a 00       	.word	0x000a	; ????
    177e:	00 00       	nop
    1780:	00 14       	cp	r0, r0
    1782:	00 00       	nop
    1784:	00 01       	movw	r0, r0
    1786:	05 03       	mulsu	r16, r21
    1788:	a6 0a       	sbc	r10, r22
    178a:	80 00       	.word	0x0080	; ????
    178c:	c6 02       	muls	r28, r22
    178e:	32 0a       	sbc	r3, r18
    1790:	00 00       	nop
    1792:	00 00       	nop
    1794:	14 00       	.word	0x0014	; ????
    1796:	00 00       	nop
    1798:	01 05       	cpc	r16, r1
    179a:	03 a7       	std	Z+43, r16	; 0x2b
    179c:	0a 80       	ldd	r0, Y+2	; 0x02
    179e:	00 c7       	rjmp	.+3584   	; 0x25a0 <__DATA_REGION_LENGTH__+0xda0>
    17a0:	02 39       	cpi	r16, 0x92	; 146
    17a2:	0a 00       	.word	0x000a	; ????
    17a4:	00 00       	nop
    17a6:	00 14       	cp	r0, r0
    17a8:	00 00       	nop
    17aa:	00 01       	movw	r0, r0
    17ac:	05 03       	mulsu	r16, r21
    17ae:	a9 0a       	sbc	r10, r25
    17b0:	80 00       	.word	0x0080	; ????
    17b2:	c8 02       	muls	r28, r24
    17b4:	3e 0a       	sbc	r3, r30
    17b6:	00 00       	nop
    17b8:	00 00       	nop
    17ba:	1b 00       	.word	0x001b	; ????
    17bc:	00 00       	nop
    17be:	01 05       	cpc	r16, r1
    17c0:	03 bc       	out	0x23, r0	; 35
    17c2:	0a 80       	ldd	r0, Y+2	; 0x02
    17c4:	00 c9       	rjmp	.-3584   	; 0x9c6 <__LOCK_REGION_LENGTH__+0x5c6>
    17c6:	02 43       	sbci	r16, 0x32	; 50
    17c8:	0a 00       	.word	0x000a	; ????
    17ca:	00 00       	nop
    17cc:	00 1b       	sub	r16, r16
    17ce:	00 00       	nop
    17d0:	00 01       	movw	r0, r0
    17d2:	05 03       	mulsu	r16, r21
    17d4:	ba 0a       	sbc	r11, r26
    17d6:	80 00       	.word	0x0080	; ????
    17d8:	ca 02       	muls	r28, r26
    17da:	47 0a       	sbc	r4, r23
    17dc:	00 00       	nop
    17de:	00 00       	nop
    17e0:	14 00       	.word	0x0014	; ????
    17e2:	00 00       	nop
    17e4:	01 05       	cpc	r16, r1
    17e6:	03 b0       	in	r0, 0x03	; 3
    17e8:	0a 80       	ldd	r0, Y+2	; 0x02
    17ea:	00 cb       	rjmp	.-2560   	; 0xdec <__LOCK_REGION_LENGTH__+0x9ec>
    17ec:	02 4d       	sbci	r16, 0xD2	; 210
    17ee:	0a 00       	.word	0x000a	; ????
    17f0:	00 00       	nop
    17f2:	00 14       	cp	r0, r0
    17f4:	00 00       	nop
    17f6:	00 01       	movw	r0, r0
    17f8:	05 03       	mulsu	r16, r21
    17fa:	b1 0a       	sbc	r11, r17
    17fc:	80 00       	.word	0x0080	; ????
    17fe:	cc 02       	muls	r28, r28
    1800:	53 0a       	sbc	r5, r19
    1802:	00 00       	nop
    1804:	00 00       	nop
    1806:	14 00       	.word	0x0014	; ????
    1808:	00 00       	nop
    180a:	01 05       	cpc	r16, r1
    180c:	03 b8       	out	0x03, r0	; 3
    180e:	0a 80       	ldd	r0, Y+2	; 0x02
    1810:	00 cd       	rjmp	.-1536   	; 0x1212 <__LOCK_REGION_LENGTH__+0xe12>
    1812:	02 5b       	subi	r16, 0xB2	; 178
    1814:	0a 00       	.word	0x000a	; ????
    1816:	00 00       	nop
    1818:	00 14       	cp	r0, r0
    181a:	00 00       	nop
    181c:	00 01       	movw	r0, r0
    181e:	05 03       	mulsu	r16, r21
    1820:	b4 0a       	sbc	r11, r20
    1822:	80 00       	.word	0x0080	; ????
    1824:	ce 02       	muls	r28, r30
    1826:	62 0a       	sbc	r6, r18
    1828:	00 00       	nop
    182a:	00 00       	nop
    182c:	14 00       	.word	0x0014	; ????
    182e:	00 00       	nop
    1830:	01 05       	cpc	r16, r1
    1832:	03 b5       	in	r16, 0x23	; 35
    1834:	0a 80       	ldd	r0, Y+2	; 0x02
    1836:	00 cf       	rjmp	.-512    	; 0x1638 <__LOCK_REGION_LENGTH__+0x1238>
    1838:	02 6a       	ori	r16, 0xA2	; 162
    183a:	0a 00       	.word	0x000a	; ????
    183c:	00 00       	nop
    183e:	00 14       	cp	r0, r0
    1840:	00 00       	nop
    1842:	00 01       	movw	r0, r0
    1844:	05 03       	mulsu	r16, r21
    1846:	b6 0a       	sbc	r11, r22
    1848:	80 00       	.word	0x0080	; ????
    184a:	d0 02       	muls	r29, r16
    184c:	73 0a       	sbc	r7, r19
    184e:	00 00       	nop
    1850:	00 00       	nop
    1852:	14 00       	.word	0x0014	; ????
    1854:	00 00       	nop
    1856:	01 05       	cpc	r16, r1
    1858:	03 b7       	in	r16, 0x33	; 51
    185a:	0a 80       	ldd	r0, Y+2	; 0x02
    185c:	00 d1       	rcall	.+512    	; 0x1a5e <__DATA_REGION_LENGTH__+0x25e>
    185e:	02 7a       	andi	r16, 0xA2	; 162
    1860:	0a 00       	.word	0x000a	; ????
    1862:	00 00       	nop
    1864:	00 14       	cp	r0, r0
    1866:	00 00       	nop
    1868:	00 01       	movw	r0, r0
    186a:	05 03       	mulsu	r16, r21
    186c:	b9 0a       	sbc	r11, r25
    186e:	80 00       	.word	0x0080	; ????
    1870:	d2 02       	muls	r29, r18
    1872:	7f 0a       	sbc	r7, r31
    1874:	00 00       	nop
    1876:	00 00       	nop
    1878:	14 00       	.word	0x0014	; ????
    187a:	00 00       	nop
    187c:	01 05       	cpc	r16, r1
    187e:	03 a0       	ldd	r0, Z+35	; 0x23
    1880:	08 80       	ld	r0, Y
    1882:	00 d3       	rcall	.+1536   	; 0x1e84 <__DATA_REGION_LENGTH__+0x684>
    1884:	02 85       	ldd	r16, Z+10	; 0x0a
    1886:	0a 00       	.word	0x000a	; ????
    1888:	00 00       	nop
    188a:	00 14       	cp	r0, r0
    188c:	00 00       	nop
    188e:	00 01       	movw	r0, r0
    1890:	05 03       	mulsu	r16, r21
    1892:	a2 08       	sbc	r10, r2
    1894:	80 00       	.word	0x0080	; ????
    1896:	d4 02       	muls	r29, r20
    1898:	8d 0a       	sbc	r8, r29
    189a:	00 00       	nop
    189c:	00 00       	nop
    189e:	14 00       	.word	0x0014	; ????
    18a0:	00 00       	nop
    18a2:	01 05       	cpc	r16, r1
    18a4:	03 a1       	ldd	r16, Z+35	; 0x23
    18a6:	08 80       	ld	r0, Y
    18a8:	00 d5       	rcall	.+2560   	; 0x22aa <__DATA_REGION_LENGTH__+0xaaa>
    18aa:	02 96       	adiw	r24, 0x02	; 2
    18ac:	0a 00       	.word	0x000a	; ????
    18ae:	00 00       	nop
    18b0:	00 14       	cp	r0, r0
    18b2:	00 00       	nop
    18b4:	00 01       	movw	r0, r0
    18b6:	05 03       	mulsu	r16, r21
    18b8:	a7 08       	sbc	r10, r7
    18ba:	80 00       	.word	0x0080	; ????
    18bc:	d6 02       	muls	r29, r22
    18be:	9c 0a       	sbc	r9, r28
    18c0:	00 00       	nop
    18c2:	00 00       	nop
    18c4:	14 00       	.word	0x0014	; ????
    18c6:	00 00       	nop
    18c8:	01 05       	cpc	r16, r1
    18ca:	03 a6       	std	Z+43, r0	; 0x2b
    18cc:	08 80       	ld	r0, Y
    18ce:	00 d7       	rcall	.+3584   	; 0x26d0 <__DATA_REGION_LENGTH__+0xed0>
    18d0:	02 a2       	std	Z+34, r0	; 0x22
    18d2:	0a 00       	.word	0x000a	; ????
    18d4:	00 00       	nop
    18d6:	00 14       	cp	r0, r0
    18d8:	00 00       	nop
    18da:	00 01       	movw	r0, r0
    18dc:	05 03       	mulsu	r16, r21
    18de:	a3 08       	sbc	r10, r3
    18e0:	80 00       	.word	0x0080	; ????
    18e2:	d8 02       	muls	r29, r24
    18e4:	a9 0a       	sbc	r10, r25
    18e6:	00 00       	nop
    18e8:	00 00       	nop
    18ea:	14 00       	.word	0x0014	; ????
    18ec:	00 00       	nop
    18ee:	01 05       	cpc	r16, r1
    18f0:	03 a4       	ldd	r0, Z+43	; 0x2b
    18f2:	08 80       	ld	r0, Y
    18f4:	00 d9       	rcall	.-3584   	; 0xaf6 <__LOCK_REGION_LENGTH__+0x6f6>
    18f6:	02 b0       	in	r0, 0x02	; 2
    18f8:	0a 00       	.word	0x000a	; ????
    18fa:	00 00       	nop
    18fc:	00 14       	cp	r0, r0
    18fe:	00 00       	nop
    1900:	00 01       	movw	r0, r0
    1902:	05 03       	mulsu	r16, r21
    1904:	a8 08       	sbc	r10, r8
    1906:	80 00       	.word	0x0080	; ????
    1908:	da 02       	muls	r29, r26
    190a:	b6 0a       	sbc	r11, r22
    190c:	00 00       	nop
    190e:	00 00       	nop
    1910:	14 00       	.word	0x0014	; ????
    1912:	00 00       	nop
    1914:	01 05       	cpc	r16, r1
    1916:	03 a5       	ldd	r16, Z+43	; 0x2b
    1918:	08 80       	ld	r0, Y
    191a:	00 db       	rcall	.-2560   	; 0xf1c <__LOCK_REGION_LENGTH__+0xb1c>
    191c:	02 be       	out	0x32, r0	; 50
    191e:	0a 00       	.word	0x000a	; ????
    1920:	00 00       	nop
    1922:	00 14       	cp	r0, r0
    1924:	00 00       	nop
    1926:	00 01       	movw	r0, r0
    1928:	05 03       	mulsu	r16, r21
    192a:	ac 08       	sbc	r10, r12
    192c:	80 00       	.word	0x0080	; ????
    192e:	dc 02       	muls	r29, r28
    1930:	c4 0a       	sbc	r12, r20
    1932:	00 00       	nop
    1934:	00 00       	nop
    1936:	14 00       	.word	0x0014	; ????
    1938:	00 00       	nop
    193a:	01 05       	cpc	r16, r1
    193c:	03 ae       	std	Z+59, r0	; 0x3b
    193e:	08 80       	ld	r0, Y
    1940:	00 dd       	rcall	.-1536   	; 0x1342 <__LOCK_REGION_LENGTH__+0xf42>
    1942:	02 ce       	rjmp	.-1020   	; 0x1548 <__LOCK_REGION_LENGTH__+0x1148>
    1944:	0a 00       	.word	0x000a	; ????
    1946:	00 00       	nop
    1948:	00 14       	cp	r0, r0
    194a:	00 00       	nop
    194c:	00 01       	movw	r0, r0
    194e:	05 03       	mulsu	r16, r21
    1950:	a9 08       	sbc	r10, r9
    1952:	80 00       	.word	0x0080	; ????
    1954:	de 02       	muls	r29, r30
    1956:	d5 0a       	sbc	r13, r21
    1958:	00 00       	nop
    195a:	00 00       	nop
    195c:	14 00       	.word	0x0014	; ????
    195e:	00 00       	nop
    1960:	01 05       	cpc	r16, r1
    1962:	03 aa       	std	Z+51, r0	; 0x33
    1964:	08 80       	ld	r0, Y
    1966:	00 df       	rcall	.-512    	; 0x1768 <__LOCK_REGION_LENGTH__+0x1368>
    1968:	02 dc       	rcall	.-2044   	; 0x116e <__LOCK_REGION_LENGTH__+0xd6e>
    196a:	0a 00       	.word	0x000a	; ????
    196c:	00 00       	nop
    196e:	00 14       	cp	r0, r0
    1970:	00 00       	nop
    1972:	00 01       	movw	r0, r0
    1974:	05 03       	mulsu	r16, r21
    1976:	ad 08       	sbc	r10, r13
    1978:	80 00       	.word	0x0080	; ????
    197a:	e0 02       	muls	r30, r16
    197c:	e2 0a       	sbc	r14, r18
    197e:	00 00       	nop
    1980:	00 00       	nop
    1982:	14 00       	.word	0x0014	; ????
    1984:	00 00       	nop
    1986:	01 05       	cpc	r16, r1
    1988:	03 ab       	std	Z+51, r16	; 0x33
    198a:	08 80       	ld	r0, Y
    198c:	00 e1       	ldi	r16, 0x10	; 16
    198e:	02 ea       	ldi	r16, 0xA2	; 162
    1990:	0a 00       	.word	0x000a	; ????
    1992:	00 00       	nop
    1994:	00 1b       	sub	r16, r16
    1996:	00 00       	nop
    1998:	00 01       	movw	r0, r0
    199a:	05 03       	mulsu	r16, r21
    199c:	08 08       	sbc	r0, r8
    199e:	80 00       	.word	0x0080	; ????
    19a0:	e2 02       	muls	r30, r18
    19a2:	ef 0a       	sbc	r14, r31
    19a4:	00 00       	nop
    19a6:	00 00       	nop
    19a8:	14 00       	.word	0x0014	; ????
    19aa:	00 00       	nop
    19ac:	01 05       	cpc	r16, r1
    19ae:	03 05       	cpc	r16, r3
    19b0:	08 80       	ld	r0, Y
    19b2:	00 e3       	ldi	r16, 0x30	; 48
    19b4:	02 f5       	brpl	.+64     	; 0x19f6 <__DATA_REGION_LENGTH__+0x1f6>
    19b6:	0a 00       	.word	0x000a	; ????
    19b8:	00 00       	nop
    19ba:	00 14       	cp	r0, r0
    19bc:	00 00       	nop
    19be:	00 01       	movw	r0, r0
    19c0:	05 03       	mulsu	r16, r21
    19c2:	06 08       	sbc	r0, r6
    19c4:	80 00       	.word	0x0080	; ????
    19c6:	e4 02       	muls	r30, r20
    19c8:	fb 0a       	sbc	r15, r27
    19ca:	00 00       	nop
    19cc:	00 00       	nop
    19ce:	14 00       	.word	0x0014	; ????
    19d0:	00 00       	nop
    19d2:	01 05       	cpc	r16, r1
    19d4:	03 07       	cpc	r16, r19
    19d6:	08 80       	ld	r0, Y
    19d8:	00 e5       	ldi	r16, 0x50	; 80
    19da:	02 01       	movw	r0, r4
    19dc:	0b 00       	.word	0x000b	; ????
    19de:	00 00       	nop
    19e0:	00 14       	cp	r0, r0
    19e2:	00 00       	nop
    19e4:	00 01       	movw	r0, r0
    19e6:	05 03       	mulsu	r16, r21
    19e8:	0a 08       	sbc	r0, r10
    19ea:	80 00       	.word	0x0080	; ????
    19ec:	e6 02       	muls	r30, r22
    19ee:	07 0b       	sbc	r16, r23
    19f0:	00 00       	nop
    19f2:	00 00       	nop
    19f4:	14 00       	.word	0x0014	; ????
    19f6:	00 00       	nop
    19f8:	01 05       	cpc	r16, r1
    19fa:	03 0b       	sbc	r16, r19
    19fc:	08 80       	ld	r0, Y
    19fe:	00 e7       	ldi	r16, 0x70	; 112
    1a00:	02 0f       	add	r16, r18
    1a02:	0b 00       	.word	0x000b	; ????
    1a04:	00 00       	nop
    1a06:	00 14       	cp	r0, r0
    1a08:	00 00       	nop
    1a0a:	00 01       	movw	r0, r0
    1a0c:	05 03       	mulsu	r16, r21
    1a0e:	0c 08       	sbc	r0, r12
    1a10:	80 00       	.word	0x0080	; ????
    1a12:	e8 02       	muls	r30, r24
    1a14:	16 0b       	sbc	r17, r22
    1a16:	00 00       	nop
    1a18:	00 00       	nop
    1a1a:	14 00       	.word	0x0014	; ????
    1a1c:	00 00       	nop
    1a1e:	01 05       	cpc	r16, r1
    1a20:	03 01       	movw	r0, r6
    1a22:	08 80       	ld	r0, Y
    1a24:	00 e9       	ldi	r16, 0x90	; 144
    1a26:	02 1e       	adc	r0, r18
    1a28:	0b 00       	.word	0x000b	; ????
    1a2a:	00 00       	nop
    1a2c:	00 14       	cp	r0, r0
    1a2e:	00 00       	nop
    1a30:	00 01       	movw	r0, r0
    1a32:	05 03       	mulsu	r16, r21
    1a34:	00 08       	sbc	r0, r0
    1a36:	80 00       	.word	0x0080	; ????
    1a38:	ea 02       	muls	r30, r26
    1a3a:	26 0b       	sbc	r18, r22
    1a3c:	00 00       	nop
    1a3e:	00 00       	nop
    1a40:	14 00       	.word	0x0014	; ????
    1a42:	00 00       	nop
    1a44:	01 05       	cpc	r16, r1
    1a46:	03 0e       	add	r0, r19
    1a48:	08 80       	ld	r0, Y
    1a4a:	00 eb       	ldi	r16, 0xB0	; 176
    1a4c:	02 2f       	mov	r16, r18
    1a4e:	0b 00       	.word	0x000b	; ????
    1a50:	00 00       	nop
    1a52:	00 14       	cp	r0, r0
    1a54:	00 00       	nop
    1a56:	00 01       	movw	r0, r0
    1a58:	05 03       	mulsu	r16, r21
    1a5a:	04 08       	sbc	r0, r4
    1a5c:	80 00       	.word	0x0080	; ????
    1a5e:	ec 02       	muls	r30, r28
    1a60:	36 0b       	sbc	r19, r22
    1a62:	00 00       	nop
    1a64:	00 00       	nop
    1a66:	14 00       	.word	0x0014	; ????
    1a68:	00 00       	nop
    1a6a:	01 05       	cpc	r16, r1
    1a6c:	03 03       	mulsu	r16, r19
    1a6e:	08 80       	ld	r0, Y
    1a70:	00 ed       	ldi	r16, 0xD0	; 208
    1a72:	02 3e       	cpi	r16, 0xE2	; 226
    1a74:	0b 00       	.word	0x000b	; ????
    1a76:	00 00       	nop
    1a78:	00 14       	cp	r0, r0
    1a7a:	00 00       	nop
    1a7c:	00 01       	movw	r0, r0
    1a7e:	05 03       	mulsu	r16, r21
    1a80:	02 08       	sbc	r0, r2
    1a82:	80 00       	.word	0x0080	; ????
    1a84:	ee 02       	muls	r30, r30
    1a86:	46 0b       	sbc	r20, r22
    1a88:	00 00       	nop
    1a8a:	00 00       	nop
    1a8c:	14 00       	.word	0x0014	; ????
    1a8e:	00 00       	nop
    1a90:	01 05       	cpc	r16, r1
    1a92:	03 0d       	add	r16, r3
    1a94:	08 80       	ld	r0, Y
    1a96:	00 ef       	ldi	r16, 0xF0	; 240
    1a98:	02 4f       	sbci	r16, 0xF2	; 242
    1a9a:	0b 00       	.word	0x000b	; ????
    1a9c:	00 00       	nop
    1a9e:	00 1b       	sub	r16, r16
    1aa0:	00 00       	nop
    1aa2:	00 01       	movw	r0, r0
    1aa4:	05 03       	mulsu	r16, r21
    1aa6:	28 08       	sbc	r2, r8
    1aa8:	80 00       	.word	0x0080	; ????
    1aaa:	f0 02       	muls	r31, r16
    1aac:	54 0b       	sbc	r21, r20
    1aae:	00 00       	nop
    1ab0:	00 00       	nop
    1ab2:	14 00       	.word	0x0014	; ????
    1ab4:	00 00       	nop
    1ab6:	01 05       	cpc	r16, r1
    1ab8:	03 25       	eor	r16, r3
    1aba:	08 80       	ld	r0, Y
    1abc:	00 f1       	brcs	.+64     	; 0x1afe <__DATA_REGION_LENGTH__+0x2fe>
    1abe:	02 5a       	subi	r16, 0xA2	; 162
    1ac0:	0b 00       	.word	0x000b	; ????
    1ac2:	00 00       	nop
    1ac4:	00 14       	cp	r0, r0
    1ac6:	00 00       	nop
    1ac8:	00 01       	movw	r0, r0
    1aca:	05 03       	mulsu	r16, r21
    1acc:	26 08       	sbc	r2, r6
    1ace:	80 00       	.word	0x0080	; ????
    1ad0:	f2 02       	muls	r31, r18
    1ad2:	60 0b       	sbc	r22, r16
    1ad4:	00 00       	nop
    1ad6:	00 00       	nop
    1ad8:	14 00       	.word	0x0014	; ????
    1ada:	00 00       	nop
    1adc:	01 05       	cpc	r16, r1
    1ade:	03 27       	eor	r16, r19
    1ae0:	08 80       	ld	r0, Y
    1ae2:	00 f3       	brcs	.-64     	; 0x1aa4 <__DATA_REGION_LENGTH__+0x2a4>
    1ae4:	02 66       	ori	r16, 0x62	; 98
    1ae6:	0b 00       	.word	0x000b	; ????
    1ae8:	00 00       	nop
    1aea:	00 14       	cp	r0, r0
    1aec:	00 00       	nop
    1aee:	00 01       	movw	r0, r0
    1af0:	05 03       	mulsu	r16, r21
    1af2:	2a 08       	sbc	r2, r10
    1af4:	80 00       	.word	0x0080	; ????
    1af6:	f4 02       	muls	r31, r20
    1af8:	6c 0b       	sbc	r22, r28
    1afa:	00 00       	nop
    1afc:	00 00       	nop
    1afe:	14 00       	.word	0x0014	; ????
    1b00:	00 00       	nop
    1b02:	01 05       	cpc	r16, r1
    1b04:	03 2b       	or	r16, r19
    1b06:	08 80       	ld	r0, Y
    1b08:	00 f5       	brcc	.+64     	; 0x1b4a <__DATA_REGION_LENGTH__+0x34a>
    1b0a:	02 74       	andi	r16, 0x42	; 66
    1b0c:	0b 00       	.word	0x000b	; ????
    1b0e:	00 00       	nop
    1b10:	00 14       	cp	r0, r0
    1b12:	00 00       	nop
    1b14:	00 01       	movw	r0, r0
    1b16:	05 03       	mulsu	r16, r21
    1b18:	2c 08       	sbc	r2, r12
    1b1a:	80 00       	.word	0x0080	; ????
    1b1c:	f6 02       	muls	r31, r22
    1b1e:	7b 0b       	sbc	r23, r27
    1b20:	00 00       	nop
    1b22:	00 00       	nop
    1b24:	14 00       	.word	0x0014	; ????
    1b26:	00 00       	nop
    1b28:	01 05       	cpc	r16, r1
    1b2a:	03 21       	and	r16, r3
    1b2c:	08 80       	ld	r0, Y
    1b2e:	00 f7       	brcc	.-64     	; 0x1af0 <__DATA_REGION_LENGTH__+0x2f0>
    1b30:	02 83       	std	Z+2, r16	; 0x02
    1b32:	0b 00       	.word	0x000b	; ????
    1b34:	00 00       	nop
    1b36:	00 14       	cp	r0, r0
    1b38:	00 00       	nop
    1b3a:	00 01       	movw	r0, r0
    1b3c:	05 03       	mulsu	r16, r21
    1b3e:	20 08       	sbc	r2, r0
    1b40:	80 00       	.word	0x0080	; ????
    1b42:	f8 02       	muls	r31, r24
    1b44:	8b 0b       	sbc	r24, r27
    1b46:	00 00       	nop
    1b48:	00 00       	nop
    1b4a:	14 00       	.word	0x0014	; ????
    1b4c:	00 00       	nop
    1b4e:	01 05       	cpc	r16, r1
    1b50:	03 2e       	mov	r0, r19
    1b52:	08 80       	ld	r0, Y
    1b54:	00 f9       	bld	r16, 0
    1b56:	02 94       	swap	r0
    1b58:	0b 00       	.word	0x000b	; ????
    1b5a:	00 00       	nop
    1b5c:	00 14       	cp	r0, r0
    1b5e:	00 00       	nop
    1b60:	00 01       	movw	r0, r0
    1b62:	05 03       	mulsu	r16, r21
    1b64:	24 08       	sbc	r2, r4
    1b66:	80 00       	.word	0x0080	; ????
    1b68:	fa 02       	muls	r31, r26
    1b6a:	9b 0b       	sbc	r25, r27
    1b6c:	00 00       	nop
    1b6e:	00 00       	nop
    1b70:	14 00       	.word	0x0014	; ????
    1b72:	00 00       	nop
    1b74:	01 05       	cpc	r16, r1
    1b76:	03 23       	and	r16, r19
    1b78:	08 80       	ld	r0, Y
    1b7a:	00 fb       	bst	r16, 0
    1b7c:	02 a3       	std	Z+34, r16	; 0x22
    1b7e:	0b 00       	.word	0x000b	; ????
    1b80:	00 00       	nop
    1b82:	00 14       	cp	r0, r0
    1b84:	00 00       	nop
    1b86:	00 01       	movw	r0, r0
    1b88:	05 03       	mulsu	r16, r21
    1b8a:	22 08       	sbc	r2, r2
    1b8c:	80 00       	.word	0x0080	; ????
    1b8e:	fc 02       	muls	r31, r28
    1b90:	ab 0b       	sbc	r26, r27
    1b92:	00 00       	nop
    1b94:	00 00       	nop
    1b96:	14 00       	.word	0x0014	; ????
    1b98:	00 00       	nop
    1b9a:	01 05       	cpc	r16, r1
    1b9c:	03 2d       	mov	r16, r3
    1b9e:	08 80       	ld	r0, Y
    1ba0:	00 fd       	sbrc	r16, 0
    1ba2:	02 b4       	in	r0, 0x22	; 34
    1ba4:	0b 00       	.word	0x000b	; ????
    1ba6:	00 00       	nop
    1ba8:	00 1b       	sub	r16, r16
    1baa:	00 00       	nop
    1bac:	00 01       	movw	r0, r0
    1bae:	05 03       	mulsu	r16, r21
    1bb0:	48 08       	sbc	r4, r8
    1bb2:	80 00       	.word	0x0080	; ????
    1bb4:	fe 02       	muls	r31, r30
    1bb6:	b9 0b       	sbc	r27, r25
    1bb8:	00 00       	nop
    1bba:	00 00       	nop
    1bbc:	14 00       	.word	0x0014	; ????
    1bbe:	00 00       	nop
    1bc0:	01 05       	cpc	r16, r1
    1bc2:	03 45       	sbci	r16, 0x53	; 83
    1bc4:	08 80       	ld	r0, Y
    1bc6:	00 ff       	sbrs	r16, 0
    1bc8:	02 bf       	out	0x32, r16	; 50
    1bca:	0b 00       	.word	0x000b	; ????
    1bcc:	00 00       	nop
    1bce:	00 14       	cp	r0, r0
    1bd0:	00 00       	nop
    1bd2:	00 01       	movw	r0, r0
    1bd4:	05 03       	mulsu	r16, r21
    1bd6:	46 08       	sbc	r4, r6
    1bd8:	80 00       	.word	0x0080	; ????
    1bda:	80 03       	fmuls	r16, r16
    1bdc:	c5 0b       	sbc	r28, r21
    1bde:	00 00       	nop
    1be0:	00 00       	nop
    1be2:	14 00       	.word	0x0014	; ????
    1be4:	00 00       	nop
    1be6:	01 05       	cpc	r16, r1
    1be8:	03 47       	sbci	r16, 0x73	; 115
    1bea:	08 80       	ld	r0, Y
    1bec:	00 81       	ld	r16, Z
    1bee:	03 cb       	rjmp	.-2554   	; 0x11f6 <__LOCK_REGION_LENGTH__+0xdf6>
    1bf0:	0b 00       	.word	0x000b	; ????
    1bf2:	00 00       	nop
    1bf4:	00 14       	cp	r0, r0
    1bf6:	00 00       	nop
    1bf8:	00 01       	movw	r0, r0
    1bfa:	05 03       	mulsu	r16, r21
    1bfc:	4a 08       	sbc	r4, r10
    1bfe:	80 00       	.word	0x0080	; ????
    1c00:	82 03       	fmuls	r16, r18
    1c02:	d1 0b       	sbc	r29, r17
    1c04:	00 00       	nop
    1c06:	00 00       	nop
    1c08:	14 00       	.word	0x0014	; ????
    1c0a:	00 00       	nop
    1c0c:	01 05       	cpc	r16, r1
    1c0e:	03 4b       	sbci	r16, 0xB3	; 179
    1c10:	08 80       	ld	r0, Y
    1c12:	00 83       	st	Z, r16
    1c14:	03 d9       	rcall	.-3578   	; 0xe1c <__LOCK_REGION_LENGTH__+0xa1c>
    1c16:	0b 00       	.word	0x000b	; ????
    1c18:	00 00       	nop
    1c1a:	00 14       	cp	r0, r0
    1c1c:	00 00       	nop
    1c1e:	00 01       	movw	r0, r0
    1c20:	05 03       	mulsu	r16, r21
    1c22:	4c 08       	sbc	r4, r12
    1c24:	80 00       	.word	0x0080	; ????
    1c26:	84 03       	fmuls	r16, r20
    1c28:	e0 0b       	sbc	r30, r16
    1c2a:	00 00       	nop
    1c2c:	00 00       	nop
    1c2e:	14 00       	.word	0x0014	; ????
    1c30:	00 00       	nop
    1c32:	01 05       	cpc	r16, r1
    1c34:	03 41       	sbci	r16, 0x13	; 19
    1c36:	08 80       	ld	r0, Y
    1c38:	00 85       	ldd	r16, Z+8	; 0x08
    1c3a:	03 e8       	ldi	r16, 0x83	; 131
    1c3c:	0b 00       	.word	0x000b	; ????
    1c3e:	00 00       	nop
    1c40:	00 14       	cp	r0, r0
    1c42:	00 00       	nop
    1c44:	00 01       	movw	r0, r0
    1c46:	05 03       	mulsu	r16, r21
    1c48:	40 08       	sbc	r4, r0
    1c4a:	80 00       	.word	0x0080	; ????
    1c4c:	86 03       	fmuls	r16, r22
    1c4e:	f0 0b       	sbc	r31, r16
    1c50:	00 00       	nop
    1c52:	00 00       	nop
    1c54:	14 00       	.word	0x0014	; ????
    1c56:	00 00       	nop
    1c58:	01 05       	cpc	r16, r1
    1c5a:	03 4e       	sbci	r16, 0xE3	; 227
    1c5c:	08 80       	ld	r0, Y
    1c5e:	00 87       	std	Z+8, r16	; 0x08
    1c60:	03 f9       	bld	r16, 3
    1c62:	0b 00       	.word	0x000b	; ????
    1c64:	00 00       	nop
    1c66:	00 14       	cp	r0, r0
    1c68:	00 00       	nop
    1c6a:	00 01       	movw	r0, r0
    1c6c:	05 03       	mulsu	r16, r21
    1c6e:	44 08       	sbc	r4, r4
    1c70:	80 00       	.word	0x0080	; ????
    1c72:	88 03       	fmulsu	r16, r16
    1c74:	00 0c       	add	r0, r0
    1c76:	00 00       	nop
    1c78:	00 00       	nop
    1c7a:	14 00       	.word	0x0014	; ????
    1c7c:	00 00       	nop
    1c7e:	01 05       	cpc	r16, r1
    1c80:	03 43       	sbci	r16, 0x33	; 51
    1c82:	08 80       	ld	r0, Y
    1c84:	00 89       	ldd	r16, Z+16	; 0x10
    1c86:	03 08       	sbc	r0, r3
    1c88:	0c 00       	.word	0x000c	; ????
    1c8a:	00 00       	nop
    1c8c:	00 14       	cp	r0, r0
    1c8e:	00 00       	nop
    1c90:	00 01       	movw	r0, r0
    1c92:	05 03       	mulsu	r16, r21
    1c94:	42 08       	sbc	r4, r2
    1c96:	80 00       	.word	0x0080	; ????
    1c98:	8a 03       	fmulsu	r16, r18
    1c9a:	10 0c       	add	r1, r0
    1c9c:	00 00       	nop
    1c9e:	00 00       	nop
    1ca0:	14 00       	.word	0x0014	; ????
    1ca2:	00 00       	nop
    1ca4:	01 05       	cpc	r16, r1
    1ca6:	03 4d       	sbci	r16, 0xD3	; 211
    1ca8:	08 80       	ld	r0, Y
    1caa:	00 8b       	std	Z+16, r16	; 0x10
    1cac:	03 19       	sub	r16, r3
    1cae:	0c 00       	.word	0x000c	; ????
    1cb0:	00 00       	nop
    1cb2:	00 1b       	sub	r16, r16
    1cb4:	00 00       	nop
    1cb6:	00 01       	movw	r0, r0
    1cb8:	05 03       	mulsu	r16, r21
    1cba:	68 08       	sbc	r6, r8
    1cbc:	80 00       	.word	0x0080	; ????
    1cbe:	8c 03       	fmulsu	r16, r20
    1cc0:	1e 0c       	add	r1, r14
    1cc2:	00 00       	nop
    1cc4:	00 00       	nop
    1cc6:	14 00       	.word	0x0014	; ????
    1cc8:	00 00       	nop
    1cca:	01 05       	cpc	r16, r1
    1ccc:	03 65       	ori	r16, 0x53	; 83
    1cce:	08 80       	ld	r0, Y
    1cd0:	00 8d       	ldd	r16, Z+24	; 0x18
    1cd2:	03 24       	eor	r0, r3
    1cd4:	0c 00       	.word	0x000c	; ????
    1cd6:	00 00       	nop
    1cd8:	00 14       	cp	r0, r0
    1cda:	00 00       	nop
    1cdc:	00 01       	movw	r0, r0
    1cde:	05 03       	mulsu	r16, r21
    1ce0:	66 08       	sbc	r6, r6
    1ce2:	80 00       	.word	0x0080	; ????
    1ce4:	8e 03       	fmulsu	r16, r22
    1ce6:	2a 0c       	add	r2, r10
    1ce8:	00 00       	nop
    1cea:	00 00       	nop
    1cec:	14 00       	.word	0x0014	; ????
    1cee:	00 00       	nop
    1cf0:	01 05       	cpc	r16, r1
    1cf2:	03 67       	ori	r16, 0x73	; 115
    1cf4:	08 80       	ld	r0, Y
    1cf6:	00 8f       	std	Z+24, r16	; 0x18
    1cf8:	03 30       	cpi	r16, 0x03	; 3
    1cfa:	0c 00       	.word	0x000c	; ????
    1cfc:	00 00       	nop
    1cfe:	00 14       	cp	r0, r0
    1d00:	00 00       	nop
    1d02:	00 01       	movw	r0, r0
    1d04:	05 03       	mulsu	r16, r21
    1d06:	6a 08       	sbc	r6, r10
    1d08:	80 00       	.word	0x0080	; ????
    1d0a:	90 03       	fmuls	r17, r16
    1d0c:	36 0c       	add	r3, r6
    1d0e:	00 00       	nop
    1d10:	00 00       	nop
    1d12:	14 00       	.word	0x0014	; ????
    1d14:	00 00       	nop
    1d16:	01 05       	cpc	r16, r1
    1d18:	03 6b       	ori	r16, 0xB3	; 179
    1d1a:	08 80       	ld	r0, Y
    1d1c:	00 91 03 3e 	lds	r16, 0x3E03	; 0x803e03 <__DATA_REGION_ORIGIN__+0x1603>
    1d20:	0c 00       	.word	0x000c	; ????
    1d22:	00 00       	nop
    1d24:	00 14       	cp	r0, r0
    1d26:	00 00       	nop
    1d28:	00 01       	movw	r0, r0
    1d2a:	05 03       	mulsu	r16, r21
    1d2c:	6c 08       	sbc	r6, r12
    1d2e:	80 00       	.word	0x0080	; ????
    1d30:	92 03       	fmuls	r17, r18
    1d32:	45 0c       	add	r4, r5
    1d34:	00 00       	nop
    1d36:	00 00       	nop
    1d38:	14 00       	.word	0x0014	; ????
    1d3a:	00 00       	nop
    1d3c:	01 05       	cpc	r16, r1
    1d3e:	03 61       	ori	r16, 0x13	; 19
    1d40:	08 80       	ld	r0, Y
    1d42:	00 93 03 4d 	sts	0x4D03, r16	; 0x804d03 <__DATA_REGION_ORIGIN__+0x2503>
    1d46:	0c 00       	.word	0x000c	; ????
    1d48:	00 00       	nop
    1d4a:	00 14       	cp	r0, r0
    1d4c:	00 00       	nop
    1d4e:	00 01       	movw	r0, r0
    1d50:	05 03       	mulsu	r16, r21
    1d52:	60 08       	sbc	r6, r0
    1d54:	80 00       	.word	0x0080	; ????
    1d56:	94 03       	fmuls	r17, r20
    1d58:	55 0c       	add	r5, r5
    1d5a:	00 00       	nop
    1d5c:	00 00       	nop
    1d5e:	14 00       	.word	0x0014	; ????
    1d60:	00 00       	nop
    1d62:	01 05       	cpc	r16, r1
    1d64:	03 6e       	ori	r16, 0xE3	; 227
    1d66:	08 80       	ld	r0, Y
    1d68:	00 95       	com	r16
    1d6a:	03 5e       	subi	r16, 0xE3	; 227
    1d6c:	0c 00       	.word	0x000c	; ????
    1d6e:	00 00       	nop
    1d70:	00 14       	cp	r0, r0
    1d72:	00 00       	nop
    1d74:	00 01       	movw	r0, r0
    1d76:	05 03       	mulsu	r16, r21
    1d78:	64 08       	sbc	r6, r4
    1d7a:	80 00       	.word	0x0080	; ????
    1d7c:	96 03       	fmuls	r17, r22
    1d7e:	65 0c       	add	r6, r5
    1d80:	00 00       	nop
    1d82:	00 00       	nop
    1d84:	14 00       	.word	0x0014	; ????
    1d86:	00 00       	nop
    1d88:	01 05       	cpc	r16, r1
    1d8a:	03 63       	ori	r16, 0x33	; 51
    1d8c:	08 80       	ld	r0, Y
    1d8e:	00 97       	sbiw	r24, 0x00	; 0
    1d90:	03 6d       	ori	r16, 0xD3	; 211
    1d92:	0c 00       	.word	0x000c	; ????
    1d94:	00 00       	nop
    1d96:	00 14       	cp	r0, r0
    1d98:	00 00       	nop
    1d9a:	00 01       	movw	r0, r0
    1d9c:	05 03       	mulsu	r16, r21
    1d9e:	62 08       	sbc	r6, r2
    1da0:	80 00       	.word	0x0080	; ????
    1da2:	98 03       	fmulsu	r17, r16
    1da4:	75 0c       	add	r7, r5
    1da6:	00 00       	nop
    1da8:	00 00       	nop
    1daa:	14 00       	.word	0x0014	; ????
    1dac:	00 00       	nop
    1dae:	01 05       	cpc	r16, r1
    1db0:	03 6d       	ori	r16, 0xD3	; 211
    1db2:	08 80       	ld	r0, Y
    1db4:	00 99       	sbic	0x00, 0	; 0
    1db6:	03 7e       	andi	r16, 0xE3	; 227
    1db8:	0c 00       	.word	0x000c	; ????
    1dba:	00 00       	nop
    1dbc:	00 14       	cp	r0, r0
    1dbe:	00 00       	nop
    1dc0:	00 01       	movw	r0, r0
    1dc2:	05 03       	mulsu	r16, r21
    1dc4:	00 13       	cpse	r16, r16
    1dc6:	80 00       	.word	0x0080	; ????
    1dc8:	9a 03       	fmulsu	r17, r18
    1dca:	87 0c       	add	r8, r7
    1dcc:	00 00       	nop
    1dce:	00 00       	nop
    1dd0:	14 00       	.word	0x0014	; ????
    1dd2:	00 00       	nop
    1dd4:	01 05       	cpc	r16, r1
    1dd6:	03 01       	movw	r0, r6
    1dd8:	13 80       	ldd	r1, Z+3	; 0x03
    1dda:	00 9b       	sbis	0x00, 0	; 0
    1ddc:	03 90       	.word	0x9003	; ????
    1dde:	0c 00       	.word	0x000c	; ????
    1de0:	00 00       	nop
    1de2:	00 14       	cp	r0, r0
    1de4:	00 00       	nop
    1de6:	00 01       	movw	r0, r0
    1de8:	05 03       	mulsu	r16, r21
    1dea:	02 13       	cpse	r16, r18
    1dec:	80 00       	.word	0x0080	; ????
    1dee:	9c 03       	fmulsu	r17, r20
    1df0:	99 0c       	add	r9, r9
    1df2:	00 00       	nop
    1df4:	00 00       	nop
    1df6:	14 00       	.word	0x0014	; ????
    1df8:	00 00       	nop
    1dfa:	01 05       	cpc	r16, r1
    1dfc:	03 03       	mulsu	r16, r19
    1dfe:	13 80       	ldd	r1, Z+3	; 0x03
    1e00:	00 9d       	mul	r16, r0
    1e02:	03 a2       	std	Z+35, r0	; 0x23
    1e04:	0c 00       	.word	0x000c	; ????
    1e06:	00 00       	nop
    1e08:	00 14       	cp	r0, r0
    1e0a:	00 00       	nop
    1e0c:	00 01       	movw	r0, r0
    1e0e:	05 03       	mulsu	r16, r21
    1e10:	04 13       	cpse	r16, r20
    1e12:	80 00       	.word	0x0080	; ????
    1e14:	9e 03       	fmulsu	r17, r22
    1e16:	ab 0c       	add	r10, r11
    1e18:	00 00       	nop
    1e1a:	00 00       	nop
    1e1c:	14 00       	.word	0x0014	; ????
    1e1e:	00 00       	nop
    1e20:	01 05       	cpc	r16, r1
    1e22:	03 05       	cpc	r16, r3
    1e24:	13 80       	ldd	r1, Z+3	; 0x03
    1e26:	00 9f       	mul	r16, r16
    1e28:	03 b4       	in	r0, 0x23	; 35
    1e2a:	0c 00       	.word	0x000c	; ????
    1e2c:	00 00       	nop
    1e2e:	00 14       	cp	r0, r0
    1e30:	00 00       	nop
    1e32:	00 01       	movw	r0, r0
    1e34:	05 03       	mulsu	r16, r21
    1e36:	06 13       	cpse	r16, r22
    1e38:	80 00       	.word	0x0080	; ????
    1e3a:	a0 03       	fmuls	r18, r16
    1e3c:	bd 0c       	add	r11, r13
    1e3e:	00 00       	nop
    1e40:	00 00       	nop
    1e42:	14 00       	.word	0x0014	; ????
    1e44:	00 00       	nop
    1e46:	01 05       	cpc	r16, r1
    1e48:	03 07       	cpc	r16, r19
    1e4a:	13 80       	ldd	r1, Z+3	; 0x03
    1e4c:	00 a1       	ldd	r16, Z+32	; 0x20
    1e4e:	03 c6       	rjmp	.+3078   	; 0x2a56 <__DATA_REGION_LENGTH__+0x1256>
    1e50:	0c 00       	.word	0x000c	; ????
    1e52:	00 00       	nop
    1e54:	00 14       	cp	r0, r0
    1e56:	00 00       	nop
    1e58:	00 01       	movw	r0, r0
    1e5a:	05 03       	mulsu	r16, r21
    1e5c:	08 13       	cpse	r16, r24
    1e5e:	80 00       	.word	0x0080	; ????
    1e60:	a2 03       	fmuls	r18, r18
    1e62:	cf 0c       	add	r12, r15
    1e64:	00 00       	nop
    1e66:	00 00       	nop
    1e68:	14 00       	.word	0x0014	; ????
    1e6a:	00 00       	nop
    1e6c:	01 05       	cpc	r16, r1
    1e6e:	03 09       	sbc	r16, r3
    1e70:	13 80       	ldd	r1, Z+3	; 0x03
    1e72:	00 a3       	std	Z+32, r16	; 0x20
    1e74:	03 d8       	rcall	.-4090   	; 0xe7c <__LOCK_REGION_LENGTH__+0xa7c>
    1e76:	0c 00       	.word	0x000c	; ????
    1e78:	00 00       	nop
    1e7a:	00 14       	cp	r0, r0
    1e7c:	00 00       	nop
    1e7e:	00 01       	movw	r0, r0
    1e80:	05 03       	mulsu	r16, r21
    1e82:	0a 13       	cpse	r16, r26
    1e84:	80 00       	.word	0x0080	; ????
    1e86:	a4 03       	fmuls	r18, r20
    1e88:	e2 0c       	add	r14, r2
    1e8a:	00 00       	nop
    1e8c:	00 00       	nop
    1e8e:	14 00       	.word	0x0014	; ????
    1e90:	00 00       	nop
    1e92:	01 05       	cpc	r16, r1
    1e94:	03 0b       	sbc	r16, r19
    1e96:	13 80       	ldd	r1, Z+3	; 0x03
    1e98:	00 a5       	ldd	r16, Z+40	; 0x28
    1e9a:	03 ec       	ldi	r16, 0xC3	; 195
    1e9c:	0c 00       	.word	0x000c	; ????
    1e9e:	00 00       	nop
    1ea0:	00 14       	cp	r0, r0
    1ea2:	00 00       	nop
    1ea4:	00 01       	movw	r0, r0
    1ea6:	05 03       	mulsu	r16, r21
    1ea8:	0c 13       	cpse	r16, r28
    1eaa:	80 00       	.word	0x0080	; ????
    1eac:	a6 03       	fmuls	r18, r22
    1eae:	f6 0c       	add	r15, r6
    1eb0:	00 00       	nop
    1eb2:	00 00       	nop
    1eb4:	14 00       	.word	0x0014	; ????
    1eb6:	00 00       	nop
    1eb8:	01 05       	cpc	r16, r1
    1eba:	03 0d       	add	r16, r3
    1ebc:	13 80       	ldd	r1, Z+3	; 0x03
    1ebe:	00 a7       	std	Z+40, r16	; 0x28
    1ec0:	03 00       	.word	0x0003	; ????
    1ec2:	0d 00       	.word	0x000d	; ????
    1ec4:	00 00       	nop
    1ec6:	00 14       	cp	r0, r0
    1ec8:	00 00       	nop
    1eca:	00 01       	movw	r0, r0
    1ecc:	05 03       	mulsu	r16, r21
    1ece:	0e 13       	cpse	r16, r30
    1ed0:	80 00       	.word	0x0080	; ????
    1ed2:	a8 03       	fmulsu	r18, r16
    1ed4:	0a 0d       	add	r16, r10
    1ed6:	00 00       	nop
    1ed8:	00 00       	nop
    1eda:	14 00       	.word	0x0014	; ????
    1edc:	00 00       	nop
    1ede:	01 05       	cpc	r16, r1
    1ee0:	03 0f       	add	r16, r19
    1ee2:	13 80       	ldd	r1, Z+3	; 0x03
    1ee4:	00 a9       	ldd	r16, Z+48	; 0x30
    1ee6:	03 14       	cp	r0, r3
    1ee8:	0d 00       	.word	0x000d	; ????
    1eea:	00 00       	nop
    1eec:	00 14       	cp	r0, r0
    1eee:	00 00       	nop
    1ef0:	00 01       	movw	r0, r0
    1ef2:	05 03       	mulsu	r16, r21
    1ef4:	10 13       	cpse	r17, r16
    1ef6:	80 00       	.word	0x0080	; ????
    1ef8:	aa 03       	fmulsu	r18, r18
    1efa:	1e 0d       	add	r17, r14
    1efc:	00 00       	nop
    1efe:	00 00       	nop
    1f00:	14 00       	.word	0x0014	; ????
    1f02:	00 00       	nop
    1f04:	01 05       	cpc	r16, r1
    1f06:	03 11       	cpse	r16, r3
    1f08:	13 80       	ldd	r1, Z+3	; 0x03
    1f0a:	00 ab       	std	Z+48, r16	; 0x30
    1f0c:	03 28       	or	r0, r3
    1f0e:	0d 00       	.word	0x000d	; ????
    1f10:	00 00       	nop
    1f12:	00 14       	cp	r0, r0
    1f14:	00 00       	nop
    1f16:	00 01       	movw	r0, r0
    1f18:	05 03       	mulsu	r16, r21
    1f1a:	12 13       	cpse	r17, r18
    1f1c:	80 00       	.word	0x0080	; ????
    1f1e:	ac 03       	fmulsu	r18, r20
    1f20:	32 0d       	add	r19, r2
    1f22:	00 00       	nop
    1f24:	00 00       	nop
    1f26:	14 00       	.word	0x0014	; ????
    1f28:	00 00       	nop
    1f2a:	01 05       	cpc	r16, r1
    1f2c:	03 13       	cpse	r16, r19
    1f2e:	13 80       	ldd	r1, Z+3	; 0x03
    1f30:	00 ad       	ldd	r16, Z+56	; 0x38
    1f32:	03 3c       	cpi	r16, 0xC3	; 195
    1f34:	0d 00       	.word	0x000d	; ????
    1f36:	00 00       	nop
    1f38:	00 14       	cp	r0, r0
    1f3a:	00 00       	nop
    1f3c:	00 01       	movw	r0, r0
    1f3e:	05 03       	mulsu	r16, r21
    1f40:	14 13       	cpse	r17, r20
    1f42:	80 00       	.word	0x0080	; ????
    1f44:	ae 03       	fmulsu	r18, r22
    1f46:	46 0d       	add	r20, r6
    1f48:	00 00       	nop
    1f4a:	00 00       	nop
    1f4c:	14 00       	.word	0x0014	; ????
    1f4e:	00 00       	nop
    1f50:	01 05       	cpc	r16, r1
    1f52:	03 15       	cp	r16, r3
    1f54:	13 80       	ldd	r1, Z+3	; 0x03
    1f56:	00 af       	std	Z+56, r16	; 0x38
    1f58:	03 50       	subi	r16, 0x03	; 3
    1f5a:	0d 00       	.word	0x000d	; ????
    1f5c:	00 00       	nop
    1f5e:	00 14       	cp	r0, r0
    1f60:	00 00       	nop
    1f62:	00 01       	movw	r0, r0
    1f64:	05 03       	mulsu	r16, r21
    1f66:	16 13       	cpse	r17, r22
    1f68:	80 00       	.word	0x0080	; ????
    1f6a:	b0 03       	fmuls	r19, r16
    1f6c:	5a 0d       	add	r21, r10
    1f6e:	00 00       	nop
    1f70:	00 00       	nop
    1f72:	14 00       	.word	0x0014	; ????
    1f74:	00 00       	nop
    1f76:	01 05       	cpc	r16, r1
    1f78:	03 17       	cp	r16, r19
    1f7a:	13 80       	ldd	r1, Z+3	; 0x03
    1f7c:	00 b1       	in	r16, 0x00	; 0
    1f7e:	03 64       	ori	r16, 0x43	; 67
    1f80:	0d 00       	.word	0x000d	; ????
    1f82:	00 00       	nop
    1f84:	00 14       	cp	r0, r0
    1f86:	00 00       	nop
    1f88:	00 01       	movw	r0, r0
    1f8a:	05 03       	mulsu	r16, r21
    1f8c:	18 13       	cpse	r17, r24
    1f8e:	80 00       	.word	0x0080	; ????
    1f90:	b2 03       	fmuls	r19, r18
    1f92:	6e 0d       	add	r22, r14
    1f94:	00 00       	nop
    1f96:	00 00       	nop
    1f98:	14 00       	.word	0x0014	; ????
    1f9a:	00 00       	nop
    1f9c:	01 05       	cpc	r16, r1
    1f9e:	03 19       	sub	r16, r3
    1fa0:	13 80       	ldd	r1, Z+3	; 0x03
    1fa2:	00 b3       	in	r16, 0x10	; 16
    1fa4:	03 78       	andi	r16, 0x83	; 131
    1fa6:	0d 00       	.word	0x000d	; ????
    1fa8:	00 00       	nop
    1faa:	00 14       	cp	r0, r0
    1fac:	00 00       	nop
    1fae:	00 01       	movw	r0, r0
    1fb0:	05 03       	mulsu	r16, r21
    1fb2:	1a 13       	cpse	r17, r26
    1fb4:	80 00       	.word	0x0080	; ????
    1fb6:	b4 03       	fmuls	r19, r20
    1fb8:	82 0d       	add	r24, r2
    1fba:	00 00       	nop
    1fbc:	00 00       	nop
    1fbe:	14 00       	.word	0x0014	; ????
    1fc0:	00 00       	nop
    1fc2:	01 05       	cpc	r16, r1
    1fc4:	03 1b       	sub	r16, r19
    1fc6:	13 80       	ldd	r1, Z+3	; 0x03
    1fc8:	00 b5       	in	r16, 0x20	; 32
    1fca:	03 8c       	ldd	r0, Z+27	; 0x1b
    1fcc:	0d 00       	.word	0x000d	; ????
    1fce:	00 00       	nop
    1fd0:	00 14       	cp	r0, r0
    1fd2:	00 00       	nop
    1fd4:	00 01       	movw	r0, r0
    1fd6:	05 03       	mulsu	r16, r21
    1fd8:	1c 13       	cpse	r17, r28
    1fda:	80 00       	.word	0x0080	; ????
    1fdc:	b6 03       	fmuls	r19, r22
    1fde:	96 0d       	add	r25, r6
    1fe0:	00 00       	nop
    1fe2:	00 00       	nop
    1fe4:	14 00       	.word	0x0014	; ????
    1fe6:	00 00       	nop
    1fe8:	01 05       	cpc	r16, r1
    1fea:	03 1d       	adc	r16, r3
    1fec:	13 80       	ldd	r1, Z+3	; 0x03
    1fee:	00 b7       	in	r16, 0x30	; 48
    1ff0:	03 a0       	ldd	r0, Z+35	; 0x23
    1ff2:	0d 00       	.word	0x000d	; ????
    1ff4:	00 00       	nop
    1ff6:	00 14       	cp	r0, r0
    1ff8:	00 00       	nop
    1ffa:	00 01       	movw	r0, r0
    1ffc:	05 03       	mulsu	r16, r21
    1ffe:	1e 13       	cpse	r17, r30
    2000:	80 00       	.word	0x0080	; ????
    2002:	b8 03       	fmulsu	r19, r16
    2004:	aa 0d       	add	r26, r10
    2006:	00 00       	nop
    2008:	00 00       	nop
    200a:	14 00       	.word	0x0014	; ????
    200c:	00 00       	nop
    200e:	01 05       	cpc	r16, r1
    2010:	03 1f       	adc	r16, r19
    2012:	13 80       	ldd	r1, Z+3	; 0x03
    2014:	00 b9       	out	0x00, r16	; 0
    2016:	03 b4       	in	r0, 0x23	; 35
    2018:	0d 00       	.word	0x000d	; ????
    201a:	00 00       	nop
    201c:	00 14       	cp	r0, r0
    201e:	00 00       	nop
    2020:	00 01       	movw	r0, r0
    2022:	05 03       	mulsu	r16, r21
    2024:	20 13       	cpse	r18, r16
    2026:	80 00       	.word	0x0080	; ????
    2028:	ba 03       	fmulsu	r19, r18
    202a:	be 0d       	add	r27, r14
    202c:	00 00       	nop
    202e:	00 00       	nop
    2030:	14 00       	.word	0x0014	; ????
    2032:	00 00       	nop
    2034:	01 05       	cpc	r16, r1
    2036:	03 21       	and	r16, r3
    2038:	13 80       	ldd	r1, Z+3	; 0x03
    203a:	00 bb       	out	0x10, r16	; 16
    203c:	03 c8       	rjmp	.-4090   	; 0x1044 <__LOCK_REGION_LENGTH__+0xc44>
    203e:	0d 00       	.word	0x000d	; ????
    2040:	00 00       	nop
    2042:	00 14       	cp	r0, r0
    2044:	00 00       	nop
    2046:	00 01       	movw	r0, r0
    2048:	05 03       	mulsu	r16, r21
    204a:	22 13       	cpse	r18, r18
    204c:	80 00       	.word	0x0080	; ????
    204e:	bc 03       	fmulsu	r19, r20
    2050:	d2 0d       	add	r29, r2
    2052:	00 00       	nop
    2054:	00 00       	nop
    2056:	14 00       	.word	0x0014	; ????
    2058:	00 00       	nop
    205a:	01 05       	cpc	r16, r1
    205c:	03 23       	and	r16, r19
    205e:	13 80       	ldd	r1, Z+3	; 0x03
    2060:	00 bd       	out	0x20, r16	; 32
    2062:	03 dc       	rcall	.-2042   	; 0x186a <__DATA_REGION_LENGTH__+0x6a>
    2064:	0d 00       	.word	0x000d	; ????
    2066:	00 00       	nop
    2068:	00 14       	cp	r0, r0
    206a:	00 00       	nop
    206c:	00 01       	movw	r0, r0
    206e:	05 03       	mulsu	r16, r21
    2070:	24 13       	cpse	r18, r20
    2072:	80 00       	.word	0x0080	; ????
    2074:	be 03       	fmulsu	r19, r22
    2076:	e6 0d       	add	r30, r6
    2078:	00 00       	nop
    207a:	00 00       	nop
    207c:	14 00       	.word	0x0014	; ????
    207e:	00 00       	nop
    2080:	01 05       	cpc	r16, r1
    2082:	03 25       	eor	r16, r3
    2084:	13 80       	ldd	r1, Z+3	; 0x03
    2086:	00 bf       	out	0x30, r16	; 48
    2088:	03 f0       	brvs	.+0      	; 0x208a <__DATA_REGION_LENGTH__+0x88a>
    208a:	0d 00       	.word	0x000d	; ????
    208c:	00 00       	nop
    208e:	00 14       	cp	r0, r0
    2090:	00 00       	nop
    2092:	00 01       	movw	r0, r0
    2094:	05 03       	mulsu	r16, r21
    2096:	26 13       	cpse	r18, r22
    2098:	80 00       	.word	0x0080	; ????
    209a:	c0 03       	fmuls	r20, r16
    209c:	fa 0d       	add	r31, r10
    209e:	00 00       	nop
    20a0:	00 00       	nop
    20a2:	14 00       	.word	0x0014	; ????
    20a4:	00 00       	nop
    20a6:	01 05       	cpc	r16, r1
    20a8:	03 27       	eor	r16, r19
    20aa:	13 80       	ldd	r1, Z+3	; 0x03
    20ac:	00 c1       	rjmp	.+512    	; 0x22ae <__DATA_REGION_LENGTH__+0xaae>
    20ae:	03 04       	cpc	r0, r3
    20b0:	0e 00       	.word	0x000e	; ????
    20b2:	00 00       	nop
    20b4:	00 14       	cp	r0, r0
    20b6:	00 00       	nop
    20b8:	00 01       	movw	r0, r0
    20ba:	05 03       	mulsu	r16, r21
    20bc:	28 13       	cpse	r18, r24
    20be:	80 00       	.word	0x0080	; ????
    20c0:	c2 03       	fmuls	r20, r18
    20c2:	0e 0e       	add	r0, r30
    20c4:	00 00       	nop
    20c6:	00 00       	nop
    20c8:	14 00       	.word	0x0014	; ????
    20ca:	00 00       	nop
    20cc:	01 05       	cpc	r16, r1
    20ce:	03 29       	or	r16, r3
    20d0:	13 80       	ldd	r1, Z+3	; 0x03
    20d2:	00 c3       	rjmp	.+1536   	; 0x26d4 <__DATA_REGION_LENGTH__+0xed4>
    20d4:	03 18       	sub	r0, r3
    20d6:	0e 00       	.word	0x000e	; ????
    20d8:	00 00       	nop
    20da:	00 14       	cp	r0, r0
    20dc:	00 00       	nop
    20de:	00 01       	movw	r0, r0
    20e0:	05 03       	mulsu	r16, r21
    20e2:	2a 13       	cpse	r18, r26
    20e4:	80 00       	.word	0x0080	; ????
    20e6:	c4 03       	fmuls	r20, r20
    20e8:	22 0e       	add	r2, r18
    20ea:	00 00       	nop
    20ec:	00 00       	nop
    20ee:	14 00       	.word	0x0014	; ????
    20f0:	00 00       	nop
    20f2:	01 05       	cpc	r16, r1
    20f4:	03 2b       	or	r16, r19
    20f6:	13 80       	ldd	r1, Z+3	; 0x03
    20f8:	00 c5       	rjmp	.+2560   	; 0x2afa <__DATA_REGION_LENGTH__+0x12fa>
    20fa:	03 2c       	mov	r0, r3
    20fc:	0e 00       	.word	0x000e	; ????
    20fe:	00 00       	nop
    2100:	00 14       	cp	r0, r0
    2102:	00 00       	nop
    2104:	00 01       	movw	r0, r0
    2106:	05 03       	mulsu	r16, r21
    2108:	2c 13       	cpse	r18, r28
    210a:	80 00       	.word	0x0080	; ????
    210c:	c6 03       	fmuls	r20, r22
    210e:	36 0e       	add	r3, r22
    2110:	00 00       	nop
    2112:	00 00       	nop
    2114:	14 00       	.word	0x0014	; ????
    2116:	00 00       	nop
    2118:	01 05       	cpc	r16, r1
    211a:	03 2d       	mov	r16, r3
    211c:	13 80       	ldd	r1, Z+3	; 0x03
    211e:	00 c7       	rjmp	.+3584   	; 0x2f20 <__DATA_REGION_LENGTH__+0x1720>
    2120:	03 40       	sbci	r16, 0x03	; 3
    2122:	0e 00       	.word	0x000e	; ????
    2124:	00 00       	nop
    2126:	00 14       	cp	r0, r0
    2128:	00 00       	nop
    212a:	00 01       	movw	r0, r0
    212c:	05 03       	mulsu	r16, r21
    212e:	2e 13       	cpse	r18, r30
    2130:	80 00       	.word	0x0080	; ????
    2132:	c8 03       	fmulsu	r20, r16
    2134:	4a 0e       	add	r4, r26
    2136:	00 00       	nop
    2138:	00 00       	nop
    213a:	14 00       	.word	0x0014	; ????
    213c:	00 00       	nop
    213e:	01 05       	cpc	r16, r1
    2140:	03 2f       	mov	r16, r19
    2142:	13 80       	ldd	r1, Z+3	; 0x03
    2144:	00 c9       	rjmp	.-3584   	; 0x1346 <__LOCK_REGION_LENGTH__+0xf46>
    2146:	03 54       	subi	r16, 0x43	; 67
    2148:	0e 00       	.word	0x000e	; ????
    214a:	00 00       	nop
    214c:	00 14       	cp	r0, r0
    214e:	00 00       	nop
    2150:	00 01       	movw	r0, r0
    2152:	05 03       	mulsu	r16, r21
    2154:	30 13       	cpse	r19, r16
    2156:	80 00       	.word	0x0080	; ????
    2158:	ca 03       	fmulsu	r20, r18
    215a:	5e 0e       	add	r5, r30
    215c:	00 00       	nop
    215e:	00 00       	nop
    2160:	14 00       	.word	0x0014	; ????
    2162:	00 00       	nop
    2164:	01 05       	cpc	r16, r1
    2166:	03 31       	cpi	r16, 0x13	; 19
    2168:	13 80       	ldd	r1, Z+3	; 0x03
    216a:	00 cb       	rjmp	.-2560   	; 0x176c <__LOCK_REGION_LENGTH__+0x136c>
    216c:	03 68       	ori	r16, 0x83	; 131
    216e:	0e 00       	.word	0x000e	; ????
    2170:	00 00       	nop
    2172:	00 14       	cp	r0, r0
    2174:	00 00       	nop
    2176:	00 01       	movw	r0, r0
    2178:	05 03       	mulsu	r16, r21
    217a:	32 13       	cpse	r19, r18
    217c:	80 00       	.word	0x0080	; ????
    217e:	cc 03       	fmulsu	r20, r20
    2180:	72 0e       	add	r7, r18
    2182:	00 00       	nop
    2184:	00 00       	nop
    2186:	14 00       	.word	0x0014	; ????
    2188:	00 00       	nop
    218a:	01 05       	cpc	r16, r1
    218c:	03 33       	cpi	r16, 0x33	; 51
    218e:	13 80       	ldd	r1, Z+3	; 0x03
    2190:	00 cd       	rjmp	.-1536   	; 0x1b92 <__DATA_REGION_LENGTH__+0x392>
    2192:	03 7c       	andi	r16, 0xC3	; 195
    2194:	0e 00       	.word	0x000e	; ????
    2196:	00 00       	nop
    2198:	00 14       	cp	r0, r0
    219a:	00 00       	nop
    219c:	00 01       	movw	r0, r0
    219e:	05 03       	mulsu	r16, r21
    21a0:	34 13       	cpse	r19, r20
    21a2:	80 00       	.word	0x0080	; ????
    21a4:	ce 03       	fmulsu	r20, r22
    21a6:	86 0e       	add	r8, r22
    21a8:	00 00       	nop
    21aa:	00 00       	nop
    21ac:	14 00       	.word	0x0014	; ????
    21ae:	00 00       	nop
    21b0:	01 05       	cpc	r16, r1
    21b2:	03 35       	cpi	r16, 0x53	; 83
    21b4:	13 80       	ldd	r1, Z+3	; 0x03
    21b6:	00 cf       	rjmp	.-512    	; 0x1fb8 <__DATA_REGION_LENGTH__+0x7b8>
    21b8:	03 90       	.word	0x9003	; ????
    21ba:	0e 00       	.word	0x000e	; ????
    21bc:	00 00       	nop
    21be:	00 14       	cp	r0, r0
    21c0:	00 00       	nop
    21c2:	00 01       	movw	r0, r0
    21c4:	05 03       	mulsu	r16, r21
    21c6:	36 13       	cpse	r19, r22
    21c8:	80 00       	.word	0x0080	; ????
    21ca:	d0 03       	fmuls	r21, r16
    21cc:	9a 0e       	add	r9, r26
    21ce:	00 00       	nop
    21d0:	00 00       	nop
    21d2:	14 00       	.word	0x0014	; ????
    21d4:	00 00       	nop
    21d6:	01 05       	cpc	r16, r1
    21d8:	03 37       	cpi	r16, 0x73	; 115
    21da:	13 80       	ldd	r1, Z+3	; 0x03
    21dc:	00 d1       	rcall	.+512    	; 0x23de <__DATA_REGION_LENGTH__+0xbde>
    21de:	03 a4       	ldd	r0, Z+43	; 0x2b
    21e0:	0e 00       	.word	0x000e	; ????
    21e2:	00 00       	nop
    21e4:	00 14       	cp	r0, r0
    21e6:	00 00       	nop
    21e8:	00 01       	movw	r0, r0
    21ea:	05 03       	mulsu	r16, r21
    21ec:	38 13       	cpse	r19, r24
    21ee:	80 00       	.word	0x0080	; ????
    21f0:	d2 03       	fmuls	r21, r18
    21f2:	ae 0e       	add	r10, r30
    21f4:	00 00       	nop
    21f6:	00 00       	nop
    21f8:	14 00       	.word	0x0014	; ????
    21fa:	00 00       	nop
    21fc:	01 05       	cpc	r16, r1
    21fe:	03 39       	cpi	r16, 0x93	; 147
    2200:	13 80       	ldd	r1, Z+3	; 0x03
    2202:	00 d3       	rcall	.+1536   	; 0x2804 <__DATA_REGION_LENGTH__+0x1004>
    2204:	03 b8       	out	0x03, r0	; 3
    2206:	0e 00       	.word	0x000e	; ????
    2208:	00 00       	nop
    220a:	00 14       	cp	r0, r0
    220c:	00 00       	nop
    220e:	00 01       	movw	r0, r0
    2210:	05 03       	mulsu	r16, r21
    2212:	3a 13       	cpse	r19, r26
    2214:	80 00       	.word	0x0080	; ????
    2216:	d4 03       	fmuls	r21, r20
    2218:	c2 0e       	add	r12, r18
    221a:	00 00       	nop
    221c:	00 00       	nop
    221e:	14 00       	.word	0x0014	; ????
    2220:	00 00       	nop
    2222:	01 05       	cpc	r16, r1
    2224:	03 3b       	cpi	r16, 0xB3	; 179
    2226:	13 80       	ldd	r1, Z+3	; 0x03
    2228:	00 d5       	rcall	.+2560   	; 0x2c2a <__DATA_REGION_LENGTH__+0x142a>
    222a:	03 cc       	rjmp	.-2042   	; 0x1a32 <__DATA_REGION_LENGTH__+0x232>
    222c:	0e 00       	.word	0x000e	; ????
    222e:	00 00       	nop
    2230:	00 14       	cp	r0, r0
    2232:	00 00       	nop
    2234:	00 01       	movw	r0, r0
    2236:	05 03       	mulsu	r16, r21
    2238:	3c 13       	cpse	r19, r28
    223a:	80 00       	.word	0x0080	; ????
    223c:	d6 03       	fmuls	r21, r22
    223e:	d6 0e       	add	r13, r22
    2240:	00 00       	nop
    2242:	00 00       	nop
    2244:	14 00       	.word	0x0014	; ????
    2246:	00 00       	nop
    2248:	01 05       	cpc	r16, r1
    224a:	03 3d       	cpi	r16, 0xD3	; 211
    224c:	13 80       	ldd	r1, Z+3	; 0x03
    224e:	00 d7       	rcall	.+3584   	; 0x3050 <__DATA_REGION_LENGTH__+0x1850>
    2250:	03 e0       	ldi	r16, 0x03	; 3
    2252:	0e 00       	.word	0x000e	; ????
    2254:	00 00       	nop
    2256:	00 14       	cp	r0, r0
    2258:	00 00       	nop
    225a:	00 01       	movw	r0, r0
    225c:	05 03       	mulsu	r16, r21
    225e:	3e 13       	cpse	r19, r30
    2260:	80 00       	.word	0x0080	; ????
    2262:	d8 03       	fmulsu	r21, r16
    2264:	ea 0e       	add	r14, r26
    2266:	00 00       	nop
    2268:	00 00       	nop
    226a:	14 00       	.word	0x0014	; ????
    226c:	00 00       	nop
    226e:	01 05       	cpc	r16, r1
    2270:	03 3f       	cpi	r16, 0xF3	; 243
    2272:	13 80       	ldd	r1, Z+3	; 0x03
    2274:	00 d9       	rcall	.-3584   	; 0x1476 <__LOCK_REGION_LENGTH__+0x1076>
    2276:	03 f4       	brvc	.+0      	; 0x2278 <__DATA_REGION_LENGTH__+0xa78>
    2278:	0e 00       	.word	0x000e	; ????
    227a:	00 00       	nop
    227c:	00 14       	cp	r0, r0
    227e:	00 00       	nop
    2280:	00 01       	movw	r0, r0
    2282:	05 03       	mulsu	r16, r21
    2284:	00 00       	nop
    2286:	80 00       	.word	0x0080	; ????
    2288:	da 03       	fmulsu	r21, r18
    228a:	f8 0e       	add	r15, r24
    228c:	00 00       	nop
    228e:	00 00       	nop
    2290:	14 00       	.word	0x0014	; ????
    2292:	00 00       	nop
    2294:	01 05       	cpc	r16, r1
    2296:	03 02       	muls	r16, r19
    2298:	00 80       	ld	r0, Z
    229a:	00 db       	rcall	.-2560   	; 0x189c <__DATA_REGION_LENGTH__+0x9c>
    229c:	03 fb       	bst	r16, 3
    229e:	0e 00       	.word	0x000e	; ????
    22a0:	00 00       	nop
    22a2:	00 14       	cp	r0, r0
    22a4:	00 00       	nop
    22a6:	00 01       	movw	r0, r0
    22a8:	05 03       	mulsu	r16, r21
    22aa:	03 00       	.word	0x0003	; ????
    22ac:	80 00       	.word	0x0080	; ????
    22ae:	dc 03       	fmulsu	r21, r20
    22b0:	04 0f       	add	r16, r20
    22b2:	00 00       	nop
    22b4:	00 00       	nop
    22b6:	14 00       	.word	0x0014	; ????
    22b8:	00 00       	nop
    22ba:	01 05       	cpc	r16, r1
    22bc:	03 01       	movw	r0, r6
    22be:	00 80       	ld	r0, Z
    22c0:	00 dd       	rcall	.-1536   	; 0x1cc2 <__DATA_REGION_LENGTH__+0x4c2>
    22c2:	03 08       	sbc	r0, r3
    22c4:	0f 00       	.word	0x000f	; ????
    22c6:	00 00       	nop
    22c8:	00 14       	cp	r0, r0
    22ca:	00 00       	nop
    22cc:	00 01       	movw	r0, r0
    22ce:	05 03       	mulsu	r16, r21
    22d0:	04 00       	.word	0x0004	; ????
    22d2:	80 00       	.word	0x0080	; ????
    22d4:	de 03       	fmulsu	r21, r22
    22d6:	0c 0f       	add	r16, r28
    22d8:	00 00       	nop
    22da:	00 00       	nop
    22dc:	14 00       	.word	0x0014	; ????
    22de:	00 00       	nop
    22e0:	01 05       	cpc	r16, r1
    22e2:	03 06       	cpc	r0, r19
    22e4:	00 80       	ld	r0, Z
    22e6:	00 df       	rcall	.-512    	; 0x20e8 <__DATA_REGION_LENGTH__+0x8e8>
    22e8:	03 0f       	add	r16, r19
    22ea:	0f 00       	.word	0x000f	; ????
    22ec:	00 00       	nop
    22ee:	00 14       	cp	r0, r0
    22f0:	00 00       	nop
    22f2:	00 01       	movw	r0, r0
    22f4:	05 03       	mulsu	r16, r21
    22f6:	07 00       	.word	0x0007	; ????
    22f8:	80 00       	.word	0x0080	; ????
    22fa:	e0 03       	fmuls	r22, r16
    22fc:	18 0f       	add	r17, r24
    22fe:	00 00       	nop
    2300:	00 00       	nop
    2302:	14 00       	.word	0x0014	; ????
    2304:	00 00       	nop
    2306:	01 05       	cpc	r16, r1
    2308:	03 05       	cpc	r16, r3
    230a:	00 80       	ld	r0, Z
    230c:	00 e1       	ldi	r16, 0x10	; 16
    230e:	03 1c       	adc	r0, r3
    2310:	0f 00       	.word	0x000f	; ????
    2312:	00 00       	nop
    2314:	00 14       	cp	r0, r0
    2316:	00 00       	nop
    2318:	00 01       	movw	r0, r0
    231a:	05 03       	mulsu	r16, r21
    231c:	08 00       	.word	0x0008	; ????
    231e:	80 00       	.word	0x0080	; ????
    2320:	e2 03       	fmuls	r22, r18
    2322:	20 0f       	add	r18, r16
    2324:	00 00       	nop
    2326:	00 00       	nop
    2328:	14 00       	.word	0x0014	; ????
    232a:	00 00       	nop
    232c:	01 05       	cpc	r16, r1
    232e:	03 0a       	sbc	r0, r19
    2330:	00 80       	ld	r0, Z
    2332:	00 e3       	ldi	r16, 0x30	; 48
    2334:	03 23       	and	r16, r19
    2336:	0f 00       	.word	0x000f	; ????
    2338:	00 00       	nop
    233a:	00 14       	cp	r0, r0
    233c:	00 00       	nop
    233e:	00 01       	movw	r0, r0
    2340:	05 03       	mulsu	r16, r21
    2342:	0b 00       	.word	0x000b	; ????
    2344:	80 00       	.word	0x0080	; ????
    2346:	e4 03       	fmuls	r22, r20
    2348:	2c 0f       	add	r18, r28
    234a:	00 00       	nop
    234c:	00 00       	nop
    234e:	14 00       	.word	0x0014	; ????
    2350:	00 00       	nop
    2352:	01 05       	cpc	r16, r1
    2354:	03 09       	sbc	r16, r3
    2356:	00 80       	ld	r0, Z
    2358:	00 e5       	ldi	r16, 0x50	; 80
    235a:	03 30       	cpi	r16, 0x03	; 3
    235c:	0f 00       	.word	0x000f	; ????
    235e:	00 00       	nop
    2360:	00 14       	cp	r0, r0
    2362:	00 00       	nop
    2364:	00 01       	movw	r0, r0
    2366:	05 03       	mulsu	r16, r21
    2368:	0c 00       	.word	0x000c	; ????
    236a:	80 00       	.word	0x0080	; ????
    236c:	e6 03       	fmuls	r22, r22
    236e:	34 0f       	add	r19, r20
    2370:	00 00       	nop
    2372:	00 00       	nop
    2374:	14 00       	.word	0x0014	; ????
    2376:	00 00       	nop
    2378:	01 05       	cpc	r16, r1
    237a:	03 0e       	add	r0, r19
    237c:	00 80       	ld	r0, Z
    237e:	00 e7       	ldi	r16, 0x70	; 112
    2380:	03 37       	cpi	r16, 0x73	; 115
    2382:	0f 00       	.word	0x000f	; ????
    2384:	00 00       	nop
    2386:	00 14       	cp	r0, r0
    2388:	00 00       	nop
    238a:	00 01       	movw	r0, r0
    238c:	05 03       	mulsu	r16, r21
    238e:	0f 00       	.word	0x000f	; ????
    2390:	80 00       	.word	0x0080	; ????
    2392:	e8 03       	fmulsu	r22, r16
    2394:	40 0f       	add	r20, r16
    2396:	00 00       	nop
    2398:	00 00       	nop
    239a:	14 00       	.word	0x0014	; ????
    239c:	00 00       	nop
    239e:	01 05       	cpc	r16, r1
    23a0:	03 0d       	add	r16, r3
    23a2:	00 80       	ld	r0, Z
    23a4:	00 e9       	ldi	r16, 0x90	; 144
    23a6:	03 44       	sbci	r16, 0x43	; 67
    23a8:	0f 00       	.word	0x000f	; ????
    23aa:	00 00       	nop
    23ac:	00 14       	cp	r0, r0
    23ae:	00 00       	nop
    23b0:	00 01       	movw	r0, r0
    23b2:	05 03       	mulsu	r16, r21
    23b4:	10 00       	.word	0x0010	; ????
    23b6:	80 00       	.word	0x0080	; ????
    23b8:	ea 03       	fmulsu	r22, r18
    23ba:	48 0f       	add	r20, r24
    23bc:	00 00       	nop
    23be:	00 00       	nop
    23c0:	14 00       	.word	0x0014	; ????
    23c2:	00 00       	nop
    23c4:	01 05       	cpc	r16, r1
    23c6:	03 12       	cpse	r0, r19
    23c8:	00 80       	ld	r0, Z
    23ca:	00 eb       	ldi	r16, 0xB0	; 176
    23cc:	03 4b       	sbci	r16, 0xB3	; 179
    23ce:	0f 00       	.word	0x000f	; ????
    23d0:	00 00       	nop
    23d2:	00 14       	cp	r0, r0
    23d4:	00 00       	nop
    23d6:	00 01       	movw	r0, r0
    23d8:	05 03       	mulsu	r16, r21
    23da:	13 00       	.word	0x0013	; ????
    23dc:	80 00       	.word	0x0080	; ????
    23de:	ec 03       	fmulsu	r22, r20
    23e0:	54 0f       	add	r21, r20
    23e2:	00 00       	nop
    23e4:	00 00       	nop
    23e6:	14 00       	.word	0x0014	; ????
    23e8:	00 00       	nop
    23ea:	01 05       	cpc	r16, r1
    23ec:	03 11       	cpse	r16, r3
    23ee:	00 80       	ld	r0, Z
    23f0:	00 ed       	ldi	r16, 0xD0	; 208
    23f2:	03 58       	subi	r16, 0x83	; 131
    23f4:	0f 00       	.word	0x000f	; ????
    23f6:	00 00       	nop
    23f8:	00 14       	cp	r0, r0
    23fa:	00 00       	nop
    23fc:	00 01       	movw	r0, r0
    23fe:	05 03       	mulsu	r16, r21
    2400:	14 00       	.word	0x0014	; ????
    2402:	80 00       	.word	0x0080	; ????
    2404:	ee 03       	fmulsu	r22, r22
    2406:	5c 0f       	add	r21, r28
    2408:	00 00       	nop
    240a:	00 00       	nop
    240c:	14 00       	.word	0x0014	; ????
    240e:	00 00       	nop
    2410:	01 05       	cpc	r16, r1
    2412:	03 16       	cp	r0, r19
    2414:	00 80       	ld	r0, Z
    2416:	00 ef       	ldi	r16, 0xF0	; 240
    2418:	03 5f       	subi	r16, 0xF3	; 243
    241a:	0f 00       	.word	0x000f	; ????
    241c:	00 00       	nop
    241e:	00 14       	cp	r0, r0
    2420:	00 00       	nop
    2422:	00 01       	movw	r0, r0
    2424:	05 03       	mulsu	r16, r21
    2426:	17 00       	.word	0x0017	; ????
    2428:	80 00       	.word	0x0080	; ????
    242a:	f0 03       	fmuls	r23, r16
    242c:	68 0f       	add	r22, r24
    242e:	00 00       	nop
    2430:	00 00       	nop
    2432:	14 00       	.word	0x0014	; ????
    2434:	00 00       	nop
    2436:	01 05       	cpc	r16, r1
    2438:	03 15       	cp	r16, r3
    243a:	00 80       	ld	r0, Z
    243c:	00 f1       	brcs	.+64     	; 0x247e <__DATA_REGION_LENGTH__+0xc7e>
    243e:	03 6c       	ori	r16, 0xC3	; 195
    2440:	0f 00       	.word	0x000f	; ????
    2442:	00 00       	nop
    2444:	00 14       	cp	r0, r0
    2446:	00 00       	nop
    2448:	00 01       	movw	r0, r0
    244a:	05 03       	mulsu	r16, r21
    244c:	a0 00       	.word	0x00a0	; ????
    244e:	80 00       	.word	0x0080	; ????
    2450:	f2 03       	fmuls	r23, r18
    2452:	72 0f       	add	r23, r18
    2454:	00 00       	nop
    2456:	00 00       	nop
    2458:	14 00       	.word	0x0014	; ????
    245a:	00 00       	nop
    245c:	01 05       	cpc	r16, r1
    245e:	03 a1       	ldd	r16, Z+35	; 0x23
    2460:	00 80       	ld	r0, Z
    2462:	00 f3       	brcs	.-64     	; 0x2424 <__DATA_REGION_LENGTH__+0xc24>
    2464:	03 78       	andi	r16, 0x83	; 131
    2466:	0f 00       	.word	0x000f	; ????
    2468:	00 00       	nop
    246a:	00 14       	cp	r0, r0
    246c:	00 00       	nop
    246e:	00 01       	movw	r0, r0
    2470:	05 03       	mulsu	r16, r21
    2472:	00 01       	movw	r0, r0
    2474:	80 00       	.word	0x0080	; ????
    2476:	f4 03       	fmuls	r23, r20
    2478:	7e 0f       	add	r23, r30
    247a:	00 00       	nop
    247c:	00 00       	nop
    247e:	14 00       	.word	0x0014	; ????
    2480:	00 00       	nop
    2482:	01 05       	cpc	r16, r1
    2484:	03 01       	movw	r0, r6
    2486:	01 80       	ldd	r0, Z+1	; 0x01
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
       0:	01 11       	cpse	r16, r1
       2:	01 25       	eor	r16, r1
       4:	0e 10       	cpse	r0, r14
       6:	06 00       	.word	0x0006	; ????
       8:	00 02       	muls	r16, r16
       a:	24 00       	.word	0x0024	; ????
       c:	03 0e       	add	r0, r19
       e:	0b 0b       	sbc	r16, r27
      10:	3e 0b       	sbc	r19, r30
      12:	00 00       	nop
      14:	03 24       	eor	r0, r3
      16:	00 03       	mulsu	r16, r16
      18:	0e 0b       	sbc	r16, r30
      1a:	0b 3e       	cpi	r16, 0xEB	; 235
      1c:	0b 00       	.word	0x000b	; ????
      1e:	00 04       	cpc	r0, r0
      20:	34 00       	.word	0x0034	; ????
      22:	03 0e       	add	r0, r19
      24:	3a 0b       	sbc	r19, r26
      26:	3b 0b       	sbc	r19, r27
      28:	49 13       	cpse	r20, r25
      2a:	3f 0c       	add	r3, r15
      2c:	02 0a       	sbc	r0, r18
      2e:	00 00       	nop
      30:	05 34       	cpi	r16, 0x45	; 69
      32:	00 03       	mulsu	r16, r16
      34:	0e 3a       	cpi	r16, 0xAE	; 174
      36:	0b 3b       	cpi	r16, 0xBB	; 187
      38:	0b 49       	sbci	r16, 0x9B	; 155
      3a:	13 3f       	cpi	r17, 0xF3	; 243
      3c:	0c 02       	muls	r16, r28
      3e:	0a 00       	.word	0x000a	; ????
      40:	00 06       	cpc	r0, r16
      42:	34 00       	.word	0x0034	; ????
      44:	03 0e       	add	r0, r19
      46:	3a 0b       	sbc	r19, r26
      48:	3b 0b       	sbc	r19, r27
      4a:	49 13       	cpse	r20, r25
      4c:	3f 0c       	add	r3, r15
      4e:	02 0a       	sbc	r0, r18
      50:	00 00       	nop
      52:	07 34       	cpi	r16, 0x47	; 71
      54:	00 03       	mulsu	r16, r16
      56:	0e 3a       	cpi	r16, 0xAE	; 174
      58:	0b 3b       	cpi	r16, 0xBB	; 187
      5a:	0b 49       	sbci	r16, 0x9B	; 155
      5c:	13 3f       	cpi	r17, 0xF3	; 243
      5e:	0c 02       	muls	r16, r28
      60:	0a 00       	.word	0x000a	; ????
      62:	00 08       	sbc	r0, r0
      64:	34 00       	.word	0x0034	; ????
      66:	03 0e       	add	r0, r19
      68:	3a 0b       	sbc	r19, r26
      6a:	3b 0b       	sbc	r19, r27
      6c:	49 13       	cpse	r20, r25
      6e:	3f 0c       	add	r3, r15
      70:	02 0a       	sbc	r0, r18
      72:	00 00       	nop
      74:	09 34       	cpi	r16, 0x49	; 73
      76:	00 03       	mulsu	r16, r16
      78:	0e 3a       	cpi	r16, 0xAE	; 174
      7a:	0b 3b       	cpi	r16, 0xBB	; 187
      7c:	0b 49       	sbci	r16, 0x9B	; 155
      7e:	13 3f       	cpi	r17, 0xF3	; 243
      80:	0c 02       	muls	r16, r28
      82:	0a 00       	.word	0x000a	; ????
      84:	00 0a       	sbc	r0, r16
      86:	34 00       	.word	0x0034	; ????
      88:	03 0e       	add	r0, r19
      8a:	3a 0b       	sbc	r19, r26
      8c:	3b 0b       	sbc	r19, r27
      8e:	49 13       	cpse	r20, r25
      90:	3f 0c       	add	r3, r15
      92:	02 0a       	sbc	r0, r18
      94:	00 00       	nop
      96:	0b 34       	cpi	r16, 0x4B	; 75
      98:	00 03       	mulsu	r16, r16
      9a:	0e 3a       	cpi	r16, 0xAE	; 174
      9c:	0b 3b       	cpi	r16, 0xBB	; 187
      9e:	0b 49       	sbci	r16, 0x9B	; 155
      a0:	13 3f       	cpi	r17, 0xF3	; 243
      a2:	0c 02       	muls	r16, r28
      a4:	0a 00       	.word	0x000a	; ????
      a6:	00 0c       	add	r0, r0
      a8:	34 00       	.word	0x0034	; ????
      aa:	03 0e       	add	r0, r19
      ac:	3a 0b       	sbc	r19, r26
      ae:	3b 0b       	sbc	r19, r27
      b0:	49 13       	cpse	r20, r25
      b2:	3f 0c       	add	r3, r15
      b4:	02 0a       	sbc	r0, r18
      b6:	00 00       	nop
      b8:	0d 34       	cpi	r16, 0x4D	; 77
      ba:	00 03       	mulsu	r16, r16
      bc:	0e 3a       	cpi	r16, 0xAE	; 174
      be:	0b 3b       	cpi	r16, 0xBB	; 187
      c0:	0b 49       	sbci	r16, 0x9B	; 155
      c2:	13 3f       	cpi	r17, 0xF3	; 243
      c4:	0c 02       	muls	r16, r28
      c6:	0a 00       	.word	0x000a	; ????
      c8:	00 0e       	add	r0, r16
      ca:	34 00       	.word	0x0034	; ????
      cc:	03 0e       	add	r0, r19
      ce:	3a 0b       	sbc	r19, r26
      d0:	3b 0b       	sbc	r19, r27
      d2:	49 13       	cpse	r20, r25
      d4:	3f 0c       	add	r3, r15
      d6:	02 0a       	sbc	r0, r18
      d8:	00 00       	nop
      da:	0f 34       	cpi	r16, 0x4F	; 79
      dc:	00 03       	mulsu	r16, r16
      de:	0e 3a       	cpi	r16, 0xAE	; 174
      e0:	0b 3b       	cpi	r16, 0xBB	; 187
      e2:	0b 49       	sbci	r16, 0x9B	; 155
      e4:	13 3f       	cpi	r17, 0xF3	; 243
      e6:	0c 02       	muls	r16, r28
      e8:	0a 00       	.word	0x000a	; ????
      ea:	00 10       	cpse	r0, r0
      ec:	34 00       	.word	0x0034	; ????
      ee:	03 0e       	add	r0, r19
      f0:	3a 0b       	sbc	r19, r26
      f2:	3b 0b       	sbc	r19, r27
      f4:	49 13       	cpse	r20, r25
      f6:	3f 0c       	add	r3, r15
      f8:	02 0a       	sbc	r0, r18
      fa:	00 00       	nop
      fc:	11 34       	cpi	r17, 0x41	; 65
      fe:	00 03       	mulsu	r16, r16
     100:	0e 3a       	cpi	r16, 0xAE	; 174
     102:	0b 3b       	cpi	r16, 0xBB	; 187
     104:	0b 49       	sbci	r16, 0x9B	; 155
     106:	13 3f       	cpi	r17, 0xF3	; 243
     108:	0c 02       	muls	r16, r28
     10a:	0a 00       	.word	0x000a	; ????
     10c:	00 12       	cpse	r0, r16
     10e:	34 00       	.word	0x0034	; ????
     110:	03 0e       	add	r0, r19
     112:	3a 0b       	sbc	r19, r26
     114:	3b 0b       	sbc	r19, r27
     116:	49 13       	cpse	r20, r25
     118:	3f 0c       	add	r3, r15
     11a:	02 0a       	sbc	r0, r18
     11c:	00 00       	nop
     11e:	13 34       	cpi	r17, 0x43	; 67
     120:	00 03       	mulsu	r16, r16
     122:	0e 3a       	cpi	r16, 0xAE	; 174
     124:	0b 3b       	cpi	r16, 0xBB	; 187
     126:	0b 49       	sbci	r16, 0x9B	; 155
     128:	13 3f       	cpi	r17, 0xF3	; 243
     12a:	0c 02       	muls	r16, r28
     12c:	0a 00       	.word	0x000a	; ????
     12e:	00 14       	cp	r0, r0
     130:	34 00       	.word	0x0034	; ????
     132:	03 0e       	add	r0, r19
     134:	3a 0b       	sbc	r19, r26
     136:	3b 0b       	sbc	r19, r27
     138:	49 13       	cpse	r20, r25
     13a:	3f 0c       	add	r3, r15
     13c:	02 0a       	sbc	r0, r18
     13e:	00 00       	nop
     140:	15 34       	cpi	r17, 0x45	; 69
     142:	00 03       	mulsu	r16, r16
     144:	0e 3a       	cpi	r16, 0xAE	; 174
     146:	0b 3b       	cpi	r16, 0xBB	; 187
     148:	0b 49       	sbci	r16, 0x9B	; 155
     14a:	13 3f       	cpi	r17, 0xF3	; 243
     14c:	0c 02       	muls	r16, r28
     14e:	0a 00       	.word	0x000a	; ????
     150:	00 16       	cp	r0, r16
     152:	34 00       	.word	0x0034	; ????
     154:	03 0e       	add	r0, r19
     156:	3a 0b       	sbc	r19, r26
     158:	3b 0b       	sbc	r19, r27
     15a:	49 13       	cpse	r20, r25
     15c:	3f 0c       	add	r3, r15
     15e:	02 0a       	sbc	r0, r18
     160:	00 00       	nop
     162:	17 34       	cpi	r17, 0x47	; 71
     164:	00 03       	mulsu	r16, r16
     166:	0e 3a       	cpi	r16, 0xAE	; 174
     168:	0b 3b       	cpi	r16, 0xBB	; 187
     16a:	0b 49       	sbci	r16, 0x9B	; 155
     16c:	13 3f       	cpi	r17, 0xF3	; 243
     16e:	0c 02       	muls	r16, r28
     170:	0a 00       	.word	0x000a	; ????
     172:	00 18       	sub	r0, r0
     174:	34 00       	.word	0x0034	; ????
     176:	03 0e       	add	r0, r19
     178:	3a 0b       	sbc	r19, r26
     17a:	3b 0b       	sbc	r19, r27
     17c:	49 13       	cpse	r20, r25
     17e:	3f 0c       	add	r3, r15
     180:	02 0a       	sbc	r0, r18
     182:	00 00       	nop
     184:	19 34       	cpi	r17, 0x49	; 73
     186:	00 03       	mulsu	r16, r16
     188:	0e 3a       	cpi	r16, 0xAE	; 174
     18a:	0b 3b       	cpi	r16, 0xBB	; 187
     18c:	0b 49       	sbci	r16, 0x9B	; 155
     18e:	13 3f       	cpi	r17, 0xF3	; 243
     190:	0c 02       	muls	r16, r28
     192:	0a 00       	.word	0x000a	; ????
     194:	00 1a       	sub	r0, r16
     196:	34 00       	.word	0x0034	; ????
     198:	03 0e       	add	r0, r19
     19a:	3a 0b       	sbc	r19, r26
     19c:	3b 0b       	sbc	r19, r27
     19e:	49 13       	cpse	r20, r25
     1a0:	3f 0c       	add	r3, r15
     1a2:	02 0a       	sbc	r0, r18
     1a4:	00 00       	nop
     1a6:	1b 34       	cpi	r17, 0x4B	; 75
     1a8:	00 03       	mulsu	r16, r16
     1aa:	0e 3a       	cpi	r16, 0xAE	; 174
     1ac:	0b 3b       	cpi	r16, 0xBB	; 187
     1ae:	0b 49       	sbci	r16, 0x9B	; 155
     1b0:	13 3f       	cpi	r17, 0xF3	; 243
     1b2:	0c 02       	muls	r16, r28
     1b4:	0a 00       	.word	0x000a	; ????
     1b6:	00 1c       	adc	r0, r0
     1b8:	34 00       	.word	0x0034	; ????
     1ba:	03 0e       	add	r0, r19
     1bc:	3a 0b       	sbc	r19, r26
     1be:	3b 0b       	sbc	r19, r27
     1c0:	49 13       	cpse	r20, r25
     1c2:	3f 0c       	add	r3, r15
     1c4:	02 0a       	sbc	r0, r18
     1c6:	00 00       	nop
     1c8:	1d 34       	cpi	r17, 0x4D	; 77
     1ca:	00 03       	mulsu	r16, r16
     1cc:	0e 3a       	cpi	r16, 0xAE	; 174
     1ce:	0b 3b       	cpi	r16, 0xBB	; 187
     1d0:	0b 49       	sbci	r16, 0x9B	; 155
     1d2:	13 3f       	cpi	r17, 0xF3	; 243
     1d4:	0c 02       	muls	r16, r28
     1d6:	0a 00       	.word	0x000a	; ????
     1d8:	00 1e       	adc	r0, r16
     1da:	34 00       	.word	0x0034	; ????
     1dc:	03 0e       	add	r0, r19
     1de:	3a 0b       	sbc	r19, r26
     1e0:	3b 0b       	sbc	r19, r27
     1e2:	49 13       	cpse	r20, r25
     1e4:	3f 0c       	add	r3, r15
     1e6:	02 0a       	sbc	r0, r18
     1e8:	00 00       	nop
     1ea:	1f 34       	cpi	r17, 0x4F	; 79
     1ec:	00 03       	mulsu	r16, r16
     1ee:	0e 3a       	cpi	r16, 0xAE	; 174
     1f0:	0b 3b       	cpi	r16, 0xBB	; 187
     1f2:	0b 49       	sbci	r16, 0x9B	; 155
     1f4:	13 3f       	cpi	r17, 0xF3	; 243
     1f6:	0c 02       	muls	r16, r28
     1f8:	0a 00       	.word	0x000a	; ????
     1fa:	00 20       	and	r0, r0
     1fc:	34 00       	.word	0x0034	; ????
     1fe:	03 0e       	add	r0, r19
     200:	3a 0b       	sbc	r19, r26
     202:	3b 0b       	sbc	r19, r27
     204:	49 13       	cpse	r20, r25
     206:	3f 0c       	add	r3, r15
     208:	02 0a       	sbc	r0, r18
     20a:	00 00       	nop
     20c:	21 34       	cpi	r18, 0x41	; 65
     20e:	00 03       	mulsu	r16, r16
     210:	0e 3a       	cpi	r16, 0xAE	; 174
     212:	0b 3b       	cpi	r16, 0xBB	; 187
     214:	0b 49       	sbci	r16, 0x9B	; 155
     216:	13 3f       	cpi	r17, 0xF3	; 243
     218:	0c 02       	muls	r16, r28
     21a:	0a 00       	.word	0x000a	; ????
     21c:	00 22       	and	r0, r16
     21e:	34 00       	.word	0x0034	; ????
     220:	03 0e       	add	r0, r19
     222:	3a 0b       	sbc	r19, r26
     224:	3b 0b       	sbc	r19, r27
     226:	49 13       	cpse	r20, r25
     228:	3f 0c       	add	r3, r15
     22a:	02 0a       	sbc	r0, r18
     22c:	00 00       	nop
     22e:	23 34       	cpi	r18, 0x43	; 67
     230:	00 03       	mulsu	r16, r16
     232:	0e 3a       	cpi	r16, 0xAE	; 174
     234:	0b 3b       	cpi	r16, 0xBB	; 187
     236:	0b 49       	sbci	r16, 0x9B	; 155
     238:	13 3f       	cpi	r17, 0xF3	; 243
     23a:	0c 02       	muls	r16, r28
     23c:	0a 00       	.word	0x000a	; ????
     23e:	00 24       	eor	r0, r0
     240:	34 00       	.word	0x0034	; ????
     242:	03 0e       	add	r0, r19
     244:	3a 0b       	sbc	r19, r26
     246:	3b 0b       	sbc	r19, r27
     248:	49 13       	cpse	r20, r25
     24a:	3f 0c       	add	r3, r15
     24c:	02 0a       	sbc	r0, r18
     24e:	00 00       	nop
     250:	25 34       	cpi	r18, 0x45	; 69
     252:	00 03       	mulsu	r16, r16
     254:	0e 3a       	cpi	r16, 0xAE	; 174
     256:	0b 3b       	cpi	r16, 0xBB	; 187
     258:	0b 49       	sbci	r16, 0x9B	; 155
     25a:	13 3f       	cpi	r17, 0xF3	; 243
     25c:	0c 02       	muls	r16, r28
     25e:	0a 00       	.word	0x000a	; ????
     260:	00 26       	eor	r0, r16
     262:	34 00       	.word	0x0034	; ????
     264:	03 0e       	add	r0, r19
     266:	3a 0b       	sbc	r19, r26
     268:	3b 0b       	sbc	r19, r27
     26a:	49 13       	cpse	r20, r25
     26c:	3f 0c       	add	r3, r15
     26e:	02 0a       	sbc	r0, r18
     270:	00 00       	nop
     272:	27 34       	cpi	r18, 0x47	; 71
     274:	00 03       	mulsu	r16, r16
     276:	0e 3a       	cpi	r16, 0xAE	; 174
     278:	0b 3b       	cpi	r16, 0xBB	; 187
     27a:	0b 49       	sbci	r16, 0x9B	; 155
     27c:	13 3f       	cpi	r17, 0xF3	; 243
     27e:	0c 02       	muls	r16, r28
     280:	0a 00       	.word	0x000a	; ????
     282:	00 28       	or	r0, r0
     284:	34 00       	.word	0x0034	; ????
     286:	03 0e       	add	r0, r19
     288:	3a 0b       	sbc	r19, r26
     28a:	3b 0b       	sbc	r19, r27
     28c:	49 13       	cpse	r20, r25
     28e:	3f 0c       	add	r3, r15
     290:	02 0a       	sbc	r0, r18
     292:	00 00       	nop
     294:	29 34       	cpi	r18, 0x49	; 73
     296:	00 03       	mulsu	r16, r16
     298:	0e 3a       	cpi	r16, 0xAE	; 174
     29a:	0b 3b       	cpi	r16, 0xBB	; 187
     29c:	0b 49       	sbci	r16, 0x9B	; 155
     29e:	13 3f       	cpi	r17, 0xF3	; 243
     2a0:	0c 02       	muls	r16, r28
     2a2:	0a 00       	.word	0x000a	; ????
     2a4:	00 2a       	or	r0, r16
     2a6:	34 00       	.word	0x0034	; ????
     2a8:	03 0e       	add	r0, r19
     2aa:	3a 0b       	sbc	r19, r26
     2ac:	3b 0b       	sbc	r19, r27
     2ae:	49 13       	cpse	r20, r25
     2b0:	3f 0c       	add	r3, r15
     2b2:	02 0a       	sbc	r0, r18
     2b4:	00 00       	nop
     2b6:	2b 34       	cpi	r18, 0x4B	; 75
     2b8:	00 03       	mulsu	r16, r16
     2ba:	0e 3a       	cpi	r16, 0xAE	; 174
     2bc:	0b 3b       	cpi	r16, 0xBB	; 187
     2be:	0b 49       	sbci	r16, 0x9B	; 155
     2c0:	13 3f       	cpi	r17, 0xF3	; 243
     2c2:	0c 02       	muls	r16, r28
     2c4:	0a 00       	.word	0x000a	; ????
     2c6:	00 2c       	mov	r0, r0
     2c8:	34 00       	.word	0x0034	; ????
     2ca:	03 0e       	add	r0, r19
     2cc:	3a 0b       	sbc	r19, r26
     2ce:	3b 0b       	sbc	r19, r27
     2d0:	49 13       	cpse	r20, r25
     2d2:	3f 0c       	add	r3, r15
     2d4:	02 0a       	sbc	r0, r18
     2d6:	00 00       	nop
     2d8:	2d 34       	cpi	r18, 0x4D	; 77
     2da:	00 03       	mulsu	r16, r16
     2dc:	0e 3a       	cpi	r16, 0xAE	; 174
     2de:	0b 3b       	cpi	r16, 0xBB	; 187
     2e0:	0b 49       	sbci	r16, 0x9B	; 155
     2e2:	13 3f       	cpi	r17, 0xF3	; 243
     2e4:	0c 02       	muls	r16, r28
     2e6:	0a 00       	.word	0x000a	; ????
     2e8:	00 2e       	mov	r0, r16
     2ea:	34 00       	.word	0x0034	; ????
     2ec:	03 0e       	add	r0, r19
     2ee:	3a 0b       	sbc	r19, r26
     2f0:	3b 0b       	sbc	r19, r27
     2f2:	49 13       	cpse	r20, r25
     2f4:	3f 0c       	add	r3, r15
     2f6:	02 0a       	sbc	r0, r18
     2f8:	00 00       	nop
     2fa:	2f 34       	cpi	r18, 0x4F	; 79
     2fc:	00 03       	mulsu	r16, r16
     2fe:	0e 3a       	cpi	r16, 0xAE	; 174
     300:	0b 3b       	cpi	r16, 0xBB	; 187
     302:	0b 49       	sbci	r16, 0x9B	; 155
     304:	13 3f       	cpi	r17, 0xF3	; 243
     306:	0c 02       	muls	r16, r28
     308:	0a 00       	.word	0x000a	; ????
     30a:	00 30       	cpi	r16, 0x00	; 0
     30c:	34 00       	.word	0x0034	; ????
     30e:	03 0e       	add	r0, r19
     310:	3a 0b       	sbc	r19, r26
     312:	3b 0b       	sbc	r19, r27
     314:	49 13       	cpse	r20, r25
     316:	3f 0c       	add	r3, r15
     318:	02 0a       	sbc	r0, r18
     31a:	00 00       	nop
     31c:	31 34       	cpi	r19, 0x41	; 65
     31e:	00 03       	mulsu	r16, r16
     320:	0e 3a       	cpi	r16, 0xAE	; 174
     322:	0b 3b       	cpi	r16, 0xBB	; 187
     324:	0b 49       	sbci	r16, 0x9B	; 155
     326:	13 3f       	cpi	r17, 0xF3	; 243
     328:	0c 02       	muls	r16, r28
     32a:	0a 00       	.word	0x000a	; ????
     32c:	00 32       	cpi	r16, 0x20	; 32
     32e:	34 00       	.word	0x0034	; ????
     330:	03 0e       	add	r0, r19
     332:	3a 0b       	sbc	r19, r26
     334:	3b 0b       	sbc	r19, r27
     336:	49 13       	cpse	r20, r25
     338:	3f 0c       	add	r3, r15
     33a:	02 0a       	sbc	r0, r18
     33c:	00 00       	nop
     33e:	33 34       	cpi	r19, 0x43	; 67
     340:	00 03       	mulsu	r16, r16
     342:	0e 3a       	cpi	r16, 0xAE	; 174
     344:	0b 3b       	cpi	r16, 0xBB	; 187
     346:	0b 49       	sbci	r16, 0x9B	; 155
     348:	13 3f       	cpi	r17, 0xF3	; 243
     34a:	0c 02       	muls	r16, r28
     34c:	0a 00       	.word	0x000a	; ????
     34e:	00 34       	cpi	r16, 0x40	; 64
     350:	34 00       	.word	0x0034	; ????
     352:	03 0e       	add	r0, r19
     354:	3a 0b       	sbc	r19, r26
     356:	3b 0b       	sbc	r19, r27
     358:	49 13       	cpse	r20, r25
     35a:	3f 0c       	add	r3, r15
     35c:	02 0a       	sbc	r0, r18
     35e:	00 00       	nop
     360:	35 34       	cpi	r19, 0x45	; 69
     362:	00 03       	mulsu	r16, r16
     364:	0e 3a       	cpi	r16, 0xAE	; 174
     366:	0b 3b       	cpi	r16, 0xBB	; 187
     368:	0b 49       	sbci	r16, 0x9B	; 155
     36a:	13 3f       	cpi	r17, 0xF3	; 243
     36c:	0c 02       	muls	r16, r28
     36e:	0a 00       	.word	0x000a	; ????
     370:	00 36       	cpi	r16, 0x60	; 96
     372:	34 00       	.word	0x0034	; ????
     374:	03 0e       	add	r0, r19
     376:	3a 0b       	sbc	r19, r26
     378:	3b 0b       	sbc	r19, r27
     37a:	49 13       	cpse	r20, r25
     37c:	3f 0c       	add	r3, r15
     37e:	02 0a       	sbc	r0, r18
     380:	00 00       	nop
     382:	37 34       	cpi	r19, 0x47	; 71
     384:	00 03       	mulsu	r16, r16
     386:	0e 3a       	cpi	r16, 0xAE	; 174
     388:	0b 3b       	cpi	r16, 0xBB	; 187
     38a:	0b 49       	sbci	r16, 0x9B	; 155
     38c:	13 3f       	cpi	r17, 0xF3	; 243
     38e:	0c 02       	muls	r16, r28
     390:	0a 00       	.word	0x000a	; ????
     392:	00 38       	cpi	r16, 0x80	; 128
     394:	34 00       	.word	0x0034	; ????
     396:	03 0e       	add	r0, r19
     398:	3a 0b       	sbc	r19, r26
     39a:	3b 0b       	sbc	r19, r27
     39c:	49 13       	cpse	r20, r25
     39e:	3f 0c       	add	r3, r15
     3a0:	02 0a       	sbc	r0, r18
     3a2:	00 00       	nop
     3a4:	39 34       	cpi	r19, 0x49	; 73
     3a6:	00 03       	mulsu	r16, r16
     3a8:	0e 3a       	cpi	r16, 0xAE	; 174
     3aa:	0b 3b       	cpi	r16, 0xBB	; 187
     3ac:	0b 49       	sbci	r16, 0x9B	; 155
     3ae:	13 3f       	cpi	r17, 0xF3	; 243
     3b0:	0c 02       	muls	r16, r28
     3b2:	0a 00       	.word	0x000a	; ????
     3b4:	00 3a       	cpi	r16, 0xA0	; 160
     3b6:	34 00       	.word	0x0034	; ????
     3b8:	03 0e       	add	r0, r19
     3ba:	3a 0b       	sbc	r19, r26
     3bc:	3b 0b       	sbc	r19, r27
     3be:	49 13       	cpse	r20, r25
     3c0:	3f 0c       	add	r3, r15
     3c2:	02 0a       	sbc	r0, r18
     3c4:	00 00       	nop
     3c6:	3b 34       	cpi	r19, 0x4B	; 75
     3c8:	00 03       	mulsu	r16, r16
     3ca:	0e 3a       	cpi	r16, 0xAE	; 174
     3cc:	0b 3b       	cpi	r16, 0xBB	; 187
     3ce:	0b 49       	sbci	r16, 0x9B	; 155
     3d0:	13 3f       	cpi	r17, 0xF3	; 243
     3d2:	0c 02       	muls	r16, r28
     3d4:	0a 00       	.word	0x000a	; ????
     3d6:	00 3c       	cpi	r16, 0xC0	; 192
     3d8:	34 00       	.word	0x0034	; ????
     3da:	03 0e       	add	r0, r19
     3dc:	3a 0b       	sbc	r19, r26
     3de:	3b 0b       	sbc	r19, r27
     3e0:	49 13       	cpse	r20, r25
     3e2:	3f 0c       	add	r3, r15
     3e4:	02 0a       	sbc	r0, r18
     3e6:	00 00       	nop
     3e8:	3d 34       	cpi	r19, 0x4D	; 77
     3ea:	00 03       	mulsu	r16, r16
     3ec:	0e 3a       	cpi	r16, 0xAE	; 174
     3ee:	0b 3b       	cpi	r16, 0xBB	; 187
     3f0:	0b 49       	sbci	r16, 0x9B	; 155
     3f2:	13 3f       	cpi	r17, 0xF3	; 243
     3f4:	0c 02       	muls	r16, r28
     3f6:	0a 00       	.word	0x000a	; ????
     3f8:	00 3e       	cpi	r16, 0xE0	; 224
     3fa:	34 00       	.word	0x0034	; ????
     3fc:	03 0e       	add	r0, r19
     3fe:	3a 0b       	sbc	r19, r26
     400:	3b 0b       	sbc	r19, r27
     402:	49 13       	cpse	r20, r25
     404:	3f 0c       	add	r3, r15
     406:	02 0a       	sbc	r0, r18
     408:	00 00       	nop
     40a:	3f 34       	cpi	r19, 0x4F	; 79
     40c:	00 03       	mulsu	r16, r16
     40e:	0e 3a       	cpi	r16, 0xAE	; 174
     410:	0b 3b       	cpi	r16, 0xBB	; 187
     412:	0b 49       	sbci	r16, 0x9B	; 155
     414:	13 3f       	cpi	r17, 0xF3	; 243
     416:	0c 02       	muls	r16, r28
     418:	0a 00       	.word	0x000a	; ????
     41a:	00 40       	sbci	r16, 0x00	; 0
     41c:	34 00       	.word	0x0034	; ????
     41e:	03 0e       	add	r0, r19
     420:	3a 0b       	sbc	r19, r26
     422:	3b 0b       	sbc	r19, r27
     424:	49 13       	cpse	r20, r25
     426:	3f 0c       	add	r3, r15
     428:	02 0a       	sbc	r0, r18
     42a:	00 00       	nop
     42c:	41 34       	cpi	r20, 0x41	; 65
     42e:	00 03       	mulsu	r16, r16
     430:	0e 3a       	cpi	r16, 0xAE	; 174
     432:	0b 3b       	cpi	r16, 0xBB	; 187
     434:	0b 49       	sbci	r16, 0x9B	; 155
     436:	13 3f       	cpi	r17, 0xF3	; 243
     438:	0c 02       	muls	r16, r28
     43a:	0a 00       	.word	0x000a	; ????
     43c:	00 42       	sbci	r16, 0x20	; 32
     43e:	34 00       	.word	0x0034	; ????
     440:	03 0e       	add	r0, r19
     442:	3a 0b       	sbc	r19, r26
     444:	3b 0b       	sbc	r19, r27
     446:	49 13       	cpse	r20, r25
     448:	3f 0c       	add	r3, r15
     44a:	02 0a       	sbc	r0, r18
     44c:	00 00       	nop
     44e:	43 34       	cpi	r20, 0x43	; 67
     450:	00 03       	mulsu	r16, r16
     452:	0e 3a       	cpi	r16, 0xAE	; 174
     454:	0b 3b       	cpi	r16, 0xBB	; 187
     456:	0b 49       	sbci	r16, 0x9B	; 155
     458:	13 3f       	cpi	r17, 0xF3	; 243
     45a:	0c 02       	muls	r16, r28
     45c:	0a 00       	.word	0x000a	; ????
     45e:	00 44       	sbci	r16, 0x40	; 64
     460:	34 00       	.word	0x0034	; ????
     462:	03 0e       	add	r0, r19
     464:	3a 0b       	sbc	r19, r26
     466:	3b 0b       	sbc	r19, r27
     468:	49 13       	cpse	r20, r25
     46a:	3f 0c       	add	r3, r15
     46c:	02 0a       	sbc	r0, r18
     46e:	00 00       	nop
     470:	45 34       	cpi	r20, 0x45	; 69
     472:	00 03       	mulsu	r16, r16
     474:	0e 3a       	cpi	r16, 0xAE	; 174
     476:	0b 3b       	cpi	r16, 0xBB	; 187
     478:	0b 49       	sbci	r16, 0x9B	; 155
     47a:	13 3f       	cpi	r17, 0xF3	; 243
     47c:	0c 02       	muls	r16, r28
     47e:	0a 00       	.word	0x000a	; ????
     480:	00 46       	sbci	r16, 0x60	; 96
     482:	34 00       	.word	0x0034	; ????
     484:	03 0e       	add	r0, r19
     486:	3a 0b       	sbc	r19, r26
     488:	3b 0b       	sbc	r19, r27
     48a:	49 13       	cpse	r20, r25
     48c:	3f 0c       	add	r3, r15
     48e:	02 0a       	sbc	r0, r18
     490:	00 00       	nop
     492:	47 34       	cpi	r20, 0x47	; 71
     494:	00 03       	mulsu	r16, r16
     496:	0e 3a       	cpi	r16, 0xAE	; 174
     498:	0b 3b       	cpi	r16, 0xBB	; 187
     49a:	0b 49       	sbci	r16, 0x9B	; 155
     49c:	13 3f       	cpi	r17, 0xF3	; 243
     49e:	0c 02       	muls	r16, r28
     4a0:	0a 00       	.word	0x000a	; ????
     4a2:	00 48       	sbci	r16, 0x80	; 128
     4a4:	34 00       	.word	0x0034	; ????
     4a6:	03 0e       	add	r0, r19
     4a8:	3a 0b       	sbc	r19, r26
     4aa:	3b 0b       	sbc	r19, r27
     4ac:	49 13       	cpse	r20, r25
     4ae:	3f 0c       	add	r3, r15
     4b0:	02 0a       	sbc	r0, r18
     4b2:	00 00       	nop
     4b4:	49 34       	cpi	r20, 0x49	; 73
     4b6:	00 03       	mulsu	r16, r16
     4b8:	0e 3a       	cpi	r16, 0xAE	; 174
     4ba:	0b 3b       	cpi	r16, 0xBB	; 187
     4bc:	0b 49       	sbci	r16, 0x9B	; 155
     4be:	13 3f       	cpi	r17, 0xF3	; 243
     4c0:	0c 02       	muls	r16, r28
     4c2:	0a 00       	.word	0x000a	; ????
     4c4:	00 4a       	sbci	r16, 0xA0	; 160
     4c6:	34 00       	.word	0x0034	; ????
     4c8:	03 0e       	add	r0, r19
     4ca:	3a 0b       	sbc	r19, r26
     4cc:	3b 0b       	sbc	r19, r27
     4ce:	49 13       	cpse	r20, r25
     4d0:	3f 0c       	add	r3, r15
     4d2:	02 0a       	sbc	r0, r18
     4d4:	00 00       	nop
     4d6:	4b 34       	cpi	r20, 0x4B	; 75
     4d8:	00 03       	mulsu	r16, r16
     4da:	0e 3a       	cpi	r16, 0xAE	; 174
     4dc:	0b 3b       	cpi	r16, 0xBB	; 187
     4de:	0b 49       	sbci	r16, 0x9B	; 155
     4e0:	13 3f       	cpi	r17, 0xF3	; 243
     4e2:	0c 02       	muls	r16, r28
     4e4:	0a 00       	.word	0x000a	; ????
     4e6:	00 4c       	sbci	r16, 0xC0	; 192
     4e8:	34 00       	.word	0x0034	; ????
     4ea:	03 0e       	add	r0, r19
     4ec:	3a 0b       	sbc	r19, r26
     4ee:	3b 0b       	sbc	r19, r27
     4f0:	49 13       	cpse	r20, r25
     4f2:	3f 0c       	add	r3, r15
     4f4:	02 0a       	sbc	r0, r18
     4f6:	00 00       	nop
     4f8:	4d 34       	cpi	r20, 0x4D	; 77
     4fa:	00 03       	mulsu	r16, r16
     4fc:	0e 3a       	cpi	r16, 0xAE	; 174
     4fe:	0b 3b       	cpi	r16, 0xBB	; 187
     500:	0b 49       	sbci	r16, 0x9B	; 155
     502:	13 3f       	cpi	r17, 0xF3	; 243
     504:	0c 02       	muls	r16, r28
     506:	0a 00       	.word	0x000a	; ????
     508:	00 4e       	sbci	r16, 0xE0	; 224
     50a:	34 00       	.word	0x0034	; ????
     50c:	03 0e       	add	r0, r19
     50e:	3a 0b       	sbc	r19, r26
     510:	3b 0b       	sbc	r19, r27
     512:	49 13       	cpse	r20, r25
     514:	3f 0c       	add	r3, r15
     516:	02 0a       	sbc	r0, r18
     518:	00 00       	nop
     51a:	4f 34       	cpi	r20, 0x4F	; 79
     51c:	00 03       	mulsu	r16, r16
     51e:	0e 3a       	cpi	r16, 0xAE	; 174
     520:	0b 3b       	cpi	r16, 0xBB	; 187
     522:	0b 49       	sbci	r16, 0x9B	; 155
     524:	13 3f       	cpi	r17, 0xF3	; 243
     526:	0c 02       	muls	r16, r28
     528:	0a 00       	.word	0x000a	; ????
     52a:	00 50       	subi	r16, 0x00	; 0
     52c:	34 00       	.word	0x0034	; ????
     52e:	03 0e       	add	r0, r19
     530:	3a 0b       	sbc	r19, r26
     532:	3b 0b       	sbc	r19, r27
     534:	49 13       	cpse	r20, r25
     536:	3f 0c       	add	r3, r15
     538:	02 0a       	sbc	r0, r18
     53a:	00 00       	nop
     53c:	51 34       	cpi	r21, 0x41	; 65
     53e:	00 03       	mulsu	r16, r16
     540:	0e 3a       	cpi	r16, 0xAE	; 174
     542:	0b 3b       	cpi	r16, 0xBB	; 187
     544:	0b 49       	sbci	r16, 0x9B	; 155
     546:	13 3f       	cpi	r17, 0xF3	; 243
     548:	0c 02       	muls	r16, r28
     54a:	0a 00       	.word	0x000a	; ????
     54c:	00 52       	subi	r16, 0x20	; 32
     54e:	34 00       	.word	0x0034	; ????
     550:	03 0e       	add	r0, r19
     552:	3a 0b       	sbc	r19, r26
     554:	3b 0b       	sbc	r19, r27
     556:	49 13       	cpse	r20, r25
     558:	3f 0c       	add	r3, r15
     55a:	02 0a       	sbc	r0, r18
     55c:	00 00       	nop
     55e:	53 34       	cpi	r21, 0x43	; 67
     560:	00 03       	mulsu	r16, r16
     562:	0e 3a       	cpi	r16, 0xAE	; 174
     564:	0b 3b       	cpi	r16, 0xBB	; 187
     566:	0b 49       	sbci	r16, 0x9B	; 155
     568:	13 3f       	cpi	r17, 0xF3	; 243
     56a:	0c 02       	muls	r16, r28
     56c:	0a 00       	.word	0x000a	; ????
     56e:	00 54       	subi	r16, 0x40	; 64
     570:	34 00       	.word	0x0034	; ????
     572:	03 0e       	add	r0, r19
     574:	3a 0b       	sbc	r19, r26
     576:	3b 0b       	sbc	r19, r27
     578:	49 13       	cpse	r20, r25
     57a:	3f 0c       	add	r3, r15
     57c:	02 0a       	sbc	r0, r18
     57e:	00 00       	nop
     580:	55 34       	cpi	r21, 0x45	; 69
     582:	00 03       	mulsu	r16, r16
     584:	0e 3a       	cpi	r16, 0xAE	; 174
     586:	0b 3b       	cpi	r16, 0xBB	; 187
     588:	0b 49       	sbci	r16, 0x9B	; 155
     58a:	13 3f       	cpi	r17, 0xF3	; 243
     58c:	0c 02       	muls	r16, r28
     58e:	0a 00       	.word	0x000a	; ????
     590:	00 56       	subi	r16, 0x60	; 96
     592:	34 00       	.word	0x0034	; ????
     594:	03 0e       	add	r0, r19
     596:	3a 0b       	sbc	r19, r26
     598:	3b 0b       	sbc	r19, r27
     59a:	49 13       	cpse	r20, r25
     59c:	3f 0c       	add	r3, r15
     59e:	02 0a       	sbc	r0, r18
     5a0:	00 00       	nop
     5a2:	57 34       	cpi	r21, 0x47	; 71
     5a4:	00 03       	mulsu	r16, r16
     5a6:	0e 3a       	cpi	r16, 0xAE	; 174
     5a8:	0b 3b       	cpi	r16, 0xBB	; 187
     5aa:	0b 49       	sbci	r16, 0x9B	; 155
     5ac:	13 3f       	cpi	r17, 0xF3	; 243
     5ae:	0c 02       	muls	r16, r28
     5b0:	0a 00       	.word	0x000a	; ????
     5b2:	00 58       	subi	r16, 0x80	; 128
     5b4:	34 00       	.word	0x0034	; ????
     5b6:	03 0e       	add	r0, r19
     5b8:	3a 0b       	sbc	r19, r26
     5ba:	3b 0b       	sbc	r19, r27
     5bc:	49 13       	cpse	r20, r25
     5be:	3f 0c       	add	r3, r15
     5c0:	02 0a       	sbc	r0, r18
     5c2:	00 00       	nop
     5c4:	59 34       	cpi	r21, 0x49	; 73
     5c6:	00 03       	mulsu	r16, r16
     5c8:	0e 3a       	cpi	r16, 0xAE	; 174
     5ca:	0b 3b       	cpi	r16, 0xBB	; 187
     5cc:	0b 49       	sbci	r16, 0x9B	; 155
     5ce:	13 3f       	cpi	r17, 0xF3	; 243
     5d0:	0c 02       	muls	r16, r28
     5d2:	0a 00       	.word	0x000a	; ????
     5d4:	00 5a       	subi	r16, 0xA0	; 160
     5d6:	34 00       	.word	0x0034	; ????
     5d8:	03 0e       	add	r0, r19
     5da:	3a 0b       	sbc	r19, r26
     5dc:	3b 0b       	sbc	r19, r27
     5de:	49 13       	cpse	r20, r25
     5e0:	3f 0c       	add	r3, r15
     5e2:	02 0a       	sbc	r0, r18
     5e4:	00 00       	nop
     5e6:	5b 34       	cpi	r21, 0x4B	; 75
     5e8:	00 03       	mulsu	r16, r16
     5ea:	0e 3a       	cpi	r16, 0xAE	; 174
     5ec:	0b 3b       	cpi	r16, 0xBB	; 187
     5ee:	0b 49       	sbci	r16, 0x9B	; 155
     5f0:	13 3f       	cpi	r17, 0xF3	; 243
     5f2:	0c 02       	muls	r16, r28
     5f4:	0a 00       	.word	0x000a	; ????
     5f6:	00 5c       	subi	r16, 0xC0	; 192
     5f8:	34 00       	.word	0x0034	; ????
     5fa:	03 0e       	add	r0, r19
     5fc:	3a 0b       	sbc	r19, r26
     5fe:	3b 0b       	sbc	r19, r27
     600:	49 13       	cpse	r20, r25
     602:	3f 0c       	add	r3, r15
     604:	02 0a       	sbc	r0, r18
     606:	00 00       	nop
     608:	5d 34       	cpi	r21, 0x4D	; 77
     60a:	00 03       	mulsu	r16, r16
     60c:	0e 3a       	cpi	r16, 0xAE	; 174
     60e:	0b 3b       	cpi	r16, 0xBB	; 187
     610:	0b 49       	sbci	r16, 0x9B	; 155
     612:	13 3f       	cpi	r17, 0xF3	; 243
     614:	0c 02       	muls	r16, r28
     616:	0a 00       	.word	0x000a	; ????
     618:	00 5e       	subi	r16, 0xE0	; 224
     61a:	34 00       	.word	0x0034	; ????
     61c:	03 0e       	add	r0, r19
     61e:	3a 0b       	sbc	r19, r26
     620:	3b 0b       	sbc	r19, r27
     622:	49 13       	cpse	r20, r25
     624:	3f 0c       	add	r3, r15
     626:	02 0a       	sbc	r0, r18
     628:	00 00       	nop
     62a:	5f 34       	cpi	r21, 0x4F	; 79
     62c:	00 03       	mulsu	r16, r16
     62e:	0e 3a       	cpi	r16, 0xAE	; 174
     630:	0b 3b       	cpi	r16, 0xBB	; 187
     632:	0b 49       	sbci	r16, 0x9B	; 155
     634:	13 3f       	cpi	r17, 0xF3	; 243
     636:	0c 02       	muls	r16, r28
     638:	0a 00       	.word	0x000a	; ????
     63a:	00 60       	ori	r16, 0x00	; 0
     63c:	34 00       	.word	0x0034	; ????
     63e:	03 0e       	add	r0, r19
     640:	3a 0b       	sbc	r19, r26
     642:	3b 0b       	sbc	r19, r27
     644:	49 13       	cpse	r20, r25
     646:	3f 0c       	add	r3, r15
     648:	02 0a       	sbc	r0, r18
     64a:	00 00       	nop
     64c:	61 34       	cpi	r22, 0x41	; 65
     64e:	00 03       	mulsu	r16, r16
     650:	0e 3a       	cpi	r16, 0xAE	; 174
     652:	0b 3b       	cpi	r16, 0xBB	; 187
     654:	0b 49       	sbci	r16, 0x9B	; 155
     656:	13 3f       	cpi	r17, 0xF3	; 243
     658:	0c 02       	muls	r16, r28
     65a:	0a 00       	.word	0x000a	; ????
     65c:	00 62       	ori	r16, 0x20	; 32
     65e:	34 00       	.word	0x0034	; ????
     660:	03 0e       	add	r0, r19
     662:	3a 0b       	sbc	r19, r26
     664:	3b 0b       	sbc	r19, r27
     666:	49 13       	cpse	r20, r25
     668:	3f 0c       	add	r3, r15
     66a:	02 0a       	sbc	r0, r18
     66c:	00 00       	nop
     66e:	63 34       	cpi	r22, 0x43	; 67
     670:	00 03       	mulsu	r16, r16
     672:	0e 3a       	cpi	r16, 0xAE	; 174
     674:	0b 3b       	cpi	r16, 0xBB	; 187
     676:	0b 49       	sbci	r16, 0x9B	; 155
     678:	13 3f       	cpi	r17, 0xF3	; 243
     67a:	0c 02       	muls	r16, r28
     67c:	0a 00       	.word	0x000a	; ????
     67e:	00 64       	ori	r16, 0x40	; 64
     680:	34 00       	.word	0x0034	; ????
     682:	03 0e       	add	r0, r19
     684:	3a 0b       	sbc	r19, r26
     686:	3b 0b       	sbc	r19, r27
     688:	49 13       	cpse	r20, r25
     68a:	3f 0c       	add	r3, r15
     68c:	02 0a       	sbc	r0, r18
     68e:	00 00       	nop
     690:	65 34       	cpi	r22, 0x45	; 69
     692:	00 03       	mulsu	r16, r16
     694:	0e 3a       	cpi	r16, 0xAE	; 174
     696:	0b 3b       	cpi	r16, 0xBB	; 187
     698:	0b 49       	sbci	r16, 0x9B	; 155
     69a:	13 3f       	cpi	r17, 0xF3	; 243
     69c:	0c 02       	muls	r16, r28
     69e:	0a 00       	.word	0x000a	; ????
     6a0:	00 66       	ori	r16, 0x60	; 96
     6a2:	34 00       	.word	0x0034	; ????
     6a4:	03 0e       	add	r0, r19
     6a6:	3a 0b       	sbc	r19, r26
     6a8:	3b 0b       	sbc	r19, r27
     6aa:	49 13       	cpse	r20, r25
     6ac:	3f 0c       	add	r3, r15
     6ae:	02 0a       	sbc	r0, r18
     6b0:	00 00       	nop
     6b2:	67 34       	cpi	r22, 0x47	; 71
     6b4:	00 03       	mulsu	r16, r16
     6b6:	0e 3a       	cpi	r16, 0xAE	; 174
     6b8:	0b 3b       	cpi	r16, 0xBB	; 187
     6ba:	0b 49       	sbci	r16, 0x9B	; 155
     6bc:	13 3f       	cpi	r17, 0xF3	; 243
     6be:	0c 02       	muls	r16, r28
     6c0:	0a 00       	.word	0x000a	; ????
     6c2:	00 68       	ori	r16, 0x80	; 128
     6c4:	34 00       	.word	0x0034	; ????
     6c6:	03 0e       	add	r0, r19
     6c8:	3a 0b       	sbc	r19, r26
     6ca:	3b 0b       	sbc	r19, r27
     6cc:	49 13       	cpse	r20, r25
     6ce:	3f 0c       	add	r3, r15
     6d0:	02 0a       	sbc	r0, r18
     6d2:	00 00       	nop
     6d4:	69 34       	cpi	r22, 0x49	; 73
     6d6:	00 03       	mulsu	r16, r16
     6d8:	0e 3a       	cpi	r16, 0xAE	; 174
     6da:	0b 3b       	cpi	r16, 0xBB	; 187
     6dc:	0b 49       	sbci	r16, 0x9B	; 155
     6de:	13 3f       	cpi	r17, 0xF3	; 243
     6e0:	0c 02       	muls	r16, r28
     6e2:	0a 00       	.word	0x000a	; ????
     6e4:	00 6a       	ori	r16, 0xA0	; 160
     6e6:	34 00       	.word	0x0034	; ????
     6e8:	03 0e       	add	r0, r19
     6ea:	3a 0b       	sbc	r19, r26
     6ec:	3b 0b       	sbc	r19, r27
     6ee:	49 13       	cpse	r20, r25
     6f0:	3f 0c       	add	r3, r15
     6f2:	02 0a       	sbc	r0, r18
     6f4:	00 00       	nop
     6f6:	6b 34       	cpi	r22, 0x4B	; 75
     6f8:	00 03       	mulsu	r16, r16
     6fa:	0e 3a       	cpi	r16, 0xAE	; 174
     6fc:	0b 3b       	cpi	r16, 0xBB	; 187
     6fe:	0b 49       	sbci	r16, 0x9B	; 155
     700:	13 3f       	cpi	r17, 0xF3	; 243
     702:	0c 02       	muls	r16, r28
     704:	0a 00       	.word	0x000a	; ????
     706:	00 6c       	ori	r16, 0xC0	; 192
     708:	34 00       	.word	0x0034	; ????
     70a:	03 0e       	add	r0, r19
     70c:	3a 0b       	sbc	r19, r26
     70e:	3b 0b       	sbc	r19, r27
     710:	49 13       	cpse	r20, r25
     712:	3f 0c       	add	r3, r15
     714:	02 0a       	sbc	r0, r18
     716:	00 00       	nop
     718:	6d 34       	cpi	r22, 0x4D	; 77
     71a:	00 03       	mulsu	r16, r16
     71c:	0e 3a       	cpi	r16, 0xAE	; 174
     71e:	0b 3b       	cpi	r16, 0xBB	; 187
     720:	0b 49       	sbci	r16, 0x9B	; 155
     722:	13 3f       	cpi	r17, 0xF3	; 243
     724:	0c 02       	muls	r16, r28
     726:	0a 00       	.word	0x000a	; ????
     728:	00 6e       	ori	r16, 0xE0	; 224
     72a:	34 00       	.word	0x0034	; ????
     72c:	03 0e       	add	r0, r19
     72e:	3a 0b       	sbc	r19, r26
     730:	3b 0b       	sbc	r19, r27
     732:	49 13       	cpse	r20, r25
     734:	3f 0c       	add	r3, r15
     736:	02 0a       	sbc	r0, r18
     738:	00 00       	nop
     73a:	6f 34       	cpi	r22, 0x4F	; 79
     73c:	00 03       	mulsu	r16, r16
     73e:	0e 3a       	cpi	r16, 0xAE	; 174
     740:	0b 3b       	cpi	r16, 0xBB	; 187
     742:	0b 49       	sbci	r16, 0x9B	; 155
     744:	13 3f       	cpi	r17, 0xF3	; 243
     746:	0c 02       	muls	r16, r28
     748:	0a 00       	.word	0x000a	; ????
     74a:	00 70       	andi	r16, 0x00	; 0
     74c:	34 00       	.word	0x0034	; ????
     74e:	03 0e       	add	r0, r19
     750:	3a 0b       	sbc	r19, r26
     752:	3b 0b       	sbc	r19, r27
     754:	49 13       	cpse	r20, r25
     756:	3f 0c       	add	r3, r15
     758:	02 0a       	sbc	r0, r18
     75a:	00 00       	nop
     75c:	71 34       	cpi	r23, 0x41	; 65
     75e:	00 03       	mulsu	r16, r16
     760:	0e 3a       	cpi	r16, 0xAE	; 174
     762:	0b 3b       	cpi	r16, 0xBB	; 187
     764:	0b 49       	sbci	r16, 0x9B	; 155
     766:	13 3f       	cpi	r17, 0xF3	; 243
     768:	0c 02       	muls	r16, r28
     76a:	0a 00       	.word	0x000a	; ????
     76c:	00 72       	andi	r16, 0x20	; 32
     76e:	34 00       	.word	0x0034	; ????
     770:	03 0e       	add	r0, r19
     772:	3a 0b       	sbc	r19, r26
     774:	3b 0b       	sbc	r19, r27
     776:	49 13       	cpse	r20, r25
     778:	3f 0c       	add	r3, r15
     77a:	02 0a       	sbc	r0, r18
     77c:	00 00       	nop
     77e:	73 34       	cpi	r23, 0x43	; 67
     780:	00 03       	mulsu	r16, r16
     782:	0e 3a       	cpi	r16, 0xAE	; 174
     784:	0b 3b       	cpi	r16, 0xBB	; 187
     786:	0b 49       	sbci	r16, 0x9B	; 155
     788:	13 3f       	cpi	r17, 0xF3	; 243
     78a:	0c 02       	muls	r16, r28
     78c:	0a 00       	.word	0x000a	; ????
     78e:	00 74       	andi	r16, 0x40	; 64
     790:	34 00       	.word	0x0034	; ????
     792:	03 0e       	add	r0, r19
     794:	3a 0b       	sbc	r19, r26
     796:	3b 0b       	sbc	r19, r27
     798:	49 13       	cpse	r20, r25
     79a:	3f 0c       	add	r3, r15
     79c:	02 0a       	sbc	r0, r18
     79e:	00 00       	nop
     7a0:	75 34       	cpi	r23, 0x45	; 69
     7a2:	00 03       	mulsu	r16, r16
     7a4:	0e 3a       	cpi	r16, 0xAE	; 174
     7a6:	0b 3b       	cpi	r16, 0xBB	; 187
     7a8:	0b 49       	sbci	r16, 0x9B	; 155
     7aa:	13 3f       	cpi	r17, 0xF3	; 243
     7ac:	0c 02       	muls	r16, r28
     7ae:	0a 00       	.word	0x000a	; ????
     7b0:	00 76       	andi	r16, 0x60	; 96
     7b2:	34 00       	.word	0x0034	; ????
     7b4:	03 0e       	add	r0, r19
     7b6:	3a 0b       	sbc	r19, r26
     7b8:	3b 0b       	sbc	r19, r27
     7ba:	49 13       	cpse	r20, r25
     7bc:	3f 0c       	add	r3, r15
     7be:	02 0a       	sbc	r0, r18
     7c0:	00 00       	nop
     7c2:	77 34       	cpi	r23, 0x47	; 71
     7c4:	00 03       	mulsu	r16, r16
     7c6:	0e 3a       	cpi	r16, 0xAE	; 174
     7c8:	0b 3b       	cpi	r16, 0xBB	; 187
     7ca:	0b 49       	sbci	r16, 0x9B	; 155
     7cc:	13 3f       	cpi	r17, 0xF3	; 243
     7ce:	0c 02       	muls	r16, r28
     7d0:	0a 00       	.word	0x000a	; ????
     7d2:	00 78       	andi	r16, 0x80	; 128
     7d4:	34 00       	.word	0x0034	; ????
     7d6:	03 0e       	add	r0, r19
     7d8:	3a 0b       	sbc	r19, r26
     7da:	3b 0b       	sbc	r19, r27
     7dc:	49 13       	cpse	r20, r25
     7de:	3f 0c       	add	r3, r15
     7e0:	02 0a       	sbc	r0, r18
     7e2:	00 00       	nop
     7e4:	79 34       	cpi	r23, 0x49	; 73
     7e6:	00 03       	mulsu	r16, r16
     7e8:	0e 3a       	cpi	r16, 0xAE	; 174
     7ea:	0b 3b       	cpi	r16, 0xBB	; 187
     7ec:	0b 49       	sbci	r16, 0x9B	; 155
     7ee:	13 3f       	cpi	r17, 0xF3	; 243
     7f0:	0c 02       	muls	r16, r28
     7f2:	0a 00       	.word	0x000a	; ????
     7f4:	00 7a       	andi	r16, 0xA0	; 160
     7f6:	34 00       	.word	0x0034	; ????
     7f8:	03 0e       	add	r0, r19
     7fa:	3a 0b       	sbc	r19, r26
     7fc:	3b 0b       	sbc	r19, r27
     7fe:	49 13       	cpse	r20, r25
     800:	3f 0c       	add	r3, r15
     802:	02 0a       	sbc	r0, r18
     804:	00 00       	nop
     806:	7b 34       	cpi	r23, 0x4B	; 75
     808:	00 03       	mulsu	r16, r16
     80a:	0e 3a       	cpi	r16, 0xAE	; 174
     80c:	0b 3b       	cpi	r16, 0xBB	; 187
     80e:	0b 49       	sbci	r16, 0x9B	; 155
     810:	13 3f       	cpi	r17, 0xF3	; 243
     812:	0c 02       	muls	r16, r28
     814:	0a 00       	.word	0x000a	; ????
     816:	00 7c       	andi	r16, 0xC0	; 192
     818:	34 00       	.word	0x0034	; ????
     81a:	03 0e       	add	r0, r19
     81c:	3a 0b       	sbc	r19, r26
     81e:	3b 0b       	sbc	r19, r27
     820:	49 13       	cpse	r20, r25
     822:	3f 0c       	add	r3, r15
     824:	02 0a       	sbc	r0, r18
     826:	00 00       	nop
     828:	7d 34       	cpi	r23, 0x4D	; 77
     82a:	00 03       	mulsu	r16, r16
     82c:	0e 3a       	cpi	r16, 0xAE	; 174
     82e:	0b 3b       	cpi	r16, 0xBB	; 187
     830:	0b 49       	sbci	r16, 0x9B	; 155
     832:	13 3f       	cpi	r17, 0xF3	; 243
     834:	0c 02       	muls	r16, r28
     836:	0a 00       	.word	0x000a	; ????
     838:	00 7e       	andi	r16, 0xE0	; 224
     83a:	34 00       	.word	0x0034	; ????
     83c:	03 0e       	add	r0, r19
     83e:	3a 0b       	sbc	r19, r26
     840:	3b 0b       	sbc	r19, r27
     842:	49 13       	cpse	r20, r25
     844:	3f 0c       	add	r3, r15
     846:	02 0a       	sbc	r0, r18
     848:	00 00       	nop
     84a:	7f 34       	cpi	r23, 0x4F	; 79
     84c:	00 03       	mulsu	r16, r16
     84e:	0e 3a       	cpi	r16, 0xAE	; 174
     850:	0b 3b       	cpi	r16, 0xBB	; 187
     852:	0b 49       	sbci	r16, 0x9B	; 155
     854:	13 3f       	cpi	r17, 0xF3	; 243
     856:	0c 02       	muls	r16, r28
     858:	0a 00       	.word	0x000a	; ????
     85a:	00 80       	ld	r0, Z
     85c:	01 34       	cpi	r16, 0x41	; 65
     85e:	00 03       	mulsu	r16, r16
     860:	0e 3a       	cpi	r16, 0xAE	; 174
     862:	0b 3b       	cpi	r16, 0xBB	; 187
     864:	0b 49       	sbci	r16, 0x9B	; 155
     866:	13 3f       	cpi	r17, 0xF3	; 243
     868:	0c 02       	muls	r16, r28
     86a:	0a 00       	.word	0x000a	; ????
     86c:	00 81       	ld	r16, Z
     86e:	01 34       	cpi	r16, 0x41	; 65
     870:	00 03       	mulsu	r16, r16
     872:	0e 3a       	cpi	r16, 0xAE	; 174
     874:	0b 3b       	cpi	r16, 0xBB	; 187
     876:	0b 49       	sbci	r16, 0x9B	; 155
     878:	13 3f       	cpi	r17, 0xF3	; 243
     87a:	0c 02       	muls	r16, r28
     87c:	0a 00       	.word	0x000a	; ????
     87e:	00 82       	st	Z, r0
     880:	01 34       	cpi	r16, 0x41	; 65
     882:	00 03       	mulsu	r16, r16
     884:	0e 3a       	cpi	r16, 0xAE	; 174
     886:	0b 3b       	cpi	r16, 0xBB	; 187
     888:	0b 49       	sbci	r16, 0x9B	; 155
     88a:	13 3f       	cpi	r17, 0xF3	; 243
     88c:	0c 02       	muls	r16, r28
     88e:	0a 00       	.word	0x000a	; ????
     890:	00 83       	st	Z, r16
     892:	01 34       	cpi	r16, 0x41	; 65
     894:	00 03       	mulsu	r16, r16
     896:	0e 3a       	cpi	r16, 0xAE	; 174
     898:	0b 3b       	cpi	r16, 0xBB	; 187
     89a:	0b 49       	sbci	r16, 0x9B	; 155
     89c:	13 3f       	cpi	r17, 0xF3	; 243
     89e:	0c 02       	muls	r16, r28
     8a0:	0a 00       	.word	0x000a	; ????
     8a2:	00 84       	ldd	r0, Z+8	; 0x08
     8a4:	01 34       	cpi	r16, 0x41	; 65
     8a6:	00 03       	mulsu	r16, r16
     8a8:	0e 3a       	cpi	r16, 0xAE	; 174
     8aa:	0b 3b       	cpi	r16, 0xBB	; 187
     8ac:	0b 49       	sbci	r16, 0x9B	; 155
     8ae:	13 3f       	cpi	r17, 0xF3	; 243
     8b0:	0c 02       	muls	r16, r28
     8b2:	0a 00       	.word	0x000a	; ????
     8b4:	00 85       	ldd	r16, Z+8	; 0x08
     8b6:	01 34       	cpi	r16, 0x41	; 65
     8b8:	00 03       	mulsu	r16, r16
     8ba:	0e 3a       	cpi	r16, 0xAE	; 174
     8bc:	0b 3b       	cpi	r16, 0xBB	; 187
     8be:	0b 49       	sbci	r16, 0x9B	; 155
     8c0:	13 3f       	cpi	r17, 0xF3	; 243
     8c2:	0c 02       	muls	r16, r28
     8c4:	0a 00       	.word	0x000a	; ????
     8c6:	00 86       	std	Z+8, r0	; 0x08
     8c8:	01 34       	cpi	r16, 0x41	; 65
     8ca:	00 03       	mulsu	r16, r16
     8cc:	0e 3a       	cpi	r16, 0xAE	; 174
     8ce:	0b 3b       	cpi	r16, 0xBB	; 187
     8d0:	0b 49       	sbci	r16, 0x9B	; 155
     8d2:	13 3f       	cpi	r17, 0xF3	; 243
     8d4:	0c 02       	muls	r16, r28
     8d6:	0a 00       	.word	0x000a	; ????
     8d8:	00 87       	std	Z+8, r16	; 0x08
     8da:	01 34       	cpi	r16, 0x41	; 65
     8dc:	00 03       	mulsu	r16, r16
     8de:	0e 3a       	cpi	r16, 0xAE	; 174
     8e0:	0b 3b       	cpi	r16, 0xBB	; 187
     8e2:	0b 49       	sbci	r16, 0x9B	; 155
     8e4:	13 3f       	cpi	r17, 0xF3	; 243
     8e6:	0c 02       	muls	r16, r28
     8e8:	0a 00       	.word	0x000a	; ????
     8ea:	00 88       	ldd	r0, Z+16	; 0x10
     8ec:	01 34       	cpi	r16, 0x41	; 65
     8ee:	00 03       	mulsu	r16, r16
     8f0:	0e 3a       	cpi	r16, 0xAE	; 174
     8f2:	0b 3b       	cpi	r16, 0xBB	; 187
     8f4:	0b 49       	sbci	r16, 0x9B	; 155
     8f6:	13 3f       	cpi	r17, 0xF3	; 243
     8f8:	0c 02       	muls	r16, r28
     8fa:	0a 00       	.word	0x000a	; ????
     8fc:	00 89       	ldd	r16, Z+16	; 0x10
     8fe:	01 34       	cpi	r16, 0x41	; 65
     900:	00 03       	mulsu	r16, r16
     902:	0e 3a       	cpi	r16, 0xAE	; 174
     904:	0b 3b       	cpi	r16, 0xBB	; 187
     906:	0b 49       	sbci	r16, 0x9B	; 155
     908:	13 3f       	cpi	r17, 0xF3	; 243
     90a:	0c 02       	muls	r16, r28
     90c:	0a 00       	.word	0x000a	; ????
     90e:	00 8a       	std	Z+16, r0	; 0x10
     910:	01 34       	cpi	r16, 0x41	; 65
     912:	00 03       	mulsu	r16, r16
     914:	0e 3a       	cpi	r16, 0xAE	; 174
     916:	0b 3b       	cpi	r16, 0xBB	; 187
     918:	0b 49       	sbci	r16, 0x9B	; 155
     91a:	13 3f       	cpi	r17, 0xF3	; 243
     91c:	0c 02       	muls	r16, r28
     91e:	0a 00       	.word	0x000a	; ????
     920:	00 8b       	std	Z+16, r16	; 0x10
     922:	01 34       	cpi	r16, 0x41	; 65
     924:	00 03       	mulsu	r16, r16
     926:	0e 3a       	cpi	r16, 0xAE	; 174
     928:	0b 3b       	cpi	r16, 0xBB	; 187
     92a:	0b 49       	sbci	r16, 0x9B	; 155
     92c:	13 3f       	cpi	r17, 0xF3	; 243
     92e:	0c 02       	muls	r16, r28
     930:	0a 00       	.word	0x000a	; ????
     932:	00 8c       	ldd	r0, Z+24	; 0x18
     934:	01 34       	cpi	r16, 0x41	; 65
     936:	00 03       	mulsu	r16, r16
     938:	0e 3a       	cpi	r16, 0xAE	; 174
     93a:	0b 3b       	cpi	r16, 0xBB	; 187
     93c:	0b 49       	sbci	r16, 0x9B	; 155
     93e:	13 3f       	cpi	r17, 0xF3	; 243
     940:	0c 02       	muls	r16, r28
     942:	0a 00       	.word	0x000a	; ????
     944:	00 8d       	ldd	r16, Z+24	; 0x18
     946:	01 34       	cpi	r16, 0x41	; 65
     948:	00 03       	mulsu	r16, r16
     94a:	0e 3a       	cpi	r16, 0xAE	; 174
     94c:	0b 3b       	cpi	r16, 0xBB	; 187
     94e:	0b 49       	sbci	r16, 0x9B	; 155
     950:	13 3f       	cpi	r17, 0xF3	; 243
     952:	0c 02       	muls	r16, r28
     954:	0a 00       	.word	0x000a	; ????
     956:	00 8e       	std	Z+24, r0	; 0x18
     958:	01 34       	cpi	r16, 0x41	; 65
     95a:	00 03       	mulsu	r16, r16
     95c:	0e 3a       	cpi	r16, 0xAE	; 174
     95e:	0b 3b       	cpi	r16, 0xBB	; 187
     960:	0b 49       	sbci	r16, 0x9B	; 155
     962:	13 3f       	cpi	r17, 0xF3	; 243
     964:	0c 02       	muls	r16, r28
     966:	0a 00       	.word	0x000a	; ????
     968:	00 8f       	std	Z+24, r16	; 0x18
     96a:	01 34       	cpi	r16, 0x41	; 65
     96c:	00 03       	mulsu	r16, r16
     96e:	0e 3a       	cpi	r16, 0xAE	; 174
     970:	0b 3b       	cpi	r16, 0xBB	; 187
     972:	0b 49       	sbci	r16, 0x9B	; 155
     974:	13 3f       	cpi	r17, 0xF3	; 243
     976:	0c 02       	muls	r16, r28
     978:	0a 00       	.word	0x000a	; ????
     97a:	00 90 01 34 	lds	r0, 0x3401	; 0x803401 <__DATA_REGION_ORIGIN__+0xc01>
     97e:	00 03       	mulsu	r16, r16
     980:	0e 3a       	cpi	r16, 0xAE	; 174
     982:	0b 3b       	cpi	r16, 0xBB	; 187
     984:	0b 49       	sbci	r16, 0x9B	; 155
     986:	13 3f       	cpi	r17, 0xF3	; 243
     988:	0c 02       	muls	r16, r28
     98a:	0a 00       	.word	0x000a	; ????
     98c:	00 91 01 34 	lds	r16, 0x3401	; 0x803401 <__DATA_REGION_ORIGIN__+0xc01>
     990:	00 03       	mulsu	r16, r16
     992:	0e 3a       	cpi	r16, 0xAE	; 174
     994:	0b 3b       	cpi	r16, 0xBB	; 187
     996:	0b 49       	sbci	r16, 0x9B	; 155
     998:	13 3f       	cpi	r17, 0xF3	; 243
     99a:	0c 02       	muls	r16, r28
     99c:	0a 00       	.word	0x000a	; ????
     99e:	00 92 01 34 	sts	0x3401, r0	; 0x803401 <__DATA_REGION_ORIGIN__+0xc01>
     9a2:	00 03       	mulsu	r16, r16
     9a4:	0e 3a       	cpi	r16, 0xAE	; 174
     9a6:	0b 3b       	cpi	r16, 0xBB	; 187
     9a8:	0b 49       	sbci	r16, 0x9B	; 155
     9aa:	13 3f       	cpi	r17, 0xF3	; 243
     9ac:	0c 02       	muls	r16, r28
     9ae:	0a 00       	.word	0x000a	; ????
     9b0:	00 93 01 34 	sts	0x3401, r16	; 0x803401 <__DATA_REGION_ORIGIN__+0xc01>
     9b4:	00 03       	mulsu	r16, r16
     9b6:	0e 3a       	cpi	r16, 0xAE	; 174
     9b8:	0b 3b       	cpi	r16, 0xBB	; 187
     9ba:	0b 49       	sbci	r16, 0x9B	; 155
     9bc:	13 3f       	cpi	r17, 0xF3	; 243
     9be:	0c 02       	muls	r16, r28
     9c0:	0a 00       	.word	0x000a	; ????
     9c2:	00 94       	com	r0
     9c4:	01 34       	cpi	r16, 0x41	; 65
     9c6:	00 03       	mulsu	r16, r16
     9c8:	0e 3a       	cpi	r16, 0xAE	; 174
     9ca:	0b 3b       	cpi	r16, 0xBB	; 187
     9cc:	0b 49       	sbci	r16, 0x9B	; 155
     9ce:	13 3f       	cpi	r17, 0xF3	; 243
     9d0:	0c 02       	muls	r16, r28
     9d2:	0a 00       	.word	0x000a	; ????
     9d4:	00 95       	com	r16
     9d6:	01 34       	cpi	r16, 0x41	; 65
     9d8:	00 03       	mulsu	r16, r16
     9da:	0e 3a       	cpi	r16, 0xAE	; 174
     9dc:	0b 3b       	cpi	r16, 0xBB	; 187
     9de:	0b 49       	sbci	r16, 0x9B	; 155
     9e0:	13 3f       	cpi	r17, 0xF3	; 243
     9e2:	0c 02       	muls	r16, r28
     9e4:	0a 00       	.word	0x000a	; ????
     9e6:	00 96       	adiw	r24, 0x00	; 0
     9e8:	01 34       	cpi	r16, 0x41	; 65
     9ea:	00 03       	mulsu	r16, r16
     9ec:	0e 3a       	cpi	r16, 0xAE	; 174
     9ee:	0b 3b       	cpi	r16, 0xBB	; 187
     9f0:	0b 49       	sbci	r16, 0x9B	; 155
     9f2:	13 3f       	cpi	r17, 0xF3	; 243
     9f4:	0c 02       	muls	r16, r28
     9f6:	0a 00       	.word	0x000a	; ????
     9f8:	00 97       	sbiw	r24, 0x00	; 0
     9fa:	01 34       	cpi	r16, 0x41	; 65
     9fc:	00 03       	mulsu	r16, r16
     9fe:	0e 3a       	cpi	r16, 0xAE	; 174
     a00:	0b 3b       	cpi	r16, 0xBB	; 187
     a02:	0b 49       	sbci	r16, 0x9B	; 155
     a04:	13 3f       	cpi	r17, 0xF3	; 243
     a06:	0c 02       	muls	r16, r28
     a08:	0a 00       	.word	0x000a	; ????
     a0a:	00 98       	cbi	0x00, 0	; 0
     a0c:	01 34       	cpi	r16, 0x41	; 65
     a0e:	00 03       	mulsu	r16, r16
     a10:	0e 3a       	cpi	r16, 0xAE	; 174
     a12:	0b 3b       	cpi	r16, 0xBB	; 187
     a14:	0b 49       	sbci	r16, 0x9B	; 155
     a16:	13 3f       	cpi	r17, 0xF3	; 243
     a18:	0c 02       	muls	r16, r28
     a1a:	0a 00       	.word	0x000a	; ????
     a1c:	00 99       	sbic	0x00, 0	; 0
     a1e:	01 34       	cpi	r16, 0x41	; 65
     a20:	00 03       	mulsu	r16, r16
     a22:	0e 3a       	cpi	r16, 0xAE	; 174
     a24:	0b 3b       	cpi	r16, 0xBB	; 187
     a26:	0b 49       	sbci	r16, 0x9B	; 155
     a28:	13 3f       	cpi	r17, 0xF3	; 243
     a2a:	0c 02       	muls	r16, r28
     a2c:	0a 00       	.word	0x000a	; ????
     a2e:	00 9a       	sbi	0x00, 0	; 0
     a30:	01 34       	cpi	r16, 0x41	; 65
     a32:	00 03       	mulsu	r16, r16
     a34:	0e 3a       	cpi	r16, 0xAE	; 174
     a36:	0b 3b       	cpi	r16, 0xBB	; 187
     a38:	0b 49       	sbci	r16, 0x9B	; 155
     a3a:	13 3f       	cpi	r17, 0xF3	; 243
     a3c:	0c 02       	muls	r16, r28
     a3e:	0a 00       	.word	0x000a	; ????
     a40:	00 9b       	sbis	0x00, 0	; 0
     a42:	01 34       	cpi	r16, 0x41	; 65
     a44:	00 03       	mulsu	r16, r16
     a46:	0e 3a       	cpi	r16, 0xAE	; 174
     a48:	0b 3b       	cpi	r16, 0xBB	; 187
     a4a:	0b 49       	sbci	r16, 0x9B	; 155
     a4c:	13 3f       	cpi	r17, 0xF3	; 243
     a4e:	0c 02       	muls	r16, r28
     a50:	0a 00       	.word	0x000a	; ????
     a52:	00 9c       	mul	r0, r0
     a54:	01 34       	cpi	r16, 0x41	; 65
     a56:	00 03       	mulsu	r16, r16
     a58:	0e 3a       	cpi	r16, 0xAE	; 174
     a5a:	0b 3b       	cpi	r16, 0xBB	; 187
     a5c:	0b 49       	sbci	r16, 0x9B	; 155
     a5e:	13 3f       	cpi	r17, 0xF3	; 243
     a60:	0c 02       	muls	r16, r28
     a62:	0a 00       	.word	0x000a	; ????
     a64:	00 9d       	mul	r16, r0
     a66:	01 34       	cpi	r16, 0x41	; 65
     a68:	00 03       	mulsu	r16, r16
     a6a:	0e 3a       	cpi	r16, 0xAE	; 174
     a6c:	0b 3b       	cpi	r16, 0xBB	; 187
     a6e:	0b 49       	sbci	r16, 0x9B	; 155
     a70:	13 3f       	cpi	r17, 0xF3	; 243
     a72:	0c 02       	muls	r16, r28
     a74:	0a 00       	.word	0x000a	; ????
     a76:	00 9e       	mul	r0, r16
     a78:	01 34       	cpi	r16, 0x41	; 65
     a7a:	00 03       	mulsu	r16, r16
     a7c:	0e 3a       	cpi	r16, 0xAE	; 174
     a7e:	0b 3b       	cpi	r16, 0xBB	; 187
     a80:	0b 49       	sbci	r16, 0x9B	; 155
     a82:	13 3f       	cpi	r17, 0xF3	; 243
     a84:	0c 02       	muls	r16, r28
     a86:	0a 00       	.word	0x000a	; ????
     a88:	00 9f       	mul	r16, r16
     a8a:	01 34       	cpi	r16, 0x41	; 65
     a8c:	00 03       	mulsu	r16, r16
     a8e:	0e 3a       	cpi	r16, 0xAE	; 174
     a90:	0b 3b       	cpi	r16, 0xBB	; 187
     a92:	0b 49       	sbci	r16, 0x9B	; 155
     a94:	13 3f       	cpi	r17, 0xF3	; 243
     a96:	0c 02       	muls	r16, r28
     a98:	0a 00       	.word	0x000a	; ????
     a9a:	00 a0       	ldd	r0, Z+32	; 0x20
     a9c:	01 34       	cpi	r16, 0x41	; 65
     a9e:	00 03       	mulsu	r16, r16
     aa0:	0e 3a       	cpi	r16, 0xAE	; 174
     aa2:	0b 3b       	cpi	r16, 0xBB	; 187
     aa4:	0b 49       	sbci	r16, 0x9B	; 155
     aa6:	13 3f       	cpi	r17, 0xF3	; 243
     aa8:	0c 02       	muls	r16, r28
     aaa:	0a 00       	.word	0x000a	; ????
     aac:	00 a1       	ldd	r16, Z+32	; 0x20
     aae:	01 34       	cpi	r16, 0x41	; 65
     ab0:	00 03       	mulsu	r16, r16
     ab2:	0e 3a       	cpi	r16, 0xAE	; 174
     ab4:	0b 3b       	cpi	r16, 0xBB	; 187
     ab6:	0b 49       	sbci	r16, 0x9B	; 155
     ab8:	13 3f       	cpi	r17, 0xF3	; 243
     aba:	0c 02       	muls	r16, r28
     abc:	0a 00       	.word	0x000a	; ????
     abe:	00 a2       	std	Z+32, r0	; 0x20
     ac0:	01 34       	cpi	r16, 0x41	; 65
     ac2:	00 03       	mulsu	r16, r16
     ac4:	0e 3a       	cpi	r16, 0xAE	; 174
     ac6:	0b 3b       	cpi	r16, 0xBB	; 187
     ac8:	0b 49       	sbci	r16, 0x9B	; 155
     aca:	13 3f       	cpi	r17, 0xF3	; 243
     acc:	0c 02       	muls	r16, r28
     ace:	0a 00       	.word	0x000a	; ????
     ad0:	00 a3       	std	Z+32, r16	; 0x20
     ad2:	01 34       	cpi	r16, 0x41	; 65
     ad4:	00 03       	mulsu	r16, r16
     ad6:	0e 3a       	cpi	r16, 0xAE	; 174
     ad8:	0b 3b       	cpi	r16, 0xBB	; 187
     ada:	0b 49       	sbci	r16, 0x9B	; 155
     adc:	13 3f       	cpi	r17, 0xF3	; 243
     ade:	0c 02       	muls	r16, r28
     ae0:	0a 00       	.word	0x000a	; ????
     ae2:	00 a4       	ldd	r0, Z+40	; 0x28
     ae4:	01 34       	cpi	r16, 0x41	; 65
     ae6:	00 03       	mulsu	r16, r16
     ae8:	0e 3a       	cpi	r16, 0xAE	; 174
     aea:	0b 3b       	cpi	r16, 0xBB	; 187
     aec:	0b 49       	sbci	r16, 0x9B	; 155
     aee:	13 3f       	cpi	r17, 0xF3	; 243
     af0:	0c 02       	muls	r16, r28
     af2:	0a 00       	.word	0x000a	; ????
     af4:	00 a5       	ldd	r16, Z+40	; 0x28
     af6:	01 34       	cpi	r16, 0x41	; 65
     af8:	00 03       	mulsu	r16, r16
     afa:	0e 3a       	cpi	r16, 0xAE	; 174
     afc:	0b 3b       	cpi	r16, 0xBB	; 187
     afe:	0b 49       	sbci	r16, 0x9B	; 155
     b00:	13 3f       	cpi	r17, 0xF3	; 243
     b02:	0c 02       	muls	r16, r28
     b04:	0a 00       	.word	0x000a	; ????
     b06:	00 a6       	std	Z+40, r0	; 0x28
     b08:	01 34       	cpi	r16, 0x41	; 65
     b0a:	00 03       	mulsu	r16, r16
     b0c:	0e 3a       	cpi	r16, 0xAE	; 174
     b0e:	0b 3b       	cpi	r16, 0xBB	; 187
     b10:	0b 49       	sbci	r16, 0x9B	; 155
     b12:	13 3f       	cpi	r17, 0xF3	; 243
     b14:	0c 02       	muls	r16, r28
     b16:	0a 00       	.word	0x000a	; ????
     b18:	00 a7       	std	Z+40, r16	; 0x28
     b1a:	01 34       	cpi	r16, 0x41	; 65
     b1c:	00 03       	mulsu	r16, r16
     b1e:	0e 3a       	cpi	r16, 0xAE	; 174
     b20:	0b 3b       	cpi	r16, 0xBB	; 187
     b22:	0b 49       	sbci	r16, 0x9B	; 155
     b24:	13 3f       	cpi	r17, 0xF3	; 243
     b26:	0c 02       	muls	r16, r28
     b28:	0a 00       	.word	0x000a	; ????
     b2a:	00 a8       	ldd	r0, Z+48	; 0x30
     b2c:	01 34       	cpi	r16, 0x41	; 65
     b2e:	00 03       	mulsu	r16, r16
     b30:	0e 3a       	cpi	r16, 0xAE	; 174
     b32:	0b 3b       	cpi	r16, 0xBB	; 187
     b34:	0b 49       	sbci	r16, 0x9B	; 155
     b36:	13 3f       	cpi	r17, 0xF3	; 243
     b38:	0c 02       	muls	r16, r28
     b3a:	0a 00       	.word	0x000a	; ????
     b3c:	00 a9       	ldd	r16, Z+48	; 0x30
     b3e:	01 34       	cpi	r16, 0x41	; 65
     b40:	00 03       	mulsu	r16, r16
     b42:	0e 3a       	cpi	r16, 0xAE	; 174
     b44:	0b 3b       	cpi	r16, 0xBB	; 187
     b46:	0b 49       	sbci	r16, 0x9B	; 155
     b48:	13 3f       	cpi	r17, 0xF3	; 243
     b4a:	0c 02       	muls	r16, r28
     b4c:	0a 00       	.word	0x000a	; ????
     b4e:	00 aa       	std	Z+48, r0	; 0x30
     b50:	01 34       	cpi	r16, 0x41	; 65
     b52:	00 03       	mulsu	r16, r16
     b54:	0e 3a       	cpi	r16, 0xAE	; 174
     b56:	0b 3b       	cpi	r16, 0xBB	; 187
     b58:	0b 49       	sbci	r16, 0x9B	; 155
     b5a:	13 3f       	cpi	r17, 0xF3	; 243
     b5c:	0c 02       	muls	r16, r28
     b5e:	0a 00       	.word	0x000a	; ????
     b60:	00 ab       	std	Z+48, r16	; 0x30
     b62:	01 34       	cpi	r16, 0x41	; 65
     b64:	00 03       	mulsu	r16, r16
     b66:	0e 3a       	cpi	r16, 0xAE	; 174
     b68:	0b 3b       	cpi	r16, 0xBB	; 187
     b6a:	0b 49       	sbci	r16, 0x9B	; 155
     b6c:	13 3f       	cpi	r17, 0xF3	; 243
     b6e:	0c 02       	muls	r16, r28
     b70:	0a 00       	.word	0x000a	; ????
     b72:	00 ac       	ldd	r0, Z+56	; 0x38
     b74:	01 34       	cpi	r16, 0x41	; 65
     b76:	00 03       	mulsu	r16, r16
     b78:	0e 3a       	cpi	r16, 0xAE	; 174
     b7a:	0b 3b       	cpi	r16, 0xBB	; 187
     b7c:	0b 49       	sbci	r16, 0x9B	; 155
     b7e:	13 3f       	cpi	r17, 0xF3	; 243
     b80:	0c 02       	muls	r16, r28
     b82:	0a 00       	.word	0x000a	; ????
     b84:	00 ad       	ldd	r16, Z+56	; 0x38
     b86:	01 34       	cpi	r16, 0x41	; 65
     b88:	00 03       	mulsu	r16, r16
     b8a:	0e 3a       	cpi	r16, 0xAE	; 174
     b8c:	0b 3b       	cpi	r16, 0xBB	; 187
     b8e:	0b 49       	sbci	r16, 0x9B	; 155
     b90:	13 3f       	cpi	r17, 0xF3	; 243
     b92:	0c 02       	muls	r16, r28
     b94:	0a 00       	.word	0x000a	; ????
     b96:	00 ae       	std	Z+56, r0	; 0x38
     b98:	01 34       	cpi	r16, 0x41	; 65
     b9a:	00 03       	mulsu	r16, r16
     b9c:	0e 3a       	cpi	r16, 0xAE	; 174
     b9e:	0b 3b       	cpi	r16, 0xBB	; 187
     ba0:	0b 49       	sbci	r16, 0x9B	; 155
     ba2:	13 3f       	cpi	r17, 0xF3	; 243
     ba4:	0c 02       	muls	r16, r28
     ba6:	0a 00       	.word	0x000a	; ????
     ba8:	00 af       	std	Z+56, r16	; 0x38
     baa:	01 34       	cpi	r16, 0x41	; 65
     bac:	00 03       	mulsu	r16, r16
     bae:	0e 3a       	cpi	r16, 0xAE	; 174
     bb0:	0b 3b       	cpi	r16, 0xBB	; 187
     bb2:	0b 49       	sbci	r16, 0x9B	; 155
     bb4:	13 3f       	cpi	r17, 0xF3	; 243
     bb6:	0c 02       	muls	r16, r28
     bb8:	0a 00       	.word	0x000a	; ????
     bba:	00 b0       	in	r0, 0x00	; 0
     bbc:	01 34       	cpi	r16, 0x41	; 65
     bbe:	00 03       	mulsu	r16, r16
     bc0:	0e 3a       	cpi	r16, 0xAE	; 174
     bc2:	0b 3b       	cpi	r16, 0xBB	; 187
     bc4:	0b 49       	sbci	r16, 0x9B	; 155
     bc6:	13 3f       	cpi	r17, 0xF3	; 243
     bc8:	0c 02       	muls	r16, r28
     bca:	0a 00       	.word	0x000a	; ????
     bcc:	00 b1       	in	r16, 0x00	; 0
     bce:	01 34       	cpi	r16, 0x41	; 65
     bd0:	00 03       	mulsu	r16, r16
     bd2:	0e 3a       	cpi	r16, 0xAE	; 174
     bd4:	0b 3b       	cpi	r16, 0xBB	; 187
     bd6:	0b 49       	sbci	r16, 0x9B	; 155
     bd8:	13 3f       	cpi	r17, 0xF3	; 243
     bda:	0c 02       	muls	r16, r28
     bdc:	0a 00       	.word	0x000a	; ????
     bde:	00 b2       	in	r0, 0x10	; 16
     be0:	01 34       	cpi	r16, 0x41	; 65
     be2:	00 03       	mulsu	r16, r16
     be4:	0e 3a       	cpi	r16, 0xAE	; 174
     be6:	0b 3b       	cpi	r16, 0xBB	; 187
     be8:	0b 49       	sbci	r16, 0x9B	; 155
     bea:	13 3f       	cpi	r17, 0xF3	; 243
     bec:	0c 02       	muls	r16, r28
     bee:	0a 00       	.word	0x000a	; ????
     bf0:	00 b3       	in	r16, 0x10	; 16
     bf2:	01 34       	cpi	r16, 0x41	; 65
     bf4:	00 03       	mulsu	r16, r16
     bf6:	0e 3a       	cpi	r16, 0xAE	; 174
     bf8:	0b 3b       	cpi	r16, 0xBB	; 187
     bfa:	0b 49       	sbci	r16, 0x9B	; 155
     bfc:	13 3f       	cpi	r17, 0xF3	; 243
     bfe:	0c 02       	muls	r16, r28
     c00:	0a 00       	.word	0x000a	; ????
     c02:	00 b4       	in	r0, 0x20	; 32
     c04:	01 34       	cpi	r16, 0x41	; 65
     c06:	00 03       	mulsu	r16, r16
     c08:	0e 3a       	cpi	r16, 0xAE	; 174
     c0a:	0b 3b       	cpi	r16, 0xBB	; 187
     c0c:	0b 49       	sbci	r16, 0x9B	; 155
     c0e:	13 3f       	cpi	r17, 0xF3	; 243
     c10:	0c 02       	muls	r16, r28
     c12:	0a 00       	.word	0x000a	; ????
     c14:	00 b5       	in	r16, 0x20	; 32
     c16:	01 34       	cpi	r16, 0x41	; 65
     c18:	00 03       	mulsu	r16, r16
     c1a:	0e 3a       	cpi	r16, 0xAE	; 174
     c1c:	0b 3b       	cpi	r16, 0xBB	; 187
     c1e:	0b 49       	sbci	r16, 0x9B	; 155
     c20:	13 3f       	cpi	r17, 0xF3	; 243
     c22:	0c 02       	muls	r16, r28
     c24:	0a 00       	.word	0x000a	; ????
     c26:	00 b6       	in	r0, 0x30	; 48
     c28:	01 34       	cpi	r16, 0x41	; 65
     c2a:	00 03       	mulsu	r16, r16
     c2c:	0e 3a       	cpi	r16, 0xAE	; 174
     c2e:	0b 3b       	cpi	r16, 0xBB	; 187
     c30:	0b 49       	sbci	r16, 0x9B	; 155
     c32:	13 3f       	cpi	r17, 0xF3	; 243
     c34:	0c 02       	muls	r16, r28
     c36:	0a 00       	.word	0x000a	; ????
     c38:	00 b7       	in	r16, 0x30	; 48
     c3a:	01 34       	cpi	r16, 0x41	; 65
     c3c:	00 03       	mulsu	r16, r16
     c3e:	0e 3a       	cpi	r16, 0xAE	; 174
     c40:	0b 3b       	cpi	r16, 0xBB	; 187
     c42:	0b 49       	sbci	r16, 0x9B	; 155
     c44:	13 3f       	cpi	r17, 0xF3	; 243
     c46:	0c 02       	muls	r16, r28
     c48:	0a 00       	.word	0x000a	; ????
     c4a:	00 b8       	out	0x00, r0	; 0
     c4c:	01 34       	cpi	r16, 0x41	; 65
     c4e:	00 03       	mulsu	r16, r16
     c50:	0e 3a       	cpi	r16, 0xAE	; 174
     c52:	0b 3b       	cpi	r16, 0xBB	; 187
     c54:	0b 49       	sbci	r16, 0x9B	; 155
     c56:	13 3f       	cpi	r17, 0xF3	; 243
     c58:	0c 02       	muls	r16, r28
     c5a:	0a 00       	.word	0x000a	; ????
     c5c:	00 b9       	out	0x00, r16	; 0
     c5e:	01 34       	cpi	r16, 0x41	; 65
     c60:	00 03       	mulsu	r16, r16
     c62:	0e 3a       	cpi	r16, 0xAE	; 174
     c64:	0b 3b       	cpi	r16, 0xBB	; 187
     c66:	0b 49       	sbci	r16, 0x9B	; 155
     c68:	13 3f       	cpi	r17, 0xF3	; 243
     c6a:	0c 02       	muls	r16, r28
     c6c:	0a 00       	.word	0x000a	; ????
     c6e:	00 ba       	out	0x10, r0	; 16
     c70:	01 34       	cpi	r16, 0x41	; 65
     c72:	00 03       	mulsu	r16, r16
     c74:	0e 3a       	cpi	r16, 0xAE	; 174
     c76:	0b 3b       	cpi	r16, 0xBB	; 187
     c78:	0b 49       	sbci	r16, 0x9B	; 155
     c7a:	13 3f       	cpi	r17, 0xF3	; 243
     c7c:	0c 02       	muls	r16, r28
     c7e:	0a 00       	.word	0x000a	; ????
     c80:	00 bb       	out	0x10, r16	; 16
     c82:	01 34       	cpi	r16, 0x41	; 65
     c84:	00 03       	mulsu	r16, r16
     c86:	0e 3a       	cpi	r16, 0xAE	; 174
     c88:	0b 3b       	cpi	r16, 0xBB	; 187
     c8a:	0b 49       	sbci	r16, 0x9B	; 155
     c8c:	13 3f       	cpi	r17, 0xF3	; 243
     c8e:	0c 02       	muls	r16, r28
     c90:	0a 00       	.word	0x000a	; ????
     c92:	00 bc       	out	0x20, r0	; 32
     c94:	01 34       	cpi	r16, 0x41	; 65
     c96:	00 03       	mulsu	r16, r16
     c98:	0e 3a       	cpi	r16, 0xAE	; 174
     c9a:	0b 3b       	cpi	r16, 0xBB	; 187
     c9c:	0b 49       	sbci	r16, 0x9B	; 155
     c9e:	13 3f       	cpi	r17, 0xF3	; 243
     ca0:	0c 02       	muls	r16, r28
     ca2:	0a 00       	.word	0x000a	; ????
     ca4:	00 bd       	out	0x20, r16	; 32
     ca6:	01 34       	cpi	r16, 0x41	; 65
     ca8:	00 03       	mulsu	r16, r16
     caa:	0e 3a       	cpi	r16, 0xAE	; 174
     cac:	0b 3b       	cpi	r16, 0xBB	; 187
     cae:	0b 49       	sbci	r16, 0x9B	; 155
     cb0:	13 3f       	cpi	r17, 0xF3	; 243
     cb2:	0c 02       	muls	r16, r28
     cb4:	0a 00       	.word	0x000a	; ????
     cb6:	00 be       	out	0x30, r0	; 48
     cb8:	01 34       	cpi	r16, 0x41	; 65
     cba:	00 03       	mulsu	r16, r16
     cbc:	0e 3a       	cpi	r16, 0xAE	; 174
     cbe:	0b 3b       	cpi	r16, 0xBB	; 187
     cc0:	0b 49       	sbci	r16, 0x9B	; 155
     cc2:	13 3f       	cpi	r17, 0xF3	; 243
     cc4:	0c 02       	muls	r16, r28
     cc6:	0a 00       	.word	0x000a	; ????
     cc8:	00 bf       	out	0x30, r16	; 48
     cca:	01 34       	cpi	r16, 0x41	; 65
     ccc:	00 03       	mulsu	r16, r16
     cce:	0e 3a       	cpi	r16, 0xAE	; 174
     cd0:	0b 3b       	cpi	r16, 0xBB	; 187
     cd2:	0b 49       	sbci	r16, 0x9B	; 155
     cd4:	13 3f       	cpi	r17, 0xF3	; 243
     cd6:	0c 02       	muls	r16, r28
     cd8:	0a 00       	.word	0x000a	; ????
     cda:	00 c0       	rjmp	.+0      	; 0xcdc <__LOCK_REGION_LENGTH__+0x8dc>
     cdc:	01 34       	cpi	r16, 0x41	; 65
     cde:	00 03       	mulsu	r16, r16
     ce0:	0e 3a       	cpi	r16, 0xAE	; 174
     ce2:	0b 3b       	cpi	r16, 0xBB	; 187
     ce4:	0b 49       	sbci	r16, 0x9B	; 155
     ce6:	13 3f       	cpi	r17, 0xF3	; 243
     ce8:	0c 02       	muls	r16, r28
     cea:	0a 00       	.word	0x000a	; ????
     cec:	00 c1       	rjmp	.+512    	; 0xeee <__LOCK_REGION_LENGTH__+0xaee>
     cee:	01 34       	cpi	r16, 0x41	; 65
     cf0:	00 03       	mulsu	r16, r16
     cf2:	0e 3a       	cpi	r16, 0xAE	; 174
     cf4:	0b 3b       	cpi	r16, 0xBB	; 187
     cf6:	0b 49       	sbci	r16, 0x9B	; 155
     cf8:	13 3f       	cpi	r17, 0xF3	; 243
     cfa:	0c 02       	muls	r16, r28
     cfc:	0a 00       	.word	0x000a	; ????
     cfe:	00 c2       	rjmp	.+1024   	; 0x1100 <__LOCK_REGION_LENGTH__+0xd00>
     d00:	01 34       	cpi	r16, 0x41	; 65
     d02:	00 03       	mulsu	r16, r16
     d04:	0e 3a       	cpi	r16, 0xAE	; 174
     d06:	0b 3b       	cpi	r16, 0xBB	; 187
     d08:	0b 49       	sbci	r16, 0x9B	; 155
     d0a:	13 3f       	cpi	r17, 0xF3	; 243
     d0c:	0c 02       	muls	r16, r28
     d0e:	0a 00       	.word	0x000a	; ????
     d10:	00 c3       	rjmp	.+1536   	; 0x1312 <__LOCK_REGION_LENGTH__+0xf12>
     d12:	01 34       	cpi	r16, 0x41	; 65
     d14:	00 03       	mulsu	r16, r16
     d16:	0e 3a       	cpi	r16, 0xAE	; 174
     d18:	0b 3b       	cpi	r16, 0xBB	; 187
     d1a:	0b 49       	sbci	r16, 0x9B	; 155
     d1c:	13 3f       	cpi	r17, 0xF3	; 243
     d1e:	0c 02       	muls	r16, r28
     d20:	0a 00       	.word	0x000a	; ????
     d22:	00 c4       	rjmp	.+2048   	; 0x1524 <__LOCK_REGION_LENGTH__+0x1124>
     d24:	01 34       	cpi	r16, 0x41	; 65
     d26:	00 03       	mulsu	r16, r16
     d28:	0e 3a       	cpi	r16, 0xAE	; 174
     d2a:	0b 3b       	cpi	r16, 0xBB	; 187
     d2c:	0b 49       	sbci	r16, 0x9B	; 155
     d2e:	13 3f       	cpi	r17, 0xF3	; 243
     d30:	0c 02       	muls	r16, r28
     d32:	0a 00       	.word	0x000a	; ????
     d34:	00 c5       	rjmp	.+2560   	; 0x1736 <__LOCK_REGION_LENGTH__+0x1336>
     d36:	01 34       	cpi	r16, 0x41	; 65
     d38:	00 03       	mulsu	r16, r16
     d3a:	0e 3a       	cpi	r16, 0xAE	; 174
     d3c:	0b 3b       	cpi	r16, 0xBB	; 187
     d3e:	0b 49       	sbci	r16, 0x9B	; 155
     d40:	13 3f       	cpi	r17, 0xF3	; 243
     d42:	0c 02       	muls	r16, r28
     d44:	0a 00       	.word	0x000a	; ????
     d46:	00 c6       	rjmp	.+3072   	; 0x1948 <__DATA_REGION_LENGTH__+0x148>
     d48:	01 34       	cpi	r16, 0x41	; 65
     d4a:	00 03       	mulsu	r16, r16
     d4c:	0e 3a       	cpi	r16, 0xAE	; 174
     d4e:	0b 3b       	cpi	r16, 0xBB	; 187
     d50:	0b 49       	sbci	r16, 0x9B	; 155
     d52:	13 3f       	cpi	r17, 0xF3	; 243
     d54:	0c 02       	muls	r16, r28
     d56:	0a 00       	.word	0x000a	; ????
     d58:	00 c7       	rjmp	.+3584   	; 0x1b5a <__DATA_REGION_LENGTH__+0x35a>
     d5a:	01 34       	cpi	r16, 0x41	; 65
     d5c:	00 03       	mulsu	r16, r16
     d5e:	0e 3a       	cpi	r16, 0xAE	; 174
     d60:	0b 3b       	cpi	r16, 0xBB	; 187
     d62:	0b 49       	sbci	r16, 0x9B	; 155
     d64:	13 3f       	cpi	r17, 0xF3	; 243
     d66:	0c 02       	muls	r16, r28
     d68:	0a 00       	.word	0x000a	; ????
     d6a:	00 c8       	rjmp	.-4096   	; 0xfffffd6c <__eeprom_end+0xff7efd6c>
     d6c:	01 34       	cpi	r16, 0x41	; 65
     d6e:	00 03       	mulsu	r16, r16
     d70:	0e 3a       	cpi	r16, 0xAE	; 174
     d72:	0b 3b       	cpi	r16, 0xBB	; 187
     d74:	0b 49       	sbci	r16, 0x9B	; 155
     d76:	13 3f       	cpi	r17, 0xF3	; 243
     d78:	0c 02       	muls	r16, r28
     d7a:	0a 00       	.word	0x000a	; ????
     d7c:	00 c9       	rjmp	.-3584   	; 0xffffff7e <__eeprom_end+0xff7eff7e>
     d7e:	01 34       	cpi	r16, 0x41	; 65
     d80:	00 03       	mulsu	r16, r16
     d82:	0e 3a       	cpi	r16, 0xAE	; 174
     d84:	0b 3b       	cpi	r16, 0xBB	; 187
     d86:	0b 49       	sbci	r16, 0x9B	; 155
     d88:	13 3f       	cpi	r17, 0xF3	; 243
     d8a:	0c 02       	muls	r16, r28
     d8c:	0a 00       	.word	0x000a	; ????
     d8e:	00 ca       	rjmp	.-3072   	; 0x190 <__data_load_end+0x8e>
     d90:	01 34       	cpi	r16, 0x41	; 65
     d92:	00 03       	mulsu	r16, r16
     d94:	0e 3a       	cpi	r16, 0xAE	; 174
     d96:	0b 3b       	cpi	r16, 0xBB	; 187
     d98:	0b 49       	sbci	r16, 0x9B	; 155
     d9a:	13 3f       	cpi	r17, 0xF3	; 243
     d9c:	0c 02       	muls	r16, r28
     d9e:	0a 00       	.word	0x000a	; ????
     da0:	00 cb       	rjmp	.-2560   	; 0x3a2 <__data_load_end+0x2a0>
     da2:	01 34       	cpi	r16, 0x41	; 65
     da4:	00 03       	mulsu	r16, r16
     da6:	0e 3a       	cpi	r16, 0xAE	; 174
     da8:	0b 3b       	cpi	r16, 0xBB	; 187
     daa:	0b 49       	sbci	r16, 0x9B	; 155
     dac:	13 3f       	cpi	r17, 0xF3	; 243
     dae:	0c 02       	muls	r16, r28
     db0:	0a 00       	.word	0x000a	; ????
     db2:	00 cc       	rjmp	.-2048   	; 0x5b4 <__LOCK_REGION_LENGTH__+0x1b4>
     db4:	01 34       	cpi	r16, 0x41	; 65
     db6:	00 03       	mulsu	r16, r16
     db8:	0e 3a       	cpi	r16, 0xAE	; 174
     dba:	0b 3b       	cpi	r16, 0xBB	; 187
     dbc:	0b 49       	sbci	r16, 0x9B	; 155
     dbe:	13 3f       	cpi	r17, 0xF3	; 243
     dc0:	0c 02       	muls	r16, r28
     dc2:	0a 00       	.word	0x000a	; ????
     dc4:	00 cd       	rjmp	.-1536   	; 0x7c6 <__LOCK_REGION_LENGTH__+0x3c6>
     dc6:	01 34       	cpi	r16, 0x41	; 65
     dc8:	00 03       	mulsu	r16, r16
     dca:	0e 3a       	cpi	r16, 0xAE	; 174
     dcc:	0b 3b       	cpi	r16, 0xBB	; 187
     dce:	0b 49       	sbci	r16, 0x9B	; 155
     dd0:	13 3f       	cpi	r17, 0xF3	; 243
     dd2:	0c 02       	muls	r16, r28
     dd4:	0a 00       	.word	0x000a	; ????
     dd6:	00 ce       	rjmp	.-1024   	; 0x9d8 <__LOCK_REGION_LENGTH__+0x5d8>
     dd8:	01 34       	cpi	r16, 0x41	; 65
     dda:	00 03       	mulsu	r16, r16
     ddc:	0e 3a       	cpi	r16, 0xAE	; 174
     dde:	0b 3b       	cpi	r16, 0xBB	; 187
     de0:	0b 49       	sbci	r16, 0x9B	; 155
     de2:	13 3f       	cpi	r17, 0xF3	; 243
     de4:	0c 02       	muls	r16, r28
     de6:	0a 00       	.word	0x000a	; ????
     de8:	00 cf       	rjmp	.-512    	; 0xbea <__LOCK_REGION_LENGTH__+0x7ea>
     dea:	01 34       	cpi	r16, 0x41	; 65
     dec:	00 03       	mulsu	r16, r16
     dee:	0e 3a       	cpi	r16, 0xAE	; 174
     df0:	0b 3b       	cpi	r16, 0xBB	; 187
     df2:	0b 49       	sbci	r16, 0x9B	; 155
     df4:	13 3f       	cpi	r17, 0xF3	; 243
     df6:	0c 02       	muls	r16, r28
     df8:	0a 00       	.word	0x000a	; ????
     dfa:	00 d0       	rcall	.+0      	; 0xdfc <__LOCK_REGION_LENGTH__+0x9fc>
     dfc:	01 34       	cpi	r16, 0x41	; 65
     dfe:	00 03       	mulsu	r16, r16
     e00:	0e 3a       	cpi	r16, 0xAE	; 174
     e02:	0b 3b       	cpi	r16, 0xBB	; 187
     e04:	0b 49       	sbci	r16, 0x9B	; 155
     e06:	13 3f       	cpi	r17, 0xF3	; 243
     e08:	0c 02       	muls	r16, r28
     e0a:	0a 00       	.word	0x000a	; ????
     e0c:	00 d1       	rcall	.+512    	; 0x100e <__LOCK_REGION_LENGTH__+0xc0e>
     e0e:	01 34       	cpi	r16, 0x41	; 65
     e10:	00 03       	mulsu	r16, r16
     e12:	0e 3a       	cpi	r16, 0xAE	; 174
     e14:	0b 3b       	cpi	r16, 0xBB	; 187
     e16:	0b 49       	sbci	r16, 0x9B	; 155
     e18:	13 3f       	cpi	r17, 0xF3	; 243
     e1a:	0c 02       	muls	r16, r28
     e1c:	0a 00       	.word	0x000a	; ????
     e1e:	00 d2       	rcall	.+1024   	; 0x1220 <__LOCK_REGION_LENGTH__+0xe20>
     e20:	01 34       	cpi	r16, 0x41	; 65
     e22:	00 03       	mulsu	r16, r16
     e24:	0e 3a       	cpi	r16, 0xAE	; 174
     e26:	0b 3b       	cpi	r16, 0xBB	; 187
     e28:	0b 49       	sbci	r16, 0x9B	; 155
     e2a:	13 3f       	cpi	r17, 0xF3	; 243
     e2c:	0c 02       	muls	r16, r28
     e2e:	0a 00       	.word	0x000a	; ????
     e30:	00 d3       	rcall	.+1536   	; 0x1432 <__LOCK_REGION_LENGTH__+0x1032>
     e32:	01 34       	cpi	r16, 0x41	; 65
     e34:	00 03       	mulsu	r16, r16
     e36:	0e 3a       	cpi	r16, 0xAE	; 174
     e38:	0b 3b       	cpi	r16, 0xBB	; 187
     e3a:	0b 49       	sbci	r16, 0x9B	; 155
     e3c:	13 3f       	cpi	r17, 0xF3	; 243
     e3e:	0c 02       	muls	r16, r28
     e40:	0a 00       	.word	0x000a	; ????
     e42:	00 d4       	rcall	.+2048   	; 0x1644 <__LOCK_REGION_LENGTH__+0x1244>
     e44:	01 34       	cpi	r16, 0x41	; 65
     e46:	00 03       	mulsu	r16, r16
     e48:	0e 3a       	cpi	r16, 0xAE	; 174
     e4a:	0b 3b       	cpi	r16, 0xBB	; 187
     e4c:	0b 49       	sbci	r16, 0x9B	; 155
     e4e:	13 3f       	cpi	r17, 0xF3	; 243
     e50:	0c 02       	muls	r16, r28
     e52:	0a 00       	.word	0x000a	; ????
     e54:	00 d5       	rcall	.+2560   	; 0x1856 <__DATA_REGION_LENGTH__+0x56>
     e56:	01 34       	cpi	r16, 0x41	; 65
     e58:	00 03       	mulsu	r16, r16
     e5a:	0e 3a       	cpi	r16, 0xAE	; 174
     e5c:	0b 3b       	cpi	r16, 0xBB	; 187
     e5e:	0b 49       	sbci	r16, 0x9B	; 155
     e60:	13 3f       	cpi	r17, 0xF3	; 243
     e62:	0c 02       	muls	r16, r28
     e64:	0a 00       	.word	0x000a	; ????
     e66:	00 d6       	rcall	.+3072   	; 0x1a68 <__DATA_REGION_LENGTH__+0x268>
     e68:	01 34       	cpi	r16, 0x41	; 65
     e6a:	00 03       	mulsu	r16, r16
     e6c:	0e 3a       	cpi	r16, 0xAE	; 174
     e6e:	0b 3b       	cpi	r16, 0xBB	; 187
     e70:	0b 49       	sbci	r16, 0x9B	; 155
     e72:	13 3f       	cpi	r17, 0xF3	; 243
     e74:	0c 02       	muls	r16, r28
     e76:	0a 00       	.word	0x000a	; ????
     e78:	00 d7       	rcall	.+3584   	; 0x1c7a <__DATA_REGION_LENGTH__+0x47a>
     e7a:	01 34       	cpi	r16, 0x41	; 65
     e7c:	00 03       	mulsu	r16, r16
     e7e:	0e 3a       	cpi	r16, 0xAE	; 174
     e80:	0b 3b       	cpi	r16, 0xBB	; 187
     e82:	0b 49       	sbci	r16, 0x9B	; 155
     e84:	13 3f       	cpi	r17, 0xF3	; 243
     e86:	0c 02       	muls	r16, r28
     e88:	0a 00       	.word	0x000a	; ????
     e8a:	00 d8       	rcall	.-4096   	; 0xfffffe8c <__eeprom_end+0xff7efe8c>
     e8c:	01 34       	cpi	r16, 0x41	; 65
     e8e:	00 03       	mulsu	r16, r16
     e90:	0e 3a       	cpi	r16, 0xAE	; 174
     e92:	0b 3b       	cpi	r16, 0xBB	; 187
     e94:	0b 49       	sbci	r16, 0x9B	; 155
     e96:	13 3f       	cpi	r17, 0xF3	; 243
     e98:	0c 02       	muls	r16, r28
     e9a:	0a 00       	.word	0x000a	; ????
     e9c:	00 d9       	rcall	.-3584   	; 0x9e <__SREG__+0x5f>
     e9e:	01 34       	cpi	r16, 0x41	; 65
     ea0:	00 03       	mulsu	r16, r16
     ea2:	0e 3a       	cpi	r16, 0xAE	; 174
     ea4:	0b 3b       	cpi	r16, 0xBB	; 187
     ea6:	0b 49       	sbci	r16, 0x9B	; 155
     ea8:	13 3f       	cpi	r17, 0xF3	; 243
     eaa:	0c 02       	muls	r16, r28
     eac:	0a 00       	.word	0x000a	; ????
     eae:	00 da       	rcall	.-3072   	; 0x2b0 <__data_load_end+0x1ae>
     eb0:	01 34       	cpi	r16, 0x41	; 65
     eb2:	00 03       	mulsu	r16, r16
     eb4:	0e 3a       	cpi	r16, 0xAE	; 174
     eb6:	0b 3b       	cpi	r16, 0xBB	; 187
     eb8:	0b 49       	sbci	r16, 0x9B	; 155
     eba:	13 3f       	cpi	r17, 0xF3	; 243
     ebc:	0c 02       	muls	r16, r28
     ebe:	0a 00       	.word	0x000a	; ????
     ec0:	00 db       	rcall	.-2560   	; 0x4c2 <__LOCK_REGION_LENGTH__+0xc2>
     ec2:	01 34       	cpi	r16, 0x41	; 65
     ec4:	00 03       	mulsu	r16, r16
     ec6:	0e 3a       	cpi	r16, 0xAE	; 174
     ec8:	0b 3b       	cpi	r16, 0xBB	; 187
     eca:	0b 49       	sbci	r16, 0x9B	; 155
     ecc:	13 3f       	cpi	r17, 0xF3	; 243
     ece:	0c 02       	muls	r16, r28
     ed0:	0a 00       	.word	0x000a	; ????
     ed2:	00 dc       	rcall	.-2048   	; 0x6d4 <__LOCK_REGION_LENGTH__+0x2d4>
     ed4:	01 34       	cpi	r16, 0x41	; 65
     ed6:	00 03       	mulsu	r16, r16
     ed8:	0e 3a       	cpi	r16, 0xAE	; 174
     eda:	0b 3b       	cpi	r16, 0xBB	; 187
     edc:	0b 49       	sbci	r16, 0x9B	; 155
     ede:	13 3f       	cpi	r17, 0xF3	; 243
     ee0:	0c 02       	muls	r16, r28
     ee2:	0a 00       	.word	0x000a	; ????
     ee4:	00 dd       	rcall	.-1536   	; 0x8e6 <__LOCK_REGION_LENGTH__+0x4e6>
     ee6:	01 34       	cpi	r16, 0x41	; 65
     ee8:	00 03       	mulsu	r16, r16
     eea:	0e 3a       	cpi	r16, 0xAE	; 174
     eec:	0b 3b       	cpi	r16, 0xBB	; 187
     eee:	0b 49       	sbci	r16, 0x9B	; 155
     ef0:	13 3f       	cpi	r17, 0xF3	; 243
     ef2:	0c 02       	muls	r16, r28
     ef4:	0a 00       	.word	0x000a	; ????
     ef6:	00 de       	rcall	.-1024   	; 0xaf8 <__LOCK_REGION_LENGTH__+0x6f8>
     ef8:	01 34       	cpi	r16, 0x41	; 65
     efa:	00 03       	mulsu	r16, r16
     efc:	0e 3a       	cpi	r16, 0xAE	; 174
     efe:	0b 3b       	cpi	r16, 0xBB	; 187
     f00:	0b 49       	sbci	r16, 0x9B	; 155
     f02:	13 3f       	cpi	r17, 0xF3	; 243
     f04:	0c 02       	muls	r16, r28
     f06:	0a 00       	.word	0x000a	; ????
     f08:	00 df       	rcall	.-512    	; 0xd0a <__LOCK_REGION_LENGTH__+0x90a>
     f0a:	01 34       	cpi	r16, 0x41	; 65
     f0c:	00 03       	mulsu	r16, r16
     f0e:	0e 3a       	cpi	r16, 0xAE	; 174
     f10:	0b 3b       	cpi	r16, 0xBB	; 187
     f12:	0b 49       	sbci	r16, 0x9B	; 155
     f14:	13 3f       	cpi	r17, 0xF3	; 243
     f16:	0c 02       	muls	r16, r28
     f18:	0a 00       	.word	0x000a	; ????
     f1a:	00 e0       	ldi	r16, 0x00	; 0
     f1c:	01 34       	cpi	r16, 0x41	; 65
     f1e:	00 03       	mulsu	r16, r16
     f20:	0e 3a       	cpi	r16, 0xAE	; 174
     f22:	0b 3b       	cpi	r16, 0xBB	; 187
     f24:	0b 49       	sbci	r16, 0x9B	; 155
     f26:	13 3f       	cpi	r17, 0xF3	; 243
     f28:	0c 02       	muls	r16, r28
     f2a:	0a 00       	.word	0x000a	; ????
     f2c:	00 e1       	ldi	r16, 0x10	; 16
     f2e:	01 34       	cpi	r16, 0x41	; 65
     f30:	00 03       	mulsu	r16, r16
     f32:	0e 3a       	cpi	r16, 0xAE	; 174
     f34:	0b 3b       	cpi	r16, 0xBB	; 187
     f36:	0b 49       	sbci	r16, 0x9B	; 155
     f38:	13 3f       	cpi	r17, 0xF3	; 243
     f3a:	0c 02       	muls	r16, r28
     f3c:	0a 00       	.word	0x000a	; ????
     f3e:	00 e2       	ldi	r16, 0x20	; 32
     f40:	01 34       	cpi	r16, 0x41	; 65
     f42:	00 03       	mulsu	r16, r16
     f44:	0e 3a       	cpi	r16, 0xAE	; 174
     f46:	0b 3b       	cpi	r16, 0xBB	; 187
     f48:	0b 49       	sbci	r16, 0x9B	; 155
     f4a:	13 3f       	cpi	r17, 0xF3	; 243
     f4c:	0c 02       	muls	r16, r28
     f4e:	0a 00       	.word	0x000a	; ????
     f50:	00 e3       	ldi	r16, 0x30	; 48
     f52:	01 34       	cpi	r16, 0x41	; 65
     f54:	00 03       	mulsu	r16, r16
     f56:	0e 3a       	cpi	r16, 0xAE	; 174
     f58:	0b 3b       	cpi	r16, 0xBB	; 187
     f5a:	0b 49       	sbci	r16, 0x9B	; 155
     f5c:	13 3f       	cpi	r17, 0xF3	; 243
     f5e:	0c 02       	muls	r16, r28
     f60:	0a 00       	.word	0x000a	; ????
     f62:	00 e4       	ldi	r16, 0x40	; 64
     f64:	01 34       	cpi	r16, 0x41	; 65
     f66:	00 03       	mulsu	r16, r16
     f68:	0e 3a       	cpi	r16, 0xAE	; 174
     f6a:	0b 3b       	cpi	r16, 0xBB	; 187
     f6c:	0b 49       	sbci	r16, 0x9B	; 155
     f6e:	13 3f       	cpi	r17, 0xF3	; 243
     f70:	0c 02       	muls	r16, r28
     f72:	0a 00       	.word	0x000a	; ????
     f74:	00 e5       	ldi	r16, 0x50	; 80
     f76:	01 34       	cpi	r16, 0x41	; 65
     f78:	00 03       	mulsu	r16, r16
     f7a:	0e 3a       	cpi	r16, 0xAE	; 174
     f7c:	0b 3b       	cpi	r16, 0xBB	; 187
     f7e:	0b 49       	sbci	r16, 0x9B	; 155
     f80:	13 3f       	cpi	r17, 0xF3	; 243
     f82:	0c 02       	muls	r16, r28
     f84:	0a 00       	.word	0x000a	; ????
     f86:	00 e6       	ldi	r16, 0x60	; 96
     f88:	01 34       	cpi	r16, 0x41	; 65
     f8a:	00 03       	mulsu	r16, r16
     f8c:	0e 3a       	cpi	r16, 0xAE	; 174
     f8e:	0b 3b       	cpi	r16, 0xBB	; 187
     f90:	0b 49       	sbci	r16, 0x9B	; 155
     f92:	13 3f       	cpi	r17, 0xF3	; 243
     f94:	0c 02       	muls	r16, r28
     f96:	0a 00       	.word	0x000a	; ????
     f98:	00 e7       	ldi	r16, 0x70	; 112
     f9a:	01 34       	cpi	r16, 0x41	; 65
     f9c:	00 03       	mulsu	r16, r16
     f9e:	0e 3a       	cpi	r16, 0xAE	; 174
     fa0:	0b 3b       	cpi	r16, 0xBB	; 187
     fa2:	0b 49       	sbci	r16, 0x9B	; 155
     fa4:	13 3f       	cpi	r17, 0xF3	; 243
     fa6:	0c 02       	muls	r16, r28
     fa8:	0a 00       	.word	0x000a	; ????
     faa:	00 e8       	ldi	r16, 0x80	; 128
     fac:	01 34       	cpi	r16, 0x41	; 65
     fae:	00 03       	mulsu	r16, r16
     fb0:	0e 3a       	cpi	r16, 0xAE	; 174
     fb2:	0b 3b       	cpi	r16, 0xBB	; 187
     fb4:	0b 49       	sbci	r16, 0x9B	; 155
     fb6:	13 3f       	cpi	r17, 0xF3	; 243
     fb8:	0c 02       	muls	r16, r28
     fba:	0a 00       	.word	0x000a	; ????
     fbc:	00 e9       	ldi	r16, 0x90	; 144
     fbe:	01 34       	cpi	r16, 0x41	; 65
     fc0:	00 03       	mulsu	r16, r16
     fc2:	0e 3a       	cpi	r16, 0xAE	; 174
     fc4:	0b 3b       	cpi	r16, 0xBB	; 187
     fc6:	0b 49       	sbci	r16, 0x9B	; 155
     fc8:	13 3f       	cpi	r17, 0xF3	; 243
     fca:	0c 02       	muls	r16, r28
     fcc:	0a 00       	.word	0x000a	; ????
     fce:	00 ea       	ldi	r16, 0xA0	; 160
     fd0:	01 34       	cpi	r16, 0x41	; 65
     fd2:	00 03       	mulsu	r16, r16
     fd4:	0e 3a       	cpi	r16, 0xAE	; 174
     fd6:	0b 3b       	cpi	r16, 0xBB	; 187
     fd8:	0b 49       	sbci	r16, 0x9B	; 155
     fda:	13 3f       	cpi	r17, 0xF3	; 243
     fdc:	0c 02       	muls	r16, r28
     fde:	0a 00       	.word	0x000a	; ????
     fe0:	00 eb       	ldi	r16, 0xB0	; 176
     fe2:	01 34       	cpi	r16, 0x41	; 65
     fe4:	00 03       	mulsu	r16, r16
     fe6:	0e 3a       	cpi	r16, 0xAE	; 174
     fe8:	0b 3b       	cpi	r16, 0xBB	; 187
     fea:	0b 49       	sbci	r16, 0x9B	; 155
     fec:	13 3f       	cpi	r17, 0xF3	; 243
     fee:	0c 02       	muls	r16, r28
     ff0:	0a 00       	.word	0x000a	; ????
     ff2:	00 ec       	ldi	r16, 0xC0	; 192
     ff4:	01 34       	cpi	r16, 0x41	; 65
     ff6:	00 03       	mulsu	r16, r16
     ff8:	0e 3a       	cpi	r16, 0xAE	; 174
     ffa:	0b 3b       	cpi	r16, 0xBB	; 187
     ffc:	0b 49       	sbci	r16, 0x9B	; 155
     ffe:	13 3f       	cpi	r17, 0xF3	; 243
    1000:	0c 02       	muls	r16, r28
    1002:	0a 00       	.word	0x000a	; ????
    1004:	00 ed       	ldi	r16, 0xD0	; 208
    1006:	01 34       	cpi	r16, 0x41	; 65
    1008:	00 03       	mulsu	r16, r16
    100a:	0e 3a       	cpi	r16, 0xAE	; 174
    100c:	0b 3b       	cpi	r16, 0xBB	; 187
    100e:	0b 49       	sbci	r16, 0x9B	; 155
    1010:	13 3f       	cpi	r17, 0xF3	; 243
    1012:	0c 02       	muls	r16, r28
    1014:	0a 00       	.word	0x000a	; ????
    1016:	00 ee       	ldi	r16, 0xE0	; 224
    1018:	01 34       	cpi	r16, 0x41	; 65
    101a:	00 03       	mulsu	r16, r16
    101c:	0e 3a       	cpi	r16, 0xAE	; 174
    101e:	0b 3b       	cpi	r16, 0xBB	; 187
    1020:	0b 49       	sbci	r16, 0x9B	; 155
    1022:	13 3f       	cpi	r17, 0xF3	; 243
    1024:	0c 02       	muls	r16, r28
    1026:	0a 00       	.word	0x000a	; ????
    1028:	00 ef       	ldi	r16, 0xF0	; 240
    102a:	01 34       	cpi	r16, 0x41	; 65
    102c:	00 03       	mulsu	r16, r16
    102e:	0e 3a       	cpi	r16, 0xAE	; 174
    1030:	0b 3b       	cpi	r16, 0xBB	; 187
    1032:	0b 49       	sbci	r16, 0x9B	; 155
    1034:	13 3f       	cpi	r17, 0xF3	; 243
    1036:	0c 02       	muls	r16, r28
    1038:	0a 00       	.word	0x000a	; ????
    103a:	00 f0       	brcs	.+0      	; 0x103c <__LOCK_REGION_LENGTH__+0xc3c>
    103c:	01 34       	cpi	r16, 0x41	; 65
    103e:	00 03       	mulsu	r16, r16
    1040:	0e 3a       	cpi	r16, 0xAE	; 174
    1042:	0b 3b       	cpi	r16, 0xBB	; 187
    1044:	0b 49       	sbci	r16, 0x9B	; 155
    1046:	13 3f       	cpi	r17, 0xF3	; 243
    1048:	0c 02       	muls	r16, r28
    104a:	0a 00       	.word	0x000a	; ????
    104c:	00 f1       	brcs	.+64     	; 0x108e <__LOCK_REGION_LENGTH__+0xc8e>
    104e:	01 34       	cpi	r16, 0x41	; 65
    1050:	00 03       	mulsu	r16, r16
    1052:	0e 3a       	cpi	r16, 0xAE	; 174
    1054:	0b 3b       	cpi	r16, 0xBB	; 187
    1056:	0b 49       	sbci	r16, 0x9B	; 155
    1058:	13 3f       	cpi	r17, 0xF3	; 243
    105a:	0c 02       	muls	r16, r28
    105c:	0a 00       	.word	0x000a	; ????
    105e:	00 f2       	brcs	.-128    	; 0xfe0 <__LOCK_REGION_LENGTH__+0xbe0>
    1060:	01 34       	cpi	r16, 0x41	; 65
    1062:	00 03       	mulsu	r16, r16
    1064:	0e 3a       	cpi	r16, 0xAE	; 174
    1066:	0b 3b       	cpi	r16, 0xBB	; 187
    1068:	0b 49       	sbci	r16, 0x9B	; 155
    106a:	13 3f       	cpi	r17, 0xF3	; 243
    106c:	0c 02       	muls	r16, r28
    106e:	0a 00       	.word	0x000a	; ????
    1070:	00 f3       	brcs	.-64     	; 0x1032 <__LOCK_REGION_LENGTH__+0xc32>
    1072:	01 34       	cpi	r16, 0x41	; 65
    1074:	00 03       	mulsu	r16, r16
    1076:	0e 3a       	cpi	r16, 0xAE	; 174
    1078:	0b 3b       	cpi	r16, 0xBB	; 187
    107a:	0b 49       	sbci	r16, 0x9B	; 155
    107c:	13 3f       	cpi	r17, 0xF3	; 243
    107e:	0c 02       	muls	r16, r28
    1080:	0a 00       	.word	0x000a	; ????
    1082:	00 f4       	brcc	.+0      	; 0x1084 <__LOCK_REGION_LENGTH__+0xc84>
    1084:	01 34       	cpi	r16, 0x41	; 65
    1086:	00 03       	mulsu	r16, r16
    1088:	0e 3a       	cpi	r16, 0xAE	; 174
    108a:	0b 3b       	cpi	r16, 0xBB	; 187
    108c:	0b 49       	sbci	r16, 0x9B	; 155
    108e:	13 3f       	cpi	r17, 0xF3	; 243
    1090:	0c 02       	muls	r16, r28
    1092:	0a 00       	.word	0x000a	; ????
    1094:	00 f5       	brcc	.+64     	; 0x10d6 <__LOCK_REGION_LENGTH__+0xcd6>
    1096:	01 34       	cpi	r16, 0x41	; 65
    1098:	00 03       	mulsu	r16, r16
    109a:	0e 3a       	cpi	r16, 0xAE	; 174
    109c:	0b 3b       	cpi	r16, 0xBB	; 187
    109e:	0b 49       	sbci	r16, 0x9B	; 155
    10a0:	13 3f       	cpi	r17, 0xF3	; 243
    10a2:	0c 02       	muls	r16, r28
    10a4:	0a 00       	.word	0x000a	; ????
    10a6:	00 f6       	brcc	.-128    	; 0x1028 <__LOCK_REGION_LENGTH__+0xc28>
    10a8:	01 34       	cpi	r16, 0x41	; 65
    10aa:	00 03       	mulsu	r16, r16
    10ac:	0e 3a       	cpi	r16, 0xAE	; 174
    10ae:	0b 3b       	cpi	r16, 0xBB	; 187
    10b0:	0b 49       	sbci	r16, 0x9B	; 155
    10b2:	13 3f       	cpi	r17, 0xF3	; 243
    10b4:	0c 02       	muls	r16, r28
    10b6:	0a 00       	.word	0x000a	; ????
    10b8:	00 f7       	brcc	.-64     	; 0x107a <__LOCK_REGION_LENGTH__+0xc7a>
    10ba:	01 34       	cpi	r16, 0x41	; 65
    10bc:	00 03       	mulsu	r16, r16
    10be:	0e 3a       	cpi	r16, 0xAE	; 174
    10c0:	0b 3b       	cpi	r16, 0xBB	; 187
    10c2:	0b 49       	sbci	r16, 0x9B	; 155
    10c4:	13 3f       	cpi	r17, 0xF3	; 243
    10c6:	0c 02       	muls	r16, r28
    10c8:	0a 00       	.word	0x000a	; ????
    10ca:	00 f8       	bld	r0, 0
    10cc:	01 34       	cpi	r16, 0x41	; 65
    10ce:	00 03       	mulsu	r16, r16
    10d0:	0e 3a       	cpi	r16, 0xAE	; 174
    10d2:	0b 3b       	cpi	r16, 0xBB	; 187
    10d4:	0b 49       	sbci	r16, 0x9B	; 155
    10d6:	13 3f       	cpi	r17, 0xF3	; 243
    10d8:	0c 02       	muls	r16, r28
    10da:	0a 00       	.word	0x000a	; ????
    10dc:	00 f9       	bld	r16, 0
    10de:	01 34       	cpi	r16, 0x41	; 65
    10e0:	00 03       	mulsu	r16, r16
    10e2:	0e 3a       	cpi	r16, 0xAE	; 174
    10e4:	0b 3b       	cpi	r16, 0xBB	; 187
    10e6:	0b 49       	sbci	r16, 0x9B	; 155
    10e8:	13 3f       	cpi	r17, 0xF3	; 243
    10ea:	0c 02       	muls	r16, r28
    10ec:	0a 00       	.word	0x000a	; ????
    10ee:	00 fa       	bst	r0, 0
    10f0:	01 34       	cpi	r16, 0x41	; 65
    10f2:	00 03       	mulsu	r16, r16
    10f4:	0e 3a       	cpi	r16, 0xAE	; 174
    10f6:	0b 3b       	cpi	r16, 0xBB	; 187
    10f8:	0b 49       	sbci	r16, 0x9B	; 155
    10fa:	13 3f       	cpi	r17, 0xF3	; 243
    10fc:	0c 02       	muls	r16, r28
    10fe:	0a 00       	.word	0x000a	; ????
    1100:	00 fb       	bst	r16, 0
    1102:	01 34       	cpi	r16, 0x41	; 65
    1104:	00 03       	mulsu	r16, r16
    1106:	0e 3a       	cpi	r16, 0xAE	; 174
    1108:	0b 3b       	cpi	r16, 0xBB	; 187
    110a:	0b 49       	sbci	r16, 0x9B	; 155
    110c:	13 3f       	cpi	r17, 0xF3	; 243
    110e:	0c 02       	muls	r16, r28
    1110:	0a 00       	.word	0x000a	; ????
    1112:	00 fc       	sbrc	r0, 0
    1114:	01 34       	cpi	r16, 0x41	; 65
    1116:	00 03       	mulsu	r16, r16
    1118:	0e 3a       	cpi	r16, 0xAE	; 174
    111a:	0b 3b       	cpi	r16, 0xBB	; 187
    111c:	0b 49       	sbci	r16, 0x9B	; 155
    111e:	13 3f       	cpi	r17, 0xF3	; 243
    1120:	0c 02       	muls	r16, r28
    1122:	0a 00       	.word	0x000a	; ????
    1124:	00 fd       	sbrc	r16, 0
    1126:	01 34       	cpi	r16, 0x41	; 65
    1128:	00 03       	mulsu	r16, r16
    112a:	0e 3a       	cpi	r16, 0xAE	; 174
    112c:	0b 3b       	cpi	r16, 0xBB	; 187
    112e:	0b 49       	sbci	r16, 0x9B	; 155
    1130:	13 3f       	cpi	r17, 0xF3	; 243
    1132:	0c 02       	muls	r16, r28
    1134:	0a 00       	.word	0x000a	; ????
    1136:	00 fe       	sbrs	r0, 0
    1138:	01 34       	cpi	r16, 0x41	; 65
    113a:	00 03       	mulsu	r16, r16
    113c:	0e 3a       	cpi	r16, 0xAE	; 174
    113e:	0b 3b       	cpi	r16, 0xBB	; 187
    1140:	0b 49       	sbci	r16, 0x9B	; 155
    1142:	13 3f       	cpi	r17, 0xF3	; 243
    1144:	0c 02       	muls	r16, r28
    1146:	0a 00       	.word	0x000a	; ????
    1148:	00 ff       	sbrs	r16, 0
    114a:	01 34       	cpi	r16, 0x41	; 65
    114c:	00 03       	mulsu	r16, r16
    114e:	0e 3a       	cpi	r16, 0xAE	; 174
    1150:	0b 3b       	cpi	r16, 0xBB	; 187
    1152:	0b 49       	sbci	r16, 0x9B	; 155
    1154:	13 3f       	cpi	r17, 0xF3	; 243
    1156:	0c 02       	muls	r16, r28
    1158:	0a 00       	.word	0x000a	; ????
    115a:	00 80       	ld	r0, Z
    115c:	02 34       	cpi	r16, 0x42	; 66
    115e:	00 03       	mulsu	r16, r16
    1160:	0e 3a       	cpi	r16, 0xAE	; 174
    1162:	0b 3b       	cpi	r16, 0xBB	; 187
    1164:	0b 49       	sbci	r16, 0x9B	; 155
    1166:	13 3f       	cpi	r17, 0xF3	; 243
    1168:	0c 02       	muls	r16, r28
    116a:	0a 00       	.word	0x000a	; ????
    116c:	00 81       	ld	r16, Z
    116e:	02 34       	cpi	r16, 0x42	; 66
    1170:	00 03       	mulsu	r16, r16
    1172:	0e 3a       	cpi	r16, 0xAE	; 174
    1174:	0b 3b       	cpi	r16, 0xBB	; 187
    1176:	0b 49       	sbci	r16, 0x9B	; 155
    1178:	13 3f       	cpi	r17, 0xF3	; 243
    117a:	0c 02       	muls	r16, r28
    117c:	0a 00       	.word	0x000a	; ????
    117e:	00 82       	st	Z, r0
    1180:	02 34       	cpi	r16, 0x42	; 66
    1182:	00 03       	mulsu	r16, r16
    1184:	0e 3a       	cpi	r16, 0xAE	; 174
    1186:	0b 3b       	cpi	r16, 0xBB	; 187
    1188:	0b 49       	sbci	r16, 0x9B	; 155
    118a:	13 3f       	cpi	r17, 0xF3	; 243
    118c:	0c 02       	muls	r16, r28
    118e:	0a 00       	.word	0x000a	; ????
    1190:	00 83       	st	Z, r16
    1192:	02 34       	cpi	r16, 0x42	; 66
    1194:	00 03       	mulsu	r16, r16
    1196:	0e 3a       	cpi	r16, 0xAE	; 174
    1198:	0b 3b       	cpi	r16, 0xBB	; 187
    119a:	0b 49       	sbci	r16, 0x9B	; 155
    119c:	13 3f       	cpi	r17, 0xF3	; 243
    119e:	0c 02       	muls	r16, r28
    11a0:	0a 00       	.word	0x000a	; ????
    11a2:	00 84       	ldd	r0, Z+8	; 0x08
    11a4:	02 34       	cpi	r16, 0x42	; 66
    11a6:	00 03       	mulsu	r16, r16
    11a8:	0e 3a       	cpi	r16, 0xAE	; 174
    11aa:	0b 3b       	cpi	r16, 0xBB	; 187
    11ac:	0b 49       	sbci	r16, 0x9B	; 155
    11ae:	13 3f       	cpi	r17, 0xF3	; 243
    11b0:	0c 02       	muls	r16, r28
    11b2:	0a 00       	.word	0x000a	; ????
    11b4:	00 85       	ldd	r16, Z+8	; 0x08
    11b6:	02 34       	cpi	r16, 0x42	; 66
    11b8:	00 03       	mulsu	r16, r16
    11ba:	0e 3a       	cpi	r16, 0xAE	; 174
    11bc:	0b 3b       	cpi	r16, 0xBB	; 187
    11be:	0b 49       	sbci	r16, 0x9B	; 155
    11c0:	13 3f       	cpi	r17, 0xF3	; 243
    11c2:	0c 02       	muls	r16, r28
    11c4:	0a 00       	.word	0x000a	; ????
    11c6:	00 86       	std	Z+8, r0	; 0x08
    11c8:	02 34       	cpi	r16, 0x42	; 66
    11ca:	00 03       	mulsu	r16, r16
    11cc:	0e 3a       	cpi	r16, 0xAE	; 174
    11ce:	0b 3b       	cpi	r16, 0xBB	; 187
    11d0:	0b 49       	sbci	r16, 0x9B	; 155
    11d2:	13 3f       	cpi	r17, 0xF3	; 243
    11d4:	0c 02       	muls	r16, r28
    11d6:	0a 00       	.word	0x000a	; ????
    11d8:	00 87       	std	Z+8, r16	; 0x08
    11da:	02 34       	cpi	r16, 0x42	; 66
    11dc:	00 03       	mulsu	r16, r16
    11de:	0e 3a       	cpi	r16, 0xAE	; 174
    11e0:	0b 3b       	cpi	r16, 0xBB	; 187
    11e2:	0b 49       	sbci	r16, 0x9B	; 155
    11e4:	13 3f       	cpi	r17, 0xF3	; 243
    11e6:	0c 02       	muls	r16, r28
    11e8:	0a 00       	.word	0x000a	; ????
    11ea:	00 88       	ldd	r0, Z+16	; 0x10
    11ec:	02 34       	cpi	r16, 0x42	; 66
    11ee:	00 03       	mulsu	r16, r16
    11f0:	0e 3a       	cpi	r16, 0xAE	; 174
    11f2:	0b 3b       	cpi	r16, 0xBB	; 187
    11f4:	0b 49       	sbci	r16, 0x9B	; 155
    11f6:	13 3f       	cpi	r17, 0xF3	; 243
    11f8:	0c 02       	muls	r16, r28
    11fa:	0a 00       	.word	0x000a	; ????
    11fc:	00 89       	ldd	r16, Z+16	; 0x10
    11fe:	02 34       	cpi	r16, 0x42	; 66
    1200:	00 03       	mulsu	r16, r16
    1202:	0e 3a       	cpi	r16, 0xAE	; 174
    1204:	0b 3b       	cpi	r16, 0xBB	; 187
    1206:	0b 49       	sbci	r16, 0x9B	; 155
    1208:	13 3f       	cpi	r17, 0xF3	; 243
    120a:	0c 02       	muls	r16, r28
    120c:	0a 00       	.word	0x000a	; ????
    120e:	00 8a       	std	Z+16, r0	; 0x10
    1210:	02 34       	cpi	r16, 0x42	; 66
    1212:	00 03       	mulsu	r16, r16
    1214:	0e 3a       	cpi	r16, 0xAE	; 174
    1216:	0b 3b       	cpi	r16, 0xBB	; 187
    1218:	0b 49       	sbci	r16, 0x9B	; 155
    121a:	13 3f       	cpi	r17, 0xF3	; 243
    121c:	0c 02       	muls	r16, r28
    121e:	0a 00       	.word	0x000a	; ????
    1220:	00 8b       	std	Z+16, r16	; 0x10
    1222:	02 34       	cpi	r16, 0x42	; 66
    1224:	00 03       	mulsu	r16, r16
    1226:	0e 3a       	cpi	r16, 0xAE	; 174
    1228:	0b 3b       	cpi	r16, 0xBB	; 187
    122a:	0b 49       	sbci	r16, 0x9B	; 155
    122c:	13 3f       	cpi	r17, 0xF3	; 243
    122e:	0c 02       	muls	r16, r28
    1230:	0a 00       	.word	0x000a	; ????
    1232:	00 8c       	ldd	r0, Z+24	; 0x18
    1234:	02 34       	cpi	r16, 0x42	; 66
    1236:	00 03       	mulsu	r16, r16
    1238:	0e 3a       	cpi	r16, 0xAE	; 174
    123a:	0b 3b       	cpi	r16, 0xBB	; 187
    123c:	0b 49       	sbci	r16, 0x9B	; 155
    123e:	13 3f       	cpi	r17, 0xF3	; 243
    1240:	0c 02       	muls	r16, r28
    1242:	0a 00       	.word	0x000a	; ????
    1244:	00 8d       	ldd	r16, Z+24	; 0x18
    1246:	02 34       	cpi	r16, 0x42	; 66
    1248:	00 03       	mulsu	r16, r16
    124a:	0e 3a       	cpi	r16, 0xAE	; 174
    124c:	0b 3b       	cpi	r16, 0xBB	; 187
    124e:	0b 49       	sbci	r16, 0x9B	; 155
    1250:	13 3f       	cpi	r17, 0xF3	; 243
    1252:	0c 02       	muls	r16, r28
    1254:	0a 00       	.word	0x000a	; ????
    1256:	00 8e       	std	Z+24, r0	; 0x18
    1258:	02 34       	cpi	r16, 0x42	; 66
    125a:	00 03       	mulsu	r16, r16
    125c:	0e 3a       	cpi	r16, 0xAE	; 174
    125e:	0b 3b       	cpi	r16, 0xBB	; 187
    1260:	0b 49       	sbci	r16, 0x9B	; 155
    1262:	13 3f       	cpi	r17, 0xF3	; 243
    1264:	0c 02       	muls	r16, r28
    1266:	0a 00       	.word	0x000a	; ????
    1268:	00 8f       	std	Z+24, r16	; 0x18
    126a:	02 34       	cpi	r16, 0x42	; 66
    126c:	00 03       	mulsu	r16, r16
    126e:	0e 3a       	cpi	r16, 0xAE	; 174
    1270:	0b 3b       	cpi	r16, 0xBB	; 187
    1272:	0b 49       	sbci	r16, 0x9B	; 155
    1274:	13 3f       	cpi	r17, 0xF3	; 243
    1276:	0c 02       	muls	r16, r28
    1278:	0a 00       	.word	0x000a	; ????
    127a:	00 90 02 34 	lds	r0, 0x3402	; 0x803402 <__DATA_REGION_ORIGIN__+0xc02>
    127e:	00 03       	mulsu	r16, r16
    1280:	0e 3a       	cpi	r16, 0xAE	; 174
    1282:	0b 3b       	cpi	r16, 0xBB	; 187
    1284:	0b 49       	sbci	r16, 0x9B	; 155
    1286:	13 3f       	cpi	r17, 0xF3	; 243
    1288:	0c 02       	muls	r16, r28
    128a:	0a 00       	.word	0x000a	; ????
    128c:	00 91 02 34 	lds	r16, 0x3402	; 0x803402 <__DATA_REGION_ORIGIN__+0xc02>
    1290:	00 03       	mulsu	r16, r16
    1292:	0e 3a       	cpi	r16, 0xAE	; 174
    1294:	0b 3b       	cpi	r16, 0xBB	; 187
    1296:	0b 49       	sbci	r16, 0x9B	; 155
    1298:	13 3f       	cpi	r17, 0xF3	; 243
    129a:	0c 02       	muls	r16, r28
    129c:	0a 00       	.word	0x000a	; ????
    129e:	00 92 02 34 	sts	0x3402, r0	; 0x803402 <__DATA_REGION_ORIGIN__+0xc02>
    12a2:	00 03       	mulsu	r16, r16
    12a4:	0e 3a       	cpi	r16, 0xAE	; 174
    12a6:	0b 3b       	cpi	r16, 0xBB	; 187
    12a8:	0b 49       	sbci	r16, 0x9B	; 155
    12aa:	13 3f       	cpi	r17, 0xF3	; 243
    12ac:	0c 02       	muls	r16, r28
    12ae:	0a 00       	.word	0x000a	; ????
    12b0:	00 93 02 34 	sts	0x3402, r16	; 0x803402 <__DATA_REGION_ORIGIN__+0xc02>
    12b4:	00 03       	mulsu	r16, r16
    12b6:	0e 3a       	cpi	r16, 0xAE	; 174
    12b8:	0b 3b       	cpi	r16, 0xBB	; 187
    12ba:	0b 49       	sbci	r16, 0x9B	; 155
    12bc:	13 3f       	cpi	r17, 0xF3	; 243
    12be:	0c 02       	muls	r16, r28
    12c0:	0a 00       	.word	0x000a	; ????
    12c2:	00 94       	com	r0
    12c4:	02 34       	cpi	r16, 0x42	; 66
    12c6:	00 03       	mulsu	r16, r16
    12c8:	0e 3a       	cpi	r16, 0xAE	; 174
    12ca:	0b 3b       	cpi	r16, 0xBB	; 187
    12cc:	0b 49       	sbci	r16, 0x9B	; 155
    12ce:	13 3f       	cpi	r17, 0xF3	; 243
    12d0:	0c 02       	muls	r16, r28
    12d2:	0a 00       	.word	0x000a	; ????
    12d4:	00 95       	com	r16
    12d6:	02 34       	cpi	r16, 0x42	; 66
    12d8:	00 03       	mulsu	r16, r16
    12da:	0e 3a       	cpi	r16, 0xAE	; 174
    12dc:	0b 3b       	cpi	r16, 0xBB	; 187
    12de:	0b 49       	sbci	r16, 0x9B	; 155
    12e0:	13 3f       	cpi	r17, 0xF3	; 243
    12e2:	0c 02       	muls	r16, r28
    12e4:	0a 00       	.word	0x000a	; ????
    12e6:	00 96       	adiw	r24, 0x00	; 0
    12e8:	02 34       	cpi	r16, 0x42	; 66
    12ea:	00 03       	mulsu	r16, r16
    12ec:	0e 3a       	cpi	r16, 0xAE	; 174
    12ee:	0b 3b       	cpi	r16, 0xBB	; 187
    12f0:	0b 49       	sbci	r16, 0x9B	; 155
    12f2:	13 3f       	cpi	r17, 0xF3	; 243
    12f4:	0c 02       	muls	r16, r28
    12f6:	0a 00       	.word	0x000a	; ????
    12f8:	00 97       	sbiw	r24, 0x00	; 0
    12fa:	02 34       	cpi	r16, 0x42	; 66
    12fc:	00 03       	mulsu	r16, r16
    12fe:	0e 3a       	cpi	r16, 0xAE	; 174
    1300:	0b 3b       	cpi	r16, 0xBB	; 187
    1302:	0b 49       	sbci	r16, 0x9B	; 155
    1304:	13 3f       	cpi	r17, 0xF3	; 243
    1306:	0c 02       	muls	r16, r28
    1308:	0a 00       	.word	0x000a	; ????
    130a:	00 98       	cbi	0x00, 0	; 0
    130c:	02 34       	cpi	r16, 0x42	; 66
    130e:	00 03       	mulsu	r16, r16
    1310:	0e 3a       	cpi	r16, 0xAE	; 174
    1312:	0b 3b       	cpi	r16, 0xBB	; 187
    1314:	0b 49       	sbci	r16, 0x9B	; 155
    1316:	13 3f       	cpi	r17, 0xF3	; 243
    1318:	0c 02       	muls	r16, r28
    131a:	0a 00       	.word	0x000a	; ????
    131c:	00 99       	sbic	0x00, 0	; 0
    131e:	02 34       	cpi	r16, 0x42	; 66
    1320:	00 03       	mulsu	r16, r16
    1322:	0e 3a       	cpi	r16, 0xAE	; 174
    1324:	0b 3b       	cpi	r16, 0xBB	; 187
    1326:	0b 49       	sbci	r16, 0x9B	; 155
    1328:	13 3f       	cpi	r17, 0xF3	; 243
    132a:	0c 02       	muls	r16, r28
    132c:	0a 00       	.word	0x000a	; ????
    132e:	00 9a       	sbi	0x00, 0	; 0
    1330:	02 34       	cpi	r16, 0x42	; 66
    1332:	00 03       	mulsu	r16, r16
    1334:	0e 3a       	cpi	r16, 0xAE	; 174
    1336:	0b 3b       	cpi	r16, 0xBB	; 187
    1338:	0b 49       	sbci	r16, 0x9B	; 155
    133a:	13 3f       	cpi	r17, 0xF3	; 243
    133c:	0c 02       	muls	r16, r28
    133e:	0a 00       	.word	0x000a	; ????
    1340:	00 9b       	sbis	0x00, 0	; 0
    1342:	02 34       	cpi	r16, 0x42	; 66
    1344:	00 03       	mulsu	r16, r16
    1346:	0e 3a       	cpi	r16, 0xAE	; 174
    1348:	0b 3b       	cpi	r16, 0xBB	; 187
    134a:	0b 49       	sbci	r16, 0x9B	; 155
    134c:	13 3f       	cpi	r17, 0xF3	; 243
    134e:	0c 02       	muls	r16, r28
    1350:	0a 00       	.word	0x000a	; ????
    1352:	00 9c       	mul	r0, r0
    1354:	02 34       	cpi	r16, 0x42	; 66
    1356:	00 03       	mulsu	r16, r16
    1358:	0e 3a       	cpi	r16, 0xAE	; 174
    135a:	0b 3b       	cpi	r16, 0xBB	; 187
    135c:	0b 49       	sbci	r16, 0x9B	; 155
    135e:	13 3f       	cpi	r17, 0xF3	; 243
    1360:	0c 02       	muls	r16, r28
    1362:	0a 00       	.word	0x000a	; ????
    1364:	00 9d       	mul	r16, r0
    1366:	02 34       	cpi	r16, 0x42	; 66
    1368:	00 03       	mulsu	r16, r16
    136a:	0e 3a       	cpi	r16, 0xAE	; 174
    136c:	0b 3b       	cpi	r16, 0xBB	; 187
    136e:	0b 49       	sbci	r16, 0x9B	; 155
    1370:	13 3f       	cpi	r17, 0xF3	; 243
    1372:	0c 02       	muls	r16, r28
    1374:	0a 00       	.word	0x000a	; ????
    1376:	00 9e       	mul	r0, r16
    1378:	02 34       	cpi	r16, 0x42	; 66
    137a:	00 03       	mulsu	r16, r16
    137c:	0e 3a       	cpi	r16, 0xAE	; 174
    137e:	0b 3b       	cpi	r16, 0xBB	; 187
    1380:	0b 49       	sbci	r16, 0x9B	; 155
    1382:	13 3f       	cpi	r17, 0xF3	; 243
    1384:	0c 02       	muls	r16, r28
    1386:	0a 00       	.word	0x000a	; ????
    1388:	00 9f       	mul	r16, r16
    138a:	02 34       	cpi	r16, 0x42	; 66
    138c:	00 03       	mulsu	r16, r16
    138e:	0e 3a       	cpi	r16, 0xAE	; 174
    1390:	0b 3b       	cpi	r16, 0xBB	; 187
    1392:	0b 49       	sbci	r16, 0x9B	; 155
    1394:	13 3f       	cpi	r17, 0xF3	; 243
    1396:	0c 02       	muls	r16, r28
    1398:	0a 00       	.word	0x000a	; ????
    139a:	00 a0       	ldd	r0, Z+32	; 0x20
    139c:	02 34       	cpi	r16, 0x42	; 66
    139e:	00 03       	mulsu	r16, r16
    13a0:	0e 3a       	cpi	r16, 0xAE	; 174
    13a2:	0b 3b       	cpi	r16, 0xBB	; 187
    13a4:	0b 49       	sbci	r16, 0x9B	; 155
    13a6:	13 3f       	cpi	r17, 0xF3	; 243
    13a8:	0c 02       	muls	r16, r28
    13aa:	0a 00       	.word	0x000a	; ????
    13ac:	00 a1       	ldd	r16, Z+32	; 0x20
    13ae:	02 34       	cpi	r16, 0x42	; 66
    13b0:	00 03       	mulsu	r16, r16
    13b2:	0e 3a       	cpi	r16, 0xAE	; 174
    13b4:	0b 3b       	cpi	r16, 0xBB	; 187
    13b6:	0b 49       	sbci	r16, 0x9B	; 155
    13b8:	13 3f       	cpi	r17, 0xF3	; 243
    13ba:	0c 02       	muls	r16, r28
    13bc:	0a 00       	.word	0x000a	; ????
    13be:	00 a2       	std	Z+32, r0	; 0x20
    13c0:	02 34       	cpi	r16, 0x42	; 66
    13c2:	00 03       	mulsu	r16, r16
    13c4:	0e 3a       	cpi	r16, 0xAE	; 174
    13c6:	0b 3b       	cpi	r16, 0xBB	; 187
    13c8:	0b 49       	sbci	r16, 0x9B	; 155
    13ca:	13 3f       	cpi	r17, 0xF3	; 243
    13cc:	0c 02       	muls	r16, r28
    13ce:	0a 00       	.word	0x000a	; ????
    13d0:	00 a3       	std	Z+32, r16	; 0x20
    13d2:	02 34       	cpi	r16, 0x42	; 66
    13d4:	00 03       	mulsu	r16, r16
    13d6:	0e 3a       	cpi	r16, 0xAE	; 174
    13d8:	0b 3b       	cpi	r16, 0xBB	; 187
    13da:	0b 49       	sbci	r16, 0x9B	; 155
    13dc:	13 3f       	cpi	r17, 0xF3	; 243
    13de:	0c 02       	muls	r16, r28
    13e0:	0a 00       	.word	0x000a	; ????
    13e2:	00 a4       	ldd	r0, Z+40	; 0x28
    13e4:	02 34       	cpi	r16, 0x42	; 66
    13e6:	00 03       	mulsu	r16, r16
    13e8:	0e 3a       	cpi	r16, 0xAE	; 174
    13ea:	0b 3b       	cpi	r16, 0xBB	; 187
    13ec:	0b 49       	sbci	r16, 0x9B	; 155
    13ee:	13 3f       	cpi	r17, 0xF3	; 243
    13f0:	0c 02       	muls	r16, r28
    13f2:	0a 00       	.word	0x000a	; ????
    13f4:	00 a5       	ldd	r16, Z+40	; 0x28
    13f6:	02 34       	cpi	r16, 0x42	; 66
    13f8:	00 03       	mulsu	r16, r16
    13fa:	0e 3a       	cpi	r16, 0xAE	; 174
    13fc:	0b 3b       	cpi	r16, 0xBB	; 187
    13fe:	0b 49       	sbci	r16, 0x9B	; 155
    1400:	13 3f       	cpi	r17, 0xF3	; 243
    1402:	0c 02       	muls	r16, r28
    1404:	0a 00       	.word	0x000a	; ????
    1406:	00 a6       	std	Z+40, r0	; 0x28
    1408:	02 34       	cpi	r16, 0x42	; 66
    140a:	00 03       	mulsu	r16, r16
    140c:	0e 3a       	cpi	r16, 0xAE	; 174
    140e:	0b 3b       	cpi	r16, 0xBB	; 187
    1410:	0b 49       	sbci	r16, 0x9B	; 155
    1412:	13 3f       	cpi	r17, 0xF3	; 243
    1414:	0c 02       	muls	r16, r28
    1416:	0a 00       	.word	0x000a	; ????
    1418:	00 a7       	std	Z+40, r16	; 0x28
    141a:	02 34       	cpi	r16, 0x42	; 66
    141c:	00 03       	mulsu	r16, r16
    141e:	0e 3a       	cpi	r16, 0xAE	; 174
    1420:	0b 3b       	cpi	r16, 0xBB	; 187
    1422:	0b 49       	sbci	r16, 0x9B	; 155
    1424:	13 3f       	cpi	r17, 0xF3	; 243
    1426:	0c 02       	muls	r16, r28
    1428:	0a 00       	.word	0x000a	; ????
    142a:	00 a8       	ldd	r0, Z+48	; 0x30
    142c:	02 34       	cpi	r16, 0x42	; 66
    142e:	00 03       	mulsu	r16, r16
    1430:	0e 3a       	cpi	r16, 0xAE	; 174
    1432:	0b 3b       	cpi	r16, 0xBB	; 187
    1434:	0b 49       	sbci	r16, 0x9B	; 155
    1436:	13 3f       	cpi	r17, 0xF3	; 243
    1438:	0c 02       	muls	r16, r28
    143a:	0a 00       	.word	0x000a	; ????
    143c:	00 a9       	ldd	r16, Z+48	; 0x30
    143e:	02 34       	cpi	r16, 0x42	; 66
    1440:	00 03       	mulsu	r16, r16
    1442:	0e 3a       	cpi	r16, 0xAE	; 174
    1444:	0b 3b       	cpi	r16, 0xBB	; 187
    1446:	0b 49       	sbci	r16, 0x9B	; 155
    1448:	13 3f       	cpi	r17, 0xF3	; 243
    144a:	0c 02       	muls	r16, r28
    144c:	0a 00       	.word	0x000a	; ????
    144e:	00 aa       	std	Z+48, r0	; 0x30
    1450:	02 34       	cpi	r16, 0x42	; 66
    1452:	00 03       	mulsu	r16, r16
    1454:	0e 3a       	cpi	r16, 0xAE	; 174
    1456:	0b 3b       	cpi	r16, 0xBB	; 187
    1458:	0b 49       	sbci	r16, 0x9B	; 155
    145a:	13 3f       	cpi	r17, 0xF3	; 243
    145c:	0c 02       	muls	r16, r28
    145e:	0a 00       	.word	0x000a	; ????
    1460:	00 ab       	std	Z+48, r16	; 0x30
    1462:	02 34       	cpi	r16, 0x42	; 66
    1464:	00 03       	mulsu	r16, r16
    1466:	0e 3a       	cpi	r16, 0xAE	; 174
    1468:	0b 3b       	cpi	r16, 0xBB	; 187
    146a:	0b 49       	sbci	r16, 0x9B	; 155
    146c:	13 3f       	cpi	r17, 0xF3	; 243
    146e:	0c 02       	muls	r16, r28
    1470:	0a 00       	.word	0x000a	; ????
    1472:	00 ac       	ldd	r0, Z+56	; 0x38
    1474:	02 34       	cpi	r16, 0x42	; 66
    1476:	00 03       	mulsu	r16, r16
    1478:	0e 3a       	cpi	r16, 0xAE	; 174
    147a:	0b 3b       	cpi	r16, 0xBB	; 187
    147c:	0b 49       	sbci	r16, 0x9B	; 155
    147e:	13 3f       	cpi	r17, 0xF3	; 243
    1480:	0c 02       	muls	r16, r28
    1482:	0a 00       	.word	0x000a	; ????
    1484:	00 ad       	ldd	r16, Z+56	; 0x38
    1486:	02 34       	cpi	r16, 0x42	; 66
    1488:	00 03       	mulsu	r16, r16
    148a:	0e 3a       	cpi	r16, 0xAE	; 174
    148c:	0b 3b       	cpi	r16, 0xBB	; 187
    148e:	0b 49       	sbci	r16, 0x9B	; 155
    1490:	13 3f       	cpi	r17, 0xF3	; 243
    1492:	0c 02       	muls	r16, r28
    1494:	0a 00       	.word	0x000a	; ????
    1496:	00 ae       	std	Z+56, r0	; 0x38
    1498:	02 34       	cpi	r16, 0x42	; 66
    149a:	00 03       	mulsu	r16, r16
    149c:	0e 3a       	cpi	r16, 0xAE	; 174
    149e:	0b 3b       	cpi	r16, 0xBB	; 187
    14a0:	0b 49       	sbci	r16, 0x9B	; 155
    14a2:	13 3f       	cpi	r17, 0xF3	; 243
    14a4:	0c 02       	muls	r16, r28
    14a6:	0a 00       	.word	0x000a	; ????
    14a8:	00 af       	std	Z+56, r16	; 0x38
    14aa:	02 34       	cpi	r16, 0x42	; 66
    14ac:	00 03       	mulsu	r16, r16
    14ae:	0e 3a       	cpi	r16, 0xAE	; 174
    14b0:	0b 3b       	cpi	r16, 0xBB	; 187
    14b2:	0b 49       	sbci	r16, 0x9B	; 155
    14b4:	13 3f       	cpi	r17, 0xF3	; 243
    14b6:	0c 02       	muls	r16, r28
    14b8:	0a 00       	.word	0x000a	; ????
    14ba:	00 b0       	in	r0, 0x00	; 0
    14bc:	02 34       	cpi	r16, 0x42	; 66
    14be:	00 03       	mulsu	r16, r16
    14c0:	0e 3a       	cpi	r16, 0xAE	; 174
    14c2:	0b 3b       	cpi	r16, 0xBB	; 187
    14c4:	0b 49       	sbci	r16, 0x9B	; 155
    14c6:	13 3f       	cpi	r17, 0xF3	; 243
    14c8:	0c 02       	muls	r16, r28
    14ca:	0a 00       	.word	0x000a	; ????
    14cc:	00 b1       	in	r16, 0x00	; 0
    14ce:	02 34       	cpi	r16, 0x42	; 66
    14d0:	00 03       	mulsu	r16, r16
    14d2:	0e 3a       	cpi	r16, 0xAE	; 174
    14d4:	0b 3b       	cpi	r16, 0xBB	; 187
    14d6:	0b 49       	sbci	r16, 0x9B	; 155
    14d8:	13 3f       	cpi	r17, 0xF3	; 243
    14da:	0c 02       	muls	r16, r28
    14dc:	0a 00       	.word	0x000a	; ????
    14de:	00 b2       	in	r0, 0x10	; 16
    14e0:	02 34       	cpi	r16, 0x42	; 66
    14e2:	00 03       	mulsu	r16, r16
    14e4:	0e 3a       	cpi	r16, 0xAE	; 174
    14e6:	0b 3b       	cpi	r16, 0xBB	; 187
    14e8:	0b 49       	sbci	r16, 0x9B	; 155
    14ea:	13 3f       	cpi	r17, 0xF3	; 243
    14ec:	0c 02       	muls	r16, r28
    14ee:	0a 00       	.word	0x000a	; ????
    14f0:	00 b3       	in	r16, 0x10	; 16
    14f2:	02 34       	cpi	r16, 0x42	; 66
    14f4:	00 03       	mulsu	r16, r16
    14f6:	0e 3a       	cpi	r16, 0xAE	; 174
    14f8:	0b 3b       	cpi	r16, 0xBB	; 187
    14fa:	0b 49       	sbci	r16, 0x9B	; 155
    14fc:	13 3f       	cpi	r17, 0xF3	; 243
    14fe:	0c 02       	muls	r16, r28
    1500:	0a 00       	.word	0x000a	; ????
    1502:	00 b4       	in	r0, 0x20	; 32
    1504:	02 34       	cpi	r16, 0x42	; 66
    1506:	00 03       	mulsu	r16, r16
    1508:	0e 3a       	cpi	r16, 0xAE	; 174
    150a:	0b 3b       	cpi	r16, 0xBB	; 187
    150c:	0b 49       	sbci	r16, 0x9B	; 155
    150e:	13 3f       	cpi	r17, 0xF3	; 243
    1510:	0c 02       	muls	r16, r28
    1512:	0a 00       	.word	0x000a	; ????
    1514:	00 b5       	in	r16, 0x20	; 32
    1516:	02 34       	cpi	r16, 0x42	; 66
    1518:	00 03       	mulsu	r16, r16
    151a:	0e 3a       	cpi	r16, 0xAE	; 174
    151c:	0b 3b       	cpi	r16, 0xBB	; 187
    151e:	0b 49       	sbci	r16, 0x9B	; 155
    1520:	13 3f       	cpi	r17, 0xF3	; 243
    1522:	0c 02       	muls	r16, r28
    1524:	0a 00       	.word	0x000a	; ????
    1526:	00 b6       	in	r0, 0x30	; 48
    1528:	02 34       	cpi	r16, 0x42	; 66
    152a:	00 03       	mulsu	r16, r16
    152c:	0e 3a       	cpi	r16, 0xAE	; 174
    152e:	0b 3b       	cpi	r16, 0xBB	; 187
    1530:	0b 49       	sbci	r16, 0x9B	; 155
    1532:	13 3f       	cpi	r17, 0xF3	; 243
    1534:	0c 02       	muls	r16, r28
    1536:	0a 00       	.word	0x000a	; ????
    1538:	00 b7       	in	r16, 0x30	; 48
    153a:	02 34       	cpi	r16, 0x42	; 66
    153c:	00 03       	mulsu	r16, r16
    153e:	0e 3a       	cpi	r16, 0xAE	; 174
    1540:	0b 3b       	cpi	r16, 0xBB	; 187
    1542:	0b 49       	sbci	r16, 0x9B	; 155
    1544:	13 3f       	cpi	r17, 0xF3	; 243
    1546:	0c 02       	muls	r16, r28
    1548:	0a 00       	.word	0x000a	; ????
    154a:	00 b8       	out	0x00, r0	; 0
    154c:	02 34       	cpi	r16, 0x42	; 66
    154e:	00 03       	mulsu	r16, r16
    1550:	0e 3a       	cpi	r16, 0xAE	; 174
    1552:	0b 3b       	cpi	r16, 0xBB	; 187
    1554:	0b 49       	sbci	r16, 0x9B	; 155
    1556:	13 3f       	cpi	r17, 0xF3	; 243
    1558:	0c 02       	muls	r16, r28
    155a:	0a 00       	.word	0x000a	; ????
    155c:	00 b9       	out	0x00, r16	; 0
    155e:	02 34       	cpi	r16, 0x42	; 66
    1560:	00 03       	mulsu	r16, r16
    1562:	0e 3a       	cpi	r16, 0xAE	; 174
    1564:	0b 3b       	cpi	r16, 0xBB	; 187
    1566:	0b 49       	sbci	r16, 0x9B	; 155
    1568:	13 3f       	cpi	r17, 0xF3	; 243
    156a:	0c 02       	muls	r16, r28
    156c:	0a 00       	.word	0x000a	; ????
    156e:	00 ba       	out	0x10, r0	; 16
    1570:	02 34       	cpi	r16, 0x42	; 66
    1572:	00 03       	mulsu	r16, r16
    1574:	0e 3a       	cpi	r16, 0xAE	; 174
    1576:	0b 3b       	cpi	r16, 0xBB	; 187
    1578:	0b 49       	sbci	r16, 0x9B	; 155
    157a:	13 3f       	cpi	r17, 0xF3	; 243
    157c:	0c 02       	muls	r16, r28
    157e:	0a 00       	.word	0x000a	; ????
    1580:	00 bb       	out	0x10, r16	; 16
    1582:	02 34       	cpi	r16, 0x42	; 66
    1584:	00 03       	mulsu	r16, r16
    1586:	0e 3a       	cpi	r16, 0xAE	; 174
    1588:	0b 3b       	cpi	r16, 0xBB	; 187
    158a:	0b 49       	sbci	r16, 0x9B	; 155
    158c:	13 3f       	cpi	r17, 0xF3	; 243
    158e:	0c 02       	muls	r16, r28
    1590:	0a 00       	.word	0x000a	; ????
    1592:	00 bc       	out	0x20, r0	; 32
    1594:	02 34       	cpi	r16, 0x42	; 66
    1596:	00 03       	mulsu	r16, r16
    1598:	0e 3a       	cpi	r16, 0xAE	; 174
    159a:	0b 3b       	cpi	r16, 0xBB	; 187
    159c:	0b 49       	sbci	r16, 0x9B	; 155
    159e:	13 3f       	cpi	r17, 0xF3	; 243
    15a0:	0c 02       	muls	r16, r28
    15a2:	0a 00       	.word	0x000a	; ????
    15a4:	00 bd       	out	0x20, r16	; 32
    15a6:	02 34       	cpi	r16, 0x42	; 66
    15a8:	00 03       	mulsu	r16, r16
    15aa:	0e 3a       	cpi	r16, 0xAE	; 174
    15ac:	0b 3b       	cpi	r16, 0xBB	; 187
    15ae:	0b 49       	sbci	r16, 0x9B	; 155
    15b0:	13 3f       	cpi	r17, 0xF3	; 243
    15b2:	0c 02       	muls	r16, r28
    15b4:	0a 00       	.word	0x000a	; ????
    15b6:	00 be       	out	0x30, r0	; 48
    15b8:	02 34       	cpi	r16, 0x42	; 66
    15ba:	00 03       	mulsu	r16, r16
    15bc:	0e 3a       	cpi	r16, 0xAE	; 174
    15be:	0b 3b       	cpi	r16, 0xBB	; 187
    15c0:	0b 49       	sbci	r16, 0x9B	; 155
    15c2:	13 3f       	cpi	r17, 0xF3	; 243
    15c4:	0c 02       	muls	r16, r28
    15c6:	0a 00       	.word	0x000a	; ????
    15c8:	00 bf       	out	0x30, r16	; 48
    15ca:	02 34       	cpi	r16, 0x42	; 66
    15cc:	00 03       	mulsu	r16, r16
    15ce:	0e 3a       	cpi	r16, 0xAE	; 174
    15d0:	0b 3b       	cpi	r16, 0xBB	; 187
    15d2:	0b 49       	sbci	r16, 0x9B	; 155
    15d4:	13 3f       	cpi	r17, 0xF3	; 243
    15d6:	0c 02       	muls	r16, r28
    15d8:	0a 00       	.word	0x000a	; ????
    15da:	00 c0       	rjmp	.+0      	; 0x15dc <__LOCK_REGION_LENGTH__+0x11dc>
    15dc:	02 34       	cpi	r16, 0x42	; 66
    15de:	00 03       	mulsu	r16, r16
    15e0:	0e 3a       	cpi	r16, 0xAE	; 174
    15e2:	0b 3b       	cpi	r16, 0xBB	; 187
    15e4:	0b 49       	sbci	r16, 0x9B	; 155
    15e6:	13 3f       	cpi	r17, 0xF3	; 243
    15e8:	0c 02       	muls	r16, r28
    15ea:	0a 00       	.word	0x000a	; ????
    15ec:	00 c1       	rjmp	.+512    	; 0x17ee <__LOCK_REGION_LENGTH__+0x13ee>
    15ee:	02 34       	cpi	r16, 0x42	; 66
    15f0:	00 03       	mulsu	r16, r16
    15f2:	0e 3a       	cpi	r16, 0xAE	; 174
    15f4:	0b 3b       	cpi	r16, 0xBB	; 187
    15f6:	0b 49       	sbci	r16, 0x9B	; 155
    15f8:	13 3f       	cpi	r17, 0xF3	; 243
    15fa:	0c 02       	muls	r16, r28
    15fc:	0a 00       	.word	0x000a	; ????
    15fe:	00 c2       	rjmp	.+1024   	; 0x1a00 <__DATA_REGION_LENGTH__+0x200>
    1600:	02 34       	cpi	r16, 0x42	; 66
    1602:	00 03       	mulsu	r16, r16
    1604:	0e 3a       	cpi	r16, 0xAE	; 174
    1606:	0b 3b       	cpi	r16, 0xBB	; 187
    1608:	0b 49       	sbci	r16, 0x9B	; 155
    160a:	13 3f       	cpi	r17, 0xF3	; 243
    160c:	0c 02       	muls	r16, r28
    160e:	0a 00       	.word	0x000a	; ????
    1610:	00 c3       	rjmp	.+1536   	; 0x1c12 <__DATA_REGION_LENGTH__+0x412>
    1612:	02 34       	cpi	r16, 0x42	; 66
    1614:	00 03       	mulsu	r16, r16
    1616:	0e 3a       	cpi	r16, 0xAE	; 174
    1618:	0b 3b       	cpi	r16, 0xBB	; 187
    161a:	0b 49       	sbci	r16, 0x9B	; 155
    161c:	13 3f       	cpi	r17, 0xF3	; 243
    161e:	0c 02       	muls	r16, r28
    1620:	0a 00       	.word	0x000a	; ????
    1622:	00 c4       	rjmp	.+2048   	; 0x1e24 <__DATA_REGION_LENGTH__+0x624>
    1624:	02 34       	cpi	r16, 0x42	; 66
    1626:	00 03       	mulsu	r16, r16
    1628:	0e 3a       	cpi	r16, 0xAE	; 174
    162a:	0b 3b       	cpi	r16, 0xBB	; 187
    162c:	0b 49       	sbci	r16, 0x9B	; 155
    162e:	13 3f       	cpi	r17, 0xF3	; 243
    1630:	0c 02       	muls	r16, r28
    1632:	0a 00       	.word	0x000a	; ????
    1634:	00 c5       	rjmp	.+2560   	; 0x2036 <__DATA_REGION_LENGTH__+0x836>
    1636:	02 34       	cpi	r16, 0x42	; 66
    1638:	00 03       	mulsu	r16, r16
    163a:	0e 3a       	cpi	r16, 0xAE	; 174
    163c:	0b 3b       	cpi	r16, 0xBB	; 187
    163e:	0b 49       	sbci	r16, 0x9B	; 155
    1640:	13 3f       	cpi	r17, 0xF3	; 243
    1642:	0c 02       	muls	r16, r28
    1644:	0a 00       	.word	0x000a	; ????
    1646:	00 c6       	rjmp	.+3072   	; 0x2248 <__DATA_REGION_LENGTH__+0xa48>
    1648:	02 34       	cpi	r16, 0x42	; 66
    164a:	00 03       	mulsu	r16, r16
    164c:	0e 3a       	cpi	r16, 0xAE	; 174
    164e:	0b 3b       	cpi	r16, 0xBB	; 187
    1650:	0b 49       	sbci	r16, 0x9B	; 155
    1652:	13 3f       	cpi	r17, 0xF3	; 243
    1654:	0c 02       	muls	r16, r28
    1656:	0a 00       	.word	0x000a	; ????
    1658:	00 c7       	rjmp	.+3584   	; 0x245a <__DATA_REGION_LENGTH__+0xc5a>
    165a:	02 34       	cpi	r16, 0x42	; 66
    165c:	00 03       	mulsu	r16, r16
    165e:	0e 3a       	cpi	r16, 0xAE	; 174
    1660:	0b 3b       	cpi	r16, 0xBB	; 187
    1662:	0b 49       	sbci	r16, 0x9B	; 155
    1664:	13 3f       	cpi	r17, 0xF3	; 243
    1666:	0c 02       	muls	r16, r28
    1668:	0a 00       	.word	0x000a	; ????
    166a:	00 c8       	rjmp	.-4096   	; 0x66c <__LOCK_REGION_LENGTH__+0x26c>
    166c:	02 34       	cpi	r16, 0x42	; 66
    166e:	00 03       	mulsu	r16, r16
    1670:	0e 3a       	cpi	r16, 0xAE	; 174
    1672:	0b 3b       	cpi	r16, 0xBB	; 187
    1674:	0b 49       	sbci	r16, 0x9B	; 155
    1676:	13 3f       	cpi	r17, 0xF3	; 243
    1678:	0c 02       	muls	r16, r28
    167a:	0a 00       	.word	0x000a	; ????
    167c:	00 c9       	rjmp	.-3584   	; 0x87e <__LOCK_REGION_LENGTH__+0x47e>
    167e:	02 34       	cpi	r16, 0x42	; 66
    1680:	00 03       	mulsu	r16, r16
    1682:	0e 3a       	cpi	r16, 0xAE	; 174
    1684:	0b 3b       	cpi	r16, 0xBB	; 187
    1686:	0b 49       	sbci	r16, 0x9B	; 155
    1688:	13 3f       	cpi	r17, 0xF3	; 243
    168a:	0c 02       	muls	r16, r28
    168c:	0a 00       	.word	0x000a	; ????
    168e:	00 ca       	rjmp	.-3072   	; 0xa90 <__LOCK_REGION_LENGTH__+0x690>
    1690:	02 34       	cpi	r16, 0x42	; 66
    1692:	00 03       	mulsu	r16, r16
    1694:	0e 3a       	cpi	r16, 0xAE	; 174
    1696:	0b 3b       	cpi	r16, 0xBB	; 187
    1698:	0b 49       	sbci	r16, 0x9B	; 155
    169a:	13 3f       	cpi	r17, 0xF3	; 243
    169c:	0c 02       	muls	r16, r28
    169e:	0a 00       	.word	0x000a	; ????
    16a0:	00 cb       	rjmp	.-2560   	; 0xca2 <__LOCK_REGION_LENGTH__+0x8a2>
    16a2:	02 34       	cpi	r16, 0x42	; 66
    16a4:	00 03       	mulsu	r16, r16
    16a6:	0e 3a       	cpi	r16, 0xAE	; 174
    16a8:	0b 3b       	cpi	r16, 0xBB	; 187
    16aa:	0b 49       	sbci	r16, 0x9B	; 155
    16ac:	13 3f       	cpi	r17, 0xF3	; 243
    16ae:	0c 02       	muls	r16, r28
    16b0:	0a 00       	.word	0x000a	; ????
    16b2:	00 cc       	rjmp	.-2048   	; 0xeb4 <__LOCK_REGION_LENGTH__+0xab4>
    16b4:	02 34       	cpi	r16, 0x42	; 66
    16b6:	00 03       	mulsu	r16, r16
    16b8:	0e 3a       	cpi	r16, 0xAE	; 174
    16ba:	0b 3b       	cpi	r16, 0xBB	; 187
    16bc:	0b 49       	sbci	r16, 0x9B	; 155
    16be:	13 3f       	cpi	r17, 0xF3	; 243
    16c0:	0c 02       	muls	r16, r28
    16c2:	0a 00       	.word	0x000a	; ????
    16c4:	00 cd       	rjmp	.-1536   	; 0x10c6 <__LOCK_REGION_LENGTH__+0xcc6>
    16c6:	02 34       	cpi	r16, 0x42	; 66
    16c8:	00 03       	mulsu	r16, r16
    16ca:	0e 3a       	cpi	r16, 0xAE	; 174
    16cc:	0b 3b       	cpi	r16, 0xBB	; 187
    16ce:	0b 49       	sbci	r16, 0x9B	; 155
    16d0:	13 3f       	cpi	r17, 0xF3	; 243
    16d2:	0c 02       	muls	r16, r28
    16d4:	0a 00       	.word	0x000a	; ????
    16d6:	00 ce       	rjmp	.-1024   	; 0x12d8 <__LOCK_REGION_LENGTH__+0xed8>
    16d8:	02 34       	cpi	r16, 0x42	; 66
    16da:	00 03       	mulsu	r16, r16
    16dc:	0e 3a       	cpi	r16, 0xAE	; 174
    16de:	0b 3b       	cpi	r16, 0xBB	; 187
    16e0:	0b 49       	sbci	r16, 0x9B	; 155
    16e2:	13 3f       	cpi	r17, 0xF3	; 243
    16e4:	0c 02       	muls	r16, r28
    16e6:	0a 00       	.word	0x000a	; ????
    16e8:	00 cf       	rjmp	.-512    	; 0x14ea <__LOCK_REGION_LENGTH__+0x10ea>
    16ea:	02 34       	cpi	r16, 0x42	; 66
    16ec:	00 03       	mulsu	r16, r16
    16ee:	0e 3a       	cpi	r16, 0xAE	; 174
    16f0:	0b 3b       	cpi	r16, 0xBB	; 187
    16f2:	0b 49       	sbci	r16, 0x9B	; 155
    16f4:	13 3f       	cpi	r17, 0xF3	; 243
    16f6:	0c 02       	muls	r16, r28
    16f8:	0a 00       	.word	0x000a	; ????
    16fa:	00 d0       	rcall	.+0      	; 0x16fc <__LOCK_REGION_LENGTH__+0x12fc>
    16fc:	02 34       	cpi	r16, 0x42	; 66
    16fe:	00 03       	mulsu	r16, r16
    1700:	0e 3a       	cpi	r16, 0xAE	; 174
    1702:	0b 3b       	cpi	r16, 0xBB	; 187
    1704:	0b 49       	sbci	r16, 0x9B	; 155
    1706:	13 3f       	cpi	r17, 0xF3	; 243
    1708:	0c 02       	muls	r16, r28
    170a:	0a 00       	.word	0x000a	; ????
    170c:	00 d1       	rcall	.+512    	; 0x190e <__DATA_REGION_LENGTH__+0x10e>
    170e:	02 34       	cpi	r16, 0x42	; 66
    1710:	00 03       	mulsu	r16, r16
    1712:	0e 3a       	cpi	r16, 0xAE	; 174
    1714:	0b 3b       	cpi	r16, 0xBB	; 187
    1716:	0b 49       	sbci	r16, 0x9B	; 155
    1718:	13 3f       	cpi	r17, 0xF3	; 243
    171a:	0c 02       	muls	r16, r28
    171c:	0a 00       	.word	0x000a	; ????
    171e:	00 d2       	rcall	.+1024   	; 0x1b20 <__DATA_REGION_LENGTH__+0x320>
    1720:	02 34       	cpi	r16, 0x42	; 66
    1722:	00 03       	mulsu	r16, r16
    1724:	0e 3a       	cpi	r16, 0xAE	; 174
    1726:	0b 3b       	cpi	r16, 0xBB	; 187
    1728:	0b 49       	sbci	r16, 0x9B	; 155
    172a:	13 3f       	cpi	r17, 0xF3	; 243
    172c:	0c 02       	muls	r16, r28
    172e:	0a 00       	.word	0x000a	; ????
    1730:	00 d3       	rcall	.+1536   	; 0x1d32 <__DATA_REGION_LENGTH__+0x532>
    1732:	02 34       	cpi	r16, 0x42	; 66
    1734:	00 03       	mulsu	r16, r16
    1736:	0e 3a       	cpi	r16, 0xAE	; 174
    1738:	0b 3b       	cpi	r16, 0xBB	; 187
    173a:	0b 49       	sbci	r16, 0x9B	; 155
    173c:	13 3f       	cpi	r17, 0xF3	; 243
    173e:	0c 02       	muls	r16, r28
    1740:	0a 00       	.word	0x000a	; ????
    1742:	00 d4       	rcall	.+2048   	; 0x1f44 <__DATA_REGION_LENGTH__+0x744>
    1744:	02 34       	cpi	r16, 0x42	; 66
    1746:	00 03       	mulsu	r16, r16
    1748:	0e 3a       	cpi	r16, 0xAE	; 174
    174a:	0b 3b       	cpi	r16, 0xBB	; 187
    174c:	0b 49       	sbci	r16, 0x9B	; 155
    174e:	13 3f       	cpi	r17, 0xF3	; 243
    1750:	0c 02       	muls	r16, r28
    1752:	0a 00       	.word	0x000a	; ????
    1754:	00 d5       	rcall	.+2560   	; 0x2156 <__DATA_REGION_LENGTH__+0x956>
    1756:	02 34       	cpi	r16, 0x42	; 66
    1758:	00 03       	mulsu	r16, r16
    175a:	0e 3a       	cpi	r16, 0xAE	; 174
    175c:	0b 3b       	cpi	r16, 0xBB	; 187
    175e:	0b 49       	sbci	r16, 0x9B	; 155
    1760:	13 3f       	cpi	r17, 0xF3	; 243
    1762:	0c 02       	muls	r16, r28
    1764:	0a 00       	.word	0x000a	; ????
    1766:	00 d6       	rcall	.+3072   	; 0x2368 <__DATA_REGION_LENGTH__+0xb68>
    1768:	02 34       	cpi	r16, 0x42	; 66
    176a:	00 03       	mulsu	r16, r16
    176c:	0e 3a       	cpi	r16, 0xAE	; 174
    176e:	0b 3b       	cpi	r16, 0xBB	; 187
    1770:	0b 49       	sbci	r16, 0x9B	; 155
    1772:	13 3f       	cpi	r17, 0xF3	; 243
    1774:	0c 02       	muls	r16, r28
    1776:	0a 00       	.word	0x000a	; ????
    1778:	00 d7       	rcall	.+3584   	; 0x257a <__DATA_REGION_LENGTH__+0xd7a>
    177a:	02 34       	cpi	r16, 0x42	; 66
    177c:	00 03       	mulsu	r16, r16
    177e:	0e 3a       	cpi	r16, 0xAE	; 174
    1780:	0b 3b       	cpi	r16, 0xBB	; 187
    1782:	0b 49       	sbci	r16, 0x9B	; 155
    1784:	13 3f       	cpi	r17, 0xF3	; 243
    1786:	0c 02       	muls	r16, r28
    1788:	0a 00       	.word	0x000a	; ????
    178a:	00 d8       	rcall	.-4096   	; 0x78c <__LOCK_REGION_LENGTH__+0x38c>
    178c:	02 34       	cpi	r16, 0x42	; 66
    178e:	00 03       	mulsu	r16, r16
    1790:	0e 3a       	cpi	r16, 0xAE	; 174
    1792:	0b 3b       	cpi	r16, 0xBB	; 187
    1794:	0b 49       	sbci	r16, 0x9B	; 155
    1796:	13 3f       	cpi	r17, 0xF3	; 243
    1798:	0c 02       	muls	r16, r28
    179a:	0a 00       	.word	0x000a	; ????
    179c:	00 d9       	rcall	.-3584   	; 0x99e <__LOCK_REGION_LENGTH__+0x59e>
    179e:	02 34       	cpi	r16, 0x42	; 66
    17a0:	00 03       	mulsu	r16, r16
    17a2:	0e 3a       	cpi	r16, 0xAE	; 174
    17a4:	0b 3b       	cpi	r16, 0xBB	; 187
    17a6:	0b 49       	sbci	r16, 0x9B	; 155
    17a8:	13 3f       	cpi	r17, 0xF3	; 243
    17aa:	0c 02       	muls	r16, r28
    17ac:	0a 00       	.word	0x000a	; ????
    17ae:	00 da       	rcall	.-3072   	; 0xbb0 <__LOCK_REGION_LENGTH__+0x7b0>
    17b0:	02 34       	cpi	r16, 0x42	; 66
    17b2:	00 03       	mulsu	r16, r16
    17b4:	0e 3a       	cpi	r16, 0xAE	; 174
    17b6:	0b 3b       	cpi	r16, 0xBB	; 187
    17b8:	0b 49       	sbci	r16, 0x9B	; 155
    17ba:	13 3f       	cpi	r17, 0xF3	; 243
    17bc:	0c 02       	muls	r16, r28
    17be:	0a 00       	.word	0x000a	; ????
    17c0:	00 db       	rcall	.-2560   	; 0xdc2 <__LOCK_REGION_LENGTH__+0x9c2>
    17c2:	02 34       	cpi	r16, 0x42	; 66
    17c4:	00 03       	mulsu	r16, r16
    17c6:	0e 3a       	cpi	r16, 0xAE	; 174
    17c8:	0b 3b       	cpi	r16, 0xBB	; 187
    17ca:	0b 49       	sbci	r16, 0x9B	; 155
    17cc:	13 3f       	cpi	r17, 0xF3	; 243
    17ce:	0c 02       	muls	r16, r28
    17d0:	0a 00       	.word	0x000a	; ????
    17d2:	00 dc       	rcall	.-2048   	; 0xfd4 <__LOCK_REGION_LENGTH__+0xbd4>
    17d4:	02 34       	cpi	r16, 0x42	; 66
    17d6:	00 03       	mulsu	r16, r16
    17d8:	0e 3a       	cpi	r16, 0xAE	; 174
    17da:	0b 3b       	cpi	r16, 0xBB	; 187
    17dc:	0b 49       	sbci	r16, 0x9B	; 155
    17de:	13 3f       	cpi	r17, 0xF3	; 243
    17e0:	0c 02       	muls	r16, r28
    17e2:	0a 00       	.word	0x000a	; ????
    17e4:	00 dd       	rcall	.-1536   	; 0x11e6 <__LOCK_REGION_LENGTH__+0xde6>
    17e6:	02 34       	cpi	r16, 0x42	; 66
    17e8:	00 03       	mulsu	r16, r16
    17ea:	0e 3a       	cpi	r16, 0xAE	; 174
    17ec:	0b 3b       	cpi	r16, 0xBB	; 187
    17ee:	0b 49       	sbci	r16, 0x9B	; 155
    17f0:	13 3f       	cpi	r17, 0xF3	; 243
    17f2:	0c 02       	muls	r16, r28
    17f4:	0a 00       	.word	0x000a	; ????
    17f6:	00 de       	rcall	.-1024   	; 0x13f8 <__LOCK_REGION_LENGTH__+0xff8>
    17f8:	02 34       	cpi	r16, 0x42	; 66
    17fa:	00 03       	mulsu	r16, r16
    17fc:	0e 3a       	cpi	r16, 0xAE	; 174
    17fe:	0b 3b       	cpi	r16, 0xBB	; 187
    1800:	0b 49       	sbci	r16, 0x9B	; 155
    1802:	13 3f       	cpi	r17, 0xF3	; 243
    1804:	0c 02       	muls	r16, r28
    1806:	0a 00       	.word	0x000a	; ????
    1808:	00 df       	rcall	.-512    	; 0x160a <__LOCK_REGION_LENGTH__+0x120a>
    180a:	02 34       	cpi	r16, 0x42	; 66
    180c:	00 03       	mulsu	r16, r16
    180e:	0e 3a       	cpi	r16, 0xAE	; 174
    1810:	0b 3b       	cpi	r16, 0xBB	; 187
    1812:	0b 49       	sbci	r16, 0x9B	; 155
    1814:	13 3f       	cpi	r17, 0xF3	; 243
    1816:	0c 02       	muls	r16, r28
    1818:	0a 00       	.word	0x000a	; ????
    181a:	00 e0       	ldi	r16, 0x00	; 0
    181c:	02 34       	cpi	r16, 0x42	; 66
    181e:	00 03       	mulsu	r16, r16
    1820:	0e 3a       	cpi	r16, 0xAE	; 174
    1822:	0b 3b       	cpi	r16, 0xBB	; 187
    1824:	0b 49       	sbci	r16, 0x9B	; 155
    1826:	13 3f       	cpi	r17, 0xF3	; 243
    1828:	0c 02       	muls	r16, r28
    182a:	0a 00       	.word	0x000a	; ????
    182c:	00 e1       	ldi	r16, 0x10	; 16
    182e:	02 34       	cpi	r16, 0x42	; 66
    1830:	00 03       	mulsu	r16, r16
    1832:	0e 3a       	cpi	r16, 0xAE	; 174
    1834:	0b 3b       	cpi	r16, 0xBB	; 187
    1836:	0b 49       	sbci	r16, 0x9B	; 155
    1838:	13 3f       	cpi	r17, 0xF3	; 243
    183a:	0c 02       	muls	r16, r28
    183c:	0a 00       	.word	0x000a	; ????
    183e:	00 e2       	ldi	r16, 0x20	; 32
    1840:	02 34       	cpi	r16, 0x42	; 66
    1842:	00 03       	mulsu	r16, r16
    1844:	0e 3a       	cpi	r16, 0xAE	; 174
    1846:	0b 3b       	cpi	r16, 0xBB	; 187
    1848:	0b 49       	sbci	r16, 0x9B	; 155
    184a:	13 3f       	cpi	r17, 0xF3	; 243
    184c:	0c 02       	muls	r16, r28
    184e:	0a 00       	.word	0x000a	; ????
    1850:	00 e3       	ldi	r16, 0x30	; 48
    1852:	02 34       	cpi	r16, 0x42	; 66
    1854:	00 03       	mulsu	r16, r16
    1856:	0e 3a       	cpi	r16, 0xAE	; 174
    1858:	0b 3b       	cpi	r16, 0xBB	; 187
    185a:	0b 49       	sbci	r16, 0x9B	; 155
    185c:	13 3f       	cpi	r17, 0xF3	; 243
    185e:	0c 02       	muls	r16, r28
    1860:	0a 00       	.word	0x000a	; ????
    1862:	00 e4       	ldi	r16, 0x40	; 64
    1864:	02 34       	cpi	r16, 0x42	; 66
    1866:	00 03       	mulsu	r16, r16
    1868:	0e 3a       	cpi	r16, 0xAE	; 174
    186a:	0b 3b       	cpi	r16, 0xBB	; 187
    186c:	0b 49       	sbci	r16, 0x9B	; 155
    186e:	13 3f       	cpi	r17, 0xF3	; 243
    1870:	0c 02       	muls	r16, r28
    1872:	0a 00       	.word	0x000a	; ????
    1874:	00 e5       	ldi	r16, 0x50	; 80
    1876:	02 34       	cpi	r16, 0x42	; 66
    1878:	00 03       	mulsu	r16, r16
    187a:	0e 3a       	cpi	r16, 0xAE	; 174
    187c:	0b 3b       	cpi	r16, 0xBB	; 187
    187e:	0b 49       	sbci	r16, 0x9B	; 155
    1880:	13 3f       	cpi	r17, 0xF3	; 243
    1882:	0c 02       	muls	r16, r28
    1884:	0a 00       	.word	0x000a	; ????
    1886:	00 e6       	ldi	r16, 0x60	; 96
    1888:	02 34       	cpi	r16, 0x42	; 66
    188a:	00 03       	mulsu	r16, r16
    188c:	0e 3a       	cpi	r16, 0xAE	; 174
    188e:	0b 3b       	cpi	r16, 0xBB	; 187
    1890:	0b 49       	sbci	r16, 0x9B	; 155
    1892:	13 3f       	cpi	r17, 0xF3	; 243
    1894:	0c 02       	muls	r16, r28
    1896:	0a 00       	.word	0x000a	; ????
    1898:	00 e7       	ldi	r16, 0x70	; 112
    189a:	02 34       	cpi	r16, 0x42	; 66
    189c:	00 03       	mulsu	r16, r16
    189e:	0e 3a       	cpi	r16, 0xAE	; 174
    18a0:	0b 3b       	cpi	r16, 0xBB	; 187
    18a2:	0b 49       	sbci	r16, 0x9B	; 155
    18a4:	13 3f       	cpi	r17, 0xF3	; 243
    18a6:	0c 02       	muls	r16, r28
    18a8:	0a 00       	.word	0x000a	; ????
    18aa:	00 e8       	ldi	r16, 0x80	; 128
    18ac:	02 34       	cpi	r16, 0x42	; 66
    18ae:	00 03       	mulsu	r16, r16
    18b0:	0e 3a       	cpi	r16, 0xAE	; 174
    18b2:	0b 3b       	cpi	r16, 0xBB	; 187
    18b4:	0b 49       	sbci	r16, 0x9B	; 155
    18b6:	13 3f       	cpi	r17, 0xF3	; 243
    18b8:	0c 02       	muls	r16, r28
    18ba:	0a 00       	.word	0x000a	; ????
    18bc:	00 e9       	ldi	r16, 0x90	; 144
    18be:	02 34       	cpi	r16, 0x42	; 66
    18c0:	00 03       	mulsu	r16, r16
    18c2:	0e 3a       	cpi	r16, 0xAE	; 174
    18c4:	0b 3b       	cpi	r16, 0xBB	; 187
    18c6:	0b 49       	sbci	r16, 0x9B	; 155
    18c8:	13 3f       	cpi	r17, 0xF3	; 243
    18ca:	0c 02       	muls	r16, r28
    18cc:	0a 00       	.word	0x000a	; ????
    18ce:	00 ea       	ldi	r16, 0xA0	; 160
    18d0:	02 34       	cpi	r16, 0x42	; 66
    18d2:	00 03       	mulsu	r16, r16
    18d4:	0e 3a       	cpi	r16, 0xAE	; 174
    18d6:	0b 3b       	cpi	r16, 0xBB	; 187
    18d8:	0b 49       	sbci	r16, 0x9B	; 155
    18da:	13 3f       	cpi	r17, 0xF3	; 243
    18dc:	0c 02       	muls	r16, r28
    18de:	0a 00       	.word	0x000a	; ????
    18e0:	00 eb       	ldi	r16, 0xB0	; 176
    18e2:	02 34       	cpi	r16, 0x42	; 66
    18e4:	00 03       	mulsu	r16, r16
    18e6:	0e 3a       	cpi	r16, 0xAE	; 174
    18e8:	0b 3b       	cpi	r16, 0xBB	; 187
    18ea:	0b 49       	sbci	r16, 0x9B	; 155
    18ec:	13 3f       	cpi	r17, 0xF3	; 243
    18ee:	0c 02       	muls	r16, r28
    18f0:	0a 00       	.word	0x000a	; ????
    18f2:	00 ec       	ldi	r16, 0xC0	; 192
    18f4:	02 34       	cpi	r16, 0x42	; 66
    18f6:	00 03       	mulsu	r16, r16
    18f8:	0e 3a       	cpi	r16, 0xAE	; 174
    18fa:	0b 3b       	cpi	r16, 0xBB	; 187
    18fc:	0b 49       	sbci	r16, 0x9B	; 155
    18fe:	13 3f       	cpi	r17, 0xF3	; 243
    1900:	0c 02       	muls	r16, r28
    1902:	0a 00       	.word	0x000a	; ????
    1904:	00 ed       	ldi	r16, 0xD0	; 208
    1906:	02 34       	cpi	r16, 0x42	; 66
    1908:	00 03       	mulsu	r16, r16
    190a:	0e 3a       	cpi	r16, 0xAE	; 174
    190c:	0b 3b       	cpi	r16, 0xBB	; 187
    190e:	0b 49       	sbci	r16, 0x9B	; 155
    1910:	13 3f       	cpi	r17, 0xF3	; 243
    1912:	0c 02       	muls	r16, r28
    1914:	0a 00       	.word	0x000a	; ????
    1916:	00 ee       	ldi	r16, 0xE0	; 224
    1918:	02 34       	cpi	r16, 0x42	; 66
    191a:	00 03       	mulsu	r16, r16
    191c:	0e 3a       	cpi	r16, 0xAE	; 174
    191e:	0b 3b       	cpi	r16, 0xBB	; 187
    1920:	0b 49       	sbci	r16, 0x9B	; 155
    1922:	13 3f       	cpi	r17, 0xF3	; 243
    1924:	0c 02       	muls	r16, r28
    1926:	0a 00       	.word	0x000a	; ????
    1928:	00 ef       	ldi	r16, 0xF0	; 240
    192a:	02 34       	cpi	r16, 0x42	; 66
    192c:	00 03       	mulsu	r16, r16
    192e:	0e 3a       	cpi	r16, 0xAE	; 174
    1930:	0b 3b       	cpi	r16, 0xBB	; 187
    1932:	0b 49       	sbci	r16, 0x9B	; 155
    1934:	13 3f       	cpi	r17, 0xF3	; 243
    1936:	0c 02       	muls	r16, r28
    1938:	0a 00       	.word	0x000a	; ????
    193a:	00 f0       	brcs	.+0      	; 0x193c <__DATA_REGION_LENGTH__+0x13c>
    193c:	02 34       	cpi	r16, 0x42	; 66
    193e:	00 03       	mulsu	r16, r16
    1940:	0e 3a       	cpi	r16, 0xAE	; 174
    1942:	0b 3b       	cpi	r16, 0xBB	; 187
    1944:	0b 49       	sbci	r16, 0x9B	; 155
    1946:	13 3f       	cpi	r17, 0xF3	; 243
    1948:	0c 02       	muls	r16, r28
    194a:	0a 00       	.word	0x000a	; ????
    194c:	00 f1       	brcs	.+64     	; 0x198e <__DATA_REGION_LENGTH__+0x18e>
    194e:	02 34       	cpi	r16, 0x42	; 66
    1950:	00 03       	mulsu	r16, r16
    1952:	0e 3a       	cpi	r16, 0xAE	; 174
    1954:	0b 3b       	cpi	r16, 0xBB	; 187
    1956:	0b 49       	sbci	r16, 0x9B	; 155
    1958:	13 3f       	cpi	r17, 0xF3	; 243
    195a:	0c 02       	muls	r16, r28
    195c:	0a 00       	.word	0x000a	; ????
    195e:	00 f2       	brcs	.-128    	; 0x18e0 <__DATA_REGION_LENGTH__+0xe0>
    1960:	02 34       	cpi	r16, 0x42	; 66
    1962:	00 03       	mulsu	r16, r16
    1964:	0e 3a       	cpi	r16, 0xAE	; 174
    1966:	0b 3b       	cpi	r16, 0xBB	; 187
    1968:	0b 49       	sbci	r16, 0x9B	; 155
    196a:	13 3f       	cpi	r17, 0xF3	; 243
    196c:	0c 02       	muls	r16, r28
    196e:	0a 00       	.word	0x000a	; ????
    1970:	00 f3       	brcs	.-64     	; 0x1932 <__DATA_REGION_LENGTH__+0x132>
    1972:	02 34       	cpi	r16, 0x42	; 66
    1974:	00 03       	mulsu	r16, r16
    1976:	0e 3a       	cpi	r16, 0xAE	; 174
    1978:	0b 3b       	cpi	r16, 0xBB	; 187
    197a:	0b 49       	sbci	r16, 0x9B	; 155
    197c:	13 3f       	cpi	r17, 0xF3	; 243
    197e:	0c 02       	muls	r16, r28
    1980:	0a 00       	.word	0x000a	; ????
    1982:	00 f4       	brcc	.+0      	; 0x1984 <__DATA_REGION_LENGTH__+0x184>
    1984:	02 34       	cpi	r16, 0x42	; 66
    1986:	00 03       	mulsu	r16, r16
    1988:	0e 3a       	cpi	r16, 0xAE	; 174
    198a:	0b 3b       	cpi	r16, 0xBB	; 187
    198c:	0b 49       	sbci	r16, 0x9B	; 155
    198e:	13 3f       	cpi	r17, 0xF3	; 243
    1990:	0c 02       	muls	r16, r28
    1992:	0a 00       	.word	0x000a	; ????
    1994:	00 f5       	brcc	.+64     	; 0x19d6 <__DATA_REGION_LENGTH__+0x1d6>
    1996:	02 34       	cpi	r16, 0x42	; 66
    1998:	00 03       	mulsu	r16, r16
    199a:	0e 3a       	cpi	r16, 0xAE	; 174
    199c:	0b 3b       	cpi	r16, 0xBB	; 187
    199e:	0b 49       	sbci	r16, 0x9B	; 155
    19a0:	13 3f       	cpi	r17, 0xF3	; 243
    19a2:	0c 02       	muls	r16, r28
    19a4:	0a 00       	.word	0x000a	; ????
    19a6:	00 f6       	brcc	.-128    	; 0x1928 <__DATA_REGION_LENGTH__+0x128>
    19a8:	02 34       	cpi	r16, 0x42	; 66
    19aa:	00 03       	mulsu	r16, r16
    19ac:	0e 3a       	cpi	r16, 0xAE	; 174
    19ae:	0b 3b       	cpi	r16, 0xBB	; 187
    19b0:	0b 49       	sbci	r16, 0x9B	; 155
    19b2:	13 3f       	cpi	r17, 0xF3	; 243
    19b4:	0c 02       	muls	r16, r28
    19b6:	0a 00       	.word	0x000a	; ????
    19b8:	00 f7       	brcc	.-64     	; 0x197a <__DATA_REGION_LENGTH__+0x17a>
    19ba:	02 34       	cpi	r16, 0x42	; 66
    19bc:	00 03       	mulsu	r16, r16
    19be:	0e 3a       	cpi	r16, 0xAE	; 174
    19c0:	0b 3b       	cpi	r16, 0xBB	; 187
    19c2:	0b 49       	sbci	r16, 0x9B	; 155
    19c4:	13 3f       	cpi	r17, 0xF3	; 243
    19c6:	0c 02       	muls	r16, r28
    19c8:	0a 00       	.word	0x000a	; ????
    19ca:	00 f8       	bld	r0, 0
    19cc:	02 34       	cpi	r16, 0x42	; 66
    19ce:	00 03       	mulsu	r16, r16
    19d0:	0e 3a       	cpi	r16, 0xAE	; 174
    19d2:	0b 3b       	cpi	r16, 0xBB	; 187
    19d4:	0b 49       	sbci	r16, 0x9B	; 155
    19d6:	13 3f       	cpi	r17, 0xF3	; 243
    19d8:	0c 02       	muls	r16, r28
    19da:	0a 00       	.word	0x000a	; ????
    19dc:	00 f9       	bld	r16, 0
    19de:	02 34       	cpi	r16, 0x42	; 66
    19e0:	00 03       	mulsu	r16, r16
    19e2:	0e 3a       	cpi	r16, 0xAE	; 174
    19e4:	0b 3b       	cpi	r16, 0xBB	; 187
    19e6:	0b 49       	sbci	r16, 0x9B	; 155
    19e8:	13 3f       	cpi	r17, 0xF3	; 243
    19ea:	0c 02       	muls	r16, r28
    19ec:	0a 00       	.word	0x000a	; ????
    19ee:	00 fa       	bst	r0, 0
    19f0:	02 34       	cpi	r16, 0x42	; 66
    19f2:	00 03       	mulsu	r16, r16
    19f4:	0e 3a       	cpi	r16, 0xAE	; 174
    19f6:	0b 3b       	cpi	r16, 0xBB	; 187
    19f8:	0b 49       	sbci	r16, 0x9B	; 155
    19fa:	13 3f       	cpi	r17, 0xF3	; 243
    19fc:	0c 02       	muls	r16, r28
    19fe:	0a 00       	.word	0x000a	; ????
    1a00:	00 fb       	bst	r16, 0
    1a02:	02 34       	cpi	r16, 0x42	; 66
    1a04:	00 03       	mulsu	r16, r16
    1a06:	0e 3a       	cpi	r16, 0xAE	; 174
    1a08:	0b 3b       	cpi	r16, 0xBB	; 187
    1a0a:	0b 49       	sbci	r16, 0x9B	; 155
    1a0c:	13 3f       	cpi	r17, 0xF3	; 243
    1a0e:	0c 02       	muls	r16, r28
    1a10:	0a 00       	.word	0x000a	; ????
    1a12:	00 fc       	sbrc	r0, 0
    1a14:	02 34       	cpi	r16, 0x42	; 66
    1a16:	00 03       	mulsu	r16, r16
    1a18:	0e 3a       	cpi	r16, 0xAE	; 174
    1a1a:	0b 3b       	cpi	r16, 0xBB	; 187
    1a1c:	0b 49       	sbci	r16, 0x9B	; 155
    1a1e:	13 3f       	cpi	r17, 0xF3	; 243
    1a20:	0c 02       	muls	r16, r28
    1a22:	0a 00       	.word	0x000a	; ????
    1a24:	00 fd       	sbrc	r16, 0
    1a26:	02 34       	cpi	r16, 0x42	; 66
    1a28:	00 03       	mulsu	r16, r16
    1a2a:	0e 3a       	cpi	r16, 0xAE	; 174
    1a2c:	0b 3b       	cpi	r16, 0xBB	; 187
    1a2e:	0b 49       	sbci	r16, 0x9B	; 155
    1a30:	13 3f       	cpi	r17, 0xF3	; 243
    1a32:	0c 02       	muls	r16, r28
    1a34:	0a 00       	.word	0x000a	; ????
    1a36:	00 fe       	sbrs	r0, 0
    1a38:	02 34       	cpi	r16, 0x42	; 66
    1a3a:	00 03       	mulsu	r16, r16
    1a3c:	0e 3a       	cpi	r16, 0xAE	; 174
    1a3e:	0b 3b       	cpi	r16, 0xBB	; 187
    1a40:	0b 49       	sbci	r16, 0x9B	; 155
    1a42:	13 3f       	cpi	r17, 0xF3	; 243
    1a44:	0c 02       	muls	r16, r28
    1a46:	0a 00       	.word	0x000a	; ????
    1a48:	00 ff       	sbrs	r16, 0
    1a4a:	02 34       	cpi	r16, 0x42	; 66
    1a4c:	00 03       	mulsu	r16, r16
    1a4e:	0e 3a       	cpi	r16, 0xAE	; 174
    1a50:	0b 3b       	cpi	r16, 0xBB	; 187
    1a52:	0b 49       	sbci	r16, 0x9B	; 155
    1a54:	13 3f       	cpi	r17, 0xF3	; 243
    1a56:	0c 02       	muls	r16, r28
    1a58:	0a 00       	.word	0x000a	; ????
    1a5a:	00 80       	ld	r0, Z
    1a5c:	03 34       	cpi	r16, 0x43	; 67
    1a5e:	00 03       	mulsu	r16, r16
    1a60:	0e 3a       	cpi	r16, 0xAE	; 174
    1a62:	0b 3b       	cpi	r16, 0xBB	; 187
    1a64:	0b 49       	sbci	r16, 0x9B	; 155
    1a66:	13 3f       	cpi	r17, 0xF3	; 243
    1a68:	0c 02       	muls	r16, r28
    1a6a:	0a 00       	.word	0x000a	; ????
    1a6c:	00 81       	ld	r16, Z
    1a6e:	03 34       	cpi	r16, 0x43	; 67
    1a70:	00 03       	mulsu	r16, r16
    1a72:	0e 3a       	cpi	r16, 0xAE	; 174
    1a74:	0b 3b       	cpi	r16, 0xBB	; 187
    1a76:	0b 49       	sbci	r16, 0x9B	; 155
    1a78:	13 3f       	cpi	r17, 0xF3	; 243
    1a7a:	0c 02       	muls	r16, r28
    1a7c:	0a 00       	.word	0x000a	; ????
    1a7e:	00 82       	st	Z, r0
    1a80:	03 34       	cpi	r16, 0x43	; 67
    1a82:	00 03       	mulsu	r16, r16
    1a84:	0e 3a       	cpi	r16, 0xAE	; 174
    1a86:	0b 3b       	cpi	r16, 0xBB	; 187
    1a88:	0b 49       	sbci	r16, 0x9B	; 155
    1a8a:	13 3f       	cpi	r17, 0xF3	; 243
    1a8c:	0c 02       	muls	r16, r28
    1a8e:	0a 00       	.word	0x000a	; ????
    1a90:	00 83       	st	Z, r16
    1a92:	03 34       	cpi	r16, 0x43	; 67
    1a94:	00 03       	mulsu	r16, r16
    1a96:	0e 3a       	cpi	r16, 0xAE	; 174
    1a98:	0b 3b       	cpi	r16, 0xBB	; 187
    1a9a:	0b 49       	sbci	r16, 0x9B	; 155
    1a9c:	13 3f       	cpi	r17, 0xF3	; 243
    1a9e:	0c 02       	muls	r16, r28
    1aa0:	0a 00       	.word	0x000a	; ????
    1aa2:	00 84       	ldd	r0, Z+8	; 0x08
    1aa4:	03 34       	cpi	r16, 0x43	; 67
    1aa6:	00 03       	mulsu	r16, r16
    1aa8:	0e 3a       	cpi	r16, 0xAE	; 174
    1aaa:	0b 3b       	cpi	r16, 0xBB	; 187
    1aac:	0b 49       	sbci	r16, 0x9B	; 155
    1aae:	13 3f       	cpi	r17, 0xF3	; 243
    1ab0:	0c 02       	muls	r16, r28
    1ab2:	0a 00       	.word	0x000a	; ????
    1ab4:	00 85       	ldd	r16, Z+8	; 0x08
    1ab6:	03 34       	cpi	r16, 0x43	; 67
    1ab8:	00 03       	mulsu	r16, r16
    1aba:	0e 3a       	cpi	r16, 0xAE	; 174
    1abc:	0b 3b       	cpi	r16, 0xBB	; 187
    1abe:	0b 49       	sbci	r16, 0x9B	; 155
    1ac0:	13 3f       	cpi	r17, 0xF3	; 243
    1ac2:	0c 02       	muls	r16, r28
    1ac4:	0a 00       	.word	0x000a	; ????
    1ac6:	00 86       	std	Z+8, r0	; 0x08
    1ac8:	03 34       	cpi	r16, 0x43	; 67
    1aca:	00 03       	mulsu	r16, r16
    1acc:	0e 3a       	cpi	r16, 0xAE	; 174
    1ace:	0b 3b       	cpi	r16, 0xBB	; 187
    1ad0:	0b 49       	sbci	r16, 0x9B	; 155
    1ad2:	13 3f       	cpi	r17, 0xF3	; 243
    1ad4:	0c 02       	muls	r16, r28
    1ad6:	0a 00       	.word	0x000a	; ????
    1ad8:	00 87       	std	Z+8, r16	; 0x08
    1ada:	03 34       	cpi	r16, 0x43	; 67
    1adc:	00 03       	mulsu	r16, r16
    1ade:	0e 3a       	cpi	r16, 0xAE	; 174
    1ae0:	0b 3b       	cpi	r16, 0xBB	; 187
    1ae2:	0b 49       	sbci	r16, 0x9B	; 155
    1ae4:	13 3f       	cpi	r17, 0xF3	; 243
    1ae6:	0c 02       	muls	r16, r28
    1ae8:	0a 00       	.word	0x000a	; ????
    1aea:	00 88       	ldd	r0, Z+16	; 0x10
    1aec:	03 34       	cpi	r16, 0x43	; 67
    1aee:	00 03       	mulsu	r16, r16
    1af0:	0e 3a       	cpi	r16, 0xAE	; 174
    1af2:	0b 3b       	cpi	r16, 0xBB	; 187
    1af4:	0b 49       	sbci	r16, 0x9B	; 155
    1af6:	13 3f       	cpi	r17, 0xF3	; 243
    1af8:	0c 02       	muls	r16, r28
    1afa:	0a 00       	.word	0x000a	; ????
    1afc:	00 89       	ldd	r16, Z+16	; 0x10
    1afe:	03 34       	cpi	r16, 0x43	; 67
    1b00:	00 03       	mulsu	r16, r16
    1b02:	0e 3a       	cpi	r16, 0xAE	; 174
    1b04:	0b 3b       	cpi	r16, 0xBB	; 187
    1b06:	0b 49       	sbci	r16, 0x9B	; 155
    1b08:	13 3f       	cpi	r17, 0xF3	; 243
    1b0a:	0c 02       	muls	r16, r28
    1b0c:	0a 00       	.word	0x000a	; ????
    1b0e:	00 8a       	std	Z+16, r0	; 0x10
    1b10:	03 34       	cpi	r16, 0x43	; 67
    1b12:	00 03       	mulsu	r16, r16
    1b14:	0e 3a       	cpi	r16, 0xAE	; 174
    1b16:	0b 3b       	cpi	r16, 0xBB	; 187
    1b18:	0b 49       	sbci	r16, 0x9B	; 155
    1b1a:	13 3f       	cpi	r17, 0xF3	; 243
    1b1c:	0c 02       	muls	r16, r28
    1b1e:	0a 00       	.word	0x000a	; ????
    1b20:	00 8b       	std	Z+16, r16	; 0x10
    1b22:	03 34       	cpi	r16, 0x43	; 67
    1b24:	00 03       	mulsu	r16, r16
    1b26:	0e 3a       	cpi	r16, 0xAE	; 174
    1b28:	0b 3b       	cpi	r16, 0xBB	; 187
    1b2a:	0b 49       	sbci	r16, 0x9B	; 155
    1b2c:	13 3f       	cpi	r17, 0xF3	; 243
    1b2e:	0c 02       	muls	r16, r28
    1b30:	0a 00       	.word	0x000a	; ????
    1b32:	00 8c       	ldd	r0, Z+24	; 0x18
    1b34:	03 34       	cpi	r16, 0x43	; 67
    1b36:	00 03       	mulsu	r16, r16
    1b38:	0e 3a       	cpi	r16, 0xAE	; 174
    1b3a:	0b 3b       	cpi	r16, 0xBB	; 187
    1b3c:	0b 49       	sbci	r16, 0x9B	; 155
    1b3e:	13 3f       	cpi	r17, 0xF3	; 243
    1b40:	0c 02       	muls	r16, r28
    1b42:	0a 00       	.word	0x000a	; ????
    1b44:	00 8d       	ldd	r16, Z+24	; 0x18
    1b46:	03 34       	cpi	r16, 0x43	; 67
    1b48:	00 03       	mulsu	r16, r16
    1b4a:	0e 3a       	cpi	r16, 0xAE	; 174
    1b4c:	0b 3b       	cpi	r16, 0xBB	; 187
    1b4e:	0b 49       	sbci	r16, 0x9B	; 155
    1b50:	13 3f       	cpi	r17, 0xF3	; 243
    1b52:	0c 02       	muls	r16, r28
    1b54:	0a 00       	.word	0x000a	; ????
    1b56:	00 8e       	std	Z+24, r0	; 0x18
    1b58:	03 34       	cpi	r16, 0x43	; 67
    1b5a:	00 03       	mulsu	r16, r16
    1b5c:	0e 3a       	cpi	r16, 0xAE	; 174
    1b5e:	0b 3b       	cpi	r16, 0xBB	; 187
    1b60:	0b 49       	sbci	r16, 0x9B	; 155
    1b62:	13 3f       	cpi	r17, 0xF3	; 243
    1b64:	0c 02       	muls	r16, r28
    1b66:	0a 00       	.word	0x000a	; ????
    1b68:	00 8f       	std	Z+24, r16	; 0x18
    1b6a:	03 34       	cpi	r16, 0x43	; 67
    1b6c:	00 03       	mulsu	r16, r16
    1b6e:	0e 3a       	cpi	r16, 0xAE	; 174
    1b70:	0b 3b       	cpi	r16, 0xBB	; 187
    1b72:	0b 49       	sbci	r16, 0x9B	; 155
    1b74:	13 3f       	cpi	r17, 0xF3	; 243
    1b76:	0c 02       	muls	r16, r28
    1b78:	0a 00       	.word	0x000a	; ????
    1b7a:	00 90 03 34 	lds	r0, 0x3403	; 0x803403 <__DATA_REGION_ORIGIN__+0xc03>
    1b7e:	00 03       	mulsu	r16, r16
    1b80:	0e 3a       	cpi	r16, 0xAE	; 174
    1b82:	0b 3b       	cpi	r16, 0xBB	; 187
    1b84:	0b 49       	sbci	r16, 0x9B	; 155
    1b86:	13 3f       	cpi	r17, 0xF3	; 243
    1b88:	0c 02       	muls	r16, r28
    1b8a:	0a 00       	.word	0x000a	; ????
    1b8c:	00 91 03 34 	lds	r16, 0x3403	; 0x803403 <__DATA_REGION_ORIGIN__+0xc03>
    1b90:	00 03       	mulsu	r16, r16
    1b92:	0e 3a       	cpi	r16, 0xAE	; 174
    1b94:	0b 3b       	cpi	r16, 0xBB	; 187
    1b96:	0b 49       	sbci	r16, 0x9B	; 155
    1b98:	13 3f       	cpi	r17, 0xF3	; 243
    1b9a:	0c 02       	muls	r16, r28
    1b9c:	0a 00       	.word	0x000a	; ????
    1b9e:	00 92 03 34 	sts	0x3403, r0	; 0x803403 <__DATA_REGION_ORIGIN__+0xc03>
    1ba2:	00 03       	mulsu	r16, r16
    1ba4:	0e 3a       	cpi	r16, 0xAE	; 174
    1ba6:	0b 3b       	cpi	r16, 0xBB	; 187
    1ba8:	0b 49       	sbci	r16, 0x9B	; 155
    1baa:	13 3f       	cpi	r17, 0xF3	; 243
    1bac:	0c 02       	muls	r16, r28
    1bae:	0a 00       	.word	0x000a	; ????
    1bb0:	00 93 03 34 	sts	0x3403, r16	; 0x803403 <__DATA_REGION_ORIGIN__+0xc03>
    1bb4:	00 03       	mulsu	r16, r16
    1bb6:	0e 3a       	cpi	r16, 0xAE	; 174
    1bb8:	0b 3b       	cpi	r16, 0xBB	; 187
    1bba:	0b 49       	sbci	r16, 0x9B	; 155
    1bbc:	13 3f       	cpi	r17, 0xF3	; 243
    1bbe:	0c 02       	muls	r16, r28
    1bc0:	0a 00       	.word	0x000a	; ????
    1bc2:	00 94       	com	r0
    1bc4:	03 34       	cpi	r16, 0x43	; 67
    1bc6:	00 03       	mulsu	r16, r16
    1bc8:	0e 3a       	cpi	r16, 0xAE	; 174
    1bca:	0b 3b       	cpi	r16, 0xBB	; 187
    1bcc:	0b 49       	sbci	r16, 0x9B	; 155
    1bce:	13 3f       	cpi	r17, 0xF3	; 243
    1bd0:	0c 02       	muls	r16, r28
    1bd2:	0a 00       	.word	0x000a	; ????
    1bd4:	00 95       	com	r16
    1bd6:	03 34       	cpi	r16, 0x43	; 67
    1bd8:	00 03       	mulsu	r16, r16
    1bda:	0e 3a       	cpi	r16, 0xAE	; 174
    1bdc:	0b 3b       	cpi	r16, 0xBB	; 187
    1bde:	0b 49       	sbci	r16, 0x9B	; 155
    1be0:	13 3f       	cpi	r17, 0xF3	; 243
    1be2:	0c 02       	muls	r16, r28
    1be4:	0a 00       	.word	0x000a	; ????
    1be6:	00 96       	adiw	r24, 0x00	; 0
    1be8:	03 34       	cpi	r16, 0x43	; 67
    1bea:	00 03       	mulsu	r16, r16
    1bec:	0e 3a       	cpi	r16, 0xAE	; 174
    1bee:	0b 3b       	cpi	r16, 0xBB	; 187
    1bf0:	0b 49       	sbci	r16, 0x9B	; 155
    1bf2:	13 3f       	cpi	r17, 0xF3	; 243
    1bf4:	0c 02       	muls	r16, r28
    1bf6:	0a 00       	.word	0x000a	; ????
    1bf8:	00 97       	sbiw	r24, 0x00	; 0
    1bfa:	03 34       	cpi	r16, 0x43	; 67
    1bfc:	00 03       	mulsu	r16, r16
    1bfe:	0e 3a       	cpi	r16, 0xAE	; 174
    1c00:	0b 3b       	cpi	r16, 0xBB	; 187
    1c02:	0b 49       	sbci	r16, 0x9B	; 155
    1c04:	13 3f       	cpi	r17, 0xF3	; 243
    1c06:	0c 02       	muls	r16, r28
    1c08:	0a 00       	.word	0x000a	; ????
    1c0a:	00 98       	cbi	0x00, 0	; 0
    1c0c:	03 34       	cpi	r16, 0x43	; 67
    1c0e:	00 03       	mulsu	r16, r16
    1c10:	0e 3a       	cpi	r16, 0xAE	; 174
    1c12:	0b 3b       	cpi	r16, 0xBB	; 187
    1c14:	0b 49       	sbci	r16, 0x9B	; 155
    1c16:	13 3f       	cpi	r17, 0xF3	; 243
    1c18:	0c 02       	muls	r16, r28
    1c1a:	0a 00       	.word	0x000a	; ????
    1c1c:	00 99       	sbic	0x00, 0	; 0
    1c1e:	03 34       	cpi	r16, 0x43	; 67
    1c20:	00 03       	mulsu	r16, r16
    1c22:	0e 3a       	cpi	r16, 0xAE	; 174
    1c24:	0b 3b       	cpi	r16, 0xBB	; 187
    1c26:	0b 49       	sbci	r16, 0x9B	; 155
    1c28:	13 3f       	cpi	r17, 0xF3	; 243
    1c2a:	0c 02       	muls	r16, r28
    1c2c:	0a 00       	.word	0x000a	; ????
    1c2e:	00 9a       	sbi	0x00, 0	; 0
    1c30:	03 34       	cpi	r16, 0x43	; 67
    1c32:	00 03       	mulsu	r16, r16
    1c34:	0e 3a       	cpi	r16, 0xAE	; 174
    1c36:	0b 3b       	cpi	r16, 0xBB	; 187
    1c38:	0b 49       	sbci	r16, 0x9B	; 155
    1c3a:	13 3f       	cpi	r17, 0xF3	; 243
    1c3c:	0c 02       	muls	r16, r28
    1c3e:	0a 00       	.word	0x000a	; ????
    1c40:	00 9b       	sbis	0x00, 0	; 0
    1c42:	03 34       	cpi	r16, 0x43	; 67
    1c44:	00 03       	mulsu	r16, r16
    1c46:	0e 3a       	cpi	r16, 0xAE	; 174
    1c48:	0b 3b       	cpi	r16, 0xBB	; 187
    1c4a:	0b 49       	sbci	r16, 0x9B	; 155
    1c4c:	13 3f       	cpi	r17, 0xF3	; 243
    1c4e:	0c 02       	muls	r16, r28
    1c50:	0a 00       	.word	0x000a	; ????
    1c52:	00 9c       	mul	r0, r0
    1c54:	03 34       	cpi	r16, 0x43	; 67
    1c56:	00 03       	mulsu	r16, r16
    1c58:	0e 3a       	cpi	r16, 0xAE	; 174
    1c5a:	0b 3b       	cpi	r16, 0xBB	; 187
    1c5c:	0b 49       	sbci	r16, 0x9B	; 155
    1c5e:	13 3f       	cpi	r17, 0xF3	; 243
    1c60:	0c 02       	muls	r16, r28
    1c62:	0a 00       	.word	0x000a	; ????
    1c64:	00 9d       	mul	r16, r0
    1c66:	03 34       	cpi	r16, 0x43	; 67
    1c68:	00 03       	mulsu	r16, r16
    1c6a:	0e 3a       	cpi	r16, 0xAE	; 174
    1c6c:	0b 3b       	cpi	r16, 0xBB	; 187
    1c6e:	0b 49       	sbci	r16, 0x9B	; 155
    1c70:	13 3f       	cpi	r17, 0xF3	; 243
    1c72:	0c 02       	muls	r16, r28
    1c74:	0a 00       	.word	0x000a	; ????
    1c76:	00 9e       	mul	r0, r16
    1c78:	03 34       	cpi	r16, 0x43	; 67
    1c7a:	00 03       	mulsu	r16, r16
    1c7c:	0e 3a       	cpi	r16, 0xAE	; 174
    1c7e:	0b 3b       	cpi	r16, 0xBB	; 187
    1c80:	0b 49       	sbci	r16, 0x9B	; 155
    1c82:	13 3f       	cpi	r17, 0xF3	; 243
    1c84:	0c 02       	muls	r16, r28
    1c86:	0a 00       	.word	0x000a	; ????
    1c88:	00 9f       	mul	r16, r16
    1c8a:	03 34       	cpi	r16, 0x43	; 67
    1c8c:	00 03       	mulsu	r16, r16
    1c8e:	0e 3a       	cpi	r16, 0xAE	; 174
    1c90:	0b 3b       	cpi	r16, 0xBB	; 187
    1c92:	0b 49       	sbci	r16, 0x9B	; 155
    1c94:	13 3f       	cpi	r17, 0xF3	; 243
    1c96:	0c 02       	muls	r16, r28
    1c98:	0a 00       	.word	0x000a	; ????
    1c9a:	00 a0       	ldd	r0, Z+32	; 0x20
    1c9c:	03 34       	cpi	r16, 0x43	; 67
    1c9e:	00 03       	mulsu	r16, r16
    1ca0:	0e 3a       	cpi	r16, 0xAE	; 174
    1ca2:	0b 3b       	cpi	r16, 0xBB	; 187
    1ca4:	0b 49       	sbci	r16, 0x9B	; 155
    1ca6:	13 3f       	cpi	r17, 0xF3	; 243
    1ca8:	0c 02       	muls	r16, r28
    1caa:	0a 00       	.word	0x000a	; ????
    1cac:	00 a1       	ldd	r16, Z+32	; 0x20
    1cae:	03 34       	cpi	r16, 0x43	; 67
    1cb0:	00 03       	mulsu	r16, r16
    1cb2:	0e 3a       	cpi	r16, 0xAE	; 174
    1cb4:	0b 3b       	cpi	r16, 0xBB	; 187
    1cb6:	0b 49       	sbci	r16, 0x9B	; 155
    1cb8:	13 3f       	cpi	r17, 0xF3	; 243
    1cba:	0c 02       	muls	r16, r28
    1cbc:	0a 00       	.word	0x000a	; ????
    1cbe:	00 a2       	std	Z+32, r0	; 0x20
    1cc0:	03 34       	cpi	r16, 0x43	; 67
    1cc2:	00 03       	mulsu	r16, r16
    1cc4:	0e 3a       	cpi	r16, 0xAE	; 174
    1cc6:	0b 3b       	cpi	r16, 0xBB	; 187
    1cc8:	0b 49       	sbci	r16, 0x9B	; 155
    1cca:	13 3f       	cpi	r17, 0xF3	; 243
    1ccc:	0c 02       	muls	r16, r28
    1cce:	0a 00       	.word	0x000a	; ????
    1cd0:	00 a3       	std	Z+32, r16	; 0x20
    1cd2:	03 34       	cpi	r16, 0x43	; 67
    1cd4:	00 03       	mulsu	r16, r16
    1cd6:	0e 3a       	cpi	r16, 0xAE	; 174
    1cd8:	0b 3b       	cpi	r16, 0xBB	; 187
    1cda:	0b 49       	sbci	r16, 0x9B	; 155
    1cdc:	13 3f       	cpi	r17, 0xF3	; 243
    1cde:	0c 02       	muls	r16, r28
    1ce0:	0a 00       	.word	0x000a	; ????
    1ce2:	00 a4       	ldd	r0, Z+40	; 0x28
    1ce4:	03 34       	cpi	r16, 0x43	; 67
    1ce6:	00 03       	mulsu	r16, r16
    1ce8:	0e 3a       	cpi	r16, 0xAE	; 174
    1cea:	0b 3b       	cpi	r16, 0xBB	; 187
    1cec:	0b 49       	sbci	r16, 0x9B	; 155
    1cee:	13 3f       	cpi	r17, 0xF3	; 243
    1cf0:	0c 02       	muls	r16, r28
    1cf2:	0a 00       	.word	0x000a	; ????
    1cf4:	00 a5       	ldd	r16, Z+40	; 0x28
    1cf6:	03 34       	cpi	r16, 0x43	; 67
    1cf8:	00 03       	mulsu	r16, r16
    1cfa:	0e 3a       	cpi	r16, 0xAE	; 174
    1cfc:	0b 3b       	cpi	r16, 0xBB	; 187
    1cfe:	0b 49       	sbci	r16, 0x9B	; 155
    1d00:	13 3f       	cpi	r17, 0xF3	; 243
    1d02:	0c 02       	muls	r16, r28
    1d04:	0a 00       	.word	0x000a	; ????
    1d06:	00 a6       	std	Z+40, r0	; 0x28
    1d08:	03 34       	cpi	r16, 0x43	; 67
    1d0a:	00 03       	mulsu	r16, r16
    1d0c:	0e 3a       	cpi	r16, 0xAE	; 174
    1d0e:	0b 3b       	cpi	r16, 0xBB	; 187
    1d10:	0b 49       	sbci	r16, 0x9B	; 155
    1d12:	13 3f       	cpi	r17, 0xF3	; 243
    1d14:	0c 02       	muls	r16, r28
    1d16:	0a 00       	.word	0x000a	; ????
    1d18:	00 a7       	std	Z+40, r16	; 0x28
    1d1a:	03 34       	cpi	r16, 0x43	; 67
    1d1c:	00 03       	mulsu	r16, r16
    1d1e:	0e 3a       	cpi	r16, 0xAE	; 174
    1d20:	0b 3b       	cpi	r16, 0xBB	; 187
    1d22:	0b 49       	sbci	r16, 0x9B	; 155
    1d24:	13 3f       	cpi	r17, 0xF3	; 243
    1d26:	0c 02       	muls	r16, r28
    1d28:	0a 00       	.word	0x000a	; ????
    1d2a:	00 a8       	ldd	r0, Z+48	; 0x30
    1d2c:	03 34       	cpi	r16, 0x43	; 67
    1d2e:	00 03       	mulsu	r16, r16
    1d30:	0e 3a       	cpi	r16, 0xAE	; 174
    1d32:	0b 3b       	cpi	r16, 0xBB	; 187
    1d34:	0b 49       	sbci	r16, 0x9B	; 155
    1d36:	13 3f       	cpi	r17, 0xF3	; 243
    1d38:	0c 02       	muls	r16, r28
    1d3a:	0a 00       	.word	0x000a	; ????
    1d3c:	00 a9       	ldd	r16, Z+48	; 0x30
    1d3e:	03 34       	cpi	r16, 0x43	; 67
    1d40:	00 03       	mulsu	r16, r16
    1d42:	0e 3a       	cpi	r16, 0xAE	; 174
    1d44:	0b 3b       	cpi	r16, 0xBB	; 187
    1d46:	0b 49       	sbci	r16, 0x9B	; 155
    1d48:	13 3f       	cpi	r17, 0xF3	; 243
    1d4a:	0c 02       	muls	r16, r28
    1d4c:	0a 00       	.word	0x000a	; ????
    1d4e:	00 aa       	std	Z+48, r0	; 0x30
    1d50:	03 34       	cpi	r16, 0x43	; 67
    1d52:	00 03       	mulsu	r16, r16
    1d54:	0e 3a       	cpi	r16, 0xAE	; 174
    1d56:	0b 3b       	cpi	r16, 0xBB	; 187
    1d58:	0b 49       	sbci	r16, 0x9B	; 155
    1d5a:	13 3f       	cpi	r17, 0xF3	; 243
    1d5c:	0c 02       	muls	r16, r28
    1d5e:	0a 00       	.word	0x000a	; ????
    1d60:	00 ab       	std	Z+48, r16	; 0x30
    1d62:	03 34       	cpi	r16, 0x43	; 67
    1d64:	00 03       	mulsu	r16, r16
    1d66:	0e 3a       	cpi	r16, 0xAE	; 174
    1d68:	0b 3b       	cpi	r16, 0xBB	; 187
    1d6a:	0b 49       	sbci	r16, 0x9B	; 155
    1d6c:	13 3f       	cpi	r17, 0xF3	; 243
    1d6e:	0c 02       	muls	r16, r28
    1d70:	0a 00       	.word	0x000a	; ????
    1d72:	00 ac       	ldd	r0, Z+56	; 0x38
    1d74:	03 34       	cpi	r16, 0x43	; 67
    1d76:	00 03       	mulsu	r16, r16
    1d78:	0e 3a       	cpi	r16, 0xAE	; 174
    1d7a:	0b 3b       	cpi	r16, 0xBB	; 187
    1d7c:	0b 49       	sbci	r16, 0x9B	; 155
    1d7e:	13 3f       	cpi	r17, 0xF3	; 243
    1d80:	0c 02       	muls	r16, r28
    1d82:	0a 00       	.word	0x000a	; ????
    1d84:	00 ad       	ldd	r16, Z+56	; 0x38
    1d86:	03 34       	cpi	r16, 0x43	; 67
    1d88:	00 03       	mulsu	r16, r16
    1d8a:	0e 3a       	cpi	r16, 0xAE	; 174
    1d8c:	0b 3b       	cpi	r16, 0xBB	; 187
    1d8e:	0b 49       	sbci	r16, 0x9B	; 155
    1d90:	13 3f       	cpi	r17, 0xF3	; 243
    1d92:	0c 02       	muls	r16, r28
    1d94:	0a 00       	.word	0x000a	; ????
    1d96:	00 ae       	std	Z+56, r0	; 0x38
    1d98:	03 34       	cpi	r16, 0x43	; 67
    1d9a:	00 03       	mulsu	r16, r16
    1d9c:	0e 3a       	cpi	r16, 0xAE	; 174
    1d9e:	0b 3b       	cpi	r16, 0xBB	; 187
    1da0:	0b 49       	sbci	r16, 0x9B	; 155
    1da2:	13 3f       	cpi	r17, 0xF3	; 243
    1da4:	0c 02       	muls	r16, r28
    1da6:	0a 00       	.word	0x000a	; ????
    1da8:	00 af       	std	Z+56, r16	; 0x38
    1daa:	03 34       	cpi	r16, 0x43	; 67
    1dac:	00 03       	mulsu	r16, r16
    1dae:	0e 3a       	cpi	r16, 0xAE	; 174
    1db0:	0b 3b       	cpi	r16, 0xBB	; 187
    1db2:	0b 49       	sbci	r16, 0x9B	; 155
    1db4:	13 3f       	cpi	r17, 0xF3	; 243
    1db6:	0c 02       	muls	r16, r28
    1db8:	0a 00       	.word	0x000a	; ????
    1dba:	00 b0       	in	r0, 0x00	; 0
    1dbc:	03 34       	cpi	r16, 0x43	; 67
    1dbe:	00 03       	mulsu	r16, r16
    1dc0:	0e 3a       	cpi	r16, 0xAE	; 174
    1dc2:	0b 3b       	cpi	r16, 0xBB	; 187
    1dc4:	0b 49       	sbci	r16, 0x9B	; 155
    1dc6:	13 3f       	cpi	r17, 0xF3	; 243
    1dc8:	0c 02       	muls	r16, r28
    1dca:	0a 00       	.word	0x000a	; ????
    1dcc:	00 b1       	in	r16, 0x00	; 0
    1dce:	03 34       	cpi	r16, 0x43	; 67
    1dd0:	00 03       	mulsu	r16, r16
    1dd2:	0e 3a       	cpi	r16, 0xAE	; 174
    1dd4:	0b 3b       	cpi	r16, 0xBB	; 187
    1dd6:	0b 49       	sbci	r16, 0x9B	; 155
    1dd8:	13 3f       	cpi	r17, 0xF3	; 243
    1dda:	0c 02       	muls	r16, r28
    1ddc:	0a 00       	.word	0x000a	; ????
    1dde:	00 b2       	in	r0, 0x10	; 16
    1de0:	03 34       	cpi	r16, 0x43	; 67
    1de2:	00 03       	mulsu	r16, r16
    1de4:	0e 3a       	cpi	r16, 0xAE	; 174
    1de6:	0b 3b       	cpi	r16, 0xBB	; 187
    1de8:	0b 49       	sbci	r16, 0x9B	; 155
    1dea:	13 3f       	cpi	r17, 0xF3	; 243
    1dec:	0c 02       	muls	r16, r28
    1dee:	0a 00       	.word	0x000a	; ????
    1df0:	00 b3       	in	r16, 0x10	; 16
    1df2:	03 34       	cpi	r16, 0x43	; 67
    1df4:	00 03       	mulsu	r16, r16
    1df6:	0e 3a       	cpi	r16, 0xAE	; 174
    1df8:	0b 3b       	cpi	r16, 0xBB	; 187
    1dfa:	0b 49       	sbci	r16, 0x9B	; 155
    1dfc:	13 3f       	cpi	r17, 0xF3	; 243
    1dfe:	0c 02       	muls	r16, r28
    1e00:	0a 00       	.word	0x000a	; ????
    1e02:	00 b4       	in	r0, 0x20	; 32
    1e04:	03 34       	cpi	r16, 0x43	; 67
    1e06:	00 03       	mulsu	r16, r16
    1e08:	0e 3a       	cpi	r16, 0xAE	; 174
    1e0a:	0b 3b       	cpi	r16, 0xBB	; 187
    1e0c:	0b 49       	sbci	r16, 0x9B	; 155
    1e0e:	13 3f       	cpi	r17, 0xF3	; 243
    1e10:	0c 02       	muls	r16, r28
    1e12:	0a 00       	.word	0x000a	; ????
    1e14:	00 b5       	in	r16, 0x20	; 32
    1e16:	03 34       	cpi	r16, 0x43	; 67
    1e18:	00 03       	mulsu	r16, r16
    1e1a:	0e 3a       	cpi	r16, 0xAE	; 174
    1e1c:	0b 3b       	cpi	r16, 0xBB	; 187
    1e1e:	0b 49       	sbci	r16, 0x9B	; 155
    1e20:	13 3f       	cpi	r17, 0xF3	; 243
    1e22:	0c 02       	muls	r16, r28
    1e24:	0a 00       	.word	0x000a	; ????
    1e26:	00 b6       	in	r0, 0x30	; 48
    1e28:	03 34       	cpi	r16, 0x43	; 67
    1e2a:	00 03       	mulsu	r16, r16
    1e2c:	0e 3a       	cpi	r16, 0xAE	; 174
    1e2e:	0b 3b       	cpi	r16, 0xBB	; 187
    1e30:	0b 49       	sbci	r16, 0x9B	; 155
    1e32:	13 3f       	cpi	r17, 0xF3	; 243
    1e34:	0c 02       	muls	r16, r28
    1e36:	0a 00       	.word	0x000a	; ????
    1e38:	00 b7       	in	r16, 0x30	; 48
    1e3a:	03 34       	cpi	r16, 0x43	; 67
    1e3c:	00 03       	mulsu	r16, r16
    1e3e:	0e 3a       	cpi	r16, 0xAE	; 174
    1e40:	0b 3b       	cpi	r16, 0xBB	; 187
    1e42:	0b 49       	sbci	r16, 0x9B	; 155
    1e44:	13 3f       	cpi	r17, 0xF3	; 243
    1e46:	0c 02       	muls	r16, r28
    1e48:	0a 00       	.word	0x000a	; ????
    1e4a:	00 b8       	out	0x00, r0	; 0
    1e4c:	03 34       	cpi	r16, 0x43	; 67
    1e4e:	00 03       	mulsu	r16, r16
    1e50:	0e 3a       	cpi	r16, 0xAE	; 174
    1e52:	0b 3b       	cpi	r16, 0xBB	; 187
    1e54:	0b 49       	sbci	r16, 0x9B	; 155
    1e56:	13 3f       	cpi	r17, 0xF3	; 243
    1e58:	0c 02       	muls	r16, r28
    1e5a:	0a 00       	.word	0x000a	; ????
    1e5c:	00 b9       	out	0x00, r16	; 0
    1e5e:	03 34       	cpi	r16, 0x43	; 67
    1e60:	00 03       	mulsu	r16, r16
    1e62:	0e 3a       	cpi	r16, 0xAE	; 174
    1e64:	0b 3b       	cpi	r16, 0xBB	; 187
    1e66:	0b 49       	sbci	r16, 0x9B	; 155
    1e68:	13 3f       	cpi	r17, 0xF3	; 243
    1e6a:	0c 02       	muls	r16, r28
    1e6c:	0a 00       	.word	0x000a	; ????
    1e6e:	00 ba       	out	0x10, r0	; 16
    1e70:	03 34       	cpi	r16, 0x43	; 67
    1e72:	00 03       	mulsu	r16, r16
    1e74:	0e 3a       	cpi	r16, 0xAE	; 174
    1e76:	0b 3b       	cpi	r16, 0xBB	; 187
    1e78:	0b 49       	sbci	r16, 0x9B	; 155
    1e7a:	13 3f       	cpi	r17, 0xF3	; 243
    1e7c:	0c 02       	muls	r16, r28
    1e7e:	0a 00       	.word	0x000a	; ????
    1e80:	00 bb       	out	0x10, r16	; 16
    1e82:	03 34       	cpi	r16, 0x43	; 67
    1e84:	00 03       	mulsu	r16, r16
    1e86:	0e 3a       	cpi	r16, 0xAE	; 174
    1e88:	0b 3b       	cpi	r16, 0xBB	; 187
    1e8a:	0b 49       	sbci	r16, 0x9B	; 155
    1e8c:	13 3f       	cpi	r17, 0xF3	; 243
    1e8e:	0c 02       	muls	r16, r28
    1e90:	0a 00       	.word	0x000a	; ????
    1e92:	00 bc       	out	0x20, r0	; 32
    1e94:	03 34       	cpi	r16, 0x43	; 67
    1e96:	00 03       	mulsu	r16, r16
    1e98:	0e 3a       	cpi	r16, 0xAE	; 174
    1e9a:	0b 3b       	cpi	r16, 0xBB	; 187
    1e9c:	0b 49       	sbci	r16, 0x9B	; 155
    1e9e:	13 3f       	cpi	r17, 0xF3	; 243
    1ea0:	0c 02       	muls	r16, r28
    1ea2:	0a 00       	.word	0x000a	; ????
    1ea4:	00 bd       	out	0x20, r16	; 32
    1ea6:	03 34       	cpi	r16, 0x43	; 67
    1ea8:	00 03       	mulsu	r16, r16
    1eaa:	0e 3a       	cpi	r16, 0xAE	; 174
    1eac:	0b 3b       	cpi	r16, 0xBB	; 187
    1eae:	0b 49       	sbci	r16, 0x9B	; 155
    1eb0:	13 3f       	cpi	r17, 0xF3	; 243
    1eb2:	0c 02       	muls	r16, r28
    1eb4:	0a 00       	.word	0x000a	; ????
    1eb6:	00 be       	out	0x30, r0	; 48
    1eb8:	03 34       	cpi	r16, 0x43	; 67
    1eba:	00 03       	mulsu	r16, r16
    1ebc:	0e 3a       	cpi	r16, 0xAE	; 174
    1ebe:	0b 3b       	cpi	r16, 0xBB	; 187
    1ec0:	0b 49       	sbci	r16, 0x9B	; 155
    1ec2:	13 3f       	cpi	r17, 0xF3	; 243
    1ec4:	0c 02       	muls	r16, r28
    1ec6:	0a 00       	.word	0x000a	; ????
    1ec8:	00 bf       	out	0x30, r16	; 48
    1eca:	03 34       	cpi	r16, 0x43	; 67
    1ecc:	00 03       	mulsu	r16, r16
    1ece:	0e 3a       	cpi	r16, 0xAE	; 174
    1ed0:	0b 3b       	cpi	r16, 0xBB	; 187
    1ed2:	0b 49       	sbci	r16, 0x9B	; 155
    1ed4:	13 3f       	cpi	r17, 0xF3	; 243
    1ed6:	0c 02       	muls	r16, r28
    1ed8:	0a 00       	.word	0x000a	; ????
    1eda:	00 c0       	rjmp	.+0      	; 0x1edc <__DATA_REGION_LENGTH__+0x6dc>
    1edc:	03 34       	cpi	r16, 0x43	; 67
    1ede:	00 03       	mulsu	r16, r16
    1ee0:	0e 3a       	cpi	r16, 0xAE	; 174
    1ee2:	0b 3b       	cpi	r16, 0xBB	; 187
    1ee4:	0b 49       	sbci	r16, 0x9B	; 155
    1ee6:	13 3f       	cpi	r17, 0xF3	; 243
    1ee8:	0c 02       	muls	r16, r28
    1eea:	0a 00       	.word	0x000a	; ????
    1eec:	00 c1       	rjmp	.+512    	; 0x20ee <__DATA_REGION_LENGTH__+0x8ee>
    1eee:	03 34       	cpi	r16, 0x43	; 67
    1ef0:	00 03       	mulsu	r16, r16
    1ef2:	0e 3a       	cpi	r16, 0xAE	; 174
    1ef4:	0b 3b       	cpi	r16, 0xBB	; 187
    1ef6:	0b 49       	sbci	r16, 0x9B	; 155
    1ef8:	13 3f       	cpi	r17, 0xF3	; 243
    1efa:	0c 02       	muls	r16, r28
    1efc:	0a 00       	.word	0x000a	; ????
    1efe:	00 c2       	rjmp	.+1024   	; 0x2300 <__DATA_REGION_LENGTH__+0xb00>
    1f00:	03 34       	cpi	r16, 0x43	; 67
    1f02:	00 03       	mulsu	r16, r16
    1f04:	0e 3a       	cpi	r16, 0xAE	; 174
    1f06:	0b 3b       	cpi	r16, 0xBB	; 187
    1f08:	0b 49       	sbci	r16, 0x9B	; 155
    1f0a:	13 3f       	cpi	r17, 0xF3	; 243
    1f0c:	0c 02       	muls	r16, r28
    1f0e:	0a 00       	.word	0x000a	; ????
    1f10:	00 c3       	rjmp	.+1536   	; 0x2512 <__DATA_REGION_LENGTH__+0xd12>
    1f12:	03 34       	cpi	r16, 0x43	; 67
    1f14:	00 03       	mulsu	r16, r16
    1f16:	0e 3a       	cpi	r16, 0xAE	; 174
    1f18:	0b 3b       	cpi	r16, 0xBB	; 187
    1f1a:	0b 49       	sbci	r16, 0x9B	; 155
    1f1c:	13 3f       	cpi	r17, 0xF3	; 243
    1f1e:	0c 02       	muls	r16, r28
    1f20:	0a 00       	.word	0x000a	; ????
    1f22:	00 c4       	rjmp	.+2048   	; 0x2724 <__DATA_REGION_LENGTH__+0xf24>
    1f24:	03 34       	cpi	r16, 0x43	; 67
    1f26:	00 03       	mulsu	r16, r16
    1f28:	0e 3a       	cpi	r16, 0xAE	; 174
    1f2a:	0b 3b       	cpi	r16, 0xBB	; 187
    1f2c:	0b 49       	sbci	r16, 0x9B	; 155
    1f2e:	13 3f       	cpi	r17, 0xF3	; 243
    1f30:	0c 02       	muls	r16, r28
    1f32:	0a 00       	.word	0x000a	; ????
    1f34:	00 c5       	rjmp	.+2560   	; 0x2936 <__DATA_REGION_LENGTH__+0x1136>
    1f36:	03 34       	cpi	r16, 0x43	; 67
    1f38:	00 03       	mulsu	r16, r16
    1f3a:	0e 3a       	cpi	r16, 0xAE	; 174
    1f3c:	0b 3b       	cpi	r16, 0xBB	; 187
    1f3e:	0b 49       	sbci	r16, 0x9B	; 155
    1f40:	13 3f       	cpi	r17, 0xF3	; 243
    1f42:	0c 02       	muls	r16, r28
    1f44:	0a 00       	.word	0x000a	; ????
    1f46:	00 c6       	rjmp	.+3072   	; 0x2b48 <__DATA_REGION_LENGTH__+0x1348>
    1f48:	03 34       	cpi	r16, 0x43	; 67
    1f4a:	00 03       	mulsu	r16, r16
    1f4c:	0e 3a       	cpi	r16, 0xAE	; 174
    1f4e:	0b 3b       	cpi	r16, 0xBB	; 187
    1f50:	0b 49       	sbci	r16, 0x9B	; 155
    1f52:	13 3f       	cpi	r17, 0xF3	; 243
    1f54:	0c 02       	muls	r16, r28
    1f56:	0a 00       	.word	0x000a	; ????
    1f58:	00 c7       	rjmp	.+3584   	; 0x2d5a <__DATA_REGION_LENGTH__+0x155a>
    1f5a:	03 34       	cpi	r16, 0x43	; 67
    1f5c:	00 03       	mulsu	r16, r16
    1f5e:	0e 3a       	cpi	r16, 0xAE	; 174
    1f60:	0b 3b       	cpi	r16, 0xBB	; 187
    1f62:	0b 49       	sbci	r16, 0x9B	; 155
    1f64:	13 3f       	cpi	r17, 0xF3	; 243
    1f66:	0c 02       	muls	r16, r28
    1f68:	0a 00       	.word	0x000a	; ????
    1f6a:	00 c8       	rjmp	.-4096   	; 0xf6c <__LOCK_REGION_LENGTH__+0xb6c>
    1f6c:	03 34       	cpi	r16, 0x43	; 67
    1f6e:	00 03       	mulsu	r16, r16
    1f70:	0e 3a       	cpi	r16, 0xAE	; 174
    1f72:	0b 3b       	cpi	r16, 0xBB	; 187
    1f74:	0b 49       	sbci	r16, 0x9B	; 155
    1f76:	13 3f       	cpi	r17, 0xF3	; 243
    1f78:	0c 02       	muls	r16, r28
    1f7a:	0a 00       	.word	0x000a	; ????
    1f7c:	00 c9       	rjmp	.-3584   	; 0x117e <__LOCK_REGION_LENGTH__+0xd7e>
    1f7e:	03 34       	cpi	r16, 0x43	; 67
    1f80:	00 03       	mulsu	r16, r16
    1f82:	0e 3a       	cpi	r16, 0xAE	; 174
    1f84:	0b 3b       	cpi	r16, 0xBB	; 187
    1f86:	0b 49       	sbci	r16, 0x9B	; 155
    1f88:	13 3f       	cpi	r17, 0xF3	; 243
    1f8a:	0c 02       	muls	r16, r28
    1f8c:	0a 00       	.word	0x000a	; ????
    1f8e:	00 ca       	rjmp	.-3072   	; 0x1390 <__LOCK_REGION_LENGTH__+0xf90>
    1f90:	03 34       	cpi	r16, 0x43	; 67
    1f92:	00 03       	mulsu	r16, r16
    1f94:	0e 3a       	cpi	r16, 0xAE	; 174
    1f96:	0b 3b       	cpi	r16, 0xBB	; 187
    1f98:	0b 49       	sbci	r16, 0x9B	; 155
    1f9a:	13 3f       	cpi	r17, 0xF3	; 243
    1f9c:	0c 02       	muls	r16, r28
    1f9e:	0a 00       	.word	0x000a	; ????
    1fa0:	00 cb       	rjmp	.-2560   	; 0x15a2 <__LOCK_REGION_LENGTH__+0x11a2>
    1fa2:	03 34       	cpi	r16, 0x43	; 67
    1fa4:	00 03       	mulsu	r16, r16
    1fa6:	0e 3a       	cpi	r16, 0xAE	; 174
    1fa8:	0b 3b       	cpi	r16, 0xBB	; 187
    1faa:	0b 49       	sbci	r16, 0x9B	; 155
    1fac:	13 3f       	cpi	r17, 0xF3	; 243
    1fae:	0c 02       	muls	r16, r28
    1fb0:	0a 00       	.word	0x000a	; ????
    1fb2:	00 cc       	rjmp	.-2048   	; 0x17b4 <__LOCK_REGION_LENGTH__+0x13b4>
    1fb4:	03 34       	cpi	r16, 0x43	; 67
    1fb6:	00 03       	mulsu	r16, r16
    1fb8:	0e 3a       	cpi	r16, 0xAE	; 174
    1fba:	0b 3b       	cpi	r16, 0xBB	; 187
    1fbc:	0b 49       	sbci	r16, 0x9B	; 155
    1fbe:	13 3f       	cpi	r17, 0xF3	; 243
    1fc0:	0c 02       	muls	r16, r28
    1fc2:	0a 00       	.word	0x000a	; ????
    1fc4:	00 cd       	rjmp	.-1536   	; 0x19c6 <__DATA_REGION_LENGTH__+0x1c6>
    1fc6:	03 34       	cpi	r16, 0x43	; 67
    1fc8:	00 03       	mulsu	r16, r16
    1fca:	0e 3a       	cpi	r16, 0xAE	; 174
    1fcc:	0b 3b       	cpi	r16, 0xBB	; 187
    1fce:	0b 49       	sbci	r16, 0x9B	; 155
    1fd0:	13 3f       	cpi	r17, 0xF3	; 243
    1fd2:	0c 02       	muls	r16, r28
    1fd4:	0a 00       	.word	0x000a	; ????
    1fd6:	00 ce       	rjmp	.-1024   	; 0x1bd8 <__DATA_REGION_LENGTH__+0x3d8>
    1fd8:	03 34       	cpi	r16, 0x43	; 67
    1fda:	00 03       	mulsu	r16, r16
    1fdc:	0e 3a       	cpi	r16, 0xAE	; 174
    1fde:	0b 3b       	cpi	r16, 0xBB	; 187
    1fe0:	0b 49       	sbci	r16, 0x9B	; 155
    1fe2:	13 3f       	cpi	r17, 0xF3	; 243
    1fe4:	0c 02       	muls	r16, r28
    1fe6:	0a 00       	.word	0x000a	; ????
    1fe8:	00 cf       	rjmp	.-512    	; 0x1dea <__DATA_REGION_LENGTH__+0x5ea>
    1fea:	03 34       	cpi	r16, 0x43	; 67
    1fec:	00 03       	mulsu	r16, r16
    1fee:	0e 3a       	cpi	r16, 0xAE	; 174
    1ff0:	0b 3b       	cpi	r16, 0xBB	; 187
    1ff2:	0b 49       	sbci	r16, 0x9B	; 155
    1ff4:	13 3f       	cpi	r17, 0xF3	; 243
    1ff6:	0c 02       	muls	r16, r28
    1ff8:	0a 00       	.word	0x000a	; ????
    1ffa:	00 d0       	rcall	.+0      	; 0x1ffc <__DATA_REGION_LENGTH__+0x7fc>
    1ffc:	03 34       	cpi	r16, 0x43	; 67
    1ffe:	00 03       	mulsu	r16, r16
    2000:	0e 3a       	cpi	r16, 0xAE	; 174
    2002:	0b 3b       	cpi	r16, 0xBB	; 187
    2004:	0b 49       	sbci	r16, 0x9B	; 155
    2006:	13 3f       	cpi	r17, 0xF3	; 243
    2008:	0c 02       	muls	r16, r28
    200a:	0a 00       	.word	0x000a	; ????
    200c:	00 d1       	rcall	.+512    	; 0x220e <__DATA_REGION_LENGTH__+0xa0e>
    200e:	03 34       	cpi	r16, 0x43	; 67
    2010:	00 03       	mulsu	r16, r16
    2012:	0e 3a       	cpi	r16, 0xAE	; 174
    2014:	0b 3b       	cpi	r16, 0xBB	; 187
    2016:	0b 49       	sbci	r16, 0x9B	; 155
    2018:	13 3f       	cpi	r17, 0xF3	; 243
    201a:	0c 02       	muls	r16, r28
    201c:	0a 00       	.word	0x000a	; ????
    201e:	00 d2       	rcall	.+1024   	; 0x2420 <__DATA_REGION_LENGTH__+0xc20>
    2020:	03 34       	cpi	r16, 0x43	; 67
    2022:	00 03       	mulsu	r16, r16
    2024:	0e 3a       	cpi	r16, 0xAE	; 174
    2026:	0b 3b       	cpi	r16, 0xBB	; 187
    2028:	0b 49       	sbci	r16, 0x9B	; 155
    202a:	13 3f       	cpi	r17, 0xF3	; 243
    202c:	0c 02       	muls	r16, r28
    202e:	0a 00       	.word	0x000a	; ????
    2030:	00 d3       	rcall	.+1536   	; 0x2632 <__DATA_REGION_LENGTH__+0xe32>
    2032:	03 34       	cpi	r16, 0x43	; 67
    2034:	00 03       	mulsu	r16, r16
    2036:	0e 3a       	cpi	r16, 0xAE	; 174
    2038:	0b 3b       	cpi	r16, 0xBB	; 187
    203a:	0b 49       	sbci	r16, 0x9B	; 155
    203c:	13 3f       	cpi	r17, 0xF3	; 243
    203e:	0c 02       	muls	r16, r28
    2040:	0a 00       	.word	0x000a	; ????
    2042:	00 d4       	rcall	.+2048   	; 0x2844 <__DATA_REGION_LENGTH__+0x1044>
    2044:	03 34       	cpi	r16, 0x43	; 67
    2046:	00 03       	mulsu	r16, r16
    2048:	0e 3a       	cpi	r16, 0xAE	; 174
    204a:	0b 3b       	cpi	r16, 0xBB	; 187
    204c:	0b 49       	sbci	r16, 0x9B	; 155
    204e:	13 3f       	cpi	r17, 0xF3	; 243
    2050:	0c 02       	muls	r16, r28
    2052:	0a 00       	.word	0x000a	; ????
    2054:	00 d5       	rcall	.+2560   	; 0x2a56 <__DATA_REGION_LENGTH__+0x1256>
    2056:	03 34       	cpi	r16, 0x43	; 67
    2058:	00 03       	mulsu	r16, r16
    205a:	0e 3a       	cpi	r16, 0xAE	; 174
    205c:	0b 3b       	cpi	r16, 0xBB	; 187
    205e:	0b 49       	sbci	r16, 0x9B	; 155
    2060:	13 3f       	cpi	r17, 0xF3	; 243
    2062:	0c 02       	muls	r16, r28
    2064:	0a 00       	.word	0x000a	; ????
    2066:	00 d6       	rcall	.+3072   	; 0x2c68 <__DATA_REGION_LENGTH__+0x1468>
    2068:	03 34       	cpi	r16, 0x43	; 67
    206a:	00 03       	mulsu	r16, r16
    206c:	0e 3a       	cpi	r16, 0xAE	; 174
    206e:	0b 3b       	cpi	r16, 0xBB	; 187
    2070:	0b 49       	sbci	r16, 0x9B	; 155
    2072:	13 3f       	cpi	r17, 0xF3	; 243
    2074:	0c 02       	muls	r16, r28
    2076:	0a 00       	.word	0x000a	; ????
    2078:	00 d7       	rcall	.+3584   	; 0x2e7a <__DATA_REGION_LENGTH__+0x167a>
    207a:	03 34       	cpi	r16, 0x43	; 67
    207c:	00 03       	mulsu	r16, r16
    207e:	0e 3a       	cpi	r16, 0xAE	; 174
    2080:	0b 3b       	cpi	r16, 0xBB	; 187
    2082:	0b 49       	sbci	r16, 0x9B	; 155
    2084:	13 3f       	cpi	r17, 0xF3	; 243
    2086:	0c 02       	muls	r16, r28
    2088:	0a 00       	.word	0x000a	; ????
    208a:	00 d8       	rcall	.-4096   	; 0x108c <__LOCK_REGION_LENGTH__+0xc8c>
    208c:	03 34       	cpi	r16, 0x43	; 67
    208e:	00 03       	mulsu	r16, r16
    2090:	0e 3a       	cpi	r16, 0xAE	; 174
    2092:	0b 3b       	cpi	r16, 0xBB	; 187
    2094:	0b 49       	sbci	r16, 0x9B	; 155
    2096:	13 3f       	cpi	r17, 0xF3	; 243
    2098:	0c 02       	muls	r16, r28
    209a:	0a 00       	.word	0x000a	; ????
    209c:	00 d9       	rcall	.-3584   	; 0x129e <__LOCK_REGION_LENGTH__+0xe9e>
    209e:	03 34       	cpi	r16, 0x43	; 67
    20a0:	00 03       	mulsu	r16, r16
    20a2:	0e 3a       	cpi	r16, 0xAE	; 174
    20a4:	0b 3b       	cpi	r16, 0xBB	; 187
    20a6:	0b 49       	sbci	r16, 0x9B	; 155
    20a8:	13 3f       	cpi	r17, 0xF3	; 243
    20aa:	0c 02       	muls	r16, r28
    20ac:	0a 00       	.word	0x000a	; ????
    20ae:	00 da       	rcall	.-3072   	; 0x14b0 <__LOCK_REGION_LENGTH__+0x10b0>
    20b0:	03 34       	cpi	r16, 0x43	; 67
    20b2:	00 03       	mulsu	r16, r16
    20b4:	0e 3a       	cpi	r16, 0xAE	; 174
    20b6:	0b 3b       	cpi	r16, 0xBB	; 187
    20b8:	0b 49       	sbci	r16, 0x9B	; 155
    20ba:	13 3f       	cpi	r17, 0xF3	; 243
    20bc:	0c 02       	muls	r16, r28
    20be:	0a 00       	.word	0x000a	; ????
    20c0:	00 db       	rcall	.-2560   	; 0x16c2 <__LOCK_REGION_LENGTH__+0x12c2>
    20c2:	03 34       	cpi	r16, 0x43	; 67
    20c4:	00 03       	mulsu	r16, r16
    20c6:	0e 3a       	cpi	r16, 0xAE	; 174
    20c8:	0b 3b       	cpi	r16, 0xBB	; 187
    20ca:	0b 49       	sbci	r16, 0x9B	; 155
    20cc:	13 3f       	cpi	r17, 0xF3	; 243
    20ce:	0c 02       	muls	r16, r28
    20d0:	0a 00       	.word	0x000a	; ????
    20d2:	00 dc       	rcall	.-2048   	; 0x18d4 <__DATA_REGION_LENGTH__+0xd4>
    20d4:	03 34       	cpi	r16, 0x43	; 67
    20d6:	00 03       	mulsu	r16, r16
    20d8:	0e 3a       	cpi	r16, 0xAE	; 174
    20da:	0b 3b       	cpi	r16, 0xBB	; 187
    20dc:	0b 49       	sbci	r16, 0x9B	; 155
    20de:	13 3f       	cpi	r17, 0xF3	; 243
    20e0:	0c 02       	muls	r16, r28
    20e2:	0a 00       	.word	0x000a	; ????
    20e4:	00 dd       	rcall	.-1536   	; 0x1ae6 <__DATA_REGION_LENGTH__+0x2e6>
    20e6:	03 34       	cpi	r16, 0x43	; 67
    20e8:	00 03       	mulsu	r16, r16
    20ea:	0e 3a       	cpi	r16, 0xAE	; 174
    20ec:	0b 3b       	cpi	r16, 0xBB	; 187
    20ee:	0b 49       	sbci	r16, 0x9B	; 155
    20f0:	13 3f       	cpi	r17, 0xF3	; 243
    20f2:	0c 02       	muls	r16, r28
    20f4:	0a 00       	.word	0x000a	; ????
    20f6:	00 de       	rcall	.-1024   	; 0x1cf8 <__DATA_REGION_LENGTH__+0x4f8>
    20f8:	03 34       	cpi	r16, 0x43	; 67
    20fa:	00 03       	mulsu	r16, r16
    20fc:	0e 3a       	cpi	r16, 0xAE	; 174
    20fe:	0b 3b       	cpi	r16, 0xBB	; 187
    2100:	0b 49       	sbci	r16, 0x9B	; 155
    2102:	13 3f       	cpi	r17, 0xF3	; 243
    2104:	0c 02       	muls	r16, r28
    2106:	0a 00       	.word	0x000a	; ????
    2108:	00 df       	rcall	.-512    	; 0x1f0a <__DATA_REGION_LENGTH__+0x70a>
    210a:	03 34       	cpi	r16, 0x43	; 67
    210c:	00 03       	mulsu	r16, r16
    210e:	0e 3a       	cpi	r16, 0xAE	; 174
    2110:	0b 3b       	cpi	r16, 0xBB	; 187
    2112:	0b 49       	sbci	r16, 0x9B	; 155
    2114:	13 3f       	cpi	r17, 0xF3	; 243
    2116:	0c 02       	muls	r16, r28
    2118:	0a 00       	.word	0x000a	; ????
    211a:	00 e0       	ldi	r16, 0x00	; 0
    211c:	03 34       	cpi	r16, 0x43	; 67
    211e:	00 03       	mulsu	r16, r16
    2120:	0e 3a       	cpi	r16, 0xAE	; 174
    2122:	0b 3b       	cpi	r16, 0xBB	; 187
    2124:	0b 49       	sbci	r16, 0x9B	; 155
    2126:	13 3f       	cpi	r17, 0xF3	; 243
    2128:	0c 02       	muls	r16, r28
    212a:	0a 00       	.word	0x000a	; ????
    212c:	00 e1       	ldi	r16, 0x10	; 16
    212e:	03 34       	cpi	r16, 0x43	; 67
    2130:	00 03       	mulsu	r16, r16
    2132:	0e 3a       	cpi	r16, 0xAE	; 174
    2134:	0b 3b       	cpi	r16, 0xBB	; 187
    2136:	0b 49       	sbci	r16, 0x9B	; 155
    2138:	13 3f       	cpi	r17, 0xF3	; 243
    213a:	0c 02       	muls	r16, r28
    213c:	0a 00       	.word	0x000a	; ????
    213e:	00 e2       	ldi	r16, 0x20	; 32
    2140:	03 34       	cpi	r16, 0x43	; 67
    2142:	00 03       	mulsu	r16, r16
    2144:	0e 3a       	cpi	r16, 0xAE	; 174
    2146:	0b 3b       	cpi	r16, 0xBB	; 187
    2148:	0b 49       	sbci	r16, 0x9B	; 155
    214a:	13 3f       	cpi	r17, 0xF3	; 243
    214c:	0c 02       	muls	r16, r28
    214e:	0a 00       	.word	0x000a	; ????
    2150:	00 e3       	ldi	r16, 0x30	; 48
    2152:	03 34       	cpi	r16, 0x43	; 67
    2154:	00 03       	mulsu	r16, r16
    2156:	0e 3a       	cpi	r16, 0xAE	; 174
    2158:	0b 3b       	cpi	r16, 0xBB	; 187
    215a:	0b 49       	sbci	r16, 0x9B	; 155
    215c:	13 3f       	cpi	r17, 0xF3	; 243
    215e:	0c 02       	muls	r16, r28
    2160:	0a 00       	.word	0x000a	; ????
    2162:	00 e4       	ldi	r16, 0x40	; 64
    2164:	03 34       	cpi	r16, 0x43	; 67
    2166:	00 03       	mulsu	r16, r16
    2168:	0e 3a       	cpi	r16, 0xAE	; 174
    216a:	0b 3b       	cpi	r16, 0xBB	; 187
    216c:	0b 49       	sbci	r16, 0x9B	; 155
    216e:	13 3f       	cpi	r17, 0xF3	; 243
    2170:	0c 02       	muls	r16, r28
    2172:	0a 00       	.word	0x000a	; ????
    2174:	00 e5       	ldi	r16, 0x50	; 80
    2176:	03 34       	cpi	r16, 0x43	; 67
    2178:	00 03       	mulsu	r16, r16
    217a:	0e 3a       	cpi	r16, 0xAE	; 174
    217c:	0b 3b       	cpi	r16, 0xBB	; 187
    217e:	0b 49       	sbci	r16, 0x9B	; 155
    2180:	13 3f       	cpi	r17, 0xF3	; 243
    2182:	0c 02       	muls	r16, r28
    2184:	0a 00       	.word	0x000a	; ????
    2186:	00 e6       	ldi	r16, 0x60	; 96
    2188:	03 34       	cpi	r16, 0x43	; 67
    218a:	00 03       	mulsu	r16, r16
    218c:	0e 3a       	cpi	r16, 0xAE	; 174
    218e:	0b 3b       	cpi	r16, 0xBB	; 187
    2190:	0b 49       	sbci	r16, 0x9B	; 155
    2192:	13 3f       	cpi	r17, 0xF3	; 243
    2194:	0c 02       	muls	r16, r28
    2196:	0a 00       	.word	0x000a	; ????
    2198:	00 e7       	ldi	r16, 0x70	; 112
    219a:	03 34       	cpi	r16, 0x43	; 67
    219c:	00 03       	mulsu	r16, r16
    219e:	0e 3a       	cpi	r16, 0xAE	; 174
    21a0:	0b 3b       	cpi	r16, 0xBB	; 187
    21a2:	0b 49       	sbci	r16, 0x9B	; 155
    21a4:	13 3f       	cpi	r17, 0xF3	; 243
    21a6:	0c 02       	muls	r16, r28
    21a8:	0a 00       	.word	0x000a	; ????
    21aa:	00 e8       	ldi	r16, 0x80	; 128
    21ac:	03 34       	cpi	r16, 0x43	; 67
    21ae:	00 03       	mulsu	r16, r16
    21b0:	0e 3a       	cpi	r16, 0xAE	; 174
    21b2:	0b 3b       	cpi	r16, 0xBB	; 187
    21b4:	0b 49       	sbci	r16, 0x9B	; 155
    21b6:	13 3f       	cpi	r17, 0xF3	; 243
    21b8:	0c 02       	muls	r16, r28
    21ba:	0a 00       	.word	0x000a	; ????
    21bc:	00 e9       	ldi	r16, 0x90	; 144
    21be:	03 34       	cpi	r16, 0x43	; 67
    21c0:	00 03       	mulsu	r16, r16
    21c2:	0e 3a       	cpi	r16, 0xAE	; 174
    21c4:	0b 3b       	cpi	r16, 0xBB	; 187
    21c6:	0b 49       	sbci	r16, 0x9B	; 155
    21c8:	13 3f       	cpi	r17, 0xF3	; 243
    21ca:	0c 02       	muls	r16, r28
    21cc:	0a 00       	.word	0x000a	; ????
    21ce:	00 ea       	ldi	r16, 0xA0	; 160
    21d0:	03 34       	cpi	r16, 0x43	; 67
    21d2:	00 03       	mulsu	r16, r16
    21d4:	0e 3a       	cpi	r16, 0xAE	; 174
    21d6:	0b 3b       	cpi	r16, 0xBB	; 187
    21d8:	0b 49       	sbci	r16, 0x9B	; 155
    21da:	13 3f       	cpi	r17, 0xF3	; 243
    21dc:	0c 02       	muls	r16, r28
    21de:	0a 00       	.word	0x000a	; ????
    21e0:	00 eb       	ldi	r16, 0xB0	; 176
    21e2:	03 34       	cpi	r16, 0x43	; 67
    21e4:	00 03       	mulsu	r16, r16
    21e6:	0e 3a       	cpi	r16, 0xAE	; 174
    21e8:	0b 3b       	cpi	r16, 0xBB	; 187
    21ea:	0b 49       	sbci	r16, 0x9B	; 155
    21ec:	13 3f       	cpi	r17, 0xF3	; 243
    21ee:	0c 02       	muls	r16, r28
    21f0:	0a 00       	.word	0x000a	; ????
    21f2:	00 ec       	ldi	r16, 0xC0	; 192
    21f4:	03 34       	cpi	r16, 0x43	; 67
    21f6:	00 03       	mulsu	r16, r16
    21f8:	0e 3a       	cpi	r16, 0xAE	; 174
    21fa:	0b 3b       	cpi	r16, 0xBB	; 187
    21fc:	0b 49       	sbci	r16, 0x9B	; 155
    21fe:	13 3f       	cpi	r17, 0xF3	; 243
    2200:	0c 02       	muls	r16, r28
    2202:	0a 00       	.word	0x000a	; ????
    2204:	00 ed       	ldi	r16, 0xD0	; 208
    2206:	03 34       	cpi	r16, 0x43	; 67
    2208:	00 03       	mulsu	r16, r16
    220a:	0e 3a       	cpi	r16, 0xAE	; 174
    220c:	0b 3b       	cpi	r16, 0xBB	; 187
    220e:	0b 49       	sbci	r16, 0x9B	; 155
    2210:	13 3f       	cpi	r17, 0xF3	; 243
    2212:	0c 02       	muls	r16, r28
    2214:	0a 00       	.word	0x000a	; ????
    2216:	00 ee       	ldi	r16, 0xE0	; 224
    2218:	03 34       	cpi	r16, 0x43	; 67
    221a:	00 03       	mulsu	r16, r16
    221c:	0e 3a       	cpi	r16, 0xAE	; 174
    221e:	0b 3b       	cpi	r16, 0xBB	; 187
    2220:	0b 49       	sbci	r16, 0x9B	; 155
    2222:	13 3f       	cpi	r17, 0xF3	; 243
    2224:	0c 02       	muls	r16, r28
    2226:	0a 00       	.word	0x000a	; ????
    2228:	00 ef       	ldi	r16, 0xF0	; 240
    222a:	03 34       	cpi	r16, 0x43	; 67
    222c:	00 03       	mulsu	r16, r16
    222e:	0e 3a       	cpi	r16, 0xAE	; 174
    2230:	0b 3b       	cpi	r16, 0xBB	; 187
    2232:	0b 49       	sbci	r16, 0x9B	; 155
    2234:	13 3f       	cpi	r17, 0xF3	; 243
    2236:	0c 02       	muls	r16, r28
    2238:	0a 00       	.word	0x000a	; ????
    223a:	00 f0       	brcs	.+0      	; 0x223c <__DATA_REGION_LENGTH__+0xa3c>
    223c:	03 34       	cpi	r16, 0x43	; 67
    223e:	00 03       	mulsu	r16, r16
    2240:	0e 3a       	cpi	r16, 0xAE	; 174
    2242:	0b 3b       	cpi	r16, 0xBB	; 187
    2244:	0b 49       	sbci	r16, 0x9B	; 155
    2246:	13 3f       	cpi	r17, 0xF3	; 243
    2248:	0c 02       	muls	r16, r28
    224a:	0a 00       	.word	0x000a	; ????
    224c:	00 f1       	brcs	.+64     	; 0x228e <__DATA_REGION_LENGTH__+0xa8e>
    224e:	03 34       	cpi	r16, 0x43	; 67
    2250:	00 03       	mulsu	r16, r16
    2252:	0e 3a       	cpi	r16, 0xAE	; 174
    2254:	0b 3b       	cpi	r16, 0xBB	; 187
    2256:	0b 49       	sbci	r16, 0x9B	; 155
    2258:	13 3f       	cpi	r17, 0xF3	; 243
    225a:	0c 02       	muls	r16, r28
    225c:	0a 00       	.word	0x000a	; ????
    225e:	00 f2       	brcs	.-128    	; 0x21e0 <__DATA_REGION_LENGTH__+0x9e0>
    2260:	03 34       	cpi	r16, 0x43	; 67
    2262:	00 03       	mulsu	r16, r16
    2264:	0e 3a       	cpi	r16, 0xAE	; 174
    2266:	0b 3b       	cpi	r16, 0xBB	; 187
    2268:	0b 49       	sbci	r16, 0x9B	; 155
    226a:	13 3f       	cpi	r17, 0xF3	; 243
    226c:	0c 02       	muls	r16, r28
    226e:	0a 00       	.word	0x000a	; ????
    2270:	00 f3       	brcs	.-64     	; 0x2232 <__DATA_REGION_LENGTH__+0xa32>
    2272:	03 34       	cpi	r16, 0x43	; 67
    2274:	00 03       	mulsu	r16, r16
    2276:	0e 3a       	cpi	r16, 0xAE	; 174
    2278:	0b 3b       	cpi	r16, 0xBB	; 187
    227a:	0b 49       	sbci	r16, 0x9B	; 155
    227c:	13 3f       	cpi	r17, 0xF3	; 243
    227e:	0c 02       	muls	r16, r28
    2280:	0a 00       	.word	0x000a	; ????
    2282:	00 f4       	brcc	.+0      	; 0x2284 <__DATA_REGION_LENGTH__+0xa84>
    2284:	03 34       	cpi	r16, 0x43	; 67
    2286:	00 03       	mulsu	r16, r16
    2288:	0e 3a       	cpi	r16, 0xAE	; 174
    228a:	0b 3b       	cpi	r16, 0xBB	; 187
    228c:	0b 49       	sbci	r16, 0x9B	; 155
    228e:	13 3f       	cpi	r17, 0xF3	; 243
    2290:	0c 02       	muls	r16, r28
    2292:	0a 00       	.word	0x000a	; ????
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	83 01       	movw	r16, r6
   2:	00 00       	nop
   4:	02 00       	.word	0x0002	; ????
   6:	2c 00       	.word	0x002c	; ????
   8:	00 00       	nop
   a:	02 01       	movw	r0, r4
   c:	fb 0e       	add	r15, r27
   e:	0a 00       	.word	0x000a	; ????
  10:	01 01       	movw	r0, r2
  12:	01 01       	movw	r0, r2
  14:	00 00       	nop
  16:	00 01       	movw	r0, r0
  18:	2e 2e       	mov	r2, r30
  1a:	2f 2e       	mov	r2, r31
  1c:	2e 2f       	mov	r18, r30
  1e:	2e 2e       	mov	r2, r30
  20:	2f 2e       	mov	r2, r31
  22:	2e 2f       	mov	r18, r30
  24:	63 72       	andi	r22, 0x23	; 35
  26:	74 31       	cpi	r23, 0x14	; 20
  28:	00 00       	nop
  2a:	67 63       	ori	r22, 0x37	; 55
  2c:	72 74       	andi	r23, 0x42	; 66
  2e:	31 2e       	mov	r3, r17
  30:	53 00       	.word	0x0053	; ????
  32:	01 00       	.word	0x0001	; ????
  34:	00 00       	nop
  36:	00 05       	cpc	r16, r0
  38:	02 00       	.word	0x0002	; ????
  3a:	00 00       	nop
  3c:	00 03       	mulsu	r16, r16
  3e:	3c 01       	movw	r6, r24
  40:	03 02       	muls	r16, r19
  42:	09 04       	cpc	r0, r9
  44:	00 01       	movw	r0, r0
  46:	03 01       	movw	r0, r6
  48:	09 04       	cpc	r0, r9
  4a:	00 01       	movw	r0, r0
  4c:	03 01       	movw	r0, r6
  4e:	09 04       	cpc	r0, r9
  50:	00 01       	movw	r0, r0
  52:	03 01       	movw	r0, r6
  54:	09 04       	cpc	r0, r9
  56:	00 01       	movw	r0, r0
  58:	03 01       	movw	r0, r6
  5a:	09 04       	cpc	r0, r9
  5c:	00 01       	movw	r0, r0
  5e:	03 01       	movw	r0, r6
  60:	09 04       	cpc	r0, r9
  62:	00 01       	movw	r0, r0
  64:	03 01       	movw	r0, r6
  66:	09 04       	cpc	r0, r9
  68:	00 01       	movw	r0, r0
  6a:	03 01       	movw	r0, r6
  6c:	09 04       	cpc	r0, r9
  6e:	00 01       	movw	r0, r0
  70:	03 01       	movw	r0, r6
  72:	09 04       	cpc	r0, r9
  74:	00 01       	movw	r0, r0
  76:	03 01       	movw	r0, r6
  78:	09 04       	cpc	r0, r9
  7a:	00 01       	movw	r0, r0
  7c:	03 01       	movw	r0, r6
  7e:	09 04       	cpc	r0, r9
  80:	00 01       	movw	r0, r0
  82:	03 01       	movw	r0, r6
  84:	09 04       	cpc	r0, r9
  86:	00 01       	movw	r0, r0
  88:	03 01       	movw	r0, r6
  8a:	09 04       	cpc	r0, r9
  8c:	00 01       	movw	r0, r0
  8e:	03 01       	movw	r0, r6
  90:	09 04       	cpc	r0, r9
  92:	00 01       	movw	r0, r0
  94:	03 01       	movw	r0, r6
  96:	09 04       	cpc	r0, r9
  98:	00 01       	movw	r0, r0
  9a:	03 01       	movw	r0, r6
  9c:	09 04       	cpc	r0, r9
  9e:	00 01       	movw	r0, r0
  a0:	03 01       	movw	r0, r6
  a2:	09 04       	cpc	r0, r9
  a4:	00 01       	movw	r0, r0
  a6:	03 01       	movw	r0, r6
  a8:	09 04       	cpc	r0, r9
  aa:	00 01       	movw	r0, r0
  ac:	03 01       	movw	r0, r6
  ae:	09 04       	cpc	r0, r9
  b0:	00 01       	movw	r0, r0
  b2:	03 01       	movw	r0, r6
  b4:	09 04       	cpc	r0, r9
  b6:	00 01       	movw	r0, r0
  b8:	03 01       	movw	r0, r6
  ba:	09 04       	cpc	r0, r9
  bc:	00 01       	movw	r0, r0
  be:	03 01       	movw	r0, r6
  c0:	09 04       	cpc	r0, r9
  c2:	00 01       	movw	r0, r0
  c4:	03 01       	movw	r0, r6
  c6:	09 04       	cpc	r0, r9
  c8:	00 01       	movw	r0, r0
  ca:	03 01       	movw	r0, r6
  cc:	09 04       	cpc	r0, r9
  ce:	00 01       	movw	r0, r0
  d0:	03 01       	movw	r0, r6
  d2:	09 04       	cpc	r0, r9
  d4:	00 01       	movw	r0, r0
  d6:	03 01       	movw	r0, r6
  d8:	09 04       	cpc	r0, r9
  da:	00 01       	movw	r0, r0
  dc:	03 01       	movw	r0, r6
  de:	09 04       	cpc	r0, r9
  e0:	00 01       	movw	r0, r0
  e2:	03 01       	movw	r0, r6
  e4:	09 04       	cpc	r0, r9
  e6:	00 01       	movw	r0, r0
  e8:	03 01       	movw	r0, r6
  ea:	09 04       	cpc	r0, r9
  ec:	00 01       	movw	r0, r0
  ee:	03 01       	movw	r0, r6
  f0:	09 04       	cpc	r0, r9
  f2:	00 01       	movw	r0, r0
  f4:	03 01       	movw	r0, r6
  f6:	09 04       	cpc	r0, r9
  f8:	00 01       	movw	r0, r0
  fa:	03 01       	movw	r0, r6
  fc:	09 04       	cpc	r0, r9
  fe:	00 01       	movw	r0, r0
 100:	03 01       	movw	r0, r6
 102:	09 04       	cpc	r0, r9
 104:	00 01       	movw	r0, r0
 106:	03 01       	movw	r0, r6
 108:	09 04       	cpc	r0, r9
 10a:	00 01       	movw	r0, r0
 10c:	03 01       	movw	r0, r6
 10e:	09 04       	cpc	r0, r9
 110:	00 01       	movw	r0, r0
 112:	03 01       	movw	r0, r6
 114:	09 04       	cpc	r0, r9
 116:	00 01       	movw	r0, r0
 118:	03 01       	movw	r0, r6
 11a:	09 04       	cpc	r0, r9
 11c:	00 01       	movw	r0, r0
 11e:	03 01       	movw	r0, r6
 120:	09 04       	cpc	r0, r9
 122:	00 01       	movw	r0, r0
 124:	03 01       	movw	r0, r6
 126:	09 04       	cpc	r0, r9
 128:	00 01       	movw	r0, r0
 12a:	09 04       	cpc	r0, r9
 12c:	00 00       	nop
 12e:	01 01       	movw	r0, r2
 130:	00 05       	cpc	r16, r0
 132:	02 b4       	in	r0, 0x22	; 34
 134:	00 00       	nop
 136:	00 03       	mulsu	r16, r16
 138:	cc 01       	movw	r24, r24
 13a:	01 09       	sbc	r16, r1
 13c:	04 00       	.word	0x0004	; ????
 13e:	00 01       	movw	r0, r0
 140:	01 00       	.word	0x0001	; ????
 142:	05 02       	muls	r16, r21
 144:	a0 00       	.word	0x00a0	; ????
 146:	00 00       	nop
 148:	03 e1       	ldi	r16, 0x13	; 19
 14a:	01 01       	movw	r0, r2
 14c:	03 01       	movw	r0, r6
 14e:	09 02       	muls	r16, r25
 150:	00 01       	movw	r0, r0
 152:	03 01       	movw	r0, r6
 154:	09 02       	muls	r16, r25
 156:	00 01       	movw	r0, r0
 158:	03 02       	muls	r16, r19
 15a:	09 02       	muls	r16, r25
 15c:	00 01       	movw	r0, r0
 15e:	03 02       	muls	r16, r19
 160:	09 02       	muls	r16, r25
 162:	00 01       	movw	r0, r0
 164:	03 01       	movw	r0, r6
 166:	09 02       	muls	r16, r25
 168:	00 01       	movw	r0, r0
 16a:	09 02       	muls	r16, r25
 16c:	00 00       	nop
 16e:	01 01       	movw	r0, r2
 170:	00 05       	cpc	r16, r0
 172:	02 ac       	ldd	r0, Z+58	; 0x3a
 174:	00 00       	nop
 176:	00 03       	mulsu	r16, r16
 178:	b5 02       	muls	r27, r21
 17a:	01 03       	mulsu	r16, r17
 17c:	01 09       	sbc	r16, r1
 17e:	04 00       	.word	0x0004	; ????
 180:	01 09       	sbc	r16, r1
 182:	04 00       	.word	0x0004	; ????
 184:	00 01       	movw	r0, r0
 186:	Address 0x0000000000000186 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	61 76       	andi	r22, 0x61	; 97
   2:	72 2d       	mov	r23, r2
   4:	6c 69       	ori	r22, 0x9C	; 156
   6:	62 63       	ori	r22, 0x32	; 50
   8:	20 32       	cpi	r18, 0x20	; 32
   a:	2e 30       	cpi	r18, 0x0E	; 14
   c:	2e 30       	cpi	r18, 0x0E	; 14
   e:	00 75       	andi	r16, 0x50	; 80
  10:	69 6e       	ori	r22, 0xE9	; 233
  12:	74 38       	cpi	r23, 0x84	; 132
  14:	5f 74       	andi	r21, 0x4F	; 79
  16:	00 75       	andi	r16, 0x50	; 80
  18:	69 6e       	ori	r22, 0xE9	; 233
  1a:	74 31       	cpi	r23, 0x14	; 20
  1c:	36 5f       	subi	r19, 0xF6	; 246
  1e:	74 00       	.word	0x0074	; ????
  20:	43 54       	subi	r20, 0x43	; 67
  22:	52 4c       	sbci	r21, 0xC2	; 194
  24:	41 00       	.word	0x0041	; ????
  26:	44 41       	sbci	r20, 0x14	; 20
  28:	43 52       	subi	r20, 0x23	; 35
  2a:	45 46       	sbci	r20, 0x65	; 101
  2c:	00 49       	sbci	r16, 0x90	; 144
  2e:	4e 54       	subi	r20, 0x4E	; 78
  30:	43 54       	subi	r20, 0x43	; 67
  32:	52 4c       	sbci	r21, 0xC2	; 194
  34:	00 4d       	sbci	r16, 0xD0	; 208
  36:	55 58       	subi	r21, 0x85	; 133
  38:	43 54       	subi	r20, 0x43	; 67
  3a:	52 4c       	sbci	r21, 0xC2	; 194
  3c:	41 00       	.word	0x0041	; ????
  3e:	53 54       	subi	r21, 0x43	; 67
  40:	41 54       	subi	r20, 0x41	; 65
  42:	55 53       	subi	r21, 0x35	; 53
  44:	00 43       	sbci	r16, 0x30	; 48
  46:	41 4c       	sbci	r20, 0xC1	; 193
  48:	49 42       	sbci	r20, 0x29	; 41
  4a:	00 43       	sbci	r16, 0x30	; 48
  4c:	4f 4d       	sbci	r20, 0xDF	; 223
  4e:	4d 41       	sbci	r20, 0x1D	; 29
  50:	4e 44       	sbci	r20, 0x4E	; 78
  52:	00 43       	sbci	r16, 0x30	; 48
  54:	54 52       	subi	r21, 0x24	; 36
  56:	4c 41       	sbci	r20, 0x1C	; 28
  58:	00 43       	sbci	r16, 0x30	; 48
  5a:	54 52       	subi	r21, 0x24	; 36
  5c:	4c 42       	sbci	r20, 0x2C	; 44
  5e:	00 43       	sbci	r16, 0x30	; 48
  60:	54 52       	subi	r21, 0x24	; 36
  62:	4c 43       	sbci	r20, 0x3C	; 60
  64:	00 43       	sbci	r16, 0x30	; 48
  66:	54 52       	subi	r21, 0x24	; 36
  68:	4c 44       	sbci	r20, 0x4C	; 76
  6a:	00 43       	sbci	r16, 0x30	; 48
  6c:	54 52       	subi	r21, 0x24	; 36
  6e:	4c 45       	sbci	r20, 0x5C	; 92
  70:	00 44       	sbci	r16, 0x40	; 64
  72:	42 47       	sbci	r20, 0x72	; 114
  74:	43 54       	subi	r20, 0x43	; 67
  76:	52 4c       	sbci	r21, 0xC2	; 194
  78:	00 45       	sbci	r16, 0x50	; 80
  7a:	56 43       	sbci	r21, 0x36	; 54
  7c:	54 52       	subi	r21, 0x24	; 36
  7e:	4c 00       	.word	0x004c	; ????
  80:	49 4e       	sbci	r20, 0xE9	; 233
  82:	54 43       	sbci	r21, 0x34	; 52
  84:	54 52       	subi	r21, 0x24	; 36
  86:	4c 00       	.word	0x004c	; ????
  88:	49 4e       	sbci	r20, 0xE9	; 233
  8a:	54 46       	sbci	r21, 0x64	; 100
  8c:	4c 41       	sbci	r20, 0x1C	; 28
  8e:	47 53       	subi	r20, 0x37	; 55
  90:	00 4d       	sbci	r16, 0xD0	; 208
  92:	55 58       	subi	r21, 0x85	; 133
  94:	50 4f       	sbci	r21, 0xF0	; 240
  96:	53 00       	.word	0x0053	; ????
  98:	52 45       	sbci	r21, 0x52	; 82
  9a:	53 00       	.word	0x0053	; ????
  9c:	53 41       	sbci	r21, 0x13	; 19
  9e:	4d 50       	subi	r20, 0x0D	; 13
  a0:	43 54       	subi	r20, 0x43	; 67
  a2:	52 4c       	sbci	r21, 0xC2	; 194
  a4:	00 54       	subi	r16, 0x40	; 64
  a6:	45 4d       	sbci	r20, 0xD5	; 213
  a8:	50 00       	.word	0x0050	; ????
  aa:	57 49       	sbci	r21, 0x97	; 151
  ac:	4e 48       	sbci	r20, 0x8E	; 142
  ae:	54 00       	.word	0x0054	; ????
  b0:	57 49       	sbci	r21, 0x97	; 151
  b2:	4e 4c       	sbci	r20, 0xCE	; 206
  b4:	54 00       	.word	0x0054	; ????
  b6:	43 54       	subi	r20, 0x43	; 67
  b8:	52 4c       	sbci	r21, 0xC2	; 194
  ba:	41 00       	.word	0x0041	; ????
  bc:	43 54       	subi	r20, 0x43	; 67
  be:	52 4c       	sbci	r21, 0xC2	; 194
  c0:	42 00       	.word	0x0042	; ????
  c2:	49 4e       	sbci	r20, 0xE9	; 233
  c4:	54 43       	sbci	r21, 0x34	; 52
  c6:	54 52       	subi	r21, 0x24	; 36
  c8:	4c 00       	.word	0x004c	; ????
  ca:	49 4e       	sbci	r20, 0xE9	; 233
  cc:	54 46       	sbci	r21, 0x64	; 100
  ce:	4c 41       	sbci	r20, 0x1C	; 28
  d0:	47 53       	subi	r20, 0x37	; 55
  d2:	00 53       	subi	r16, 0x30	; 48
  d4:	54 41       	sbci	r21, 0x14	; 20
  d6:	54 55       	subi	r21, 0x54	; 84
  d8:	53 00       	.word	0x0053	; ????
  da:	56 4c       	sbci	r21, 0xC6	; 198
  dc:	4d 43       	sbci	r20, 0x3D	; 61
  de:	54 52       	subi	r21, 0x24	; 36
  e0:	4c 41       	sbci	r20, 0x1C	; 28
  e2:	00 43       	sbci	r16, 0x30	; 48
  e4:	54 52       	subi	r21, 0x24	; 36
  e6:	4c 41       	sbci	r20, 0x1C	; 28
  e8:	00 49       	sbci	r16, 0x90	; 144
  ea:	4e 54       	subi	r20, 0x4E	; 78
  ec:	43 54       	subi	r20, 0x43	; 67
  ee:	52 4c       	sbci	r21, 0xC2	; 194
  f0:	30 00       	.word	0x0030	; ????
  f2:	49 4e       	sbci	r20, 0xE9	; 233
  f4:	54 46       	sbci	r21, 0x64	; 100
  f6:	4c 41       	sbci	r20, 0x1C	; 28
  f8:	47 53       	subi	r20, 0x37	; 55
  fa:	00 4c       	sbci	r16, 0xC0	; 192
  fc:	55 54       	subi	r21, 0x45	; 69
  fe:	30 43       	sbci	r19, 0x30	; 48
 100:	54 52       	subi	r21, 0x24	; 36
 102:	4c 41       	sbci	r20, 0x1C	; 28
 104:	00 4c       	sbci	r16, 0xC0	; 192
 106:	55 54       	subi	r21, 0x45	; 69
 108:	30 43       	sbci	r19, 0x30	; 48
 10a:	54 52       	subi	r21, 0x24	; 36
 10c:	4c 42       	sbci	r20, 0x2C	; 44
 10e:	00 4c       	sbci	r16, 0xC0	; 192
 110:	55 54       	subi	r21, 0x45	; 69
 112:	30 43       	sbci	r19, 0x30	; 48
 114:	54 52       	subi	r21, 0x24	; 36
 116:	4c 43       	sbci	r20, 0x3C	; 60
 118:	00 4c       	sbci	r16, 0xC0	; 192
 11a:	55 54       	subi	r21, 0x45	; 69
 11c:	31 43       	sbci	r19, 0x31	; 49
 11e:	54 52       	subi	r21, 0x24	; 36
 120:	4c 41       	sbci	r20, 0x1C	; 28
 122:	00 4c       	sbci	r16, 0xC0	; 192
 124:	55 54       	subi	r21, 0x45	; 69
 126:	31 43       	sbci	r19, 0x31	; 49
 128:	54 52       	subi	r21, 0x24	; 36
 12a:	4c 42       	sbci	r20, 0x2C	; 44
 12c:	00 4c       	sbci	r16, 0xC0	; 192
 12e:	55 54       	subi	r21, 0x45	; 69
 130:	31 43       	sbci	r19, 0x31	; 49
 132:	54 52       	subi	r21, 0x24	; 36
 134:	4c 43       	sbci	r20, 0x3C	; 60
 136:	00 4c       	sbci	r16, 0xC0	; 192
 138:	55 54       	subi	r21, 0x45	; 69
 13a:	32 43       	sbci	r19, 0x32	; 50
 13c:	54 52       	subi	r21, 0x24	; 36
 13e:	4c 41       	sbci	r20, 0x1C	; 28
 140:	00 4c       	sbci	r16, 0xC0	; 192
 142:	55 54       	subi	r21, 0x45	; 69
 144:	32 43       	sbci	r19, 0x32	; 50
 146:	54 52       	subi	r21, 0x24	; 36
 148:	4c 42       	sbci	r20, 0x2C	; 44
 14a:	00 4c       	sbci	r16, 0xC0	; 192
 14c:	55 54       	subi	r21, 0x45	; 69
 14e:	32 43       	sbci	r19, 0x32	; 50
 150:	54 52       	subi	r21, 0x24	; 36
 152:	4c 43       	sbci	r20, 0x3C	; 60
 154:	00 4c       	sbci	r16, 0xC0	; 192
 156:	55 54       	subi	r21, 0x45	; 69
 158:	33 43       	sbci	r19, 0x33	; 51
 15a:	54 52       	subi	r21, 0x24	; 36
 15c:	4c 41       	sbci	r20, 0x1C	; 28
 15e:	00 4c       	sbci	r16, 0xC0	; 192
 160:	55 54       	subi	r21, 0x45	; 69
 162:	33 43       	sbci	r19, 0x33	; 51
 164:	54 52       	subi	r21, 0x24	; 36
 166:	4c 42       	sbci	r20, 0x2C	; 44
 168:	00 4c       	sbci	r16, 0xC0	; 192
 16a:	55 54       	subi	r21, 0x45	; 69
 16c:	33 43       	sbci	r19, 0x33	; 51
 16e:	54 52       	subi	r21, 0x24	; 36
 170:	4c 43       	sbci	r20, 0x3C	; 60
 172:	00 53       	subi	r16, 0x30	; 48
 174:	45 51       	subi	r20, 0x15	; 21
 176:	43 54       	subi	r20, 0x43	; 67
 178:	52 4c       	sbci	r21, 0xC2	; 194
 17a:	30 00       	.word	0x0030	; ????
 17c:	53 45       	sbci	r21, 0x53	; 83
 17e:	51 43       	sbci	r21, 0x31	; 49
 180:	54 52       	subi	r21, 0x24	; 36
 182:	4c 31       	cpi	r20, 0x1C	; 28
 184:	00 54       	subi	r16, 0x40	; 64
 186:	52 55       	subi	r21, 0x52	; 82
 188:	54 48       	sbci	r21, 0x84	; 132
 18a:	30 00       	.word	0x0030	; ????
 18c:	54 52       	subi	r21, 0x24	; 36
 18e:	55 54       	subi	r21, 0x45	; 69
 190:	48 31       	cpi	r20, 0x18	; 24
 192:	00 54       	subi	r16, 0x40	; 64
 194:	52 55       	subi	r21, 0x52	; 82
 196:	54 48       	sbci	r21, 0x84	; 132
 198:	32 00       	.word	0x0032	; ????
 19a:	54 52       	subi	r21, 0x24	; 36
 19c:	55 54       	subi	r21, 0x45	; 69
 19e:	48 33       	cpi	r20, 0x38	; 56
 1a0:	00 4d       	sbci	r16, 0xD0	; 208
 1a2:	43 4c       	sbci	r20, 0xC3	; 195
 1a4:	4b 43       	sbci	r20, 0x3B	; 59
 1a6:	54 52       	subi	r21, 0x24	; 36
 1a8:	4c 41       	sbci	r20, 0x1C	; 28
 1aa:	00 4d       	sbci	r16, 0xD0	; 208
 1ac:	43 4c       	sbci	r20, 0xC3	; 195
 1ae:	4b 43       	sbci	r20, 0x3B	; 59
 1b0:	54 52       	subi	r21, 0x24	; 36
 1b2:	4c 42       	sbci	r20, 0x2C	; 44
 1b4:	00 4d       	sbci	r16, 0xD0	; 208
 1b6:	43 4c       	sbci	r20, 0xC3	; 195
 1b8:	4b 4c       	sbci	r20, 0xCB	; 203
 1ba:	4f 43       	sbci	r20, 0x3F	; 63
 1bc:	4b 00       	.word	0x004b	; ????
 1be:	4d 43       	sbci	r20, 0x3D	; 61
 1c0:	4c 4b       	sbci	r20, 0xBC	; 188
 1c2:	53 54       	subi	r21, 0x43	; 67
 1c4:	41 54       	subi	r20, 0x41	; 65
 1c6:	55 53       	subi	r21, 0x35	; 53
 1c8:	00 4f       	sbci	r16, 0xF0	; 240
 1ca:	53 43       	sbci	r21, 0x33	; 51
 1cc:	32 30       	cpi	r19, 0x02	; 2
 1ce:	4d 43       	sbci	r20, 0x3D	; 61
 1d0:	41 4c       	sbci	r20, 0xC1	; 193
 1d2:	49 42       	sbci	r20, 0x29	; 41
 1d4:	41 00       	.word	0x0041	; ????
 1d6:	4f 53       	subi	r20, 0x3F	; 63
 1d8:	43 32       	cpi	r20, 0x23	; 35
 1da:	30 4d       	sbci	r19, 0xD0	; 208
 1dc:	43 41       	sbci	r20, 0x13	; 19
 1de:	4c 49       	sbci	r20, 0x9C	; 156
 1e0:	42 42       	sbci	r20, 0x22	; 34
 1e2:	00 4f       	sbci	r16, 0xF0	; 240
 1e4:	53 43       	sbci	r21, 0x33	; 51
 1e6:	32 30       	cpi	r19, 0x02	; 2
 1e8:	4d 43       	sbci	r20, 0x3D	; 61
 1ea:	54 52       	subi	r21, 0x24	; 36
 1ec:	4c 41       	sbci	r20, 0x1C	; 28
 1ee:	00 4f       	sbci	r16, 0xF0	; 240
 1f0:	53 43       	sbci	r21, 0x33	; 51
 1f2:	33 32       	cpi	r19, 0x23	; 35
 1f4:	4b 43       	sbci	r20, 0x3B	; 59
 1f6:	54 52       	subi	r21, 0x24	; 36
 1f8:	4c 41       	sbci	r20, 0x1C	; 28
 1fa:	00 58       	subi	r16, 0x80	; 128
 1fc:	4f 53       	subi	r20, 0x3F	; 63
 1fe:	43 33       	cpi	r20, 0x33	; 51
 200:	32 4b       	sbci	r19, 0xB2	; 178
 202:	43 54       	subi	r20, 0x43	; 67
 204:	52 4c       	sbci	r21, 0xC2	; 194
 206:	41 00       	.word	0x0041	; ????
 208:	43 43       	sbci	r20, 0x33	; 51
 20a:	50 00       	.word	0x0050	; ????
 20c:	53 50       	subi	r21, 0x03	; 3
 20e:	48 00       	.word	0x0048	; ????
 210:	53 50       	subi	r21, 0x03	; 3
 212:	4c 00       	.word	0x004c	; ????
 214:	53 52       	subi	r21, 0x23	; 35
 216:	45 47       	sbci	r20, 0x75	; 117
 218:	00 43       	sbci	r16, 0x30	; 48
 21a:	54 52       	subi	r21, 0x24	; 36
 21c:	4c 41       	sbci	r20, 0x1C	; 28
 21e:	00 4c       	sbci	r16, 0xC0	; 192
 220:	56 4c       	sbci	r21, 0xC6	; 198
 222:	30 50       	subi	r19, 0x00	; 0
 224:	52 49       	sbci	r21, 0x92	; 146
 226:	00 4c       	sbci	r16, 0xC0	; 192
 228:	56 4c       	sbci	r21, 0xC6	; 198
 22a:	31 56       	subi	r19, 0x61	; 97
 22c:	45 43       	sbci	r20, 0x35	; 53
 22e:	00 53       	subi	r16, 0x30	; 48
 230:	54 41       	sbci	r21, 0x14	; 20
 232:	54 55       	subi	r21, 0x54	; 84
 234:	53 00       	.word	0x0053	; ????
 236:	43 54       	subi	r20, 0x43	; 67
 238:	52 4c       	sbci	r21, 0xC2	; 194
 23a:	41 00       	.word	0x0041	; ????
 23c:	43 54       	subi	r20, 0x43	; 67
 23e:	52 4c       	sbci	r21, 0xC2	; 194
 240:	42 00       	.word	0x0042	; ????
 242:	53 54       	subi	r21, 0x43	; 67
 244:	41 54       	subi	r20, 0x41	; 65
 246:	55 53       	subi	r21, 0x35	; 53
 248:	00 43       	sbci	r16, 0x30	; 48
 24a:	48 41       	sbci	r20, 0x18	; 24
 24c:	4e 4e       	sbci	r20, 0xEE	; 238
 24e:	45 4c       	sbci	r20, 0xC5	; 197
 250:	30 00       	.word	0x0030	; ????
 252:	43 48       	sbci	r20, 0x83	; 131
 254:	41 4e       	sbci	r20, 0xE1	; 225
 256:	4e 45       	sbci	r20, 0x5E	; 94
 258:	4c 31       	cpi	r20, 0x1C	; 28
 25a:	00 43       	sbci	r16, 0x30	; 48
 25c:	48 41       	sbci	r20, 0x18	; 24
 25e:	4e 4e       	sbci	r20, 0xEE	; 238
 260:	45 4c       	sbci	r20, 0xC5	; 197
 262:	32 00       	.word	0x0032	; ????
 264:	43 48       	sbci	r20, 0x83	; 131
 266:	41 4e       	sbci	r20, 0xE1	; 225
 268:	4e 45       	sbci	r20, 0x5E	; 94
 26a:	4c 33       	cpi	r20, 0x3C	; 60
 26c:	00 43       	sbci	r16, 0x30	; 48
 26e:	48 41       	sbci	r20, 0x18	; 24
 270:	4e 4e       	sbci	r20, 0xEE	; 238
 272:	45 4c       	sbci	r20, 0xC5	; 197
 274:	34 00       	.word	0x0034	; ????
 276:	43 48       	sbci	r20, 0x83	; 131
 278:	41 4e       	sbci	r20, 0xE1	; 225
 27a:	4e 45       	sbci	r20, 0x5E	; 94
 27c:	4c 35       	cpi	r20, 0x5C	; 92
 27e:	00 43       	sbci	r16, 0x30	; 48
 280:	48 41       	sbci	r20, 0x18	; 24
 282:	4e 4e       	sbci	r20, 0xEE	; 238
 284:	45 4c       	sbci	r20, 0xC5	; 197
 286:	36 00       	.word	0x0036	; ????
 288:	43 48       	sbci	r20, 0x83	; 131
 28a:	41 4e       	sbci	r20, 0xE1	; 225
 28c:	4e 45       	sbci	r20, 0x5E	; 94
 28e:	4c 37       	cpi	r20, 0x7C	; 124
 290:	00 53       	subi	r16, 0x30	; 48
 292:	54 52       	subi	r21, 0x24	; 36
 294:	4f 42       	sbci	r20, 0x2F	; 47
 296:	45 00       	.word	0x0045	; ????
 298:	55 53       	subi	r21, 0x35	; 53
 29a:	45 52       	subi	r20, 0x25	; 37
 29c:	41 44       	sbci	r20, 0x41	; 65
 29e:	43 30       	cpi	r20, 0x03	; 3
 2a0:	00 55       	subi	r16, 0x50	; 80
 2a2:	53 45       	sbci	r21, 0x53	; 83
 2a4:	52 43       	sbci	r21, 0x32	; 50
 2a6:	43 4c       	sbci	r20, 0xC3	; 195
 2a8:	4c 55       	subi	r20, 0x5C	; 92
 2aa:	54 30       	cpi	r21, 0x04	; 4
 2ac:	41 00       	.word	0x0041	; ????
 2ae:	55 53       	subi	r21, 0x35	; 53
 2b0:	45 52       	subi	r20, 0x25	; 37
 2b2:	43 43       	sbci	r20, 0x33	; 51
 2b4:	4c 4c       	sbci	r20, 0xCC	; 204
 2b6:	55 54       	subi	r21, 0x45	; 69
 2b8:	30 42       	sbci	r19, 0x20	; 32
 2ba:	00 55       	subi	r16, 0x50	; 80
 2bc:	53 45       	sbci	r21, 0x53	; 83
 2be:	52 43       	sbci	r21, 0x32	; 50
 2c0:	43 4c       	sbci	r20, 0xC3	; 195
 2c2:	4c 55       	subi	r20, 0x5C	; 92
 2c4:	54 31       	cpi	r21, 0x14	; 20
 2c6:	41 00       	.word	0x0041	; ????
 2c8:	55 53       	subi	r21, 0x35	; 53
 2ca:	45 52       	subi	r20, 0x25	; 37
 2cc:	43 43       	sbci	r20, 0x33	; 51
 2ce:	4c 4c       	sbci	r20, 0xCC	; 204
 2d0:	55 54       	subi	r21, 0x45	; 69
 2d2:	31 42       	sbci	r19, 0x21	; 33
 2d4:	00 55       	subi	r16, 0x50	; 80
 2d6:	53 45       	sbci	r21, 0x53	; 83
 2d8:	52 43       	sbci	r21, 0x32	; 50
 2da:	43 4c       	sbci	r20, 0xC3	; 195
 2dc:	4c 55       	subi	r20, 0x5C	; 92
 2de:	54 32       	cpi	r21, 0x24	; 36
 2e0:	41 00       	.word	0x0041	; ????
 2e2:	55 53       	subi	r21, 0x35	; 53
 2e4:	45 52       	subi	r20, 0x25	; 37
 2e6:	43 43       	sbci	r20, 0x33	; 51
 2e8:	4c 4c       	sbci	r20, 0xCC	; 204
 2ea:	55 54       	subi	r21, 0x45	; 69
 2ec:	32 42       	sbci	r19, 0x22	; 34
 2ee:	00 55       	subi	r16, 0x50	; 80
 2f0:	53 45       	sbci	r21, 0x53	; 83
 2f2:	52 43       	sbci	r21, 0x32	; 50
 2f4:	43 4c       	sbci	r20, 0xC3	; 195
 2f6:	4c 55       	subi	r20, 0x5C	; 92
 2f8:	54 33       	cpi	r21, 0x34	; 52
 2fa:	41 00       	.word	0x0041	; ????
 2fc:	55 53       	subi	r21, 0x35	; 53
 2fe:	45 52       	subi	r20, 0x25	; 37
 300:	43 43       	sbci	r20, 0x33	; 51
 302:	4c 4c       	sbci	r20, 0xCC	; 204
 304:	55 54       	subi	r21, 0x45	; 69
 306:	33 42       	sbci	r19, 0x23	; 35
 308:	00 55       	subi	r16, 0x50	; 80
 30a:	53 45       	sbci	r21, 0x53	; 83
 30c:	52 45       	sbci	r21, 0x52	; 82
 30e:	56 4f       	sbci	r21, 0xF6	; 246
 310:	55 54       	subi	r21, 0x45	; 69
 312:	41 00       	.word	0x0041	; ????
 314:	55 53       	subi	r21, 0x35	; 53
 316:	45 52       	subi	r20, 0x25	; 37
 318:	45 56       	subi	r20, 0x65	; 101
 31a:	4f 55       	subi	r20, 0x5F	; 95
 31c:	54 42       	sbci	r21, 0x24	; 36
 31e:	00 55       	subi	r16, 0x50	; 80
 320:	53 45       	sbci	r21, 0x53	; 83
 322:	52 45       	sbci	r21, 0x52	; 82
 324:	56 4f       	sbci	r21, 0xF6	; 246
 326:	55 54       	subi	r21, 0x45	; 69
 328:	43 00       	.word	0x0043	; ????
 32a:	55 53       	subi	r21, 0x35	; 53
 32c:	45 52       	subi	r20, 0x25	; 37
 32e:	45 56       	subi	r20, 0x65	; 101
 330:	4f 55       	subi	r20, 0x5F	; 95
 332:	54 44       	sbci	r21, 0x44	; 68
 334:	00 55       	subi	r16, 0x50	; 80
 336:	53 45       	sbci	r21, 0x53	; 83
 338:	52 45       	sbci	r21, 0x52	; 82
 33a:	56 4f       	sbci	r21, 0xF6	; 246
 33c:	55 54       	subi	r21, 0x45	; 69
 33e:	45 00       	.word	0x0045	; ????
 340:	55 53       	subi	r21, 0x35	; 53
 342:	45 52       	subi	r20, 0x25	; 37
 344:	45 56       	subi	r20, 0x65	; 101
 346:	4f 55       	subi	r20, 0x5F	; 95
 348:	54 46       	sbci	r21, 0x64	; 100
 34a:	00 55       	subi	r16, 0x50	; 80
 34c:	53 45       	sbci	r21, 0x53	; 83
 34e:	52 54       	subi	r21, 0x42	; 66
 350:	43 41       	sbci	r20, 0x13	; 19
 352:	30 00       	.word	0x0030	; ????
 354:	55 53       	subi	r21, 0x35	; 53
 356:	45 52       	subi	r20, 0x25	; 37
 358:	54 43       	sbci	r21, 0x34	; 52
 35a:	42 30       	cpi	r20, 0x02	; 2
 35c:	00 55       	subi	r16, 0x50	; 80
 35e:	53 45       	sbci	r21, 0x53	; 83
 360:	52 54       	subi	r21, 0x42	; 66
 362:	43 42       	sbci	r20, 0x23	; 35
 364:	31 00       	.word	0x0031	; ????
 366:	55 53       	subi	r21, 0x35	; 53
 368:	45 52       	subi	r20, 0x25	; 37
 36a:	54 43       	sbci	r21, 0x34	; 52
 36c:	42 32       	cpi	r20, 0x22	; 34
 36e:	00 55       	subi	r16, 0x50	; 80
 370:	53 45       	sbci	r21, 0x53	; 83
 372:	52 54       	subi	r21, 0x42	; 66
 374:	43 42       	sbci	r20, 0x23	; 35
 376:	33 00       	.word	0x0033	; ????
 378:	55 53       	subi	r21, 0x35	; 53
 37a:	45 52       	subi	r20, 0x25	; 37
 37c:	55 53       	subi	r21, 0x35	; 53
 37e:	41 52       	subi	r20, 0x21	; 33
 380:	54 30       	cpi	r21, 0x04	; 4
 382:	00 55       	subi	r16, 0x50	; 80
 384:	53 45       	sbci	r21, 0x53	; 83
 386:	52 55       	subi	r21, 0x52	; 82
 388:	53 41       	sbci	r21, 0x13	; 19
 38a:	52 54       	subi	r21, 0x42	; 66
 38c:	31 00       	.word	0x0031	; ????
 38e:	55 53       	subi	r21, 0x35	; 53
 390:	45 52       	subi	r20, 0x25	; 37
 392:	55 53       	subi	r21, 0x35	; 53
 394:	41 52       	subi	r20, 0x21	; 33
 396:	54 32       	cpi	r21, 0x24	; 36
 398:	00 55       	subi	r16, 0x50	; 80
 39a:	53 45       	sbci	r21, 0x53	; 83
 39c:	52 55       	subi	r21, 0x52	; 82
 39e:	53 41       	sbci	r21, 0x13	; 19
 3a0:	52 54       	subi	r21, 0x42	; 66
 3a2:	33 00       	.word	0x0033	; ????
 3a4:	41 50       	subi	r20, 0x01	; 1
 3a6:	50 45       	sbci	r21, 0x50	; 80
 3a8:	4e 44       	sbci	r20, 0x4E	; 78
 3aa:	00 42       	sbci	r16, 0x20	; 32
 3ac:	4f 44       	sbci	r20, 0x4F	; 79
 3ae:	43 46       	sbci	r20, 0x63	; 99
 3b0:	47 00       	.word	0x0047	; ????
 3b2:	42 4f       	sbci	r20, 0xF2	; 242
 3b4:	4f 54       	subi	r20, 0x4F	; 79
 3b6:	45 4e       	sbci	r20, 0xE5	; 229
 3b8:	44 00       	.word	0x0044	; ????
 3ba:	4f 53       	subi	r20, 0x3F	; 63
 3bc:	43 43       	sbci	r20, 0x33	; 51
 3be:	46 47       	sbci	r20, 0x76	; 118
 3c0:	00 53       	subi	r16, 0x30	; 48
 3c2:	59 53       	subi	r21, 0x39	; 57
 3c4:	43 46       	sbci	r20, 0x63	; 99
 3c6:	47 30       	cpi	r20, 0x07	; 7
 3c8:	00 53       	subi	r16, 0x30	; 48
 3ca:	59 53       	subi	r21, 0x39	; 57
 3cc:	43 46       	sbci	r20, 0x63	; 99
 3ce:	47 31       	cpi	r20, 0x17	; 23
 3d0:	00 57       	subi	r16, 0x70	; 112
 3d2:	44 54       	subi	r20, 0x44	; 68
 3d4:	43 46       	sbci	r20, 0x63	; 99
 3d6:	47 00       	.word	0x0047	; ????
 3d8:	47 50       	subi	r20, 0x07	; 7
 3da:	49 4f       	sbci	r20, 0xF9	; 249
 3dc:	52 30       	cpi	r21, 0x02	; 2
 3de:	00 47       	sbci	r16, 0x70	; 112
 3e0:	50 49       	sbci	r21, 0x90	; 144
 3e2:	4f 52       	subi	r20, 0x2F	; 47
 3e4:	31 00       	.word	0x0031	; ????
 3e6:	47 50       	subi	r20, 0x07	; 7
 3e8:	49 4f       	sbci	r20, 0xF9	; 249
 3ea:	52 32       	cpi	r21, 0x22	; 34
 3ec:	00 47       	sbci	r16, 0x70	; 112
 3ee:	50 49       	sbci	r21, 0x90	; 144
 3f0:	4f 52       	subi	r20, 0x2F	; 47
 3f2:	33 00       	.word	0x0033	; ????
 3f4:	4c 4f       	sbci	r20, 0xFC	; 252
 3f6:	43 4b       	sbci	r20, 0xB3	; 179
 3f8:	42 49       	sbci	r20, 0x92	; 146
 3fa:	54 00       	.word	0x0054	; ????
 3fc:	41 44       	sbci	r20, 0x41	; 65
 3fe:	44 52       	subi	r20, 0x24	; 36
 400:	00 43       	sbci	r16, 0x30	; 48
 402:	54 52       	subi	r21, 0x24	; 36
 404:	4c 41       	sbci	r20, 0x1C	; 28
 406:	00 43       	sbci	r16, 0x30	; 48
 408:	54 52       	subi	r21, 0x24	; 36
 40a:	4c 42       	sbci	r20, 0x2C	; 44
 40c:	00 44       	sbci	r16, 0x40	; 64
 40e:	41 54       	subi	r20, 0x41	; 65
 410:	41 00       	.word	0x0041	; ????
 412:	49 4e       	sbci	r20, 0xE9	; 233
 414:	54 43       	sbci	r21, 0x34	; 52
 416:	54 52       	subi	r21, 0x24	; 36
 418:	4c 00       	.word	0x004c	; ????
 41a:	49 4e       	sbci	r20, 0xE9	; 233
 41c:	54 46       	sbci	r21, 0x64	; 100
 41e:	4c 41       	sbci	r20, 0x1C	; 28
 420:	47 53       	subi	r20, 0x37	; 55
 422:	00 53       	subi	r16, 0x30	; 48
 424:	54 41       	sbci	r21, 0x14	; 20
 426:	54 55       	subi	r21, 0x54	; 84
 428:	53 00       	.word	0x0053	; ????
 42a:	44 49       	sbci	r20, 0x94	; 148
 42c:	52 00       	.word	0x0052	; ????
 42e:	44 49       	sbci	r20, 0x94	; 148
 430:	52 43       	sbci	r21, 0x32	; 50
 432:	4c 52       	subi	r20, 0x2C	; 44
 434:	00 44       	sbci	r16, 0x40	; 64
 436:	49 52       	subi	r20, 0x29	; 41
 438:	53 45       	sbci	r21, 0x53	; 83
 43a:	54 00       	.word	0x0054	; ????
 43c:	44 49       	sbci	r20, 0x94	; 148
 43e:	52 54       	subi	r21, 0x42	; 66
 440:	47 4c       	sbci	r20, 0xC7	; 199
 442:	00 49       	sbci	r16, 0x90	; 144
 444:	4e 00       	.word	0x004e	; ????
 446:	49 4e       	sbci	r20, 0xE9	; 233
 448:	54 46       	sbci	r21, 0x64	; 100
 44a:	4c 41       	sbci	r20, 0x1C	; 28
 44c:	47 53       	subi	r20, 0x37	; 55
 44e:	00 4f       	sbci	r16, 0xF0	; 240
 450:	55 54       	subi	r21, 0x45	; 69
 452:	00 4f       	sbci	r16, 0xF0	; 240
 454:	55 54       	subi	r21, 0x45	; 69
 456:	43 4c       	sbci	r20, 0xC3	; 195
 458:	52 00       	.word	0x0052	; ????
 45a:	4f 55       	subi	r20, 0x5F	; 95
 45c:	54 53       	subi	r21, 0x34	; 52
 45e:	45 54       	subi	r20, 0x45	; 69
 460:	00 4f       	sbci	r16, 0xF0	; 240
 462:	55 54       	subi	r21, 0x45	; 69
 464:	54 47       	sbci	r21, 0x74	; 116
 466:	4c 00       	.word	0x004c	; ????
 468:	50 49       	sbci	r21, 0x90	; 144
 46a:	4e 30       	cpi	r20, 0x0E	; 14
 46c:	43 54       	subi	r20, 0x43	; 67
 46e:	52 4c       	sbci	r21, 0xC2	; 194
 470:	00 50       	subi	r16, 0x00	; 0
 472:	49 4e       	sbci	r20, 0xE9	; 233
 474:	31 43       	sbci	r19, 0x31	; 49
 476:	54 52       	subi	r21, 0x24	; 36
 478:	4c 00       	.word	0x004c	; ????
 47a:	50 49       	sbci	r21, 0x90	; 144
 47c:	4e 32       	cpi	r20, 0x2E	; 46
 47e:	43 54       	subi	r20, 0x43	; 67
 480:	52 4c       	sbci	r21, 0xC2	; 194
 482:	00 50       	subi	r16, 0x00	; 0
 484:	49 4e       	sbci	r20, 0xE9	; 233
 486:	33 43       	sbci	r19, 0x33	; 51
 488:	54 52       	subi	r21, 0x24	; 36
 48a:	4c 00       	.word	0x004c	; ????
 48c:	50 49       	sbci	r21, 0x90	; 144
 48e:	4e 34       	cpi	r20, 0x4E	; 78
 490:	43 54       	subi	r20, 0x43	; 67
 492:	52 4c       	sbci	r21, 0xC2	; 194
 494:	00 50       	subi	r16, 0x00	; 0
 496:	49 4e       	sbci	r20, 0xE9	; 233
 498:	35 43       	sbci	r19, 0x35	; 53
 49a:	54 52       	subi	r21, 0x24	; 36
 49c:	4c 00       	.word	0x004c	; ????
 49e:	50 49       	sbci	r21, 0x90	; 144
 4a0:	4e 36       	cpi	r20, 0x6E	; 110
 4a2:	43 54       	subi	r20, 0x43	; 67
 4a4:	52 4c       	sbci	r21, 0xC2	; 194
 4a6:	00 50       	subi	r16, 0x00	; 0
 4a8:	49 4e       	sbci	r20, 0xE9	; 233
 4aa:	37 43       	sbci	r19, 0x37	; 55
 4ac:	54 52       	subi	r21, 0x24	; 36
 4ae:	4c 00       	.word	0x004c	; ????
 4b0:	50 4f       	sbci	r21, 0xF0	; 240
 4b2:	52 54       	subi	r21, 0x42	; 66
 4b4:	43 54       	subi	r20, 0x43	; 67
 4b6:	52 4c       	sbci	r21, 0xC2	; 194
 4b8:	00 44       	sbci	r16, 0x40	; 64
 4ba:	49 52       	subi	r20, 0x29	; 41
 4bc:	00 44       	sbci	r16, 0x40	; 64
 4be:	49 52       	subi	r20, 0x29	; 41
 4c0:	43 4c       	sbci	r20, 0xC3	; 195
 4c2:	52 00       	.word	0x0052	; ????
 4c4:	44 49       	sbci	r20, 0x94	; 148
 4c6:	52 53       	subi	r21, 0x32	; 50
 4c8:	45 54       	subi	r20, 0x45	; 69
 4ca:	00 44       	sbci	r16, 0x40	; 64
 4cc:	49 52       	subi	r20, 0x29	; 41
 4ce:	54 47       	sbci	r21, 0x74	; 116
 4d0:	4c 00       	.word	0x004c	; ????
 4d2:	49 4e       	sbci	r20, 0xE9	; 233
 4d4:	00 49       	sbci	r16, 0x90	; 144
 4d6:	4e 54       	subi	r20, 0x4E	; 78
 4d8:	46 4c       	sbci	r20, 0xC6	; 198
 4da:	41 47       	sbci	r20, 0x71	; 113
 4dc:	53 00       	.word	0x0053	; ????
 4de:	4f 55       	subi	r20, 0x5F	; 95
 4e0:	54 00       	.word	0x0054	; ????
 4e2:	4f 55       	subi	r20, 0x5F	; 95
 4e4:	54 43       	sbci	r21, 0x34	; 52
 4e6:	4c 52       	subi	r20, 0x2C	; 44
 4e8:	00 4f       	sbci	r16, 0xF0	; 240
 4ea:	55 54       	subi	r21, 0x45	; 69
 4ec:	53 45       	sbci	r21, 0x53	; 83
 4ee:	54 00       	.word	0x0054	; ????
 4f0:	4f 55       	subi	r20, 0x5F	; 95
 4f2:	54 54       	subi	r21, 0x44	; 68
 4f4:	47 4c       	sbci	r20, 0xC7	; 199
 4f6:	00 50       	subi	r16, 0x00	; 0
 4f8:	49 4e       	sbci	r20, 0xE9	; 233
 4fa:	30 43       	sbci	r19, 0x30	; 48
 4fc:	54 52       	subi	r21, 0x24	; 36
 4fe:	4c 00       	.word	0x004c	; ????
 500:	50 49       	sbci	r21, 0x90	; 144
 502:	4e 31       	cpi	r20, 0x1E	; 30
 504:	43 54       	subi	r20, 0x43	; 67
 506:	52 4c       	sbci	r21, 0xC2	; 194
 508:	00 50       	subi	r16, 0x00	; 0
 50a:	49 4e       	sbci	r20, 0xE9	; 233
 50c:	32 43       	sbci	r19, 0x32	; 50
 50e:	54 52       	subi	r21, 0x24	; 36
 510:	4c 00       	.word	0x004c	; ????
 512:	50 49       	sbci	r21, 0x90	; 144
 514:	4e 33       	cpi	r20, 0x3E	; 62
 516:	43 54       	subi	r20, 0x43	; 67
 518:	52 4c       	sbci	r21, 0xC2	; 194
 51a:	00 50       	subi	r16, 0x00	; 0
 51c:	49 4e       	sbci	r20, 0xE9	; 233
 51e:	34 43       	sbci	r19, 0x34	; 52
 520:	54 52       	subi	r21, 0x24	; 36
 522:	4c 00       	.word	0x004c	; ????
 524:	50 49       	sbci	r21, 0x90	; 144
 526:	4e 35       	cpi	r20, 0x5E	; 94
 528:	43 54       	subi	r20, 0x43	; 67
 52a:	52 4c       	sbci	r21, 0xC2	; 194
 52c:	00 50       	subi	r16, 0x00	; 0
 52e:	49 4e       	sbci	r20, 0xE9	; 233
 530:	36 43       	sbci	r19, 0x36	; 54
 532:	54 52       	subi	r21, 0x24	; 36
 534:	4c 00       	.word	0x004c	; ????
 536:	50 49       	sbci	r21, 0x90	; 144
 538:	4e 37       	cpi	r20, 0x7E	; 126
 53a:	43 54       	subi	r20, 0x43	; 67
 53c:	52 4c       	sbci	r21, 0xC2	; 194
 53e:	00 50       	subi	r16, 0x00	; 0
 540:	4f 52       	subi	r20, 0x2F	; 47
 542:	54 43       	sbci	r21, 0x34	; 52
 544:	54 52       	subi	r21, 0x24	; 36
 546:	4c 00       	.word	0x004c	; ????
 548:	44 49       	sbci	r20, 0x94	; 148
 54a:	52 00       	.word	0x0052	; ????
 54c:	44 49       	sbci	r20, 0x94	; 148
 54e:	52 43       	sbci	r21, 0x32	; 50
 550:	4c 52       	subi	r20, 0x2C	; 44
 552:	00 44       	sbci	r16, 0x40	; 64
 554:	49 52       	subi	r20, 0x29	; 41
 556:	53 45       	sbci	r21, 0x53	; 83
 558:	54 00       	.word	0x0054	; ????
 55a:	44 49       	sbci	r20, 0x94	; 148
 55c:	52 54       	subi	r21, 0x42	; 66
 55e:	47 4c       	sbci	r20, 0xC7	; 199
 560:	00 49       	sbci	r16, 0x90	; 144
 562:	4e 00       	.word	0x004e	; ????
 564:	49 4e       	sbci	r20, 0xE9	; 233
 566:	54 46       	sbci	r21, 0x64	; 100
 568:	4c 41       	sbci	r20, 0x1C	; 28
 56a:	47 53       	subi	r20, 0x37	; 55
 56c:	00 4f       	sbci	r16, 0xF0	; 240
 56e:	55 54       	subi	r21, 0x45	; 69
 570:	00 4f       	sbci	r16, 0xF0	; 240
 572:	55 54       	subi	r21, 0x45	; 69
 574:	43 4c       	sbci	r20, 0xC3	; 195
 576:	52 00       	.word	0x0052	; ????
 578:	4f 55       	subi	r20, 0x5F	; 95
 57a:	54 53       	subi	r21, 0x34	; 52
 57c:	45 54       	subi	r20, 0x45	; 69
 57e:	00 4f       	sbci	r16, 0xF0	; 240
 580:	55 54       	subi	r21, 0x45	; 69
 582:	54 47       	sbci	r21, 0x74	; 116
 584:	4c 00       	.word	0x004c	; ????
 586:	50 49       	sbci	r21, 0x90	; 144
 588:	4e 30       	cpi	r20, 0x0E	; 14
 58a:	43 54       	subi	r20, 0x43	; 67
 58c:	52 4c       	sbci	r21, 0xC2	; 194
 58e:	00 50       	subi	r16, 0x00	; 0
 590:	49 4e       	sbci	r20, 0xE9	; 233
 592:	31 43       	sbci	r19, 0x31	; 49
 594:	54 52       	subi	r21, 0x24	; 36
 596:	4c 00       	.word	0x004c	; ????
 598:	50 49       	sbci	r21, 0x90	; 144
 59a:	4e 32       	cpi	r20, 0x2E	; 46
 59c:	43 54       	subi	r20, 0x43	; 67
 59e:	52 4c       	sbci	r21, 0xC2	; 194
 5a0:	00 50       	subi	r16, 0x00	; 0
 5a2:	49 4e       	sbci	r20, 0xE9	; 233
 5a4:	33 43       	sbci	r19, 0x33	; 51
 5a6:	54 52       	subi	r21, 0x24	; 36
 5a8:	4c 00       	.word	0x004c	; ????
 5aa:	50 49       	sbci	r21, 0x90	; 144
 5ac:	4e 34       	cpi	r20, 0x4E	; 78
 5ae:	43 54       	subi	r20, 0x43	; 67
 5b0:	52 4c       	sbci	r21, 0xC2	; 194
 5b2:	00 50       	subi	r16, 0x00	; 0
 5b4:	49 4e       	sbci	r20, 0xE9	; 233
 5b6:	35 43       	sbci	r19, 0x35	; 53
 5b8:	54 52       	subi	r21, 0x24	; 36
 5ba:	4c 00       	.word	0x004c	; ????
 5bc:	50 49       	sbci	r21, 0x90	; 144
 5be:	4e 36       	cpi	r20, 0x6E	; 110
 5c0:	43 54       	subi	r20, 0x43	; 67
 5c2:	52 4c       	sbci	r21, 0xC2	; 194
 5c4:	00 50       	subi	r16, 0x00	; 0
 5c6:	49 4e       	sbci	r20, 0xE9	; 233
 5c8:	37 43       	sbci	r19, 0x37	; 55
 5ca:	54 52       	subi	r21, 0x24	; 36
 5cc:	4c 00       	.word	0x004c	; ????
 5ce:	50 4f       	sbci	r21, 0xF0	; 240
 5d0:	52 54       	subi	r21, 0x42	; 66
 5d2:	43 54       	subi	r20, 0x43	; 67
 5d4:	52 4c       	sbci	r21, 0xC2	; 194
 5d6:	00 44       	sbci	r16, 0x40	; 64
 5d8:	49 52       	subi	r20, 0x29	; 41
 5da:	00 44       	sbci	r16, 0x40	; 64
 5dc:	49 52       	subi	r20, 0x29	; 41
 5de:	43 4c       	sbci	r20, 0xC3	; 195
 5e0:	52 00       	.word	0x0052	; ????
 5e2:	44 49       	sbci	r20, 0x94	; 148
 5e4:	52 53       	subi	r21, 0x32	; 50
 5e6:	45 54       	subi	r20, 0x45	; 69
 5e8:	00 44       	sbci	r16, 0x40	; 64
 5ea:	49 52       	subi	r20, 0x29	; 41
 5ec:	54 47       	sbci	r21, 0x74	; 116
 5ee:	4c 00       	.word	0x004c	; ????
 5f0:	49 4e       	sbci	r20, 0xE9	; 233
 5f2:	00 49       	sbci	r16, 0x90	; 144
 5f4:	4e 54       	subi	r20, 0x4E	; 78
 5f6:	46 4c       	sbci	r20, 0xC6	; 198
 5f8:	41 47       	sbci	r20, 0x71	; 113
 5fa:	53 00       	.word	0x0053	; ????
 5fc:	4f 55       	subi	r20, 0x5F	; 95
 5fe:	54 00       	.word	0x0054	; ????
 600:	4f 55       	subi	r20, 0x5F	; 95
 602:	54 43       	sbci	r21, 0x34	; 52
 604:	4c 52       	subi	r20, 0x2C	; 44
 606:	00 4f       	sbci	r16, 0xF0	; 240
 608:	55 54       	subi	r21, 0x45	; 69
 60a:	53 45       	sbci	r21, 0x53	; 83
 60c:	54 00       	.word	0x0054	; ????
 60e:	4f 55       	subi	r20, 0x5F	; 95
 610:	54 54       	subi	r21, 0x44	; 68
 612:	47 4c       	sbci	r20, 0xC7	; 199
 614:	00 50       	subi	r16, 0x00	; 0
 616:	49 4e       	sbci	r20, 0xE9	; 233
 618:	30 43       	sbci	r19, 0x30	; 48
 61a:	54 52       	subi	r21, 0x24	; 36
 61c:	4c 00       	.word	0x004c	; ????
 61e:	50 49       	sbci	r21, 0x90	; 144
 620:	4e 31       	cpi	r20, 0x1E	; 30
 622:	43 54       	subi	r20, 0x43	; 67
 624:	52 4c       	sbci	r21, 0xC2	; 194
 626:	00 50       	subi	r16, 0x00	; 0
 628:	49 4e       	sbci	r20, 0xE9	; 233
 62a:	32 43       	sbci	r19, 0x32	; 50
 62c:	54 52       	subi	r21, 0x24	; 36
 62e:	4c 00       	.word	0x004c	; ????
 630:	50 49       	sbci	r21, 0x90	; 144
 632:	4e 33       	cpi	r20, 0x3E	; 62
 634:	43 54       	subi	r20, 0x43	; 67
 636:	52 4c       	sbci	r21, 0xC2	; 194
 638:	00 50       	subi	r16, 0x00	; 0
 63a:	49 4e       	sbci	r20, 0xE9	; 233
 63c:	34 43       	sbci	r19, 0x34	; 52
 63e:	54 52       	subi	r21, 0x24	; 36
 640:	4c 00       	.word	0x004c	; ????
 642:	50 49       	sbci	r21, 0x90	; 144
 644:	4e 35       	cpi	r20, 0x5E	; 94
 646:	43 54       	subi	r20, 0x43	; 67
 648:	52 4c       	sbci	r21, 0xC2	; 194
 64a:	00 50       	subi	r16, 0x00	; 0
 64c:	49 4e       	sbci	r20, 0xE9	; 233
 64e:	36 43       	sbci	r19, 0x36	; 54
 650:	54 52       	subi	r21, 0x24	; 36
 652:	4c 00       	.word	0x004c	; ????
 654:	50 49       	sbci	r21, 0x90	; 144
 656:	4e 37       	cpi	r20, 0x7E	; 126
 658:	43 54       	subi	r20, 0x43	; 67
 65a:	52 4c       	sbci	r21, 0xC2	; 194
 65c:	00 50       	subi	r16, 0x00	; 0
 65e:	4f 52       	subi	r20, 0x2F	; 47
 660:	54 43       	sbci	r21, 0x34	; 52
 662:	54 52       	subi	r21, 0x24	; 36
 664:	4c 00       	.word	0x004c	; ????
 666:	44 49       	sbci	r20, 0x94	; 148
 668:	52 00       	.word	0x0052	; ????
 66a:	44 49       	sbci	r20, 0x94	; 148
 66c:	52 43       	sbci	r21, 0x32	; 50
 66e:	4c 52       	subi	r20, 0x2C	; 44
 670:	00 44       	sbci	r16, 0x40	; 64
 672:	49 52       	subi	r20, 0x29	; 41
 674:	53 45       	sbci	r21, 0x53	; 83
 676:	54 00       	.word	0x0054	; ????
 678:	44 49       	sbci	r20, 0x94	; 148
 67a:	52 54       	subi	r21, 0x42	; 66
 67c:	47 4c       	sbci	r20, 0xC7	; 199
 67e:	00 49       	sbci	r16, 0x90	; 144
 680:	4e 00       	.word	0x004e	; ????
 682:	49 4e       	sbci	r20, 0xE9	; 233
 684:	54 46       	sbci	r21, 0x64	; 100
 686:	4c 41       	sbci	r20, 0x1C	; 28
 688:	47 53       	subi	r20, 0x37	; 55
 68a:	00 4f       	sbci	r16, 0xF0	; 240
 68c:	55 54       	subi	r21, 0x45	; 69
 68e:	00 4f       	sbci	r16, 0xF0	; 240
 690:	55 54       	subi	r21, 0x45	; 69
 692:	43 4c       	sbci	r20, 0xC3	; 195
 694:	52 00       	.word	0x0052	; ????
 696:	4f 55       	subi	r20, 0x5F	; 95
 698:	54 53       	subi	r21, 0x34	; 52
 69a:	45 54       	subi	r20, 0x45	; 69
 69c:	00 4f       	sbci	r16, 0xF0	; 240
 69e:	55 54       	subi	r21, 0x45	; 69
 6a0:	54 47       	sbci	r21, 0x74	; 116
 6a2:	4c 00       	.word	0x004c	; ????
 6a4:	50 49       	sbci	r21, 0x90	; 144
 6a6:	4e 30       	cpi	r20, 0x0E	; 14
 6a8:	43 54       	subi	r20, 0x43	; 67
 6aa:	52 4c       	sbci	r21, 0xC2	; 194
 6ac:	00 50       	subi	r16, 0x00	; 0
 6ae:	49 4e       	sbci	r20, 0xE9	; 233
 6b0:	31 43       	sbci	r19, 0x31	; 49
 6b2:	54 52       	subi	r21, 0x24	; 36
 6b4:	4c 00       	.word	0x004c	; ????
 6b6:	50 49       	sbci	r21, 0x90	; 144
 6b8:	4e 32       	cpi	r20, 0x2E	; 46
 6ba:	43 54       	subi	r20, 0x43	; 67
 6bc:	52 4c       	sbci	r21, 0xC2	; 194
 6be:	00 50       	subi	r16, 0x00	; 0
 6c0:	49 4e       	sbci	r20, 0xE9	; 233
 6c2:	33 43       	sbci	r19, 0x33	; 51
 6c4:	54 52       	subi	r21, 0x24	; 36
 6c6:	4c 00       	.word	0x004c	; ????
 6c8:	50 49       	sbci	r21, 0x90	; 144
 6ca:	4e 34       	cpi	r20, 0x4E	; 78
 6cc:	43 54       	subi	r20, 0x43	; 67
 6ce:	52 4c       	sbci	r21, 0xC2	; 194
 6d0:	00 50       	subi	r16, 0x00	; 0
 6d2:	49 4e       	sbci	r20, 0xE9	; 233
 6d4:	35 43       	sbci	r19, 0x35	; 53
 6d6:	54 52       	subi	r21, 0x24	; 36
 6d8:	4c 00       	.word	0x004c	; ????
 6da:	50 49       	sbci	r21, 0x90	; 144
 6dc:	4e 36       	cpi	r20, 0x6E	; 110
 6de:	43 54       	subi	r20, 0x43	; 67
 6e0:	52 4c       	sbci	r21, 0xC2	; 194
 6e2:	00 50       	subi	r16, 0x00	; 0
 6e4:	49 4e       	sbci	r20, 0xE9	; 233
 6e6:	37 43       	sbci	r19, 0x37	; 55
 6e8:	54 52       	subi	r21, 0x24	; 36
 6ea:	4c 00       	.word	0x004c	; ????
 6ec:	50 4f       	sbci	r21, 0xF0	; 240
 6ee:	52 54       	subi	r21, 0x42	; 66
 6f0:	43 54       	subi	r20, 0x43	; 67
 6f2:	52 4c       	sbci	r21, 0xC2	; 194
 6f4:	00 44       	sbci	r16, 0x40	; 64
 6f6:	49 52       	subi	r20, 0x29	; 41
 6f8:	00 44       	sbci	r16, 0x40	; 64
 6fa:	49 52       	subi	r20, 0x29	; 41
 6fc:	43 4c       	sbci	r20, 0xC3	; 195
 6fe:	52 00       	.word	0x0052	; ????
 700:	44 49       	sbci	r20, 0x94	; 148
 702:	52 53       	subi	r21, 0x32	; 50
 704:	45 54       	subi	r20, 0x45	; 69
 706:	00 44       	sbci	r16, 0x40	; 64
 708:	49 52       	subi	r20, 0x29	; 41
 70a:	54 47       	sbci	r21, 0x74	; 116
 70c:	4c 00       	.word	0x004c	; ????
 70e:	49 4e       	sbci	r20, 0xE9	; 233
 710:	00 49       	sbci	r16, 0x90	; 144
 712:	4e 54       	subi	r20, 0x4E	; 78
 714:	46 4c       	sbci	r20, 0xC6	; 198
 716:	41 47       	sbci	r20, 0x71	; 113
 718:	53 00       	.word	0x0053	; ????
 71a:	4f 55       	subi	r20, 0x5F	; 95
 71c:	54 00       	.word	0x0054	; ????
 71e:	4f 55       	subi	r20, 0x5F	; 95
 720:	54 43       	sbci	r21, 0x34	; 52
 722:	4c 52       	subi	r20, 0x2C	; 44
 724:	00 4f       	sbci	r16, 0xF0	; 240
 726:	55 54       	subi	r21, 0x45	; 69
 728:	53 45       	sbci	r21, 0x53	; 83
 72a:	54 00       	.word	0x0054	; ????
 72c:	4f 55       	subi	r20, 0x5F	; 95
 72e:	54 54       	subi	r21, 0x44	; 68
 730:	47 4c       	sbci	r20, 0xC7	; 199
 732:	00 50       	subi	r16, 0x00	; 0
 734:	49 4e       	sbci	r20, 0xE9	; 233
 736:	30 43       	sbci	r19, 0x30	; 48
 738:	54 52       	subi	r21, 0x24	; 36
 73a:	4c 00       	.word	0x004c	; ????
 73c:	50 49       	sbci	r21, 0x90	; 144
 73e:	4e 31       	cpi	r20, 0x1E	; 30
 740:	43 54       	subi	r20, 0x43	; 67
 742:	52 4c       	sbci	r21, 0xC2	; 194
 744:	00 50       	subi	r16, 0x00	; 0
 746:	49 4e       	sbci	r20, 0xE9	; 233
 748:	32 43       	sbci	r19, 0x32	; 50
 74a:	54 52       	subi	r21, 0x24	; 36
 74c:	4c 00       	.word	0x004c	; ????
 74e:	50 49       	sbci	r21, 0x90	; 144
 750:	4e 33       	cpi	r20, 0x3E	; 62
 752:	43 54       	subi	r20, 0x43	; 67
 754:	52 4c       	sbci	r21, 0xC2	; 194
 756:	00 50       	subi	r16, 0x00	; 0
 758:	49 4e       	sbci	r20, 0xE9	; 233
 75a:	34 43       	sbci	r19, 0x34	; 52
 75c:	54 52       	subi	r21, 0x24	; 36
 75e:	4c 00       	.word	0x004c	; ????
 760:	50 49       	sbci	r21, 0x90	; 144
 762:	4e 35       	cpi	r20, 0x5E	; 94
 764:	43 54       	subi	r20, 0x43	; 67
 766:	52 4c       	sbci	r21, 0xC2	; 194
 768:	00 50       	subi	r16, 0x00	; 0
 76a:	49 4e       	sbci	r20, 0xE9	; 233
 76c:	36 43       	sbci	r19, 0x36	; 54
 76e:	54 52       	subi	r21, 0x24	; 36
 770:	4c 00       	.word	0x004c	; ????
 772:	50 49       	sbci	r21, 0x90	; 144
 774:	4e 37       	cpi	r20, 0x7E	; 126
 776:	43 54       	subi	r20, 0x43	; 67
 778:	52 4c       	sbci	r21, 0xC2	; 194
 77a:	00 50       	subi	r16, 0x00	; 0
 77c:	4f 52       	subi	r20, 0x2F	; 47
 77e:	54 43       	sbci	r21, 0x34	; 52
 780:	54 52       	subi	r21, 0x24	; 36
 782:	4c 00       	.word	0x004c	; ????
 784:	43 43       	sbci	r20, 0x33	; 51
 786:	4c 52       	subi	r20, 0x2C	; 44
 788:	4f 55       	subi	r20, 0x5F	; 95
 78a:	54 45       	sbci	r21, 0x54	; 84
 78c:	41 00       	.word	0x0041	; ????
 78e:	45 56       	subi	r20, 0x65	; 101
 790:	53 59       	subi	r21, 0x93	; 147
 792:	53 52       	subi	r21, 0x23	; 35
 794:	4f 55       	subi	r20, 0x5F	; 95
 796:	54 45       	sbci	r21, 0x54	; 84
 798:	41 00       	.word	0x0041	; ????
 79a:	54 43       	sbci	r21, 0x34	; 52
 79c:	41 52       	subi	r20, 0x21	; 33
 79e:	4f 55       	subi	r20, 0x5F	; 95
 7a0:	54 45       	sbci	r21, 0x54	; 84
 7a2:	41 00       	.word	0x0041	; ????
 7a4:	54 43       	sbci	r21, 0x34	; 52
 7a6:	42 52       	subi	r20, 0x22	; 34
 7a8:	4f 55       	subi	r20, 0x5F	; 95
 7aa:	54 45       	sbci	r21, 0x54	; 84
 7ac:	41 00       	.word	0x0041	; ????
 7ae:	54 57       	subi	r21, 0x74	; 116
 7b0:	49 53       	subi	r20, 0x39	; 57
 7b2:	50 49       	sbci	r21, 0x90	; 144
 7b4:	52 4f       	sbci	r21, 0xF2	; 242
 7b6:	55 54       	subi	r21, 0x45	; 69
 7b8:	45 41       	sbci	r20, 0x15	; 21
 7ba:	00 55       	subi	r16, 0x50	; 80
 7bc:	53 41       	sbci	r21, 0x13	; 19
 7be:	52 54       	subi	r21, 0x42	; 66
 7c0:	52 4f       	sbci	r21, 0xF2	; 242
 7c2:	55 54       	subi	r21, 0x45	; 69
 7c4:	45 41       	sbci	r20, 0x15	; 21
 7c6:	00 52       	subi	r16, 0x20	; 32
 7c8:	53 54       	subi	r21, 0x43	; 67
 7ca:	46 52       	subi	r20, 0x26	; 38
 7cc:	00 53       	subi	r16, 0x30	; 48
 7ce:	57 52       	subi	r21, 0x27	; 39
 7d0:	52 00       	.word	0x0052	; ????
 7d2:	43 41       	sbci	r20, 0x13	; 19
 7d4:	4c 49       	sbci	r20, 0x9C	; 156
 7d6:	42 00       	.word	0x0042	; ????
 7d8:	43 4c       	sbci	r20, 0xC3	; 195
 7da:	4b 53       	subi	r20, 0x3B	; 59
 7dc:	45 4c       	sbci	r20, 0xC5	; 197
 7de:	00 43       	sbci	r16, 0x30	; 48
 7e0:	4d 50       	subi	r20, 0x0D	; 13
 7e2:	00 43       	sbci	r16, 0x30	; 48
 7e4:	4e 54       	subi	r20, 0x4E	; 78
 7e6:	00 43       	sbci	r16, 0x30	; 48
 7e8:	54 52       	subi	r21, 0x24	; 36
 7ea:	4c 41       	sbci	r20, 0x1C	; 28
 7ec:	00 44       	sbci	r16, 0x40	; 64
 7ee:	42 47       	sbci	r20, 0x72	; 114
 7f0:	43 54       	subi	r20, 0x43	; 67
 7f2:	52 4c       	sbci	r21, 0xC2	; 194
 7f4:	00 49       	sbci	r16, 0x90	; 144
 7f6:	4e 54       	subi	r20, 0x4E	; 78
 7f8:	43 54       	subi	r20, 0x43	; 67
 7fa:	52 4c       	sbci	r21, 0xC2	; 194
 7fc:	00 49       	sbci	r16, 0x90	; 144
 7fe:	4e 54       	subi	r20, 0x4E	; 78
 800:	46 4c       	sbci	r20, 0xC6	; 198
 802:	41 47       	sbci	r20, 0x71	; 113
 804:	53 00       	.word	0x0053	; ????
 806:	50 45       	sbci	r21, 0x50	; 80
 808:	52 00       	.word	0x0052	; ????
 80a:	50 49       	sbci	r21, 0x90	; 144
 80c:	54 43       	sbci	r21, 0x34	; 52
 80e:	54 52       	subi	r21, 0x24	; 36
 810:	4c 41       	sbci	r20, 0x1C	; 28
 812:	00 50       	subi	r16, 0x00	; 0
 814:	49 54       	subi	r20, 0x49	; 73
 816:	44 42       	sbci	r20, 0x24	; 36
 818:	47 43       	sbci	r20, 0x37	; 55
 81a:	54 52       	subi	r21, 0x24	; 36
 81c:	4c 00       	.word	0x004c	; ????
 81e:	50 49       	sbci	r21, 0x90	; 144
 820:	54 49       	sbci	r21, 0x94	; 148
 822:	4e 54       	subi	r20, 0x4E	; 78
 824:	43 54       	subi	r20, 0x43	; 67
 826:	52 4c       	sbci	r21, 0xC2	; 194
 828:	00 50       	subi	r16, 0x00	; 0
 82a:	49 54       	subi	r20, 0x49	; 73
 82c:	49 4e       	sbci	r20, 0xE9	; 233
 82e:	54 46       	sbci	r21, 0x64	; 100
 830:	4c 41       	sbci	r20, 0x1C	; 28
 832:	47 53       	subi	r20, 0x37	; 55
 834:	00 50       	subi	r16, 0x00	; 0
 836:	49 54       	subi	r20, 0x49	; 73
 838:	53 54       	subi	r21, 0x43	; 67
 83a:	41 54       	subi	r20, 0x41	; 65
 83c:	55 53       	subi	r21, 0x35	; 53
 83e:	00 53       	subi	r16, 0x30	; 48
 840:	54 41       	sbci	r21, 0x14	; 20
 842:	54 55       	subi	r21, 0x54	; 84
 844:	53 00       	.word	0x0053	; ????
 846:	54 45       	sbci	r21, 0x54	; 84
 848:	4d 50       	subi	r20, 0x0D	; 13
 84a:	00 43       	sbci	r16, 0x30	; 48
 84c:	48 45       	sbci	r20, 0x58	; 88
 84e:	43 4b       	sbci	r20, 0xB3	; 179
 850:	53 55       	subi	r21, 0x53	; 83
 852:	4d 31       	cpi	r20, 0x1D	; 29
 854:	00 44       	sbci	r16, 0x40	; 64
 856:	45 56       	subi	r20, 0x65	; 101
 858:	49 43       	sbci	r20, 0x39	; 57
 85a:	45 49       	sbci	r20, 0x95	; 149
 85c:	44 30       	cpi	r20, 0x04	; 4
 85e:	00 44       	sbci	r16, 0x40	; 64
 860:	45 56       	subi	r20, 0x65	; 101
 862:	49 43       	sbci	r20, 0x39	; 57
 864:	45 49       	sbci	r20, 0x95	; 149
 866:	44 31       	cpi	r20, 0x14	; 20
 868:	00 44       	sbci	r16, 0x40	; 64
 86a:	45 56       	subi	r20, 0x65	; 101
 86c:	49 43       	sbci	r20, 0x39	; 57
 86e:	45 49       	sbci	r20, 0x95	; 149
 870:	44 32       	cpi	r20, 0x24	; 36
 872:	00 4f       	sbci	r16, 0xF0	; 240
 874:	53 43       	sbci	r21, 0x33	; 51
 876:	43 41       	sbci	r20, 0x13	; 19
 878:	4c 31       	cpi	r20, 0x1C	; 28
 87a:	36 4d       	sbci	r19, 0xD6	; 214
 87c:	30 00       	.word	0x0030	; ????
 87e:	4f 53       	subi	r20, 0x3F	; 63
 880:	43 43       	sbci	r20, 0x33	; 51
 882:	41 4c       	sbci	r20, 0xC1	; 193
 884:	31 36       	cpi	r19, 0x61	; 97
 886:	4d 31       	cpi	r20, 0x1D	; 29
 888:	00 4f       	sbci	r16, 0xF0	; 240
 88a:	53 43       	sbci	r21, 0x33	; 51
 88c:	43 41       	sbci	r20, 0x13	; 19
 88e:	4c 32       	cpi	r20, 0x2C	; 44
 890:	30 4d       	sbci	r19, 0xD0	; 208
 892:	30 00       	.word	0x0030	; ????
 894:	4f 53       	subi	r20, 0x3F	; 63
 896:	43 43       	sbci	r20, 0x33	; 51
 898:	41 4c       	sbci	r20, 0xC1	; 193
 89a:	32 30       	cpi	r19, 0x02	; 2
 89c:	4d 31       	cpi	r20, 0x1D	; 29
 89e:	00 4f       	sbci	r16, 0xF0	; 240
 8a0:	53 43       	sbci	r21, 0x33	; 51
 8a2:	43 41       	sbci	r20, 0x13	; 19
 8a4:	4c 33       	cpi	r20, 0x3C	; 60
 8a6:	32 4b       	sbci	r19, 0xB2	; 178
 8a8:	00 4f       	sbci	r16, 0xF0	; 240
 8aa:	53 43       	sbci	r21, 0x33	; 51
 8ac:	31 36       	cpi	r19, 0x61	; 97
 8ae:	45 52       	subi	r20, 0x25	; 37
 8b0:	52 33       	cpi	r21, 0x32	; 50
 8b2:	56 00       	.word	0x0056	; ????
 8b4:	4f 53       	subi	r20, 0x3F	; 63
 8b6:	43 31       	cpi	r20, 0x13	; 19
 8b8:	36 45       	sbci	r19, 0x56	; 86
 8ba:	52 52       	subi	r21, 0x22	; 34
 8bc:	35 56       	subi	r19, 0x65	; 101
 8be:	00 4f       	sbci	r16, 0xF0	; 240
 8c0:	53 43       	sbci	r21, 0x33	; 51
 8c2:	32 30       	cpi	r19, 0x02	; 2
 8c4:	45 52       	subi	r20, 0x25	; 37
 8c6:	52 33       	cpi	r21, 0x32	; 50
 8c8:	56 00       	.word	0x0056	; ????
 8ca:	4f 53       	subi	r20, 0x3F	; 63
 8cc:	43 32       	cpi	r20, 0x23	; 35
 8ce:	30 45       	sbci	r19, 0x50	; 80
 8d0:	52 52       	subi	r21, 0x22	; 34
 8d2:	35 56       	subi	r19, 0x65	; 101
 8d4:	00 53       	subi	r16, 0x30	; 48
 8d6:	45 52       	subi	r20, 0x25	; 37
 8d8:	4e 55       	subi	r20, 0x5E	; 94
 8da:	4d 30       	cpi	r20, 0x0D	; 13
 8dc:	00 53       	subi	r16, 0x30	; 48
 8de:	45 52       	subi	r20, 0x25	; 37
 8e0:	4e 55       	subi	r20, 0x5E	; 94
 8e2:	4d 31       	cpi	r20, 0x1D	; 29
 8e4:	00 53       	subi	r16, 0x30	; 48
 8e6:	45 52       	subi	r20, 0x25	; 37
 8e8:	4e 55       	subi	r20, 0x5E	; 94
 8ea:	4d 32       	cpi	r20, 0x2D	; 45
 8ec:	00 53       	subi	r16, 0x30	; 48
 8ee:	45 52       	subi	r20, 0x25	; 37
 8f0:	4e 55       	subi	r20, 0x5E	; 94
 8f2:	4d 33       	cpi	r20, 0x3D	; 61
 8f4:	00 53       	subi	r16, 0x30	; 48
 8f6:	45 52       	subi	r20, 0x25	; 37
 8f8:	4e 55       	subi	r20, 0x5E	; 94
 8fa:	4d 34       	cpi	r20, 0x4D	; 77
 8fc:	00 53       	subi	r16, 0x30	; 48
 8fe:	45 52       	subi	r20, 0x25	; 37
 900:	4e 55       	subi	r20, 0x5E	; 94
 902:	4d 35       	cpi	r20, 0x5D	; 93
 904:	00 53       	subi	r16, 0x30	; 48
 906:	45 52       	subi	r20, 0x25	; 37
 908:	4e 55       	subi	r20, 0x5E	; 94
 90a:	4d 36       	cpi	r20, 0x6D	; 109
 90c:	00 53       	subi	r16, 0x30	; 48
 90e:	45 52       	subi	r20, 0x25	; 37
 910:	4e 55       	subi	r20, 0x5E	; 94
 912:	4d 37       	cpi	r20, 0x7D	; 125
 914:	00 53       	subi	r16, 0x30	; 48
 916:	45 52       	subi	r20, 0x25	; 37
 918:	4e 55       	subi	r20, 0x5E	; 94
 91a:	4d 38       	cpi	r20, 0x8D	; 141
 91c:	00 53       	subi	r16, 0x30	; 48
 91e:	45 52       	subi	r20, 0x25	; 37
 920:	4e 55       	subi	r20, 0x5E	; 94
 922:	4d 39       	cpi	r20, 0x9D	; 157
 924:	00 54       	subi	r16, 0x40	; 64
 926:	45 4d       	sbci	r20, 0xD5	; 213
 928:	50 53       	subi	r21, 0x30	; 48
 92a:	45 4e       	sbci	r20, 0xE5	; 229
 92c:	53 45       	sbci	r21, 0x53	; 83
 92e:	30 00       	.word	0x0030	; ????
 930:	54 45       	sbci	r21, 0x54	; 84
 932:	4d 50       	subi	r20, 0x0D	; 13
 934:	53 45       	sbci	r21, 0x53	; 83
 936:	4e 53       	subi	r20, 0x3E	; 62
 938:	45 31       	cpi	r20, 0x15	; 21
 93a:	00 43       	sbci	r16, 0x30	; 48
 93c:	54 52       	subi	r21, 0x24	; 36
 93e:	4c 41       	sbci	r20, 0x1C	; 28
 940:	00 43       	sbci	r16, 0x30	; 48
 942:	54 52       	subi	r21, 0x24	; 36
 944:	4c 41       	sbci	r20, 0x1C	; 28
 946:	00 43       	sbci	r16, 0x30	; 48
 948:	54 52       	subi	r21, 0x24	; 36
 94a:	4c 42       	sbci	r20, 0x2C	; 44
 94c:	00 44       	sbci	r16, 0x40	; 64
 94e:	41 54       	subi	r20, 0x41	; 65
 950:	41 00       	.word	0x0041	; ????
 952:	49 4e       	sbci	r20, 0xE9	; 233
 954:	54 43       	sbci	r21, 0x34	; 52
 956:	54 52       	subi	r21, 0x24	; 36
 958:	4c 00       	.word	0x004c	; ????
 95a:	49 4e       	sbci	r20, 0xE9	; 233
 95c:	54 46       	sbci	r21, 0x64	; 100
 95e:	4c 41       	sbci	r20, 0x1C	; 28
 960:	47 53       	subi	r20, 0x37	; 55
 962:	00 45       	sbci	r16, 0x50	; 80
 964:	58 54       	subi	r21, 0x48	; 72
 966:	42 52       	subi	r20, 0x22	; 34
 968:	4b 00       	.word	0x004b	; ????
 96a:	4f 43       	sbci	r20, 0x3F	; 63
 96c:	44 4d       	sbci	r20, 0xD4	; 212
 96e:	00 4f       	sbci	r16, 0xF0	; 240
 970:	43 44       	sbci	r20, 0x43	; 67
 972:	4d 53       	subi	r20, 0x3D	; 61
 974:	00 52       	subi	r16, 0x20	; 32
 976:	45 56       	subi	r20, 0x65	; 101
 978:	49 44       	sbci	r20, 0x49	; 73
 97a:	00 43       	sbci	r16, 0x30	; 48
 97c:	43 4d       	sbci	r20, 0xD3	; 211
 97e:	50 00       	.word	0x0050	; ????
 980:	43 4e       	sbci	r20, 0xE3	; 227
 982:	54 00       	.word	0x0054	; ????
 984:	43 54       	subi	r20, 0x43	; 67
 986:	52 4c       	sbci	r21, 0xC2	; 194
 988:	41 00       	.word	0x0041	; ????
 98a:	43 54       	subi	r20, 0x43	; 67
 98c:	52 4c       	sbci	r21, 0xC2	; 194
 98e:	42 00       	.word	0x0042	; ????
 990:	44 42       	sbci	r20, 0x24	; 36
 992:	47 43       	sbci	r20, 0x37	; 55
 994:	54 52       	subi	r21, 0x24	; 36
 996:	4c 00       	.word	0x004c	; ????
 998:	45 56       	subi	r20, 0x65	; 101
 99a:	43 54       	subi	r20, 0x43	; 67
 99c:	52 4c       	sbci	r21, 0xC2	; 194
 99e:	00 49       	sbci	r16, 0x90	; 144
 9a0:	4e 54       	subi	r20, 0x4E	; 78
 9a2:	43 54       	subi	r20, 0x43	; 67
 9a4:	52 4c       	sbci	r21, 0xC2	; 194
 9a6:	00 49       	sbci	r16, 0x90	; 144
 9a8:	4e 54       	subi	r20, 0x4E	; 78
 9aa:	46 4c       	sbci	r20, 0xC6	; 198
 9ac:	41 47       	sbci	r20, 0x71	; 113
 9ae:	53 00       	.word	0x0053	; ????
 9b0:	53 54       	subi	r21, 0x43	; 67
 9b2:	41 54       	subi	r20, 0x41	; 65
 9b4:	55 53       	subi	r21, 0x35	; 53
 9b6:	00 54       	subi	r16, 0x40	; 64
 9b8:	45 4d       	sbci	r20, 0xD5	; 213
 9ba:	50 00       	.word	0x0050	; ????
 9bc:	43 43       	sbci	r20, 0x33	; 51
 9be:	4d 50       	subi	r20, 0x0D	; 13
 9c0:	00 43       	sbci	r16, 0x30	; 48
 9c2:	4e 54       	subi	r20, 0x4E	; 78
 9c4:	00 43       	sbci	r16, 0x30	; 48
 9c6:	54 52       	subi	r21, 0x24	; 36
 9c8:	4c 41       	sbci	r20, 0x1C	; 28
 9ca:	00 43       	sbci	r16, 0x30	; 48
 9cc:	54 52       	subi	r21, 0x24	; 36
 9ce:	4c 42       	sbci	r20, 0x2C	; 44
 9d0:	00 44       	sbci	r16, 0x40	; 64
 9d2:	42 47       	sbci	r20, 0x72	; 114
 9d4:	43 54       	subi	r20, 0x43	; 67
 9d6:	52 4c       	sbci	r21, 0xC2	; 194
 9d8:	00 45       	sbci	r16, 0x50	; 80
 9da:	56 43       	sbci	r21, 0x36	; 54
 9dc:	54 52       	subi	r21, 0x24	; 36
 9de:	4c 00       	.word	0x004c	; ????
 9e0:	49 4e       	sbci	r20, 0xE9	; 233
 9e2:	54 43       	sbci	r21, 0x34	; 52
 9e4:	54 52       	subi	r21, 0x24	; 36
 9e6:	4c 00       	.word	0x004c	; ????
 9e8:	49 4e       	sbci	r20, 0xE9	; 233
 9ea:	54 46       	sbci	r21, 0x64	; 100
 9ec:	4c 41       	sbci	r20, 0x1C	; 28
 9ee:	47 53       	subi	r20, 0x37	; 55
 9f0:	00 53       	subi	r16, 0x30	; 48
 9f2:	54 41       	sbci	r21, 0x14	; 20
 9f4:	54 55       	subi	r21, 0x54	; 84
 9f6:	53 00       	.word	0x0053	; ????
 9f8:	54 45       	sbci	r21, 0x54	; 84
 9fa:	4d 50       	subi	r20, 0x0D	; 13
 9fc:	00 43       	sbci	r16, 0x30	; 48
 9fe:	43 4d       	sbci	r20, 0xD3	; 211
 a00:	50 00       	.word	0x0050	; ????
 a02:	43 4e       	sbci	r20, 0xE3	; 227
 a04:	54 00       	.word	0x0054	; ????
 a06:	43 54       	subi	r20, 0x43	; 67
 a08:	52 4c       	sbci	r21, 0xC2	; 194
 a0a:	41 00       	.word	0x0041	; ????
 a0c:	43 54       	subi	r20, 0x43	; 67
 a0e:	52 4c       	sbci	r21, 0xC2	; 194
 a10:	42 00       	.word	0x0042	; ????
 a12:	44 42       	sbci	r20, 0x24	; 36
 a14:	47 43       	sbci	r20, 0x37	; 55
 a16:	54 52       	subi	r21, 0x24	; 36
 a18:	4c 00       	.word	0x004c	; ????
 a1a:	45 56       	subi	r20, 0x65	; 101
 a1c:	43 54       	subi	r20, 0x43	; 67
 a1e:	52 4c       	sbci	r21, 0xC2	; 194
 a20:	00 49       	sbci	r16, 0x90	; 144
 a22:	4e 54       	subi	r20, 0x4E	; 78
 a24:	43 54       	subi	r20, 0x43	; 67
 a26:	52 4c       	sbci	r21, 0xC2	; 194
 a28:	00 49       	sbci	r16, 0x90	; 144
 a2a:	4e 54       	subi	r20, 0x4E	; 78
 a2c:	46 4c       	sbci	r20, 0xC6	; 198
 a2e:	41 47       	sbci	r20, 0x71	; 113
 a30:	53 00       	.word	0x0053	; ????
 a32:	53 54       	subi	r21, 0x43	; 67
 a34:	41 54       	subi	r20, 0x41	; 65
 a36:	55 53       	subi	r21, 0x35	; 53
 a38:	00 54       	subi	r16, 0x40	; 64
 a3a:	45 4d       	sbci	r20, 0xD5	; 213
 a3c:	50 00       	.word	0x0050	; ????
 a3e:	43 43       	sbci	r20, 0x33	; 51
 a40:	4d 50       	subi	r20, 0x0D	; 13
 a42:	00 43       	sbci	r16, 0x30	; 48
 a44:	4e 54       	subi	r20, 0x4E	; 78
 a46:	00 43       	sbci	r16, 0x30	; 48
 a48:	54 52       	subi	r21, 0x24	; 36
 a4a:	4c 41       	sbci	r20, 0x1C	; 28
 a4c:	00 43       	sbci	r16, 0x30	; 48
 a4e:	54 52       	subi	r21, 0x24	; 36
 a50:	4c 42       	sbci	r20, 0x2C	; 44
 a52:	00 44       	sbci	r16, 0x40	; 64
 a54:	42 47       	sbci	r20, 0x72	; 114
 a56:	43 54       	subi	r20, 0x43	; 67
 a58:	52 4c       	sbci	r21, 0xC2	; 194
 a5a:	00 45       	sbci	r16, 0x50	; 80
 a5c:	56 43       	sbci	r21, 0x36	; 54
 a5e:	54 52       	subi	r21, 0x24	; 36
 a60:	4c 00       	.word	0x004c	; ????
 a62:	49 4e       	sbci	r20, 0xE9	; 233
 a64:	54 43       	sbci	r21, 0x34	; 52
 a66:	54 52       	subi	r21, 0x24	; 36
 a68:	4c 00       	.word	0x004c	; ????
 a6a:	49 4e       	sbci	r20, 0xE9	; 233
 a6c:	54 46       	sbci	r21, 0x64	; 100
 a6e:	4c 41       	sbci	r20, 0x1C	; 28
 a70:	47 53       	subi	r20, 0x37	; 55
 a72:	00 53       	subi	r16, 0x30	; 48
 a74:	54 41       	sbci	r21, 0x14	; 20
 a76:	54 55       	subi	r21, 0x54	; 84
 a78:	53 00       	.word	0x0053	; ????
 a7a:	54 45       	sbci	r21, 0x54	; 84
 a7c:	4d 50       	subi	r20, 0x0D	; 13
 a7e:	00 43       	sbci	r16, 0x30	; 48
 a80:	54 52       	subi	r21, 0x24	; 36
 a82:	4c 41       	sbci	r20, 0x1C	; 28
 a84:	00 44       	sbci	r16, 0x40	; 64
 a86:	42 47       	sbci	r20, 0x72	; 114
 a88:	43 54       	subi	r20, 0x43	; 67
 a8a:	52 4c       	sbci	r21, 0xC2	; 194
 a8c:	00 44       	sbci	r16, 0x40	; 64
 a8e:	55 41       	sbci	r21, 0x15	; 21
 a90:	4c 43       	sbci	r20, 0x3C	; 60
 a92:	54 52       	subi	r21, 0x24	; 36
 a94:	4c 00       	.word	0x004c	; ????
 a96:	4d 41       	sbci	r20, 0x1D	; 29
 a98:	44 44       	sbci	r20, 0x44	; 68
 a9a:	52 00       	.word	0x0052	; ????
 a9c:	4d 42       	sbci	r20, 0x2D	; 45
 a9e:	41 55       	subi	r20, 0x51	; 81
 aa0:	44 00       	.word	0x0044	; ????
 aa2:	4d 43       	sbci	r20, 0x3D	; 61
 aa4:	54 52       	subi	r21, 0x24	; 36
 aa6:	4c 41       	sbci	r20, 0x1C	; 28
 aa8:	00 4d       	sbci	r16, 0xD0	; 208
 aaa:	43 54       	subi	r20, 0x43	; 67
 aac:	52 4c       	sbci	r21, 0xC2	; 194
 aae:	42 00       	.word	0x0042	; ????
 ab0:	4d 44       	sbci	r20, 0x4D	; 77
 ab2:	41 54       	subi	r20, 0x41	; 65
 ab4:	41 00       	.word	0x0041	; ????
 ab6:	4d 53       	subi	r20, 0x3D	; 61
 ab8:	54 41       	sbci	r21, 0x14	; 20
 aba:	54 55       	subi	r21, 0x54	; 84
 abc:	53 00       	.word	0x0053	; ????
 abe:	53 41       	sbci	r21, 0x13	; 19
 ac0:	44 44       	sbci	r20, 0x44	; 68
 ac2:	52 00       	.word	0x0052	; ????
 ac4:	53 41       	sbci	r21, 0x13	; 19
 ac6:	44 44       	sbci	r20, 0x44	; 68
 ac8:	52 4d       	sbci	r21, 0xD2	; 210
 aca:	41 53       	subi	r20, 0x31	; 49
 acc:	4b 00       	.word	0x004b	; ????
 ace:	53 43       	sbci	r21, 0x33	; 51
 ad0:	54 52       	subi	r21, 0x24	; 36
 ad2:	4c 41       	sbci	r20, 0x1C	; 28
 ad4:	00 53       	subi	r16, 0x30	; 48
 ad6:	43 54       	subi	r20, 0x43	; 67
 ad8:	52 4c       	sbci	r21, 0xC2	; 194
 ada:	42 00       	.word	0x0042	; ????
 adc:	53 44       	sbci	r21, 0x43	; 67
 ade:	41 54       	subi	r20, 0x41	; 65
 ae0:	41 00       	.word	0x0041	; ????
 ae2:	53 53       	subi	r21, 0x33	; 51
 ae4:	54 41       	sbci	r21, 0x14	; 20
 ae6:	54 55       	subi	r21, 0x54	; 84
 ae8:	53 00       	.word	0x0053	; ????
 aea:	42 41       	sbci	r20, 0x12	; 18
 aec:	55 44       	sbci	r21, 0x45	; 69
 aee:	00 43       	sbci	r16, 0x30	; 48
 af0:	54 52       	subi	r21, 0x24	; 36
 af2:	4c 41       	sbci	r20, 0x1C	; 28
 af4:	00 43       	sbci	r16, 0x30	; 48
 af6:	54 52       	subi	r21, 0x24	; 36
 af8:	4c 42       	sbci	r20, 0x2C	; 44
 afa:	00 43       	sbci	r16, 0x30	; 48
 afc:	54 52       	subi	r21, 0x24	; 36
 afe:	4c 43       	sbci	r20, 0x3C	; 60
 b00:	00 43       	sbci	r16, 0x30	; 48
 b02:	54 52       	subi	r21, 0x24	; 36
 b04:	4c 44       	sbci	r20, 0x4C	; 76
 b06:	00 44       	sbci	r16, 0x40	; 64
 b08:	42 47       	sbci	r20, 0x72	; 114
 b0a:	43 54       	subi	r20, 0x43	; 67
 b0c:	52 4c       	sbci	r21, 0xC2	; 194
 b0e:	00 45       	sbci	r16, 0x50	; 80
 b10:	56 43       	sbci	r21, 0x36	; 54
 b12:	54 52       	subi	r21, 0x24	; 36
 b14:	4c 00       	.word	0x004c	; ????
 b16:	52 58       	subi	r21, 0x82	; 130
 b18:	44 41       	sbci	r20, 0x14	; 20
 b1a:	54 41       	sbci	r21, 0x14	; 20
 b1c:	48 00       	.word	0x0048	; ????
 b1e:	52 58       	subi	r21, 0x82	; 130
 b20:	44 41       	sbci	r20, 0x14	; 20
 b22:	54 41       	sbci	r21, 0x14	; 20
 b24:	4c 00       	.word	0x004c	; ????
 b26:	52 58       	subi	r21, 0x82	; 130
 b28:	50 4c       	sbci	r21, 0xC0	; 192
 b2a:	43 54       	subi	r20, 0x43	; 67
 b2c:	52 4c       	sbci	r21, 0xC2	; 194
 b2e:	00 53       	subi	r16, 0x30	; 48
 b30:	54 41       	sbci	r21, 0x14	; 20
 b32:	54 55       	subi	r21, 0x54	; 84
 b34:	53 00       	.word	0x0053	; ????
 b36:	54 58       	subi	r21, 0x84	; 132
 b38:	44 41       	sbci	r20, 0x14	; 20
 b3a:	54 41       	sbci	r21, 0x14	; 20
 b3c:	48 00       	.word	0x0048	; ????
 b3e:	54 58       	subi	r21, 0x84	; 132
 b40:	44 41       	sbci	r20, 0x14	; 20
 b42:	54 41       	sbci	r21, 0x14	; 20
 b44:	4c 00       	.word	0x004c	; ????
 b46:	54 58       	subi	r21, 0x84	; 132
 b48:	50 4c       	sbci	r21, 0xC0	; 192
 b4a:	43 54       	subi	r20, 0x43	; 67
 b4c:	52 4c       	sbci	r21, 0xC2	; 194
 b4e:	00 42       	sbci	r16, 0x20	; 32
 b50:	41 55       	subi	r20, 0x51	; 81
 b52:	44 00       	.word	0x0044	; ????
 b54:	43 54       	subi	r20, 0x43	; 67
 b56:	52 4c       	sbci	r21, 0xC2	; 194
 b58:	41 00       	.word	0x0041	; ????
 b5a:	43 54       	subi	r20, 0x43	; 67
 b5c:	52 4c       	sbci	r21, 0xC2	; 194
 b5e:	42 00       	.word	0x0042	; ????
 b60:	43 54       	subi	r20, 0x43	; 67
 b62:	52 4c       	sbci	r21, 0xC2	; 194
 b64:	43 00       	.word	0x0043	; ????
 b66:	43 54       	subi	r20, 0x43	; 67
 b68:	52 4c       	sbci	r21, 0xC2	; 194
 b6a:	44 00       	.word	0x0044	; ????
 b6c:	44 42       	sbci	r20, 0x24	; 36
 b6e:	47 43       	sbci	r20, 0x37	; 55
 b70:	54 52       	subi	r21, 0x24	; 36
 b72:	4c 00       	.word	0x004c	; ????
 b74:	45 56       	subi	r20, 0x65	; 101
 b76:	43 54       	subi	r20, 0x43	; 67
 b78:	52 4c       	sbci	r21, 0xC2	; 194
 b7a:	00 52       	subi	r16, 0x20	; 32
 b7c:	58 44       	sbci	r21, 0x48	; 72
 b7e:	41 54       	subi	r20, 0x41	; 65
 b80:	41 48       	sbci	r20, 0x81	; 129
 b82:	00 52       	subi	r16, 0x20	; 32
 b84:	58 44       	sbci	r21, 0x48	; 72
 b86:	41 54       	subi	r20, 0x41	; 65
 b88:	41 4c       	sbci	r20, 0xC1	; 193
 b8a:	00 52       	subi	r16, 0x20	; 32
 b8c:	58 50       	subi	r21, 0x08	; 8
 b8e:	4c 43       	sbci	r20, 0x3C	; 60
 b90:	54 52       	subi	r21, 0x24	; 36
 b92:	4c 00       	.word	0x004c	; ????
 b94:	53 54       	subi	r21, 0x43	; 67
 b96:	41 54       	subi	r20, 0x41	; 65
 b98:	55 53       	subi	r21, 0x35	; 53
 b9a:	00 54       	subi	r16, 0x40	; 64
 b9c:	58 44       	sbci	r21, 0x48	; 72
 b9e:	41 54       	subi	r20, 0x41	; 65
 ba0:	41 48       	sbci	r20, 0x81	; 129
 ba2:	00 54       	subi	r16, 0x40	; 64
 ba4:	58 44       	sbci	r21, 0x48	; 72
 ba6:	41 54       	subi	r20, 0x41	; 65
 ba8:	41 4c       	sbci	r20, 0xC1	; 193
 baa:	00 54       	subi	r16, 0x40	; 64
 bac:	58 50       	subi	r21, 0x08	; 8
 bae:	4c 43       	sbci	r20, 0x3C	; 60
 bb0:	54 52       	subi	r21, 0x24	; 36
 bb2:	4c 00       	.word	0x004c	; ????
 bb4:	42 41       	sbci	r20, 0x12	; 18
 bb6:	55 44       	sbci	r21, 0x45	; 69
 bb8:	00 43       	sbci	r16, 0x30	; 48
 bba:	54 52       	subi	r21, 0x24	; 36
 bbc:	4c 41       	sbci	r20, 0x1C	; 28
 bbe:	00 43       	sbci	r16, 0x30	; 48
 bc0:	54 52       	subi	r21, 0x24	; 36
 bc2:	4c 42       	sbci	r20, 0x2C	; 44
 bc4:	00 43       	sbci	r16, 0x30	; 48
 bc6:	54 52       	subi	r21, 0x24	; 36
 bc8:	4c 43       	sbci	r20, 0x3C	; 60
 bca:	00 43       	sbci	r16, 0x30	; 48
 bcc:	54 52       	subi	r21, 0x24	; 36
 bce:	4c 44       	sbci	r20, 0x4C	; 76
 bd0:	00 44       	sbci	r16, 0x40	; 64
 bd2:	42 47       	sbci	r20, 0x72	; 114
 bd4:	43 54       	subi	r20, 0x43	; 67
 bd6:	52 4c       	sbci	r21, 0xC2	; 194
 bd8:	00 45       	sbci	r16, 0x50	; 80
 bda:	56 43       	sbci	r21, 0x36	; 54
 bdc:	54 52       	subi	r21, 0x24	; 36
 bde:	4c 00       	.word	0x004c	; ????
 be0:	52 58       	subi	r21, 0x82	; 130
 be2:	44 41       	sbci	r20, 0x14	; 20
 be4:	54 41       	sbci	r21, 0x14	; 20
 be6:	48 00       	.word	0x0048	; ????
 be8:	52 58       	subi	r21, 0x82	; 130
 bea:	44 41       	sbci	r20, 0x14	; 20
 bec:	54 41       	sbci	r21, 0x14	; 20
 bee:	4c 00       	.word	0x004c	; ????
 bf0:	52 58       	subi	r21, 0x82	; 130
 bf2:	50 4c       	sbci	r21, 0xC0	; 192
 bf4:	43 54       	subi	r20, 0x43	; 67
 bf6:	52 4c       	sbci	r21, 0xC2	; 194
 bf8:	00 53       	subi	r16, 0x30	; 48
 bfa:	54 41       	sbci	r21, 0x14	; 20
 bfc:	54 55       	subi	r21, 0x54	; 84
 bfe:	53 00       	.word	0x0053	; ????
 c00:	54 58       	subi	r21, 0x84	; 132
 c02:	44 41       	sbci	r20, 0x14	; 20
 c04:	54 41       	sbci	r21, 0x14	; 20
 c06:	48 00       	.word	0x0048	; ????
 c08:	54 58       	subi	r21, 0x84	; 132
 c0a:	44 41       	sbci	r20, 0x14	; 20
 c0c:	54 41       	sbci	r21, 0x14	; 20
 c0e:	4c 00       	.word	0x004c	; ????
 c10:	54 58       	subi	r21, 0x84	; 132
 c12:	50 4c       	sbci	r21, 0xC0	; 192
 c14:	43 54       	subi	r20, 0x43	; 67
 c16:	52 4c       	sbci	r21, 0xC2	; 194
 c18:	00 42       	sbci	r16, 0x20	; 32
 c1a:	41 55       	subi	r20, 0x51	; 81
 c1c:	44 00       	.word	0x0044	; ????
 c1e:	43 54       	subi	r20, 0x43	; 67
 c20:	52 4c       	sbci	r21, 0xC2	; 194
 c22:	41 00       	.word	0x0041	; ????
 c24:	43 54       	subi	r20, 0x43	; 67
 c26:	52 4c       	sbci	r21, 0xC2	; 194
 c28:	42 00       	.word	0x0042	; ????
 c2a:	43 54       	subi	r20, 0x43	; 67
 c2c:	52 4c       	sbci	r21, 0xC2	; 194
 c2e:	43 00       	.word	0x0043	; ????
 c30:	43 54       	subi	r20, 0x43	; 67
 c32:	52 4c       	sbci	r21, 0xC2	; 194
 c34:	44 00       	.word	0x0044	; ????
 c36:	44 42       	sbci	r20, 0x24	; 36
 c38:	47 43       	sbci	r20, 0x37	; 55
 c3a:	54 52       	subi	r21, 0x24	; 36
 c3c:	4c 00       	.word	0x004c	; ????
 c3e:	45 56       	subi	r20, 0x65	; 101
 c40:	43 54       	subi	r20, 0x43	; 67
 c42:	52 4c       	sbci	r21, 0xC2	; 194
 c44:	00 52       	subi	r16, 0x20	; 32
 c46:	58 44       	sbci	r21, 0x48	; 72
 c48:	41 54       	subi	r20, 0x41	; 65
 c4a:	41 48       	sbci	r20, 0x81	; 129
 c4c:	00 52       	subi	r16, 0x20	; 32
 c4e:	58 44       	sbci	r21, 0x48	; 72
 c50:	41 54       	subi	r20, 0x41	; 65
 c52:	41 4c       	sbci	r20, 0xC1	; 193
 c54:	00 52       	subi	r16, 0x20	; 32
 c56:	58 50       	subi	r21, 0x08	; 8
 c58:	4c 43       	sbci	r20, 0x3C	; 60
 c5a:	54 52       	subi	r21, 0x24	; 36
 c5c:	4c 00       	.word	0x004c	; ????
 c5e:	53 54       	subi	r21, 0x43	; 67
 c60:	41 54       	subi	r20, 0x41	; 65
 c62:	55 53       	subi	r21, 0x35	; 53
 c64:	00 54       	subi	r16, 0x40	; 64
 c66:	58 44       	sbci	r21, 0x48	; 72
 c68:	41 54       	subi	r20, 0x41	; 65
 c6a:	41 48       	sbci	r20, 0x81	; 129
 c6c:	00 54       	subi	r16, 0x40	; 64
 c6e:	58 44       	sbci	r21, 0x48	; 72
 c70:	41 54       	subi	r20, 0x41	; 65
 c72:	41 4c       	sbci	r20, 0xC1	; 193
 c74:	00 54       	subi	r16, 0x40	; 64
 c76:	58 50       	subi	r21, 0x08	; 8
 c78:	4c 43       	sbci	r20, 0x3C	; 60
 c7a:	54 52       	subi	r21, 0x24	; 36
 c7c:	4c 00       	.word	0x004c	; ????
 c7e:	55 53       	subi	r21, 0x35	; 53
 c80:	45 52       	subi	r20, 0x25	; 37
 c82:	52 4f       	sbci	r21, 0xF2	; 242
 c84:	57 30       	cpi	r21, 0x07	; 7
 c86:	00 55       	subi	r16, 0x50	; 80
 c88:	53 45       	sbci	r21, 0x53	; 83
 c8a:	52 52       	subi	r21, 0x22	; 34
 c8c:	4f 57       	subi	r20, 0x7F	; 127
 c8e:	31 00       	.word	0x0031	; ????
 c90:	55 53       	subi	r21, 0x35	; 53
 c92:	45 52       	subi	r20, 0x25	; 37
 c94:	52 4f       	sbci	r21, 0xF2	; 242
 c96:	57 32       	cpi	r21, 0x27	; 39
 c98:	00 55       	subi	r16, 0x50	; 80
 c9a:	53 45       	sbci	r21, 0x53	; 83
 c9c:	52 52       	subi	r21, 0x22	; 34
 c9e:	4f 57       	subi	r20, 0x7F	; 127
 ca0:	33 00       	.word	0x0033	; ????
 ca2:	55 53       	subi	r21, 0x35	; 53
 ca4:	45 52       	subi	r20, 0x25	; 37
 ca6:	52 4f       	sbci	r21, 0xF2	; 242
 ca8:	57 34       	cpi	r21, 0x47	; 71
 caa:	00 55       	subi	r16, 0x50	; 80
 cac:	53 45       	sbci	r21, 0x53	; 83
 cae:	52 52       	subi	r21, 0x22	; 34
 cb0:	4f 57       	subi	r20, 0x7F	; 127
 cb2:	35 00       	.word	0x0035	; ????
 cb4:	55 53       	subi	r21, 0x35	; 53
 cb6:	45 52       	subi	r20, 0x25	; 37
 cb8:	52 4f       	sbci	r21, 0xF2	; 242
 cba:	57 36       	cpi	r21, 0x67	; 103
 cbc:	00 55       	subi	r16, 0x50	; 80
 cbe:	53 45       	sbci	r21, 0x53	; 83
 cc0:	52 52       	subi	r21, 0x22	; 34
 cc2:	4f 57       	subi	r20, 0x7F	; 127
 cc4:	37 00       	.word	0x0037	; ????
 cc6:	55 53       	subi	r21, 0x35	; 53
 cc8:	45 52       	subi	r20, 0x25	; 37
 cca:	52 4f       	sbci	r21, 0xF2	; 242
 ccc:	57 38       	cpi	r21, 0x87	; 135
 cce:	00 55       	subi	r16, 0x50	; 80
 cd0:	53 45       	sbci	r21, 0x53	; 83
 cd2:	52 52       	subi	r21, 0x22	; 34
 cd4:	4f 57       	subi	r20, 0x7F	; 127
 cd6:	39 00       	.word	0x0039	; ????
 cd8:	55 53       	subi	r21, 0x35	; 53
 cda:	45 52       	subi	r20, 0x25	; 37
 cdc:	52 4f       	sbci	r21, 0xF2	; 242
 cde:	57 31       	cpi	r21, 0x17	; 23
 ce0:	30 00       	.word	0x0030	; ????
 ce2:	55 53       	subi	r21, 0x35	; 53
 ce4:	45 52       	subi	r20, 0x25	; 37
 ce6:	52 4f       	sbci	r21, 0xF2	; 242
 ce8:	57 31       	cpi	r21, 0x17	; 23
 cea:	31 00       	.word	0x0031	; ????
 cec:	55 53       	subi	r21, 0x35	; 53
 cee:	45 52       	subi	r20, 0x25	; 37
 cf0:	52 4f       	sbci	r21, 0xF2	; 242
 cf2:	57 31       	cpi	r21, 0x17	; 23
 cf4:	32 00       	.word	0x0032	; ????
 cf6:	55 53       	subi	r21, 0x35	; 53
 cf8:	45 52       	subi	r20, 0x25	; 37
 cfa:	52 4f       	sbci	r21, 0xF2	; 242
 cfc:	57 31       	cpi	r21, 0x17	; 23
 cfe:	33 00       	.word	0x0033	; ????
 d00:	55 53       	subi	r21, 0x35	; 53
 d02:	45 52       	subi	r20, 0x25	; 37
 d04:	52 4f       	sbci	r21, 0xF2	; 242
 d06:	57 31       	cpi	r21, 0x17	; 23
 d08:	34 00       	.word	0x0034	; ????
 d0a:	55 53       	subi	r21, 0x35	; 53
 d0c:	45 52       	subi	r20, 0x25	; 37
 d0e:	52 4f       	sbci	r21, 0xF2	; 242
 d10:	57 31       	cpi	r21, 0x17	; 23
 d12:	35 00       	.word	0x0035	; ????
 d14:	55 53       	subi	r21, 0x35	; 53
 d16:	45 52       	subi	r20, 0x25	; 37
 d18:	52 4f       	sbci	r21, 0xF2	; 242
 d1a:	57 31       	cpi	r21, 0x17	; 23
 d1c:	36 00       	.word	0x0036	; ????
 d1e:	55 53       	subi	r21, 0x35	; 53
 d20:	45 52       	subi	r20, 0x25	; 37
 d22:	52 4f       	sbci	r21, 0xF2	; 242
 d24:	57 31       	cpi	r21, 0x17	; 23
 d26:	37 00       	.word	0x0037	; ????
 d28:	55 53       	subi	r21, 0x35	; 53
 d2a:	45 52       	subi	r20, 0x25	; 37
 d2c:	52 4f       	sbci	r21, 0xF2	; 242
 d2e:	57 31       	cpi	r21, 0x17	; 23
 d30:	38 00       	.word	0x0038	; ????
 d32:	55 53       	subi	r21, 0x35	; 53
 d34:	45 52       	subi	r20, 0x25	; 37
 d36:	52 4f       	sbci	r21, 0xF2	; 242
 d38:	57 31       	cpi	r21, 0x17	; 23
 d3a:	39 00       	.word	0x0039	; ????
 d3c:	55 53       	subi	r21, 0x35	; 53
 d3e:	45 52       	subi	r20, 0x25	; 37
 d40:	52 4f       	sbci	r21, 0xF2	; 242
 d42:	57 32       	cpi	r21, 0x27	; 39
 d44:	30 00       	.word	0x0030	; ????
 d46:	55 53       	subi	r21, 0x35	; 53
 d48:	45 52       	subi	r20, 0x25	; 37
 d4a:	52 4f       	sbci	r21, 0xF2	; 242
 d4c:	57 32       	cpi	r21, 0x27	; 39
 d4e:	31 00       	.word	0x0031	; ????
 d50:	55 53       	subi	r21, 0x35	; 53
 d52:	45 52       	subi	r20, 0x25	; 37
 d54:	52 4f       	sbci	r21, 0xF2	; 242
 d56:	57 32       	cpi	r21, 0x27	; 39
 d58:	32 00       	.word	0x0032	; ????
 d5a:	55 53       	subi	r21, 0x35	; 53
 d5c:	45 52       	subi	r20, 0x25	; 37
 d5e:	52 4f       	sbci	r21, 0xF2	; 242
 d60:	57 32       	cpi	r21, 0x27	; 39
 d62:	33 00       	.word	0x0033	; ????
 d64:	55 53       	subi	r21, 0x35	; 53
 d66:	45 52       	subi	r20, 0x25	; 37
 d68:	52 4f       	sbci	r21, 0xF2	; 242
 d6a:	57 32       	cpi	r21, 0x27	; 39
 d6c:	34 00       	.word	0x0034	; ????
 d6e:	55 53       	subi	r21, 0x35	; 53
 d70:	45 52       	subi	r20, 0x25	; 37
 d72:	52 4f       	sbci	r21, 0xF2	; 242
 d74:	57 32       	cpi	r21, 0x27	; 39
 d76:	35 00       	.word	0x0035	; ????
 d78:	55 53       	subi	r21, 0x35	; 53
 d7a:	45 52       	subi	r20, 0x25	; 37
 d7c:	52 4f       	sbci	r21, 0xF2	; 242
 d7e:	57 32       	cpi	r21, 0x27	; 39
 d80:	36 00       	.word	0x0036	; ????
 d82:	55 53       	subi	r21, 0x35	; 53
 d84:	45 52       	subi	r20, 0x25	; 37
 d86:	52 4f       	sbci	r21, 0xF2	; 242
 d88:	57 32       	cpi	r21, 0x27	; 39
 d8a:	37 00       	.word	0x0037	; ????
 d8c:	55 53       	subi	r21, 0x35	; 53
 d8e:	45 52       	subi	r20, 0x25	; 37
 d90:	52 4f       	sbci	r21, 0xF2	; 242
 d92:	57 32       	cpi	r21, 0x27	; 39
 d94:	38 00       	.word	0x0038	; ????
 d96:	55 53       	subi	r21, 0x35	; 53
 d98:	45 52       	subi	r20, 0x25	; 37
 d9a:	52 4f       	sbci	r21, 0xF2	; 242
 d9c:	57 32       	cpi	r21, 0x27	; 39
 d9e:	39 00       	.word	0x0039	; ????
 da0:	55 53       	subi	r21, 0x35	; 53
 da2:	45 52       	subi	r20, 0x25	; 37
 da4:	52 4f       	sbci	r21, 0xF2	; 242
 da6:	57 33       	cpi	r21, 0x37	; 55
 da8:	30 00       	.word	0x0030	; ????
 daa:	55 53       	subi	r21, 0x35	; 53
 dac:	45 52       	subi	r20, 0x25	; 37
 dae:	52 4f       	sbci	r21, 0xF2	; 242
 db0:	57 33       	cpi	r21, 0x37	; 55
 db2:	31 00       	.word	0x0031	; ????
 db4:	55 53       	subi	r21, 0x35	; 53
 db6:	45 52       	subi	r20, 0x25	; 37
 db8:	52 4f       	sbci	r21, 0xF2	; 242
 dba:	57 33       	cpi	r21, 0x37	; 55
 dbc:	32 00       	.word	0x0032	; ????
 dbe:	55 53       	subi	r21, 0x35	; 53
 dc0:	45 52       	subi	r20, 0x25	; 37
 dc2:	52 4f       	sbci	r21, 0xF2	; 242
 dc4:	57 33       	cpi	r21, 0x37	; 55
 dc6:	33 00       	.word	0x0033	; ????
 dc8:	55 53       	subi	r21, 0x35	; 53
 dca:	45 52       	subi	r20, 0x25	; 37
 dcc:	52 4f       	sbci	r21, 0xF2	; 242
 dce:	57 33       	cpi	r21, 0x37	; 55
 dd0:	34 00       	.word	0x0034	; ????
 dd2:	55 53       	subi	r21, 0x35	; 53
 dd4:	45 52       	subi	r20, 0x25	; 37
 dd6:	52 4f       	sbci	r21, 0xF2	; 242
 dd8:	57 33       	cpi	r21, 0x37	; 55
 dda:	35 00       	.word	0x0035	; ????
 ddc:	55 53       	subi	r21, 0x35	; 53
 dde:	45 52       	subi	r20, 0x25	; 37
 de0:	52 4f       	sbci	r21, 0xF2	; 242
 de2:	57 33       	cpi	r21, 0x37	; 55
 de4:	36 00       	.word	0x0036	; ????
 de6:	55 53       	subi	r21, 0x35	; 53
 de8:	45 52       	subi	r20, 0x25	; 37
 dea:	52 4f       	sbci	r21, 0xF2	; 242
 dec:	57 33       	cpi	r21, 0x37	; 55
 dee:	37 00       	.word	0x0037	; ????
 df0:	55 53       	subi	r21, 0x35	; 53
 df2:	45 52       	subi	r20, 0x25	; 37
 df4:	52 4f       	sbci	r21, 0xF2	; 242
 df6:	57 33       	cpi	r21, 0x37	; 55
 df8:	38 00       	.word	0x0038	; ????
 dfa:	55 53       	subi	r21, 0x35	; 53
 dfc:	45 52       	subi	r20, 0x25	; 37
 dfe:	52 4f       	sbci	r21, 0xF2	; 242
 e00:	57 33       	cpi	r21, 0x37	; 55
 e02:	39 00       	.word	0x0039	; ????
 e04:	55 53       	subi	r21, 0x35	; 53
 e06:	45 52       	subi	r20, 0x25	; 37
 e08:	52 4f       	sbci	r21, 0xF2	; 242
 e0a:	57 34       	cpi	r21, 0x47	; 71
 e0c:	30 00       	.word	0x0030	; ????
 e0e:	55 53       	subi	r21, 0x35	; 53
 e10:	45 52       	subi	r20, 0x25	; 37
 e12:	52 4f       	sbci	r21, 0xF2	; 242
 e14:	57 34       	cpi	r21, 0x47	; 71
 e16:	31 00       	.word	0x0031	; ????
 e18:	55 53       	subi	r21, 0x35	; 53
 e1a:	45 52       	subi	r20, 0x25	; 37
 e1c:	52 4f       	sbci	r21, 0xF2	; 242
 e1e:	57 34       	cpi	r21, 0x47	; 71
 e20:	32 00       	.word	0x0032	; ????
 e22:	55 53       	subi	r21, 0x35	; 53
 e24:	45 52       	subi	r20, 0x25	; 37
 e26:	52 4f       	sbci	r21, 0xF2	; 242
 e28:	57 34       	cpi	r21, 0x47	; 71
 e2a:	33 00       	.word	0x0033	; ????
 e2c:	55 53       	subi	r21, 0x35	; 53
 e2e:	45 52       	subi	r20, 0x25	; 37
 e30:	52 4f       	sbci	r21, 0xF2	; 242
 e32:	57 34       	cpi	r21, 0x47	; 71
 e34:	34 00       	.word	0x0034	; ????
 e36:	55 53       	subi	r21, 0x35	; 53
 e38:	45 52       	subi	r20, 0x25	; 37
 e3a:	52 4f       	sbci	r21, 0xF2	; 242
 e3c:	57 34       	cpi	r21, 0x47	; 71
 e3e:	35 00       	.word	0x0035	; ????
 e40:	55 53       	subi	r21, 0x35	; 53
 e42:	45 52       	subi	r20, 0x25	; 37
 e44:	52 4f       	sbci	r21, 0xF2	; 242
 e46:	57 34       	cpi	r21, 0x47	; 71
 e48:	36 00       	.word	0x0036	; ????
 e4a:	55 53       	subi	r21, 0x35	; 53
 e4c:	45 52       	subi	r20, 0x25	; 37
 e4e:	52 4f       	sbci	r21, 0xF2	; 242
 e50:	57 34       	cpi	r21, 0x47	; 71
 e52:	37 00       	.word	0x0037	; ????
 e54:	55 53       	subi	r21, 0x35	; 53
 e56:	45 52       	subi	r20, 0x25	; 37
 e58:	52 4f       	sbci	r21, 0xF2	; 242
 e5a:	57 34       	cpi	r21, 0x47	; 71
 e5c:	38 00       	.word	0x0038	; ????
 e5e:	55 53       	subi	r21, 0x35	; 53
 e60:	45 52       	subi	r20, 0x25	; 37
 e62:	52 4f       	sbci	r21, 0xF2	; 242
 e64:	57 34       	cpi	r21, 0x47	; 71
 e66:	39 00       	.word	0x0039	; ????
 e68:	55 53       	subi	r21, 0x35	; 53
 e6a:	45 52       	subi	r20, 0x25	; 37
 e6c:	52 4f       	sbci	r21, 0xF2	; 242
 e6e:	57 35       	cpi	r21, 0x57	; 87
 e70:	30 00       	.word	0x0030	; ????
 e72:	55 53       	subi	r21, 0x35	; 53
 e74:	45 52       	subi	r20, 0x25	; 37
 e76:	52 4f       	sbci	r21, 0xF2	; 242
 e78:	57 35       	cpi	r21, 0x57	; 87
 e7a:	31 00       	.word	0x0031	; ????
 e7c:	55 53       	subi	r21, 0x35	; 53
 e7e:	45 52       	subi	r20, 0x25	; 37
 e80:	52 4f       	sbci	r21, 0xF2	; 242
 e82:	57 35       	cpi	r21, 0x57	; 87
 e84:	32 00       	.word	0x0032	; ????
 e86:	55 53       	subi	r21, 0x35	; 53
 e88:	45 52       	subi	r20, 0x25	; 37
 e8a:	52 4f       	sbci	r21, 0xF2	; 242
 e8c:	57 35       	cpi	r21, 0x57	; 87
 e8e:	33 00       	.word	0x0033	; ????
 e90:	55 53       	subi	r21, 0x35	; 53
 e92:	45 52       	subi	r20, 0x25	; 37
 e94:	52 4f       	sbci	r21, 0xF2	; 242
 e96:	57 35       	cpi	r21, 0x57	; 87
 e98:	34 00       	.word	0x0034	; ????
 e9a:	55 53       	subi	r21, 0x35	; 53
 e9c:	45 52       	subi	r20, 0x25	; 37
 e9e:	52 4f       	sbci	r21, 0xF2	; 242
 ea0:	57 35       	cpi	r21, 0x57	; 87
 ea2:	35 00       	.word	0x0035	; ????
 ea4:	55 53       	subi	r21, 0x35	; 53
 ea6:	45 52       	subi	r20, 0x25	; 37
 ea8:	52 4f       	sbci	r21, 0xF2	; 242
 eaa:	57 35       	cpi	r21, 0x57	; 87
 eac:	36 00       	.word	0x0036	; ????
 eae:	55 53       	subi	r21, 0x35	; 53
 eb0:	45 52       	subi	r20, 0x25	; 37
 eb2:	52 4f       	sbci	r21, 0xF2	; 242
 eb4:	57 35       	cpi	r21, 0x57	; 87
 eb6:	37 00       	.word	0x0037	; ????
 eb8:	55 53       	subi	r21, 0x35	; 53
 eba:	45 52       	subi	r20, 0x25	; 37
 ebc:	52 4f       	sbci	r21, 0xF2	; 242
 ebe:	57 35       	cpi	r21, 0x57	; 87
 ec0:	38 00       	.word	0x0038	; ????
 ec2:	55 53       	subi	r21, 0x35	; 53
 ec4:	45 52       	subi	r20, 0x25	; 37
 ec6:	52 4f       	sbci	r21, 0xF2	; 242
 ec8:	57 35       	cpi	r21, 0x57	; 87
 eca:	39 00       	.word	0x0039	; ????
 ecc:	55 53       	subi	r21, 0x35	; 53
 ece:	45 52       	subi	r20, 0x25	; 37
 ed0:	52 4f       	sbci	r21, 0xF2	; 242
 ed2:	57 36       	cpi	r21, 0x67	; 103
 ed4:	30 00       	.word	0x0030	; ????
 ed6:	55 53       	subi	r21, 0x35	; 53
 ed8:	45 52       	subi	r20, 0x25	; 37
 eda:	52 4f       	sbci	r21, 0xF2	; 242
 edc:	57 36       	cpi	r21, 0x67	; 103
 ede:	31 00       	.word	0x0031	; ????
 ee0:	55 53       	subi	r21, 0x35	; 53
 ee2:	45 52       	subi	r20, 0x25	; 37
 ee4:	52 4f       	sbci	r21, 0xF2	; 242
 ee6:	57 36       	cpi	r21, 0x67	; 103
 ee8:	32 00       	.word	0x0032	; ????
 eea:	55 53       	subi	r21, 0x35	; 53
 eec:	45 52       	subi	r20, 0x25	; 37
 eee:	52 4f       	sbci	r21, 0xF2	; 242
 ef0:	57 36       	cpi	r21, 0x67	; 103
 ef2:	33 00       	.word	0x0033	; ????
 ef4:	44 49       	sbci	r20, 0x94	; 148
 ef6:	52 00       	.word	0x0052	; ????
 ef8:	49 4e       	sbci	r20, 0xE9	; 233
 efa:	00 49       	sbci	r16, 0x90	; 144
 efc:	4e 54       	subi	r20, 0x4E	; 78
 efe:	46 4c       	sbci	r20, 0xC6	; 198
 f00:	41 47       	sbci	r20, 0x71	; 113
 f02:	53 00       	.word	0x0053	; ????
 f04:	4f 55       	subi	r20, 0x5F	; 95
 f06:	54 00       	.word	0x0054	; ????
 f08:	44 49       	sbci	r20, 0x94	; 148
 f0a:	52 00       	.word	0x0052	; ????
 f0c:	49 4e       	sbci	r20, 0xE9	; 233
 f0e:	00 49       	sbci	r16, 0x90	; 144
 f10:	4e 54       	subi	r20, 0x4E	; 78
 f12:	46 4c       	sbci	r20, 0xC6	; 198
 f14:	41 47       	sbci	r20, 0x71	; 113
 f16:	53 00       	.word	0x0053	; ????
 f18:	4f 55       	subi	r20, 0x5F	; 95
 f1a:	54 00       	.word	0x0054	; ????
 f1c:	44 49       	sbci	r20, 0x94	; 148
 f1e:	52 00       	.word	0x0052	; ????
 f20:	49 4e       	sbci	r20, 0xE9	; 233
 f22:	00 49       	sbci	r16, 0x90	; 144
 f24:	4e 54       	subi	r20, 0x4E	; 78
 f26:	46 4c       	sbci	r20, 0xC6	; 198
 f28:	41 47       	sbci	r20, 0x71	; 113
 f2a:	53 00       	.word	0x0053	; ????
 f2c:	4f 55       	subi	r20, 0x5F	; 95
 f2e:	54 00       	.word	0x0054	; ????
 f30:	44 49       	sbci	r20, 0x94	; 148
 f32:	52 00       	.word	0x0052	; ????
 f34:	49 4e       	sbci	r20, 0xE9	; 233
 f36:	00 49       	sbci	r16, 0x90	; 144
 f38:	4e 54       	subi	r20, 0x4E	; 78
 f3a:	46 4c       	sbci	r20, 0xC6	; 198
 f3c:	41 47       	sbci	r20, 0x71	; 113
 f3e:	53 00       	.word	0x0053	; ????
 f40:	4f 55       	subi	r20, 0x5F	; 95
 f42:	54 00       	.word	0x0054	; ????
 f44:	44 49       	sbci	r20, 0x94	; 148
 f46:	52 00       	.word	0x0052	; ????
 f48:	49 4e       	sbci	r20, 0xE9	; 233
 f4a:	00 49       	sbci	r16, 0x90	; 144
 f4c:	4e 54       	subi	r20, 0x4E	; 78
 f4e:	46 4c       	sbci	r20, 0xC6	; 198
 f50:	41 47       	sbci	r20, 0x71	; 113
 f52:	53 00       	.word	0x0053	; ????
 f54:	4f 55       	subi	r20, 0x5F	; 95
 f56:	54 00       	.word	0x0054	; ????
 f58:	44 49       	sbci	r20, 0x94	; 148
 f5a:	52 00       	.word	0x0052	; ????
 f5c:	49 4e       	sbci	r20, 0xE9	; 233
 f5e:	00 49       	sbci	r16, 0x90	; 144
 f60:	4e 54       	subi	r20, 0x4E	; 78
 f62:	46 4c       	sbci	r20, 0xC6	; 198
 f64:	41 47       	sbci	r20, 0x71	; 113
 f66:	53 00       	.word	0x0053	; ????
 f68:	4f 55       	subi	r20, 0x5F	; 95
 f6a:	54 00       	.word	0x0054	; ????
 f6c:	43 54       	subi	r20, 0x43	; 67
 f6e:	52 4c       	sbci	r21, 0xC2	; 194
 f70:	41 00       	.word	0x0041	; ????
 f72:	43 54       	subi	r20, 0x43	; 67
 f74:	52 4c       	sbci	r21, 0xC2	; 194
 f76:	42 00       	.word	0x0042	; ????
 f78:	43 54       	subi	r20, 0x43	; 67
 f7a:	52 4c       	sbci	r21, 0xC2	; 194
 f7c:	41 00       	.word	0x0041	; ????
 f7e:	53 54       	subi	r21, 0x43	; 67
 f80:	41 54       	subi	r20, 0x41	; 65
 f82:	55 53       	subi	r21, 0x35	; 53
	...
