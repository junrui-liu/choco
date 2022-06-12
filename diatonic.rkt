#lang rosette

; Diatonic theory in the diatonic universe
; WARNING: not actively maintained

(require "theory.rkt")
(require "synthesize.rkt")
(require "rules.rkt")
(require "parameters.rkt")
(require "utils.rkt")

; Ideally one should generate these from a scale universe + tradic structure
(define I (triad 1 3 5))
(define ii (triad 2 4 6))
(define iii (triad 3 5 7))
(define IV (triad 4 6 1))
(define V (triad 5 7 2))
(define vi (triad 6 1 3))
(define vii° (triad 7 2 4))
(define triads-root-pos (list I ii iii IV V vi vii°))

(define symbol-chord (make-hash (association-list
  "I" I
  "ii" ii
  "iii" iii
  "IV" IV
  "V" V
  "vi" vi
  "vii°" vii°)))
; generate all first- and second inversions
(for ([symb (hash-keys symbol-chord)])
  (define c (hash-ref symbol-chord symb))
  (for ([triad (list triad^6 triad^64)]
        [inv-symb (list "^6" "^64")])
    (hash-set!
      symbol-chord
      (string-append symb inv-symb)
      (apply triad (chord-pcs c)))))

(define chord-symbol (make-hash (map swap (hash->list symbol-chord))))

; Custom formatter
(define (chord->string chord)
  (if (concrete? chord)
    (hash-ref chord-symbol chord (lambda () "!"))
    "?"))

(define (pc->string pc)
  (if (concrete? pc)
    (integer->char
      (+ (char->integer #\A)
        (modulo (+ 2 (- pc (*note-offset*))) (*octave-size*))))
    "?"))

; (define (pc->string pc)
  ; (if (concrete? pc) pc "?"))


(define (reg->string reg)
  (if (concrete? reg) reg "?"))

(define format-piece (format-piece-gen chord->string pc->string reg->string))

; Set theory parameters
; 7 notes in a diatonic scale
(*octave-size* 7)
; scale starts from degree 1
(*note-offset* 1)
; fifth is the distance between degree 1 and 5
(*fifth-size* 4)
(*note-lb* 1)
(*note-ub* 21)
(*tonic* 1)
(*leading-tone* 7)
(*available-chords* (hash-values symbol-chord))
(*rules*
  (map ((curry hash-ref) rules) (list
    "harmony"
    "voices-sorted"
    "correct-inversion"
    "no-crossing"
    ; "no-parallel"
    "no-lt-doubling"
    "no-5th-doubling"
    "lt-resolves"
    ; "no-jump"
    )))

(define (complete-sketch p)
  (complete-sketch* p))

(define (c symb)
  (hash-ref symbol-chord symb))

; choose from specified inversions of a chord
(define ((c-inv inversions) symb)
  (match-let ([(chord pcs _) (hash-ref symbol-chord symb)])
    (choose-chord* (map (lambda (k) (chord pcs k)) inversions))))

; choose from all inversions of a chord
(define c* (c-inv '(0 1 2)))

(define P*
  (let ([len 10])
  (piece
    (voice* len)
    (voice* len)
    (voice* len)
    (voice* len)
    ; (progression (list I (hash-ref symbol-chord "V^64"))))))
    (progression (list
      ; descending 5-6
      I
      (c "vi^6")
      ii
      (c "vii°^6")
      iii
      (c "I^6")
      IV
      (c "ii^6")
      V
      I)))))

(display (format-piece P*))
(define model (complete-sketch P*))
; (displayln (vc))
(if model
  (begin
    ; (displayln model)
    (display (format-piece (evaluate P* model))))
  (displayln "unsat"))
