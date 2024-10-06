;; generated with `guild compile-ffi avr0dev/mega4809.ffi'

(define-module (avr0dev mega4809)
  #:use-module (ffi avr0per)
  #:use-module (ffi octbx)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata))

(define (foreign-pointer-search name)
  (let loop ((libs (list #f "mega4809")))
    (cond ((null? libs) (error "no library for ~s" name))
          ((false-if-exception
             (foreign-library-pointer (car libs) name)))
          (else (loop (cdr libs))))))


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
(define-public mega4809_t
  (name-ctype
    'mega4809_t
    (cstruct
      (list `(base ,mcu_t)
            `(clkctrl ,clkctrl_t)
            `(adc0 ,adc_t)
            `(portA ,port_t)
            `(portB ,port_t)
            `(portC ,port_t)
            `(portD ,port_t)
            `(portE ,port_t)
            `(portF ,port_t)
            `(rstctrl ,rstctrl_t)
            `(slpctrl ,slpctrl_t)
            `(syscfg ,syscfg_t)
            `(tca0 ,tca_t)
            `(tcb0 ,tcb_t)
            `(tcb1 ,tcb_t)
            `(tcb2 ,tcb_t)
            `(tcb3 ,tcb_t)
            `(twi0 ,twi_t)
            `(usart0 ,usart_t)
            `(usart1 ,usart_t)
            `(usart2 ,usart_t)
            `(usart3 ,usart_t)
            `(wdt ,wdt_t)
            `(regs ,(carray (cbase 'uint8_t) 32))
            `(prog ,(carray (cbase 'uint16_t) 24576))
            `(data ,(carray (cbase 'uint8_t) 16384))
            `(onio ,(carray (cbase 'uint8_t) 16384))))))
(define-public mega4809_t*
  (name-ctype 'mega4809_t* (cpointer mega4809_t)))
(define-public struct-mega4809
  (name-ctype 'struct-mega4809 mega4809_t))
(define-public struct-mega4809*
  (name-ctype 'struct-mega4809* mega4809_t*))

;; mcu_t *make_mega4809(tmsch_t *);
(define-public make_mega4809
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "make_mega4809")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((lambda (~ret) (make-cdata mcu_t* ~ret))
         ((force ~proc) arg0))))))

;; void mega4809_init(void *_mcu, tmsch_t *tmsch);
(define-public mega4809_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_init")
                        (list '* '*)))))
    (lambda (_mcu tmsch)
      (let ((_mcu (unwrap-pointer _mcu))
            (tmsch (unwrap-pointer tmsch)))
        ((force ~proc) _mcu tmsch)))))

;; void mega4809_fini(void *_mcu);
(define-public mega4809_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_fini")
                        (list '*)))))
    (lambda (_mcu)
      (let ((_mcu (unwrap-pointer _mcu)))
        ((force ~proc) _mcu)))))

;; void mega4809_rt(void *_mcu, int flag);
(define-public mega4809_rt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_rt")
                        (list '* ffi:int)))))
    (lambda (_mcu flag)
      (let ((_mcu (unwrap-pointer _mcu))
            (flag (unwrap-number flag)))
        ((force ~proc) _mcu flag)))))

;; uint8_t mega4809_rd(void *_mcu, int idx);
(define-public mega4809_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "mega4809_rd")
                        (list '* ffi:int)))))
    (lambda (_mcu idx)
      (let ((_mcu (unwrap-pointer _mcu))
            (idx (unwrap-number idx)))
        ((force ~proc) _mcu idx)))))

;; void mega4809_wr(void *_mcu, int idx, uint8_t val);
(define-public mega4809_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (_mcu idx val)
      (let ((_mcu (unwrap-pointer _mcu))
            (idx (unwrap-number idx))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) _mcu idx val)))))

;; void mega4809_bs(void *_mcu, int idx, uint8_t val, uint8_t msk);
(define-public mega4809_bs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_bs")
                        (list '* ffi:int ffi:uint8 ffi:uint8)))))
    (lambda (_mcu idx val msk)
      (let ((_mcu (unwrap-pointer _mcu))
            (idx (unwrap-number idx))
            (val (unwrap-number "uint8_t"))
            (msk (unwrap-number "uint8_t")))
        ((force ~proc) _mcu idx val msk)))))

;; void mega4809_ni(void *_mcu, int ivec);
(define-public mega4809_ni
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_ni")
                        (list '* ffi:int)))))
    (lambda (_mcu ivec)
      (let ((_mcu (unwrap-pointer _mcu))
            (ivec (unwrap-number ivec)))
        ((force ~proc) _mcu ivec)))))

;; iopin_t *mega4809_pn(void *_mcu, char *name);
(define-public mega4809_pn
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "mega4809_pn")
                        (list '* '*)))))
    (lambda (_mcu name)
      (let ((_mcu (unwrap-pointer _mcu))
            (name (unwrap-pointer name)))
        ((lambda (~ret) (make-cdata iopin_t* ~ret))
         ((force ~proc) _mcu name))))))

;; void mega4809_ia(void *_mcu, int ivec);
(define-public mega4809_ia
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_ia")
                        (list '* ffi:int)))))
    (lambda (_mcu ivec)
      (let ((_mcu (unwrap-pointer _mcu))
            (ivec (unwrap-number ivec)))
        ((force ~proc) _mcu ivec)))))

;; void mega4809_wdr(void *_mcu);
(define-public mega4809_wdr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mega4809_wdr")
                        (list '*)))))
    (lambda (_mcu)
      (let ((_mcu (unwrap-pointer _mcu)))
        ((force ~proc) _mcu)))))

;; access to enum symbols and #define'd constants:
(define avr0dev-mega4809-symbol-tab '())

(define avr0dev-mega4809-symbol-val
  (lambda (k)
    (or (assq-ref avr0dev-mega4809-symbol-tab k)
        (ffi-avr0per-symbol-val k)
        (ffi-octbx-symbol-val k))))
(export avr0dev-mega4809-symbol-val)

(define (unwrap~enum arg)
  (cond ((number? arg) arg)
        ((symbol? arg) (avr0dev-mega4809-symbol-val arg))
        ((cdata? arg) (cdata-ref arg))
        (else (error "type mismatch"))))

(define avr0dev-mega4809-types
  '((pointer struct . "mega4809") (struct . "mega4809") (pointer . 
    "mega4809_t") "mega4809_t"))
(export avr0dev-mega4809-types)

;; --- last line ---
