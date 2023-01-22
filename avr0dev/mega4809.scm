;; Copyright (C) 2020,2023 Matthew Wette
;;
;; This library is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 2.1 of the License, or (at your option) any later version.

;; generated with `guild compile-ffi avr0dev/mega4809.ffi'

(define-module (avr0dev mega4809)
  #:use-module (avr0per ffi)
  #:use-module (octbx ffi)
  #:use-module (system ffi-help-rt)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (bytestructures guile))

(define avr0dev-mega4809-llibs
  (delay (list (dynamic-link "mega4809"))))


;; typedef struct mega4809 {
;;   mcu_t base;
;;   clkctrl_t clkctrl;
;;   adc_t adc0;
;;   port_t portA;
;;   port_t portB;
;;   port_t portC;
;;   port_t portD;
;;   port_t portE;
;;   port_t portF;
;;   rstctrl_t rstctrl;
;;   slpctrl_t slpctrl;
;;   syscfg_t syscfg;
;;   tca_t tca0;
;;   tcb_t tcb0;
;;   tcb_t tcb1;
;;   tcb_t tcb2;
;;   tcb_t tcb3;
;;   twi_t twi0;
;;   usart_t usart0;
;;   usart_t usart1;
;;   usart_t usart2;
;;   usart_t usart3;
;;   wdt_t wdt;
;;   uint8_t regs[32]; /* reg's not in data space */
;;   uint16_t prog[0x6000]; /* 48KB (24KW) flash */
;;   uint8_t data[0x4000]; /* I/O + 6KB SRAM */
;;   uint8_t onio[0x4000]; /* on I/O event map */
;; } mega4809_t;
(define-public mega4809_t-desc
  (bs:struct
    (list `(base ,mcu_t-desc)
          `(clkctrl ,clkctrl_t-desc)
          `(adc0 ,adc_t-desc)
          `(portA ,port_t-desc)
          `(portB ,port_t-desc)
          `(portC ,port_t-desc)
          `(portD ,port_t-desc)
          `(portE ,port_t-desc)
          `(portF ,port_t-desc)
          `(rstctrl ,rstctrl_t-desc)
          `(slpctrl ,slpctrl_t-desc)
          `(syscfg ,syscfg_t-desc)
          `(tca0 ,tca_t-desc)
          `(tcb0 ,tcb_t-desc)
          `(tcb1 ,tcb_t-desc)
          `(tcb2 ,tcb_t-desc)
          `(tcb3 ,tcb_t-desc)
          `(twi0 ,twi_t-desc)
          `(usart0 ,usart_t-desc)
          `(usart1 ,usart_t-desc)
          `(usart2 ,usart_t-desc)
          `(usart3 ,usart_t-desc)
          `(wdt ,wdt_t-desc)
          `(regs ,(bs:vector 32 uint8))
          `(prog ,(bs:vector 24576 uint16))
          `(data ,(bs:vector 16384 uint8))
          `(onio ,(bs:vector 16384 uint8)))))
(define-fh-compound-type mega4809_t mega4809_t-desc mega4809_t? 
 make-mega4809_t)
(export mega4809_t mega4809_t? make-mega4809_t)
(define-public mega4809_t*-desc
  (fh:pointer mega4809_t-desc))
(define-fh-pointer-type mega4809_t* mega4809_t*-desc mega4809_t*? 
 make-mega4809_t*)
(export mega4809_t* mega4809_t*? make-mega4809_t*)
(fh-ref<=>deref!
  mega4809_t*
  make-mega4809_t*
  mega4809_t
  make-mega4809_t)
(define-public struct-mega4809-desc
  mega4809_t-desc)
(define-fh-compound-type struct-mega4809 struct-mega4809-desc struct-mega4809?
 make-struct-mega4809)
(export struct-mega4809 struct-mega4809? make-struct-mega4809)
(define-public struct-mega4809*-desc
  mega4809_t*-desc)
(define-fh-pointer-type struct-mega4809* struct-mega4809*-desc 
 struct-mega4809*? make-struct-mega4809*)
(export struct-mega4809* struct-mega4809*? make-struct-mega4809*)
(fh-ref<=>deref!
  struct-mega4809*
  make-struct-mega4809*
  struct-mega4809
  make-struct-mega4809)

;; mcu_t *make_mega4809(tmsch_t *);
(define make_mega4809
  (let ((~make_mega4809
          (delay (fh-link-proc
                   ffi-void*
                   "make_mega4809"
                   (list ffi-void*)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap tmsch_t*) arg0)))
        ((fht-wrap mcu_t*)
         ((force ~make_mega4809) ~arg0))))))
(export make_mega4809)

;; void mega4809_init(void *_mcu, tmsch_t *tmsch);
(define mega4809_init
  (let ((~mega4809_init
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_init"
                   (list ffi-void* ffi-void*)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu tmsch)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~tmsch ((fht-unwrap tmsch_t*) tmsch)))
        ((force ~mega4809_init) ~_mcu ~tmsch)))))
(export mega4809_init)

;; void mega4809_fini(void *_mcu);
(define mega4809_fini
  (let ((~mega4809_fini
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_fini"
                   (list ffi-void*)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu)
      (let ((~_mcu (unwrap~pointer _mcu)))
        ((force ~mega4809_fini) ~_mcu)))))
(export mega4809_fini)

;; void mega4809_rt(void *_mcu, int flag);
(define mega4809_rt
  (let ((~mega4809_rt
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_rt"
                   (list ffi-void* ffi:int)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu flag)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~flag (unwrap~fixed flag)))
        ((force ~mega4809_rt) ~_mcu ~flag)))))
(export mega4809_rt)

;; uint8_t mega4809_rd(void *_mcu, int idx);
(define mega4809_rd
  (let ((~mega4809_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "mega4809_rd"
                   (list ffi-void* ffi:int)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu idx)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~idx (unwrap~fixed idx)))
        ((force ~mega4809_rd) ~_mcu ~idx)))))
(export mega4809_rd)

;; void mega4809_wr(void *_mcu, int idx, uint8_t val);
(define mega4809_wr
  (let ((~mega4809_wr
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu idx val)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~idx (unwrap~fixed idx))
            (~val (unwrap~fixed val)))
        ((force ~mega4809_wr) ~_mcu ~idx ~val)))))
(export mega4809_wr)

;; void mega4809_bs(void *_mcu, int idx, uint8_t val, uint8_t msk);
(define mega4809_bs
  (let ((~mega4809_bs
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_bs"
                   (list ffi-void* ffi:int ffi:uint8 ffi:uint8)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu idx val msk)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~idx (unwrap~fixed idx))
            (~val (unwrap~fixed val))
            (~msk (unwrap~fixed msk)))
        ((force ~mega4809_bs) ~_mcu ~idx ~val ~msk)))))
(export mega4809_bs)

;; void mega4809_ni(void *_mcu, int ivec);
(define mega4809_ni
  (let ((~mega4809_ni
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_ni"
                   (list ffi-void* ffi:int)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu ivec)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~ivec (unwrap~fixed ivec)))
        ((force ~mega4809_ni) ~_mcu ~ivec)))))
(export mega4809_ni)

;; iopin_t *mega4809_pn(void *_mcu, char *name);
(define mega4809_pn
  (let ((~mega4809_pn
          (delay (fh-link-proc
                   ffi-void*
                   "mega4809_pn"
                   (list ffi-void* ffi-void*)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu name)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~name (unwrap~pointer name)))
        ((fht-wrap iopin_t*)
         ((force ~mega4809_pn) ~_mcu ~name))))))
(export mega4809_pn)

;; void mega4809_ia(void *_mcu, int ivec);
(define mega4809_ia
  (let ((~mega4809_ia
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_ia"
                   (list ffi-void* ffi:int)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu ivec)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~ivec (unwrap~fixed ivec)))
        ((force ~mega4809_ia) ~_mcu ~ivec)))))
(export mega4809_ia)

;; void mega4809_wdr(void *_mcu);
(define mega4809_wdr
  (let ((~mega4809_wdr
          (delay (fh-link-proc
                   ffi:void
                   "mega4809_wdr"
                   (list ffi-void*)
                   (force avr0dev-mega4809-llibs)))))
    (lambda (_mcu)
      (let ((~_mcu (unwrap~pointer _mcu)))
        ((force ~mega4809_wdr) ~_mcu)))))
(export mega4809_wdr)

;; access to enum symbols and #define'd constants:
(define avr0dev-mega4809-symbol-tab '())

(define avr0dev-mega4809-symbol-val
  (lambda (k)
    (or (assq-ref avr0dev-mega4809-symbol-tab k)
        (avr0per-ffi-symbol-val k)
        (octbx-ffi-symbol-val k))))
(export avr0dev-mega4809-symbol-val)

(define (unwrap-enum obj)
  (cond ((number? obj) obj)
        ((symbol? obj) (avr0dev-mega4809-symbol-val obj))
        ((fh-object? obj) (struct-ref obj 0))
        (else (error "type mismatch"))))

(define avr0dev-mega4809-types
  '((struct . "mega4809") (pointer . "mega4809_t") "mega4809_t"))
(export avr0dev-mega4809-types)

;; --- last line ---
