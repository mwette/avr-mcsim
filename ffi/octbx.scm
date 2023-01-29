;; generated with `guild compile-ffi ffi/octbx.ffi'

(define-module (ffi octbx)
  #:use-module (ffi ffi-help-rt)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (bytestructures guile))

(define ffi-octbx-llibs
  (delay (list (dynamic-link "liboctbx"))))


;; typedef struct simtime {
;;   int32_t sec; /* seconds */
;;   int32_t nsec; /* nano-seconds => ssec ?? */
;; } simtime_t;
(define-public simtime_t-desc
  (bs:struct (list `(sec ,int32) `(nsec ,int32))))
(define-fh-compound-type simtime_t simtime_t-desc simtime_t? make-simtime_t)
(export simtime_t simtime_t? make-simtime_t)
(define-public simtime_t*-desc
  (fh:pointer simtime_t-desc))
(define-fh-pointer-type simtime_t* simtime_t*-desc simtime_t*? make-simtime_t*
 )
(export simtime_t* simtime_t*? make-simtime_t*)
(fh-ref<=>deref!
  simtime_t*
  make-simtime_t*
  simtime_t
  make-simtime_t)
(define-public struct-simtime-desc
  simtime_t-desc)
(define-fh-compound-type struct-simtime struct-simtime-desc struct-simtime? 
 make-struct-simtime)
(export struct-simtime struct-simtime? make-struct-simtime)
(define-public struct-simtime*-desc
  simtime_t*-desc)
(define-fh-pointer-type struct-simtime* struct-simtime*-desc struct-simtime*? 
 make-struct-simtime*)
(export struct-simtime* struct-simtime*? make-struct-simtime*)
(fh-ref<=>deref!
  struct-simtime*
  make-struct-simtime*
  struct-simtime
  make-struct-simtime)

;; uint32_t u_genseed(void );
(define u_genseed
  (let ((~u_genseed
          (delay (fh-link-proc
                   ffi:uint32
                   "u_genseed"
                   (list)
                   (force ffi-octbx-llibs)))))
    (lambda () (let () ((force ~u_genseed))))))
(export u_genseed)

;; uint32_t make_rand();
(define make_rand
  (let ((~make_rand
          (delay (fh-link-proc
                   ffi:uint32
                   "make_rand"
                   (list)
                   (force ffi-octbx-llibs)))))
    (lambda () (let () ((force ~make_rand))))))
(export make_rand)

;; float nml_rand(unsigned int *seedp);
(define nml_rand
  (let ((~nml_rand
          (delay (fh-link-proc
                   ffi:float
                   "nml_rand"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (seedp)
      (let ((~seedp (unwrap~pointer seedp)))
        ((force ~nml_rand) ~seedp)))))
(export nml_rand)

;; int tm_lt(simtime_t a, simtime_t b);
(define tm_lt
  (let ((~tm_lt
          (delay (fh-link-proc
                   ffi:int
                   "tm_lt"
                   (list (list ffi:int32 ffi:int32)
                         (list ffi:int32 ffi:int32))
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap simtime_t) a))
            (~b ((fht-unwrap simtime_t) b)))
        ((force ~tm_lt) ~a ~b)))))
(export tm_lt)

;; int tm_le(simtime_t a, simtime_t b);
(define tm_le
  (let ((~tm_le
          (delay (fh-link-proc
                   ffi:int
                   "tm_le"
                   (list (list ffi:int32 ffi:int32)
                         (list ffi:int32 ffi:int32))
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap simtime_t) a))
            (~b ((fht-unwrap simtime_t) b)))
        ((force ~tm_le) ~a ~b)))))
(export tm_le)

;; int tm_gt(simtime_t a, simtime_t b);
(define tm_gt
  (let ((~tm_gt
          (delay (fh-link-proc
                   ffi:int
                   "tm_gt"
                   (list (list ffi:int32 ffi:int32)
                         (list ffi:int32 ffi:int32))
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap simtime_t) a))
            (~b ((fht-unwrap simtime_t) b)))
        ((force ~tm_gt) ~a ~b)))))
(export tm_gt)

;; int tm_ge(simtime_t a, simtime_t b);
(define tm_ge
  (let ((~tm_ge
          (delay (fh-link-proc
                   ffi:int
                   "tm_ge"
                   (list (list ffi:int32 ffi:int32)
                         (list ffi:int32 ffi:int32))
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap simtime_t) a))
            (~b ((fht-unwrap simtime_t) b)))
        ((force ~tm_ge) ~a ~b)))))
(export tm_ge)

;; simtime_t tm_add_ns(simtime_t ts, int nsec);
(define tm_add_ns
  (let ((~tm_add_ns
          (delay (fh-link-proc
                   (list ffi:int32 ffi:int32)
                   "tm_add_ns"
                   (list (list ffi:int32 ffi:int32) ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (ts nsec)
      (let ((~ts ((fht-unwrap simtime_t) ts))
            (~nsec (unwrap~fixed nsec)))
        ((fht-wrap simtime_t)
         ((force ~tm_add_ns) ~ts ~nsec))))))
(export tm_add_ns)

;; simtime_t tm_add(simtime_t a, simtime_t b);
(define tm_add
  (let ((~tm_add
          (delay (fh-link-proc
                   (list ffi:int32 ffi:int32)
                   "tm_add"
                   (list (list ffi:int32 ffi:int32)
                         (list ffi:int32 ffi:int32))
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap simtime_t) a))
            (~b ((fht-unwrap simtime_t) b)))
        ((fht-wrap simtime_t) ((force ~tm_add) ~a ~b))))))
(export tm_add)

;; float tm_to_float(simtime_t a);
(define tm_to_float
  (let ((~tm_to_float
          (delay (fh-link-proc
                   ffi:float
                   "tm_to_float"
                   (list (list ffi:int32 ffi:int32))
                   (force ffi-octbx-llibs)))))
    (lambda (a)
      (let ((~a ((fht-unwrap simtime_t) a)))
        ((force ~tm_to_float) ~a)))))
(export tm_to_float)

;; simtime_t tm_from_float(float t);
(define tm_from_float
  (let ((~tm_from_float
          (delay (fh-link-proc
                   (list ffi:int32 ffi:int32)
                   "tm_from_float"
                   (list ffi:float)
                   (force ffi-octbx-llibs)))))
    (lambda (t)
      (let ((~t (unwrap~float t)))
        ((fht-wrap simtime_t)
         ((force ~tm_from_float) ~t))))))
(export tm_from_float)

;; typedef void tmevt_rout_t(void *, struct tmsch *);
(define tmevt_rout_t
  (let ((~tmevt_rout_t
          (delay (fh-link-proc
                   ffi:void
                   "tmevt_rout_t"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 arg1)
      (let ((~arg0 (unwrap~pointer arg0))
            (~arg1 (unwrap~pointer arg1)))
        ((force ~tmevt_rout_t) ~arg0 ~arg1)))))
(export tmevt_rout_t)

;; typedef struct tmevt {
;;   struct tmevt *prev;
;;   struct tmevt *next;
;;   simtime_t when;
;;   int8_t neps;
;;   tmevt_rout_t *rout;
;;   void *arg;
;;   const char *name;
;; } tmevt_t;
(define-public tmevt_t-desc
  (bs:struct
    (list `(prev ,(fh:pointer 'void))
          `(next ,(fh:pointer 'void))
          `(when ,simtime_t-desc)
          `(neps ,int8)
          `(rout ,(fh:function
                    'void
                    (list (fh:pointer 'void) (fh:pointer 'void))))
          `(arg ,(fh:pointer 'void))
          `(name ,(fh:pointer int8)))))
(define-fh-compound-type tmevt_t tmevt_t-desc tmevt_t? make-tmevt_t)
(export tmevt_t tmevt_t? make-tmevt_t)
(define-public tmevt_t*-desc
  (fh:pointer tmevt_t-desc))
(define-fh-pointer-type tmevt_t* tmevt_t*-desc tmevt_t*? make-tmevt_t*)
(export tmevt_t* tmevt_t*? make-tmevt_t*)
(fh-ref<=>deref!
  tmevt_t*
  make-tmevt_t*
  tmevt_t
  make-tmevt_t)
(define-public struct-tmevt-desc tmevt_t-desc)
(define-fh-compound-type struct-tmevt struct-tmevt-desc struct-tmevt? 
 make-struct-tmevt)
(export struct-tmevt struct-tmevt? make-struct-tmevt)
(define-public struct-tmevt*-desc tmevt_t*-desc)
(define-fh-pointer-type struct-tmevt* struct-tmevt*-desc struct-tmevt*? 
 make-struct-tmevt*)
(export struct-tmevt* struct-tmevt*? make-struct-tmevt*)
(fh-ref<=>deref!
  struct-tmevt*
  make-struct-tmevt*
  struct-tmevt
  make-struct-tmevt)

;; typedef struct tmsch {
;;   tmevt_t todo;
;;   tmevt_t done;
;;   tmevt_t *evt;
;;   simtime_t time;
;;   tmevt_t *evts;
;; } tmsch_t;
(define-public tmsch_t-desc
  (bs:struct
    (list `(todo ,tmevt_t-desc)
          `(done ,tmevt_t-desc)
          `(evt ,tmevt_t*-desc)
          `(time ,simtime_t-desc)
          `(evts ,tmevt_t*-desc))))
(define-fh-compound-type tmsch_t tmsch_t-desc tmsch_t? make-tmsch_t)
(export tmsch_t tmsch_t? make-tmsch_t)
(define-public tmsch_t*-desc
  (fh:pointer tmsch_t-desc))
(define-fh-pointer-type tmsch_t* tmsch_t*-desc tmsch_t*? make-tmsch_t*)
(export tmsch_t* tmsch_t*? make-tmsch_t*)
(fh-ref<=>deref!
  tmsch_t*
  make-tmsch_t*
  tmsch_t
  make-tmsch_t)
(define-public struct-tmsch-desc tmsch_t-desc)
(define-fh-compound-type struct-tmsch struct-tmsch-desc struct-tmsch? 
 make-struct-tmsch)
(export struct-tmsch struct-tmsch? make-struct-tmsch)
(define-public struct-tmsch*-desc tmsch_t*-desc)
(define-fh-pointer-type struct-tmsch* struct-tmsch*-desc struct-tmsch*? 
 make-struct-tmsch*)
(export struct-tmsch* struct-tmsch*? make-struct-tmsch*)
(fh-ref<=>deref!
  struct-tmsch*
  make-struct-tmsch*
  struct-tmsch
  make-struct-tmsch)

;; void tmsch_init(tmsch_t *sch, int nevt);
(define tmsch_init
  (let ((~tmsch_init
          (delay (fh-link-proc
                   ffi:void
                   "tmsch_init"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (sch nevt)
      (let ((~sch ((fht-unwrap tmsch_t*) sch))
            (~nevt (unwrap~fixed nevt)))
        ((force ~tmsch_init) ~sch ~nevt)))))
(export tmsch_init)

;; void tmsch_fini(tmsch_t *sch);
(define tmsch_fini
  (let ((~tmsch_fini
          (delay (fh-link-proc
                   ffi:void
                   "tmsch_fini"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch)
      (let ((~sch ((fht-unwrap tmsch_t*) sch)))
        ((force ~tmsch_fini) ~sch)))))
(export tmsch_fini)

;; tmevt_t *tmsch_sched(tmsch_t *sch, simtime_t when, int8_t neps, tmevt_rout_t
;;      *rout, void *arg);
(define tmsch_sched
  (let ((~tmsch_sched
          (delay (fh-link-proc
                   ffi-void*
                   "tmsch_sched"
                   (list ffi-void*
                         (list ffi:int32 ffi:int32)
                         ffi:int8
                         ffi-void*
                         ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch when neps rout arg)
      (let ((~sch ((fht-unwrap tmsch_t*) sch))
            (~when ((fht-unwrap simtime_t) when))
            (~neps (unwrap~fixed neps))
            (~rout ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void* ffi-void*))
                    rout))
            (~arg (unwrap~pointer arg)))
        ((fht-wrap tmevt_t*)
         ((force ~tmsch_sched)
          ~sch
          ~when
          ~neps
          ~rout
          ~arg))))))
(export tmsch_sched)

;; tmevt_t *tmsch_cancel(tmsch_t *sch, tmevt_t *evt);
(define tmsch_cancel
  (let ((~tmsch_cancel
          (delay (fh-link-proc
                   ffi-void*
                   "tmsch_cancel"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch evt)
      (let ((~sch ((fht-unwrap tmsch_t*) sch))
            (~evt ((fht-unwrap tmevt_t*) evt)))
        ((fht-wrap tmevt_t*)
         ((force ~tmsch_cancel) ~sch ~evt))))))
(export tmsch_cancel)

;; void tmsch_run(tmsch_t *sch, simtime_t to, int neps);
(define tmsch_run
  (let ((~tmsch_run
          (delay (fh-link-proc
                   ffi:void
                   "tmsch_run"
                   (list ffi-void*
                         (list ffi:int32 ffi:int32)
                         ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (sch to neps)
      (let ((~sch ((fht-unwrap tmsch_t*) sch))
            (~to ((fht-unwrap simtime_t) to))
            (~neps (unwrap~fixed neps)))
        ((force ~tmsch_run) ~sch ~to ~neps)))))
(export tmsch_run)

;; void tmsch_print(tmsch_t *sch);
(define tmsch_print
  (let ((~tmsch_print
          (delay (fh-link-proc
                   ffi:void
                   "tmsch_print"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch)
      (let ((~sch ((fht-unwrap tmsch_t*) sch)))
        ((force ~tmsch_print) ~sch)))))
(export tmsch_print)

;; void tmsch_break_ev(void *arg, tmsch_t *sch);
(define tmsch_break_ev
  (let ((~tmsch_break_ev
          (delay (fh-link-proc
                   ffi:void
                   "tmsch_break_ev"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg sch)
      (let ((~arg (unwrap~pointer arg))
            (~sch ((fht-unwrap tmsch_t*) sch)))
        ((force ~tmsch_break_ev) ~arg ~sch)))))
(export tmsch_break_ev)

;; typedef uint64_t osctick_t;

;; typedef uint64_t clktick_t;

;; int tk_lt(osctick_t a, osctick_t b);
(define tk_lt
  (let ((~tk_lt
          (delay (fh-link-proc
                   ffi:int
                   "tk_lt"
                   (list ffi:uint64 ffi:uint64)
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a (unwrap~fixed a)) (~b (unwrap~fixed b)))
        ((force ~tk_lt) ~a ~b)))))
(export tk_lt)

;; int tk_le(osctick_t a, osctick_t b);
(define tk_le
  (let ((~tk_le
          (delay (fh-link-proc
                   ffi:int
                   "tk_le"
                   (list ffi:uint64 ffi:uint64)
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a (unwrap~fixed a)) (~b (unwrap~fixed b)))
        ((force ~tk_le) ~a ~b)))))
(export tk_le)

;; int tk_gt(osctick_t a, osctick_t b);
(define tk_gt
  (let ((~tk_gt
          (delay (fh-link-proc
                   ffi:int
                   "tk_gt"
                   (list ffi:uint64 ffi:uint64)
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a (unwrap~fixed a)) (~b (unwrap~fixed b)))
        ((force ~tk_gt) ~a ~b)))))
(export tk_gt)

;; int tk_ge(osctick_t a, osctick_t b);
(define tk_ge
  (let ((~tk_ge
          (delay (fh-link-proc
                   ffi:int
                   "tk_ge"
                   (list ffi:uint64 ffi:uint64)
                   (force ffi-octbx-llibs)))))
    (lambda (a b)
      (let ((~a (unwrap~fixed a)) (~b (unwrap~fixed b)))
        ((force ~tk_ge) ~a ~b)))))
(export tk_ge)

;; typedef void tkevt_rout_t(void *, struct tkclk *);
(define tkevt_rout_t
  (let ((~tkevt_rout_t
          (delay (fh-link-proc
                   ffi:void
                   "tkevt_rout_t"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 arg1)
      (let ((~arg0 (unwrap~pointer arg0))
            (~arg1 (unwrap~pointer arg1)))
        ((force ~tkevt_rout_t) ~arg0 ~arg1)))))
(export tkevt_rout_t)

;; typedef struct tkevt {
;;   struct tkevt *prev;
;;   struct tkevt *next;
;;   struct tkclk *clk;
;;   osctick_t when;
;;   int8_t neps;
;;   tkevt_rout_t *rout;
;;   void *arg;
;;   const char *name;
;; } tkevt_t;
(define-public tkevt_t-desc
  (bs:struct
    (list `(prev ,(fh:pointer 'void))
          `(next ,(fh:pointer 'void))
          `(clk ,(fh:pointer 'void))
          `(when ,uint64)
          `(neps ,int8)
          `(rout ,(fh:function
                    'void
                    (list (fh:pointer 'void) (fh:pointer 'void))))
          `(arg ,(fh:pointer 'void))
          `(name ,(fh:pointer int8)))))
(define-fh-compound-type tkevt_t tkevt_t-desc tkevt_t? make-tkevt_t)
(export tkevt_t tkevt_t? make-tkevt_t)
(define-public tkevt_t*-desc
  (fh:pointer tkevt_t-desc))
(define-fh-pointer-type tkevt_t* tkevt_t*-desc tkevt_t*? make-tkevt_t*)
(export tkevt_t* tkevt_t*? make-tkevt_t*)
(fh-ref<=>deref!
  tkevt_t*
  make-tkevt_t*
  tkevt_t
  make-tkevt_t)
(define-public struct-tkevt-desc tkevt_t-desc)
(define-fh-compound-type struct-tkevt struct-tkevt-desc struct-tkevt? 
 make-struct-tkevt)
(export struct-tkevt struct-tkevt? make-struct-tkevt)
(define-public struct-tkevt*-desc tkevt_t*-desc)
(define-fh-pointer-type struct-tkevt* struct-tkevt*-desc struct-tkevt*? 
 make-struct-tkevt*)
(export struct-tkevt* struct-tkevt*? make-struct-tkevt*)
(fh-ref<=>deref!
  struct-tkevt*
  make-struct-tkevt*
  struct-tkevt
  make-struct-tkevt)

;; typedef struct tkosc {
;;   tkevt_t todo; /* scheduled */
;;   tkevt_t done; /* free */
;;   tkevt_t *evt; /* currently running */
;;   osctick_t tick; /* tick */
;;   simtime_t time; /* time at tick */
;;   float drift; /* drift at tick */
;;   uint32_t seed; /* rand number seed */
;;   tmsch_t *tmsch; /* scheduler for ticks */
;;   tmevt_t *tmevt; /* scheduled tick event */
;;   uint32_t neps; /* neps on tmsch */
;;   tkevt_t *tkevt; /* tick event */
;;   /* params */
;;   float tick_per; /* nominal tick dur (s) */
;;   float allan_dev; /* allan deviation (ppm) */
;;   float drift_dev; /* drift deviation (ppm) */
;;   float drift_rate; /* 1/ drift time  (s) */
;;   uint32_t step; /* step size in ticks */
;;   /* event heap */
;;   tkevt_t *evts; /* event list */
;; } tkosc_t;
(define-public tkosc_t-desc
  (bs:struct
    (list `(todo ,tkevt_t-desc)
          `(done ,tkevt_t-desc)
          `(evt ,tkevt_t*-desc)
          `(tick ,uint64)
          `(time ,simtime_t-desc)
          `(drift ,float)
          `(seed ,uint32)
          `(tmsch ,tmsch_t*-desc)
          `(tmevt ,tmevt_t*-desc)
          `(neps ,uint32)
          `(tkevt ,tkevt_t*-desc)
          `(tick_per ,float)
          `(allan_dev ,float)
          `(drift_dev ,float)
          `(drift_rate ,float)
          `(step ,uint32)
          `(evts ,tkevt_t*-desc))))
(define-fh-compound-type tkosc_t tkosc_t-desc tkosc_t? make-tkosc_t)
(export tkosc_t tkosc_t? make-tkosc_t)
(define-public tkosc_t*-desc
  (fh:pointer tkosc_t-desc))
(define-fh-pointer-type tkosc_t* tkosc_t*-desc tkosc_t*? make-tkosc_t*)
(export tkosc_t* tkosc_t*? make-tkosc_t*)
(fh-ref<=>deref!
  tkosc_t*
  make-tkosc_t*
  tkosc_t
  make-tkosc_t)
(define-public struct-tkosc-desc tkosc_t-desc)
(define-fh-compound-type struct-tkosc struct-tkosc-desc struct-tkosc? 
 make-struct-tkosc)
(export struct-tkosc struct-tkosc? make-struct-tkosc)
(define-public struct-tkosc*-desc tkosc_t*-desc)
(define-fh-pointer-type struct-tkosc* struct-tkosc*-desc struct-tkosc*? 
 make-struct-tkosc*)
(export struct-tkosc* struct-tkosc*? make-struct-tkosc*)
(fh-ref<=>deref!
  struct-tkosc*
  make-struct-tkosc*
  struct-tkosc
  make-struct-tkosc)

;; void tkosc_break_evt(void *arg, struct tkclk *clk);
(define tkosc_break_evt
  (let ((~tkosc_break_evt
          (delay (fh-link-proc
                   ffi:void
                   "tkosc_break_evt"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg clk)
      (let ((~arg (unwrap~pointer arg))
            (~clk (unwrap~pointer clk)))
        ((force ~tkosc_break_evt) ~arg ~clk)))))
(export tkosc_break_evt)

;; void tkosc_init(tkosc_t *sch, struct tmsch *tmsch, int nevt);
(define tkosc_init
  (let ((~tkosc_init
          (delay (fh-link-proc
                   ffi:void
                   "tkosc_init"
                   (list ffi-void* ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (sch tmsch nevt)
      (let ((~sch ((fht-unwrap tkosc_t*) sch))
            (~tmsch ((fht-unwrap struct-tmsch*) tmsch))
            (~nevt (unwrap~fixed nevt)))
        ((force ~tkosc_init) ~sch ~tmsch ~nevt)))))
(export tkosc_init)

;; void tkosc_fini(tkosc_t *sch);
(define tkosc_fini
  (let ((~tkosc_fini
          (delay (fh-link-proc
                   ffi:void
                   "tkosc_fini"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch)
      (let ((~sch ((fht-unwrap tkosc_t*) sch)))
        ((force ~tkosc_fini) ~sch)))))
(export tkosc_fini)

;; void tkosc_sync(tkosc_t *sch);
(define tkosc_sync
  (let ((~tkosc_sync
          (delay (fh-link-proc
                   ffi:void
                   "tkosc_sync"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch)
      (let ((~sch ((fht-unwrap tkosc_t*) sch)))
        ((force ~tkosc_sync) ~sch)))))
(export tkosc_sync)

;; void tkosc_print(tkosc_t *sch);
(define tkosc_print
  (let ((~tkosc_print
          (delay (fh-link-proc
                   ffi:void
                   "tkosc_print"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch)
      (let ((~sch ((fht-unwrap tkosc_t*) sch)))
        ((force ~tkosc_print) ~sch)))))
(export tkosc_print)

;; tkevt_t *tkosc_sched(tkosc_t *sch, osctick_t when, int8_t neps, tkevt_rout_t
;;      *rout, void *arg);
(define tkosc_sched
  (let ((~tkosc_sched
          (delay (fh-link-proc
                   ffi-void*
                   "tkosc_sched"
                   (list ffi-void*
                         ffi:uint64
                         ffi:int8
                         ffi-void*
                         ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch when neps rout arg)
      (let ((~sch ((fht-unwrap tkosc_t*) sch))
            (~when (unwrap~fixed when))
            (~neps (unwrap~fixed neps))
            (~rout ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void* ffi-void*))
                    rout))
            (~arg (unwrap~pointer arg)))
        ((fht-wrap tkevt_t*)
         ((force ~tkosc_sched)
          ~sch
          ~when
          ~neps
          ~rout
          ~arg))))))
(export tkosc_sched)

;; tkevt_t *tkosc_cancel(tkosc_t *sch, tkevt_t *evt);
(define tkosc_cancel
  (let ((~tkosc_cancel
          (delay (fh-link-proc
                   ffi-void*
                   "tkosc_cancel"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (sch evt)
      (let ((~sch ((fht-unwrap tkosc_t*) sch))
            (~evt ((fht-unwrap tkevt_t*) evt)))
        ((fht-wrap tkevt_t*)
         ((force ~tkosc_cancel) ~sch ~evt))))))
(export tkosc_cancel)

;; typedef struct tkclk {
;;   tkosc_t *osc; /* oscillator */
;;   clktick_t tick; /* clock tick = osctick/div */
;;   uint16_t div;
;; } tkclk_t;
(define-public tkclk_t-desc
  (bs:struct
    (list `(osc ,tkosc_t*-desc)
          `(tick ,uint64)
          `(div ,uint16))))
(define-fh-compound-type tkclk_t tkclk_t-desc tkclk_t? make-tkclk_t)
(export tkclk_t tkclk_t? make-tkclk_t)
(define-public tkclk_t*-desc
  (fh:pointer tkclk_t-desc))
(define-fh-pointer-type tkclk_t* tkclk_t*-desc tkclk_t*? make-tkclk_t*)
(export tkclk_t* tkclk_t*? make-tkclk_t*)
(fh-ref<=>deref!
  tkclk_t*
  make-tkclk_t*
  tkclk_t
  make-tkclk_t)
(define-public struct-tkclk-desc tkclk_t-desc)
(define-fh-compound-type struct-tkclk struct-tkclk-desc struct-tkclk? 
 make-struct-tkclk)
(export struct-tkclk struct-tkclk? make-struct-tkclk)
(define-public struct-tkclk*-desc tkclk_t*-desc)
(define-fh-pointer-type struct-tkclk* struct-tkclk*-desc struct-tkclk*? 
 make-struct-tkclk*)
(export struct-tkclk* struct-tkclk*? make-struct-tkclk*)
(fh-ref<=>deref!
  struct-tkclk*
  make-struct-tkclk*
  struct-tkclk
  make-struct-tkclk)

;; void tkclk_init(tkclk_t *, tkosc_t *tkosc, uint16_t div);
(define tkclk_init
  (let ((~tkclk_init
          (delay (fh-link-proc
                   ffi:void
                   "tkclk_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 tkosc div)
      (let ((~arg0 ((fht-unwrap tkclk_t*) arg0))
            (~tkosc ((fht-unwrap tkosc_t*) tkosc))
            (~div (unwrap~fixed div)))
        ((force ~tkclk_init) ~arg0 ~tkosc ~div)))))
(export tkclk_init)

;; tkevt_t *tkclk_sched(tkclk_t *clk, uint32_t delta, int8_t neps, tkevt_rout_t
;;      *rout, void *arg);
(define tkclk_sched
  (let ((~tkclk_sched
          (delay (fh-link-proc
                   ffi-void*
                   "tkclk_sched"
                   (list ffi-void*
                         ffi:uint32
                         ffi:int8
                         ffi-void*
                         ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (clk delta neps rout arg)
      (let ((~clk ((fht-unwrap tkclk_t*) clk))
            (~delta (unwrap~fixed delta))
            (~neps (unwrap~fixed neps))
            (~rout ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void* ffi-void*))
                    rout))
            (~arg (unwrap~pointer arg)))
        ((fht-wrap tkevt_t*)
         ((force ~tkclk_sched)
          ~clk
          ~delta
          ~neps
          ~rout
          ~arg))))))
(export tkclk_sched)

;; tkevt_t *tkclk_cancel(tkclk_t *clk, tkevt_t *evt);
(define tkclk_cancel
  (let ((~tkclk_cancel
          (delay (fh-link-proc
                   ffi-void*
                   "tkclk_cancel"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (clk evt)
      (let ((~clk ((fht-unwrap tkclk_t*) clk))
            (~evt ((fht-unwrap tkevt_t*) evt)))
        ((fht-wrap tkevt_t*)
         ((force ~tkclk_cancel) ~clk ~evt))))))
(export tkclk_cancel)

;; typedef enum {
;;   CPU_VERS_UNKNOWN,
;;   CPU_VERS_AVR,
;;   CPU_VERS_AVRe,
;;   CPU_VERS_AVRep,
;;   CPU_VERS_AVRxm,
;;   CPU_VERS_AVRxt,
;;   CPU_VERS_AVRrc,
;; } cpu_vers_t;
(define cpu_vers_t-enum-nvl
  '((CPU_VERS_UNKNOWN . 0)
    (CPU_VERS_AVR . 1)
    (CPU_VERS_AVRe . 2)
    (CPU_VERS_AVRep . 3)
    (CPU_VERS_AVRxm . 4)
    (CPU_VERS_AVRxt . 5)
    (CPU_VERS_AVRrc . 6))
  )
(define cpu_vers_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cpu_vers_t-enum-nvl))
(define-public (unwrap-cpu_vers_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cpu_vers_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cpu_vers_t v)
  (assq-ref cpu_vers_t-enum-vnl v))

;; typedef struct brkpt {
;;   uint32_t pc; /* word address */
;;   uint16_t insn; /* instruction saved */
;;   uint16_t _pad;
;; } brkpt_t;
(define-public brkpt_t-desc
  (bs:struct
    (list `(pc ,uint32)
          `(insn ,uint16)
          `(_pad ,uint16))))
(define-fh-compound-type brkpt_t brkpt_t-desc brkpt_t? make-brkpt_t)
(export brkpt_t brkpt_t? make-brkpt_t)
(define-public brkpt_t*-desc
  (fh:pointer brkpt_t-desc))
(define-fh-pointer-type brkpt_t* brkpt_t*-desc brkpt_t*? make-brkpt_t*)
(export brkpt_t* brkpt_t*? make-brkpt_t*)
(fh-ref<=>deref!
  brkpt_t*
  make-brkpt_t*
  brkpt_t
  make-brkpt_t)
(define-public struct-brkpt-desc brkpt_t-desc)
(define-fh-compound-type struct-brkpt struct-brkpt-desc struct-brkpt? 
 make-struct-brkpt)
(export struct-brkpt struct-brkpt? make-struct-brkpt)
(define-public struct-brkpt*-desc brkpt_t*-desc)
(define-fh-pointer-type struct-brkpt* struct-brkpt*-desc struct-brkpt*? 
 make-struct-brkpt*)
(export struct-brkpt* struct-brkpt*? make-struct-brkpt*)
(fh-ref<=>deref!
  struct-brkpt*
  make-struct-brkpt*
  struct-brkpt
  make-struct-brkpt)

;; typedef struct updval {
;;   uint16_t ix; /* addr */
;;   uint8_t dv; /* data */
;;   uint8_t mk; /* I/O mask */
;;   struct {
;;     uint8_t tg : 2; /* target: 0:reg 1:data */
;;   };
;; } updval_t;
(define-public updval_t-desc
  (bs:struct
    (list `(ix ,uint16)
          `(dv ,uint8)
          `(mk ,uint8)
          `(_1 ,(bs:struct (list `(tg ,uint8 2)))))))
(define-fh-compound-type updval_t updval_t-desc updval_t? make-updval_t)
(export updval_t updval_t? make-updval_t)
(define-public updval_t*-desc
  (fh:pointer updval_t-desc))
(define-fh-pointer-type updval_t* updval_t*-desc updval_t*? make-updval_t*)
(export updval_t* updval_t*? make-updval_t*)
(fh-ref<=>deref!
  updval_t*
  make-updval_t*
  updval_t
  make-updval_t)
(define-public struct-updval-desc updval_t-desc)
(define-fh-compound-type struct-updval struct-updval-desc struct-updval? 
 make-struct-updval)
(export struct-updval struct-updval? make-struct-updval)
(define-public struct-updval*-desc
  updval_t*-desc)
(define-fh-pointer-type struct-updval* struct-updval*-desc struct-updval*? 
 make-struct-updval*)
(export struct-updval* struct-updval*? make-struct-updval*)
(fh-ref<=>deref!
  struct-updval*
  make-struct-updval*
  struct-updval
  make-struct-updval)

;; typedef struct asmline {
;;   const char *fmt;
;;   int narg;
;;   int args[3];
;; } asmline_t;
(define-public asmline_t-desc
  (bs:struct
    (list `(fmt ,(fh:pointer int8))
          `(narg ,int)
          `(args ,(bs:vector 3 int)))))
(define-fh-compound-type asmline_t asmline_t-desc asmline_t? make-asmline_t)
(export asmline_t asmline_t? make-asmline_t)
(define-public asmline_t*-desc
  (fh:pointer asmline_t-desc))
(define-fh-pointer-type asmline_t* asmline_t*-desc asmline_t*? make-asmline_t*
 )
(export asmline_t* asmline_t*? make-asmline_t*)
(fh-ref<=>deref!
  asmline_t*
  make-asmline_t*
  asmline_t
  make-asmline_t)
(define-public struct-asmline-desc
  asmline_t-desc)
(define-fh-compound-type struct-asmline struct-asmline-desc struct-asmline? 
 make-struct-asmline)
(export struct-asmline struct-asmline? make-struct-asmline)
(define-public struct-asmline*-desc
  asmline_t*-desc)
(define-fh-pointer-type struct-asmline* struct-asmline*-desc struct-asmline*? 
 make-struct-asmline*)
(export struct-asmline* struct-asmline*? make-struct-asmline*)
(fh-ref<=>deref!
  struct-asmline*
  make-struct-asmline*
  struct-asmline
  make-struct-asmline)

;; typedef struct update {
;;   uint32_t pc; /* PC after this insn */
;;   int nclk; /* must be signed int */
;;   uint8_t nval;
;;   updval_t vals[8];
;;   uint8_t bpid; /* breakpoint */
;;   uint16_t insn; /* instruction */
;;   asmline_t asml;
;;   void (*insn_hook)(struct cpu *);
;; } update_t;
(define-public update_t-desc
  (bs:struct
    (list `(pc ,uint32)
          `(nclk ,int)
          `(nval ,uint8)
          `(vals ,(bs:vector 8 updval_t-desc))
          `(bpid ,uint8)
          `(insn ,uint16)
          `(asml ,asmline_t-desc)
          `(insn_hook
             ,(fh:function 'void (list (fh:pointer 'void)))))))
(define-fh-compound-type update_t update_t-desc update_t? make-update_t)
(export update_t update_t? make-update_t)
(define-public update_t*-desc
  (fh:pointer update_t-desc))
(define-fh-pointer-type update_t* update_t*-desc update_t*? make-update_t*)
(export update_t* update_t*? make-update_t*)
(fh-ref<=>deref!
  update_t*
  make-update_t*
  update_t
  make-update_t)
(define-public struct-update-desc update_t-desc)
(define-fh-compound-type struct-update struct-update-desc struct-update? 
 make-struct-update)
(export struct-update struct-update? make-struct-update)
(define-public struct-update*-desc
  update_t*-desc)
(define-fh-pointer-type struct-update* struct-update*-desc struct-update*? 
 make-struct-update*)
(export struct-update* struct-update*? make-struct-update*)
(fh-ref<=>deref!
  struct-update*
  make-struct-update*
  struct-update
  make-struct-update)

;; typedef struct cpu {
;;   struct mcu *host; /* host mcu */
;;   struct {
;;     uint8_t gen_asml : 1; /* gen adm for disp */
;;     uint8_t show_ba : 1; /* disp byte addr */
;;     uint8_t pc_22bits : 1; /* PC is 22 bits */
;;     uint8_t trace : 1; /* trace instructions */
;;     uint8_t asleep : 1; /* processor asleep */
;;     uint8_t sleepe : 1; /* sleep enabled */
;;     uint8_t inisr : 1; /* ISR in progress */
;;     uint8_t brkintr : 1; /* break on interrupt */
;;   };
;;   cpu_vers_t vers; /* version, to replace xmega */
;;   uint8_t iobase; /* IO base: 0 or 0x20 */
;;   struct {
;;     uint16_t RAMPX_IX;
;;     uint16_t RAMPY_IX;
;;     uint16_t RAMPZ_IX;
;;     uint16_t RAMPD_IX;
;;   };
;;   uint16_t EIND_IX;
;;   tkclk_t clk_cpu; /* cpu clock */
;;   uint8_t ccp_cnt; /* if > 0, insn OK */
;;   //tksch_t *asy_clk;  /* async clock */
;;   tkevt_t *xevt;
;;   //uint64_t imsk;     /* interrupt mask */
;;   uint32_t pc; /* covers 16 bit also */
;;   update_t upd; /* inst exec update */
;;   uint8_t *regs; /* register space */
;;   uint16_t *prog; /* address space */
;;   uint8_t *data; /* data space */
;;   uint8_t *onio; /* on I/O event map */
;;   uint16_t progsize; /* text size in 16bit words */
;;   uint16_t datasize; /* data size */
;;   brkpt_t brkpts[8];
;; } cpu_t;
(define-public cpu_t-desc
  (bs:struct
    (list `(host ,(fh:pointer 'void))
          `(_1 ,(bs:struct
                  (list `(gen_asml ,uint8 1)
                        `(show_ba ,uint8 1)
                        `(pc_22bits ,uint8 1)
                        `(trace ,uint8 1)
                        `(asleep ,uint8 1)
                        `(sleepe ,uint8 1)
                        `(inisr ,uint8 1)
                        `(brkintr ,uint8 1))))
          `(vers ,int)
          `(iobase ,uint8)
          `(_2 ,(bs:struct
                  (list `(RAMPX_IX ,uint16)
                        `(RAMPY_IX ,uint16)
                        `(RAMPZ_IX ,uint16)
                        `(RAMPD_IX ,uint16))))
          `(EIND_IX ,uint16)
          `(clk_cpu ,tkclk_t-desc)
          `(ccp_cnt ,uint8)
          `(xevt ,tkevt_t*-desc)
          `(pc ,uint32)
          `(upd ,update_t-desc)
          `(regs ,(fh:pointer uint8))
          `(prog ,(fh:pointer uint16))
          `(data ,(fh:pointer uint8))
          `(onio ,(fh:pointer uint8))
          `(progsize ,uint16)
          `(datasize ,uint16)
          `(brkpts ,(bs:vector 8 brkpt_t-desc)))))
(define-fh-compound-type cpu_t cpu_t-desc cpu_t? make-cpu_t)
(export cpu_t cpu_t? make-cpu_t)
(define-public cpu_t*-desc
  (fh:pointer cpu_t-desc))
(define-fh-pointer-type cpu_t* cpu_t*-desc cpu_t*? make-cpu_t*)
(export cpu_t* cpu_t*? make-cpu_t*)
(fh-ref<=>deref!
  cpu_t*
  make-cpu_t*
  cpu_t
  make-cpu_t)
(define-public struct-cpu-desc cpu_t-desc)
(define-fh-compound-type struct-cpu struct-cpu-desc struct-cpu? 
 make-struct-cpu)
(export struct-cpu struct-cpu? make-struct-cpu)
(define-public struct-cpu*-desc cpu_t*-desc)
(define-fh-pointer-type struct-cpu* struct-cpu*-desc struct-cpu*? 
 make-struct-cpu*)
(export struct-cpu* struct-cpu*? make-struct-cpu*)
(fh-ref<=>deref!
  struct-cpu*
  make-struct-cpu*
  struct-cpu
  make-struct-cpu)

;; typedef int (*insn_rout_t)(cpu_t *cpu, uint16_t insn);
(define-public insn_rout_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer
                     (bs:struct
                       (list `(host ,(fh:pointer 'void))
                             `(_1 ,(bs:struct
                                     (list `(gen_asml ,uint8 1)
                                           `(show_ba ,uint8 1)
                                           `(pc_22bits ,uint8 1)
                                           `(trace ,uint8 1)
                                           `(asleep ,uint8 1)
                                           `(sleepe ,uint8 1)
                                           `(inisr ,uint8 1)
                                           `(brkintr ,uint8 1))))
                             `(vers ,int)
                             `(iobase ,uint8)
                             `(_2 ,(bs:struct
                                     (list `(RAMPX_IX ,uint16)
                                           `(RAMPY_IX ,uint16)
                                           `(RAMPZ_IX ,uint16)
                                           `(RAMPD_IX ,uint16))))
                             `(EIND_IX ,uint16)
                             `(clk_cpu
                                ,(bs:struct
                                   (list `(osc ,(fh:pointer
                                                  (bs:struct
                                                    (list `(todo ,(bs:struct
                                                                    (list `(prev ,(fh:pointer
                                                                                    'void))
                                                                          `(next ,(fh:pointer
                                                                                    'void))
                                                                          `(clk ,(fh:pointer
                                                                                   'void))
                                                                          `(when ,uint64)
                                                                          `(neps ,int8)
                                                                          `(rout ,(fh:function
                                                                                    'void
                                                                                    (list (fh:pointer
                                                                                            'void)
                                                                                          (fh:pointer
                                                                                            'void))))
                                                                          `(arg ,(fh:pointer
                                                                                   'void))
                                                                          `(name ,(fh:pointer
                                                                                    int8)))))
                                                          `(done ,(bs:struct
                                                                    (list `(prev ,(fh:pointer
                                                                                    'void))
                                                                          `(next ,(fh:pointer
                                                                                    'void))
                                                                          `(clk ,(fh:pointer
                                                                                   'void))
                                                                          `(when ,uint64)
                                                                          `(neps ,int8)
                                                                          `(rout ,(fh:function
                                                                                    'void
                                                                                    (list (fh:pointer
                                                                                            'void)
                                                                                          (fh:pointer
                                                                                            'void))))
                                                                          `(arg ,(fh:pointer
                                                                                   'void))
                                                                          `(name ,(fh:pointer
                                                                                    int8)))))
                                                          `(evt ,(fh:pointer
                                                                   (bs:struct
                                                                     (list `(prev ,(fh:pointer
                                                                                     'void))
                                                                           `(next ,(fh:pointer
                                                                                     'void))
                                                                           `(clk ,(fh:pointer
                                                                                    'void))
                                                                           `(when ,uint64)
                                                                           `(neps ,int8)
                                                                           `(rout ,(fh:function
                                                                                     'void
                                                                                     (list (fh:pointer
                                                                                             'void)
                                                                                           (fh:pointer
                                                                                             'void))))
                                                                           `(arg ,(fh:pointer
                                                                                    'void))
                                                                           `(name ,(fh:pointer
                                                                                     int8))))))
                                                          `(tick ,uint64)
                                                          `(time ,(bs:struct
                                                                    (list `(sec ,int32)
                                                                          `(nsec ,int32))))
                                                          `(drift ,float)
                                                          `(seed ,uint32)
                                                          `(tmsch ,(fh:pointer
                                                                     (bs:struct
                                                                       (list `(todo ,(bs:struct
                                                                                       (list `(prev ,(fh:pointer
                                                                                                       'void))
                                                                                             `(next ,(fh:pointer
                                                                                                       'void))
                                                                                             `(when ,(bs:struct
                                                                                                       (list `(sec ,int32)
                                                                                                             `(nsec ,int32))))
                                                                                             `(neps ,int8)
                                                                                             `(rout ,(fh:function
                                                                                                       'void
                                                                                                       (list (fh:pointer
                                                                                                               'void)
                                                                                                             (fh:pointer
                                                                                                               'void))))
                                                                                             `(arg ,(fh:pointer
                                                                                                      'void))
                                                                                             `(name ,(fh:pointer
                                                                                                       int8)))))
                                                                             `(done ,(bs:struct
                                                                                       (list `(prev ,(fh:pointer
                                                                                                       'void))
                                                                                             `(next ,(fh:pointer
                                                                                                       'void))
                                                                                             `(when ,(bs:struct
                                                                                                       (list `(sec ,int32)
                                                                                                             `(nsec ,int32))))
                                                                                             `(neps ,int8)
                                                                                             `(rout ,(fh:function
                                                                                                       'void
                                                                                                       (list (fh:pointer
                                                                                                               'void)
                                                                                                             (fh:pointer
                                                                                                               'void))))
                                                                                             `(arg ,(fh:pointer
                                                                                                      'void))
                                                                                             `(name ,(fh:pointer
                                                                                                       int8)))))
                                                                             `(evt ,(fh:pointer
                                                                                      (bs:struct
                                                                                        (list `(prev ,(fh:pointer
                                                                                                        'void))
                                                                                              `(next ,(fh:pointer
                                                                                                        'void))
                                                                                              `(when ,(bs:struct
                                                                                                        (list `(sec ,int32)
                                                                                                              `(nsec ,int32))))
                                                                                              `(neps ,int8)
                                                                                              `(rout ,(fh:function
                                                                                                        'void
                                                                                                        (list (fh:pointer
                                                                                                                'void)
                                                                                                              (fh:pointer
                                                                                                                'void))))
                                                                                              `(arg ,(fh:pointer
                                                                                                       'void))
                                                                                              `(name ,(fh:pointer
                                                                                                        int8))))))
                                                                             `(time ,(bs:struct
                                                                                       (list `(sec ,int32)
                                                                                             `(nsec ,int32))))
                                                                             `(evts ,(fh:pointer
                                                                                       (bs:struct
                                                                                         (list `(prev ,(fh:pointer
                                                                                                         'void))
                                                                                               `(next ,(fh:pointer
                                                                                                         'void))
                                                                                               `(when ,(bs:struct
                                                                                                         (list `(sec ,int32)
                                                                                                               `(nsec ,int32))))
                                                                                               `(neps ,int8)
                                                                                               `(rout ,(fh:function
                                                                                                         'void
                                                                                                         (list (fh:pointer
                                                                                                                 'void)
                                                                                                               (fh:pointer
                                                                                                                 'void))))
                                                                                               `(arg ,(fh:pointer
                                                                                                        'void))
                                                                                               `(name ,(fh:pointer
                                                                                                         int8))))))))))
                                                          `(tmevt ,(fh:pointer
                                                                     (bs:struct
                                                                       (list `(prev ,(fh:pointer
                                                                                       'void))
                                                                             `(next ,(fh:pointer
                                                                                       'void))
                                                                             `(when ,(bs:struct
                                                                                       (list `(sec ,int32)
                                                                                             `(nsec ,int32))))
                                                                             `(neps ,int8)
                                                                             `(rout ,(fh:function
                                                                                       'void
                                                                                       (list (fh:pointer
                                                                                               'void)
                                                                                             (fh:pointer
                                                                                               'void))))
                                                                             `(arg ,(fh:pointer
                                                                                      'void))
                                                                             `(name ,(fh:pointer
                                                                                       int8))))))
                                                          `(neps ,uint32)
                                                          `(tkevt ,(fh:pointer
                                                                     (bs:struct
                                                                       (list `(prev ,(fh:pointer
                                                                                       'void))
                                                                             `(next ,(fh:pointer
                                                                                       'void))
                                                                             `(clk ,(fh:pointer
                                                                                      'void))
                                                                             `(when ,uint64)
                                                                             `(neps ,int8)
                                                                             `(rout ,(fh:function
                                                                                       'void
                                                                                       (list (fh:pointer
                                                                                               'void)
                                                                                             (fh:pointer
                                                                                               'void))))
                                                                             `(arg ,(fh:pointer
                                                                                      'void))
                                                                             `(name ,(fh:pointer
                                                                                       int8))))))
                                                          `(tick_per ,float)
                                                          `(allan_dev ,float)
                                                          `(drift_dev ,float)
                                                          `(drift_rate ,float)
                                                          `(step ,uint32)
                                                          `(evts ,(fh:pointer
                                                                    (bs:struct
                                                                      (list `(prev ,(fh:pointer
                                                                                      'void))
                                                                            `(next ,(fh:pointer
                                                                                      'void))
                                                                            `(clk ,(fh:pointer
                                                                                     'void))
                                                                            `(when ,uint64)
                                                                            `(neps ,int8)
                                                                            `(rout ,(fh:function
                                                                                      'void
                                                                                      (list (fh:pointer
                                                                                              'void)
                                                                                            (fh:pointer
                                                                                              'void))))
                                                                            `(arg ,(fh:pointer
                                                                                     'void))
                                                                            `(name ,(fh:pointer
                                                                                      int8))))))))))
                                         `(tick ,uint64)
                                         `(div ,uint16))))
                             `(ccp_cnt ,uint8)
                             `(xevt ,(fh:pointer
                                       (bs:struct
                                         (list `(prev ,(fh:pointer 'void))
                                               `(next ,(fh:pointer 'void))
                                               `(clk ,(fh:pointer 'void))
                                               `(when ,uint64)
                                               `(neps ,int8)
                                               `(rout ,(fh:function
                                                         'void
                                                         (list (fh:pointer
                                                                 'void)
                                                               (fh:pointer
                                                                 'void))))
                                               `(arg ,(fh:pointer 'void))
                                               `(name ,(fh:pointer int8))))))
                             `(pc ,uint32)
                             `(upd ,(bs:struct
                                      (list `(pc ,uint32)
                                            `(nclk ,int)
                                            `(nval ,uint8)
                                            `(vals ,(bs:vector
                                                      8
                                                      (bs:struct
                                                        (list `(ix ,uint16)
                                                              `(dv ,uint8)
                                                              `(mk ,uint8)
                                                              `(_1 ,(bs:struct
                                                                      (list `(tg ,uint8
                                                                                 2))))))))
                                            `(bpid ,uint8)
                                            `(insn ,uint16)
                                            `(asml ,(bs:struct
                                                      (list `(fmt ,(fh:pointer
                                                                     int8))
                                                            `(narg ,int)
                                                            `(args ,(bs:vector
                                                                      3
                                                                      int)))))
                                            `(insn_hook
                                               ,(fh:function
                                                  'void
                                                  (list (fh:pointer
                                                          'void)))))))
                             `(regs ,(fh:pointer uint8))
                             `(prog ,(fh:pointer uint16))
                             `(data ,(fh:pointer uint8))
                             `(onio ,(fh:pointer uint8))
                             `(progsize ,uint16)
                             `(datasize ,uint16)
                             `(brkpts
                                ,(bs:vector
                                   8
                                   (bs:struct
                                     (list `(pc ,uint32)
                                           `(insn ,uint16)
                                           `(_pad ,uint16))))))))
                   uint16))))
  )
(define-fh-function*-type
  insn_rout_t
  insn_rout_t-desc
  insn_rout_t?
  make-insn_rout_t)
(export insn_rout_t insn_rout_t? make-insn_rout_t)

;; int cpu_load_program(cpu_t *cpu, char *filename);
(define cpu_load_program
  (let ((~cpu_load_program
          (delay (fh-link-proc
                   ffi:int
                   "cpu_load_program"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu filename)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~filename (unwrap~pointer filename)))
        ((force ~cpu_load_program) ~cpu ~filename)))))
(export cpu_load_program)

;; void cpu_tick_evt(void *arg, tkclk_t *clk);
(define cpu_tick_evt
  (let ((~cpu_tick_evt
          (delay (fh-link-proc
                   ffi:void
                   "cpu_tick_evt"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg clk)
      (let ((~arg (unwrap~pointer arg))
            (~clk ((fht-unwrap tkclk_t*) clk)))
        ((force ~cpu_tick_evt) ~arg ~clk)))))
(export cpu_tick_evt)

;; insn_rout_t decode_insn(uint16_t insn, cpu_vers_t vers);
(define decode_insn
  (let ((~decode_insn
          (delay (fh-link-proc
                   ffi-void*
                   "decode_insn"
                   (list ffi:uint16 ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (insn vers)
      (let ((~insn (unwrap~fixed insn))
            (~vers (unwrap-cpu_vers_t vers)))
        ((fht-wrap insn_rout_t)
         ((force ~decode_insn) ~insn ~vers))))))
(export decode_insn)

;; uint32_t cpu_next_pc(cpu_t *cpu, uint32_t addr);
(define cpu_next_pc
  (let ((~cpu_next_pc
          (delay (fh-link-proc
                   ffi:uint32
                   "cpu_next_pc"
                   (list ffi-void* ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu addr)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~addr (unwrap~fixed addr)))
        ((force ~cpu_next_pc) ~cpu ~addr)))))
(export cpu_next_pc)

;; int insn_wsize(uint16_t insn, cpu_vers_t vers);
(define insn_wsize
  (let ((~insn_wsize
          (delay (fh-link-proc
                   ffi:int
                   "insn_wsize"
                   (list ffi:uint16 ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (insn vers)
      (let ((~insn (unwrap~fixed insn))
            (~vers (unwrap-cpu_vers_t vers)))
        ((force ~insn_wsize) ~insn ~vers)))))
(export insn_wsize)

;; int cpu_intr(cpu_t *cpu, int intr_ix);
(define cpu_intr
  (let ((~cpu_intr
          (delay (fh-link-proc
                   ffi:int
                   "cpu_intr"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu intr_ix)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~intr_ix (unwrap~fixed intr_ix)))
        ((force ~cpu_intr) ~cpu ~intr_ix)))))
(export cpu_intr)

;; void cpu_reset(cpu_t *cpu);
(define cpu_reset
  (let ((~cpu_reset
          (delay (fh-link-proc
                   ffi:void
                   "cpu_reset"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_reset) ~cpu)))))
(export cpu_reset)

;; void cpu_disp_regs(cpu_t *cpu);
(define cpu_disp_regs
  (let ((~cpu_disp_regs
          (delay (fh-link-proc
                   ffi:void
                   "cpu_disp_regs"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_disp_regs) ~cpu)))))
(export cpu_disp_regs)

;; void cpu_disp_data(cpu_t *cpu, int addr);
(define cpu_disp_data
  (let ((~cpu_disp_data
          (delay (fh-link-proc
                   ffi:void
                   "cpu_disp_data"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu addr)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~addr (unwrap~fixed addr)))
        ((force ~cpu_disp_data) ~cpu ~addr)))))
(export cpu_disp_data)

;; void cpu_disp(cpu_t *cpu);
(define cpu_disp
  (let ((~cpu_disp
          (delay (fh-link-proc
                   ffi:void
                   "cpu_disp"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_disp) ~cpu)))))
(export cpu_disp)

;; int asmstrf(asmline_t *, int show_ba, char *buf, int bufsiz);
(define asmstrf
  (let ((~asmstrf
          (delay (fh-link-proc
                   ffi:int
                   "asmstrf"
                   (list ffi-void* ffi:int ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 show_ba buf bufsiz)
      (let ((~arg0 ((fht-unwrap asmline_t*) arg0))
            (~show_ba (unwrap~fixed show_ba))
            (~buf (unwrap~pointer buf))
            (~bufsiz (unwrap~fixed bufsiz)))
        ((force ~asmstrf) ~arg0 ~show_ba ~buf ~bufsiz)))))
(export asmstrf)

;; void brkpt_init(brkpt_t *brkpts, int nbrkpt);
(define brkpt_init
  (let ((~brkpt_init
          (delay (fh-link-proc
                   ffi:void
                   "brkpt_init"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (brkpts nbrkpt)
      (let ((~brkpts ((fht-unwrap brkpt_t*) brkpts))
            (~nbrkpt (unwrap~fixed nbrkpt)))
        ((force ~brkpt_init) ~brkpts ~nbrkpt)))))
(export brkpt_init)

;; int brkpt_alloc(cpu_t *cpu);
(define brkpt_alloc
  (let ((~brkpt_alloc
          (delay (fh-link-proc
                   ffi:int
                   "brkpt_alloc"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~brkpt_alloc) ~cpu)))))
(export brkpt_alloc)

;; void brkpt_dealloc(cpu_t *cpu, int ix);
(define brkpt_dealloc
  (let ((~brkpt_dealloc
          (delay (fh-link-proc
                   ffi:void
                   "brkpt_dealloc"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu ix)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~ix (unwrap~fixed ix)))
        ((force ~brkpt_dealloc) ~cpu ~ix)))))
(export brkpt_dealloc)

;; void brkpt_set(cpu_t *cpu, int ix, uint32_t pc);
(define brkpt_set
  (let ((~brkpt_set
          (delay (fh-link-proc
                   ffi:void
                   "brkpt_set"
                   (list ffi-void* ffi:int ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu ix pc)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~ix (unwrap~fixed ix))
            (~pc (unwrap~fixed pc)))
        ((force ~brkpt_set) ~cpu ~ix ~pc)))))
(export brkpt_set)

;; uint16_t brkpt_unset(cpu_t *cpu, int ix);
(define brkpt_unset
  (let ((~brkpt_unset
          (delay (fh-link-proc
                   ffi:uint16
                   "brkpt_unset"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu ix)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~ix (unwrap~fixed ix)))
        ((force ~brkpt_unset) ~cpu ~ix)))))
(export brkpt_unset)

;; void brkpt_reset(cpu_t *cpu, int ix);
(define brkpt_reset
  (let ((~brkpt_reset
          (delay (fh-link-proc
                   ffi:void
                   "brkpt_reset"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu ix)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~ix (unwrap~fixed ix)))
        ((force ~brkpt_reset) ~cpu ~ix)))))
(export brkpt_reset)

;; int brkpt_at(cpu_t *cpu, uint32_t pc);
(define brkpt_at
  (let ((~brkpt_at
          (delay (fh-link-proc
                   ffi:int
                   "brkpt_at"
                   (list ffi-void* ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu pc)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~pc (unwrap~fixed pc)))
        ((force ~brkpt_at) ~cpu ~pc)))))
(export brkpt_at)

;; int add_brkpt(cpu_t *cpu, uint32_t pc_ba);
(define add_brkpt
  (let ((~add_brkpt
          (delay (fh-link-proc
                   ffi:int
                   "add_brkpt"
                   (list ffi-void* ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu pc_ba)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~pc_ba (unwrap~fixed pc_ba)))
        ((force ~add_brkpt) ~cpu ~pc_ba)))))
(export add_brkpt)

;; int rem_brkpt(cpu_t *cpu, uint32_t pc_ba);
(define rem_brkpt
  (let ((~rem_brkpt
          (delay (fh-link-proc
                   ffi:int
                   "rem_brkpt"
                   (list ffi-void* ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu pc_ba)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~pc_ba (unwrap~fixed pc_ba)))
        ((force ~rem_brkpt) ~cpu ~pc_ba)))))
(export rem_brkpt)

;; void wchpt_init(void );
(define wchpt_init
  (let ((~wchpt_init
          (delay (fh-link-proc
                   ffi:void
                   "wchpt_init"
                   (list)
                   (force ffi-octbx-llibs)))))
    (lambda () (let () ((force ~wchpt_init))))))
(export wchpt_init)

;; int wchpt_alloc(cpu_t *cpu);
(define wchpt_alloc
  (let ((~wchpt_alloc
          (delay (fh-link-proc
                   ffi:int
                   "wchpt_alloc"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~wchpt_alloc) ~cpu)))))
(export wchpt_alloc)

;; void wchpt_dealloc(int ix);
(define wchpt_dealloc
  (let ((~wchpt_dealloc
          (delay (fh-link-proc
                   ffi:void
                   "wchpt_dealloc"
                   (list ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (ix)
      (let ((~ix (unwrap~fixed ix)))
        ((force ~wchpt_dealloc) ~ix)))))
(export wchpt_dealloc)

;; void wchpt_set(int ix, uint16_t addr);
(define wchpt_set
  (let ((~wchpt_set
          (delay (fh-link-proc
                   ffi:void
                   "wchpt_set"
                   (list ffi:int ffi:uint16)
                   (force ffi-octbx-llibs)))))
    (lambda (ix addr)
      (let ((~ix (unwrap~fixed ix))
            (~addr (unwrap~fixed addr)))
        ((force ~wchpt_set) ~ix ~addr)))))
(export wchpt_set)

;; uint16_t wchpt_unset(int ix);
(define wchpt_unset
  (let ((~wchpt_unset
          (delay (fh-link-proc
                   ffi:uint16
                   "wchpt_unset"
                   (list ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (ix)
      (let ((~ix (unwrap~fixed ix)))
        ((force ~wchpt_unset) ~ix)))))
(export wchpt_unset)

;; int add_wchpt(cpu_t *cpu, uint16_t addr);
(define add_wchpt
  (let ((~add_wchpt
          (delay (fh-link-proc
                   ffi:int
                   "add_wchpt"
                   (list ffi-void* ffi:uint16)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu addr)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~addr (unwrap~fixed addr)))
        ((force ~add_wchpt) ~cpu ~addr)))))
(export add_wchpt)

;; int del_wchpt(cpu_t *cpu, uint16_t addr);
(define del_wchpt
  (let ((~del_wchpt
          (delay (fh-link-proc
                   ffi:int
                   "del_wchpt"
                   (list ffi-void* ffi:uint16)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu addr)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~addr (unwrap~fixed addr)))
        ((force ~del_wchpt) ~cpu ~addr)))))
(export del_wchpt)

;; cpu_t *make_raw_cpu(uint16_t *prog, uint8_t *data);
(define make_raw_cpu
  (let ((~make_raw_cpu
          (delay (fh-link-proc
                   ffi-void*
                   "make_raw_cpu"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (prog data)
      (let ((~prog (unwrap~pointer prog))
            (~data (unwrap~pointer data)))
        ((fht-wrap cpu_t*)
         ((force ~make_raw_cpu) ~prog ~data))))))
(export make_raw_cpu)

;; void cpu_set_pc(cpu_t *cpu, uint32_t pc);
(define cpu_set_pc
  (let ((~cpu_set_pc
          (delay (fh-link-proc
                   ffi:void
                   "cpu_set_pc"
                   (list ffi-void* ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu pc)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~pc (unwrap~fixed pc)))
        ((force ~cpu_set_pc) ~cpu ~pc)))))
(export cpu_set_pc)

;; uint32_t cpu_get_pc(cpu_t *cpu);
(define cpu_get_pc
  (let ((~cpu_get_pc
          (delay (fh-link-proc
                   ffi:uint32
                   "cpu_get_pc"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_get_pc) ~cpu)))))
(export cpu_get_pc)

;; uint16_t cpu_get_insn(cpu_t *cpu);
(define cpu_get_insn
  (let ((~cpu_get_insn
          (delay (fh-link-proc
                   ffi:uint16
                   "cpu_get_insn"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_get_insn) ~cpu)))))
(export cpu_get_insn)

;; char *cpu_show_insn(cpu_t *cpu, int show_ba);
(define cpu_show_insn
  (let ((~cpu_show_insn
          (delay (fh-link-proc
                   ffi-void*
                   "cpu_show_insn"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu show_ba)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu))
            (~show_ba (unwrap~fixed show_ba)))
        ((force ~cpu_show_insn) ~cpu ~show_ba)))))
(export cpu_show_insn)

;; void cpu_sei(cpu_t *cpu);
(define cpu_sei
  (let ((~cpu_sei
          (delay (fh-link-proc
                   ffi:void
                   "cpu_sei"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_sei) ~cpu)))))
(export cpu_sei)

;; void cpu_cli(cpu_t *cpu);
(define cpu_cli
  (let ((~cpu_cli
          (delay (fh-link-proc
                   ffi:void
                   "cpu_cli"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_cli) ~cpu)))))
(export cpu_cli)

;; void cpu_set_trace(cpu_t *cpu);
(define cpu_set_trace
  (let ((~cpu_set_trace
          (delay (fh-link-proc
                   ffi:void
                   "cpu_set_trace"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_set_trace) ~cpu)))))
(export cpu_set_trace)

;; void cpu_clr_trace(cpu_t *cpu);
(define cpu_clr_trace
  (let ((~cpu_clr_trace
          (delay (fh-link-proc
                   ffi:void
                   "cpu_clr_trace"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap cpu_t*) cpu)))
        ((force ~cpu_clr_trace) ~cpu)))))
(export cpu_clr_trace)

;; typedef enum {
;;   PIN_T_NONE,
;;   PIN_T_IO,
;;   PIN_T_PWR,
;;   PIN_T_GND,
;; } pin_type_t;
(define pin_type_t-enum-nvl
  '((PIN_T_NONE . 0)
    (PIN_T_IO . 1)
    (PIN_T_PWR . 2)
    (PIN_T_GND . 3))
  )
(define pin_type_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pin_type_t-enum-nvl))
(define-public (unwrap-pin_type_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pin_type_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pin_type_t v)
  (assq-ref pin_type_t-enum-vnl v))

;; typedef void (*iopin_notify_t)(void *tgt, struct iopin *pin, int op, int val
;;     );
(define-public iopin_notify_t-desc
  (fh:pointer
    (delay (fh:function
             'void
             (list (fh:pointer 'void)
                   (fh:pointer 'void)
                   int
                   int))))
  )
(define-fh-function*-type
  iopin_notify_t
  iopin_notify_t-desc
  iopin_notify_t?
  make-iopin_notify_t)
(export iopin_notify_t iopin_notify_t? make-iopin_notify_t)

;; typedef enum {
;;   PIN_BOP_NOP,
;;   PIN_BOP_DIR,
;;   PIN_BOP_LVL,
;;   PIN_BOP_PUL,
;; } pin_bus_op_t;
(define pin_bus_op_t-enum-nvl
  '((PIN_BOP_NOP . 0)
    (PIN_BOP_DIR . 1)
    (PIN_BOP_LVL . 2)
    (PIN_BOP_PUL . 3))
  )
(define pin_bus_op_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pin_bus_op_t-enum-nvl))
(define-public (unwrap-pin_bus_op_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pin_bus_op_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pin_bus_op_t v)
  (assq-ref pin_bus_op_t-enum-vnl v))

;; typedef enum {
;;   PIN_OP_PULUP,
;;   PIN_OP_DIR,
;;   PIN_OP_OUT,
;;   PIN_OP_ISC,
;; } pinop_t;
(define pinop_t-enum-nvl
  '((PIN_OP_PULUP . 0)
    (PIN_OP_DIR . 1)
    (PIN_OP_OUT . 2)
    (PIN_OP_ISC . 3))
  )
(define pinop_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pinop_t-enum-nvl))
(define-public (unwrap-pinop_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pinop_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pinop_t v)
  (assq-ref pinop_t-enum-vnl v))

;; typedef enum {
;;   PIN_ARG_CLR,
;;   PIN_ARG_SET,
;;   PIN_ARG_TGL,
;; } pinarg_t;
(define pinarg_t-enum-nvl
  '((PIN_ARG_CLR . 0)
    (PIN_ARG_SET . 1)
    (PIN_ARG_TGL . 2))
  )
(define pinarg_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pinarg_t-enum-nvl))
(define-public (unwrap-pinarg_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pinarg_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pinarg_t v)
  (assq-ref pinarg_t-enum-vnl v))

;; typedef enum {
;;   PIN_DIR_IN = 0,
;;   PIN_DIR_OUT = 1,
;; } pindir_t;
(define pindir_t-enum-nvl
  '((PIN_DIR_IN . 0) (PIN_DIR_OUT . 1))
  )
(define pindir_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pindir_t-enum-nvl))
(define-public (unwrap-pindir_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pindir_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pindir_t v)
  (assq-ref pindir_t-enum-vnl v))

;; typedef enum {
;;   PIN_LEV_LOW = 0,
;;   PIN_LEV_HI = 1,
;; } pinlev_t;
(define pinlev_t-enum-nvl
  '((PIN_LEV_LOW . 0) (PIN_LEV_HI . 1))
  )
(define pinlev_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pinlev_t-enum-nvl))
(define-public (unwrap-pinlev_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pinlev_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pinlev_t v)
  (assq-ref pinlev_t-enum-vnl v))

;; typedef enum {
;;   PIN_ISC_INTDISABLE_gc = 0x0,
;;   PIN_ISC_BOTHEDGES_gc = 0x1,
;;   PIN_ISC_RISING_gc = 0x2,
;;   PIN_ISC_FALLING_gc = 0x3,
;;   PIN_ISC_INPUT_DISABLE_gc = 0x4,
;;   PIN_ISC_LEVEL_gc = 0x5,
;; } pinisc_t;
(define pinisc_t-enum-nvl
  '((PIN_ISC_INTDISABLE_gc . 0)
    (PIN_ISC_BOTHEDGES_gc . 1)
    (PIN_ISC_RISING_gc . 2)
    (PIN_ISC_FALLING_gc . 3)
    (PIN_ISC_INPUT_DISABLE_gc . 4)
    (PIN_ISC_LEVEL_gc . 5))
  )
(define pinisc_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       pinisc_t-enum-nvl))
(define-public (unwrap-pinisc_t n)
  (cond
   ((symbol? n)
    (or (assq-ref pinisc_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-pinisc_t v)
  (assq-ref pinisc_t-enum-vnl v))

;; typedef struct iopin {
;;   tkclk_t *clk_per; /* peripheral clock */
;;   uint8_t pos; /* position in port */
;;   struct {
;;     uint8_t pullup : 1; /* pullup enabled */
;;   };
;;   uint8_t dir; /* direction */
;;   uint8_t isc; /* input sense config */
;;   uint8_t wrlev; /* write level */
;;   uint8_t rdlev; /* read level, 0 = low */
;;   double aval; /* analog value */
;;   iopin_notify_t hey_bus; /* pin change, tell bus */
;;   void *bus;
;;   iopin_notify_t hey_per; /* pin change, tell per' */
;;   void *per; /* peripheral */
;;   iopin_notify_t def_hey_per; /* (port) default */
;;   void *def_per; /* (port) default */
;; } iopin_t;
(define-public iopin_t-desc
  (bs:struct
    (list `(clk_per ,tkclk_t*-desc)
          `(pos ,uint8)
          `(_1 ,(bs:struct (list `(pullup ,uint8 1))))
          `(dir ,uint8)
          `(isc ,uint8)
          `(wrlev ,uint8)
          `(rdlev ,uint8)
          `(aval ,double)
          `(hey_bus ,iopin_notify_t-desc)
          `(bus ,(fh:pointer 'void))
          `(hey_per ,iopin_notify_t-desc)
          `(per ,(fh:pointer 'void))
          `(def_hey_per ,iopin_notify_t-desc)
          `(def_per ,(fh:pointer 'void)))))
(define-fh-compound-type iopin_t iopin_t-desc iopin_t? make-iopin_t)
(export iopin_t iopin_t? make-iopin_t)
(define-public iopin_t*-desc
  (fh:pointer iopin_t-desc))
(define-fh-pointer-type iopin_t* iopin_t*-desc iopin_t*? make-iopin_t*)
(export iopin_t* iopin_t*? make-iopin_t*)
(fh-ref<=>deref!
  iopin_t*
  make-iopin_t*
  iopin_t
  make-iopin_t)
(define-public struct-iopin-desc iopin_t-desc)
(define-fh-compound-type struct-iopin struct-iopin-desc struct-iopin? 
 make-struct-iopin)
(export struct-iopin struct-iopin? make-struct-iopin)
(define-public struct-iopin*-desc iopin_t*-desc)
(define-fh-pointer-type struct-iopin* struct-iopin*-desc struct-iopin*? 
 make-struct-iopin*)
(export struct-iopin* struct-iopin*? make-struct-iopin*)
(fh-ref<=>deref!
  struct-iopin*
  make-struct-iopin*
  struct-iopin
  make-struct-iopin)

;; typedef struct pin {
;;   union {
;;     iopin_t iopin;
;;   };
;;   pin_type_t type;
;; } pin_t;
(define-public pin_t-desc
  (bs:struct
    (list `(_1 ,(bs:union (list `(iopin ,iopin_t-desc))))
          `(type ,int))))
(define-fh-compound-type pin_t pin_t-desc pin_t? make-pin_t)
(export pin_t pin_t? make-pin_t)
(define-public pin_t*-desc
  (fh:pointer pin_t-desc))
(define-fh-pointer-type pin_t* pin_t*-desc pin_t*? make-pin_t*)
(export pin_t* pin_t*? make-pin_t*)
(fh-ref<=>deref!
  pin_t*
  make-pin_t*
  pin_t
  make-pin_t)
(define-public struct-pin-desc pin_t-desc)
(define-fh-compound-type struct-pin struct-pin-desc struct-pin? 
 make-struct-pin)
(export struct-pin struct-pin? make-struct-pin)
(define-public struct-pin*-desc pin_t*-desc)
(define-fh-pointer-type struct-pin* struct-pin*-desc struct-pin*? 
 make-struct-pin*)
(export struct-pin* struct-pin*? make-struct-pin*)
(fh-ref<=>deref!
  struct-pin*
  make-struct-pin*
  struct-pin
  make-struct-pin)

;; void iopin_notify_bus(iopin_t *pin, int op, int val);
(define iopin_notify_bus
  (let ((~iopin_notify_bus
          (delay (fh-link-proc
                   ffi:void
                   "iopin_notify_bus"
                   (list ffi-void* ffi:int ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (pin op val)
      (let ((~pin ((fht-unwrap iopin_t*) pin))
            (~op (unwrap~fixed op))
            (~val (unwrap~fixed val)))
        ((force ~iopin_notify_bus) ~pin ~op ~val)))))
(export iopin_notify_bus)

;; void iopin_notify_per(iopin_t *pin, int op, int arg);
(define iopin_notify_per
  (let ((~iopin_notify_per
          (delay (fh-link-proc
                   ffi:void
                   "iopin_notify_per"
                   (list ffi-void* ffi:int ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (pin op arg)
      (let ((~pin ((fht-unwrap iopin_t*) pin))
            (~op (unwrap~fixed op))
            (~arg (unwrap~fixed arg)))
        ((force ~iopin_notify_per) ~pin ~op ~arg)))))
(export iopin_notify_per)

;; void iopin_pullup(iopin_t *pin, int ena);
(define iopin_pullup
  (let ((~iopin_pullup
          (delay (fh-link-proc
                   ffi:void
                   "iopin_pullup"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (pin ena)
      (let ((~pin ((fht-unwrap iopin_t*) pin))
            (~ena (unwrap~fixed ena)))
        ((force ~iopin_pullup) ~pin ~ena)))))
(export iopin_pullup)

;; uint8_t iopin_rdD(iopin_t *);
(define iopin_rdD
  (let ((~iopin_rdD
          (delay (fh-link-proc
                   ffi:uint8
                   "iopin_rdD"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap iopin_t*) arg0)))
        ((force ~iopin_rdD) ~arg0)))))
(export iopin_rdD)

;; double iopin_rdA(iopin_t *);
(define iopin_rdA
  (let ((~iopin_rdA
          (delay (fh-link-proc
                   ffi:double
                   "iopin_rdA"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap iopin_t*) arg0)))
        ((force ~iopin_rdA) ~arg0)))))
(export iopin_rdA)

;; void iopin_wrD(iopin_t *pin, uint8_t lev);
(define iopin_wrD
  (let ((~iopin_wrD
          (delay (fh-link-proc
                   ffi:void
                   "iopin_wrD"
                   (list ffi-void* ffi:uint8)
                   (force ffi-octbx-llibs)))))
    (lambda (pin lev)
      (let ((~pin ((fht-unwrap iopin_t*) pin))
            (~lev (unwrap~fixed lev)))
        ((force ~iopin_wrD) ~pin ~lev)))))
(export iopin_wrD)

;; void iopin_wrA(iopin_t *, double val);
(define iopin_wrA
  (let ((~iopin_wrA
          (delay (fh-link-proc
                   ffi:void
                   "iopin_wrA"
                   (list ffi-void* ffi:double)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 val)
      (let ((~arg0 ((fht-unwrap iopin_t*) arg0))
            (~val (unwrap~float val)))
        ((force ~iopin_wrA) ~arg0 ~val)))))
(export iopin_wrA)

;; typedef void (*pin_func_t)(pin_t *, int cmd, int arg);
(define-public pin_func_t-desc
  (fh:pointer
    (delay (fh:function
             'void
             (list (fh:pointer
                     (bs:struct
                       (list `(_1 ,(bs:union
                                     (list `(iopin ,(bs:struct
                                                      (list `(clk_per
                                                               ,(fh:pointer
                                                                  (bs:struct
                                                                    (list `(osc ,(fh:pointer
                                                                                   (bs:struct
                                                                                     (list `(todo ,(bs:struct
                                                                                                     (list `(prev ,(fh:pointer
                                                                                                                     'void))
                                                                                                           `(next ,(fh:pointer
                                                                                                                     'void))
                                                                                                           `(clk ,(fh:pointer
                                                                                                                    'void))
                                                                                                           `(when ,uint64)
                                                                                                           `(neps ,int8)
                                                                                                           `(rout ,(fh:function
                                                                                                                     'void
                                                                                                                     (list (fh:pointer
                                                                                                                             'void)
                                                                                                                           (fh:pointer
                                                                                                                             'void))))
                                                                                                           `(arg ,(fh:pointer
                                                                                                                    'void))
                                                                                                           `(name ,(fh:pointer
                                                                                                                     int8)))))
                                                                                           `(done ,(bs:struct
                                                                                                     (list `(prev ,(fh:pointer
                                                                                                                     'void))
                                                                                                           `(next ,(fh:pointer
                                                                                                                     'void))
                                                                                                           `(clk ,(fh:pointer
                                                                                                                    'void))
                                                                                                           `(when ,uint64)
                                                                                                           `(neps ,int8)
                                                                                                           `(rout ,(fh:function
                                                                                                                     'void
                                                                                                                     (list (fh:pointer
                                                                                                                             'void)
                                                                                                                           (fh:pointer
                                                                                                                             'void))))
                                                                                                           `(arg ,(fh:pointer
                                                                                                                    'void))
                                                                                                           `(name ,(fh:pointer
                                                                                                                     int8)))))
                                                                                           `(evt ,(fh:pointer
                                                                                                    (bs:struct
                                                                                                      (list `(prev ,(fh:pointer
                                                                                                                      'void))
                                                                                                            `(next ,(fh:pointer
                                                                                                                      'void))
                                                                                                            `(clk ,(fh:pointer
                                                                                                                     'void))
                                                                                                            `(when ,uint64)
                                                                                                            `(neps ,int8)
                                                                                                            `(rout ,(fh:function
                                                                                                                      'void
                                                                                                                      (list (fh:pointer
                                                                                                                              'void)
                                                                                                                            (fh:pointer
                                                                                                                              'void))))
                                                                                                            `(arg ,(fh:pointer
                                                                                                                     'void))
                                                                                                            `(name ,(fh:pointer
                                                                                                                      int8))))))
                                                                                           `(tick ,uint64)
                                                                                           `(time ,(bs:struct
                                                                                                     (list `(sec ,int32)
                                                                                                           `(nsec ,int32))))
                                                                                           `(drift ,float)
                                                                                           `(seed ,uint32)
                                                                                           `(tmsch ,(fh:pointer
                                                                                                      (bs:struct
                                                                                                        (list `(todo ,(bs:struct
                                                                                                                        (list `(prev ,(fh:pointer
                                                                                                                                        'void))
                                                                                                                              `(next ,(fh:pointer
                                                                                                                                        'void))
                                                                                                                              `(when ,(bs:struct
                                                                                                                                        (list `(sec ,int32)
                                                                                                                                              `(nsec ,int32))))
                                                                                                                              `(neps ,int8)
                                                                                                                              `(rout ,(fh:function
                                                                                                                                        'void
                                                                                                                                        (list (fh:pointer
                                                                                                                                                'void)
                                                                                                                                              (fh:pointer
                                                                                                                                                'void))))
                                                                                                                              `(arg ,(fh:pointer
                                                                                                                                       'void))
                                                                                                                              `(name ,(fh:pointer
                                                                                                                                        int8)))))
                                                                                                              `(done ,(bs:struct
                                                                                                                        (list `(prev ,(fh:pointer
                                                                                                                                        'void))
                                                                                                                              `(next ,(fh:pointer
                                                                                                                                        'void))
                                                                                                                              `(when ,(bs:struct
                                                                                                                                        (list `(sec ,int32)
                                                                                                                                              `(nsec ,int32))))
                                                                                                                              `(neps ,int8)
                                                                                                                              `(rout ,(fh:function
                                                                                                                                        'void
                                                                                                                                        (list (fh:pointer
                                                                                                                                                'void)
                                                                                                                                              (fh:pointer
                                                                                                                                                'void))))
                                                                                                                              `(arg ,(fh:pointer
                                                                                                                                       'void))
                                                                                                                              `(name ,(fh:pointer
                                                                                                                                        int8)))))
                                                                                                              `(evt ,(fh:pointer
                                                                                                                       (bs:struct
                                                                                                                         (list `(prev ,(fh:pointer
                                                                                                                                         'void))
                                                                                                                               `(next ,(fh:pointer
                                                                                                                                         'void))
                                                                                                                               `(when ,(bs:struct
                                                                                                                                         (list `(sec ,int32)
                                                                                                                                               `(nsec ,int32))))
                                                                                                                               `(neps ,int8)
                                                                                                                               `(rout ,(fh:function
                                                                                                                                         'void
                                                                                                                                         (list (fh:pointer
                                                                                                                                                 'void)
                                                                                                                                               (fh:pointer
                                                                                                                                                 'void))))
                                                                                                                               `(arg ,(fh:pointer
                                                                                                                                        'void))
                                                                                                                               `(name ,(fh:pointer
                                                                                                                                         int8))))))
                                                                                                              `(time ,(bs:struct
                                                                                                                        (list `(sec ,int32)
                                                                                                                              `(nsec ,int32))))
                                                                                                              `(evts ,(fh:pointer
                                                                                                                        (bs:struct
                                                                                                                          (list `(prev ,(fh:pointer
                                                                                                                                          'void))
                                                                                                                                `(next ,(fh:pointer
                                                                                                                                          'void))
                                                                                                                                `(when ,(bs:struct
                                                                                                                                          (list `(sec ,int32)
                                                                                                                                                `(nsec ,int32))))
                                                                                                                                `(neps ,int8)
                                                                                                                                `(rout ,(fh:function
                                                                                                                                          'void
                                                                                                                                          (list (fh:pointer
                                                                                                                                                  'void)
                                                                                                                                                (fh:pointer
                                                                                                                                                  'void))))
                                                                                                                                `(arg ,(fh:pointer
                                                                                                                                         'void))
                                                                                                                                `(name ,(fh:pointer
                                                                                                                                          int8))))))))))
                                                                                           `(tmevt ,(fh:pointer
                                                                                                      (bs:struct
                                                                                                        (list `(prev ,(fh:pointer
                                                                                                                        'void))
                                                                                                              `(next ,(fh:pointer
                                                                                                                        'void))
                                                                                                              `(when ,(bs:struct
                                                                                                                        (list `(sec ,int32)
                                                                                                                              `(nsec ,int32))))
                                                                                                              `(neps ,int8)
                                                                                                              `(rout ,(fh:function
                                                                                                                        'void
                                                                                                                        (list (fh:pointer
                                                                                                                                'void)
                                                                                                                              (fh:pointer
                                                                                                                                'void))))
                                                                                                              `(arg ,(fh:pointer
                                                                                                                       'void))
                                                                                                              `(name ,(fh:pointer
                                                                                                                        int8))))))
                                                                                           `(neps ,uint32)
                                                                                           `(tkevt ,(fh:pointer
                                                                                                      (bs:struct
                                                                                                        (list `(prev ,(fh:pointer
                                                                                                                        'void))
                                                                                                              `(next ,(fh:pointer
                                                                                                                        'void))
                                                                                                              `(clk ,(fh:pointer
                                                                                                                       'void))
                                                                                                              `(when ,uint64)
                                                                                                              `(neps ,int8)
                                                                                                              `(rout ,(fh:function
                                                                                                                        'void
                                                                                                                        (list (fh:pointer
                                                                                                                                'void)
                                                                                                                              (fh:pointer
                                                                                                                                'void))))
                                                                                                              `(arg ,(fh:pointer
                                                                                                                       'void))
                                                                                                              `(name ,(fh:pointer
                                                                                                                        int8))))))
                                                                                           `(tick_per
                                                                                              ,float)
                                                                                           `(allan_dev
                                                                                              ,float)
                                                                                           `(drift_dev
                                                                                              ,float)
                                                                                           `(drift_rate
                                                                                              ,float)
                                                                                           `(step ,uint32)
                                                                                           `(evts ,(fh:pointer
                                                                                                     (bs:struct
                                                                                                       (list `(prev ,(fh:pointer
                                                                                                                       'void))
                                                                                                             `(next ,(fh:pointer
                                                                                                                       'void))
                                                                                                             `(clk ,(fh:pointer
                                                                                                                      'void))
                                                                                                             `(when ,uint64)
                                                                                                             `(neps ,int8)
                                                                                                             `(rout ,(fh:function
                                                                                                                       'void
                                                                                                                       (list (fh:pointer
                                                                                                                               'void)
                                                                                                                             (fh:pointer
                                                                                                                               'void))))
                                                                                                             `(arg ,(fh:pointer
                                                                                                                      'void))
                                                                                                             `(name ,(fh:pointer
                                                                                                                       int8))))))))))
                                                                          `(tick ,uint64)
                                                                          `(div ,uint16)))))
                                                            `(pos ,uint8)
                                                            `(_1 ,(bs:struct
                                                                    (list `(pullup
                                                                             ,uint8
                                                                             1))))
                                                            `(dir ,uint8)
                                                            `(isc ,uint8)
                                                            `(wrlev ,uint8)
                                                            `(rdlev ,uint8)
                                                            `(aval ,double)
                                                            `(hey_bus
                                                               ,(fh:function
                                                                  'void
                                                                  (list (fh:pointer
                                                                          'void)
                                                                        (fh:pointer
                                                                          'void)
                                                                        int
                                                                        int)))
                                                            `(bus ,(fh:pointer
                                                                     'void))
                                                            `(hey_per
                                                               ,(fh:function
                                                                  'void
                                                                  (list (fh:pointer
                                                                          'void)
                                                                        (fh:pointer
                                                                          'void)
                                                                        int
                                                                        int)))
                                                            `(per ,(fh:pointer
                                                                     'void))
                                                            `(def_hey_per
                                                               ,(fh:function
                                                                  'void
                                                                  (list (fh:pointer
                                                                          'void)
                                                                        (fh:pointer
                                                                          'void)
                                                                        int
                                                                        int)))
                                                            `(def_per
                                                               ,(fh:pointer
                                                                  'void))))))))
                             `(type ,int))))
                   int
                   int))))
  )
(define-fh-function*-type
  pin_func_t
  pin_func_t-desc
  pin_func_t?
  make-pin_func_t)
(export pin_func_t pin_func_t? make-pin_func_t)

;; typedef struct cpuint_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t STATUS; /* Status */
;;   uint8_t LVL0PRI; /* Interrupt Level 0 Priority */
;;   uint8_t LVL1VEC; /* Interrupt Level 1 Priority Vector */
;; } cpuint_reg_t;
(define-public cpuint_reg_t-desc
  (bs:struct
    (list `(CTRLA ,uint8)
          `(STATUS ,uint8)
          `(LVL0PRI ,uint8)
          `(LVL1VEC ,uint8))))
(define-fh-compound-type cpuint_reg_t cpuint_reg_t-desc cpuint_reg_t? 
 make-cpuint_reg_t)
(export cpuint_reg_t cpuint_reg_t? make-cpuint_reg_t)
(define-public cpuint_reg_t*-desc
  (fh:pointer cpuint_reg_t-desc))
(define-fh-pointer-type cpuint_reg_t* cpuint_reg_t*-desc cpuint_reg_t*? 
 make-cpuint_reg_t*)
(export cpuint_reg_t* cpuint_reg_t*? make-cpuint_reg_t*)
(fh-ref<=>deref!
  cpuint_reg_t*
  make-cpuint_reg_t*
  cpuint_reg_t
  make-cpuint_reg_t)
(define-public struct-cpuint_reg-desc
  cpuint_reg_t-desc)
(define-fh-compound-type struct-cpuint_reg struct-cpuint_reg-desc 
 struct-cpuint_reg? make-struct-cpuint_reg)
(export struct-cpuint_reg struct-cpuint_reg? make-struct-cpuint_reg)
(define-public struct-cpuint_reg*-desc
  cpuint_reg_t*-desc)
(define-fh-pointer-type struct-cpuint_reg* struct-cpuint_reg*-desc 
 struct-cpuint_reg*? make-struct-cpuint_reg*)
(export struct-cpuint_reg* struct-cpuint_reg*? make-struct-cpuint_reg*)
(fh-ref<=>deref!
  struct-cpuint_reg*
  make-struct-cpuint_reg*
  struct-cpuint_reg
  make-struct-cpuint_reg)

;; typedef struct cpuint {
;;   struct mcu *mcu;
;;   uint16_t base_addr; /* base address */
;;   cpuint_reg_t *reg; /* pointer to registers */
;; } cpuint_t;
(define-public cpuint_t-desc
  (bs:struct
    (list `(mcu ,(fh:pointer 'void))
          `(base_addr ,uint16)
          `(reg ,cpuint_reg_t*-desc))))
(define-fh-compound-type cpuint_t cpuint_t-desc cpuint_t? make-cpuint_t)
(export cpuint_t cpuint_t? make-cpuint_t)
(define-public cpuint_t*-desc
  (fh:pointer cpuint_t-desc))
(define-fh-pointer-type cpuint_t* cpuint_t*-desc cpuint_t*? make-cpuint_t*)
(export cpuint_t* cpuint_t*? make-cpuint_t*)
(fh-ref<=>deref!
  cpuint_t*
  make-cpuint_t*
  cpuint_t
  make-cpuint_t)
(define-public struct-cpuint-desc cpuint_t-desc)
(define-fh-compound-type struct-cpuint struct-cpuint-desc struct-cpuint? 
 make-struct-cpuint)
(export struct-cpuint struct-cpuint? make-struct-cpuint)
(define-public struct-cpuint*-desc
  cpuint_t*-desc)
(define-fh-pointer-type struct-cpuint* struct-cpuint*-desc struct-cpuint*? 
 make-struct-cpuint*)
(export struct-cpuint* struct-cpuint*? make-struct-cpuint*)
(fh-ref<=>deref!
  struct-cpuint*
  make-struct-cpuint*
  struct-cpuint
  make-struct-cpuint)

;; void cpuint_init(cpuint_t *, struct mcu *mcu, uint16_t addr);
(define cpuint_init
  (let ((~cpuint_init
          (delay (fh-link-proc
                   ffi:void
                   "cpuint_init"
                   (list ffi-void* ffi-void* ffi:uint16)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 mcu addr)
      (let ((~arg0 ((fht-unwrap cpuint_t*) arg0))
            (~mcu (unwrap~pointer mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~cpuint_init) ~arg0 ~mcu ~addr)))))
(export cpuint_init)

;; void cpuint_fini(cpuint_t *);
(define cpuint_fini
  (let ((~cpuint_fini
          (delay (fh-link-proc
                   ffi:void
                   "cpuint_fini"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0)
      (let ((~arg0 ((fht-unwrap cpuint_t*) arg0)))
        ((force ~cpuint_fini) ~arg0)))))
(export cpuint_fini)

;; uint8_t cpuint_rd(cpuint_t *, int addr);
(define cpuint_rd
  (let ((~cpuint_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "cpuint_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 addr)
      (let ((~arg0 ((fht-unwrap cpuint_t*) arg0))
            (~addr (unwrap~fixed addr)))
        ((force ~cpuint_rd) ~arg0 ~addr)))))
(export cpuint_rd)

;; void cpuint_wr(cpuint_t *, int addr, uint8_t val);
(define cpuint_wr
  (let ((~cpuint_wr
          (delay (fh-link-proc
                   ffi:void
                   "cpuint_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-octbx-llibs)))))
    (lambda (arg0 addr val)
      (let ((~arg0 ((fht-unwrap cpuint_t*) arg0))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~cpuint_wr) ~arg0 ~addr ~val)))))
(export cpuint_wr)

;; typedef struct mcu {
;;   cpu_t cpu; /* generic cpu */
;;   uint64_t irmsk; /* interrupts requested */
;;   uint64_t nimsk; /* non-maskable requested */
;;   char *device; /* device (e.g., "mega4809") */
;;   char *code; /* code (e.g., "mcu1.hex") */
;;   char *name; /* name (e.g., "mcu1") */
;;   tkosc_t osc20m; /* on avr0 */
;;   tkosc_t osculp32k; /* on avr0 */
;;   tkosc_t xosc32k; /* on avr0 */
;;   tkclk_t clk_per; /* peripheral clock */
;;   cpuint_t cpuint;
;;   struct {
;;     void (*rt)(void *_mcu, int flags); /* reset w/ reason */
;;     uint8_t (*rd)(void *_mcu, int addr); /* data read */
;;     void (*wr)(void *_mcu, int addr, uint8_t val); /* data write */
;;     void (*bs)(void *_mcu, int addr, uint8_t val, uint8_t msk); 
;;         /* bit set */
;;     void (*ir)(void *_mcu, int ivec); /* req intr */
;;     //void (*ix)(void *_mcu, int ivec);    /* NMI req intr */
;;     void (*ia)(void *_mcu, int ivec); /* ack intr */
;;     iopin_t *(*pn)(void *_mcu, char *name); /* pin from name */
;;     void (*wdr)(void *_mcu); /* watchdog reset */
;;   };
;;   struct {
;;     void (*rt_hook)(void *_mcu, int flags);
;;     uint8_t (*rd_hook)(void *_mcu, int addr);
;;     void (*wr_hook)(void *_mcu, int addr, uint8_t val);
;;     void (*bs_hook)(void *_mcu, int addr, uint8_t val, uint8_t msk);
;;     void (*ir_hook)(void *_mcu, int ivec);
;;     void (*ia_hook)(void *_mcu, int ivec);
;;   };
;; } mcu_t;
(define-public mcu_t-desc
  (bs:struct
    (list `(cpu ,cpu_t-desc)
          `(irmsk ,uint64)
          `(nimsk ,uint64)
          `(device ,(fh:pointer int8))
          `(code ,(fh:pointer int8))
          `(name ,(fh:pointer int8))
          `(osc20m ,tkosc_t-desc)
          `(osculp32k ,tkosc_t-desc)
          `(xosc32k ,tkosc_t-desc)
          `(clk_per ,tkclk_t-desc)
          `(cpuint ,cpuint_t-desc)
          `(_1 ,(bs:struct
                  (list `(rt ,(fh:function
                                'void
                                (list (fh:pointer 'void) int)))
                        `(rd ,(fh:function
                                uint8
                                (list (fh:pointer 'void) int)))
                        `(wr ,(fh:function
                                'void
                                (list (fh:pointer 'void) int uint8)))
                        `(bs ,(fh:function
                                'void
                                (list (fh:pointer 'void) int uint8 uint8)))
                        `(ir ,(fh:function
                                'void
                                (list (fh:pointer 'void) int)))
                        `(ia ,(fh:function
                                'void
                                (list (fh:pointer 'void) int)))
                        `(pn ,(fh:function
                                iopin_t*-desc
                                (list (fh:pointer 'void) (fh:pointer int8))))
                        `(wdr ,(fh:function
                                 'void
                                 (list (fh:pointer 'void)))))))
          `(_2 ,(bs:struct
                  (list `(rt_hook
                           ,(fh:function 'void (list (fh:pointer 'void) int)))
                        `(rd_hook
                           ,(fh:function uint8 (list (fh:pointer 'void) int)))
                        `(wr_hook
                           ,(fh:function
                              'void
                              (list (fh:pointer 'void) int uint8)))
                        `(bs_hook
                           ,(fh:function
                              'void
                              (list (fh:pointer 'void) int uint8 uint8)))
                        `(ir_hook
                           ,(fh:function 'void (list (fh:pointer 'void) int)))
                        `(ia_hook
                           ,(fh:function
                              'void
                              (list (fh:pointer 'void) int)))))))))
(define-fh-compound-type mcu_t mcu_t-desc mcu_t? make-mcu_t)
(export mcu_t mcu_t? make-mcu_t)
(define-public mcu_t*-desc
  (fh:pointer mcu_t-desc))
(define-fh-pointer-type mcu_t* mcu_t*-desc mcu_t*? make-mcu_t*)
(export mcu_t* mcu_t*? make-mcu_t*)
(fh-ref<=>deref!
  mcu_t*
  make-mcu_t*
  mcu_t
  make-mcu_t)
(define-public struct-mcu-desc mcu_t-desc)
(define-fh-compound-type struct-mcu struct-mcu-desc struct-mcu? 
 make-struct-mcu)
(export struct-mcu struct-mcu? make-struct-mcu)
(define-public struct-mcu*-desc mcu_t*-desc)
(define-fh-pointer-type struct-mcu* struct-mcu*-desc struct-mcu*? 
 make-struct-mcu*)
(export struct-mcu* struct-mcu*? make-struct-mcu*)
(fh-ref<=>deref!
  struct-mcu*
  make-struct-mcu*
  struct-mcu
  make-struct-mcu)

;; typedef mcu_t *(*mcu_gen_t)(tmsch_t *);
(define-public mcu_gen_t-desc
  (fh:pointer
    (delay (fh:function ffi-void* (list ffi-void*))))
  )
(define-fh-function*-type
  mcu_gen_t
  mcu_gen_t-desc
  mcu_gen_t?
  make-mcu_gen_t)
(export mcu_gen_t mcu_gen_t? make-mcu_gen_t)

;; uint8_t def_rd(void *_mcu, int addr);
(define def_rd
  (let ((~def_rd
          (delay (fh-link-proc
                   ffi:uint8
                   "def_rd"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (_mcu addr)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~addr (unwrap~fixed addr)))
        ((force ~def_rd) ~_mcu ~addr)))))
(export def_rd)

;; void def_wr(void *_mcu, int addr, uint8_t val);
(define def_wr
  (let ((~def_wr
          (delay (fh-link-proc
                   ffi:void
                   "def_wr"
                   (list ffi-void* ffi:int ffi:uint8)
                   (force ffi-octbx-llibs)))))
    (lambda (_mcu addr val)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val)))
        ((force ~def_wr) ~_mcu ~addr ~val)))))
(export def_wr)

;; void def_bs(void *_mcu, int addr, uint8_t val, uint8_t msk);
(define def_bs
  (let ((~def_bs
          (delay (fh-link-proc
                   ffi:void
                   "def_bs"
                   (list ffi-void* ffi:int ffi:uint8 ffi:uint8)
                   (force ffi-octbx-llibs)))))
    (lambda (_mcu addr val msk)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~addr (unwrap~fixed addr))
            (~val (unwrap~fixed val))
            (~msk (unwrap~fixed msk)))
        ((force ~def_bs) ~_mcu ~addr ~val ~msk)))))
(export def_bs)

;; void def_ir(void *_mcu, int ivec);
(define def_ir
  (let ((~def_ir
          (delay (fh-link-proc
                   ffi:void
                   "def_ir"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (_mcu ivec)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~ivec (unwrap~fixed ivec)))
        ((force ~def_ir) ~_mcu ~ivec)))))
(export def_ir)

;; void def_ia(void *_mcu, int ivec);
(define def_ia
  (let ((~def_ia
          (delay (fh-link-proc
                   ffi:void
                   "def_ia"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (_mcu ivec)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~ivec (unwrap~fixed ivec)))
        ((force ~def_ia) ~_mcu ~ivec)))))
(export def_ia)

;; void def_rt(void *_mcu, int flags);
(define def_rt
  (let ((~def_rt
          (delay (fh-link-proc
                   ffi:void
                   "def_rt"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (_mcu flags)
      (let ((~_mcu (unwrap~pointer _mcu))
            (~flags (unwrap~fixed flags)))
        ((force ~def_rt) ~_mcu ~flags)))))
(export def_rt)

;; int mcu_next_ivec(mcu_t *mcu);
(define mcu_next_ivec
  (let ((~mcu_next_ivec
          (delay (fh-link-proc
                   ffi:int
                   "mcu_next_ivec"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (mcu)
      (let ((~mcu ((fht-unwrap mcu_t*) mcu)))
        ((force ~mcu_next_ivec) ~mcu)))))
(export mcu_next_ivec)

;; void mcu_req_intr(mcu_t *mcu, int iv);
(define mcu_req_intr
  (let ((~mcu_req_intr
          (delay (fh-link-proc
                   ffi:void
                   "mcu_req_intr"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (mcu iv)
      (let ((~mcu ((fht-unwrap mcu_t*) mcu))
            (~iv (unwrap~fixed iv)))
        ((force ~mcu_req_intr) ~mcu ~iv)))))
(export mcu_req_intr)

;; void mcu_ack_intr(mcu_t *mcu, int iv);
(define mcu_ack_intr
  (let ((~mcu_ack_intr
          (delay (fh-link-proc
                   ffi:void
                   "mcu_ack_intr"
                   (list ffi-void* ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (mcu iv)
      (let ((~mcu ((fht-unwrap mcu_t*) mcu))
            (~iv (unwrap~fixed iv)))
        ((force ~mcu_ack_intr) ~mcu ~iv)))))
(export mcu_ack_intr)

;; uint32_t mcu_clr_iv(mcu_t *mcu, uint32_t iv);
(define mcu_clr_iv
  (let ((~mcu_clr_iv
          (delay (fh-link-proc
                   ffi:uint32
                   "mcu_clr_iv"
                   (list ffi-void* ffi:uint32)
                   (force ffi-octbx-llibs)))))
    (lambda (mcu iv)
      (let ((~mcu ((fht-unwrap mcu_t*) mcu))
            (~iv (unwrap~fixed iv)))
        ((force ~mcu_clr_iv) ~mcu ~iv)))))
(export mcu_clr_iv)

;; void add_cpu_call_hook(void (*hook)(struct cpu *));
(define add_cpu_call_hook
  (let ((~add_cpu_call_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_call_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_call_hook) ~hook)))))
(export add_cpu_call_hook)

;; void rem_cpu_call_hook(void (*hook)(struct cpu *));
(define rem_cpu_call_hook
  (let ((~rem_cpu_call_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_call_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_call_hook) ~hook)))))
(export rem_cpu_call_hook)

;; void cpu_call_hook(struct cpu *cpu);
(define cpu_call_hook
  (let ((~cpu_call_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_call_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_call_hook) ~cpu)))))
(export cpu_call_hook)

;; void add_cpu_ret_hook(void (*hook)(struct cpu *));
(define add_cpu_ret_hook
  (let ((~add_cpu_ret_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_ret_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_ret_hook) ~hook)))))
(export add_cpu_ret_hook)

;; void rem_cpu_ret_hook(void (*hook)(struct cpu *));
(define rem_cpu_ret_hook
  (let ((~rem_cpu_ret_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_ret_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_ret_hook) ~hook)))))
(export rem_cpu_ret_hook)

;; void cpu_ret_hook(struct cpu *cpu);
(define cpu_ret_hook
  (let ((~cpu_ret_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_ret_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_ret_hook) ~cpu)))))
(export cpu_ret_hook)

;; void add_cpu_intr_hook(void (*hook)(struct cpu *));
(define add_cpu_intr_hook
  (let ((~add_cpu_intr_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_intr_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_intr_hook) ~hook)))))
(export add_cpu_intr_hook)

;; void rem_cpu_intr_hook(void (*hook)(struct cpu *));
(define rem_cpu_intr_hook
  (let ((~rem_cpu_intr_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_intr_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_intr_hook) ~hook)))))
(export rem_cpu_intr_hook)

;; void cpu_intr_hook(struct cpu *cpu);
(define cpu_intr_hook
  (let ((~cpu_intr_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_intr_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_intr_hook) ~cpu)))))
(export cpu_intr_hook)

;; void add_cpu_reti_hook(void (*hook)(struct cpu *));
(define add_cpu_reti_hook
  (let ((~add_cpu_reti_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_reti_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_reti_hook) ~hook)))))
(export add_cpu_reti_hook)

;; void rem_cpu_reti_hook(void (*hook)(struct cpu *));
(define rem_cpu_reti_hook
  (let ((~rem_cpu_reti_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_reti_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_reti_hook) ~hook)))))
(export rem_cpu_reti_hook)

;; void cpu_reti_hook(struct cpu *cpu);
(define cpu_reti_hook
  (let ((~cpu_reti_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_reti_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_reti_hook) ~cpu)))))
(export cpu_reti_hook)

;; void add_cpu_pre_exec_hook(void (*hook)(struct cpu *));
(define add_cpu_pre_exec_hook
  (let ((~add_cpu_pre_exec_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_pre_exec_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_pre_exec_hook) ~hook)))))
(export add_cpu_pre_exec_hook)

;; void rem_cpu_pre_exec_hook(void (*hook)(struct cpu *));
(define rem_cpu_pre_exec_hook
  (let ((~rem_cpu_pre_exec_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_pre_exec_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_pre_exec_hook) ~hook)))))
(export rem_cpu_pre_exec_hook)

;; void cpu_pre_exec_hook(struct cpu *cpu);
(define cpu_pre_exec_hook
  (let ((~cpu_pre_exec_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_pre_exec_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_pre_exec_hook) ~cpu)))))
(export cpu_pre_exec_hook)

;; void add_cpu_post_exec_hook(void (*hook)(struct cpu *));
(define add_cpu_post_exec_hook
  (let ((~add_cpu_post_exec_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_post_exec_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_post_exec_hook) ~hook)))))
(export add_cpu_post_exec_hook)

;; void rem_cpu_post_exec_hook(void (*hook)(struct cpu *));
(define rem_cpu_post_exec_hook
  (let ((~rem_cpu_post_exec_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_post_exec_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_post_exec_hook) ~hook)))))
(export rem_cpu_post_exec_hook)

;; void cpu_post_exec_hook(struct cpu *cpu);
(define cpu_post_exec_hook
  (let ((~cpu_post_exec_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_post_exec_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_post_exec_hook) ~cpu)))))
(export cpu_post_exec_hook)

;; void add_cpu_post_fetch_hook(void (*hook)(struct cpu *));
(define add_cpu_post_fetch_hook
  (let ((~add_cpu_post_fetch_hook
          (delay (fh-link-proc
                   ffi:void
                   "add_cpu_post_fetch_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~add_cpu_post_fetch_hook) ~hook)))))
(export add_cpu_post_fetch_hook)

;; void rem_cpu_post_fetch_hook(void (*hook)(struct cpu *));
(define rem_cpu_post_fetch_hook
  (let ((~rem_cpu_post_fetch_hook
          (delay (fh-link-proc
                   ffi:void
                   "rem_cpu_post_fetch_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (hook)
      (let ((~hook ((make-fctn-param-unwrapper
                      ffi:void
                      (list ffi-void*))
                    hook)))
        ((force ~rem_cpu_post_fetch_hook) ~hook)))))
(export rem_cpu_post_fetch_hook)

;; void cpu_post_fetch_hook(struct cpu *cpu);
(define cpu_post_fetch_hook
  (let ((~cpu_post_fetch_hook
          (delay (fh-link-proc
                   ffi:void
                   "cpu_post_fetch_hook"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (cpu)
      (let ((~cpu ((fht-unwrap struct-cpu*) cpu)))
        ((force ~cpu_post_fetch_hook) ~cpu)))))
(export cpu_post_fetch_hook)

;; void log_tick(void *arg, tkosc_t *osc);
(define log_tick
  (let ((~log_tick
          (delay (fh-link-proc
                   ffi:void
                   "log_tick"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg osc)
      (let ((~arg (unwrap~pointer arg))
            (~osc ((fht-unwrap tkosc_t*) osc)))
        ((force ~log_tick) ~arg ~osc)))))
(export log_tick)

;; void log_intr(void *arg, int ivec, tkosc_t *osc);
(define log_intr
  (let ((~log_intr
          (delay (fh-link-proc
                   ffi:void
                   "log_intr"
                   (list ffi-void* ffi:int ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (arg ivec osc)
      (let ((~arg (unwrap~pointer arg))
            (~ivec (unwrap~fixed ivec))
            (~osc ((fht-unwrap tkosc_t*) osc)))
        ((force ~log_intr) ~arg ~ivec ~osc)))))
(export log_intr)

;; int iprint(int lev, char *fmt, ...);
;; to be used with fh-cast
(define (iprint lev fmt . ~rest)
  (let ((~iprint
          (fh-link-proc
            ffi:int
            "iprint"
            (append (list ffi:int ffi-void*) (map car ~rest))
            (force ffi-octbx-llibs)))
        (~lev (unwrap~fixed lev))
        (~fmt (unwrap~pointer fmt)))
    (apply ~iprint ~lev ~fmt (map cdr ~rest))))
(export iprint)

;; typedef enum {
;;   TWI_OP_NONE,
;;   TWI_OP_SCL_LO,
;;   TWI_OP_SCL_HI,
;;   TWI_OP_SDA_LO,
;;   TWI_OP_SDA_HI,
;; } twi_bus_op_t;
(define twi_bus_op_t-enum-nvl
  '((TWI_OP_NONE . 0)
    (TWI_OP_SCL_LO . 1)
    (TWI_OP_SCL_HI . 2)
    (TWI_OP_SDA_LO . 3)
    (TWI_OP_SDA_HI . 4))
  )
(define twi_bus_op_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       twi_bus_op_t-enum-nvl))
(define-public (unwrap-twi_bus_op_t n)
  (cond
   ((symbol? n)
    (or (assq-ref twi_bus_op_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-twi_bus_op_t v)
  (assq-ref twi_bus_op_t-enum-vnl v))

;; typedef enum {
;;   TWI_EV_NONE,
;;   TWI_EV_SCL_LO,
;;   TWI_EV_SCL_HI,
;;   TWI_EV_SDA_LO,
;;   TWI_EV_SDA_HI,
;;   TWI_EV_BOTH_LO,
;;   TWI_EV_BOTH_HI,
;; } twi_bus_ev_t;
(define twi_bus_ev_t-enum-nvl
  '((TWI_EV_NONE . 0)
    (TWI_EV_SCL_LO . 1)
    (TWI_EV_SCL_HI . 2)
    (TWI_EV_SDA_LO . 3)
    (TWI_EV_SDA_HI . 4)
    (TWI_EV_BOTH_LO . 5)
    (TWI_EV_BOTH_HI . 6))
  )
(define twi_bus_ev_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       twi_bus_ev_t-enum-nvl))
(define-public (unwrap-twi_bus_ev_t n)
  (cond
   ((symbol? n)
    (or (assq-ref twi_bus_ev_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-twi_bus_ev_t v)
  (assq-ref twi_bus_ev_t-enum-vnl v))

;; typedef enum {
;;   TWI_LS_HI,
;;   TWI_LS_LO,
;;   TWI_LS_RS,
;;   TWI_LS_FL,
;; } twi_linst_t;
(define twi_linst_t-enum-nvl
  '((TWI_LS_HI . 0)
    (TWI_LS_LO . 1)
    (TWI_LS_RS . 2)
    (TWI_LS_FL . 3))
  )
(define twi_linst_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       twi_linst_t-enum-nvl))
(define-public (unwrap-twi_linst_t n)
  (cond
   ((symbol? n)
    (or (assq-ref twi_linst_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-twi_linst_t v)
  (assq-ref twi_linst_t-enum-vnl v))

;; typedef struct twi_node {
;;   struct twi_bus *bus;
;;   void (*bus_changed)(struct twi_node *, twi_linst_t scl, twi_linst_t sda);
;; } twi_node_t;
(define-public twi_node_t-desc
  (bs:struct
    (list `(bus ,(fh:pointer 'void))
          `(bus_changed
             ,(fh:function
                'void
                (list (fh:pointer 'void) int int))))))
(define-fh-compound-type twi_node_t twi_node_t-desc twi_node_t? 
 make-twi_node_t)
(export twi_node_t twi_node_t? make-twi_node_t)
(define-public twi_node_t*-desc
  (fh:pointer twi_node_t-desc))
(define-fh-pointer-type twi_node_t* twi_node_t*-desc twi_node_t*? 
 make-twi_node_t*)
(export twi_node_t* twi_node_t*? make-twi_node_t*)
(fh-ref<=>deref!
  twi_node_t*
  make-twi_node_t*
  twi_node_t
  make-twi_node_t)
(define-public struct-twi_node-desc
  twi_node_t-desc)
(define-fh-compound-type struct-twi_node struct-twi_node-desc struct-twi_node?
 make-struct-twi_node)
(export struct-twi_node struct-twi_node? make-struct-twi_node)
(define-public struct-twi_node*-desc
  twi_node_t*-desc)
(define-fh-pointer-type struct-twi_node* struct-twi_node*-desc 
 struct-twi_node*? make-struct-twi_node*)
(export struct-twi_node* struct-twi_node*? make-struct-twi_node*)
(fh-ref<=>deref!
  struct-twi_node*
  make-struct-twi_node*
  struct-twi_node
  make-struct-twi_node)

;; typedef struct twi_bus {
;;   int scl_t_rise_ns; /* t_rise 1000,300,120 ns */
;;   int scl_t_fall_ns; /* t_fall 250,250,120 ns */
;;   int sda_t_rise_ns; /* t_rise 1000,300,120 ns */
;;   int sda_t_fall_ns; /* t_fall 250,250,120 ns */
;;   tmsch_t *sch; /* scheduler */
;;   int nnode; /* number of nodes */
;;   struct twi_node *nodes[64]; /* up to 64 nodes */
;;   uint64_t nd_scl; /* bitmap of scl 0=HI */
;;   uint64_t nd_sda; /* bitmap of sda 0=HI */
;;   twi_linst_t scl;
;;   twi_linst_t sda;
;;   tmevt_t *scl_evt;
;;   tmevt_t *sda_evt;
;; } twi_bus_t;
(define-public twi_bus_t-desc
  (bs:struct
    (list `(scl_t_rise_ns ,int)
          `(scl_t_fall_ns ,int)
          `(sda_t_rise_ns ,int)
          `(sda_t_fall_ns ,int)
          `(sch ,tmsch_t*-desc)
          `(nnode ,int)
          `(nodes ,(bs:vector 64 (fh:pointer 'void)))
          `(nd_scl ,uint64)
          `(nd_sda ,uint64)
          `(scl ,int)
          `(sda ,int)
          `(scl_evt ,tmevt_t*-desc)
          `(sda_evt ,tmevt_t*-desc))))
(define-fh-compound-type twi_bus_t twi_bus_t-desc twi_bus_t? make-twi_bus_t)
(export twi_bus_t twi_bus_t? make-twi_bus_t)
(define-public twi_bus_t*-desc
  (fh:pointer twi_bus_t-desc))
(define-fh-pointer-type twi_bus_t* twi_bus_t*-desc twi_bus_t*? make-twi_bus_t*
 )
(export twi_bus_t* twi_bus_t*? make-twi_bus_t*)
(fh-ref<=>deref!
  twi_bus_t*
  make-twi_bus_t*
  twi_bus_t
  make-twi_bus_t)
(define-public struct-twi_bus-desc
  twi_bus_t-desc)
(define-fh-compound-type struct-twi_bus struct-twi_bus-desc struct-twi_bus? 
 make-struct-twi_bus)
(export struct-twi_bus struct-twi_bus? make-struct-twi_bus)
(define-public struct-twi_bus*-desc
  twi_bus_t*-desc)
(define-fh-pointer-type struct-twi_bus* struct-twi_bus*-desc struct-twi_bus*? 
 make-struct-twi_bus*)
(export struct-twi_bus* struct-twi_bus*? make-struct-twi_bus*)
(fh-ref<=>deref!
  struct-twi_bus*
  make-struct-twi_bus*
  struct-twi_bus
  make-struct-twi_bus)

;; void twi_bus_init(twi_bus_t *bus);
(define twi_bus_init
  (let ((~twi_bus_init
          (delay (fh-link-proc
                   ffi:void
                   "twi_bus_init"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (bus)
      (let ((~bus ((fht-unwrap twi_bus_t*) bus)))
        ((force ~twi_bus_init) ~bus)))))
(export twi_bus_init)

;; int twi_bus_add_node(twi_bus_t *bus, twi_node_t *node);
(define twi_bus_add_node
  (let ((~twi_bus_add_node
          (delay (fh-link-proc
                   ffi:int
                   "twi_bus_add_node"
                   (list ffi-void* ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (bus node)
      (let ((~bus ((fht-unwrap twi_bus_t*) bus))
            (~node ((fht-unwrap twi_node_t*) node)))
        ((force ~twi_bus_add_node) ~bus ~node)))))
(export twi_bus_add_node)

;; int twi_bus_action(twi_bus_t *bus, uint8_t id, twi_bus_op_t op);
(define twi_bus_action
  (let ((~twi_bus_action
          (delay (fh-link-proc
                   ffi:int
                   "twi_bus_action"
                   (list ffi-void* ffi:uint8 ffi:int)
                   (force ffi-octbx-llibs)))))
    (lambda (bus id op)
      (let ((~bus ((fht-unwrap twi_bus_t*) bus))
            (~id (unwrap~fixed id))
            (~op (unwrap-twi_bus_op_t op)))
        ((force ~twi_bus_action) ~bus ~id ~op)))))
(export twi_bus_action)

;; void twi_node_init(twi_node_t *bus);
(define twi_node_init
  (let ((~twi_node_init
          (delay (fh-link-proc
                   ffi:void
                   "twi_node_init"
                   (list ffi-void*)
                   (force ffi-octbx-llibs)))))
    (lambda (bus)
      (let ((~bus ((fht-unwrap twi_node_t*) bus)))
        ((force ~twi_node_init) ~bus)))))
(export twi_node_init)

;; access to enum symbols and #define'd constants:
(define ffi-octbx-symbol-tab
  '((TWI_LS_FL . 3)
    (TWI_LS_RS . 2)
    (TWI_LS_LO . 1)
    (TWI_LS_HI . 0)
    (TWI_LS_FL . 3)
    (TWI_LS_RS . 2)
    (TWI_LS_LO . 1)
    (TWI_LS_HI . 0)
    (TWI_EV_BOTH_HI . 6)
    (TWI_EV_BOTH_LO . 5)
    (TWI_EV_SDA_HI . 4)
    (TWI_EV_SDA_LO . 3)
    (TWI_EV_SCL_HI . 2)
    (TWI_EV_SCL_LO . 1)
    (TWI_EV_NONE . 0)
    (TWI_EV_BOTH_HI . 6)
    (TWI_EV_BOTH_LO . 5)
    (TWI_EV_SDA_HI . 4)
    (TWI_EV_SDA_LO . 3)
    (TWI_EV_SCL_HI . 2)
    (TWI_EV_SCL_LO . 1)
    (TWI_EV_NONE . 0)
    (TWI_OP_SDA_HI . 4)
    (TWI_OP_SDA_LO . 3)
    (TWI_OP_SCL_HI . 2)
    (TWI_OP_SCL_LO . 1)
    (TWI_OP_NONE . 0)
    (TWI_OP_SDA_HI . 4)
    (TWI_OP_SDA_LO . 3)
    (TWI_OP_SCL_HI . 2)
    (TWI_OP_SCL_LO . 1)
    (TWI_OP_NONE . 0)
    (PIN_ISC_LEVEL_gc . 5)
    (PIN_ISC_INPUT_DISABLE_gc . 4)
    (PIN_ISC_FALLING_gc . 3)
    (PIN_ISC_RISING_gc . 2)
    (PIN_ISC_BOTHEDGES_gc . 1)
    (PIN_ISC_INTDISABLE_gc . 0)
    (PIN_ISC_LEVEL_gc . 5)
    (PIN_ISC_INPUT_DISABLE_gc . 4)
    (PIN_ISC_FALLING_gc . 3)
    (PIN_ISC_RISING_gc . 2)
    (PIN_ISC_BOTHEDGES_gc . 1)
    (PIN_ISC_INTDISABLE_gc . 0)
    (PIN_LEV_HI . 1)
    (PIN_LEV_LOW . 0)
    (PIN_LEV_HI . 1)
    (PIN_LEV_LOW . 0)
    (PIN_DIR_OUT . 1)
    (PIN_DIR_IN . 0)
    (PIN_DIR_OUT . 1)
    (PIN_DIR_IN . 0)
    (PIN_ARG_TGL . 2)
    (PIN_ARG_SET . 1)
    (PIN_ARG_CLR . 0)
    (PIN_ARG_TGL . 2)
    (PIN_ARG_SET . 1)
    (PIN_ARG_CLR . 0)
    (PIN_OP_ISC . 3)
    (PIN_OP_OUT . 2)
    (PIN_OP_DIR . 1)
    (PIN_OP_PULUP . 0)
    (PIN_OP_ISC . 3)
    (PIN_OP_OUT . 2)
    (PIN_OP_DIR . 1)
    (PIN_OP_PULUP . 0)
    (PIN_BOP_PUL . 3)
    (PIN_BOP_LVL . 2)
    (PIN_BOP_DIR . 1)
    (PIN_BOP_NOP . 0)
    (PIN_BOP_PUL . 3)
    (PIN_BOP_LVL . 2)
    (PIN_BOP_DIR . 1)
    (PIN_BOP_NOP . 0)
    (PIN_T_GND . 3)
    (PIN_T_PWR . 2)
    (PIN_T_IO . 1)
    (PIN_T_NONE . 0)
    (PIN_T_GND . 3)
    (PIN_T_PWR . 2)
    (PIN_T_IO . 1)
    (PIN_T_NONE . 0)
    (CPU_VERS_AVRrc . 6)
    (CPU_VERS_AVRxt . 5)
    (CPU_VERS_AVRxm . 4)
    (CPU_VERS_AVRep . 3)
    (CPU_VERS_AVRe . 2)
    (CPU_VERS_AVR . 1)
    (CPU_VERS_UNKNOWN . 0)
    (CPU_VERS_AVRrc . 6)
    (CPU_VERS_AVRxt . 5)
    (CPU_VERS_AVRxm . 4)
    (CPU_VERS_AVRep . 3)
    (CPU_VERS_AVRe . 2)
    (CPU_VERS_AVR . 1)
    (CPU_VERS_UNKNOWN . 0)
    (HOOKS_ENABLED . 1)
    (PIN_CMD_LEVEL . 1)
    (ASM_LINSIZ . 64)
    (BREAK_INSN . 38296)
    (NBRKPT . 8)
    (TG_IOB . 3)
    (TG_DAT . 2)
    (TG_REG . 1)
    (CCP_IX . 52)
    (SPL_IX . 61)
    (SPH_IX . 62)
    (SREG_IX . 63)
    (REGZ_IX . 30)
    (REGY_IX . 28)
    (REGX_IX . 26)
    (REG1_IX . 1)
    (REG0_IX . 0)
    (NEPS_TLMPOST . 99)
    (NEPS_TLMPRE . -1)
    (NEPS_BREAK . -99)
    (NEPS_TICKPOST . 1)
    (NEPS_CPU . 5)
    (NEPS_TICK . -98)
    (NEPS_OSC . 1)
    (FEMPSEC . 1000000000000000)
    (PICOSEC . 1000000000000)
    (NANOSEC . 1000000000)))

(define ffi-octbx-symbol-val
  (lambda (k)
    (or (assq-ref ffi-octbx-symbol-tab k))))
(export ffi-octbx-symbol-val)

(define (unwrap-enum obj)
  (cond ((number? obj) obj)
        ((symbol? obj) (ffi-octbx-symbol-val obj))
        ((fh-object? obj) (struct-ref obj 0))
        (else (error "type mismatch"))))

(define ffi-octbx-types
  '((struct . "simtime") (pointer . "simtime_t") "simtime_t" (struct . "tmevt"
    ) (pointer . "tmevt_t") "tmevt_t" (struct . "tmsch") (pointer . "tmsch_t")
    "tmsch_t" (struct . "tkevt") (pointer . "tkevt_t") "tkevt_t" (struct . 
    "tkosc") (pointer . "tkosc_t") "tkosc_t" (struct . "tkclk") (pointer . 
    "tkclk_t") "tkclk_t" (struct . "brkpt") (pointer . "brkpt_t") "brkpt_t" 
    (struct . "updval") (pointer . "updval_t") "updval_t" (struct . "asmline")
    (pointer . "asmline_t") "asmline_t" (struct . "update") (pointer . 
    "update_t") "update_t" (struct . "cpu") (pointer . "cpu_t") "cpu_t" 
    "insn_rout_t" "iopin_notify_t" (struct . "iopin") (pointer . "iopin_t") 
    "iopin_t" (struct . "pin") (pointer . "pin_t") "pin_t" "pin_func_t" 
    (struct . "cpuint_reg") (pointer . "cpuint_reg_t") "cpuint_reg_t" (struct 
    . "cpuint") (pointer . "cpuint_t") "cpuint_t" (struct . "mcu") (pointer . 
    "mcu_t") "mcu_t" "mcu_gen_t" (struct . "twi_node") (pointer . "twi_node_t"
    ) "twi_node_t" (struct . "twi_bus") (pointer . "twi_bus_t") "twi_bus_t"))
(export ffi-octbx-types)

;; --- last line ---
