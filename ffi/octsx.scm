;; generated with `guild compile-ffi ffi/octsx.ffi'

(define-module (ffi octsx)
  #:use-module (ffi octbx)
  #:use-module (ffi runtime)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (bytestructures guile))

(define ffi-octsx-llibs
  (delay (list (dynamic-link "liboctsx"))))


;; typedef struct spice_dac {
;;   char *name; /* spice name */
;;   iopin_t *pin; /* connection */
;;   double av[2]; /* int'val beg, end values */
;; } spice_dac_t;
(define-public spice_dac_t-desc
  (bs:struct
    (list `(name ,(fh:pointer int8))
          `(pin ,iopin_t*-desc)
          `(av ,(bs:vector 2 double)))))
(define-fh-compound-type spice_dac_t spice_dac_t-desc spice_dac_t? 
 make-spice_dac_t)
(export spice_dac_t spice_dac_t? make-spice_dac_t)
(define-public spice_dac_t*-desc
  (fh:pointer spice_dac_t-desc))
(define-fh-pointer-type spice_dac_t* spice_dac_t*-desc spice_dac_t*? 
 make-spice_dac_t*)
(export spice_dac_t* spice_dac_t*? make-spice_dac_t*)
(fh-ref<=>deref!
  spice_dac_t*
  make-spice_dac_t*
  spice_dac_t
  make-spice_dac_t)
(define-public struct-spice_dac-desc
  spice_dac_t-desc)
(define-fh-compound-type struct-spice_dac struct-spice_dac-desc 
 struct-spice_dac? make-struct-spice_dac)
(export struct-spice_dac struct-spice_dac? make-struct-spice_dac)
(define-public struct-spice_dac*-desc
  spice_dac_t*-desc)
(define-fh-pointer-type struct-spice_dac* struct-spice_dac*-desc 
 struct-spice_dac*? make-struct-spice_dac*)
(export struct-spice_dac* struct-spice_dac*? make-struct-spice_dac*)
(fh-ref<=>deref!
  struct-spice_dac*
  make-struct-spice_dac*
  struct-spice_dac
  make-struct-spice_dac)

;; typedef struct spice_adc {
;;   char *name; /* spice name */
;;   iopin_t *pin; /* connection */
;; } spice_adc_t;
(define-public spice_adc_t-desc
  (bs:struct
    (list `(name ,(fh:pointer int8))
          `(pin ,iopin_t*-desc))))
(define-fh-compound-type spice_adc_t spice_adc_t-desc spice_adc_t? 
 make-spice_adc_t)
(export spice_adc_t spice_adc_t? make-spice_adc_t)
(define-public spice_adc_t*-desc
  (fh:pointer spice_adc_t-desc))
(define-fh-pointer-type spice_adc_t* spice_adc_t*-desc spice_adc_t*? 
 make-spice_adc_t*)
(export spice_adc_t* spice_adc_t*? make-spice_adc_t*)
(fh-ref<=>deref!
  spice_adc_t*
  make-spice_adc_t*
  spice_adc_t
  make-spice_adc_t)
(define-public struct-spice_adc-desc
  spice_adc_t-desc)
(define-fh-compound-type struct-spice_adc struct-spice_adc-desc 
 struct-spice_adc? make-struct-spice_adc)
(export struct-spice_adc struct-spice_adc? make-struct-spice_adc)
(define-public struct-spice_adc*-desc
  spice_adc_t*-desc)
(define-fh-pointer-type struct-spice_adc* struct-spice_adc*-desc 
 struct-spice_adc*? make-struct-spice_adc*)
(export struct-spice_adc* struct-spice_adc*? make-struct-spice_adc*)
(fh-ref<=>deref!
  struct-spice_adc*
  make-struct-spice_adc*
  struct-spice_adc
  make-struct-spice_adc)

;; typedef spice_adc_t spice_mea_t;
(define-public spice_mea_t-desc spice_adc_t-desc)
(define-fh-type-alias spice_mea_t spice_adc_t)
(export spice_mea_t)
(define-public spice_mea_t? spice_adc_t?)
(define-public make-spice_mea_t make-spice_adc_t)
(define-public spice_mea_t*-desc spice_adc_t*-desc)
(define-fh-type-alias spice_mea_t* spice_adc_t*)
(export spice_mea_t*)
(define-public spice_mea_t*? spice_adc_t*?)
(define-public make-spice_mea_t* make-spice_adc_t*)

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
(define-public spice_t-desc
  (bs:struct
    (list `(hdl ,(fh:pointer 'void))
          `(dt_ns ,int)
          `(evt ,tmevt_t*-desc)
          `(nadc ,int)
          `(adc_names ,(fh:pointer (fh:pointer int8)))
          `(adcs ,(bs:vector 10 spice_adc_t-desc))
          `(ndac ,int)
          `(dac_names ,(fh:pointer (fh:pointer int8)))
          `(dacs ,(bs:vector 10 spice_dac_t-desc))
          `(nmea ,int)
          `(mea_names ,(fh:pointer (fh:pointer int8)))
          `(meas ,(bs:vector 10 spice_mea_t-desc))
          `(tv ,(bs:vector 2 double)))))
(define-fh-compound-type spice_t spice_t-desc spice_t? make-spice_t)
(export spice_t spice_t? make-spice_t)
(define-public spice_t*-desc
  (fh:pointer spice_t-desc))
(define-fh-pointer-type spice_t* spice_t*-desc spice_t*? make-spice_t*)
(export spice_t* spice_t*? make-spice_t*)
(fh-ref<=>deref!
  spice_t*
  make-spice_t*
  spice_t
  make-spice_t)
(define-public struct-spice-desc spice_t-desc)
(define-fh-compound-type struct-spice struct-spice-desc struct-spice? 
 make-struct-spice)
(export struct-spice struct-spice? make-struct-spice)
(define-public struct-spice*-desc spice_t*-desc)
(define-fh-pointer-type struct-spice* struct-spice*-desc struct-spice*? 
 make-struct-spice*)
(export struct-spice* struct-spice*? make-struct-spice*)
(fh-ref<=>deref!
  struct-spice*
  make-struct-spice*
  struct-spice
  make-struct-spice)

;; void spice_init(spice_t *, struct tmsch *clk, int argc, char **argv);
(define spice_init
  (let ((~spice_init
          (delay (fh-link-proc
                   ffi:void
                   "spice_init"
                   (list ffi-void* ffi-void* ffi:int ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (arg0 clk argc argv)
      (let ((~arg0 ((fht-unwrap spice_t*) arg0))
            (~clk ((fht-unwrap struct-tmsch*) clk))
            (~argc (unwrap~fixed argc))
            (~argv (unwrap~pointer argv)))
        ((force ~spice_init) ~arg0 ~clk ~argc ~argv)))))
(export spice_init)

;; void spice_fini(spice_t *);
(define spice_fini
  (let ((~spice_fini
          (delay (fh-link-proc
                   ffi:void
                   "spice_fini"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap spice_t*) arg0)))
        ((force ~spice_fini) ~arg0)))))
(export spice_fini)

;; typedef enum {
;;   OCT_T_NONE,
;;   OCT_T_MCU,
;;   OCT_T_BUS,
;;   OCT_T_OSC,
;;   OCT_T_CIR,
;;   OCT_T__MAX,
;; } devtype_t;
(define devtype_t-enum-nvl
  '((OCT_T_NONE . 0)
    (OCT_T_MCU . 1)
    (OCT_T_BUS . 2)
    (OCT_T_OSC . 3)
    (OCT_T_CIR . 4)
    (OCT_T__MAX . 5))
  )
(define devtype_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       devtype_t-enum-nvl))
(define-public (unwrap-devtype_t n)
  (cond
   ((symbol? n)
    (or (assq-ref devtype_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-devtype_t v)
  (assq-ref devtype_t-enum-vnl v))

;; typedef struct device {
;;   struct device *next;
;;   struct device *prev;
;;   char *name; /* interned name */
;;   devtype_t type;
;;   void *guts;
;; } device_t;
(define-public device_t-desc
  (bs:struct
    (list `(next ,(fh:pointer 'void))
          `(prev ,(fh:pointer 'void))
          `(name ,(fh:pointer int8))
          `(type ,int)
          `(guts ,(fh:pointer 'void)))))
(define-fh-compound-type device_t device_t-desc device_t? make-device_t)
(export device_t device_t? make-device_t)
(define-public device_t*-desc
  (fh:pointer device_t-desc))
(define-fh-pointer-type device_t* device_t*-desc device_t*? make-device_t*)
(export device_t* device_t*? make-device_t*)
(fh-ref<=>deref!
  device_t*
  make-device_t*
  device_t
  make-device_t)
(define-public struct-device-desc device_t-desc)
(define-fh-compound-type struct-device struct-device-desc struct-device? 
 make-struct-device)
(export struct-device struct-device? make-struct-device)
(define-public struct-device*-desc
  device_t*-desc)
(define-fh-pointer-type struct-device* struct-device*-desc struct-device*? 
 make-struct-device*)
(export struct-device* struct-device*? make-struct-device*)
(fh-ref<=>deref!
  struct-device*
  make-struct-device*
  struct-device
  make-struct-device)

;; struct env {
;;   tmsch_t clk;
;;   struct {
;;     unsigned use_spice : 1;
;;   } flag;
;;   device_t htab[31];
;;   spice_t spice;
;; };
(define-public struct-env-desc
  (bs:struct
    (list `(clk ,tmsch_t-desc)
          `(flag ,(bs:struct (list `(use_spice ,unsigned-int 1))))
          `(htab ,(bs:vector 31 device_t-desc))
          `(spice ,spice_t-desc))))
(define-fh-compound-type struct-env struct-env-desc struct-env? 
 make-struct-env)
(export struct-env struct-env? make-struct-env)
(define-public struct-env*-desc
  (fh:pointer struct-env-desc))
(define-fh-pointer-type struct-env* struct-env*-desc struct-env*? 
 make-struct-env*)
(export struct-env* struct-env*? make-struct-env*)
(fh-ref<=>deref!
  struct-env*
  make-struct-env*
  struct-env
  make-struct-env)

;; typedef struct env sys_t;
(define-public sys_t-desc struct-env-desc)
(define-public sys_t*-desc struct-env*-desc)
(define-fh-compound-type sys_t sys_t-desc sys_t? make-sys_t)
(export sys_t sys_t? make-sys_t)
(define-fh-pointer-type sys_t* sys_t*-desc sys_t*? make-sys_t*)
(export sys_t* sys_t*? make-sys_t*)

;; sys_t *make_sys(int argc, char **argv);
(define make_sys
  (let ((~make_sys
          (delay (fh-link-proc
                   ffi-void*
                   "make_sys"
                   (list ffi:int ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (argc argv)
      (let ((~argc (unwrap~fixed argc))
            (~argv (unwrap~pointer argv)))
        ((fht-wrap sys_t*)
         ((force ~make_sys) ~argc ~argv))))))
(export make_sys)

;; void sys_init(sys_t *sys, int argc, char **argv);
(define sys_init
  (let ((~sys_init
          (delay (fh-link-proc
                   ffi:void
                   "sys_init"
                   (list ffi-void* ffi:int ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys argc argv)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~argc (unwrap~fixed argc))
            (~argv (unwrap~pointer argv)))
        ((force ~sys_init) ~sys ~argc ~argv)))))
(export sys_init)

;; void sys_fini(sys_t *sys);
(define sys_fini
  (let ((~sys_fini
          (delay (fh-link-proc
                   ffi:void
                   "sys_fini"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys)
      (let ((~sys ((fht-unwrap sys_t*) sys)))
        ((force ~sys_fini) ~sys)))))
(export sys_fini)

;; device_t *dev_insert(sys_t *sys, char *name, devtype_t type, void *dev);
(define dev_insert
  (let ((~dev_insert
          (delay (fh-link-proc
                   ffi-void*
                   "dev_insert"
                   (list ffi-void* ffi-void* ffi:int ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys name type dev)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~name (unwrap~pointer name))
            (~type (unwrap-devtype_t type))
            (~dev (unwrap~pointer dev)))
        ((fht-wrap device_t*)
         ((force ~dev_insert) ~sys ~name ~type ~dev))))))
(export dev_insert)

;; device_t *dev_lookup(sys_t *sys, char *name);
(define dev_lookup
  (let ((~dev_lookup
          (delay (fh-link-proc
                   ffi-void*
                   "dev_lookup"
                   (list ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys name)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~name (unwrap~pointer name)))
        ((fht-wrap device_t*)
         ((force ~dev_lookup) ~sys ~name))))))
(export dev_lookup)

;; char *dev_name(device_t *dev);
(define dev_name
  (let ((~dev_name
          (delay (fh-link-proc
                   ffi-void*
                   "dev_name"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (dev)
      (let ((~dev ((fht-unwrap device_t*) dev)))
        ((force ~dev_name) ~dev)))))
(export dev_name)

;; int dev_type(device_t *dev);
(define dev_type
  (let ((~dev_type
          (delay (fh-link-proc
                   ffi:int
                   "dev_type"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (dev)
      (let ((~dev ((fht-unwrap device_t*) dev)))
        ((force ~dev_type) ~dev)))))
(export dev_type)

;; void *dev_guts(device_t *dev);
(define dev_guts
  (let ((~dev_guts
          (delay (fh-link-proc
                   ffi-void*
                   "dev_guts"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (dev)
      (let ((~dev ((fht-unwrap device_t*) dev)))
        ((force ~dev_guts) ~dev)))))
(export dev_guts)

;; typedef enum {
;;   BUS_LEV_LOW = 0,
;;   BUS_LEV_HI = 1,
;; } buslev_t;
(define buslev_t-enum-nvl
  '((BUS_LEV_LOW . 0) (BUS_LEV_HI . 1))
  )
(define buslev_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       buslev_t-enum-nvl))
(define-public (unwrap-buslev_t n)
  (cond
   ((symbol? n)
    (or (assq-ref buslev_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-buslev_t v)
  (assq-ref buslev_t-enum-vnl v))

;; typedef struct bus {
;;   tmsch_t *tmsch;
;;   int npin;
;;   iopin_t *pins[4];
;;   int lev;
;;   uint32_t t_rise_ns;
;;   uint32_t t_fall_ns;
;;   tmevt_t *relevel_act;
;; } bus_t;
(define-public bus_t-desc
  (bs:struct
    (list `(tmsch ,tmsch_t*-desc)
          `(npin ,int)
          `(pins ,(bs:vector 4 iopin_t*-desc))
          `(lev ,int)
          `(t_rise_ns ,uint32)
          `(t_fall_ns ,uint32)
          `(relevel_act ,tmevt_t*-desc))))
(define-fh-compound-type bus_t bus_t-desc bus_t? make-bus_t)
(export bus_t bus_t? make-bus_t)
(define-public bus_t*-desc
  (fh:pointer bus_t-desc))
(define-fh-pointer-type bus_t* bus_t*-desc bus_t*? make-bus_t*)
(export bus_t* bus_t*? make-bus_t*)
(fh-ref<=>deref!
  bus_t*
  make-bus_t*
  bus_t
  make-bus_t)
(define-public struct-bus-desc bus_t-desc)
(define-fh-compound-type struct-bus struct-bus-desc struct-bus? 
 make-struct-bus)
(export struct-bus struct-bus? make-struct-bus)
(define-public struct-bus*-desc bus_t*-desc)
(define-fh-pointer-type struct-bus* struct-bus*-desc struct-bus*? 
 make-struct-bus*)
(export struct-bus* struct-bus*? make-struct-bus*)
(fh-ref<=>deref!
  struct-bus*
  make-struct-bus*
  struct-bus
  make-struct-bus)

;; bus_t *make_bus(tmsch_t *sch);
(define make_bus
  (let ((~make_bus
          (delay (fh-link-proc
                   ffi-void*
                   "make_bus"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sch)
      (let ((~sch ((fht-unwrap tmsch_t*) sch)))
        ((fht-wrap bus_t*) ((force ~make_bus) ~sch))))))
(export make_bus)

;; void bus_relevel(bus_t *bus);
(define bus_relevel
  (let ((~bus_relevel
          (delay (fh-link-proc
                   ffi:void
                   "bus_relevel"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (bus)
      (let ((~bus ((fht-unwrap bus_t*) bus)))
        ((force ~bus_relevel) ~bus)))))
(export bus_relevel)

;; void bus_conn_to_pin(bus_t *bus, iopin_t *pin);
(define bus_conn_to_pin
  (let ((~bus_conn_to_pin
          (delay (fh-link-proc
                   ffi:void
                   "bus_conn_to_pin"
                   (list ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (bus pin)
      (let ((~bus ((fht-unwrap bus_t*) bus))
            (~pin ((fht-unwrap iopin_t*) pin)))
        ((force ~bus_conn_to_pin) ~bus ~pin)))))
(export bus_conn_to_pin)

;; void bus_pin_changed(void *tgt, struct iopin *pin, int op, int arg);
(define bus_pin_changed
  (let ((~bus_pin_changed
          (delay (fh-link-proc
                   ffi:void
                   "bus_pin_changed"
                   (list ffi-void* ffi-void* ffi:int ffi:int)
                   (force ffi-octsx-llibs)))))
    (lambda (tgt pin op arg)
      (let ((~tgt (unwrap~pointer tgt))
            (~pin ((fht-unwrap struct-iopin*) pin))
            (~op (unwrap~fixed op))
            (~arg (unwrap~fixed arg)))
        ((force ~bus_pin_changed) ~tgt ~pin ~op ~arg)))))
(export bus_pin_changed)

;; mcu_t *make_mcu(tmsch_t *tmsch, char *dev, char *code);
(define make_mcu
  (let ((~make_mcu
          (delay (fh-link-proc
                   ffi-void*
                   "make_mcu"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (tmsch dev code)
      (let ((~tmsch ((fht-unwrap tmsch_t*) tmsch))
            (~dev (unwrap~pointer dev))
            (~code (unwrap~pointer code)))
        ((fht-wrap mcu_t*)
         ((force ~make_mcu) ~tmsch ~dev ~code))))))
(export make_mcu)

;; cpu_t *get_mcu_cpu(mcu_t *mcu);
(define get_mcu_cpu
  (let ((~get_mcu_cpu
          (delay (fh-link-proc
                   ffi-void*
                   "get_mcu_cpu"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (mcu)
      (let ((~mcu ((fht-unwrap mcu_t*) mcu)))
        ((fht-wrap cpu_t*) ((force ~get_mcu_cpu) ~mcu))))))
(export get_mcu_cpu)

;; tmsch_t *sys_tmsch(sys_t *sys);
(define sys_tmsch
  (let ((~sys_tmsch
          (delay (fh-link-proc
                   ffi-void*
                   "sys_tmsch"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys)
      (let ((~sys ((fht-unwrap sys_t*) sys)))
        ((fht-wrap tmsch_t*) ((force ~sys_tmsch) ~sys))))))
(export sys_tmsch)

;; tkclk_t *sys_cpu_clk(sys_t *sys);
(define sys_cpu_clk
  (let ((~sys_cpu_clk
          (delay (fh-link-proc
                   ffi-void*
                   "sys_cpu_clk"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys)
      (let ((~sys ((fht-unwrap sys_t*) sys)))
        ((fht-wrap tkclk_t*) ((force ~sys_cpu_clk) ~sys))))))
(export sys_cpu_clk)

;; tmsch_t *get_sys_clk(sys_t *sys);
(define get_sys_clk
  (let ((~get_sys_clk
          (delay (fh-link-proc
                   ffi-void*
                   "get_sys_clk"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys)
      (let ((~sys ((fht-unwrap sys_t*) sys)))
        ((fht-wrap tmsch_t*) ((force ~get_sys_clk) ~sys))))))
(export get_sys_clk)

;; simtime_t get_simtime(sys_t *sys);
(define get_simtime
  (let ((~get_simtime
          (delay (fh-link-proc
                   (list ffi:int32 ffi:int32)
                   "get_simtime"
                   (list ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys)
      (let ((~sys ((fht-unwrap sys_t*) sys)))
        ((fht-wrap simtime_t)
         ((force ~get_simtime) ~sys))))))
(export get_simtime)

;; void get_simtime_tp(sys_t *sys, simtime_t *tp);
(define get_simtime_tp
  (let ((~get_simtime_tp
          (delay (fh-link-proc
                   ffi:void
                   "get_simtime_tp"
                   (list ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys tp)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~tp ((fht-unwrap simtime_t*) tp)))
        ((force ~get_simtime_tp) ~sys ~tp)))))
(export get_simtime_tp)

;; void sys_run_to(sys_t *sys, simtime_t to);
(define sys_run_to
  (let ((~sys_run_to
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_to"
                   (list ffi-void* (list ffi:int32 ffi:int32))
                   (force ffi-octsx-llibs)))))
    (lambda (sys to)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~to ((fht-unwrap simtime_t) to)))
        ((force ~sys_run_to) ~sys ~to)))))
(export sys_run_to)

;; void sys_run_ns(sys_t *sys, long ns);
(define sys_run_ns
  (let ((~sys_run_ns
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_ns"
                   (list ffi-void* ffi:long)
                   (force ffi-octsx-llibs)))))
    (lambda (sys ns)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~ns (unwrap~fixed ns)))
        ((force ~sys_run_ns) ~sys ~ns)))))
(export sys_run_ns)

;; void sys_run_sns(sys_t *sys, long s, long ns);
(define sys_run_sns
  (let ((~sys_run_sns
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_sns"
                   (list ffi-void* ffi:long ffi:long)
                   (force ffi-octsx-llibs)))))
    (lambda (sys s ns)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~s (unwrap~fixed s))
            (~ns (unwrap~fixed ns)))
        ((force ~sys_run_sns) ~sys ~s ~ns)))))
(export sys_run_sns)

;; void sys_run_sus(sys_t *sys, long s, long us);
(define sys_run_sus
  (let ((~sys_run_sus
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_sus"
                   (list ffi-void* ffi:long ffi:long)
                   (force ffi-octsx-llibs)))))
    (lambda (sys s us)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~s (unwrap~fixed s))
            (~us (unwrap~fixed us)))
        ((force ~sys_run_sus) ~sys ~s ~us)))))
(export sys_run_sus)

;; void sys_run_sms(sys_t *sys, long s, long ms);
(define sys_run_sms
  (let ((~sys_run_sms
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_sms"
                   (list ffi-void* ffi:long ffi:long)
                   (force ffi-octsx-llibs)))))
    (lambda (sys s ms)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~s (unwrap~fixed s))
            (~ms (unwrap~fixed ms)))
        ((force ~sys_run_sms) ~sys ~s ~ms)))))
(export sys_run_sms)

;; void sys_run_to_cpu_addr(sys_t *sys, cpu_t *cpu, uint32_t pc);
(define sys_run_to_cpu_addr
  (let ((~sys_run_to_cpu_addr
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_to_cpu_addr"
                   (list ffi-void* ffi-void* ffi:uint32)
                   (force ffi-octsx-llibs)))))
    (lambda (sys cpu pc)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~cpu ((fht-unwrap cpu_t*) cpu))
            (~pc (unwrap~fixed pc)))
        ((force ~sys_run_to_cpu_addr) ~sys ~cpu ~pc)))))
(export sys_run_to_cpu_addr)

;; void sys_run_dt(sys_t *sys, float dt);
(define sys_run_dt
  (let ((~sys_run_dt
          (delay (fh-link-proc
                   ffi:void
                   "sys_run_dt"
                   (list ffi-void* ffi:float)
                   (force ffi-octsx-llibs)))))
    (lambda (sys dt)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~dt (unwrap~float dt)))
        ((force ~sys_run_dt) ~sys ~dt)))))
(export sys_run_dt)

;; void sys_cont(sys_t *sys, cpu_t *cpu);
(define sys_cont
  (let ((~sys_cont
          (delay (fh-link-proc
                   ffi:void
                   "sys_cont"
                   (list ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (sys cpu)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~sys_cont) ~sys ~cpu)))))
(export sys_cont)

;; void sys_cpu_next(sys_t *sys, cpu_t *cpu, int n);
(define sys_cpu_next
  (let ((~sys_cpu_next
          (delay (fh-link-proc
                   ffi:void
                   "sys_cpu_next"
                   (list ffi-void* ffi-void* ffi:int)
                   (force ffi-octsx-llibs)))))
    (lambda (sys cpu n)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~cpu ((fht-unwrap cpu_t*) cpu))
            (~n (unwrap~fixed n)))
        ((force ~sys_cpu_next) ~sys ~cpu ~n)))))
(export sys_cpu_next)

;; void sys_cpu_step(sys_t *sys, cpu_t *cpu, int n);
(define sys_cpu_step
  (let ((~sys_cpu_step
          (delay (fh-link-proc
                   ffi:void
                   "sys_cpu_step"
                   (list ffi-void* ffi-void* ffi:int)
                   (force ffi-octsx-llibs)))))
    (lambda (sys cpu n)
      (let ((~sys ((fht-unwrap sys_t*) sys))
            (~cpu ((fht-unwrap cpu_t*) cpu))
            (~n (unwrap~fixed n)))
        ((force ~sys_cpu_step) ~sys ~cpu ~n)))))
(export sys_cpu_step)

;; iopin_t *mcu_pin_byname(mcu_t *mcu, char *name);
(define mcu_pin_byname
  (let ((~mcu_pin_byname
          (delay (fh-link-proc
                   ffi-void*
                   "mcu_pin_byname"
                   (list ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (mcu name)
      (let ((~mcu ((fht-unwrap mcu_t*) mcu))
            (~name (unwrap~pointer name)))
        ((fht-wrap iopin_t*)
         ((force ~mcu_pin_byname) ~mcu ~name))))))
(export mcu_pin_byname)

;; void connect_nodes(iopin_t *a, iopin_t *b);
(define connect_nodes
  (let ((~connect_nodes
          (delay (fh-link-proc
                   ffi:void
                   "connect_nodes"
                   (list ffi-void* ffi-void*)
                   (force ffi-octsx-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap iopin_t*) a))
            (~b ((fht-unwrap iopin_t*) b)))
        ((force ~connect_nodes) ~a ~b)))))
(export connect_nodes)

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
    (OCT_HSIZ . 31)
    (SPC_MEA_MAX . 10)
    (SPC_DAC_MAX . 10)
    (SPC_ADC_MAX . 10)))

(define ffi-octsx-symbol-val
  (lambda (k)
    (or (assq-ref ffi-octsx-symbol-tab k)
        (ffi-octbx-symbol-val k))))
(export ffi-octsx-symbol-val)

(define (unwrap-enum obj)
  (cond ((number? obj) obj)
        ((symbol? obj) (ffi-octsx-symbol-val obj))
        ((fh-object? obj) (struct-ref obj 0))
        (else (error "type mismatch"))))

(define ffi-octsx-types
  '((struct . "spice_dac") (pointer . "spice_dac_t") "spice_dac_t" (struct . 
    "spice_adc") (pointer . "spice_adc_t") "spice_adc_t" "spice_mea_t" 
    (struct . "spice") (pointer . "spice_t") "spice_t" (struct . "device") 
    (pointer . "device_t") "device_t" (struct . "env") (pointer . "sys_t") 
    "sys_t" (struct . "bus") (pointer . "bus_t") "bus_t"))
(export ffi-octsx-types)

;; --- last line ---
