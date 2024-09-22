;; generated with `guild compile-ffi ffi/octbx.ffi'

(define-module (ffi octbx)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata))

(define (foreign-pointer-search name)
  (let loop ((libs (list #f "liboctbx")))
    (cond ((null? libs) (error "no library for ~s" name))
          ((false-if-exception
             (foreign-library-pointer (car libs) name)))
          (else (loop (cdr libs))))))


;; struct hook_link {
;;   struct hook_link *next;
;;   void (*hook)(void *arg);
;; };
(define-public struct-hook_link
  (name-ctype
    'struct-hook_link
    (cstruct
      (list `(next ,(cpointer 'void))
            `(hook ,(cpointer
                      (cfunction
                        (lambda (~proc)
                          (ffi:procedure->pointer
                            ffi:void
                            (lambda (arg) (let () (~proc arg)))
                            (list '*)))
                        (lambda (~fptr)
                          (let ((~proc (ffi:pointer->procedure
                                         ffi:void
                                         ~fptr
                                         (list '*))))
                            (lambda (arg)
                              (let ((arg (unwrap-pointer arg)))
                                (~proc arg))))))))))))
(define-public struct-hook_link*
  (name-ctype
    'struct-hook_link*
    (cpointer struct-hook_link)))

;; typedef struct hook_link hooks_t;
(define-public hooks_t
  (name-ctype 'hooks_t struct-hook_link))
(define-public hooks_t*
  (name-ctype 'hooks_t* struct-hook_link*))

;; void add_hook(struct hook_link *hooks, void (*hook)());
(define-public add_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_hook")
                        (list '* '*)))))
    (lambda (hooks hook)
      (let ((hooks (unwrap-pointer hooks))
            (hook (unwrap-pointer hook)))
        ((force ~proc) hooks hook)))))

;; void rem_hook(struct hook_link *hooks, void (*hook)(void *));
(define-public rem_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_hook")
                        (list '* '*)))))
    (lambda (hooks hook)
      (let ((hooks (unwrap-pointer hooks))
            (hook (unwrap-pointer hook)))
        ((force ~proc) hooks hook)))))

;; void exe_hook(struct hook_link *hooks, void *arg);
(define-public exe_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "exe_hook")
                        (list '* '*)))))
    (lambda (hooks arg)
      (let ((hooks (unwrap-pointer hooks))
            (arg (unwrap-pointer arg)))
        ((force ~proc) hooks arg)))))

;; typedef struct simtime {
;;   int32_t sec; /* seconds */
;;   int32_t nsec; /* nano-seconds => ssec ?? */
;; } simtime_t;
(define-public simtime_t
  (name-ctype
    'simtime_t
    (cstruct
      (list `(sec ,(cbase 'int32_t))
            `(nsec ,(cbase 'int32_t))))))
(define-public simtime_t*
  (name-ctype 'simtime_t* (cpointer simtime_t)))
(define-public struct-simtime
  (name-ctype 'struct-simtime simtime_t))
(define-public struct-simtime*
  (name-ctype 'struct-simtime* simtime_t*))

;; uint32_t u_genseed(void);
(define-public u_genseed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint32
                        (foreign-pointer-search "u_genseed")
                        (list)))))
    (lambda () (let () ((force ~proc))))))

;; uint32_t make_rand();
(define-public make_rand
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint32
                        (foreign-pointer-search "make_rand")
                        (list)))))
    (lambda () (let () ((force ~proc))))))

;; float nml_rand(unsigned int *seedp);
(define-public nml_rand
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:float
                        (foreign-pointer-search "nml_rand")
                        (list '*)))))
    (lambda (seedp)
      (let ((seedp (unwrap-pointer seedp)))
        ((force ~proc) seedp)))))

;; int tm_lt(simtime_t a, simtime_t b);
(define-public tm_lt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tm_lt")
                        (list (list ffi:int32 ffi:int32)
                              (list ffi:int32 ffi:int32))))))
    (lambda (a b) (let () ((force ~proc) a b)))))

;; int tm_le(simtime_t a, simtime_t b);
(define-public tm_le
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tm_le")
                        (list (list ffi:int32 ffi:int32)
                              (list ffi:int32 ffi:int32))))))
    (lambda (a b) (let () ((force ~proc) a b)))))

;; int tm_gt(simtime_t a, simtime_t b);
(define-public tm_gt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tm_gt")
                        (list (list ffi:int32 ffi:int32)
                              (list ffi:int32 ffi:int32))))))
    (lambda (a b) (let () ((force ~proc) a b)))))

;; int tm_ge(simtime_t a, simtime_t b);
(define-public tm_ge
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tm_ge")
                        (list (list ffi:int32 ffi:int32)
                              (list ffi:int32 ffi:int32))))))
    (lambda (a b) (let () ((force ~proc) a b)))))

;; simtime_t tm_add_ns(simtime_t ts, int nsec);
(define-public tm_add_ns
  (let ((~proc (delay (ffi:pointer->procedure
                        (list ffi:int32 ffi:int32)
                        (foreign-pointer-search "tm_add_ns")
                        (list (list ffi:int32 ffi:int32) ffi:int)))))
    (lambda (ts nsec)
      (let ((nsec (unwrap-number nsec)))
        ((lambda (~ret) (make-cdata simtime_t ~ret))
         ((force ~proc) ts nsec))))))

;; simtime_t tm_add(simtime_t a, simtime_t b);
(define-public tm_add
  (let ((~proc (delay (ffi:pointer->procedure
                        (list ffi:int32 ffi:int32)
                        (foreign-pointer-search "tm_add")
                        (list (list ffi:int32 ffi:int32)
                              (list ffi:int32 ffi:int32))))))
    (lambda (a b)
      (let ()
        ((lambda (~ret) (make-cdata simtime_t ~ret))
         ((force ~proc) a b))))))

;; float tm_to_float(simtime_t a);
(define-public tm_to_float
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:float
                        (foreign-pointer-search "tm_to_float")
                        (list (list ffi:int32 ffi:int32))))))
    (lambda (a) (let () ((force ~proc) a)))))

;; simtime_t tm_from_float(float t);
(define-public tm_from_float
  (let ((~proc (delay (ffi:pointer->procedure
                        (list ffi:int32 ffi:int32)
                        (foreign-pointer-search "tm_from_float")
                        (list ffi:float)))))
    (lambda (t)
      (let ((t (unwrap-number t)))
        ((lambda (~ret) (make-cdata simtime_t ~ret))
         ((force ~proc) t))))))

;; typedef void tmevt_rout_t(void *, struct tmsch *);
(define-public tmevt_rout_t
  (name-ctype
    'tmevt_rout_t
    (cfunction
      (lambda (~proc)
        (ffi:procedure->pointer
          ffi:void
          (lambda (arg0 arg1) (let () (~proc arg0 arg1)))
          (list '* '*)))
      (lambda (~fptr)
        (let ((~proc (ffi:pointer->procedure
                       ffi:void
                       ~fptr
                       (list '* '*))))
          (lambda (arg0 arg1)
            (let ((arg0 (unwrap-pointer arg0))
                  (arg1 (unwrap-pointer arg1)))
              (~proc arg0 arg1))))))))
(define-public tmevt_rout_t*
  (name-ctype
    'tmevt_rout_t*
    (cpointer tmevt_rout_t)))

;; typedef struct tmevt {
;;   struct tmevt *prev;
;;   struct tmevt *next;
;;   simtime_t when;
;;   int8_t neps;
;;   tmevt_rout_t *rout;
;;   void *arg;
;;   const char *name;
;; } tmevt_t;
(define-public tmevt_t
  (name-ctype
    'tmevt_t
    (cstruct
      (list `(prev ,(cpointer 'void))
            `(next ,(cpointer 'void))
            `(when ,simtime_t)
            `(neps ,(cbase 'int8_t))
            `(rout ,tmevt_rout_t*)
            `(arg ,(cpointer 'void))
            `(name ,(cpointer (cbase 'char)))))))
(define-public tmevt_t*
  (name-ctype 'tmevt_t* (cpointer tmevt_t)))
(define-public struct-tmevt
  (name-ctype 'struct-tmevt tmevt_t))
(define-public struct-tmevt*
  (name-ctype 'struct-tmevt* tmevt_t*))

;; typedef struct tmsch {
;;   tmevt_t todo;
;;   tmevt_t done;
;;   tmevt_t *evt;
;;   simtime_t time;
;;   tmevt_t *evts;
;; } tmsch_t;
(define-public tmsch_t
  (name-ctype
    'tmsch_t
    (cstruct
      (list `(todo ,tmevt_t)
            `(done ,tmevt_t)
            `(evt ,tmevt_t*)
            `(time ,simtime_t)
            `(evts ,tmevt_t*)))))
(define-public tmsch_t*
  (name-ctype 'tmsch_t* (cpointer tmsch_t)))
(define-public struct-tmsch
  (name-ctype 'struct-tmsch tmsch_t))
(define-public struct-tmsch*
  (name-ctype 'struct-tmsch* tmsch_t*))

;; void tmsch_init(tmsch_t *sch, int nevt);
(define-public tmsch_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tmsch_init")
                        (list '* ffi:int)))))
    (lambda (sch nevt)
      (let ((sch (unwrap-pointer sch))
            (nevt (unwrap-number nevt)))
        ((force ~proc) sch nevt)))))

;; void tmsch_fini(tmsch_t *sch);
(define-public tmsch_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tmsch_fini")
                        (list '*)))))
    (lambda (sch)
      (let ((sch (unwrap-pointer sch)))
        ((force ~proc) sch)))))

;; tmevt_t *tmsch_sched(tmsch_t *sch, simtime_t when, int8_t neps, tmevt_rout_t
;;      *rout, void *arg);
(define-public tmsch_sched
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "tmsch_sched")
                        (list '*
                              (list ffi:int32 ffi:int32)
                              ffi:int8
                              '*
                              '*)))))
    (lambda (sch when neps rout arg)
      (let ((sch (unwrap-pointer sch))
            (neps (unwrap-number "int8_t"))
            (rout (unwrap-pointer rout))
            (arg (unwrap-pointer arg)))
        ((lambda (~ret) (make-cdata tmevt_t* ~ret))
         ((force ~proc) sch when neps rout arg))))))

;; tmevt_t *tmsch_cancel(tmsch_t *sch, tmevt_t *evt);
(define-public tmsch_cancel
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "tmsch_cancel")
                        (list '* '*)))))
    (lambda (sch evt)
      (let ((sch (unwrap-pointer sch))
            (evt (unwrap-pointer evt)))
        ((lambda (~ret) (make-cdata tmevt_t* ~ret))
         ((force ~proc) sch evt))))))

;; void tmsch_run(tmsch_t *sch, simtime_t to, int neps);
(define-public tmsch_run
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tmsch_run")
                        (list '* (list ffi:int32 ffi:int32) ffi:int)))))
    (lambda (sch to neps)
      (let ((sch (unwrap-pointer sch))
            (neps (unwrap-number neps)))
        ((force ~proc) sch to neps)))))

;; void tmsch_print(tmsch_t *sch);
(define-public tmsch_print
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tmsch_print")
                        (list '*)))))
    (lambda (sch)
      (let ((sch (unwrap-pointer sch)))
        ((force ~proc) sch)))))

;; void tmsch_break_ev(void *arg, tmsch_t *sch);
(define-public tmsch_break_ev
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tmsch_break_ev")
                        (list '* '*)))))
    (lambda (arg sch)
      (let ((arg (unwrap-pointer arg))
            (sch (unwrap-pointer sch)))
        ((force ~proc) arg sch)))))

;; typedef uint64_t osctick_t;

;; typedef uint64_t clktick_t;

;; int tk_lt(osctick_t a, osctick_t b);
(define-public tk_lt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tk_lt")
                        (list ffi:uint64 ffi:uint64)))))
    (lambda (a b)
      (let ((a (unwrap-number "uint64_t"))
            (b (unwrap-number "uint64_t")))
        ((force ~proc) a b)))))

;; int tk_le(osctick_t a, osctick_t b);
(define-public tk_le
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tk_le")
                        (list ffi:uint64 ffi:uint64)))))
    (lambda (a b)
      (let ((a (unwrap-number "uint64_t"))
            (b (unwrap-number "uint64_t")))
        ((force ~proc) a b)))))

;; int tk_gt(osctick_t a, osctick_t b);
(define-public tk_gt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tk_gt")
                        (list ffi:uint64 ffi:uint64)))))
    (lambda (a b)
      (let ((a (unwrap-number "uint64_t"))
            (b (unwrap-number "uint64_t")))
        ((force ~proc) a b)))))

;; int tk_ge(osctick_t a, osctick_t b);
(define-public tk_ge
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "tk_ge")
                        (list ffi:uint64 ffi:uint64)))))
    (lambda (a b)
      (let ((a (unwrap-number "uint64_t"))
            (b (unwrap-number "uint64_t")))
        ((force ~proc) a b)))))

;; typedef void tkevt_rout_t(void *, struct tkclk *);
(define-public tkevt_rout_t
  (name-ctype
    'tkevt_rout_t
    (cfunction
      (lambda (~proc)
        (ffi:procedure->pointer
          ffi:void
          (lambda (arg0 arg1) (let () (~proc arg0 arg1)))
          (list '* '*)))
      (lambda (~fptr)
        (let ((~proc (ffi:pointer->procedure
                       ffi:void
                       ~fptr
                       (list '* '*))))
          (lambda (arg0 arg1)
            (let ((arg0 (unwrap-pointer arg0))
                  (arg1 (unwrap-pointer arg1)))
              (~proc arg0 arg1))))))))
(define-public tkevt_rout_t*
  (name-ctype
    'tkevt_rout_t*
    (cpointer tkevt_rout_t)))

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
(define-public tkevt_t
  (name-ctype
    'tkevt_t
    (cstruct
      (list `(prev ,(cpointer 'void))
            `(next ,(cpointer 'void))
            `(clk ,(cpointer 'void))
            `(when ,(cbase 'uint64_t))
            `(neps ,(cbase 'int8_t))
            `(rout ,tkevt_rout_t*)
            `(arg ,(cpointer 'void))
            `(name ,(cpointer (cbase 'char)))))))
(define-public tkevt_t*
  (name-ctype 'tkevt_t* (cpointer tkevt_t)))
(define-public struct-tkevt
  (name-ctype 'struct-tkevt tkevt_t))
(define-public struct-tkevt*
  (name-ctype 'struct-tkevt* tkevt_t*))

;; typedef struct tkosc {
;;   tkevt_t todo; /* scheduled */
;;   tkevt_t done; /* free */
;;   tkevt_t *evt; /* currently running */
;;   hooks_t next_tick_hooks; /* callback on next */
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
(define-public tkosc_t
  (name-ctype
    'tkosc_t
    (cstruct
      (list `(todo ,tkevt_t)
            `(done ,tkevt_t)
            `(evt ,tkevt_t*)
            `(next_tick_hooks ,hooks_t)
            `(tick ,(cbase 'uint64_t))
            `(time ,simtime_t)
            `(drift ,(cbase 'float))
            `(seed ,(cbase 'uint32_t))
            `(tmsch ,tmsch_t*)
            `(tmevt ,tmevt_t*)
            `(neps ,(cbase 'uint32_t))
            `(tkevt ,tkevt_t*)
            `(tick_per ,(cbase 'float))
            `(allan_dev ,(cbase 'float))
            `(drift_dev ,(cbase 'float))
            `(drift_rate ,(cbase 'float))
            `(step ,(cbase 'uint32_t))
            `(evts ,tkevt_t*)))))
(define-public tkosc_t*
  (name-ctype 'tkosc_t* (cpointer tkosc_t)))
(define-public struct-tkosc
  (name-ctype 'struct-tkosc tkosc_t))
(define-public struct-tkosc*
  (name-ctype 'struct-tkosc* tkosc_t*))

;; void tkosc_break_evt(void *arg, struct tkclk *clk);
(define-public tkosc_break_evt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tkosc_break_evt")
                        (list '* '*)))))
    (lambda (arg clk)
      (let ((arg (unwrap-pointer arg))
            (clk (unwrap-pointer clk)))
        ((force ~proc) arg clk)))))

;; void tkosc_init(tkosc_t *sch, struct tmsch *tmsch, int nevt);
(define-public tkosc_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tkosc_init")
                        (list '* '* ffi:int)))))
    (lambda (sch tmsch nevt)
      (let ((sch (unwrap-pointer sch))
            (tmsch (unwrap-pointer tmsch))
            (nevt (unwrap-number nevt)))
        ((force ~proc) sch tmsch nevt)))))

;; void tkosc_fini(tkosc_t *sch);
(define-public tkosc_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tkosc_fini")
                        (list '*)))))
    (lambda (sch)
      (let ((sch (unwrap-pointer sch)))
        ((force ~proc) sch)))))

;; void tkosc_sync(tkosc_t *sch);
(define-public tkosc_sync
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tkosc_sync")
                        (list '*)))))
    (lambda (sch)
      (let ((sch (unwrap-pointer sch)))
        ((force ~proc) sch)))))

;; void tkosc_print(tkosc_t *sch);
(define-public tkosc_print
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tkosc_print")
                        (list '*)))))
    (lambda (sch)
      (let ((sch (unwrap-pointer sch)))
        ((force ~proc) sch)))))

;; tkevt_t *tkosc_sched(tkosc_t *sch, osctick_t when, int8_t neps, tkevt_rout_t
;;      *rout, void *arg);
(define-public tkosc_sched
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "tkosc_sched")
                        (list '* ffi:uint64 ffi:int8 '* '*)))))
    (lambda (sch when neps rout arg)
      (let ((sch (unwrap-pointer sch))
            (when (unwrap-number "uint64_t"))
            (neps (unwrap-number "int8_t"))
            (rout (unwrap-pointer rout))
            (arg (unwrap-pointer arg)))
        ((lambda (~ret) (make-cdata tkevt_t* ~ret))
         ((force ~proc) sch when neps rout arg))))))

;; tkevt_t *tkosc_cancel(tkosc_t *sch, tkevt_t *evt);
(define-public tkosc_cancel
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "tkosc_cancel")
                        (list '* '*)))))
    (lambda (sch evt)
      (let ((sch (unwrap-pointer sch))
            (evt (unwrap-pointer evt)))
        ((lambda (~ret) (make-cdata tkevt_t* ~ret))
         ((force ~proc) sch evt))))))

;; void next_tick_hook(tkosc_t *);
(define-public next_tick_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "next_tick_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_next_tick_hook(tkosc_t *, void (*)(void *));
(define-public add_next_tick_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_next_tick_hook")
                        (list '* '*)))))
    (lambda (arg0 arg1)
      (let ((arg0 (unwrap-pointer arg0))
            (arg1 (unwrap-pointer arg1)))
        ((force ~proc) arg0 arg1)))))

;; void rem_next_tick_hook(tkosc_t *, void (*)(void *));
(define-public rem_next_tick_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_next_tick_hook")
                        (list '* '*)))))
    (lambda (arg0 arg1)
      (let ((arg0 (unwrap-pointer arg0))
            (arg1 (unwrap-pointer arg1)))
        ((force ~proc) arg0 arg1)))))

;; typedef struct tkclk {
;;   tkosc_t *osc; /* oscillator */
;;   clktick_t tick; /* clock tick = osctick/div */
;;   uint16_t div;
;; } tkclk_t;
(define-public tkclk_t
  (name-ctype
    'tkclk_t
    (cstruct
      (list `(osc ,tkosc_t*)
            `(tick ,(cbase 'uint64_t))
            `(div ,(cbase 'uint16_t))))))
(define-public tkclk_t*
  (name-ctype 'tkclk_t* (cpointer tkclk_t)))
(define-public struct-tkclk
  (name-ctype 'struct-tkclk tkclk_t))
(define-public struct-tkclk*
  (name-ctype 'struct-tkclk* tkclk_t*))

;; void tkclk_init(tkclk_t *, tkosc_t *tkosc, uint16_t div);
(define-public tkclk_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "tkclk_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 tkosc div)
      (let ((arg0 (unwrap-pointer arg0))
            (tkosc (unwrap-pointer tkosc))
            (div (unwrap-number "uint16_t")))
        ((force ~proc) arg0 tkosc div)))))

;; tkevt_t *tkclk_sched(tkclk_t *clk, uint32_t delta, int8_t neps, tkevt_rout_t
;;      *rout, void *arg);
(define-public tkclk_sched
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "tkclk_sched")
                        (list '* ffi:uint32 ffi:int8 '* '*)))))
    (lambda (clk delta neps rout arg)
      (let ((clk (unwrap-pointer clk))
            (delta (unwrap-number "uint32_t"))
            (neps (unwrap-number "int8_t"))
            (rout (unwrap-pointer rout))
            (arg (unwrap-pointer arg)))
        ((lambda (~ret) (make-cdata tkevt_t* ~ret))
         ((force ~proc) clk delta neps rout arg))))))

;; tkevt_t *tkclk_cancel(tkclk_t *clk, tkevt_t *evt);
(define-public tkclk_cancel
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "tkclk_cancel")
                        (list '* '*)))))
    (lambda (clk evt)
      (let ((clk (unwrap-pointer clk))
            (evt (unwrap-pointer evt)))
        ((lambda (~ret) (make-cdata tkevt_t* ~ret))
         ((force ~proc) clk evt))))))

;; typedef enum {
;;   CPU_VERS_UNKNOWN,
;;   CPU_VERS_AVR,
;;   CPU_VERS_AVRe,
;;   CPU_VERS_AVRep,
;;   CPU_VERS_AVRxm,
;;   CPU_VERS_AVRxt,
;;   CPU_VERS_AVRrc,
;; } cpu_vers_t;
(define-public cpu_vers_t
  (name-ctype
    'cpu_vers_t
    (cenum '((CPU_VERS_UNKNOWN 0)
             (CPU_VERS_AVR 1)
             (CPU_VERS_AVRe 2)
             (CPU_VERS_AVRep 3)
             (CPU_VERS_AVRxm 4)
             (CPU_VERS_AVRxt 5)
             (CPU_VERS_AVRrc 6)))))
(define-public unwrap-cpu_vers_t
  (let ((vald (cenum-vald (ctype-info cpu_vers_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-cpu_vers_t
  (let ((symd (cenum-symd (ctype-info cpu_vers_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef struct brkpt {
;;   uint32_t pc; /* word address */
;;   uint16_t insn; /* instruction saved */
;;   uint16_t _pad;
;; } brkpt_t;
(define-public brkpt_t
  (name-ctype
    'brkpt_t
    (cstruct
      (list `(pc ,(cbase 'uint32_t))
            `(insn ,(cbase 'uint16_t))
            `(_pad ,(cbase 'uint16_t))))))
(define-public brkpt_t*
  (name-ctype 'brkpt_t* (cpointer brkpt_t)))
(define-public struct-brkpt
  (name-ctype 'struct-brkpt brkpt_t))
(define-public struct-brkpt*
  (name-ctype 'struct-brkpt* brkpt_t*))

;; typedef struct updval {
;;   uint16_t ix; /* addr */
;;   uint8_t dv; /* data */
;;   uint8_t mk; /* I/O mask */
;;   struct {
;;     uint8_t tg : 2; /* target: 0:reg 1:data */
;;   };
;; } updval_t;
(define-public updval_t
  (name-ctype
    'updval_t
    (cstruct
      (list `(ix ,(cbase 'uint16_t))
            `(dv ,(cbase 'uint8_t))
            `(mk ,(cbase 'uint8_t))
            `(_ ,(cstruct (list `(tg ,(cbase 'uint8_t) 2))))))))
(define-public updval_t*
  (name-ctype 'updval_t* (cpointer updval_t)))
(define-public struct-updval
  (name-ctype 'struct-updval updval_t))
(define-public struct-updval*
  (name-ctype 'struct-updval* updval_t*))

;; typedef struct asmline {
;;   const char *fmt;
;;   int narg;
;;   int args[3];
;; } asmline_t;
(define-public asmline_t
  (name-ctype
    'asmline_t
    (cstruct
      (list `(fmt ,(cpointer (cbase 'char)))
            `(narg ,(cbase 'int))
            `(args ,(carray (cbase 'int) 3))))))
(define-public asmline_t*
  (name-ctype 'asmline_t* (cpointer asmline_t)))
(define-public struct-asmline
  (name-ctype 'struct-asmline asmline_t))
(define-public struct-asmline*
  (name-ctype 'struct-asmline* asmline_t*))

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
(define-public update_t
  (name-ctype
    'update_t
    (cstruct
      (list `(pc ,(cbase 'uint32_t))
            `(nclk ,(cbase 'int))
            `(nval ,(cbase 'uint8_t))
            `(vals ,(carray updval_t 8))
            `(bpid ,(cbase 'uint8_t))
            `(insn ,(cbase 'uint16_t))
            `(asml ,asmline_t)
            `(insn_hook
               ,(cpointer
                  (cfunction
                    (lambda (~proc)
                      (ffi:procedure->pointer
                        ffi:void
                        (lambda (arg0) (let () (~proc arg0)))
                        (list '*)))
                    (lambda (~fptr)
                      (let ((~proc (ffi:pointer->procedure
                                     ffi:void
                                     ~fptr
                                     (list '*))))
                        (lambda (arg0)
                          (let ((arg0 (unwrap-pointer arg0)))
                            (~proc arg0))))))))))))
(define-public update_t*
  (name-ctype 'update_t* (cpointer update_t)))
(define-public struct-update
  (name-ctype 'struct-update update_t))
(define-public struct-update*
  (name-ctype 'struct-update* update_t*))

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
(define-public cpu_t
  (name-ctype
    'cpu_t
    (cstruct
      (list `(host ,(cpointer 'void))
            `(_ ,(cstruct
                   (list `(gen_asml ,(cbase 'uint8_t) 1)
                         `(show_ba ,(cbase 'uint8_t) 1)
                         `(pc_22bits ,(cbase 'uint8_t) 1)
                         `(trace ,(cbase 'uint8_t) 1)
                         `(asleep ,(cbase 'uint8_t) 1)
                         `(sleepe ,(cbase 'uint8_t) 1)
                         `(inisr ,(cbase 'uint8_t) 1)
                         `(brkintr ,(cbase 'uint8_t) 1))))
            `(vers ,cpu_vers_t)
            `(iobase ,(cbase 'uint8_t))
            `(_ ,(cstruct
                   (list `(RAMPX_IX ,(cbase 'uint16_t))
                         `(RAMPY_IX ,(cbase 'uint16_t))
                         `(RAMPZ_IX ,(cbase 'uint16_t))
                         `(RAMPD_IX ,(cbase 'uint16_t)))))
            `(EIND_IX ,(cbase 'uint16_t))
            `(clk_cpu ,tkclk_t)
            `(ccp_cnt ,(cbase 'uint8_t))
            `(xevt ,tkevt_t*)
            `(pc ,(cbase 'uint32_t))
            `(upd ,update_t)
            `(regs ,(cpointer (cbase 'uint8_t)))
            `(prog ,(cpointer (cbase 'uint16_t)))
            `(data ,(cpointer (cbase 'uint8_t)))
            `(onio ,(cpointer (cbase 'uint8_t)))
            `(progsize ,(cbase 'uint16_t))
            `(datasize ,(cbase 'uint16_t))
            `(brkpts ,(carray brkpt_t 8))))))
(define-public cpu_t*
  (name-ctype 'cpu_t* (cpointer cpu_t)))
(define-public struct-cpu
  (name-ctype 'struct-cpu cpu_t))
(define-public struct-cpu*
  (name-ctype 'struct-cpu* cpu_t*))

;; typedef int (*insn_rout_t)(cpu_t *cpu, uint16_t insn);
(define-public *insn_rout_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (cpu insn)
          (let ((cpu (make-cdata cpu_t* cpu)))
            ((lambda (~ret) (unwrap-number ~ret))
             (~proc cpu insn))))
        (list '* ffi:uint16)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* ffi:uint16))))
        (lambda (cpu insn)
          (let ((cpu (unwrap-pointer cpu))
                (insn (unwrap-number "uint16_t")))
            (~proc cpu insn)))))))
(define-public insn_rout_t
  (name-ctype 'insn_rout_t (cpointer *insn_rout_t)))

;; int cpu_load_program(cpu_t *cpu, char *filename);
(define-public cpu_load_program
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cpu_load_program")
                        (list '* '*)))))
    (lambda (cpu filename)
      (let ((cpu (unwrap-pointer cpu))
            (filename (unwrap-pointer filename)))
        ((force ~proc) cpu filename)))))

;; void cpu_tick_evt(void *arg, tkclk_t *clk);
(define-public cpu_tick_evt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_tick_evt")
                        (list '* '*)))))
    (lambda (arg clk)
      (let ((arg (unwrap-pointer arg))
            (clk (unwrap-pointer clk)))
        ((force ~proc) arg clk)))))

;; insn_rout_t decode_insn(uint16_t insn, cpu_vers_t vers);
(define-public decode_insn
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "decode_insn")
                        (list ffi:uint16 ffi:int)))))
    (lambda (insn vers)
      (let ((insn (unwrap-number "uint16_t"))
            (vers (unwrap~enum vers)))
        ((lambda (~ret) (make-cdata insn_rout_t ~ret))
         ((force ~proc) insn vers))))))

;; uint32_t cpu_next_pc(cpu_t *cpu, uint32_t addr);
(define-public cpu_next_pc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint32
                        (foreign-pointer-search "cpu_next_pc")
                        (list '* ffi:uint32)))))
    (lambda (cpu addr)
      (let ((cpu (unwrap-pointer cpu))
            (addr (unwrap-number "uint32_t")))
        ((force ~proc) cpu addr)))))

;; int insn_wsize(uint16_t insn, cpu_vers_t vers);
(define-public insn_wsize
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "insn_wsize")
                        (list ffi:uint16 ffi:int)))))
    (lambda (insn vers)
      (let ((insn (unwrap-number "uint16_t"))
            (vers (unwrap~enum vers)))
        ((force ~proc) insn vers)))))

;; int cpu_intr(cpu_t *cpu, int intr_ix);
(define-public cpu_intr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cpu_intr")
                        (list '* ffi:int)))))
    (lambda (cpu intr_ix)
      (let ((cpu (unwrap-pointer cpu))
            (intr_ix (unwrap-number intr_ix)))
        ((force ~proc) cpu intr_ix)))))

;; void cpu_reset(cpu_t *cpu);
(define-public cpu_reset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_reset")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void cpu_disp_regs(cpu_t *cpu);
(define-public cpu_disp_regs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_disp_regs")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void cpu_disp_data(cpu_t *cpu, int addr);
(define-public cpu_disp_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_disp_data")
                        (list '* ffi:int)))))
    (lambda (cpu addr)
      (let ((cpu (unwrap-pointer cpu))
            (addr (unwrap-number addr)))
        ((force ~proc) cpu addr)))))

;; void cpu_disp(cpu_t *cpu);
(define-public cpu_disp
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_disp")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; int asmstrf(asmline_t *, int show_ba, char *buf, int bufsiz);
(define-public asmstrf
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "asmstrf")
                        (list '* ffi:int '* ffi:int)))))
    (lambda (arg0 show_ba buf bufsiz)
      (let ((arg0 (unwrap-pointer arg0))
            (show_ba (unwrap-number show_ba))
            (buf (unwrap-pointer buf))
            (bufsiz (unwrap-number bufsiz)))
        ((force ~proc) arg0 show_ba buf bufsiz)))))

;; void brkpt_init(brkpt_t *brkpts, int nbrkpt);
(define-public brkpt_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "brkpt_init")
                        (list '* ffi:int)))))
    (lambda (brkpts nbrkpt)
      (let ((brkpts (unwrap-pointer brkpts))
            (nbrkpt (unwrap-number nbrkpt)))
        ((force ~proc) brkpts nbrkpt)))))

;; int brkpt_alloc(cpu_t *cpu);
(define-public brkpt_alloc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "brkpt_alloc")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void brkpt_dealloc(cpu_t *cpu, int ix);
(define-public brkpt_dealloc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "brkpt_dealloc")
                        (list '* ffi:int)))))
    (lambda (cpu ix)
      (let ((cpu (unwrap-pointer cpu))
            (ix (unwrap-number ix)))
        ((force ~proc) cpu ix)))))

;; void brkpt_set(cpu_t *cpu, int ix, uint32_t pc);
(define-public brkpt_set
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "brkpt_set")
                        (list '* ffi:int ffi:uint32)))))
    (lambda (cpu ix pc)
      (let ((cpu (unwrap-pointer cpu))
            (ix (unwrap-number ix))
            (pc (unwrap-number "uint32_t")))
        ((force ~proc) cpu ix pc)))))

;; uint16_t brkpt_unset(cpu_t *cpu, int ix);
(define-public brkpt_unset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint16
                        (foreign-pointer-search "brkpt_unset")
                        (list '* ffi:int)))))
    (lambda (cpu ix)
      (let ((cpu (unwrap-pointer cpu))
            (ix (unwrap-number ix)))
        ((force ~proc) cpu ix)))))

;; void brkpt_reset(cpu_t *cpu, int ix);
(define-public brkpt_reset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "brkpt_reset")
                        (list '* ffi:int)))))
    (lambda (cpu ix)
      (let ((cpu (unwrap-pointer cpu))
            (ix (unwrap-number ix)))
        ((force ~proc) cpu ix)))))

;; int brkpt_at(cpu_t *cpu, uint32_t pc);
(define-public brkpt_at
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "brkpt_at")
                        (list '* ffi:uint32)))))
    (lambda (cpu pc)
      (let ((cpu (unwrap-pointer cpu))
            (pc (unwrap-number "uint32_t")))
        ((force ~proc) cpu pc)))))

;; int add_brkpt(cpu_t *cpu, uint32_t pc_ba);
(define-public add_brkpt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "add_brkpt")
                        (list '* ffi:uint32)))))
    (lambda (cpu pc_ba)
      (let ((cpu (unwrap-pointer cpu))
            (pc_ba (unwrap-number "uint32_t")))
        ((force ~proc) cpu pc_ba)))))

;; int rem_brkpt(cpu_t *cpu, uint32_t pc_ba);
(define-public rem_brkpt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "rem_brkpt")
                        (list '* ffi:uint32)))))
    (lambda (cpu pc_ba)
      (let ((cpu (unwrap-pointer cpu))
            (pc_ba (unwrap-number "uint32_t")))
        ((force ~proc) cpu pc_ba)))))

;; void wchpt_init(void);
(define-public wchpt_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wchpt_init")
                        (list)))))
    (lambda () (let () ((force ~proc))))))

;; int wchpt_alloc(cpu_t *cpu);
(define-public wchpt_alloc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "wchpt_alloc")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void wchpt_dealloc(int ix);
(define-public wchpt_dealloc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wchpt_dealloc")
                        (list ffi:int)))))
    (lambda (ix)
      (let ((ix (unwrap-number ix)))
        ((force ~proc) ix)))))

;; void wchpt_set(int ix, uint16_t addr);
(define-public wchpt_set
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "wchpt_set")
                        (list ffi:int ffi:uint16)))))
    (lambda (ix addr)
      (let ((ix (unwrap-number ix))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) ix addr)))))

;; uint16_t wchpt_unset(int ix);
(define-public wchpt_unset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint16
                        (foreign-pointer-search "wchpt_unset")
                        (list ffi:int)))))
    (lambda (ix)
      (let ((ix (unwrap-number ix)))
        ((force ~proc) ix)))))

;; int add_wchpt(cpu_t *cpu, uint16_t addr);
(define-public add_wchpt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "add_wchpt")
                        (list '* ffi:uint16)))))
    (lambda (cpu addr)
      (let ((cpu (unwrap-pointer cpu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) cpu addr)))))

;; int del_wchpt(cpu_t *cpu, uint16_t addr);
(define-public del_wchpt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "del_wchpt")
                        (list '* ffi:uint16)))))
    (lambda (cpu addr)
      (let ((cpu (unwrap-pointer cpu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) cpu addr)))))

;; cpu_t *make_raw_cpu(uint16_t *prog, uint8_t *data);
(define-public make_raw_cpu
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "make_raw_cpu")
                        (list '* '*)))))
    (lambda (prog data)
      (let ((prog (unwrap-pointer prog))
            (data (unwrap-pointer data)))
        ((lambda (~ret) (make-cdata cpu_t* ~ret))
         ((force ~proc) prog data))))))

;; void cpu_set_pc(cpu_t *cpu, uint32_t pc);
(define-public cpu_set_pc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_set_pc")
                        (list '* ffi:uint32)))))
    (lambda (cpu pc)
      (let ((cpu (unwrap-pointer cpu))
            (pc (unwrap-number "uint32_t")))
        ((force ~proc) cpu pc)))))

;; uint32_t cpu_get_pc(cpu_t *cpu);
(define-public cpu_get_pc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint32
                        (foreign-pointer-search "cpu_get_pc")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; uint16_t cpu_get_insn(cpu_t *cpu);
(define-public cpu_get_insn
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint16
                        (foreign-pointer-search "cpu_get_insn")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; char *cpu_show_insn(cpu_t *cpu, int show_ba);
(define-public cpu_show_insn
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cpu_show_insn")
                        (list '* ffi:int)))))
    (lambda (cpu show_ba)
      (let ((cpu (unwrap-pointer cpu))
            (show_ba (unwrap-number show_ba)))
        ((force ~proc) cpu show_ba)))))

;; void cpu_sei(cpu_t *cpu);
(define-public cpu_sei
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_sei")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void cpu_cli(cpu_t *cpu);
(define-public cpu_cli
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_cli")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void cpu_set_trace(cpu_t *cpu);
(define-public cpu_set_trace
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_set_trace")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void cpu_clr_trace(cpu_t *cpu);
(define-public cpu_clr_trace
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_clr_trace")
                        (list '*)))))
    (lambda (cpu)
      (let ((cpu (unwrap-pointer cpu)))
        ((force ~proc) cpu)))))

;; void add_cpu_call_hook(void (*hook)(struct cpu *));
(define-public add_cpu_call_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_cpu_call_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_call_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_call_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_cpu_call_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_call_hook(struct cpu *);
(define-public cpu_call_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_call_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_cpu_ret_hook(void (*hook)(struct cpu *));
(define-public add_cpu_ret_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_cpu_ret_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_ret_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_ret_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_cpu_ret_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_ret_hook(struct cpu *);
(define-public cpu_ret_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_ret_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_cpu_intr_hook(void (*hook)(struct cpu *));
(define-public add_cpu_intr_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_cpu_intr_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_intr_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_intr_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_cpu_intr_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_intr_hook(struct cpu *);
(define-public cpu_intr_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_intr_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_cpu_reti_hook(void (*hook)(struct cpu *));
(define-public add_cpu_reti_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_cpu_reti_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_reti_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_reti_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_cpu_reti_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_reti_hook(struct cpu *);
(define-public cpu_reti_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_reti_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_cpu_pre_exec_hook(void (*hook)(struct cpu *));
(define-public add_cpu_pre_exec_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_cpu_pre_exec_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_pre_exec_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_pre_exec_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_cpu_pre_exec_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_pre_exec_hook(struct cpu *);
(define-public cpu_pre_exec_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_pre_exec_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_cpu_post_exec_hook(void (*hook)(struct cpu *));
(define-public add_cpu_post_exec_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "add_cpu_post_exec_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_post_exec_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_post_exec_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "rem_cpu_post_exec_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_post_exec_hook(struct cpu *);
(define-public cpu_post_exec_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_post_exec_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void add_cpu_post_fetch_hook(void (*hook)(struct cpu *));
(define-public add_cpu_post_fetch_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "add_cpu_post_fetch_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void rem_cpu_post_fetch_hook(void (*hook)(struct cpu *));
(define-public rem_cpu_post_fetch_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "rem_cpu_post_fetch_hook")
                        (list '*)))))
    (lambda (hook)
      (let ((hook (unwrap-pointer hook)))
        ((force ~proc) hook)))))

;; void cpu_post_fetch_hook(struct cpu *);
(define-public cpu_post_fetch_hook
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpu_post_fetch_hook")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; typedef enum {
;;   PIN_T_NONE,
;;   PIN_T_IO,
;;   PIN_T_PWR,
;;   PIN_T_GND,
;; } pin_type_t;
(define-public pin_type_t
  (name-ctype
    'pin_type_t
    (cenum '((PIN_T_NONE 0)
             (PIN_T_IO 1)
             (PIN_T_PWR 2)
             (PIN_T_GND 3)))))
(define-public unwrap-pin_type_t
  (let ((vald (cenum-vald (ctype-info pin_type_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pin_type_t
  (let ((symd (cenum-symd (ctype-info pin_type_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef void (*iopin_notify_t)(void *tgt, struct iopin *pin, int op, int val
;;     );
(define-public *iopin_notify_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:void
        (lambda (tgt pin op val)
          (let () (~proc tgt pin op val)))
        (list '* '* ffi:int ffi:int)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:void
                     ~fptr
                     (list '* '* ffi:int ffi:int))))
        (lambda (tgt pin op val)
          (let ((tgt (unwrap-pointer tgt))
                (pin (unwrap-pointer pin))
                (op (unwrap-number op))
                (val (unwrap-number val)))
            (~proc tgt pin op val)))))))
(define-public iopin_notify_t
  (name-ctype
    'iopin_notify_t
    (cpointer *iopin_notify_t)))

;; typedef enum {
;;   PIN_BOP_NOP,
;;   PIN_BOP_DIR,
;;   PIN_BOP_LVL,
;;   PIN_BOP_PUL,
;; } pin_bus_op_t;
(define-public pin_bus_op_t
  (name-ctype
    'pin_bus_op_t
    (cenum '((PIN_BOP_NOP 0)
             (PIN_BOP_DIR 1)
             (PIN_BOP_LVL 2)
             (PIN_BOP_PUL 3)))))
(define-public unwrap-pin_bus_op_t
  (let ((vald (cenum-vald (ctype-info pin_bus_op_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pin_bus_op_t
  (let ((symd (cenum-symd (ctype-info pin_bus_op_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   PIN_OP_PULUP,
;;   PIN_OP_DIR,
;;   PIN_OP_OUT,
;;   PIN_OP_ISC,
;; } pinop_t;
(define-public pinop_t
  (name-ctype
    'pinop_t
    (cenum '((PIN_OP_PULUP 0)
             (PIN_OP_DIR 1)
             (PIN_OP_OUT 2)
             (PIN_OP_ISC 3)))))
(define-public unwrap-pinop_t
  (let ((vald (cenum-vald (ctype-info pinop_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pinop_t
  (let ((symd (cenum-symd (ctype-info pinop_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   PIN_ARG_CLR,
;;   PIN_ARG_SET,
;;   PIN_ARG_TGL,
;; } pinarg_t;
(define-public pinarg_t
  (name-ctype
    'pinarg_t
    (cenum '((PIN_ARG_CLR 0) (PIN_ARG_SET 1) (PIN_ARG_TGL 2)))))
(define-public unwrap-pinarg_t
  (let ((vald (cenum-vald (ctype-info pinarg_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pinarg_t
  (let ((symd (cenum-symd (ctype-info pinarg_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   PIN_DIR_IN = 0,
;;   PIN_DIR_OUT = 1,
;; } pindir_t;
(define-public pindir_t
  (name-ctype
    'pindir_t
    (cenum '((PIN_DIR_IN 0) (PIN_DIR_OUT 1)))))
(define-public unwrap-pindir_t
  (let ((vald (cenum-vald (ctype-info pindir_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pindir_t
  (let ((symd (cenum-symd (ctype-info pindir_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   PIN_LEV_LOW = 0,
;;   PIN_LEV_HI = 1,
;; } pinlev_t;
(define-public pinlev_t
  (name-ctype
    'pinlev_t
    (cenum '((PIN_LEV_LOW 0) (PIN_LEV_HI 1)))))
(define-public unwrap-pinlev_t
  (let ((vald (cenum-vald (ctype-info pinlev_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pinlev_t
  (let ((symd (cenum-symd (ctype-info pinlev_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   PIN_ISC_INTDISABLE_gc = 0x0,
;;   PIN_ISC_BOTHEDGES_gc = 0x1,
;;   PIN_ISC_RISING_gc = 0x2,
;;   PIN_ISC_FALLING_gc = 0x3,
;;   PIN_ISC_INPUT_DISABLE_gc = 0x4,
;;   PIN_ISC_LEVEL_gc = 0x5,
;; } pinisc_t;
(define-public pinisc_t
  (name-ctype
    'pinisc_t
    (cenum '((PIN_ISC_INTDISABLE_gc 0)
             (PIN_ISC_BOTHEDGES_gc 1)
             (PIN_ISC_RISING_gc 2)
             (PIN_ISC_FALLING_gc 3)
             (PIN_ISC_INPUT_DISABLE_gc 4)
             (PIN_ISC_LEVEL_gc 5)))))
(define-public unwrap-pinisc_t
  (let ((vald (cenum-vald (ctype-info pinisc_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-pinisc_t
  (let ((symd (cenum-symd (ctype-info pinisc_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

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
(define-public iopin_t
  (name-ctype
    'iopin_t
    (cstruct
      (list `(clk_per ,tkclk_t*)
            `(pos ,(cbase 'uint8_t))
            `(_ ,(cstruct (list `(pullup ,(cbase 'uint8_t) 1))))
            `(dir ,(cbase 'uint8_t))
            `(isc ,(cbase 'uint8_t))
            `(wrlev ,(cbase 'uint8_t))
            `(rdlev ,(cbase 'uint8_t))
            `(aval ,(cbase 'double))
            `(hey_bus ,iopin_notify_t)
            `(bus ,(cpointer 'void))
            `(hey_per ,iopin_notify_t)
            `(per ,(cpointer 'void))
            `(def_hey_per ,iopin_notify_t)
            `(def_per ,(cpointer 'void))))))
(define-public iopin_t*
  (name-ctype 'iopin_t* (cpointer iopin_t)))
(define-public struct-iopin
  (name-ctype 'struct-iopin iopin_t))
(define-public struct-iopin*
  (name-ctype 'struct-iopin* iopin_t*))

;; typedef struct pin {
;;   union {
;;     iopin_t iopin;
;;   };
;;   pin_type_t type;
;; } pin_t;
(define-public pin_t
  (name-ctype
    'pin_t
    (cstruct
      (list `(_ ,(cunion (list `(iopin ,iopin_t))))
            `(type ,pin_type_t)))))
(define-public pin_t*
  (name-ctype 'pin_t* (cpointer pin_t)))
(define-public struct-pin
  (name-ctype 'struct-pin pin_t))
(define-public struct-pin*
  (name-ctype 'struct-pin* pin_t*))

;; void iopin_notify_bus(iopin_t *pin, int op, int val);
(define-public iopin_notify_bus
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "iopin_notify_bus")
                        (list '* ffi:int ffi:int)))))
    (lambda (pin op val)
      (let ((pin (unwrap-pointer pin))
            (op (unwrap-number op))
            (val (unwrap-number val)))
        ((force ~proc) pin op val)))))

;; void iopin_notify_per(iopin_t *pin, int op, int arg);
(define-public iopin_notify_per
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "iopin_notify_per")
                        (list '* ffi:int ffi:int)))))
    (lambda (pin op arg)
      (let ((pin (unwrap-pointer pin))
            (op (unwrap-number op))
            (arg (unwrap-number arg)))
        ((force ~proc) pin op arg)))))

;; void iopin_pullup(iopin_t *pin, int ena);
(define-public iopin_pullup
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "iopin_pullup")
                        (list '* ffi:int)))))
    (lambda (pin ena)
      (let ((pin (unwrap-pointer pin))
            (ena (unwrap-number ena)))
        ((force ~proc) pin ena)))))

;; uint8_t iopin_rdD(iopin_t *);
(define-public iopin_rdD
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "iopin_rdD")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; double iopin_rdA(iopin_t *);
(define-public iopin_rdA
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search "iopin_rdA")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; void iopin_wrD(iopin_t *pin, uint8_t lev);
(define-public iopin_wrD
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "iopin_wrD")
                        (list '* ffi:uint8)))))
    (lambda (pin lev)
      (let ((pin (unwrap-pointer pin))
            (lev (unwrap-number "uint8_t")))
        ((force ~proc) pin lev)))))

;; void iopin_wrA(iopin_t *, double val);
(define-public iopin_wrA
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "iopin_wrA")
                        (list '* ffi:double)))))
    (lambda (arg0 val)
      (let ((arg0 (unwrap-pointer arg0))
            (val (unwrap-number val)))
        ((force ~proc) arg0 val)))))

;; typedef void (*pin_func_t)(pin_t *, int cmd, int arg);
(define-public *pin_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:void
        (lambda (arg0 cmd arg)
          (let ((arg0 (make-cdata pin_t* arg0)))
            (~proc arg0 cmd arg)))
        (list '* ffi:int ffi:int)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:void
                     ~fptr
                     (list '* ffi:int ffi:int))))
        (lambda (arg0 cmd arg)
          (let ((arg0 (unwrap-pointer arg0))
                (cmd (unwrap-number cmd))
                (arg (unwrap-number arg)))
            (~proc arg0 cmd arg)))))))
(define-public pin_func_t
  (name-ctype 'pin_func_t (cpointer *pin_func_t)))

;; typedef struct cpuint_reg {
;;   uint8_t CTRLA; /* Control A */
;;   uint8_t STATUS; /* Status */
;;   uint8_t LVL0PRI; /* Interrupt Level 0 Priority */
;;   uint8_t LVL1VEC; /* Interrupt Level 1 Priority Vector */
;; } cpuint_reg_t;
(define-public cpuint_reg_t
  (name-ctype
    'cpuint_reg_t
    (cstruct
      (list `(CTRLA ,(cbase 'uint8_t))
            `(STATUS ,(cbase 'uint8_t))
            `(LVL0PRI ,(cbase 'uint8_t))
            `(LVL1VEC ,(cbase 'uint8_t))))))
(define-public cpuint_reg_t*
  (name-ctype
    'cpuint_reg_t*
    (cpointer cpuint_reg_t)))
(define-public struct-cpuint_reg
  (name-ctype 'struct-cpuint_reg cpuint_reg_t))
(define-public struct-cpuint_reg*
  (name-ctype 'struct-cpuint_reg* cpuint_reg_t*))

;; typedef struct cpuint {
;;   struct mcu *mcu;
;;   uint16_t base_addr; /* base address */
;;   cpuint_reg_t *reg; /* pointer to registers */
;; } cpuint_t;
(define-public cpuint_t
  (name-ctype
    'cpuint_t
    (cstruct
      (list `(mcu ,(cpointer 'void))
            `(base_addr ,(cbase 'uint16_t))
            `(reg ,cpuint_reg_t*)))))
(define-public cpuint_t*
  (name-ctype 'cpuint_t* (cpointer cpuint_t)))
(define-public struct-cpuint
  (name-ctype 'struct-cpuint cpuint_t))
(define-public struct-cpuint*
  (name-ctype 'struct-cpuint* cpuint_t*))

;; void cpuint_init(cpuint_t *, struct mcu *mcu, uint16_t addr);
(define-public cpuint_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpuint_init")
                        (list '* '* ffi:uint16)))))
    (lambda (arg0 mcu addr)
      (let ((arg0 (unwrap-pointer arg0))
            (mcu (unwrap-pointer mcu))
            (addr (unwrap-number "uint16_t")))
        ((force ~proc) arg0 mcu addr)))))

;; void cpuint_fini(cpuint_t *);
(define-public cpuint_fini
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpuint_fini")
                        (list '*)))))
    (lambda (arg0)
      (let ((arg0 (unwrap-pointer arg0)))
        ((force ~proc) arg0)))))

;; uint8_t cpuint_rd(cpuint_t *, int addr);
(define-public cpuint_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "cpuint_rd")
                        (list '* ffi:int)))))
    (lambda (arg0 addr)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr)))
        ((force ~proc) arg0 addr)))))

;; void cpuint_wr(cpuint_t *, int addr, uint8_t val);
(define-public cpuint_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cpuint_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (arg0 addr val)
      (let ((arg0 (unwrap-pointer arg0))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) arg0 addr val)))))

;; typedef struct mcu {
;;   cpu_t cpu; /* generic cpu */
;;   uint64_t irmsk; /* interrupts requested */
;;   uint64_t nimsk; /* non-maskable requested */
;;   char *device; /* device (e.g., \"mega4809\") */
;;   char *code; /* code (e.g., \"mcu1.hex\") */
;;   char *name; /* name (e.g., \"mcu1\") */
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
(define-public mcu_t
  (name-ctype
    'mcu_t
    (cstruct
      (list `(cpu ,cpu_t)
            `(irmsk ,(cbase 'uint64_t))
            `(nimsk ,(cbase 'uint64_t))
            `(device ,(cpointer (cbase 'char)))
            `(code ,(cpointer (cbase 'char)))
            `(name ,(cpointer (cbase 'char)))
            `(osc20m ,tkosc_t)
            `(osculp32k ,tkosc_t)
            `(xosc32k ,tkosc_t)
            `(clk_per ,tkclk_t)
            `(cpuint ,cpuint_t)
            `(_ ,(cstruct
                   (list `(rt ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       ffi:void
                                       (lambda (_mcu flags)
                                         (let () (~proc _mcu flags)))
                                       (list '* ffi:int)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    ffi:void
                                                    ~fptr
                                                    (list '* ffi:int))))
                                       (lambda (_mcu flags)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (flags (unwrap-number flags)))
                                           (~proc _mcu flags))))))))
                         `(rd ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       ffi:uint8
                                       (lambda (_mcu addr)
                                         (let ()
                                           ((lambda (~ret)
                                              (unwrap-number "uint8_t"))
                                            (~proc _mcu addr))))
                                       (list '* ffi:int)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    ffi:uint8
                                                    ~fptr
                                                    (list '* ffi:int))))
                                       (lambda (_mcu addr)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (addr (unwrap-number addr)))
                                           (~proc _mcu addr))))))))
                         `(wr ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       ffi:void
                                       (lambda (_mcu addr val)
                                         (let () (~proc _mcu addr val)))
                                       (list '* ffi:int ffi:uint8)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    ffi:void
                                                    ~fptr
                                                    (list '*
                                                          ffi:int
                                                          ffi:uint8))))
                                       (lambda (_mcu addr val)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (addr (unwrap-number addr))
                                               (val (unwrap-number "uint8_t")))
                                           (~proc _mcu addr val))))))))
                         `(bs ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       ffi:void
                                       (lambda (_mcu addr val msk)
                                         (let () (~proc _mcu addr val msk)))
                                       (list '* ffi:int ffi:uint8 ffi:uint8)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    ffi:void
                                                    ~fptr
                                                    (list '*
                                                          ffi:int
                                                          ffi:uint8
                                                          ffi:uint8))))
                                       (lambda (_mcu addr val msk)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (addr (unwrap-number addr))
                                               (val (unwrap-number "uint8_t"))
                                               (msk (unwrap-number "uint8_t")))
                                           (~proc _mcu addr val msk))))))))
                         `(ir ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       ffi:void
                                       (lambda (_mcu ivec)
                                         (let () (~proc _mcu ivec)))
                                       (list '* ffi:int)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    ffi:void
                                                    ~fptr
                                                    (list '* ffi:int))))
                                       (lambda (_mcu ivec)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (ivec (unwrap-number ivec)))
                                           (~proc _mcu ivec))))))))
                         `(ia ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       ffi:void
                                       (lambda (_mcu ivec)
                                         (let () (~proc _mcu ivec)))
                                       (list '* ffi:int)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    ffi:void
                                                    ~fptr
                                                    (list '* ffi:int))))
                                       (lambda (_mcu ivec)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (ivec (unwrap-number ivec)))
                                           (~proc _mcu ivec))))))))
                         `(pn ,(cpointer
                                 (cfunction
                                   (lambda (~proc)
                                     (ffi:procedure->pointer
                                       '*
                                       (lambda (_mcu name)
                                         (let ()
                                           ((lambda (~ret)
                                              (unwrap-pointer ~ret))
                                            (~proc _mcu name))))
                                       (list '* '*)))
                                   (lambda (~fptr)
                                     (let ((~proc (ffi:pointer->procedure
                                                    '*
                                                    ~fptr
                                                    (list '* '*))))
                                       (lambda (_mcu name)
                                         (let ((_mcu (unwrap-pointer _mcu))
                                               (name (unwrap-pointer name)))
                                           ((lambda (~ret)
                                              (make-cdata iopin_t* ~ret))
                                            (~proc _mcu name)))))))))
                         `(wdr ,(cpointer
                                  (cfunction
                                    (lambda (~proc)
                                      (ffi:procedure->pointer
                                        ffi:void
                                        (lambda (_mcu) (let () (~proc _mcu)))
                                        (list '*)))
                                    (lambda (~fptr)
                                      (let ((~proc (ffi:pointer->procedure
                                                     ffi:void
                                                     ~fptr
                                                     (list '*))))
                                        (lambda (_mcu)
                                          (let ((_mcu (unwrap-pointer _mcu)))
                                            (~proc _mcu)))))))))))
            `(_ ,(cstruct
                   (list `(rt_hook
                            ,(cpointer
                               (cfunction
                                 (lambda (~proc)
                                   (ffi:procedure->pointer
                                     ffi:void
                                     (lambda (_mcu flags)
                                       (let () (~proc _mcu flags)))
                                     (list '* ffi:int)))
                                 (lambda (~fptr)
                                   (let ((~proc (ffi:pointer->procedure
                                                  ffi:void
                                                  ~fptr
                                                  (list '* ffi:int))))
                                     (lambda (_mcu flags)
                                       (let ((_mcu (unwrap-pointer _mcu))
                                             (flags (unwrap-number flags)))
                                         (~proc _mcu flags))))))))
                         `(rd_hook
                            ,(cpointer
                               (cfunction
                                 (lambda (~proc)
                                   (ffi:procedure->pointer
                                     ffi:uint8
                                     (lambda (_mcu addr)
                                       (let ()
                                         ((lambda (~ret)
                                            (unwrap-number "uint8_t"))
                                          (~proc _mcu addr))))
                                     (list '* ffi:int)))
                                 (lambda (~fptr)
                                   (let ((~proc (ffi:pointer->procedure
                                                  ffi:uint8
                                                  ~fptr
                                                  (list '* ffi:int))))
                                     (lambda (_mcu addr)
                                       (let ((_mcu (unwrap-pointer _mcu))
                                             (addr (unwrap-number addr)))
                                         (~proc _mcu addr))))))))
                         `(wr_hook
                            ,(cpointer
                               (cfunction
                                 (lambda (~proc)
                                   (ffi:procedure->pointer
                                     ffi:void
                                     (lambda (_mcu addr val)
                                       (let () (~proc _mcu addr val)))
                                     (list '* ffi:int ffi:uint8)))
                                 (lambda (~fptr)
                                   (let ((~proc (ffi:pointer->procedure
                                                  ffi:void
                                                  ~fptr
                                                  (list '*
                                                        ffi:int
                                                        ffi:uint8))))
                                     (lambda (_mcu addr val)
                                       (let ((_mcu (unwrap-pointer _mcu))
                                             (addr (unwrap-number addr))
                                             (val (unwrap-number "uint8_t")))
                                         (~proc _mcu addr val))))))))
                         `(bs_hook
                            ,(cpointer
                               (cfunction
                                 (lambda (~proc)
                                   (ffi:procedure->pointer
                                     ffi:void
                                     (lambda (_mcu addr val msk)
                                       (let () (~proc _mcu addr val msk)))
                                     (list '* ffi:int ffi:uint8 ffi:uint8)))
                                 (lambda (~fptr)
                                   (let ((~proc (ffi:pointer->procedure
                                                  ffi:void
                                                  ~fptr
                                                  (list '*
                                                        ffi:int
                                                        ffi:uint8
                                                        ffi:uint8))))
                                     (lambda (_mcu addr val msk)
                                       (let ((_mcu (unwrap-pointer _mcu))
                                             (addr (unwrap-number addr))
                                             (val (unwrap-number "uint8_t"))
                                             (msk (unwrap-number "uint8_t")))
                                         (~proc _mcu addr val msk))))))))
                         `(ir_hook
                            ,(cpointer
                               (cfunction
                                 (lambda (~proc)
                                   (ffi:procedure->pointer
                                     ffi:void
                                     (lambda (_mcu ivec)
                                       (let () (~proc _mcu ivec)))
                                     (list '* ffi:int)))
                                 (lambda (~fptr)
                                   (let ((~proc (ffi:pointer->procedure
                                                  ffi:void
                                                  ~fptr
                                                  (list '* ffi:int))))
                                     (lambda (_mcu ivec)
                                       (let ((_mcu (unwrap-pointer _mcu))
                                             (ivec (unwrap-number ivec)))
                                         (~proc _mcu ivec))))))))
                         `(ia_hook
                            ,(cpointer
                               (cfunction
                                 (lambda (~proc)
                                   (ffi:procedure->pointer
                                     ffi:void
                                     (lambda (_mcu ivec)
                                       (let () (~proc _mcu ivec)))
                                     (list '* ffi:int)))
                                 (lambda (~fptr)
                                   (let ((~proc (ffi:pointer->procedure
                                                  ffi:void
                                                  ~fptr
                                                  (list '* ffi:int))))
                                     (lambda (_mcu ivec)
                                       (let ((_mcu (unwrap-pointer _mcu))
                                             (ivec (unwrap-number ivec)))
                                         (~proc _mcu ivec)))))))))))))))
(define-public mcu_t*
  (name-ctype 'mcu_t* (cpointer mcu_t)))
(define-public struct-mcu
  (name-ctype 'struct-mcu mcu_t))
(define-public struct-mcu*
  (name-ctype 'struct-mcu* mcu_t*))

;; typedef mcu_t *(*mcu_gen_t)(tmsch_t *);
(define-public *mcu_gen_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        '*
        (lambda (arg0)
          (let ((arg0 (make-cdata tmsch_t* arg0)))
            ((lambda (~ret) (unwrap-pointer ~ret))
             (~proc arg0))))
        (list '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure '* ~fptr (list '*))))
        (lambda (arg0)
          (let ((arg0 (unwrap-pointer arg0)))
            ((lambda (~ret) (make-cdata mcu_t* ~ret))
             (~proc arg0))))))))
(define-public mcu_gen_t
  (name-ctype 'mcu_gen_t (cpointer *mcu_gen_t)))

;; uint8_t def_rd(void *_mcu, int addr);
(define-public def_rd
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint8
                        (foreign-pointer-search "def_rd")
                        (list '* ffi:int)))))
    (lambda (_mcu addr)
      (let ((_mcu (unwrap-pointer _mcu))
            (addr (unwrap-number addr)))
        ((force ~proc) _mcu addr)))))

;; void def_wr(void *_mcu, int addr, uint8_t val);
(define-public def_wr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "def_wr")
                        (list '* ffi:int ffi:uint8)))))
    (lambda (_mcu addr val)
      (let ((_mcu (unwrap-pointer _mcu))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t")))
        ((force ~proc) _mcu addr val)))))

;; void def_bs(void *_mcu, int addr, uint8_t val, uint8_t msk);
(define-public def_bs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "def_bs")
                        (list '* ffi:int ffi:uint8 ffi:uint8)))))
    (lambda (_mcu addr val msk)
      (let ((_mcu (unwrap-pointer _mcu))
            (addr (unwrap-number addr))
            (val (unwrap-number "uint8_t"))
            (msk (unwrap-number "uint8_t")))
        ((force ~proc) _mcu addr val msk)))))

;; void def_ir(void *_mcu, int ivec);
(define-public def_ir
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "def_ir")
                        (list '* ffi:int)))))
    (lambda (_mcu ivec)
      (let ((_mcu (unwrap-pointer _mcu))
            (ivec (unwrap-number ivec)))
        ((force ~proc) _mcu ivec)))))

;; void def_ia(void *_mcu, int ivec);
(define-public def_ia
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "def_ia")
                        (list '* ffi:int)))))
    (lambda (_mcu ivec)
      (let ((_mcu (unwrap-pointer _mcu))
            (ivec (unwrap-number ivec)))
        ((force ~proc) _mcu ivec)))))

;; void def_rt(void *_mcu, int flags);
(define-public def_rt
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "def_rt")
                        (list '* ffi:int)))))
    (lambda (_mcu flags)
      (let ((_mcu (unwrap-pointer _mcu))
            (flags (unwrap-number flags)))
        ((force ~proc) _mcu flags)))))

;; int mcu_next_ivec(mcu_t *mcu);
(define-public mcu_next_ivec
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "mcu_next_ivec")
                        (list '*)))))
    (lambda (mcu)
      (let ((mcu (unwrap-pointer mcu)))
        ((force ~proc) mcu)))))

;; void mcu_req_intr(mcu_t *mcu, int iv);
(define-public mcu_req_intr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mcu_req_intr")
                        (list '* ffi:int)))))
    (lambda (mcu iv)
      (let ((mcu (unwrap-pointer mcu))
            (iv (unwrap-number iv)))
        ((force ~proc) mcu iv)))))

;; void mcu_ack_intr(mcu_t *mcu, int iv);
(define-public mcu_ack_intr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "mcu_ack_intr")
                        (list '* ffi:int)))))
    (lambda (mcu iv)
      (let ((mcu (unwrap-pointer mcu))
            (iv (unwrap-number iv)))
        ((force ~proc) mcu iv)))))

;; uint32_t mcu_clr_iv(mcu_t *mcu, uint32_t iv);
(define-public mcu_clr_iv
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:uint32
                        (foreign-pointer-search "mcu_clr_iv")
                        (list '* ffi:uint32)))))
    (lambda (mcu iv)
      (let ((mcu (unwrap-pointer mcu))
            (iv (unwrap-number "uint32_t")))
        ((force ~proc) mcu iv)))))

;; void log_tick(void *arg, tkosc_t *osc);
(define-public log_tick
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "log_tick")
                        (list '* '*)))))
    (lambda (arg osc)
      (let ((arg (unwrap-pointer arg))
            (osc (unwrap-pointer osc)))
        ((force ~proc) arg osc)))))

;; void log_intr(void *arg, int ivec, tkosc_t *osc);
(define-public log_intr
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "log_intr")
                        (list '* ffi:int '*)))))
    (lambda (arg ivec osc)
      (let ((arg (unwrap-pointer arg))
            (ivec (unwrap-number ivec))
            (osc (unwrap-pointer osc)))
        ((force ~proc) arg ivec osc)))))

;; int iprint(int lev, char *fmt, ...);
(define-public iprint
  (lambda (lev fmt . ~rest)
    (let ((~proc (ffi:pointer->procedure
                   ffi:int
                   (foreign-pointer-search "iprint")
                   (cons* ffi:int '* (map car ~rest))))
          (lev (unwrap-number lev))
          (fmt (unwrap-pointer fmt)))
      (apply ~proc lev fmt (map cdr ~rest)))))

;; typedef enum {
;;   TWI_OP_NONE,
;;   TWI_OP_SCL_LO,
;;   TWI_OP_SCL_HI,
;;   TWI_OP_SDA_LO,
;;   TWI_OP_SDA_HI,
;; } twi_bus_op_t;
(define-public twi_bus_op_t
  (name-ctype
    'twi_bus_op_t
    (cenum '((TWI_OP_NONE 0)
             (TWI_OP_SCL_LO 1)
             (TWI_OP_SCL_HI 2)
             (TWI_OP_SDA_LO 3)
             (TWI_OP_SDA_HI 4)))))
(define-public unwrap-twi_bus_op_t
  (let ((vald (cenum-vald (ctype-info twi_bus_op_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-twi_bus_op_t
  (let ((symd (cenum-symd (ctype-info twi_bus_op_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   TWI_EV_NONE,
;;   TWI_EV_SCL_LO,
;;   TWI_EV_SCL_HI,
;;   TWI_EV_SDA_LO,
;;   TWI_EV_SDA_HI,
;;   TWI_EV_BOTH_LO,
;;   TWI_EV_BOTH_HI,
;; } twi_bus_ev_t;
(define-public twi_bus_ev_t
  (name-ctype
    'twi_bus_ev_t
    (cenum '((TWI_EV_NONE 0)
             (TWI_EV_SCL_LO 1)
             (TWI_EV_SCL_HI 2)
             (TWI_EV_SDA_LO 3)
             (TWI_EV_SDA_HI 4)
             (TWI_EV_BOTH_LO 5)
             (TWI_EV_BOTH_HI 6)))))
(define-public unwrap-twi_bus_ev_t
  (let ((vald (cenum-vald (ctype-info twi_bus_ev_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-twi_bus_ev_t
  (let ((symd (cenum-symd (ctype-info twi_bus_ev_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef enum {
;;   TWI_LS_HI,
;;   TWI_LS_LO,
;;   TWI_LS_RS,
;;   TWI_LS_FL,
;; } twi_linst_t;
(define-public twi_linst_t
  (name-ctype
    'twi_linst_t
    (cenum '((TWI_LS_HI 0)
             (TWI_LS_LO 1)
             (TWI_LS_RS 2)
             (TWI_LS_FL 3)))))
(define-public unwrap-twi_linst_t
  (let ((vald (cenum-vald (ctype-info twi_linst_t))))
    (lambda (arg) (or (assq-ref vald arg) arg))))
(define-public wrap-twi_linst_t
  (let ((symd (cenum-symd (ctype-info twi_linst_t))))
    (lambda (arg) (or (assq-ref symd arg) arg))))

;; typedef struct twi_node {
;;   struct twi_bus *bus;
;;   void (*bus_changed)(struct twi_node *, twi_linst_t scl, twi_linst_t sda);
;; } twi_node_t;
(define-public twi_node_t
  (name-ctype
    'twi_node_t
    (cstruct
      (list `(bus ,(cpointer 'void))
            `(bus_changed
               ,(cpointer
                  (cfunction
                    (lambda (~proc)
                      (ffi:procedure->pointer
                        ffi:void
                        (lambda (arg0 scl sda)
                          (let ((scl (wrap-twi_linst_t scl))
                                (sda (wrap-twi_linst_t sda)))
                            (~proc arg0 scl sda)))
                        (list '* ffi:int ffi:int)))
                    (lambda (~fptr)
                      (let ((~proc (ffi:pointer->procedure
                                     ffi:void
                                     ~fptr
                                     (list '* ffi:int ffi:int))))
                        (lambda (arg0 scl sda)
                          (let ((arg0 (unwrap-pointer arg0))
                                (scl (unwrap~enum scl))
                                (sda (unwrap~enum sda)))
                            (~proc arg0 scl sda))))))))))))
(define-public twi_node_t*
  (name-ctype 'twi_node_t* (cpointer twi_node_t)))
(define-public struct-twi_node
  (name-ctype 'struct-twi_node twi_node_t))
(define-public struct-twi_node*
  (name-ctype 'struct-twi_node* twi_node_t*))

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
(define-public twi_bus_t
  (name-ctype
    'twi_bus_t
    (cstruct
      (list `(scl_t_rise_ns ,(cbase 'int))
            `(scl_t_fall_ns ,(cbase 'int))
            `(sda_t_rise_ns ,(cbase 'int))
            `(sda_t_fall_ns ,(cbase 'int))
            `(sch ,tmsch_t*)
            `(nnode ,(cbase 'int))
            `(nodes ,(carray (cpointer struct-twi_node) 64))
            `(nd_scl ,(cbase 'uint64_t))
            `(nd_sda ,(cbase 'uint64_t))
            `(scl ,twi_linst_t)
            `(sda ,twi_linst_t)
            `(scl_evt ,tmevt_t*)
            `(sda_evt ,tmevt_t*)))))
(define-public twi_bus_t*
  (name-ctype 'twi_bus_t* (cpointer twi_bus_t)))
(define-public struct-twi_bus
  (name-ctype 'struct-twi_bus twi_bus_t))
(define-public struct-twi_bus*
  (name-ctype 'struct-twi_bus* twi_bus_t*))

;; void twi_bus_init(twi_bus_t *bus);
(define-public twi_bus_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "twi_bus_init")
                        (list '*)))))
    (lambda (bus)
      (let ((bus (unwrap-pointer bus)))
        ((force ~proc) bus)))))

;; int twi_bus_add_node(twi_bus_t *bus, twi_node_t *node);
(define-public twi_bus_add_node
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "twi_bus_add_node")
                        (list '* '*)))))
    (lambda (bus node)
      (let ((bus (unwrap-pointer bus))
            (node (unwrap-pointer node)))
        ((force ~proc) bus node)))))

;; int twi_bus_action(twi_bus_t *bus, uint8_t id, twi_bus_op_t op);
(define-public twi_bus_action
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "twi_bus_action")
                        (list '* ffi:uint8 ffi:int)))))
    (lambda (bus id op)
      (let ((bus (unwrap-pointer bus))
            (id (unwrap-number "uint8_t"))
            (op (unwrap~enum op)))
        ((force ~proc) bus id op)))))

;; void twi_node_init(twi_node_t *bus);
(define-public twi_node_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "twi_node_init")
                        (list '*)))))
    (lambda (bus)
      (let ((bus (unwrap-pointer bus)))
        ((force ~proc) bus)))))

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
    (NANOSEC . 1000000000)
    (HOOKS_ENABLED . 1)))

(define ffi-octbx-symbol-val
  (lambda (k)
    (or (assq-ref ffi-octbx-symbol-tab k))))
(export ffi-octbx-symbol-val)

(define (unwrap~enum arg)
  (cond ((number? arg) arg)
        ((symbol? arg) (ffi-octbx-symbol-val arg))
        ((cdata? arg) (cdata-ref arg))
        (else (error "type mismatch"))))

(define ffi-octbx-types
  '((struct . "hook_link") (pointer . "hooks_t") "hooks_t" (pointer struct . 
    "simtime") (struct . "simtime") (pointer . "simtime_t") "simtime_t" 
    (pointer . "tmevt_rout_t") "tmevt_rout_t" (pointer struct . "tmevt") 
    (struct . "tmevt") (pointer . "tmevt_t") "tmevt_t" (pointer struct . 
    "tmsch") (struct . "tmsch") (pointer . "tmsch_t") "tmsch_t" (pointer . 
    "tkevt_rout_t") "tkevt_rout_t" (pointer struct . "tkevt") (struct . 
    "tkevt") (pointer . "tkevt_t") "tkevt_t" (pointer struct . "tkosc") 
    (struct . "tkosc") (pointer . "tkosc_t") "tkosc_t" (pointer struct . 
    "tkclk") (struct . "tkclk") (pointer . "tkclk_t") "tkclk_t" "cpu_vers_t" 
    (pointer struct . "brkpt") (struct . "brkpt") (pointer . "brkpt_t") 
    "brkpt_t" (pointer struct . "updval") (struct . "updval") (pointer . 
    "updval_t") "updval_t" (pointer struct . "asmline") (struct . "asmline") 
    (pointer . "asmline_t") "asmline_t" (pointer struct . "update") (struct . 
    "update") (pointer . "update_t") "update_t" (pointer struct . "cpu") 
    (struct . "cpu") (pointer . "cpu_t") "cpu_t" "insn_rout_t" "pin_type_t" 
    "iopin_notify_t" "pin_bus_op_t" "pinop_t" "pinarg_t" "pindir_t" "pinlev_t"
    "pinisc_t" (pointer struct . "iopin") (struct . "iopin") (pointer . 
    "iopin_t") "iopin_t" (pointer struct . "pin") (struct . "pin") (pointer . 
    "pin_t") "pin_t" "pin_func_t" (pointer struct . "cpuint_reg") (struct . 
    "cpuint_reg") (pointer . "cpuint_reg_t") "cpuint_reg_t" (pointer struct . 
    "cpuint") (struct . "cpuint") (pointer . "cpuint_t") "cpuint_t" (pointer 
    struct . "mcu") (struct . "mcu") (pointer . "mcu_t") "mcu_t" "mcu_gen_t" 
    "twi_bus_op_t" "twi_bus_ev_t" "twi_linst_t" (pointer struct . "twi_node") 
    (struct . "twi_node") (pointer . "twi_node_t") "twi_node_t" (pointer 
    struct . "twi_bus") (struct . "twi_bus") (pointer . "twi_bus_t") 
    "twi_bus_t"))
(export ffi-octbx-types)

;; --- last line ---
