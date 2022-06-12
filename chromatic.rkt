#lang rosette

; diatonic theory in the chromatic universe

(require racket/file)
(require "theory.rkt")
(require "synthesize.rkt")
(require "rules.rkt")
(require "parameters.rkt")
(require "utils.rkt")
(require "distance.rkt")
(require "distance-chromatic.rkt")

; Set theory parameters
; 7 notes in a diatonic scale
(*octave-size* 12)
; scale starts from degree 1
(*note-offset* 1)
(*C4* 13)
; fifth is the distance between degree 1 and 5
(*fifth-size* 7)
(*note-lb* 1)
(*note-ub* (* (*octave-size*) 3))
(*tonic* 1)
(*leading-tone* 12)

; Ideally one should generate these from a scale universe + tradic structure
(define I (major 1))
(define ii (minor 3))
(define iii (minor 5))
(define IV (major 6))
(define V (major 8))
(define vi (minor 10))
(define vii° (diminished 12))
(define (root-pos*) (choose-chord* triads-root-pos))

(define symbol-chord (make-hash (association-list
  "I" I
  "ii" ii
  "iii" iii
  "IV" IV
  "V" V
  "vi" vi
  "vii o" vii°
  )))

(define triads-root-pos (hash-values symbol-chord))

; generate all first- and second inversions
(for ([symb (hash-keys symbol-chord)])
  (define c (hash-ref symbol-chord symb))
  (for ([triad (list triad^6 triad^64)]
        [inv-symb (list "^6" "^64")])
    (hash-set!
      symbol-chord
      (string-append symb inv-symb)
      (apply triad (chord-pcs c)))))

(define triads-all (hash-values symbol-chord))

(define chord-symbol (make-hash (map swap (hash->list symbol-chord))))

; Custom formatter
(define (chord->string chord)
  (if (concrete? chord)
    (hash-ref chord-symbol chord (lambda () "!"))
    "?"))

(define (lily/pc->string pc)
  (if (concrete? pc)
    (list-ref
      (list "c" "cis" "d" "dis" "e" "f" "fis" "g" "gis" "a" "ais" "b" )
      (modulo (- pc (*note-offset*)) (*octave-size*)))
    "?"))

(define (lily/note->reg note)
  (define r
    (add1 (floor (/ (- note (*C4*)) (*octave-size*)))))
  (if (= r 0)
    ""
    (apply string-append (make-list (abs r) (if (> r 0) "'" ",")))))

(define (lily/note->string note)
  (if (concrete? note)
    (let ([pc (note->pc note)])
      (format "~a~a" (lily/pc->string pc) (lily/note->reg note)))
    "?"))

(define (pc->string pc)
  (if (concrete? pc)
    (list-ref
      (list "c" "c#" "d" "d#" "e" "f" "f#" "g" "g#" "a" "a#" "b")
      (modulo (- pc (*note-offset*)) (*octave-size*)))
    "?"))

(define (reg->string reg)
  (if (concrete? reg) reg "?"))


(define (lily/chord->string c)
  (if (concrete? c)
    (begin
      (define (inv->string inv)
        (match inv
          [0 ""]
          [1 "6"]
          [2 "6 4"]))
      (match-let*
        ([(chord pcs inv) c]
        [c-rp (chord pcs 0)])
        (format "~a ~a" (hash-ref chord-symbol c-rp) (inv->string inv))))
    "?"))


(define (note->string note )
  (format "~a.~a/~a" (reg->string (note->reg note)) (pc->string (note->pc note)) note))
(define format-piece (format-piece-gen chord->string note->string))
(define lily/format-piece (format-piece-gen lily/chord->string lily/note->string))

(*available-chords* (hash-values symbol-chord))

(*rules*
  (list
    "harmony"
    "voices-sorted"
    "correct-inversion"
    "no-crossing"
    "no-parallel"
    "no-lt-doubling"
    "no-5th-doubling"
    "lt-resolves"
    "no-jump"
    "distinct"
    "PAC"
    ))

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

(define len 3)
(define P*
  (piece
    (voice* len)
    (voice* len)
    (voice* len)
    (voice* len)
    (progression (list I (chord*) I))))
;     ; (progression (list I (hash-ref symbol-chord "V^64"))))))
;     (progression (list
;       ; descending 5-6
;       I
;       (c "ii^6")
;       ; (c "vi^6")
;       ; ii
;       ; (c "vii°^6")
;       ; iii
;       ; (c "I^6")
;       ; IV
;       ; (c "ii^6")
;       V
;       I)))))

; (define P*
;   (let ([len 4])
;     (piece
;     (voice (map (lambda (n) (+ n (* 1 (*octave-size*)))) '(10 12 13 15)))
;     (voice* len)
;     (voice* len)
;     (voice* len)
;     (progression (list (root-pos*) (root-pos*) (root-pos*) (root-pos*))))))

(display (format-piece P*))
(define cost
  ; piece/vl-cost)
  (piece/cost-chordal dist/fifth^))
  ; (piece/cost-chordal dist/fifth)
(define cost-lb (sub1 len))
(define cost-ub (sub1 (* 2 (sub1 len))))

(printf "Cost bound: [~a, ~a]\n" cost-lb cost-ub)
(assert (<= cost-lb (cost P*) cost-ub) "cost bound too tight")

(define (run-once)
  (define model (complete-sketch* P*))
  ; (displayln (vc))
  (define P #f)
  (if model
    (begin
      ; (displayln model)
      (set! P (evaluate P* model))
      (display (format-piece P))
      (display (lily/format-piece P))
      (printf "Cost: ~a\n" (cost P))
      P)
    (and (displayln "UNSAT") #f)))

(define (lily/write P i)
  (for ([filename (list "./template-midi.ly" "./template.ly")]
        [outfile (list
          (format "./out-midi-~a.ly" i)
          (format "out-score-~a.ly" i))])
    (define lily/template (file->string filename))
    (define (r from to s)
      (regexp-replace from s to))
    (define (lily/voice->string v)
      (string-join (map lily/note->string (voice-notes v)) " "))
    (define (lily/progression->string p)
      (apply string-append
        (for/list ([c (progression-chords p)])
          (format "\\\\markup \\\\rN { ~a }\n" (lily/chord->string c)))))
    (define lily/outstr
      (match-let
        ([(piece s a t b p) P])
        (r #rx"%{S%}" (lily/voice->string s)
        (r #rx"%{A%}" (lily/voice->string a)
        (r #rx"%{T%}" (lily/voice->string t)
        (r #rx"%{B%}" (lily/voice->string b)
        (r #rx"%{C%}" (lily/progression->string p)
        lily/template)))))))

  (with-output-to-file outfile
      (lambda () (printf "~a" lily/outstr)))))

(define (run-n n i)
  (unless (>= i n)
    (define P (run-once))
    (lily/write P i)
    (negate-progression! (piece-progression P*) (piece-progression P))
    (run-n n (add1 i))))

(run-n 1 0)



; (expand-distance "dist/vl^" dist/vl chord->string triads-root-pos)
; (expand-distance "dist/fifth^" dist/fifth chord->string triads-root-pos)
; (expand-distance "dist/vl+fifth^" (dist/sum dist/vl dist/fifth) chord->string  triads-root-pos)
