;; octsys.scm - avr simulator
;;
;; Copyright 2020-2023 Matthew Wette
;;
;; This library is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 2.1 of the License, or (at your option) any later version.

;; Issues:
;; 1) guile FFI does not return structs :(

(define-module (octsys)
  #:export (process-sysx-file
            make-sys sys? get-sys-clk 
            make-mcu mcu? get-mcu-cpu cpu-reset

            cpu-disp cpu-disp-regs cpu-disp-data
            cpu-add-brkpt cpu-rem-brkpt
            cpu-set-trace cpu-clr-trace
            make-raw-cpu cpu-set-pc cpu-get-pc cpu-show-insn
            
            dev-name dev-guts
            make-bus bus? bus-relevel bus-conn-to-pin)
  
  #:use-module (rnrs bytevectors)
  #:use-module (ffi octbx)
  #:use-module (ffi octsx)
  #:use-module (ffi runtime)
  #:use-module ((system foreign) #:prefix ffi:))

(define lbx (dynamic-link "liboctbx"))
(define lsx (dynamic-link "liboctsx"))


(define (sf fmt . args) (apply simple-format #t fmt args))
(use-modules (ice-9 format))
(define (ff fmt . args) (apply format #t fmt args))
(use-modules (ice-9 pretty-print))
(define (pp exp) (pretty-print exp))

;; to be placed

(define-public (echo obj) (display obj) (newline))
(define-public (echo-cpu obj)
  (let ((cpu (make-cpu_t* obj)))
    (sf "echo-cpu called\n")
    (cpu-disp cpu)
    (sf "---\n")))

(eval-when (expand load eval)
  (define (any->str s) (if (string? s) s (symbol->string (syntax->datum s))))
  (define (gen-str . al) (apply string-append (map any->str al)))
  (define (gen-id id . al)
    (datum->syntax id (string->symbol (apply gen-str al)))))

;; (expose-hook cpu-post-exec cpu_t*)
(define hook-tab (make-hash-table))
(define-syntax expose-hook
  (lambda (x)
    (define (c2s str) (string-map (lambda (c) (if (char=? c #\_) #\- c)) str))
    (define (s2c str) (string-map (lambda (c) (if (char=? c #\-) #\_ c)) str))
    (syntax-case x ()
      ((_ name arg) ;; arg is actually arg-type or param-type or pt
       (let* ((c-name (s2c (symbol->string (syntax->datum #'name)))))
         #`(begin
             (define-public #,(gen-id #'name "add-" #'name "-hook!")
               (let* ((n #,(gen-str "add_" c-name "_hook"))
                      (f (ffi:pointer->procedure
                          ffi:void (dynamic-func n lbx) (list '*))))
                 (lambda (proc)
                   (define (wrapped-proc obj) (proc ((fht-wrap arg) obj)))
                   (hash-set! hook-tab proc wrapped-proc)
                   (f (ffi:procedure->pointer
                       ffi:void wrapped-proc (list '*))))))
             (define-public #,(gen-id #'name "rem-" #'name "-hook!")
               (let* ((n #,(gen-str "rem_" c-name "_hook"))
                      (f (ffi:pointer->procedure
                          ffi:void (dynamic-func n lbx) (list '*))))
                 (lambda (proc)
                   (let ((wrapped-proc (hash-ref hook-tab proc)))
                     (when wrapped-proc
                       (f wrapped-proc)
                       (hash-remove! hook-tab proc))))))))))))
;; ^ example:
;;   (expose-hook cpu-intr cpu_t*)
;;   (define (demo cpu) (sf "got intr\n") (cpu-disp cpu))
;;   (add-cpu-intr-hook! demo)

(expose-hook cpu-intr cpu_t*)
(expose-hook cpu-reti cpu_t*)

;; tk-report tk_report


;; octsx

(define-public mcu-pin-byname mcu_pin_byname)

(define-public connect-nodes connect_nodes)

(define %sys (make-parameter #f))
(export %sys)

(define (make-sys . args)
  (let ((sys (make_sys 0 ffi:%null-pointer)))
    (unless (%sys) (%sys sys))
    sys))

(define get-sys-clk get_sys_clk)

;; octbx

(define (make-mcu sys dev code)
  (make_mcu (get-sys-clk sys) dev code))

;; get-mcu-cpu mcu => cpu
(define get-mcu-cpu get_mcu_cpu)

;; cpu-reset cpu [flags]
(define cpu-reset cpu_reset)

;; cpu-disp cpu
(define cpu-disp cpu_disp)

;; cpu-disp-data cpu addr
(define cpu-disp-data cpu_disp_data)

;; cpu-disp-regs cpu
(define cpu-disp-regs cpu_disp_regs)

;; cpu-add-brkpt cpu byte-addr
(define cpu-add-brkpt add_brkpt)

;; cpu-rem-brkpt cpu byte-addr
(define cpu-rem-brkpt rem_brkpt)

(define cpu-set-trace cpu_set_trace)
(define cpu-clr-trace cpu_clr_trace)

;;(define-public mcu-get-irmsk mcu_get_irmsk)
(define-public mcu-req-intr mcu_req_intr)
(define-public mcu-ack-intr mcu_ack_intr)
(define-public cpu-sei cpu_sei)
(define-public cpu-cli cpu_cli)

;; === hooks for extras

;; make-raw-cpu prog data
(define make-raw-cpu make_raw_cpu)

;; cpu-set-pc cpu pc
(define cpu-set-pc cpu_set_pc)

;; cpu-get-pc cpu
(define cpu-get-pc cpu_get_pc)

;; cpu-show-insn cpu pc (define cpu-show-insn cpu_show_insn)

(define (insn-wsize insn cpu)
  (insn_wsize insn (fh-object-ref cpu 'vers)))

(define* (cpu-insn-wsize cpu #:optional insn)
  (let ((insn (or insn (cpu_get_insn cpu))))
    (insn_wsize insn cpu)))
(export cpu-insn-wsize)

;; === system stuff

(define-public get-simtime              ; guile ffi does not return structs
  (lambda* (#:optional sys)
    (let ((t (make-simtime_t)))
      (get_simtime_tp (or sys (%sys)) (pointer-to t))
      t)))

(define-public sys-cont
  (lambda* (sys #:optional (cpu ffi:%null-pointer)) (sys_cont sys cpu)))
(define-public sys-cpu-next
  (lambda* (sys cpu #:optional (n 1)) (sys_cpu_next sys cpu n)))
(define-public sys-cpu-step
  (lambda* (sys cpu #:optional (n 1)) (sys_cpu_step sys cpu n)))

(define-public sys-run-ns sys_run_ns)
(define-public (sys-run-us sys us) (sys_run_ns sys (* 1000 us)))
(define-public (sys-run-ms sys us) (sys_run_ns sys (* 1000000 us)))
(define-public sys-run-sns sys_run_sns)
(define-public sys-run-sus sys_run_sus)
(define-public sys-run-sms sys_run_sms)
(define-public sys-run-dt sys_run_dt)

(define-public (sys-run sys val)
  (cond
   ((exact? val) (sys-run-sns sys val 0))
   ((inexact? val) (let* ((sr (truncate val))
                       (nr (truncate (* 1.0e9 (- val sr))))
                       (si (inexact->exact sr))
                       (ni (inexact->exact nr)))
                  (sys-run-sns sys si ni)))
   (else (error "sys-run: bad arg"))))
  
;; sys-run-to-cpu-word-addr sys cpu addr
(define-public sys-run-to-cpu-word-addr sys_run_to_cpu_addr)

;; use to get back to gdb
(define-public sys-dummy
  (let ((~f (ffi:pointer->procedure
             ffi:void (dynamic-func "sys_dummy" lsx) (list))))
    (lambda* () (~f))))
  

;; === octx processing =========================================================

(use-modules ((srfi srfi-1) #:select (fold)))
(use-modules (sxml simple))
(use-modules (sxml match))
(use-modules (sxml xpath))

(define (dev-name dev) (ffi:pointer->string (dev_name dev)))
(define dev-guts dev_guts)
(define sys? sys_t*?)
(define mcu? mcu_t*?)
(define bus? bus_t*?)

(define make-bus make_bus)
(define bus-relevel bus_relevel)
(define bus-conn-to-pin bus_conn_to_pin)
(export make-bus)


(define (dev-type dev)
  (cond
   ((mcu? dev) 'OCT_T_MCU)
   ((bus? dev) 'OCT_T_BUS)
   ;;((osc? dev) 'OCT_T_OSC)
   ;;((cir? dev) 'OCT_T_CIR)
   (else #f)))
(export dev-type)

(define* (dev-insert name ref #:optional sys)
  (let ((sy (or sys (%sys))) (ty (dev-type ref)))
    (dev_insert sy name ty ref)))
(export dev-insert)

(define* (dev-lookup name #:optional sys)
  (let* ((dev (dev_lookup_byname (or sys (%sys) name) name))
         (dev (if (eqv? ffi:%null-pointer (fh-object-ref dev)) #f dev))
         (guts (and dev (dev-guts dev))))
    (and dev
         (case (dev_type dev)
           ((0) dev)
           ((1) (make-mcu_t* guts))
           ((2) (make-bus_t* guts))
           ;;((3) (make-osc_t* guts))
           (else #f)))))
(export dev-lookup)

;; (dev-lookup/addr addr #:optional sys) ...)

(define (sx-attr. sx)
  (if (and (pair? (cdr sx)) (pair? (cadr sx)) (eqv? '@ (caadr sx)))
      (map (lambda (pair) (cons (car pair) (cadr pair))) (cdadr sx))
      '()))

(define* (process-sysx sysx #:key xdir)
  (define verbose #f)

  (define (export-mcu dev)
    (when verbose (sf "export-mcu\n"))
    (let* ((name (dev-name dev))
	   (guts (dev-guts dev))
	   (mod (resolve-module '(guile-user)))
	   (mcun (string->symbol name))
	   (mcuv (make-variable guts))
	   (cpun (string->symbol (string-append name ".cpu")))
	   (cpuv (make-variable (get-mcu-cpu guts))))
      (module-add! mod mcun mcuv)
      (module-add! mod cpun cpuv)
      guts))

  (define (nd-name-to-dev name)
    (when verbose (sf "nd-name-to-dev ~S\n" name))
    (fold
     (lambda (name dev)
       (when verbose (sf "  name=~S  dev=~S type=~S\n" name dev (dev_type dev)))
       (cond
	((sys? dev) (dev-lookup name))
	((mcu? dev) (mcu-pin-byname dev name))
	(else (error "should be resolved by now"))))
     (%sys) (string-split name #\.)) )
  
  (define (probe-spice elt ops)
    (when verbose (sf "probe-spice called\n"))
    (sxml-match elt
      ((spice (@ (name ,name)) . ,rest)
       (fold probe-spice ops rest))
      ((DAC (@ (name ,name) (Von ,Von) (Voff ,Voff)))
       (sf "todo: DAC\n") ops)
      ((meas (@ (name ,name)))
       (sf "todo: meas\n") ops)
      (,_ (sf "probe-spiced missed:\n") (pp elt) ops)))

  (define (probe-mcu elt ops)
    (when verbose (sf "probe-cpu\n"))
    ;; <mcu name="mcu0" device="mega4809" pinout="QFP48" vcc="5.0" code=""/>
    (let* ((ad (sx-attr. elt))
	   (name (assq-ref ad 'name))
	   (devn (assq-ref ad 'device))
	   (code (assq-ref ad 'code))
	   (path (if xdir (string-append xdir "/" code) code)))
      (cond
       ((and name devn code)
	(let* ((dev (dev-insert name (make-mcu (%sys) devn path)))
	       (mcu (dev-guts dev)))
	  (export-mcu dev)
	  ops))
       (else
	(sf "error probing mcu\n")
	ops))))

  (define (probe-bus elt ops)
    (when verbose (sf "probe-bus\n"))
    (let* ((ad (sx-attr. elt)) (name (assq-ref ad 'name)))
      (cond
       (name
	(let ((bus (make-bus (%sys))))
	  (dev-insert name bus)
	  (cons (lambda () (bus-relevel bus)) ops)))
       (else
	(sf "error probing bus\n")
	ops))))

  (define (probe-conn elt ops)
    (when verbose (sf "probe-conn\n"))
    (sxml-match elt
      ((conn (pin-cn (@ (name ,pn))) (bus-cn (@ (name ,bn))))
       (let ((bus (nd-name-to-dev bn)) (pin (nd-name-to-dev pn)))
	 ;;(sf "bus: ~S => ~S    pin: ~S => ~S\n" bn bus pn pin)
	 (unless (and bus pin) (error "bad spec"))
	 (bus-conn-to-pin bus pin)
	 ops))
      (,_ (sf "probe-conn missed:\n") (pp elt) ops)))

  ;; need to validate so don't go halfway and crash
  (define (validate-sys elt) #f)
  
  (define (probe-sys elt ops)
    (when verbose (sf "\nprobe-sys, ops=~S\n" ops) (pp elt))
    (sxml-match elt
      ((*TOP* . ,rest) (fold probe-sys ops rest))
      ((*PI* . ,rest) ops)
      ((octsys (@ . ,attr) . ,rest)
       (unless (%sys) (%sys (make-sys)))
       (fold probe-sys ops rest))
      ((mcu . ,rest) (probe-mcu elt ops))
      ((bus . ,rest) (probe-bus elt ops))
      ((spice . ,rest) (probe-spice elt ops))
      ;;((connect . ,rest) (probe-connect elt ops))
      ((conn . ,rest) (probe-conn elt ops))
      (,_ (sf "probe-sys missed:\n") (pp elt) (sf "I quit.\n") (quit))))

  (let ((post-ops (probe-sys sysx '())))
    (for-each (lambda (op) (op)) post-ops)
    (sys-run-sns (%sys) 0 0)))

(define-public (process-sysx-file file)
  (define (file->sxml file)
    (cond
     ((port? file) (xml->sxml file #:trim-whitespace? #t))
     ((string? file)
      (call-with-input-file file
	(lambda (port) (xml->sxml port #:trim-whitespace? #t))))
     (else
      (error "expecting port or filename"))))
      (process-sysx (file->sxml file) #:xdir (dirname file)))

;; --- last line ---

  
