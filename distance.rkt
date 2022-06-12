#lang rosette

(require "parameters.rkt")
(require "theory.rkt")
(require "utils.rkt")

(provide (all-defined-out))

; voice-leading work between chords c1 & c2
; useful for neo-Riemannian analysis
(define (triad/dist/vl c1 c2)
  (apply min
    (for/list ([pcs2-perm (in-permutations (chord-pcs c2))])
      (apply +
        (for/list ([n1 (chord-pcs c1)] [n2 pcs2-perm])
          (min
            (abs (modulo (- n1 n2) (*octave-size*)))
            (abs (modulo (- n2 n1) (*octave-size*)))))))))

; circle-of-fifth distance between chords c1 & c2 (treated as keys)
(define (triad/dist/fifth c1 c2)
  (match-let (
     ; convert to relative major if necessary
     [b1 (car (chord-pcs (triad/?->M c1)))]
     [b2 (car (chord-pcs (triad/?->M c2)))]
     ; bi-directional search in both ascending and descending directions
     [ascend (lambda (n) (note->pc (+ n (*fifth-size*))))]
     [descend (lambda (n) (note->pc (- n (*fifth-size*))))]
     )
    (min
      (step-count b1 b2 ascend)
      (step-count b1 b2 descend)
      )))


(define (triad/dist/fifth-naive c1 c2)
  (match-let (
     [b1 (chord/root c1)]
     [b2 (chord/root c2)]
     ; bi-directional search in both ascending and descending directions
     [ascend (lambda (n) (note->pc (+ n (*fifth-size*))))]
     [descend (lambda (n) (note->pc (- n (*fifth-size*))))])
    (min
      (step-count b1 b2 ascend)
      (step-count b1 b2 descend))))

(define ((dist/compose f) d1 d2)
  (lambda (c1 c2) (f (d1 c1 c2) (d2 c1 c2))))

(define dist/sum (dist/compose (lambda (x y) (+ x y))))
(define dist/min (dist/compose (lambda (x y) (min x y))))
(define dist/avg (dist/compose (lambda (x y) (ceiling (/ (+ x y) 2)))))

; Pre-compute all pair distances and generate racket code
; Should probably pre-compute to a list representation and 
; wrap it in a macro instead
(define (expand-distance name dist chord->string available)
  (define (chord->repr c)
    (match-let ([(chord pcs _) c])
      (format "(list ~a)"
        (string-join (map (lambda (n) (format "~a" n)) pcs) " "))))
  (printf "(define (~a c1 c2)\n" name)
  (printf "  (define pcs1 (chord-pcs (?->triad c1)))\n")
  (printf "  (define pcs2 (chord-pcs (?->triad c2)))\n")
  (printf "  (cond\n")
    (for* ([c1 available] [c2 available])
      (define t1 (?->triad c1))
      (define t2 (?->triad c2))
      (printf "    [(and (equal? pcs1 ~a) (equal? pcs2 ~a)) ~a]\t; ~a, ~a\n"
        (chord->repr t1)
        (chord->repr t2)
        (dist t1 t2)
        ; comment with chord symbols
        (chord->string c1)
        (chord->string c2)))
      (printf "    [#t (assert #f \"distance ~a undefined\")]" name)
  (printf "~a" "))\n\n"))

; given a chordal distance function, return the cost of a piece
(define ((piece/cost-chordal chordal-dist) p)
  (define sl (piece->slices p))
  (apply +
    (for/list ([s1 sl] [s2 (cdr sl)])
      (chordal-dist (slice-chord s1) (slice-chord s2)))))

; voice-leading work between two slices
(define (slices/vl-cost sl1 sl2)
  (apply +
    (for/list ([n1 (drop-right (slice/voices sl1) 1)]
               [n2 (drop-right (slice/voices sl2) 1)])
      (abs (- n2 n1)))))
      


; voice-leading work of a piece
(define (piece/vl-cost p)
  (define slices (piece->slices p))
  (apply +
    (for/list ([sl1 slices] [sl2 (cdr slices)])
      (slices/vl-cost sl1 sl2))))