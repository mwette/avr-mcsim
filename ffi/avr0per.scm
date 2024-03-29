;; generated with `guild compile-ffi ffi/avr0per.ffi'

(define-module (ffi avr0per)
  #:use-module (ffi octbx)
  #:use-module (ffi ffi-help-rt)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (bytestructures guile))

(define ffi-avr0per-llibs
  (delay (list (dynamic-link "libavr0per"))))


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
(define-public adc_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8)
          `(CTRLB ,uint8)
          `(CTRLC ,uint8)
          `(CTRLD ,uint8)
          `(CTRLE ,uint8)
          `(SAMPCTRL ,uint8)
          `(MUXPOS ,uint8)
          `(rez07 ,uint8)
          `(COMMAND ,uint8)
          `(EVCTRL ,uint8)
          `(INTCTRL ,uint8)
          `(INTFLAGS ,uint8)
          `(DBGCTRL ,uint8)
          `(TEMP ,uint8)
          `(rez0E ,uint8)
          `(rez0F ,uint8)
          `(_1 ,(bs:struct (list `(RESL ,uint8) `(RESH ,uint8))))
          `(_2 ,(bs:struct
                  (list `(WINLTL ,uint8) `(WINLTH ,uint8))))
          `(_3 ,(bs:struct
                  (list `(WINHTL ,uint8) `(WINHTH ,uint8))))
          `(CALIB ,uint8))))
(define-fh-compound-type adc_reg_t adc_reg_t-desc adc_reg_t? make-adc_reg_t)
(export adc_reg_t adc_reg_t? make-adc_reg_t)
(define-public adc_reg_t*-desc
  (fh:pointer adc_reg_t-desc))
(define-fh-pointer-type adc_reg_t* adc_reg_t*-desc adc_reg_t*? make-adc_reg_t*
 )
(export adc_reg_t* adc_reg_t*? make-adc_reg_t*)
(fh-ref<=>deref!
  adc_reg_t*
  make-adc_reg_t*
  adc_reg_t
  make-adc_reg_t)
(define-public struct-adc_reg-desc
  adc_reg_t-desc)
(define-fh-compound-type struct-adc_reg struct-adc_reg-desc struct-adc_reg? 
 make-struct-adc_reg)
(export struct-adc_reg struct-adc_reg? make-struct-adc_reg)
(define-public struct-adc_reg*-desc
  adc_reg_t*-desc)
(define-fh-pointer-type struct-adc_reg* struct-adc_reg*-desc struct-adc_reg*? 
 make-struct-adc_reg*)
(export struct-adc_reg* struct-adc_reg*? make-struct-adc_reg*)
(fh-ref<=>deref!
  struct-adc_reg*
  make-struct-adc_reg*
  struct-adc_reg
  make-struct-adc_reg)

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
(define-public adc_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,adc_reg_t*-desc)
          `(conv_act ,tkevt_t*-desc)
          `(vref ,double)
          `(pin ,(bs:vector 16 iopin_t*-desc))
          `(resrdy_vn ,uint8)
          `(wcomp_vn ,uint8))))
(define-fh-compound-type adc_t adc_t-desc adc_t? make-adc_t)
(export adc_t adc_t? make-adc_t)
(define-public adc_t*-desc
  (fh:pointer adc_t-desc))
(define-fh-pointer-type adc_t* adc_t*-desc adc_t*? make-adc_t*)
(export adc_t* adc_t*? make-adc_t*)
(fh-ref<=>deref!
  adc_t*
  make-adc_t*
  adc_t
  make-adc_t)
(define-public struct-adc-desc adc_t-desc)
(define-fh-compound-type struct-adc struct-adc-desc struct-adc? 
 make-struct-adc)
(export struct-adc struct-adc? make-struct-adc)
(define-public struct-adc*-desc adc_t*-desc)
(define-fh-pointer-type struct-adc* struct-adc*-desc struct-adc*? 
 make-struct-adc*)
(export struct-adc* struct-adc*? make-struct-adc*)
(fh-ref<=>deref!
  struct-adc*
  make-struct-adc*
  struct-adc
  make-struct-adc)

;; void adc_init(adc_t *, mcu_t *mcu, uint16_t addr);
(define adc_init
  (let ((~adc_init
          (delay (fh-link-proc
                   ffi:void
                   "adc_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap adc_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~adc_init) ~arg0 ~mcu ~addr)))))
(export adc_init)

;; void adc_fini(adc_t *);
(define adc_fini
  (let ((~adc_fini
          (delay (fh-link-proc
                   ffi:void
                   "adc_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap adc_t*) arg0)))
        ((force ~adc_fini) ~arg0)))))
(export adc_fini)

;; uint8_t adc_rd(adc_t *, int addr);
(define adc_rd
  (let ((~adc_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "adc_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap adc_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~adc_rd) ~arg0 ~addr)))))
(export adc_rd)

;; void adc_wr(adc_t *, int addr, uint8_t val);
(define adc_wr
  (let ((~adc_wr
          (delay (fh-link-proc
                   ffi:void
                   "adc_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap adc_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~adc_wr) ~arg0 ~addr ~val)))))
(export adc_wr)

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
(define-public clkctrl_reg_t-desc
  (bs:struct
    (list `(MCLKCTRLA ,uint8)
          `(MCLKCTRLB ,uint8)
          `(MCLKLOCK ,uint8)
          `(MCLKSTATUS ,uint8)
          `(rez04 ,uint8)
          `(rez05 ,uint8)
          `(rez06 ,uint8)
          `(rez07 ,uint8)
          `(rez08 ,uint8)
          `(rez09 ,uint8)
          `(rez0A ,uint8)
          `(rez0B ,uint8)
          `(rez0C ,uint8)
          `(rez0D ,uint8)
          `(rez0E ,uint8)
          `(rez0F ,uint8)
          `(OSC20MCTRLA ,uint8)
          `(OSC20MCALIBA ,uint8)
          `(OSC20MCALIBB ,uint8)
          `(rez13 ,uint8)
          `(rez14 ,uint8)
          `(rez15 ,uint8)
          `(rez16 ,uint8)
          `(rez17 ,uint8)
          `(OSC32KCTRLA ,uint8)
          `(rez19 ,uint8)
          `(rez1A ,uint8)
          `(rez1B ,uint8)
          `(XOSC32KCTRLA ,uint8))))
(define-fh-compound-type clkctrl_reg_t clkctrl_reg_t-desc clkctrl_reg_t? 
 make-clkctrl_reg_t)
(export clkctrl_reg_t clkctrl_reg_t? make-clkctrl_reg_t)
(define-public clkctrl_reg_t*-desc
  (fh:pointer clkctrl_reg_t-desc))
(define-fh-pointer-type clkctrl_reg_t* clkctrl_reg_t*-desc clkctrl_reg_t*? 
 make-clkctrl_reg_t*)
(export clkctrl_reg_t* clkctrl_reg_t*? make-clkctrl_reg_t*)
(fh-ref<=>deref!
  clkctrl_reg_t*
  make-clkctrl_reg_t*
  clkctrl_reg_t
  make-clkctrl_reg_t)
(define-public struct-clkctrl_reg-desc
  clkctrl_reg_t-desc)
(define-fh-compound-type struct-clkctrl_reg struct-clkctrl_reg-desc 
 struct-clkctrl_reg? make-struct-clkctrl_reg)
(export struct-clkctrl_reg struct-clkctrl_reg? make-struct-clkctrl_reg)
(define-public struct-clkctrl_reg*-desc
  clkctrl_reg_t*-desc)
(define-fh-pointer-type struct-clkctrl_reg* struct-clkctrl_reg*-desc 
 struct-clkctrl_reg*? make-struct-clkctrl_reg*)
(export struct-clkctrl_reg* struct-clkctrl_reg*? make-struct-clkctrl_reg*)
(fh-ref<=>deref!
  struct-clkctrl_reg*
  make-struct-clkctrl_reg*
  struct-clkctrl_reg
  make-struct-clkctrl_reg)

;; typedef struct clkctrl {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   clkctrl_reg_t *reg; /* pointer to registers */
;;   tmevt_t *settled_act; /* clock settled */
;; } clkctrl_t;
(define-public clkctrl_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,clkctrl_reg_t*-desc)
          `(settled_act ,tmevt_t*-desc))))
(define-fh-compound-type clkctrl_t clkctrl_t-desc clkctrl_t? make-clkctrl_t)
(export clkctrl_t clkctrl_t? make-clkctrl_t)
(define-public clkctrl_t*-desc
  (fh:pointer clkctrl_t-desc))
(define-fh-pointer-type clkctrl_t* clkctrl_t*-desc clkctrl_t*? make-clkctrl_t*
 )
(export clkctrl_t* clkctrl_t*? make-clkctrl_t*)
(fh-ref<=>deref!
  clkctrl_t*
  make-clkctrl_t*
  clkctrl_t
  make-clkctrl_t)
(define-public struct-clkctrl-desc
  clkctrl_t-desc)
(define-fh-compound-type struct-clkctrl struct-clkctrl-desc struct-clkctrl? 
 make-struct-clkctrl)
(export struct-clkctrl struct-clkctrl? make-struct-clkctrl)
(define-public struct-clkctrl*-desc
  clkctrl_t*-desc)
(define-fh-pointer-type struct-clkctrl* struct-clkctrl*-desc struct-clkctrl*? 
 make-struct-clkctrl*)
(export struct-clkctrl* struct-clkctrl*? make-struct-clkctrl*)
(fh-ref<=>deref!
  struct-clkctrl*
  make-struct-clkctrl*
  struct-clkctrl
  make-struct-clkctrl)

;; void clkctrl_init(clkctrl_t *, mcu_t *mcu, uint16_t addr);
(define clkctrl_init
  (let ((~clkctrl_init
          (delay (fh-link-proc
                   ffi:void
                   "clkctrl_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap clkctrl_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~clkctrl_init) ~arg0 ~mcu ~addr)))))
(export clkctrl_init)

;; void clkctrl_fini(clkctrl_t *);
(define clkctrl_fini
  (let ((~clkctrl_fini
          (delay (fh-link-proc
                   ffi:void
                   "clkctrl_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap clkctrl_t*) arg0)))
        ((force ~clkctrl_fini) ~arg0)))))
(export clkctrl_fini)

;; uint8_t clkctrl_rd(clkctrl_t *, int addr);
(define clkctrl_rd
  (let ((~clkctrl_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "clkctrl_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap clkctrl_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~clkctrl_rd) ~arg0 ~addr)))))
(export clkctrl_rd)

;; void clkctrl_wr(clkctrl_t *, int addr, uint8_t val);
(define clkctrl_wr
  (let ((~clkctrl_wr
          (delay (fh-link-proc
                   ffi:void
                   "clkctrl_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap clkctrl_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~clkctrl_wr) ~arg0 ~addr ~val)))))
(export clkctrl_wr)

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
(define-public port_reg_t-desc
  (bs:struct
    (list `(DIR ,uint8)
          `(DIRSET ,uint8)
          `(DIRCLR ,uint8)
          `(DIRTGL ,uint8)
          `(OUT ,uint8)
          `(OUTSET ,uint8)
          `(OUTCLR ,uint8)
          `(OUTTGL ,uint8)
          `(IN ,uint8)
          `(INTFLAGS ,uint8)
          `(PORTCTRL ,uint8)
          `(rez0B ,uint8)
          `(rez0C ,uint8)
          `(rez0D ,uint8)
          `(rez0E ,uint8)
          `(rez0F ,uint8)
          `(PIN0CTRL ,uint8)
          `(PIN1CTRL ,uint8)
          `(PIN2CTRL ,uint8)
          `(PIN3CTRL ,uint8)
          `(PIN4CTRL ,uint8)
          `(PIN5CTRL ,uint8)
          `(PIN6CTRL ,uint8)
          `(PIN7CTRL ,uint8))))
(define-fh-compound-type port_reg_t port_reg_t-desc port_reg_t? 
 make-port_reg_t)
(export port_reg_t port_reg_t? make-port_reg_t)
(define-public port_reg_t*-desc
  (fh:pointer port_reg_t-desc))
(define-fh-pointer-type port_reg_t* port_reg_t*-desc port_reg_t*? 
 make-port_reg_t*)
(export port_reg_t* port_reg_t*? make-port_reg_t*)
(fh-ref<=>deref!
  port_reg_t*
  make-port_reg_t*
  port_reg_t
  make-port_reg_t)
(define-public struct-port_reg-desc
  port_reg_t-desc)
(define-fh-compound-type struct-port_reg struct-port_reg-desc struct-port_reg?
 make-struct-port_reg)
(export struct-port_reg struct-port_reg? make-struct-port_reg)
(define-public struct-port_reg*-desc
  port_reg_t*-desc)
(define-fh-pointer-type struct-port_reg* struct-port_reg*-desc 
 struct-port_reg*? make-struct-port_reg*)
(export struct-port_reg* struct-port_reg*? make-struct-port_reg*)
(fh-ref<=>deref!
  struct-port_reg*
  make-struct-port_reg*
  struct-port_reg
  make-struct-port_reg)

;; typedef struct port {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   port_reg_t *reg; /* pointer to registers */
;;   char name; /* \"A\" etc */
;;   iopin_t pin[8];
;;   uint8_t perovr; /* peripheral overrides */
;;   uint8_t port_vn; /* PORT_vect_num */
;; } port_t;
(define-public port_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,port_reg_t*-desc)
          `(name ,int8)
          `(pin ,(bs:vector 8 iopin_t-desc))
          `(perovr ,uint8)
          `(port_vn ,uint8))))
(define-fh-compound-type port_t port_t-desc port_t? make-port_t)
(export port_t port_t? make-port_t)
(define-public port_t*-desc
  (fh:pointer port_t-desc))
(define-fh-pointer-type port_t* port_t*-desc port_t*? make-port_t*)
(export port_t* port_t*? make-port_t*)
(fh-ref<=>deref!
  port_t*
  make-port_t*
  port_t
  make-port_t)
(define-public struct-port-desc port_t-desc)
(define-fh-compound-type struct-port struct-port-desc struct-port? 
 make-struct-port)
(export struct-port struct-port? make-struct-port)
(define-public struct-port*-desc port_t*-desc)
(define-fh-pointer-type struct-port* struct-port*-desc struct-port*? 
 make-struct-port*)
(export struct-port* struct-port*? make-struct-port*)
(fh-ref<=>deref!
  struct-port*
  make-struct-port*
  struct-port
  make-struct-port)

;; void port_init(port_t *, mcu_t *mcu, uint16_t addr);
(define port_init
  (let ((~port_init
          (delay (fh-link-proc
                   ffi:void
                   "port_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap port_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~port_init) ~arg0 ~mcu ~addr)))))
(export port_init)

;; void port_fini(port_t *);
(define port_fini
  (let ((~port_fini
          (delay (fh-link-proc
                   ffi:void
                   "port_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap port_t*) arg0)))
        ((force ~port_fini) ~arg0)))))
(export port_fini)

;; uint8_t port_rd(port_t *, int addr);
(define port_rd
  (let ((~port_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "port_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap port_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~port_rd) ~arg0 ~addr)))))
(export port_rd)

;; void port_wr(port_t *, int addr, uint8_t val);
(define port_wr
  (let ((~port_wr
          (delay (fh-link-proc
                   ffi:void
                   "port_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap port_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~port_wr) ~arg0 ~addr ~val)))))
(export port_wr)

;; typedef struct rstctrl_reg {
;;   uint8_t RSTFR; /* Reset Flags */
;;   uint8_t SWRR; /* Software Reset */
;; } rstctrl_reg_t;
(define-public rstctrl_reg_t-desc
  (bs:struct (list `(RSTFR ,uint8) `(SWRR ,uint8))))
(define-fh-compound-type rstctrl_reg_t rstctrl_reg_t-desc rstctrl_reg_t? 
 make-rstctrl_reg_t)
(export rstctrl_reg_t rstctrl_reg_t? make-rstctrl_reg_t)
(define-public rstctrl_reg_t*-desc
  (fh:pointer rstctrl_reg_t-desc))
(define-fh-pointer-type rstctrl_reg_t* rstctrl_reg_t*-desc rstctrl_reg_t*? 
 make-rstctrl_reg_t*)
(export rstctrl_reg_t* rstctrl_reg_t*? make-rstctrl_reg_t*)
(fh-ref<=>deref!
  rstctrl_reg_t*
  make-rstctrl_reg_t*
  rstctrl_reg_t
  make-rstctrl_reg_t)
(define-public struct-rstctrl_reg-desc
  rstctrl_reg_t-desc)
(define-fh-compound-type struct-rstctrl_reg struct-rstctrl_reg-desc 
 struct-rstctrl_reg? make-struct-rstctrl_reg)
(export struct-rstctrl_reg struct-rstctrl_reg? make-struct-rstctrl_reg)
(define-public struct-rstctrl_reg*-desc
  rstctrl_reg_t*-desc)
(define-fh-pointer-type struct-rstctrl_reg* struct-rstctrl_reg*-desc 
 struct-rstctrl_reg*? make-struct-rstctrl_reg*)
(export struct-rstctrl_reg* struct-rstctrl_reg*? make-struct-rstctrl_reg*)
(fh-ref<=>deref!
  struct-rstctrl_reg*
  make-struct-rstctrl_reg*
  struct-rstctrl_reg
  make-struct-rstctrl_reg)

;; typedef struct rstctrl {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   rstctrl_reg_t *reg; /* pointer to registers */
;; } rstctrl_t;
(define-public rstctrl_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,rstctrl_reg_t*-desc))))
(define-fh-compound-type rstctrl_t rstctrl_t-desc rstctrl_t? make-rstctrl_t)
(export rstctrl_t rstctrl_t? make-rstctrl_t)
(define-public rstctrl_t*-desc
  (fh:pointer rstctrl_t-desc))
(define-fh-pointer-type rstctrl_t* rstctrl_t*-desc rstctrl_t*? make-rstctrl_t*
 )
(export rstctrl_t* rstctrl_t*? make-rstctrl_t*)
(fh-ref<=>deref!
  rstctrl_t*
  make-rstctrl_t*
  rstctrl_t
  make-rstctrl_t)
(define-public struct-rstctrl-desc
  rstctrl_t-desc)
(define-fh-compound-type struct-rstctrl struct-rstctrl-desc struct-rstctrl? 
 make-struct-rstctrl)
(export struct-rstctrl struct-rstctrl? make-struct-rstctrl)
(define-public struct-rstctrl*-desc
  rstctrl_t*-desc)
(define-fh-pointer-type struct-rstctrl* struct-rstctrl*-desc struct-rstctrl*? 
 make-struct-rstctrl*)
(export struct-rstctrl* struct-rstctrl*? make-struct-rstctrl*)
(fh-ref<=>deref!
  struct-rstctrl*
  make-struct-rstctrl*
  struct-rstctrl
  make-struct-rstctrl)

;; void rstctrl_init(rstctrl_t *, mcu_t *mcu, uint16_t addr);
(define rstctrl_init
  (let ((~rstctrl_init
          (delay (fh-link-proc
                   ffi:void
                   "rstctrl_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap rstctrl_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~rstctrl_init) ~arg0 ~mcu ~addr)))))
(export rstctrl_init)

;; void rstctrl_fini(rstctrl_t *);
(define rstctrl_fini
  (let ((~rstctrl_fini
          (delay (fh-link-proc
                   ffi:void
                   "rstctrl_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap rstctrl_t*) arg0)))
        ((force ~rstctrl_fini) ~arg0)))))
(export rstctrl_fini)

;; uint8_t rstctrl_rd(rstctrl_t *, int addr);
(define rstctrl_rd
  (let ((~rstctrl_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "rstctrl_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap rstctrl_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~rstctrl_rd) ~arg0 ~addr)))))
(export rstctrl_rd)

;; void rstctrl_wr(rstctrl_t *, int addr, uint8_t val);
(define rstctrl_wr
  (let ((~rstctrl_wr
          (delay (fh-link-proc
                   ffi:void
                   "rstctrl_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap rstctrl_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~rstctrl_wr) ~arg0 ~addr ~val)))))
(export rstctrl_wr)

;; typedef struct slpctrl_reg {
;;   uint8_t CTRLA; /* Control */
;; } slpctrl_reg_t;
(define-public slpctrl_reg_t-desc
  (bs:struct (list `(CTRLA ,uint8))))
(define-fh-compound-type slpctrl_reg_t slpctrl_reg_t-desc slpctrl_reg_t? 
 make-slpctrl_reg_t)
(export slpctrl_reg_t slpctrl_reg_t? make-slpctrl_reg_t)
(define-public slpctrl_reg_t*-desc
  (fh:pointer slpctrl_reg_t-desc))
(define-fh-pointer-type slpctrl_reg_t* slpctrl_reg_t*-desc slpctrl_reg_t*? 
 make-slpctrl_reg_t*)
(export slpctrl_reg_t* slpctrl_reg_t*? make-slpctrl_reg_t*)
(fh-ref<=>deref!
  slpctrl_reg_t*
  make-slpctrl_reg_t*
  slpctrl_reg_t
  make-slpctrl_reg_t)
(define-public struct-slpctrl_reg-desc
  slpctrl_reg_t-desc)
(define-fh-compound-type struct-slpctrl_reg struct-slpctrl_reg-desc 
 struct-slpctrl_reg? make-struct-slpctrl_reg)
(export struct-slpctrl_reg struct-slpctrl_reg? make-struct-slpctrl_reg)
(define-public struct-slpctrl_reg*-desc
  slpctrl_reg_t*-desc)
(define-fh-pointer-type struct-slpctrl_reg* struct-slpctrl_reg*-desc 
 struct-slpctrl_reg*? make-struct-slpctrl_reg*)
(export struct-slpctrl_reg* struct-slpctrl_reg*? make-struct-slpctrl_reg*)
(fh-ref<=>deref!
  struct-slpctrl_reg*
  make-struct-slpctrl_reg*
  struct-slpctrl_reg
  make-struct-slpctrl_reg)

;; typedef struct slpctrl {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   slpctrl_reg_t *reg; /* pointer to registers */
;; } slpctrl_t;
(define-public slpctrl_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,slpctrl_reg_t*-desc))))
(define-fh-compound-type slpctrl_t slpctrl_t-desc slpctrl_t? make-slpctrl_t)
(export slpctrl_t slpctrl_t? make-slpctrl_t)
(define-public slpctrl_t*-desc
  (fh:pointer slpctrl_t-desc))
(define-fh-pointer-type slpctrl_t* slpctrl_t*-desc slpctrl_t*? make-slpctrl_t*
 )
(export slpctrl_t* slpctrl_t*? make-slpctrl_t*)
(fh-ref<=>deref!
  slpctrl_t*
  make-slpctrl_t*
  slpctrl_t
  make-slpctrl_t)
(define-public struct-slpctrl-desc
  slpctrl_t-desc)
(define-fh-compound-type struct-slpctrl struct-slpctrl-desc struct-slpctrl? 
 make-struct-slpctrl)
(export struct-slpctrl struct-slpctrl? make-struct-slpctrl)
(define-public struct-slpctrl*-desc
  slpctrl_t*-desc)
(define-fh-pointer-type struct-slpctrl* struct-slpctrl*-desc struct-slpctrl*? 
 make-struct-slpctrl*)
(export struct-slpctrl* struct-slpctrl*? make-struct-slpctrl*)
(fh-ref<=>deref!
  struct-slpctrl*
  make-struct-slpctrl*
  struct-slpctrl
  make-struct-slpctrl)

;; void slpctrl_init(slpctrl_t *, mcu_t *mcu, uint16_t addr);
(define slpctrl_init
  (let ((~slpctrl_init
          (delay (fh-link-proc
                   ffi:void
                   "slpctrl_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap slpctrl_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~slpctrl_init) ~arg0 ~mcu ~addr)))))
(export slpctrl_init)

;; void slpctrl_fini(slpctrl_t *);
(define slpctrl_fini
  (let ((~slpctrl_fini
          (delay (fh-link-proc
                   ffi:void
                   "slpctrl_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap slpctrl_t*) arg0)))
        ((force ~slpctrl_fini) ~arg0)))))
(export slpctrl_fini)

;; uint8_t slpctrl_rd(slpctrl_t *, int addr);
(define slpctrl_rd
  (let ((~slpctrl_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "slpctrl_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap slpctrl_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~slpctrl_rd) ~arg0 ~addr)))))
(export slpctrl_rd)

;; void slpctrl_wr(slpctrl_t *, int addr, uint8_t val);
(define slpctrl_wr
  (let ((~slpctrl_wr
          (delay (fh-link-proc
                   ffi:void
                   "slpctrl_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap slpctrl_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~slpctrl_wr) ~arg0 ~addr ~val)))))
(export slpctrl_wr)

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
(define-public syscfg_reg_t-desc
  (bs:struct
    (list `(rez00 ,uint8)
          `(REVID ,uint8)
          `(EXTBRK ,uint8)
          `(rez03 ,uint8)
          `(rez04 ,uint8)
          `(rez05 ,uint8)
          `(rez06 ,uint8)
          `(rez07 ,uint8)
          `(rez08 ,uint8)
          `(rez09 ,uint8)
          `(rez0A ,uint8)
          `(rez0B ,uint8)
          `(rez0C ,uint8)
          `(rez0D ,uint8)
          `(rez0E ,uint8)
          `(rez0F ,uint8)
          `(rez10 ,uint8)
          `(rez11 ,uint8)
          `(rez12 ,uint8)
          `(rez13 ,uint8)
          `(rez14 ,uint8)
          `(rez15 ,uint8)
          `(rez16 ,uint8)
          `(rez17 ,uint8)
          `(OCDM ,uint8)
          `(OCDMS ,uint8))))
(define-fh-compound-type syscfg_reg_t syscfg_reg_t-desc syscfg_reg_t? 
 make-syscfg_reg_t)
(export syscfg_reg_t syscfg_reg_t? make-syscfg_reg_t)
(define-public syscfg_reg_t*-desc
  (fh:pointer syscfg_reg_t-desc))
(define-fh-pointer-type syscfg_reg_t* syscfg_reg_t*-desc syscfg_reg_t*? 
 make-syscfg_reg_t*)
(export syscfg_reg_t* syscfg_reg_t*? make-syscfg_reg_t*)
(fh-ref<=>deref!
  syscfg_reg_t*
  make-syscfg_reg_t*
  syscfg_reg_t
  make-syscfg_reg_t)
(define-public struct-syscfg_reg-desc
  syscfg_reg_t-desc)
(define-fh-compound-type struct-syscfg_reg struct-syscfg_reg-desc 
 struct-syscfg_reg? make-struct-syscfg_reg)
(export struct-syscfg_reg struct-syscfg_reg? make-struct-syscfg_reg)
(define-public struct-syscfg_reg*-desc
  syscfg_reg_t*-desc)
(define-fh-pointer-type struct-syscfg_reg* struct-syscfg_reg*-desc 
 struct-syscfg_reg*? make-struct-syscfg_reg*)
(export struct-syscfg_reg* struct-syscfg_reg*? make-struct-syscfg_reg*)
(fh-ref<=>deref!
  struct-syscfg_reg*
  make-struct-syscfg_reg*
  struct-syscfg_reg
  make-struct-syscfg_reg)

;; typedef struct syscfg {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   syscfg_reg_t *reg; /* pointer to registers */
;; } syscfg_t;
(define-public syscfg_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,syscfg_reg_t*-desc))))
(define-fh-compound-type syscfg_t syscfg_t-desc syscfg_t? make-syscfg_t)
(export syscfg_t syscfg_t? make-syscfg_t)
(define-public syscfg_t*-desc
  (fh:pointer syscfg_t-desc))
(define-fh-pointer-type syscfg_t* syscfg_t*-desc syscfg_t*? make-syscfg_t*)
(export syscfg_t* syscfg_t*? make-syscfg_t*)
(fh-ref<=>deref!
  syscfg_t*
  make-syscfg_t*
  syscfg_t
  make-syscfg_t)
(define-public struct-syscfg-desc syscfg_t-desc)
(define-fh-compound-type struct-syscfg struct-syscfg-desc struct-syscfg? 
 make-struct-syscfg)
(export struct-syscfg struct-syscfg? make-struct-syscfg)
(define-public struct-syscfg*-desc
  syscfg_t*-desc)
(define-fh-pointer-type struct-syscfg* struct-syscfg*-desc struct-syscfg*? 
 make-struct-syscfg*)
(export struct-syscfg* struct-syscfg*? make-struct-syscfg*)
(fh-ref<=>deref!
  struct-syscfg*
  make-struct-syscfg*
  struct-syscfg
  make-struct-syscfg)

;; void syscfg_init(syscfg_t *, mcu_t *mcu, uint16_t addr);
(define syscfg_init
  (let ((~syscfg_init
          (delay (fh-link-proc
                   ffi:void
                   "syscfg_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap syscfg_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~syscfg_init) ~arg0 ~mcu ~addr)))))
(export syscfg_init)

;; void syscfg_fini(syscfg_t *);
(define syscfg_fini
  (let ((~syscfg_fini
          (delay (fh-link-proc
                   ffi:void
                   "syscfg_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap syscfg_t*) arg0)))
        ((force ~syscfg_fini) ~arg0)))))
(export syscfg_fini)

;; uint8_t syscfg_rd(syscfg_t *, int addr);
(define syscfg_rd
  (let ((~syscfg_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "syscfg_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap syscfg_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~syscfg_rd) ~arg0 ~addr)))))
(export syscfg_rd)

;; void syscfg_wr(syscfg_t *, int addr, uint8_t val);
(define syscfg_wr
  (let ((~syscfg_wr
          (delay (fh-link-proc
                   ffi:void
                   "syscfg_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap syscfg_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~syscfg_wr) ~arg0 ~addr ~val)))))
(export syscfg_wr)

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
(define-public tca_single_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8)
          `(CTRLB ,uint8)
          `(CTRLC ,uint8)
          `(CTRLD ,uint8)
          `(CTRLE ,uint8)
          `(CTRLE_X ,uint8)
          `(CTRLF ,uint8)
          `(CTRLF_X ,uint8)
          `(rez08 ,uint8)
          `(EVCTRL ,uint8)
          `(INTCTRL ,uint8)
          `(INTFLAGS ,uint8)
          `(rez0C ,uint8)
          `(rez0D ,uint8)
          `(DBGCTRL ,uint8)
          `(TEMP ,uint8)
          `(rez10 ,uint8)
          `(rez11 ,uint8)
          `(rez12 ,uint8)
          `(rez13 ,uint8)
          `(rez14 ,uint8)
          `(rez15 ,uint8)
          `(rez16 ,uint8)
          `(rez17 ,uint8)
          `(rez18 ,uint8)
          `(rez19 ,uint8)
          `(rez1A ,uint8)
          `(rez1B ,uint8)
          `(rez1C ,uint8)
          `(rez1D ,uint8)
          `(rez1E ,uint8)
          `(rez1F ,uint8)
          `(_1 ,(bs:struct (list `(CNTL ,uint8) `(CNTH ,uint8))))
          `(rez22 ,uint8)
          `(rez23 ,uint8)
          `(rez24 ,uint8)
          `(rez25 ,uint8)
          `(_2 ,(bs:struct (list `(PERL ,uint8) `(PERH ,uint8))))
          `(_3 ,(bs:struct
                  (list `(CMP0L ,uint8) `(CMP0H ,uint8))))
          `(_4 ,(bs:struct
                  (list `(CMP1L ,uint8) `(CMP1H ,uint8))))
          `(_5 ,(bs:struct
                  (list `(CMP2L ,uint8) `(CMP2H ,uint8))))
          `(rez2E ,uint8)
          `(rez2F ,uint8)
          `(rez30 ,uint8)
          `(rez31 ,uint8)
          `(rez32 ,uint8)
          `(rez33 ,uint8)
          `(rez34 ,uint8)
          `(rez35 ,uint8)
          `(_6 ,(bs:struct
                  (list `(PERBUFL ,uint8) `(PERBUFH ,uint8))))
          `(_7 ,(bs:struct
                  (list `(CMP0BUFL ,uint8) `(CMP0BUFH ,uint8))))
          `(_8 ,(bs:struct
                  (list `(CMP1BUFL ,uint8) `(CMP1BUFH ,uint8))))
          `(_9 ,(bs:struct
                  (list `(CMP2BUFL ,uint8) `(CMP2BUFH ,uint8)))))))
(define-fh-compound-type tca_single_reg_t tca_single_reg_t-desc 
 tca_single_reg_t? make-tca_single_reg_t)
(export tca_single_reg_t tca_single_reg_t? make-tca_single_reg_t)
(define-public tca_single_reg_t*-desc
  (fh:pointer tca_single_reg_t-desc))
(define-fh-pointer-type tca_single_reg_t* tca_single_reg_t*-desc 
 tca_single_reg_t*? make-tca_single_reg_t*)
(export tca_single_reg_t* tca_single_reg_t*? make-tca_single_reg_t*)
(fh-ref<=>deref!
  tca_single_reg_t*
  make-tca_single_reg_t*
  tca_single_reg_t
  make-tca_single_reg_t)
(define-public struct-tca_single_reg-desc
  tca_single_reg_t-desc)
(define-fh-compound-type struct-tca_single_reg struct-tca_single_reg-desc 
 struct-tca_single_reg? make-struct-tca_single_reg)
(export struct-tca_single_reg struct-tca_single_reg? 
 make-struct-tca_single_reg)
(define-public struct-tca_single_reg*-desc
  tca_single_reg_t*-desc)
(define-fh-pointer-type struct-tca_single_reg* struct-tca_single_reg*-desc 
 struct-tca_single_reg*? make-struct-tca_single_reg*)
(export struct-tca_single_reg* struct-tca_single_reg*? 
 make-struct-tca_single_reg*)
(fh-ref<=>deref!
  struct-tca_single_reg*
  make-struct-tca_single_reg*
  struct-tca_single_reg
  make-struct-tca_single_reg)

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
(define-public tca_split_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8)
          `(CTRLB ,uint8)
          `(CTRLC ,uint8)
          `(CTRLD ,uint8)
          `(CTRLE ,uint8)
          `(CTRLE_X ,uint8)
          `(rez06 ,uint8)
          `(rez07 ,uint8)
          `(rez08 ,uint8)
          `(rez09 ,uint8)
          `(INTCTRL ,uint8)
          `(INTFLAGS ,uint8)
          `(rez0C ,uint8)
          `(rez0D ,uint8)
          `(DBGCTRL ,uint8)
          `(rez0F ,uint8)
          `(rez10 ,uint8)
          `(rez11 ,uint8)
          `(rez12 ,uint8)
          `(rez13 ,uint8)
          `(rez14 ,uint8)
          `(rez15 ,uint8)
          `(rez16 ,uint8)
          `(rez17 ,uint8)
          `(rez18 ,uint8)
          `(rez19 ,uint8)
          `(rez1A ,uint8)
          `(rez1B ,uint8)
          `(rez1C ,uint8)
          `(rez1D ,uint8)
          `(rez1E ,uint8)
          `(rez1F ,uint8)
          `(LCNT ,uint8)
          `(HCNT ,uint8)
          `(rez22 ,uint8)
          `(rez23 ,uint8)
          `(rez24 ,uint8)
          `(rez25 ,uint8)
          `(LPER ,uint8)
          `(HPER ,uint8)
          `(LCMP0 ,uint8)
          `(HCMP0 ,uint8)
          `(LCMP1 ,uint8)
          `(HCMP1 ,uint8)
          `(LCMP2 ,uint8)
          `(HCMP2 ,uint8))))
(define-fh-compound-type tca_split_reg_t tca_split_reg_t-desc tca_split_reg_t?
 make-tca_split_reg_t)
(export tca_split_reg_t tca_split_reg_t? make-tca_split_reg_t)
(define-public tca_split_reg_t*-desc
  (fh:pointer tca_split_reg_t-desc))
(define-fh-pointer-type tca_split_reg_t* tca_split_reg_t*-desc 
 tca_split_reg_t*? make-tca_split_reg_t*)
(export tca_split_reg_t* tca_split_reg_t*? make-tca_split_reg_t*)
(fh-ref<=>deref!
  tca_split_reg_t*
  make-tca_split_reg_t*
  tca_split_reg_t
  make-tca_split_reg_t)
(define-public struct-tca_split_reg-desc
  tca_split_reg_t-desc)
(define-fh-compound-type struct-tca_split_reg struct-tca_split_reg-desc 
 struct-tca_split_reg? make-struct-tca_split_reg)
(export struct-tca_split_reg struct-tca_split_reg? make-struct-tca_split_reg)
(define-public struct-tca_split_reg*-desc
  tca_split_reg_t*-desc)
(define-fh-pointer-type struct-tca_split_reg* struct-tca_split_reg*-desc 
 struct-tca_split_reg*? make-struct-tca_split_reg*)
(export struct-tca_split_reg* struct-tca_split_reg*? 
 make-struct-tca_split_reg*)
(fh-ref<=>deref!
  struct-tca_split_reg*
  make-struct-tca_split_reg*
  struct-tca_split_reg
  make-struct-tca_split_reg)

;; typedef union tca_reg {
;;   tca_single_reg_t SINGLE; /*  */
;;   tca_split_reg_t SPLIT; /*  */
;; } tca_reg_t;
(define-public tca_reg_t-desc
  (bs:union
    (list `(SINGLE ,tca_single_reg_t-desc)
          `(SPLIT ,tca_split_reg_t-desc))))
(define-fh-compound-type tca_reg_t tca_reg_t-desc tca_reg_t? make-tca_reg_t)
(export tca_reg_t tca_reg_t? make-tca_reg_t)
(define-public tca_reg_t*-desc
  (fh:pointer tca_reg_t-desc))
(define-fh-pointer-type tca_reg_t* tca_reg_t*-desc tca_reg_t*? make-tca_reg_t*
 )
(export tca_reg_t* tca_reg_t*? make-tca_reg_t*)
(fh-ref<=>deref!
  tca_reg_t*
  make-tca_reg_t*
  tca_reg_t
  make-tca_reg_t)
(define-public union-tca_reg-desc tca_reg_t-desc)
(define-fh-compound-type union-tca_reg union-tca_reg-desc union-tca_reg? 
 make-union-tca_reg)
(export union-tca_reg union-tca_reg? make-union-tca_reg)
(define-public union-tca_reg*-desc
  tca_reg_t*-desc)
(define-fh-pointer-type union-tca_reg* union-tca_reg*-desc union-tca_reg*? 
 make-union-tca_reg*)
(export union-tca_reg* union-tca_reg*? make-union-tca_reg*)
(fh-ref<=>deref!
  union-tca_reg*
  make-union-tca_reg*
  union-tca_reg
  make-union-tca_reg)

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
(define-public tca_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,tca_reg_t*-desc)
          `(bot_at ,uint64)
          `(bot_act ,tkevt_t*-desc)
          `(top_act ,tkevt_t*-desc)
          `(cmp0_act ,tkevt_t*-desc)
          `(cmp1_act ,tkevt_t*-desc)
          `(cmp2_act ,tkevt_t*-desc)
          `(pin_out ,iopin_t*-desc)
          `(ovf_vn ,uint8)
          `(lunf_vn ,uint8)
          `(hunf_vn ,uint8)
          `(lcmp0_vn ,uint8)
          `(lcmp1_vn ,uint8)
          `(lcmp2_vn ,uint8)
          `(cmp0_vn ,uint8)
          `(cmp1_vn ,uint8)
          `(cmp2_vn ,uint8))))
(define-fh-compound-type tca_t tca_t-desc tca_t? make-tca_t)
(export tca_t tca_t? make-tca_t)
(define-public tca_t*-desc
  (fh:pointer tca_t-desc))
(define-fh-pointer-type tca_t* tca_t*-desc tca_t*? make-tca_t*)
(export tca_t* tca_t*? make-tca_t*)
(fh-ref<=>deref!
  tca_t*
  make-tca_t*
  tca_t
  make-tca_t)
(define-public struct-tca-desc tca_t-desc)
(define-fh-compound-type struct-tca struct-tca-desc struct-tca? 
 make-struct-tca)
(export struct-tca struct-tca? make-struct-tca)
(define-public struct-tca*-desc tca_t*-desc)
(define-fh-pointer-type struct-tca* struct-tca*-desc struct-tca*? 
 make-struct-tca*)
(export struct-tca* struct-tca*? make-struct-tca*)
(fh-ref<=>deref!
  struct-tca*
  make-struct-tca*
  struct-tca
  make-struct-tca)

;; void tca_init(tca_t *, mcu_t *mcu, uint16_t addr);
(define tca_init
  (let ((~tca_init
          (delay (fh-link-proc
                   ffi:void
                   "tca_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap tca_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~tca_init) ~arg0 ~mcu ~addr)))))
(export tca_init)

;; void tca_fini(tca_t *);
(define tca_fini
  (let ((~tca_fini
          (delay (fh-link-proc
                   ffi:void
                   "tca_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap tca_t*) arg0)))
        ((force ~tca_fini) ~arg0)))))
(export tca_fini)

;; uint8_t tca_rd(tca_t *, int addr);
(define tca_rd
  (let ((~tca_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "tca_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap tca_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~tca_rd) ~arg0 ~addr)))))
(export tca_rd)

;; void tca_wr(tca_t *, int addr, uint8_t val);
(define tca_wr
  (let ((~tca_wr
          (delay (fh-link-proc
                   ffi:void
                   "tca_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap tca_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~tca_wr) ~arg0 ~addr ~val)))))
(export tca_wr)

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
(define-public tcb_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8)
          `(CTRLB ,uint8)
          `(rez02 ,uint8)
          `(rez03 ,uint8)
          `(EVCTRL ,uint8)
          `(INTCTRL ,uint8)
          `(INTFLAGS ,uint8)
          `(STATUS ,uint8)
          `(DBGCTRL ,uint8)
          `(TEMP ,uint8)
          `(_1 ,(bs:struct (list `(CNTL ,uint8) `(CNTH ,uint8))))
          `(_2 ,(bs:struct
                  (list `(CCMPL ,uint8) `(CCMPH ,uint8)))))))
(define-fh-compound-type tcb_reg_t tcb_reg_t-desc tcb_reg_t? make-tcb_reg_t)
(export tcb_reg_t tcb_reg_t? make-tcb_reg_t)
(define-public tcb_reg_t*-desc
  (fh:pointer tcb_reg_t-desc))
(define-fh-pointer-type tcb_reg_t* tcb_reg_t*-desc tcb_reg_t*? make-tcb_reg_t*
 )
(export tcb_reg_t* tcb_reg_t*? make-tcb_reg_t*)
(fh-ref<=>deref!
  tcb_reg_t*
  make-tcb_reg_t*
  tcb_reg_t
  make-tcb_reg_t)
(define-public struct-tcb_reg-desc
  tcb_reg_t-desc)
(define-fh-compound-type struct-tcb_reg struct-tcb_reg-desc struct-tcb_reg? 
 make-struct-tcb_reg)
(export struct-tcb_reg struct-tcb_reg? make-struct-tcb_reg)
(define-public struct-tcb_reg*-desc
  tcb_reg_t*-desc)
(define-fh-pointer-type struct-tcb_reg* struct-tcb_reg*-desc struct-tcb_reg*? 
 make-struct-tcb_reg*)
(export struct-tcb_reg* struct-tcb_reg*? make-struct-tcb_reg*)
(fh-ref<=>deref!
  struct-tcb_reg*
  make-struct-tcb_reg*
  struct-tcb_reg
  make-struct-tcb_reg)

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
(define-public tcb_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,tcb_reg_t*-desc)
          `(bot_at ,uint64)
          `(bot_act ,tkevt_t*-desc)
          `(cmp_act ,tkevt_t*-desc)
          `(pin_out ,iopin_t*-desc)
          `(int_vn ,uint8))))
(define-fh-compound-type tcb_t tcb_t-desc tcb_t? make-tcb_t)
(export tcb_t tcb_t? make-tcb_t)
(define-public tcb_t*-desc
  (fh:pointer tcb_t-desc))
(define-fh-pointer-type tcb_t* tcb_t*-desc tcb_t*? make-tcb_t*)
(export tcb_t* tcb_t*? make-tcb_t*)
(fh-ref<=>deref!
  tcb_t*
  make-tcb_t*
  tcb_t
  make-tcb_t)
(define-public struct-tcb-desc tcb_t-desc)
(define-fh-compound-type struct-tcb struct-tcb-desc struct-tcb? 
 make-struct-tcb)
(export struct-tcb struct-tcb? make-struct-tcb)
(define-public struct-tcb*-desc tcb_t*-desc)
(define-fh-pointer-type struct-tcb* struct-tcb*-desc struct-tcb*? 
 make-struct-tcb*)
(export struct-tcb* struct-tcb*? make-struct-tcb*)
(fh-ref<=>deref!
  struct-tcb*
  make-struct-tcb*
  struct-tcb
  make-struct-tcb)

;; void tcb_init(tcb_t *, mcu_t *mcu, uint16_t addr);
(define tcb_init
  (let ((~tcb_init
          (delay (fh-link-proc
                   ffi:void
                   "tcb_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap tcb_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~tcb_init) ~arg0 ~mcu ~addr)))))
(export tcb_init)

;; void tcb_fini(tcb_t *);
(define tcb_fini
  (let ((~tcb_fini
          (delay (fh-link-proc
                   ffi:void
                   "tcb_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap tcb_t*) arg0)))
        ((force ~tcb_fini) ~arg0)))))
(export tcb_fini)

;; uint8_t tcb_rd(tcb_t *, int addr);
(define tcb_rd
  (let ((~tcb_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "tcb_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap tcb_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~tcb_rd) ~arg0 ~addr)))))
(export tcb_rd)

;; void tcb_wr(tcb_t *, int addr, uint8_t val);
(define tcb_wr
  (let ((~tcb_wr
          (delay (fh-link-proc
                   ffi:void
                   "tcb_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap tcb_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~tcb_wr) ~arg0 ~addr ~val)))))
(export tcb_wr)

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
(define-public twi_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8)
          `(DUALCTRL ,uint8)
          `(DBGCTRL ,uint8)
          `(MCTRLA ,uint8)
          `(MCTRLB ,uint8)
          `(MSTATUS ,uint8)
          `(MBAUD ,uint8)
          `(MADDR ,uint8)
          `(MDATA ,uint8)
          `(SCTRLA ,uint8)
          `(SCTRLB ,uint8)
          `(SSTATUS ,uint8)
          `(SADDR ,uint8)
          `(SDATA ,uint8)
          `(SADDRMASK ,uint8))))
(define-fh-compound-type twi_reg_t twi_reg_t-desc twi_reg_t? make-twi_reg_t)
(export twi_reg_t twi_reg_t? make-twi_reg_t)
(define-public twi_reg_t*-desc
  (fh:pointer twi_reg_t-desc))
(define-fh-pointer-type twi_reg_t* twi_reg_t*-desc twi_reg_t*? make-twi_reg_t*
 )
(export twi_reg_t* twi_reg_t*? make-twi_reg_t*)
(fh-ref<=>deref!
  twi_reg_t*
  make-twi_reg_t*
  twi_reg_t
  make-twi_reg_t)
(define-public struct-twi_reg-desc
  twi_reg_t-desc)
(define-fh-compound-type struct-twi_reg struct-twi_reg-desc struct-twi_reg? 
 make-struct-twi_reg)
(export struct-twi_reg struct-twi_reg? make-struct-twi_reg)
(define-public struct-twi_reg*-desc
  twi_reg_t*-desc)
(define-fh-pointer-type struct-twi_reg* struct-twi_reg*-desc struct-twi_reg*? 
 make-struct-twi_reg*)
(export struct-twi_reg* struct-twi_reg*? make-struct-twi_reg*)
(fh-ref<=>deref!
  struct-twi_reg*
  make-struct-twi_reg*
  struct-twi_reg
  make-struct-twi_reg)

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
(define-public twi_impl_t-desc
  (bs:struct
    (list `(sda_pin ,iopin_t*-desc)
          `(scl_pin ,iopin_t*-desc)
          `(evt ,tkevt_t*-desc)
          `(xst ,uint8)
          `(cnt ,uint8)
          `(ost ,uint8)
          `(t_hi ,uint16)
          `(t_lo ,uint16)
          `(t_su ,uint16))))
(define-fh-compound-type twi_impl_t twi_impl_t-desc twi_impl_t? 
 make-twi_impl_t)
(export twi_impl_t twi_impl_t? make-twi_impl_t)
(define-public twi_impl_t*-desc
  (fh:pointer twi_impl_t-desc))
(define-fh-pointer-type twi_impl_t* twi_impl_t*-desc twi_impl_t*? 
 make-twi_impl_t*)
(export twi_impl_t* twi_impl_t*? make-twi_impl_t*)
(fh-ref<=>deref!
  twi_impl_t*
  make-twi_impl_t*
  twi_impl_t
  make-twi_impl_t)
(define-public struct-twi_impl-desc
  twi_impl_t-desc)
(define-fh-compound-type struct-twi_impl struct-twi_impl-desc struct-twi_impl?
 make-struct-twi_impl)
(export struct-twi_impl struct-twi_impl? make-struct-twi_impl)
(define-public struct-twi_impl*-desc
  twi_impl_t*-desc)
(define-fh-pointer-type struct-twi_impl* struct-twi_impl*-desc 
 struct-twi_impl*? make-struct-twi_impl*)
(export struct-twi_impl* struct-twi_impl*? make-struct-twi_impl*)
(fh-ref<=>deref!
  struct-twi_impl*
  make-struct-twi_impl*
  struct-twi_impl
  make-struct-twi_impl)

;; typedef struct twi {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   twi_reg_t *reg; /* pointer to registers */
;;   uint8_t twis_vn; /* TWIS ISR vect num */
;;   uint8_t twim_vn; /* TWIM ISR vect num */
;;   twi_impl_t m, s; /* master, slave twi mach */
;; } twi_t;
(define-public twi_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,twi_reg_t*-desc)
          `(twis_vn ,uint8)
          `(twim_vn ,uint8)
          `(m ,twi_impl_t-desc)
          `(s ,twi_impl_t-desc))))
(define-fh-compound-type twi_t twi_t-desc twi_t? make-twi_t)
(export twi_t twi_t? make-twi_t)
(define-public twi_t*-desc
  (fh:pointer twi_t-desc))
(define-fh-pointer-type twi_t* twi_t*-desc twi_t*? make-twi_t*)
(export twi_t* twi_t*? make-twi_t*)
(fh-ref<=>deref!
  twi_t*
  make-twi_t*
  twi_t
  make-twi_t)
(define-public struct-twi-desc twi_t-desc)
(define-fh-compound-type struct-twi struct-twi-desc struct-twi? 
 make-struct-twi)
(export struct-twi struct-twi? make-struct-twi)
(define-public struct-twi*-desc twi_t*-desc)
(define-fh-pointer-type struct-twi* struct-twi*-desc struct-twi*? 
 make-struct-twi*)
(export struct-twi* struct-twi*? make-struct-twi*)
(fh-ref<=>deref!
  struct-twi*
  make-struct-twi*
  struct-twi
  make-struct-twi)

;; void twi_init(twi_t *, mcu_t *mcu, uint16_t addr);
(define twi_init
  (let ((~twi_init
          (delay (fh-link-proc
                   ffi:void
                   "twi_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap twi_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~twi_init) ~arg0 ~mcu ~addr)))))
(export twi_init)

;; void twi_fini(twi_t *);
(define twi_fini
  (let ((~twi_fini
          (delay (fh-link-proc
                   ffi:void
                   "twi_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap twi_t*) arg0)))
        ((force ~twi_fini) ~arg0)))))
(export twi_fini)

;; uint8_t twi_rd(twi_t *, int addr);
(define twi_rd
  (let ((~twi_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "twi_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap twi_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~twi_rd) ~arg0 ~addr)))))
(export twi_rd)

;; void twi_wr(twi_t *, int addr, uint8_t val);
(define twi_wr
  (let ((~twi_wr
          (delay (fh-link-proc
                   ffi:void
                   "twi_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap twi_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~twi_wr) ~arg0 ~addr ~val)))))
(export twi_wr)

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
(define-public usart_reg_t-desc
  (bs:struct
    (list `(RXDATAL ,uint8)
          `(RXDATAH ,uint8)
          `(TXDATAL ,uint8)
          `(TXDATAH ,uint8)
          `(STATUS ,uint8)
          `(CTRLA ,uint8)
          `(CTRLB ,uint8)
          `(CTRLC ,uint8)
          `(_1 ,(bs:struct
                  (list `(BAUDL ,uint8) `(BAUDH ,uint8))))
          `(CTRLD ,uint8)
          `(DBGCTRL ,uint8)
          `(EVCTRL ,uint8)
          `(TXPLCTRL ,uint8)
          `(RXPLCTRL ,uint8))))
(define-fh-compound-type usart_reg_t usart_reg_t-desc usart_reg_t? 
 make-usart_reg_t)
(export usart_reg_t usart_reg_t? make-usart_reg_t)
(define-public usart_reg_t*-desc
  (fh:pointer usart_reg_t-desc))
(define-fh-pointer-type usart_reg_t* usart_reg_t*-desc usart_reg_t*? 
 make-usart_reg_t*)
(export usart_reg_t* usart_reg_t*? make-usart_reg_t*)
(fh-ref<=>deref!
  usart_reg_t*
  make-usart_reg_t*
  usart_reg_t
  make-usart_reg_t)
(define-public struct-usart_reg-desc
  usart_reg_t-desc)
(define-fh-compound-type struct-usart_reg struct-usart_reg-desc 
 struct-usart_reg? make-struct-usart_reg)
(export struct-usart_reg struct-usart_reg? make-struct-usart_reg)
(define-public struct-usart_reg*-desc
  usart_reg_t*-desc)
(define-fh-pointer-type struct-usart_reg* struct-usart_reg*-desc 
 struct-usart_reg*? make-struct-usart_reg*)
(export struct-usart_reg* struct-usart_reg*? make-struct-usart_reg*)
(fh-ref<=>deref!
  struct-usart_reg*
  make-struct-usart_reg*
  struct-usart_reg
  make-struct-usart_reg)

;; typedef struct usart {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   usart_reg_t *reg; /* pointer to registers */
;;   uint8_t rxc_vn; /*  */
;;   uint8_t dre_vn; /*  */
;;   uint8_t txc_vn; /*  */
;; } usart_t;
(define-public usart_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,usart_reg_t*-desc)
          `(rxc_vn ,uint8)
          `(dre_vn ,uint8)
          `(txc_vn ,uint8))))
(define-fh-compound-type usart_t usart_t-desc usart_t? make-usart_t)
(export usart_t usart_t? make-usart_t)
(define-public usart_t*-desc
  (fh:pointer usart_t-desc))
(define-fh-pointer-type usart_t* usart_t*-desc usart_t*? make-usart_t*)
(export usart_t* usart_t*? make-usart_t*)
(fh-ref<=>deref!
  usart_t*
  make-usart_t*
  usart_t
  make-usart_t)
(define-public struct-usart-desc usart_t-desc)
(define-fh-compound-type struct-usart struct-usart-desc struct-usart? 
 make-struct-usart)
(export struct-usart struct-usart? make-struct-usart)
(define-public struct-usart*-desc usart_t*-desc)
(define-fh-pointer-type struct-usart* struct-usart*-desc struct-usart*? 
 make-struct-usart*)
(export struct-usart* struct-usart*? make-struct-usart*)
(fh-ref<=>deref!
  struct-usart*
  make-struct-usart*
  struct-usart
  make-struct-usart)

;; void usart_init(usart_t *, mcu_t *mcu, uint16_t addr);
(define usart_init
  (let ((~usart_init
          (delay (fh-link-proc
                   ffi:void
                   "usart_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap usart_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~usart_init) ~arg0 ~mcu ~addr)))))
(export usart_init)

;; void usart_fini(usart_t *);
(define usart_fini
  (let ((~usart_fini
          (delay (fh-link-proc
                   ffi:void
                   "usart_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap usart_t*) arg0)))
        ((force ~usart_fini) ~arg0)))))
(export usart_fini)

;; uint8_t usart_rd(usart_t *, int addr);
(define usart_rd
  (let ((~usart_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "usart_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap usart_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~usart_rd) ~arg0 ~addr)))))
(export usart_rd)

;; void usart_wr(usart_t *, int addr, uint8_t val);
(define usart_wr
  (let ((~usart_wr
          (delay (fh-link-proc
                   ffi:void
                   "usart_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap usart_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~usart_wr) ~arg0 ~addr ~val)))))
(export usart_wr)

;; typedef struct vport_reg {
;;   uint8_t DIR; /* Data Direction */
;;   uint8_t OUT; /* Output Value */
;;   uint8_t IN; /* Input Value */
;;   uint8_t INTFLAGS; /* Interrupt Flags */
;; } vport_reg_t;
(define-public vport_reg_t-desc
  (bs:struct
    (list `(DIR ,uint8)
          `(OUT ,uint8)
          `(IN ,uint8)
          `(INTFLAGS ,uint8))))
(define-fh-compound-type vport_reg_t vport_reg_t-desc vport_reg_t? 
 make-vport_reg_t)
(export vport_reg_t vport_reg_t? make-vport_reg_t)
(define-public vport_reg_t*-desc
  (fh:pointer vport_reg_t-desc))
(define-fh-pointer-type vport_reg_t* vport_reg_t*-desc vport_reg_t*? 
 make-vport_reg_t*)
(export vport_reg_t* vport_reg_t*? make-vport_reg_t*)
(fh-ref<=>deref!
  vport_reg_t*
  make-vport_reg_t*
  vport_reg_t
  make-vport_reg_t)
(define-public struct-vport_reg-desc
  vport_reg_t-desc)
(define-fh-compound-type struct-vport_reg struct-vport_reg-desc 
 struct-vport_reg? make-struct-vport_reg)
(export struct-vport_reg struct-vport_reg? make-struct-vport_reg)
(define-public struct-vport_reg*-desc
  vport_reg_t*-desc)
(define-fh-pointer-type struct-vport_reg* struct-vport_reg*-desc 
 struct-vport_reg*? make-struct-vport_reg*)
(export struct-vport_reg* struct-vport_reg*? make-struct-vport_reg*)
(fh-ref<=>deref!
  struct-vport_reg*
  make-struct-vport_reg*
  struct-vport_reg
  make-struct-vport_reg)

;; typedef struct vport {
;;   mcu_t *mcu;
;;   uint16_t base_addr; /* base address */
;;   vport_reg_t *reg; /* pointer to registers */
;; } vport_t;
(define-public vport_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,vport_reg_t*-desc))))
(define-fh-compound-type vport_t vport_t-desc vport_t? make-vport_t)
(export vport_t vport_t? make-vport_t)
(define-public vport_t*-desc
  (fh:pointer vport_t-desc))
(define-fh-pointer-type vport_t* vport_t*-desc vport_t*? make-vport_t*)
(export vport_t* vport_t*? make-vport_t*)
(fh-ref<=>deref!
  vport_t*
  make-vport_t*
  vport_t
  make-vport_t)
(define-public struct-vport-desc vport_t-desc)
(define-fh-compound-type struct-vport struct-vport-desc struct-vport? 
 make-struct-vport)
(export struct-vport struct-vport? make-struct-vport)
(define-public struct-vport*-desc vport_t*-desc)
(define-fh-pointer-type struct-vport* struct-vport*-desc struct-vport*? 
 make-struct-vport*)
(export struct-vport* struct-vport*? make-struct-vport*)
(fh-ref<=>deref!
  struct-vport*
  make-struct-vport*
  struct-vport
  make-struct-vport)

;; typedef struct wdt_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t STATUS; /* Status */
;; } wdt_reg_t;
(define-public wdt_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8) `(STATUS ,uint8))))
(define-fh-compound-type wdt_reg_t wdt_reg_t-desc wdt_reg_t? make-wdt_reg_t)
(export wdt_reg_t wdt_reg_t? make-wdt_reg_t)
(define-public wdt_reg_t*-desc
  (fh:pointer wdt_reg_t-desc))
(define-fh-pointer-type wdt_reg_t* wdt_reg_t*-desc wdt_reg_t*? make-wdt_reg_t*
 )
(export wdt_reg_t* wdt_reg_t*? make-wdt_reg_t*)
(fh-ref<=>deref!
  wdt_reg_t*
  make-wdt_reg_t*
  wdt_reg_t
  make-wdt_reg_t)
(define-public struct-wdt_reg-desc
  wdt_reg_t-desc)
(define-fh-compound-type struct-wdt_reg struct-wdt_reg-desc struct-wdt_reg? 
 make-struct-wdt_reg)
(export struct-wdt_reg struct-wdt_reg? make-struct-wdt_reg)
(define-public struct-wdt_reg*-desc
  wdt_reg_t*-desc)
(define-fh-pointer-type struct-wdt_reg* struct-wdt_reg*-desc struct-wdt_reg*? 
 make-struct-wdt_reg*)
(export struct-wdt_reg* struct-wdt_reg*? make-struct-wdt_reg*)
(fh-ref<=>deref!
  struct-wdt_reg*
  make-struct-wdt_reg*
  struct-wdt_reg
  make-struct-wdt_reg)

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
(define-public wdt_t-desc
  (bs:struct
    (list `(mcu ,mcu_t*-desc)
          `(base_addr ,uint16)
          `(reg ,wdt_reg_t*-desc)
          `(clk_wdt ,tkclk_t-desc)
          `(win_closed ,uint16)
          `(winst_act ,tkevt_t*-desc)
          `(tmout_act ,tkevt_t*-desc)
          `(reset_vn ,uint8))))
(define-fh-compound-type wdt_t wdt_t-desc wdt_t? make-wdt_t)
(export wdt_t wdt_t? make-wdt_t)
(define-public wdt_t*-desc
  (fh:pointer wdt_t-desc))
(define-fh-pointer-type wdt_t* wdt_t*-desc wdt_t*? make-wdt_t*)
(export wdt_t* wdt_t*? make-wdt_t*)
(fh-ref<=>deref!
  wdt_t*
  make-wdt_t*
  wdt_t
  make-wdt_t)
(define-public struct-wdt-desc wdt_t-desc)
(define-fh-compound-type struct-wdt struct-wdt-desc struct-wdt? 
 make-struct-wdt)
(export struct-wdt struct-wdt? make-struct-wdt)
(define-public struct-wdt*-desc wdt_t*-desc)
(define-fh-pointer-type struct-wdt* struct-wdt*-desc struct-wdt*? 
 make-struct-wdt*)
(export struct-wdt* struct-wdt*? make-struct-wdt*)
(fh-ref<=>deref!
  struct-wdt*
  make-struct-wdt*
  struct-wdt
  make-struct-wdt)

;; void wdt_init(wdt_t *, mcu_t *mcu, uint16_t addr);
(define wdt_init
  (let ((~wdt_init
          (delay (fh-link-proc
                   ffi:void
                   "wdt_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap wdt_t*) arg0))
            (~mcu ((fht-unwrap mcu_t*) mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~wdt_init) ~arg0 ~mcu ~addr)))))
(export wdt_init)

;; void wdt_fini(wdt_t *);
(define wdt_fini
  (let ((~wdt_fini
          (delay (fh-link-proc
                   ffi:void
                   "wdt_fini"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap wdt_t*) arg0)))
        ((force ~wdt_fini) ~arg0)))))
(export wdt_fini)

;; uint8_t wdt_rd(wdt_t *, int addr);
(define wdt_rd
  (let ((~wdt_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "wdt_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap wdt_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~wdt_rd) ~arg0 ~addr)))))
(export wdt_rd)

;; void wdt_wr(wdt_t *, int addr, uint8_t val);
(define wdt_wr
  (let ((~wdt_wr
          (delay (fh-link-proc
                   ffi:void
                   "wdt_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap wdt_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~wdt_wr) ~arg0 ~addr ~val)))))
(export wdt_wr)

;; void wdt_reset(wdt_t *);
(define wdt_reset
  (let ((~wdt_reset
          (delay (fh-link-proc
                   ffi:void
                   "wdt_reset"
                   (list ffi-void*)
                   (force ffi-avr0per-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap wdt_t*) arg0)))
        ((force ~wdt_reset) ~arg0)))))
(export wdt_reset)

;; access to enum symbols and #define'd constants:
(define ffi-avr0per-symbol-tab '())

(define ffi-avr0per-symbol-val
  (lambda (k)
    (or (assq-ref ffi-avr0per-symbol-tab k)
        (ffi-octbx-symbol-val k))))
(export ffi-avr0per-symbol-val)

(define (unwrap-enum obj)
  (cond ((number? obj) obj)
        ((symbol? obj) (ffi-avr0per-symbol-val obj))
        ((fh-object? obj) (struct-ref obj 0))
        (else (error "type mismatch"))))

(define ffi-avr0per-types
  '((struct . "adc_reg") (pointer . "adc_reg_t") "adc_reg_t" (struct . "adc") 
    (pointer . "adc_t") "adc_t" (struct . "clkctrl_reg") (pointer . 
    "clkctrl_reg_t") "clkctrl_reg_t" (struct . "clkctrl") (pointer . 
    "clkctrl_t") "clkctrl_t" (struct . "port_reg") (pointer . "port_reg_t") 
    "port_reg_t" (struct . "port") (pointer . "port_t") "port_t" (struct . 
    "rstctrl_reg") (pointer . "rstctrl_reg_t") "rstctrl_reg_t" (struct . 
    "rstctrl") (pointer . "rstctrl_t") "rstctrl_t" (struct . "slpctrl_reg") 
    (pointer . "slpctrl_reg_t") "slpctrl_reg_t" (struct . "slpctrl") (pointer 
    . "slpctrl_t") "slpctrl_t" (struct . "syscfg_reg") (pointer . 
    "syscfg_reg_t") "syscfg_reg_t" (struct . "syscfg") (pointer . "syscfg_t") 
    "syscfg_t" (struct . "tca_single_reg") (pointer . "tca_single_reg_t") 
    "tca_single_reg_t" (struct . "tca_split_reg") (pointer . "tca_split_reg_t"
    ) "tca_split_reg_t" (union . "tca_reg") (pointer . "tca_reg_t") 
    "tca_reg_t" (struct . "tca") (pointer . "tca_t") "tca_t" (struct . 
    "tcb_reg") (pointer . "tcb_reg_t") "tcb_reg_t" (struct . "tcb") (pointer 
    . "tcb_t") "tcb_t" (struct . "twi_reg") (pointer . "twi_reg_t") 
    "twi_reg_t" (struct . "twi_impl") (pointer . "twi_impl_t") "twi_impl_t" 
    (struct . "twi") (pointer . "twi_t") "twi_t" (struct . "usart_reg") 
    (pointer . "usart_reg_t") "usart_reg_t" (struct . "usart") (pointer . 
    "usart_t") "usart_t" (struct . "vport_reg") (pointer . "vport_reg_t") 
    "vport_reg_t" (struct . "vport") (pointer . "vport_t") "vport_t" (struct 
    . "wdt_reg") (pointer . "wdt_reg_t") "wdt_reg_t" (struct . "wdt") (pointer
    . "wdt_t") "wdt_t"))
(export ffi-avr0per-types)

;; --- last line ---
