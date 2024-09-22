;; generated with `guild compile-ffi ffi/avr0per.ffi'

(define-module (ffi avr0per)
  #:use-module (ffi octbx)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata))

(define (foreign-pointer-search name)
  (let loop ((libs (list #f "libavr0per")))
    (cond ((null? libs) (error "no library for ~s" name))
          ((false-if-exception
             (foreign-library-pointer (car libs) name)))
          (else (loop (cdr libs))))))


;; typedef struct adc_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t CTRLB; /* Control B */
;;   uint8_t CTRLC; /* Control C */
;;   uint8_t CTRLD; /* Control D */
;;   uint8_t CTRLE; /* Control E */
;;   uint8_t SAMPCTRL; /* Sample Control */
;;   uint8_t MUXPOS; /* Positive mux input */
;;   uint8_t rez07; /* reserved */
;;   uint8_t COMMAND; /* Command */
;;   uint8_t EVCTRL; /* Event Control */
;;   uint8_t INTCTRL; /* Interrupt Control */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;;   uint8_t DBGCTRL; /* Debug Control */
;;   uint8_t TEMP; /* Temporary Data */
;;   uint8_t rez0E; /* reserved */
;;   uint8_t rez0F; /* reserved */
;;   struct {
;;     uint8_t RESL;
;;     uint8_t RESH;
;;   }; /* ADC Accumulator Result */
;;   struct {
;;     uint8_t WINLTL;
;;     uint8_t WINLTH;
;;   }; /* Window comparator low threshold */
;;   struct {
;;     uint8_t WINHTL;
;;     uint8_t WINHTH;
;;   }; /* Window comparator high threshold */
;;   uint8_t CALIB; /* Calibration */
;; } adc_reg_t;
(define-public adc_reg_t
  (name-ctype
    'adc_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(CTRLB ,(cbase 'uint8_t))
            `(CTRLC ,(cbase 'uint8_t))
            `(CTRLD ,(cbase 'uint8_t))
            `(CTRLE ,(cbase 'uint8_t))
            `(SAMPCTRL ,(cbase 'uint8_t))
            `(MUXPOS ,(cbase 'uint8_t))
            `(rez07 ,(cbase 'uint8_t))
            `(COMMAND ,(cbase 'uint8_t))
            `(EVCTRL ,(cbase 'uint8_t))
            `(INTCTRL ,(cbase 'uint8_t))
            `(INTFLAGS ,(cbase 'uint8_t))
            `(DBGCTRL ,(cbase 'uint8_t))
            `(TEMP ,(cbase 'uint8_t))
            `(rez0E ,(cbase 'uint8_t))
            `(rez0F ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(RESL ,(cbase 'uint8_t))
                         `(RESH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(WINLTL ,(cbase 'uint8_t))
                         `(WINLTH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(WINHTL ,(cbase 'uint8_t))
                         `(WINHTH ,(cbase 'uint8_t)))))
            `(CALIB ,(cbase 'uint8_t))))))
(define-public adc_reg_t*
  (name-ctype 'adc_reg_t* (cpointer adc_reg_t)))
(define-public struct-adc_reg
  (name-ctype 'struct-adc_reg adc_reg_t))
(define-public struct-adc_reg*
  (name-ctype 'struct-adc_reg* adc_reg_t*))

;; typedef struct adc {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   adc_reg_t *reg; /* pointer to registers */
;;   tkevt_t *conv_act; /* conversion done event */
;;   double vref; /* TODO: how to route */
;;   iopin_t *pin[16]; /* mux input */
;;   uint8_t resrdy_vn; /* res ready int vect num  */
;;   uint8_t wcomp_vn; /* ? int vect num  */
;; } adc_t;
(define-public adc_t
  (name-ctype
    'adc_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,adc_reg_t*)
            `(conv_act ,tkevt_t*)
            `(vref ,(cbase 'double))
            `(pin ,(carray iopin_t* 16))
            `(resrdy_vn ,(cbase 'uint8_t))
            `(wcomp_vn ,(cbase 'uint8_t))))))
(define-public adc_t*
  (name-ctype 'adc_t* (cpointer adc_t)))
(define-public struct-adc
  (name-ctype 'struct-adc adc_t))
(define-public struct-adc*
  (name-ctype 'struct-adc* adc_t*))

;; void adc_init(adc_t *, mcu_t *mcu, uint16_t addr);
(define-public adc_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "adc_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void adc_fini(adc_t *);
(define-public adc_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "adc_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t adc_rd(adc_t *, int addr);
(define-public adc_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "adc_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void adc_wr(adc_t *, int addr, uint8_t val);
(define-public adc_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "adc_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct clkctrl_reg {
;;   uint8_t MCLKCTRLA; /* MCLK Control A */
;;   uint8_t MCLKCTRLB; /* MCLK Control B */
;;   uint8_t MCLKLOCK; /* MCLK Lock */
;;   uint8_t MCLKSTATUS; /* MCLK Status */
;;   uint8_t rez04; /* reserved */
;;   uint8_t rez05; /* reserved */
;;   uint8_t rez06; /* reserved */
;;   uint8_t rez07; /* reserved */
;;   uint8_t rez08; /* reserved */
;;   uint8_t rez09; /* reserved */
;;   uint8_t rez0A; /* reserved */
;;   uint8_t rez0B; /* reserved */
;;   uint8_t rez0C; /* reserved */
;;   uint8_t rez0D; /* reserved */
;;   uint8_t rez0E; /* reserved */
;;   uint8_t rez0F; /* reserved */
;;   uint8_t OSC20MCTRLA; /* OSC20M Control A */
;;   uint8_t OSC20MCALIBA; /* OSC20M Calibration A */
;;   uint8_t OSC20MCALIBB; /* OSC20M Calibration B */
;;   uint8_t rez13; /* reserved */
;;   uint8_t rez14; /* reserved */
;;   uint8_t rez15; /* reserved */
;;   uint8_t rez16; /* reserved */
;;   uint8_t rez17; /* reserved */
;;   uint8_t OSC32KCTRLA; /* OSC32K Control A */
;;   uint8_t rez19; /* reserved */
;;   uint8_t rez1A; /* reserved */
;;   uint8_t rez1B; /* reserved */
;;   uint8_t XOSC32KCTRLA; /* XOSC32K Control A */
;; } clkctrl_reg_t;
(define-public clkctrl_reg_t
  (name-ctype
    'clkctrl_reg_t
    (cstruct
      (list `(MCLKCTRLA ,(cbase 'uint8_t))
            `(MCLKCTRLB ,(cbase 'uint8_t))
            `(MCLKLOCK ,(cbase 'uint8_t))
            `(MCLKSTATUS ,(cbase 'uint8_t))
            `(rez04 ,(cbase 'uint8_t))
            `(rez05 ,(cbase 'uint8_t))
            `(rez06 ,(cbase 'uint8_t))
            `(rez07 ,(cbase 'uint8_t))
            `(rez08 ,(cbase 'uint8_t))
            `(rez09 ,(cbase 'uint8_t))
            `(rez0A ,(cbase 'uint8_t))
            `(rez0B ,(cbase 'uint8_t))
            `(rez0C ,(cbase 'uint8_t))
            `(rez0D ,(cbase 'uint8_t))
            `(rez0E ,(cbase 'uint8_t))
            `(rez0F ,(cbase 'uint8_t))
            `(OSC20MCTRLA ,(cbase 'uint8_t))
            `(OSC20MCALIBA ,(cbase 'uint8_t))
            `(OSC20MCALIBB ,(cbase 'uint8_t))
            `(rez13 ,(cbase 'uint8_t))
            `(rez14 ,(cbase 'uint8_t))
            `(rez15 ,(cbase 'uint8_t))
            `(rez16 ,(cbase 'uint8_t))
            `(rez17 ,(cbase 'uint8_t))
            `(OSC32KCTRLA ,(cbase 'uint8_t))
            `(rez19 ,(cbase 'uint8_t))
            `(rez1A ,(cbase 'uint8_t))
            `(rez1B ,(cbase 'uint8_t))
            `(XOSC32KCTRLA ,(cbase 'uint8_t))))))
(define-public clkctrl_reg_t*
  (name-ctype
    'clkctrl_reg_t*
    (cpointer clkctrl_reg_t)))
(define-public struct-clkctrl_reg
  (name-ctype 'struct-clkctrl_reg clkctrl_reg_t))
(define-public struct-clkctrl_reg*
  (name-ctype 'struct-clkctrl_reg* clkctrl_reg_t*))

;; typedef struct clkctrl {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   clkctrl_reg_t *reg; /* pointer to registers */
;;   tmevt_t *settled_act; /* clock settled */
;; } clkctrl_t;
(define-public clkctrl_t
  (name-ctype
    'clkctrl_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,clkctrl_reg_t*)
            `(settled_act ,tmevt_t*)))))
(define-public clkctrl_t*
  (name-ctype 'clkctrl_t* (cpointer clkctrl_t)))
(define-public struct-clkctrl
  (name-ctype 'struct-clkctrl clkctrl_t))
(define-public struct-clkctrl*
  (name-ctype 'struct-clkctrl* clkctrl_t*))

;; void clkctrl_init(clkctrl_t *, mcu_t *mcu, uint16_t addr);
(define-public clkctrl_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "clkctrl_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void clkctrl_fini(clkctrl_t *);
(define-public clkctrl_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "clkctrl_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t clkctrl_rd(clkctrl_t *, int addr);
(define-public clkctrl_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "clkctrl_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void clkctrl_wr(clkctrl_t *, int addr, uint8_t val);
(define-public clkctrl_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "clkctrl_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct port_reg {
;;   uint8_t DIR; /* Data Direction */
;;   uint8_t DIRSET; /* Data Direction Set */
;;   uint8_t DIRCLR; /* Data Direction Clear */
;;   uint8_t DIRTGL; /* Data Direction Toggle */
;;   uint8_t OUT; /* Output Value */
;;   uint8_t OUTSET; /* Output Value Set */
;;   uint8_t OUTCLR; /* Output Value Clear */
;;   uint8_t OUTTGL; /* Output Value Toggle */
;;   uint8_t IN; /* Input Value */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;;   uint8_t PORTCTRL; /* Port Control */
;;   uint8_t rez0B; /* reserved */
;;   uint8_t rez0C; /* reserved */
;;   uint8_t rez0D; /* reserved */
;;   uint8_t rez0E; /* reserved */
;;   uint8_t rez0F; /* reserved */
;;   uint8_t PIN0CTRL; /* Pin 0 Control */
;;   uint8_t PIN1CTRL; /* Pin 1 Control */
;;   uint8_t PIN2CTRL; /* Pin 2 Control */
;;   uint8_t PIN3CTRL; /* Pin 3 Control */
;;   uint8_t PIN4CTRL; /* Pin 4 Control */
;;   uint8_t PIN5CTRL; /* Pin 5 Control */
;;   uint8_t PIN6CTRL; /* Pin 6 Control */
;;   uint8_t PIN7CTRL; /* Pin 7 Control */
;; } port_reg_t;
(define-public port_reg_t
  (name-ctype
    'port_reg_t
    (cstruct
      (list `(DIR ,(cbase 'uint8_t))
            `(DIRSET ,(cbase 'uint8_t))
            `(DIRCLR ,(cbase 'uint8_t))
            `(DIRTGL ,(cbase 'uint8_t))
            `(OUT ,(cbase 'uint8_t))
            `(OUTSET ,(cbase 'uint8_t))
            `(OUTCLR ,(cbase 'uint8_t))
            `(OUTTGL ,(cbase 'uint8_t))
            `(IN ,(cbase 'uint8_t))
            `(INTFLAGS ,(cbase 'uint8_t))
            `(PORTCTRL ,(cbase 'uint8_t))
            `(rez0B ,(cbase 'uint8_t))
            `(rez0C ,(cbase 'uint8_t))
            `(rez0D ,(cbase 'uint8_t))
            `(rez0E ,(cbase 'uint8_t))
            `(rez0F ,(cbase 'uint8_t))
            `(PIN0CTRL ,(cbase 'uint8_t))
            `(PIN1CTRL ,(cbase 'uint8_t))
            `(PIN2CTRL ,(cbase 'uint8_t))
            `(PIN3CTRL ,(cbase 'uint8_t))
            `(PIN4CTRL ,(cbase 'uint8_t))
            `(PIN5CTRL ,(cbase 'uint8_t))
            `(PIN6CTRL ,(cbase 'uint8_t))
            `(PIN7CTRL ,(cbase 'uint8_t))))))
(define-public port_reg_t*
  (name-ctype 'port_reg_t* (cpointer port_reg_t)))
(define-public struct-port_reg
  (name-ctype 'struct-port_reg port_reg_t))
(define-public struct-port_reg*
  (name-ctype 'struct-port_reg* port_reg_t*))

;; typedef struct port {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   port_reg_t *reg; /* pointer to registers */
;;   char name; /* \"A\" etc */
;;   iopin_t pin[8];
;;   uint8_t perovr; /* peripheral overrides */
;;   uint8_t port_vn; /* PORT_vect_num */
;; } port_t;
(define-public port_t
  (name-ctype
    'port_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,port_reg_t*)
            `(name ,(cbase 'char))
            `(pin ,(carray iopin_t 8))
            `(perovr ,(cbase 'uint8_t))
            `(port_vn ,(cbase 'uint8_t))))))
(define-public port_t*
  (name-ctype 'port_t* (cpointer port_t)))
(define-public struct-port
  (name-ctype 'struct-port port_t))
(define-public struct-port*
  (name-ctype 'struct-port* port_t*))

;; void port_init(port_t *, mcu_t *mcu, uint16_t addr);
(define-public port_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "port_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void port_fini(port_t *);
(define-public port_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "port_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t port_rd(port_t *, int addr);
(define-public port_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "port_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void port_wr(port_t *, int addr, uint8_t val);
(define-public port_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "port_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct rstctrl_reg {
;;   uint8_t RSTFR; /* Reset Flags */
;;   uint8_t SWRR; /* Software Reset */
;; } rstctrl_reg_t;
(define-public rstctrl_reg_t
  (name-ctype
    'rstctrl_reg_t
    (cstruct
      (list `(RSTFR ,(cbase 'uint8_t))
            `(SWRR ,(cbase 'uint8_t))))))
(define-public rstctrl_reg_t*
  (name-ctype
    'rstctrl_reg_t*
    (cpointer rstctrl_reg_t)))
(define-public struct-rstctrl_reg
  (name-ctype 'struct-rstctrl_reg rstctrl_reg_t))
(define-public struct-rstctrl_reg*
  (name-ctype 'struct-rstctrl_reg* rstctrl_reg_t*))

;; typedef struct rstctrl {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   rstctrl_reg_t *reg; /* pointer to registers */
;; } rstctrl_t;
(define-public rstctrl_t
  (name-ctype
    'rstctrl_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,rstctrl_reg_t*)))))
(define-public rstctrl_t*
  (name-ctype 'rstctrl_t* (cpointer rstctrl_t)))
(define-public struct-rstctrl
  (name-ctype 'struct-rstctrl rstctrl_t))
(define-public struct-rstctrl*
  (name-ctype 'struct-rstctrl* rstctrl_t*))

;; void rstctrl_init(rstctrl_t *, mcu_t *mcu, uint16_t addr);
(define-public rstctrl_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rstctrl_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void rstctrl_fini(rstctrl_t *);
(define-public rstctrl_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rstctrl_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t rstctrl_rd(rstctrl_t *, int addr);
(define-public rstctrl_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "rstctrl_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void rstctrl_wr(rstctrl_t *, int addr, uint8_t val);
(define-public rstctrl_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rstctrl_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct slpctrl_reg {
;;   uint8_t CTRLA; /* Control */
;; } slpctrl_reg_t;
(define-public slpctrl_reg_t
  (name-ctype
    'slpctrl_reg_t
    (cstruct (list `(CTRLA ,(cbase 'uint8_t))))))
(define-public slpctrl_reg_t*
  (name-ctype
    'slpctrl_reg_t*
    (cpointer slpctrl_reg_t)))
(define-public struct-slpctrl_reg
  (name-ctype 'struct-slpctrl_reg slpctrl_reg_t))
(define-public struct-slpctrl_reg*
  (name-ctype 'struct-slpctrl_reg* slpctrl_reg_t*))

;; typedef struct slpctrl {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   slpctrl_reg_t *reg; /* pointer to registers */
;; } slpctrl_t;
(define-public slpctrl_t
  (name-ctype
    'slpctrl_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,slpctrl_reg_t*)))))
(define-public slpctrl_t*
  (name-ctype 'slpctrl_t* (cpointer slpctrl_t)))
(define-public struct-slpctrl
  (name-ctype 'struct-slpctrl slpctrl_t))
(define-public struct-slpctrl*
  (name-ctype 'struct-slpctrl* slpctrl_t*))

;; void slpctrl_init(slpctrl_t *, mcu_t *mcu, uint16_t addr);
(define-public slpctrl_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "slpctrl_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void slpctrl_fini(slpctrl_t *);
(define-public slpctrl_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "slpctrl_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t slpctrl_rd(slpctrl_t *, int addr);
(define-public slpctrl_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "slpctrl_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void slpctrl_wr(slpctrl_t *, int addr, uint8_t val);
(define-public slpctrl_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "slpctrl_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct syscfg_reg {
;;   uint8_t rez00; /* reserved */
;;   uint8_t REVID; /* Revision ID */
;;   uint8_t EXTBRK; /* External Break */
;;   uint8_t rez03; /* reserved */
;;   uint8_t rez04; /* reserved */
;;   uint8_t rez05; /* reserved */
;;   uint8_t rez06; /* reserved */
;;   uint8_t rez07; /* reserved */
;;   uint8_t rez08; /* reserved */
;;   uint8_t rez09; /* reserved */
;;   uint8_t rez0A; /* reserved */
;;   uint8_t rez0B; /* reserved */
;;   uint8_t rez0C; /* reserved */
;;   uint8_t rez0D; /* reserved */
;;   uint8_t rez0E; /* reserved */
;;   uint8_t rez0F; /* reserved */
;;   uint8_t rez10; /* reserved */
;;   uint8_t rez11; /* reserved */
;;   uint8_t rez12; /* reserved */
;;   uint8_t rez13; /* reserved */
;;   uint8_t rez14; /* reserved */
;;   uint8_t rez15; /* reserved */
;;   uint8_t rez16; /* reserved */
;;   uint8_t rez17; /* reserved */
;;   uint8_t OCDM; /* OCD Message Register */
;;   uint8_t OCDMS; /* OCD Message Status */
;; } syscfg_reg_t;
(define-public syscfg_reg_t
  (name-ctype
    'syscfg_reg_t
    (cstruct
      (list `(rez00 ,(cbase 'uint8_t))
            `(REVID ,(cbase 'uint8_t))
            `(EXTBRK ,(cbase 'uint8_t))
            `(rez03 ,(cbase 'uint8_t))
            `(rez04 ,(cbase 'uint8_t))
            `(rez05 ,(cbase 'uint8_t))
            `(rez06 ,(cbase 'uint8_t))
            `(rez07 ,(cbase 'uint8_t))
            `(rez08 ,(cbase 'uint8_t))
            `(rez09 ,(cbase 'uint8_t))
            `(rez0A ,(cbase 'uint8_t))
            `(rez0B ,(cbase 'uint8_t))
            `(rez0C ,(cbase 'uint8_t))
            `(rez0D ,(cbase 'uint8_t))
            `(rez0E ,(cbase 'uint8_t))
            `(rez0F ,(cbase 'uint8_t))
            `(rez10 ,(cbase 'uint8_t))
            `(rez11 ,(cbase 'uint8_t))
            `(rez12 ,(cbase 'uint8_t))
            `(rez13 ,(cbase 'uint8_t))
            `(rez14 ,(cbase 'uint8_t))
            `(rez15 ,(cbase 'uint8_t))
            `(rez16 ,(cbase 'uint8_t))
            `(rez17 ,(cbase 'uint8_t))
            `(OCDM ,(cbase 'uint8_t))
            `(OCDMS ,(cbase 'uint8_t))))))
(define-public syscfg_reg_t*
  (name-ctype
    'syscfg_reg_t*
    (cpointer syscfg_reg_t)))
(define-public struct-syscfg_reg
  (name-ctype 'struct-syscfg_reg syscfg_reg_t))
(define-public struct-syscfg_reg*
  (name-ctype 'struct-syscfg_reg* syscfg_reg_t*))

;; typedef struct syscfg {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   syscfg_reg_t *reg; /* pointer to registers */
;; } syscfg_t;
(define-public syscfg_t
  (name-ctype
    'syscfg_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,syscfg_reg_t*)))))
(define-public syscfg_t*
  (name-ctype 'syscfg_t* (cpointer syscfg_t)))
(define-public struct-syscfg
  (name-ctype 'struct-syscfg syscfg_t))
(define-public struct-syscfg*
  (name-ctype 'struct-syscfg* syscfg_t*))

;; void syscfg_init(syscfg_t *, mcu_t *mcu, uint16_t addr);
(define-public syscfg_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "syscfg_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void syscfg_fini(syscfg_t *);
(define-public syscfg_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "syscfg_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t syscfg_rd(syscfg_t *, int addr);
(define-public syscfg_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "syscfg_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void syscfg_wr(syscfg_t *, int addr, uint8_t val);
(define-public syscfg_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "syscfg_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct tca_single_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t CTRLB; /* Control B */
;;   uint8_t CTRLC; /* Control C */
;;   uint8_t CTRLD; /* Control D */
;;   uint8_t CTRLE; /* Control E (was CLR/SET) */
;;   uint8_t CTRLE_X; /* unused by sim */
;;   uint8_t CTRLF; /* Control F (was CLR/SET) */
;;   uint8_t CTRLF_X; /* unused by sim */
;;   uint8_t rez08; /* reserved */
;;   uint8_t EVCTRL; /* Event Control */
;;   uint8_t INTCTRL; /* Interrupt Control */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;;   uint8_t rez0C; /* reserved */
;;   uint8_t rez0D; /* reserved */
;;   uint8_t DBGCTRL; /* Degbug Control */
;;   uint8_t TEMP; /* Temporary data for 16-bit Access */
;;   uint8_t rez10; /* reserved */
;;   uint8_t rez11; /* reserved */
;;   uint8_t rez12; /* reserved */
;;   uint8_t rez13; /* reserved */
;;   uint8_t rez14; /* reserved */
;;   uint8_t rez15; /* reserved */
;;   uint8_t rez16; /* reserved */
;;   uint8_t rez17; /* reserved */
;;   uint8_t rez18; /* reserved */
;;   uint8_t rez19; /* reserved */
;;   uint8_t rez1A; /* reserved */
;;   uint8_t rez1B; /* reserved */
;;   uint8_t rez1C; /* reserved */
;;   uint8_t rez1D; /* reserved */
;;   uint8_t rez1E; /* reserved */
;;   uint8_t rez1F; /* reserved */
;;   struct {
;;     uint8_t CNTL;
;;     uint8_t CNTH;
;;   }; /* Count */
;;   uint8_t rez22; /* reserved */
;;   uint8_t rez23; /* reserved */
;;   uint8_t rez24; /* reserved */
;;   uint8_t rez25; /* reserved */
;;   struct {
;;     uint8_t PERL;
;;     uint8_t PERH;
;;   }; /* Period */
;;   struct {
;;     uint8_t CMP0L;
;;     uint8_t CMP0H;
;;   }; /* Compare 0 */
;;   struct {
;;     uint8_t CMP1L;
;;     uint8_t CMP1H;
;;   }; /* Compare 1 */
;;   struct {
;;     uint8_t CMP2L;
;;     uint8_t CMP2H;
;;   }; /* Compare 2 */
;;   uint8_t rez2E; /* reserved */
;;   uint8_t rez2F; /* reserved */
;;   uint8_t rez30; /* reserved */
;;   uint8_t rez31; /* reserved */
;;   uint8_t rez32; /* reserved */
;;   uint8_t rez33; /* reserved */
;;   uint8_t rez34; /* reserved */
;;   uint8_t rez35; /* reserved */
;;   struct {
;;     uint8_t PERBUFL;
;;     uint8_t PERBUFH;
;;   }; /* Period Buffer */
;;   struct {
;;     uint8_t CMP0BUFL;
;;     uint8_t CMP0BUFH;
;;   }; /* Compare 0 Buffer */
;;   struct {
;;     uint8_t CMP1BUFL;
;;     uint8_t CMP1BUFH;
;;   }; /* Compare 1 Buffer */
;;   struct {
;;     uint8_t CMP2BUFL;
;;     uint8_t CMP2BUFH;
;;   }; /* Compare 2 Buffer */
;; } tca_single_reg_t;
(define-public tca_single_reg_t
  (name-ctype
    'tca_single_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(CTRLB ,(cbase 'uint8_t))
            `(CTRLC ,(cbase 'uint8_t))
            `(CTRLD ,(cbase 'uint8_t))
            `(CTRLE ,(cbase 'uint8_t))
            `(CTRLE_X ,(cbase 'uint8_t))
            `(CTRLF ,(cbase 'uint8_t))
            `(CTRLF_X ,(cbase 'uint8_t))
            `(rez08 ,(cbase 'uint8_t))
            `(EVCTRL ,(cbase 'uint8_t))
            `(INTCTRL ,(cbase 'uint8_t))
            `(INTFLAGS ,(cbase 'uint8_t))
            `(rez0C ,(cbase 'uint8_t))
            `(rez0D ,(cbase 'uint8_t))
            `(DBGCTRL ,(cbase 'uint8_t))
            `(TEMP ,(cbase 'uint8_t))
            `(rez10 ,(cbase 'uint8_t))
            `(rez11 ,(cbase 'uint8_t))
            `(rez12 ,(cbase 'uint8_t))
            `(rez13 ,(cbase 'uint8_t))
            `(rez14 ,(cbase 'uint8_t))
            `(rez15 ,(cbase 'uint8_t))
            `(rez16 ,(cbase 'uint8_t))
            `(rez17 ,(cbase 'uint8_t))
            `(rez18 ,(cbase 'uint8_t))
            `(rez19 ,(cbase 'uint8_t))
            `(rez1A ,(cbase 'uint8_t))
            `(rez1B ,(cbase 'uint8_t))
            `(rez1C ,(cbase 'uint8_t))
            `(rez1D ,(cbase 'uint8_t))
            `(rez1E ,(cbase 'uint8_t))
            `(rez1F ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(CNTL ,(cbase 'uint8_t))
                         `(CNTH ,(cbase 'uint8_t)))))
            `(rez22 ,(cbase 'uint8_t))
            `(rez23 ,(cbase 'uint8_t))
            `(rez24 ,(cbase 'uint8_t))
            `(rez25 ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(PERL ,(cbase 'uint8_t))
                         `(PERH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CMP0L ,(cbase 'uint8_t))
                         `(CMP0H ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CMP1L ,(cbase 'uint8_t))
                         `(CMP1H ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CMP2L ,(cbase 'uint8_t))
                         `(CMP2H ,(cbase 'uint8_t)))))
            `(rez2E ,(cbase 'uint8_t))
            `(rez2F ,(cbase 'uint8_t))
            `(rez30 ,(cbase 'uint8_t))
            `(rez31 ,(cbase 'uint8_t))
            `(rez32 ,(cbase 'uint8_t))
            `(rez33 ,(cbase 'uint8_t))
            `(rez34 ,(cbase 'uint8_t))
            `(rez35 ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(PERBUFL ,(cbase 'uint8_t))
                         `(PERBUFH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CMP0BUFL ,(cbase 'uint8_t))
                         `(CMP0BUFH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CMP1BUFL ,(cbase 'uint8_t))
                         `(CMP1BUFH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CMP2BUFL ,(cbase 'uint8_t))
                         `(CMP2BUFH ,(cbase 'uint8_t)))))))))
(define-public tca_single_reg_t*
  (name-ctype
    'tca_single_reg_t*
    (cpointer tca_single_reg_t)))
(define-public struct-tca_single_reg
  (name-ctype
    'struct-tca_single_reg
    tca_single_reg_t))
(define-public struct-tca_single_reg*
  (name-ctype
    'struct-tca_single_reg*
    tca_single_reg_t*))

;; typedef struct tca_split_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t CTRLB; /* Control B */
;;   uint8_t CTRLC; /* Control C */
;;   uint8_t CTRLD; /* Control D */
;;   uint8_t CTRLE; /* Control E (was CLR/SET) */
;;   uint8_t CTRLE_X; /* unused by sim */
;;   uint8_t rez06; /* reserved */
;;   uint8_t rez07; /* reserved */
;;   uint8_t rez08; /* reserved */
;;   uint8_t rez09; /* reserved */
;;   uint8_t INTCTRL; /* Interrupt Control */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;;   uint8_t rez0C; /* reserved */
;;   uint8_t rez0D; /* reserved */
;;   uint8_t DBGCTRL; /* Degbug Control */
;;   uint8_t rez0F; /* reserved */
;;   uint8_t rez10; /* reserved */
;;   uint8_t rez11; /* reserved */
;;   uint8_t rez12; /* reserved */
;;   uint8_t rez13; /* reserved */
;;   uint8_t rez14; /* reserved */
;;   uint8_t rez15; /* reserved */
;;   uint8_t rez16; /* reserved */
;;   uint8_t rez17; /* reserved */
;;   uint8_t rez18; /* reserved */
;;   uint8_t rez19; /* reserved */
;;   uint8_t rez1A; /* reserved */
;;   uint8_t rez1B; /* reserved */
;;   uint8_t rez1C; /* reserved */
;;   uint8_t rez1D; /* reserved */
;;   uint8_t rez1E; /* reserved */
;;   uint8_t rez1F; /* reserved */
;;   uint8_t LCNT; /* Low Count */
;;   uint8_t HCNT; /* High Count */
;;   uint8_t rez22; /* reserved */
;;   uint8_t rez23; /* reserved */
;;   uint8_t rez24; /* reserved */
;;   uint8_t rez25; /* reserved */
;;   uint8_t LPER; /* Low Period */
;;   uint8_t HPER; /* High Period */
;;   uint8_t LCMP0; /* Low Compare */
;;   uint8_t HCMP0; /* High Compare */
;;   uint8_t LCMP1; /* Low Compare */
;;   uint8_t HCMP1; /* High Compare */
;;   uint8_t LCMP2; /* Low Compare */
;;   uint8_t HCMP2; /* High Compare */
;; } tca_split_reg_t;
(define-public tca_split_reg_t
  (name-ctype
    'tca_split_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(CTRLB ,(cbase 'uint8_t))
            `(CTRLC ,(cbase 'uint8_t))
            `(CTRLD ,(cbase 'uint8_t))
            `(CTRLE ,(cbase 'uint8_t))
            `(CTRLE_X ,(cbase 'uint8_t))
            `(rez06 ,(cbase 'uint8_t))
            `(rez07 ,(cbase 'uint8_t))
            `(rez08 ,(cbase 'uint8_t))
            `(rez09 ,(cbase 'uint8_t))
            `(INTCTRL ,(cbase 'uint8_t))
            `(INTFLAGS ,(cbase 'uint8_t))
            `(rez0C ,(cbase 'uint8_t))
            `(rez0D ,(cbase 'uint8_t))
            `(DBGCTRL ,(cbase 'uint8_t))
            `(rez0F ,(cbase 'uint8_t))
            `(rez10 ,(cbase 'uint8_t))
            `(rez11 ,(cbase 'uint8_t))
            `(rez12 ,(cbase 'uint8_t))
            `(rez13 ,(cbase 'uint8_t))
            `(rez14 ,(cbase 'uint8_t))
            `(rez15 ,(cbase 'uint8_t))
            `(rez16 ,(cbase 'uint8_t))
            `(rez17 ,(cbase 'uint8_t))
            `(rez18 ,(cbase 'uint8_t))
            `(rez19 ,(cbase 'uint8_t))
            `(rez1A ,(cbase 'uint8_t))
            `(rez1B ,(cbase 'uint8_t))
            `(rez1C ,(cbase 'uint8_t))
            `(rez1D ,(cbase 'uint8_t))
            `(rez1E ,(cbase 'uint8_t))
            `(rez1F ,(cbase 'uint8_t))
            `(LCNT ,(cbase 'uint8_t))
            `(HCNT ,(cbase 'uint8_t))
            `(rez22 ,(cbase 'uint8_t))
            `(rez23 ,(cbase 'uint8_t))
            `(rez24 ,(cbase 'uint8_t))
            `(rez25 ,(cbase 'uint8_t))
            `(LPER ,(cbase 'uint8_t))
            `(HPER ,(cbase 'uint8_t))
            `(LCMP0 ,(cbase 'uint8_t))
            `(HCMP0 ,(cbase 'uint8_t))
            `(LCMP1 ,(cbase 'uint8_t))
            `(HCMP1 ,(cbase 'uint8_t))
            `(LCMP2 ,(cbase 'uint8_t))
            `(HCMP2 ,(cbase 'uint8_t))))))
(define-public tca_split_reg_t*
  (name-ctype
    'tca_split_reg_t*
    (cpointer tca_split_reg_t)))
(define-public struct-tca_split_reg
  (name-ctype
    'struct-tca_split_reg
    tca_split_reg_t))
(define-public struct-tca_split_reg*
  (name-ctype
    'struct-tca_split_reg*
    tca_split_reg_t*))

;; typedef union tca_reg {
;;   tca_single_reg_t SINGLE; /*  */
;;   tca_split_reg_t SPLIT; /*  */
;; } tca_reg_t;
(define-public tca_reg_t
  (name-ctype
    'tca_reg_t
    (cunion
      (list `(SINGLE ,tca_single_reg_t)
            `(SPLIT ,tca_split_reg_t)))))
(define-public tca_reg_t*
  (name-ctype 'tca_reg_t* (cpointer tca_reg_t)))
(define-public union-tca_reg
  (name-ctype 'union-tca_reg tca_reg_t))
(define-public union-tca_reg*
  (name-ctype 'union-tca_reg* tca_reg_t*))

;; typedef struct tca {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   tca_reg_t *reg; /* pointer to registers */
;;   clktick_t bot_at; /* count at last bottom */
;;   tkevt_t *bot_act; /* bottom action */
;;   tkevt_t *top_act; /* capture/compare action */
;;   tkevt_t *cmp0_act; /* capture/compare action */
;;   tkevt_t *cmp1_act; /* capture/compare action */
;;   tkevt_t *cmp2_act; /* capture/compare action */
;;   iopin_t *pin_out; /* todo */
;;   uint8_t ovf_vn; /* OVF vect num */
;;   uint8_t lunf_vn; /* LUNF vect num */
;;   uint8_t hunf_vn; /* HUNF vect num */
;;   uint8_t lcmp0_vn; /* LCMP0 vect num */
;;   uint8_t lcmp1_vn; /* LCMP1 vect num */
;;   uint8_t lcmp2_vn; /* LCMP2 vect num */
;;   uint8_t cmp0_vn; /* CMP0 vect num */
;;   uint8_t cmp1_vn; /* CMP1 vect num */
;;   uint8_t cmp2_vn; /* CMP2 vect num */
;; } tca_t;
(define-public tca_t
  (name-ctype
    'tca_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,tca_reg_t*)
            `(bot_at ,(cbase 'uint64_t))
            `(bot_act ,tkevt_t*)
            `(top_act ,tkevt_t*)
            `(cmp0_act ,tkevt_t*)
            `(cmp1_act ,tkevt_t*)
            `(cmp2_act ,tkevt_t*)
            `(pin_out ,iopin_t*)
            `(ovf_vn ,(cbase 'uint8_t))
            `(lunf_vn ,(cbase 'uint8_t))
            `(hunf_vn ,(cbase 'uint8_t))
            `(lcmp0_vn ,(cbase 'uint8_t))
            `(lcmp1_vn ,(cbase 'uint8_t))
            `(lcmp2_vn ,(cbase 'uint8_t))
            `(cmp0_vn ,(cbase 'uint8_t))
            `(cmp1_vn ,(cbase 'uint8_t))
            `(cmp2_vn ,(cbase 'uint8_t))))))
(define-public tca_t*
  (name-ctype 'tca_t* (cpointer tca_t)))
(define-public struct-tca
  (name-ctype 'struct-tca tca_t))
(define-public struct-tca*
  (name-ctype 'struct-tca* tca_t*))

;; void tca_init(tca_t *, mcu_t *mcu, uint16_t addr);
(define-public tca_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tca_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void tca_fini(tca_t *);
(define-public tca_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tca_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t tca_rd(tca_t *, int addr);
(define-public tca_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "tca_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void tca_wr(tca_t *, int addr, uint8_t val);
(define-public tca_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tca_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct tcb_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t CTRLB; /* Control Register B */
;;   uint8_t rez02; /* reserved */
;;   uint8_t rez03; /* reserved */
;;   uint8_t EVCTRL; /* Event Control */
;;   uint8_t INTCTRL; /* Interrupt Control */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;;   uint8_t STATUS; /* Status */
;;   uint8_t DBGCTRL; /* Debug Control */
;;   uint8_t TEMP; /* Temporary Value */
;;   struct {
;;     uint8_t CNTL;
;;     uint8_t CNTH;
;;   }; /* Count */
;;   struct {
;;     uint8_t CCMPL;
;;     uint8_t CCMPH;
;;   }; /* Compare or Capture */
;; } tcb_reg_t;
(define-public tcb_reg_t
  (name-ctype
    'tcb_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(CTRLB ,(cbase 'uint8_t))
            `(rez02 ,(cbase 'uint8_t))
            `(rez03 ,(cbase 'uint8_t))
            `(EVCTRL ,(cbase 'uint8_t))
            `(INTCTRL ,(cbase 'uint8_t))
            `(INTFLAGS ,(cbase 'uint8_t))
            `(STATUS ,(cbase 'uint8_t))
            `(DBGCTRL ,(cbase 'uint8_t))
            `(TEMP ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(CNTL ,(cbase 'uint8_t))
                         `(CNTH ,(cbase 'uint8_t)))))
            `(_ ,(cstruct
                   (list `(CCMPL ,(cbase 'uint8_t))
                         `(CCMPH ,(cbase 'uint8_t)))))))))
(define-public tcb_reg_t*
  (name-ctype 'tcb_reg_t* (cpointer tcb_reg_t)))
(define-public struct-tcb_reg
  (name-ctype 'struct-tcb_reg tcb_reg_t))
(define-public struct-tcb_reg*
  (name-ctype 'struct-tcb_reg* tcb_reg_t*))

;; typedef struct tcb {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   tcb_reg_t *reg; /* pointer to registers */
;;   uint64_t bot_at; /* count at last bottom */
;;   tkevt_t *bot_act; /* bottom action */
;;   tkevt_t *cmp_act; /* capture/compare action */
;;   iopin_t *pin_out; /* todo */
;;   uint8_t int_vn; /* ISR vect num */
;; } tcb_t;
(define-public tcb_t
  (name-ctype
    'tcb_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,tcb_reg_t*)
            `(bot_at ,(cbase 'uint64_t))
            `(bot_act ,tkevt_t*)
            `(cmp_act ,tkevt_t*)
            `(pin_out ,iopin_t*)
            `(int_vn ,(cbase 'uint8_t))))))
(define-public tcb_t*
  (name-ctype 'tcb_t* (cpointer tcb_t)))
(define-public struct-tcb
  (name-ctype 'struct-tcb tcb_t))
(define-public struct-tcb*
  (name-ctype 'struct-tcb* tcb_t*))

;; void tcb_init(tcb_t *, mcu_t *mcu, uint16_t addr);
(define-public tcb_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tcb_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void tcb_fini(tcb_t *);
(define-public tcb_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tcb_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t tcb_rd(tcb_t *, int addr);
(define-public tcb_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "tcb_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void tcb_wr(tcb_t *, int addr, uint8_t val);
(define-public tcb_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tcb_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct twi_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t DUALCTRL; /* Dual Control */
;;   uint8_t DBGCTRL; /* Debug Control Register */
;;   uint8_t MCTRLA; /* Master Control A */
;;   uint8_t MCTRLB; /* Master Control B */
;;   uint8_t MSTATUS; /* Master Status */
;;   uint8_t MBAUD; /* Master Baurd Rate Control */
;;   uint8_t MADDR; /* Master Address */
;;   uint8_t MDATA; /* Master Data */
;;   uint8_t SCTRLA; /* Slave Control A */
;;   uint8_t SCTRLB; /* Slave Control B */
;;   uint8_t SSTATUS; /* Slave Status */
;;   uint8_t SADDR; /* Slave Address */
;;   uint8_t SDATA; /* Slave Data */
;;   uint8_t SADDRMASK; /* Slave Address Mask */
;; } twi_reg_t;
(define-public twi_reg_t
  (name-ctype
    'twi_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(DUALCTRL ,(cbase 'uint8_t))
            `(DBGCTRL ,(cbase 'uint8_t))
            `(MCTRLA ,(cbase 'uint8_t))
            `(MCTRLB ,(cbase 'uint8_t))
            `(MSTATUS ,(cbase 'uint8_t))
            `(MBAUD ,(cbase 'uint8_t))
            `(MADDR ,(cbase 'uint8_t))
            `(MDATA ,(cbase 'uint8_t))
            `(SCTRLA ,(cbase 'uint8_t))
            `(SCTRLB ,(cbase 'uint8_t))
            `(SSTATUS ,(cbase 'uint8_t))
            `(SADDR ,(cbase 'uint8_t))
            `(SDATA ,(cbase 'uint8_t))
            `(SADDRMASK ,(cbase 'uint8_t))))))
(define-public twi_reg_t*
  (name-ctype 'twi_reg_t* (cpointer twi_reg_t)))
(define-public struct-twi_reg
  (name-ctype 'struct-twi_reg twi_reg_t))
(define-public struct-twi_reg*
  (name-ctype 'struct-twi_reg* twi_reg_t*))

;; typedef struct twi_impl {
;;   iopin_t *sda_pin; /* SCL pin */
;;   iopin_t *scl_pin; /* SCL pin */
;;   tkevt_t *evt; /* event */
;;   uint8_t xst; /* transaction state */
;;   uint8_t cnt; /* count */
;;   uint8_t ost; /* observer state */
;;   uint16_t t_hi; /* t_high (clk ticks) */
;;   uint16_t t_lo; /* t_high (clk ticks) */
;;   uint16_t t_su; /* t_setup (clk ticks) unused */
;; } twi_impl_t;
(define-public twi_impl_t
  (name-ctype
    'twi_impl_t
    (cstruct
      (list `(sda_pin ,iopin_t*)
            `(scl_pin ,iopin_t*)
            `(evt ,tkevt_t*)
            `(xst ,(cbase 'uint8_t))
            `(cnt ,(cbase 'uint8_t))
            `(ost ,(cbase 'uint8_t))
            `(t_hi ,(cbase 'uint16_t))
            `(t_lo ,(cbase 'uint16_t))
            `(t_su ,(cbase 'uint16_t))))))
(define-public twi_impl_t*
  (name-ctype 'twi_impl_t* (cpointer twi_impl_t)))
(define-public struct-twi_impl
  (name-ctype 'struct-twi_impl twi_impl_t))
(define-public struct-twi_impl*
  (name-ctype 'struct-twi_impl* twi_impl_t*))

;; typedef struct twi {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   twi_reg_t *reg; /* pointer to registers */
;;   uint8_t twis_vn; /* TWIS ISR vect num */
;;   uint8_t twim_vn; /* TWIM ISR vect num */
;;   twi_impl_t m, s; /* master, slave twi mach */
;; } twi_t;
(define-public twi_t
  (name-ctype
    'twi_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,twi_reg_t*)
            `(twis_vn ,(cbase 'uint8_t))
            `(twim_vn ,(cbase 'uint8_t))
            `(m ,twi_impl_t)
            `(s ,twi_impl_t)))))
(define-public twi_t*
  (name-ctype 'twi_t* (cpointer twi_t)))
(define-public struct-twi
  (name-ctype 'struct-twi twi_t))
(define-public struct-twi*
  (name-ctype 'struct-twi* twi_t*))

;; void twi_init(twi_t *, mcu_t *mcu, uint16_t addr);
(define-public twi_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "twi_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void twi_fini(twi_t *);
(define-public twi_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "twi_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t twi_rd(twi_t *, int addr);
(define-public twi_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "twi_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void twi_wr(twi_t *, int addr, uint8_t val);
(define-public twi_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "twi_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct usart_reg {
;;   uint8_t RXDATAL; /* Receive Data Low Byte */
;;   uint8_t RXDATAH; /* Receive Data High Byte */
;;   uint8_t TXDATAL; /* Transmit Data Low Byte */
;;   uint8_t TXDATAH; /* Transmit Data High Byte */
;;   uint8_t STATUS; /* Status */
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t CTRLB; /* Control B */
;;   uint8_t CTRLC; /* Control C */
;;   struct {
;;     uint8_t BAUDL;
;;     uint8_t BAUDH;
;;   }; /* Baud Rate */
;;   uint8_t CTRLD; /* Control D */
;;   uint8_t DBGCTRL; /* Debug Control */
;;   uint8_t EVCTRL; /* Event Control */
;;   uint8_t TXPLCTRL; /* IRCOM Transmitter Pulse Length Control */
;;   uint8_t RXPLCTRL; /* IRCOM Receiver Pulse Length Control */
;; } usart_reg_t;
(define-public usart_reg_t
  (name-ctype
    'usart_reg_t
    (cstruct
      (list `(RXDATAL ,(cbase 'uint8_t))
            `(RXDATAH ,(cbase 'uint8_t))
            `(TXDATAL ,(cbase 'uint8_t))
            `(TXDATAH ,(cbase 'uint8_t))
            `(STATUS ,(cbase 'uint8_t))
            `(CTRLA ,(cbase 'uint8_t))
            `(CTRLB ,(cbase 'uint8_t))
            `(CTRLC ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(BAUDL ,(cbase 'uint8_t))
                         `(BAUDH ,(cbase 'uint8_t)))))
            `(CTRLD ,(cbase 'uint8_t))
            `(DBGCTRL ,(cbase 'uint8_t))
            `(EVCTRL ,(cbase 'uint8_t))
            `(TXPLCTRL ,(cbase 'uint8_t))
            `(RXPLCTRL ,(cbase 'uint8_t))))))
(define-public usart_reg_t*
  (name-ctype 'usart_reg_t* (cpointer usart_reg_t)))
(define-public struct-usart_reg
  (name-ctype 'struct-usart_reg usart_reg_t))
(define-public struct-usart_reg*
  (name-ctype 'struct-usart_reg* usart_reg_t*))

;; typedef struct usart {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   usart_reg_t *reg; /* pointer to registers */
;;   uint8_t rxc_vn; /*  */
;;   uint8_t dre_vn; /*  */
;;   uint8_t txc_vn; /*  */
;; } usart_t;
(define-public usart_t
  (name-ctype
    'usart_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,usart_reg_t*)
            `(rxc_vn ,(cbase 'uint8_t))
            `(dre_vn ,(cbase 'uint8_t))
            `(txc_vn ,(cbase 'uint8_t))))))
(define-public usart_t*
  (name-ctype 'usart_t* (cpointer usart_t)))
(define-public struct-usart
  (name-ctype 'struct-usart usart_t))
(define-public struct-usart*
  (name-ctype 'struct-usart* usart_t*))

;; void usart_init(usart_t *, mcu_t *mcu, uint16_t addr);
(define-public usart_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "usart_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void usart_fini(usart_t *);
(define-public usart_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "usart_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t usart_rd(usart_t *, int addr);
(define-public usart_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "usart_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void usart_wr(usart_t *, int addr, uint8_t val);
(define-public usart_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "usart_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct vport_reg {
;;   uint8_t DIR; /* Data Direction */
;;   uint8_t OUT; /* Output Value */
;;   uint8_t IN; /* Input Value */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;; } vport_reg_t;
(define-public vport_reg_t
  (name-ctype
    'vport_reg_t
    (cstruct
      (list `(DIR ,(cbase 'uint8_t))
            `(OUT ,(cbase 'uint8_t))
            `(IN ,(cbase 'uint8_t))
            `(INTFLAGS ,(cbase 'uint8_t))))))
(define-public vport_reg_t*
  (name-ctype 'vport_reg_t* (cpointer vport_reg_t)))
(define-public struct-vport_reg
  (name-ctype 'struct-vport_reg vport_reg_t))
(define-public struct-vport_reg*
  (name-ctype 'struct-vport_reg* vport_reg_t*))

;; typedef struct vport {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   vport_reg_t *reg; /* pointer to registers */
;; } vport_t;
(define-public vport_t
  (name-ctype
    'vport_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,vport_reg_t*)))))
(define-public vport_t*
  (name-ctype 'vport_t* (cpointer vport_t)))
(define-public struct-vport
  (name-ctype 'struct-vport vport_t))
(define-public struct-vport*
  (name-ctype 'struct-vport* vport_t*))

;; typedef struct wdt_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t STATUS; /* Status */
;; } wdt_reg_t;
(define-public wdt_reg_t
  (name-ctype
    'wdt_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(STATUS ,(cbase 'uint8_t))))))
(define-public wdt_reg_t*
  (name-ctype 'wdt_reg_t* (cpointer wdt_reg_t)))
(define-public struct-wdt_reg
  (name-ctype 'struct-wdt_reg wdt_reg_t))
(define-public struct-wdt_reg*
  (name-ctype 'struct-wdt_reg* wdt_reg_t*))

;; typedef struct wdt {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   wdt_reg_t *reg; /* pointer to registers */
;;   tkclk_t clk_wdt;
;;   uint16_t win_closed; /* window closed */
;;   tkevt_t *winst_act; /* window start event */
;;   tkevt_t *tmout_act; /* timeout event */
;;   uint8_t reset_vn; /* timeout interrupt */
;; } wdt_t;
(define-public wdt_t
  (name-ctype
    'wdt_t
    (cstruct
      (list `(mcu ,mcu_t*)
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,wdt_reg_t*)
            `(clk_wdt ,tkclk_t)
            `(win_closed ,(cbase 'uint16_t))
            `(winst_act ,tkevt_t*)
            `(tmout_act ,tkevt_t*)
            `(reset_vn ,(cbase 'uint8_t))))))
(define-public wdt_t*
  (name-ctype 'wdt_t* (cpointer wdt_t)))
(define-public struct-wdt
  (name-ctype 'struct-wdt wdt_t))
(define-public struct-wdt*
  (name-ctype 'struct-wdt* wdt_t*))

;; void wdt_init(wdt_t *, mcu_t *mcu, uint16_t addr);
(define-public wdt_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wdt_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void wdt_fini(wdt_t *);
(define-public wdt_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wdt_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t wdt_rd(wdt_t *, int addr);
(define-public wdt_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "wdt_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void wdt_wr(wdt_t *, int addr, uint8_t val);
(define-public wdt_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wdt_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; void wdt_reset(wdt_t *);
(define-public wdt_reset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wdt_reset")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; access to enum symbols and #define'd constants:
(define ffi-avr0per-symbol-tab '())

(define ffi-avr0per-symbol-val
  (lambda (k)
    (or (assq-ref ffi-avr0per-symbol-tab k)
        (ffi-octbx-symbol-val k))))
(export ffi-avr0per-symbol-val)

(define (unwrap~enum arg)
  (cond ((number? arg) arg)
        ((symbol? arg) (ffi-avr0per-symbol-val arg))
        ((cdata? arg) (cdata-ref arg))
        (else (error "type mismatch"))))

(define ffi-avr0per-types
  '((pointer struct . "adc_reg") (struct . "adc_reg") (pointer . "adc_reg_t") 
    "adc_reg_t" (pointer struct . "adc") (struct . "adc") (pointer . "adc_t") 
    "adc_t" (pointer struct . "clkctrl_reg") (struct . "clkctrl_reg") (pointer
    . "clkctrl_reg_t") "clkctrl_reg_t" (pointer struct . "clkctrl") (struct . 
    "clkctrl") (pointer . "clkctrl_t") "clkctrl_t" (pointer struct . 
    "port_reg") (struct . "port_reg") (pointer . "port_reg_t") "port_reg_t" 
    (pointer struct . "port") (struct . "port") (pointer . "port_t") "port_t" 
    (pointer struct . "rstctrl_reg") (struct . "rstctrl_reg") (pointer . 
    "rstctrl_reg_t") "rstctrl_reg_t" (pointer struct . "rstctrl") (struct . 
    "rstctrl") (pointer . "rstctrl_t") "rstctrl_t" (pointer struct . 
    "slpctrl_reg") (struct . "slpctrl_reg") (pointer . "slpctrl_reg_t") 
    "slpctrl_reg_t" (pointer struct . "slpctrl") (struct . "slpctrl") (pointer
    . "slpctrl_t") "slpctrl_t" (pointer struct . "syscfg_reg") (struct . 
    "syscfg_reg") (pointer . "syscfg_reg_t") "syscfg_reg_t" (pointer struct . 
    "syscfg") (struct . "syscfg") (pointer . "syscfg_t") "syscfg_t" (pointer 
    struct . "tca_single_reg") (struct . "tca_single_reg") (pointer . 
    "tca_single_reg_t") "tca_single_reg_t" (pointer struct . "tca_split_reg") 
    (struct . "tca_split_reg") (pointer . "tca_split_reg_t") "tca_split_reg_t"
    (pointer union . "tca_reg") (union . "tca_reg") (pointer . "tca_reg_t") 
    "tca_reg_t" (pointer struct . "tca") (struct . "tca") (pointer . "tca_t") 
    "tca_t" (pointer struct . "tcb_reg") (struct . "tcb_reg") (pointer . 
    "tcb_reg_t") "tcb_reg_t" (pointer struct . "tcb") (struct . "tcb") 
    (pointer . "tcb_t") "tcb_t" (pointer struct . "twi_reg") (struct . 
    "twi_reg") (pointer . "twi_reg_t") "twi_reg_t" (pointer struct . 
    "twi_impl") (struct . "twi_impl") (pointer . "twi_impl_t") "twi_impl_t" 
    (pointer struct . "twi") (struct . "twi") (pointer . "twi_t") "twi_t" 
    (pointer struct . "usart_reg") (struct . "usart_reg") (pointer . 
    "usart_reg_t") "usart_reg_t" (pointer struct . "usart") (struct . "usart")
    (pointer . "usart_t") "usart_t" (pointer struct . "vport_reg") (struct . 
    "vport_reg") (pointer . "vport_reg_t") "vport_reg_t" (pointer struct . 
    "vport") (struct . "vport") (pointer . "vport_t") "vport_t" (pointer 
    struct . "wdt_reg") (struct . "wdt_reg") (pointer . "wdt_reg_t") 
    "wdt_reg_t" (pointer struct . "wdt") (struct . "wdt") (pointer . "wdt_t") 
    "wdt_t"))
(export ffi-avr0per-types)

;; --- last line ---
