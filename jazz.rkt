#lang rosette

; diatonic theory in the chromatic universe

(require racket/file)
(require "theory.rkt")
(require "synthesize.rkt")
(require "rules.rkt")
(require "parameters.rkt")
(require "utils.rkt")
(require "distance.rkt")
(require "distance-jazz.rkt")

; Set theory parameters
; 7 notes in a diatonic scale
(*octave-size* 12)
; scale starts from degree 1
(*note-offset* 1)
(*C4* 13)
; fifth is the distance between degree 1 and 5
(*fifth-size* 7)
(*fourth-size* (- (*octave-size*) (*fifth-size*)))
; (*note-lb* (- (*fifth-size*)))
(*note-lb* 1)
(*note-ub* (add1 (* (*octave-size*) 2)))
(*tonic* 1)
(*leading-tone* 12)


; Ideally one should generate these from a scale universe + tradic structure
(define I (fake-major 1))
(define V/IV (seventh/dom 1))

(define bII (fake-major 2))

(define ii (fake-minor 3))
(define V/V (seventh/dom 3))

(define bIII (fake-major 4))

(define iii (fake-minor 5))
(define V/vi (seventh/dom 5))

(define IV (fake-major 6))
(define iv (fake-minor 6))

(define V (fake-major 8))

(define bVI (fake-major 9))

(define vi (fake-minor 10))
(define V/ii (seventh/dom 10))

(define bVII (fake-major 11))

(define vii° (seventh/dim 12))
(define V/iii (seventh/dom 12))

(define symbol-chord (make-hash (association-list
  "I" I
  "V/IV" V/IV
  "ii" ii
  "V/V" V/V
  "iii" iii
  "V/vi" V/vi
  "IV" IV
  "iv" iv
  "V" V
  "bVI" bVI
  "vi" vi
  "V/ii" V/ii
  "bVII" bVII
  "vii o" vii°
  )))

(define chords-root-pos (hash-values symbol-chord))
(define (root-pos*) (choose-chord* chords-root-pos))

; generate all first- and second inversions
(for ([symb (hash-keys symbol-chord)])
  (define c (hash-ref symbol-chord symb))
  (for ([invert (list seventh^65 seventh^64 seventh^42)]
        [inv-symb (list "^65" "^64" "^42")])
        ; [inv-symb (list "^6")])
    (hash-set!
      symbol-chord
      (string-append symb inv-symb)
      (apply invert (chord-pcs c)))))

(define chords-all (hash-values symbol-chord))

(define chord-symbol (make-hash (map swap (hash->list symbol-chord))))

; Custom formatter
(define (chord->string chord)
  (if (concrete? chord)
    (hash-ref chord-symbol chord (lambda () "!"))
    "?"))
(*chord->string* chord->string)

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
          [0 "7"]
          [1 "6 5"]
          [2 "6 4"]
          [3 "4 2"]))
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
; (printf "Available: ~a\n" (*available-chords*))

(*rules*
  (list
    ; "harmony"
    "voices-sorted"
    ; "correct-inversion"
    "no-crossing"
    ; "no-parallel"
    ; "no-lt-doubling"
    ; "no-5th-doubling"
    ; "no-7th-doubling"
    ; "lt-resolves"
    ; "dominant-resolves"
    ; "no-jump"
    ; "distinct"
    "distinct-voices"
    "spaced"
    ; "PAC"
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

(define (tonic*)
  (define n (note*))
  (assert (~= n (*tonic*)))
  n)
(define (note-I*)
  (define n (note*))
  (assert (for/disjoin ([m (chord-pcs (?->triad I))])
    (~= n m)))
  n)

(define (voice*/~= ns)
  (voice (for/list ([n ns])
    (define m (note*))
    (assert (~= m n))
    m)))

(define len 8)
(define P*
  (piece
    (voice (map (lambda (n) (+ n (* 1 (*octave-size*)))) (list
      5 5 6 8 
      8 6 5 3
      ; 1 1 3 5
      ; 5 3 3
      )))
    (voice* len)
    (voice* len)
    (voice* len)
    (progression (list
      I        (chord*) (chord*) (chord*)
       (chord*) (chord*) (chord*) V
      ; (chord*) (chord*) (chord*) (chord*)
      ; (chord*) (chord*) V
      ))))

; (define len 2)
; (define P*
;   (piece
;     (voice* len)
;     (voice* len)
;     (voice* len)
;     (voice* len)
;     (progression (list V/V V))))


(define costs (hash
    "chordal/fifth" (piece/cost-chordal jazz/dist/fifth^)
    "chordal/vl" (piece/cost-chordal jazz/dist/vl^)
    "chordal/sum" (piece/cost-chordal jazz/dist/sum^)
    "chordal/min" (piece/cost-chordal jazz/dist/min^)
    "chordal/avg" (piece/cost-chordal jazz/dist/avg^)
    "vl" piece/vl-cost))

(define (assert-cost P* m)
  (define costs-config
    (hash
      ; "chordal/fifth"
      ;   (cons 1 (ceiling (* m (* 4 (sub1 len)))))
      ; "chordal/vl"
      ;   (cons (sub1 len) (sub1 (* 3 (sub1 len))))
      ; "chordal/vl+fifth"
      ;   (cons (sub1 len) (sub1 (* 6 (sub1 len))))
      ; "vl"
      ;   (cons 1 (ceiling (* m (* 8 (sub1 len)))))
        ))

  (for ([(cost-name ub-lb) (in-hash costs-config)])
    (match-let
      ([cost (hash-ref costs cost-name)]
      [(cons lb ub) ub-lb])
      (printf "Cost: ~a, bound: [~a, ~a]\n" cost-name lb ub)
      (assert (<= lb (cost P*) ub) "cost bound too tight"))))

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


(define (run-once P*)
  (define model (complete-sketch* P*))
  ; (displayln (vc))
  (define P #f)
  (if model
    (begin
      ; (displayln model)
      (set! P (evaluate P* model))
      (display (format-piece P))
      (display (lily/format-piece P))
      (for ([cost-name (hash-keys costs)])
        (match-let
          ([cost (hash-ref costs cost-name)])
          (printf "Cost: ~a = ~a\n" cost-name (cost P))))
      (cons P model))
    (and (displayln "UNSAT") #f)))

(define (run-once-divide P*)
  (match-let ([(cons P1* P2*) (piece/halves P*)])
  (assert-cost P1* 0.5)
  (define P1-model-pair (run-once P1*))
  (define P1 (car P1-model-pair))
  (define P1-model (cdr P1-model-pair))
  (define P1+P2*
    (slices->piece (append (piece->slices P1) (piece->slices P2*))))
  ; (display (format-piece P1+P2*))
  (assert-cost P1+P2* 1)
  (let ([res (with-vc (begin
          (for/conjoin ([x (symbolics P1*)])
            (define v (evaluate x P1-model))
            (assert (equal? x v) "previous model"))
          (car (run-once P1+P2*))))])
    (if (normal? res) (result-value res)
      #f))))

(define (piece/halves P)
  (define l (ceiling (/ (length (piece->slices P)) 2)))
  (cons
    (slices->piece (take (piece->slices P) l))
    (slices->piece (drop (piece->slices P) l))))

  
(define (run-n P* n i #:write-lily? [write-lily? #t])
  (define P (run-once-divide P*))
  (if (not P)
    (run-n P* n i)
    (begin
    
  (when write-lily? (lily/write P i))
  (unless (>= i (- n 1))
    (match-let
      ([(cons P1* P2*) (piece/halves P*)]
       [(cons P1 P2) (piece/halves P)])
    ; (clear-vc!)
    (negate-progression! (piece-progression P*) (piece-progression P))
    ; (negate-progression! (piece-progression P1*) (piece-progression P1))
    ; (negate-progression! (piece-progression P2*) (piece-progression P2))
    (run-n P* n (add1 i)))))))

(run-n P* 1 0)
; (run-once-divide P*)


; (printf "#lang rosette\n\n(require \"theory.rkt\")\n(require \"distance.rkt\")\n(provide (all-defined-out))\n\n")
; (expand-distance "jazz/dist/vl^" triad/dist/vl chord->string chords-root-pos)
; (expand-distance "jazz/dist/fifth^" triad/dist/fifth-naive chord->string chords-root-pos)
; (expand-distance "jazz/dist/sum^" (dist/sum triad/dist/vl triad/dist/fifth-naive) chord->string chords-root-pos)
; (expand-distance "jazz/dist/min^" (dist/min triad/dist/vl triad/dist/fifth-naive) chord->string chords-root-pos)
; (expand-distance "jazz/dist/avg^" (dist/avg triad/dist/vl triad/dist/fifth-naive) chord->string chords-root-pos)
