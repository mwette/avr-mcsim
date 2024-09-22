;; generated with `guild compile-ffi ffi/octsx.ffi'

(define-module (ffi octsx)
  #:use-module (ffi octbx)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata))

(define (foreign-pointer-search name)
  (let loop ((libs (list #f "liboctsx")))
    (cond ((null? libs) (error "no library for ~s" name))
          ((false-if-exception
             (foreign-library-pointer (car libs) name)))
          (else (loop (cdr libs))))))


;; typedef struct spice_dac {
;;   char *name; /* spice name */
;;   iopin_t *pin; /* connection */
;;   double av[2]; /* int'val beg, end values */
;; } spice_dac_t;
(define-public spice_dac_t
  (name-ctype
    'spice_dac_t
    (cstruct
      (list `(name ,(cpointer (cbase 'char)))
            `(pin ,iopin_t*)
            `(av ,(carray (cbase 'double) 2))))))
(define-public spice_dac_t*
  (name-ctype 'spice_dac_t* (cpointer spice_dac_t)))
(define-public struct-spice_dac
  (name-ctype 'struct-spice_dac spice_dac_t))
(define-public struct-spice_dac*
  (name-ctype 'struct-spice_dac* spice_dac_t*))

;; typedef struct spice_adc {
;;   char *name; /* spice name */
;;   iopin_t *pin; /* connection */
;; } spice_adc_t;
(define-public spice_adc_t
  (name-ctype
    'spice_adc_t
    (cstruct
      (list `(name ,(cpointer (cbase 'char)))
            `(pin ,iopin_t*)))))
(define-public spice_adc_t*
  (name-ctype 'spice_adc_t* (cpointer spice_adc_t)))
(define-public struct-spice_adc
  (name-ctype 'struct-spice_adc spice_adc_t))
(define-public struct-spice_adc*
  (name-ctype 'struct-spice_adc* spice_adc_t*))

;; typedef spice_adc_t spice_mea_t;
(define-public spice_mea_t
  (name-ctype 'spice_mea_t spice_adc_t))
(define-public spice_mea_t*
  (name-ctype 'spice_mea_t* spice_adc_t*))

;; typedef struct spice {
;;   void *hdl; /* handle */
;;   int dt_ns; /* tmsch delta-T (ns) */
;;   tmevt_t *evt;
;;   int nadc;
;;   char **adc_names;
;;   spice_adc_t adcs[10];
;;   int ndac;
;;   char **dac_names;
;;   spice_dac_t dacs[10];
;;   int nmea;
;;   char **mea_names;
;;   spice_mea_t meas[10];
;;   double tv[2];
;;   //logr_t *logr;
;; } spice_t;
(define-public spice_t
  (name-ctype
    'spice_t
    (cstruct
      (list `(hdl ,(cpointer 'void))
            `(dt_ns ,(cbase 'int))
            `(evt ,tmevt_t*)
            `(nadc ,(cbase 'int))
            `(adc_names ,(cpointer (cpointer (cbase 'char))))
            `(adcs ,(carray spice_adc_t 10))
            `(ndac ,(cbase 'int))
            `(dac_names ,(cpointer (cpointer (cbase 'char))))
            `(dacs ,(carray spice_dac_t 10))
            `(nmea ,(cbase 'int))
            `(mea_names ,(cpointer (cpointer (cbase 'char))))
            `(meas ,(carray spice_mea_t 10))
            `(tv ,(carray (cbase 'double) 2))))))
(define-public spice_t*
  (name-ctype 'spice_t* (cpointer spice_t)))
(define-public struct-spice
  (name-ctype 'struct-spice spice_t))
(define-public struct-spice*
  (name-ctype 'struct-spice* spice_t*))

;; void spice_init(spice_t *, struct tmsch *clk, int argc, char **argv);
(define-public spice_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "spice_init")
                        (list '* '* ffi:int '*)))))
    (lambda (arg0 clk argc argv)
      (let ((arg0 (unwrap-pointer arg0))
            (clk (unwrap-pointer clk))
            (argc (unwrap-number argc))
            (argv (unwrap-pointer argv)))
        ((force ~proc) arg0 clk argc argv)))))

;; void spice_fini(spice_t *);
(define-public spice_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "spice_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; typedef enum {
;;   OCT_T_NONE,
;;   OCT_T_MCU,
;;   OCT_T_BUS,
;;   OCT_T_OSC,
;;   OCT_T_CIR,
;;   OCT_T__MAX,
;; } devtype_t;
(define-public devtype_t
  (name-ctype
    'devtype_t
    (cenum '((OCT_T_NONE 0)
             (OCT_T_MCU 1)
             (OCT_T_BUS 2)
             (OCT_T_OSC 3)
             (OCT_T_CIR 4)
             (OCT_T__MAX 5)))))
(define-public unwrap-devtype_t
  (let ((vald (cenum-vald (ctype-info devtype_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-devtype_t
  (let ((symd (cenum-symd (ctype-info devtype_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef struct device {
;;   struct {
;;     struct device *next;
;;     struct device *prev;
;;   } n, a; /* name or address */
;;   char *name; /* interned name */
;;   devtype_t type;
;;   void *guts;
;; } device_t;
(define-public device_t
  (name-ctype
    'device_t
    (cstruct
      (list `(n ,(cstruct
                   (list `(next ,(cpointer 'void))
                         `(prev ,(cpointer 'void)))))
            `(a ,(cstruct
                   (list `(next ,(cpointer 'void))
                         `(prev ,(cpointer 'void)))))
            `(name ,(cpointer (cbase 'char)))
            `(type ,devtype_t)
            `(guts ,(cpointer 'void))))))
(define-public device_t*
  (name-ctype 'device_t* (cpointer device_t)))
(define-public struct-device
  (name-ctype 'struct-device device_t))
(define-public struct-device*
  (name-ctype 'struct-device* device_t*))

;; struct env {
;;   tmsch_t clk;
;;   struct {
;;     unsigned use_spice : 1;
;;   } flag;
;;   device_t n_htab[31];
;;   device_t a_htab[0x1000];
;;   spice_t spice;
;; };
(define-public struct-env
  (name-ctype
    'struct-env
    (cstruct
      (list `(clk ,tmsch_t)
            `(flag ,(cstruct
                      (list `(use_spice ,(cbase 'unsigned) 1))))
            `(n_htab ,(carray device_t 31))
            `(a_htab ,(carray device_t 4096))
            `(spice ,spice_t)))))
(define-public struct-env*
  (name-ctype 'struct-env* (cpointer struct-env)))

;; typedef struct env sys_t;
(define-public sys_t
  (name-ctype 'sys_t struct-env))
(define-public sys_t*
  (name-ctype 'sys_t* struct-env*))

;; sys_t *make_sys(int argc, char **argv);
(define-public make_sys
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "make_sys")
                        (list ffi:int '*)))))
    (lambda (argc argv)
      (let ((argc (unwrap-number argc))
            (argv (unwrap-pointer argv)))
        ((lambda (~ret) (make-cdata sys_t* ~ret))
         ((force ~proc) argc argv))))))

;; void sys_init(sys_t *sys, int argc, char **argv);
(define-public sys_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_init")
                        (list '* ffi:int '*)))))
    (lambda (sys argc argv)
      (let ((sys (unwrap-pointer sys))
            (argc (unwrap-number argc))
            (argv (unwrap-pointer argv)))
        ((force ~proc) sys argc argv)))))

;; void sys_fini(sys_t *sys);
(define-public sys_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_fini")
                        (list '*)))))
    (lambda (sys)
      (let ((sys (unwrap-pointer sys)))
        ((force ~proc) sys)))))

;; device_t *dev_insert(sys_t *sys, char *name, devtype_t type, void *dev);
(define-public dev_insert
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "dev_insert")
                        (list '* '* ffi:int '*)))))
    (lambda (sys name type dev)
      (let ((sys (unwrap-pointer sys))
            (name (unwrap-pointer name))
            (type (unwrap~enum type))
            (dev (unwrap-pointer dev)))
        ((lambda (~ret) (make-cdata device_t* ~ret))
         ((force ~proc) sys name type dev))))))

;; device_t *dev_lookup_byname(sys_t *sys, char *name);
(define-public dev_lookup_byname
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "dev_lookup_byname")
                        (list '* '*)))))
    (lambda (sys name)
      (let ((sys (unwrap-pointer sys))
            (name (unwrap-pointer name)))
        ((lambda (~ret) (make-cdata device_t* ~ret))
         ((force ~proc) sys name))))))

;; device_t *dev_lookup_byaddr(sys_t *sys, void *addr);
(define-public dev_lookup_byaddr
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "dev_lookup_byaddr")
                        (list '* '*)))))
    (lambda (sys addr)
      (let ((sys (unwrap-pointer sys))
            (addr (unwrap-pointer addr)))
        ((lambda (~ret) (make-cdata device_t* ~ret))
         ((force ~proc) sys addr))))))

;; char *dev_name(device_t *dev);
(define-public dev_name
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "dev_name")
                        (list '*)))))
    (lambda (dev)
      (let ((dev (unwrap-pointer dev)))
        ((force ~proc) dev)))))

;; int dev_type(device_t *dev);
(define-public dev_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "dev_type")
                        (list '*)))))
    (lambda (dev)
      (let ((dev (unwrap-pointer dev)))
        ((force ~proc) dev)))))

;; void *dev_guts(device_t *dev);
(define-public dev_guts
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "dev_guts")
                        (list '*)))))
    (lambda (dev)
      (let ((dev (unwrap-pointer dev)))
        ((force ~proc) dev)))))

;; typedef enum {
;;   BUS_LEV_LOW = 0,
;;   BUS_LEV_HI = 1,
;; } buslev_t;
(define-public buslev_t
  (name-ctype
    'buslev_t
    (cenum '((BUS_LEV_LOW 0) (BUS_LEV_HI 1)))))
(define-public unwrap-buslev_t
  (let ((vald (cenum-vald (ctype-info buslev_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-buslev_t
  (let ((symd (cenum-symd (ctype-info buslev_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef struct bus {
;;   tmsch_t *tmsch;
;;   int npin;
;;   iopin_t *pins[4];
;;   int lev;
;;   uint32_t t_rise_ns;
;;   uint32_t t_fall_ns;
;;   tmevt_t *relevel_act;
;; } bus_t;
(define-public bus_t
  (name-ctype
    'bus_t
    (cstruct
      (list `(tmsch ,tmsch_t*)
            `(npin ,(cbase 'int))
            `(pins ,(carray iopin_t* 4))
            `(lev ,(cbase 'int))
            `(t_rise_ns ,(cbase 'uint32_t))
            `(t_fall_ns ,(cbase 'uint32_t))
            `(relevel_act ,tmevt_t*)))))
(define-public bus_t*
  (name-ctype 'bus_t* (cpointer bus_t)))
(define-public struct-bus
  (name-ctype 'struct-bus bus_t))
(define-public struct-bus*
  (name-ctype 'struct-bus* bus_t*))

;; bus_t *make_bus(tmsch_t *sch);
(define-public make_bus
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "make_bus")
                        (list '*)))))
    (lambda (sch)
      (let ((sch (unwrap-pointer sch)))
        ((lambda (~ret) (make-cdata bus_t* ~ret))
         ((force ~proc) sch))))))

;; void bus_relevel(bus_t *bus);
(define-public bus_relevel
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "bus_relevel")
                        (list '*)))))
    (lambda (bus)
      (let ((bus (unwrap-pointer bus)))
        ((force ~proc) bus)))))

;; void bus_conn_to_pin(bus_t *bus, iopin_t *pin);
(define-public bus_conn_to_pin
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "bus_conn_to_pin")
                        (list '* '*)))))
    (lambda (bus pin)
      (let ((bus (unwrap-pointer bus))
            (pin (unwrap-pointer pin)))
        ((force ~proc) bus pin)))))

;; void bus_pin_changed(void *tgt, struct iopin *pin, int op, int arg);
(define-public bus_pin_changed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "bus_pin_changed")
                        (list '* '* ffi:int ffi:int)))))
    (lambda (tgt pin op arg)
      (let ((tgt (unwrap-pointer tgt))
            (pin (unwrap-pointer pin))
            (op (unwrap-number op))
            (arg (unwrap-number arg)))
        ((force ~proc) tgt pin op arg)))))

;; mcu_t *make_mcu(tmsch_t *tmsch, char *dev, char *code);
(define-public make_mcu
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "make_mcu")
                        (list '* '* '*)))))
    (lambda (tmsch dev code)
      (let ((tmsch (unwrap-pointer tmsch))
            (dev (unwrap-pointer dev))
            (code (unwrap-pointer code)))
        ((lambda (~ret) (make-cdata mcu_t* ~ret))
         ((force ~proc) tmsch dev code))))))

;; cpu_t *get_mcu_cpu(mcu_t *mcu);
(define-public get_mcu_cpu
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "get_mcu_cpu")
                        (list '*)))))
    (lambda (mcu)
      (let ((mcu (unwrap-pointer mcu)))
        ((lambda (~ret) (make-cdata cpu_t* ~ret))
         ((force ~proc) mcu))))))

;; tmsch_t *sys_tmsch(sys_t *sys);
(define-public sys_tmsch
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "sys_tmsch")
                        (list '*)))))
    (lambda (sys)
      (let ((sys (unwrap-pointer sys)))
        ((lambda (~ret) (make-cdata tmsch_t* ~ret))
         ((force ~proc) sys))))))

;; tkclk_t *sys_cpu_clk(sys_t *sys);
(define-public sys_cpu_clk
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "sys_cpu_clk")
                        (list '*)))))
    (lambda (sys)
      (let ((sys (unwrap-pointer sys)))
        ((lambda (~ret) (make-cdata tkclk_t* ~ret))
         ((force ~proc) sys))))))

;; tmsch_t *get_sys_clk(sys_t *sys);
(define-public get_sys_clk
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "get_sys_clk")
                        (list '*)))))
    (lambda (sys)
      (let ((sys (unwrap-pointer sys)))
        ((lambda (~ret) (make-cdata tmsch_t* ~ret))
         ((force ~proc) sys))))))

;; simtime_t get_simtime(sys_t *sys);
(define-public get_simtime
  (let ((~proc (delay (ffi:pointer->procedure
                        (list ffi:int32 ffi:int32)
                        (foreign-pointer-search "get_simtime")
                        (list '*)))))
    (lambda (sys)
      (let ((sys (unwrap-pointer sys)))
        ((lambda (~ret) (make-cdata simtime_t ~ret))
         ((force ~proc) sys))))))

;; void get_simtime_tp(sys_t *sys, simtime_t *tp);
(define-public get_simtime_tp
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "get_simtime_tp")
                        (list '* '*)))))
    (lambda (sys tp)
      (let ((sys (unwrap-pointer sys))
            (tp (unwrap-pointer tp)))
        ((force ~proc) sys tp)))))

;; void sys_run_to(sys_t *sys, simtime_t to);
(define-public sys_run_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_to")
                        (list '* (list ffi:int32 ffi:int32))))))
    (lambda (sys to)
      (let ((sys (unwrap-pointer sys)))
        ((force ~proc) sys to)))))

;; void sys_run_ns(sys_t *sys, long ns);
(define-public sys_run_ns
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_ns")
                        (list '* ffi:long)))))
    (lambda (sys ns)
      (let ((sys (unwrap-pointer sys))
            (ns (unwrap-number ns)))
        ((force ~proc) sys ns)))))

;; void sys_run_sns(sys_t *sys, long s, long ns);
(define-public sys_run_sns
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_sns")
                        (list '* ffi:long ffi:long)))))
    (lambda (sys s ns)
      (let ((sys (unwrap-pointer sys))
            (s (unwrap-number s))
            (ns (unwrap-number ns)))
        ((force ~proc) sys s ns)))))

;; void sys_run_sus(sys_t *sys, long s, long us);
(define-public sys_run_sus
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_sus")
                        (list '* ffi:long ffi:long)))))
    (lambda (sys s us)
      (let ((sys (unwrap-pointer sys))
            (s (unwrap-number s))
            (us (unwrap-number us)))
        ((force ~proc) sys s us)))))

;; void sys_run_sms(sys_t *sys, long s, long ms);
(define-public sys_run_sms
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_sms")
                        (list '* ffi:long ffi:long)))))
    (lambda (sys s ms)
      (let ((sys (unwrap-pointer sys))
            (s (unwrap-number s))
            (ms (unwrap-number ms)))
        ((force ~proc) sys s ms)))))

;; void sys_run_to_cpu_addr(sys_t *sys, cpu_t *cpu, uint32_t pc);
(define-public sys_run_to_cpu_addr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_to_cpu_addr")
                        (list '* '* ffi:uint32)))))
    (lambda (sys cpu pc)
      (let ((sys (unwrap-pointer sys))
            (cpu (unwrap-pointer cpu))
            (pc (unwrap-number "uint32_t")))
        ((force ~proc) sys cpu pc)))))

;; void sys_run_dt(sys_t *sys, float dt);
(define-public sys_run_dt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_run_dt")
                        (list '* ffi:float)))))
    (lambda (sys dt)
      (let ((sys (unwrap-pointer sys))
            (dt (unwrap-number dt)))
        ((force ~proc) sys dt)))))

;; void sys_cont(sys_t *sys, cpu_t *cpu);
(define-public sys_cont
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_cont")
                        (list '* '*)))))
    (lambda (sys cpu)
      (let ((sys (unwrap-pointer sys))
            (cpu (unwrap-pointer cpu)))
        ((force ~proc) sys cpu)))))

;; void sys_cpu_next(sys_t *sys, cpu_t *cpu, int n);
(define-public sys_cpu_next
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_cpu_next")
                        (list '* '* ffi:int)))))
    (lambda (sys cpu n)
      (let ((sys (unwrap-pointer sys))
            (cpu (unwrap-pointer cpu))
            (n (unwrap-number n)))
        ((force ~proc) sys cpu n)))))

;; void sys_cpu_step(sys_t *sys, cpu_t *cpu, int n);
(define-public sys_cpu_step
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "sys_cpu_step")
                        (list '* '* ffi:int)))))
    (lambda (sys cpu n)
      (let ((sys (unwrap-pointer sys))
            (cpu (unwrap-pointer cpu))
            (n (unwrap-number n)))
        ((force ~proc) sys cpu n)))))

;; iopin_t *mcu_pin_byname(mcu_t *mcu, char *name);
(define-public mcu_pin_byname
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "mcu_pin_byname")
                        (list '* '*)))))
    (lambda (mcu name)
      (let ((mcu (unwrap-pointer mcu))
            (name (unwrap-pointer name)))
        ((lambda (~ret) (make-cdata iopin_t* ~ret))
         ((force ~proc) mcu name))))))

;; void connect_nodes(iopin_t *a, iopin_t *b);
(define-public connect_nodes
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "connect_nodes")
                        (list '* '*)))))
    (lambda (a b)
      (let ((a (unwrap-pointer a)) (b (unwrap-pointer b)))
        ((force ~proc) a b)))))

;; access to enum symbols and #define'd constants:
(define ffi-octsx-symbol-tab
  '((BUS_LEV_HI . 1)
    (BUS_LEV_LOW . 0)
    (BUS_LEV_HI . 1)
    (BUS_LEV_LOW . 0)
    (OCT_T__MAX . 5)
    (OCT_T_CIR . 4)
    (OCT_T_OSC . 3)
    (OCT_T_BUS . 2)
    (OCT_T_MCU . 1)
    (OCT_T_NONE . 0)
    (OCT_T__MAX . 5)
    (OCT_T_CIR . 4)
    (OCT_T_OSC . 3)
    (OCT_T_BUS . 2)
    (OCT_T_MCU . 1)
    (OCT_T_NONE . 0)
    (OCT_A_HSIZ . 4096)
    (OCT_N_HSIZ . 31)
    (SPC_MEA_MAX . 10)
    (SPC_DAC_MAX . 10)
    (SPC_ADC_MAX . 10)))

(define ffi-octsx-symbol-val
  (lambda (k)
    (or (assq-ref ffi-octsx-symbol-tab k)
        (ffi-octbx-symbol-val k))))
(export ffi-octsx-symbol-val)

(define (unwrap~enum arg)
  (cond ((number? arg) arg)
        ((symbol? arg) (ffi-octsx-symbol-val arg))
        ((cdata? arg) (cdata-ref arg))
        (else (error "type mismatch"))))

(define ffi-octsx-types
  '((pointer struct . "spice_dac") (struct . "spice_dac") (pointer . 
    "spice_dac_t") "spice_dac_t" (pointer struct . "spice_adc") (struct . 
    "spice_adc") (pointer . "spice_adc_t") "spice_adc_t" "spice_mea_t" 
    (pointer . "spice_mea_t") (pointer struct . "spice") (struct . "spice") 
    (pointer . "spice_t") "spice_t" "devtype_t" (pointer struct . "device") 
    (struct . "device") (pointer . "device_t") "device_t" (struct . "env") 
    (pointer . "sys_t") "sys_t" "buslev_t" (pointer struct . "bus") (struct . 
    "bus") (pointer . "bus_t") "bus_t"))
(export ffi-octsx-types)

;; --- last line ---
