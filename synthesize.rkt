#lang rosette

(require rosette/lib/angelic)
(require "parameters.rkt")
(require "theory.rkt")
(require "utils.rkt")
(require "rules.rkt")

(provide (all-defined-out))

; symbolic note
(define (note*)
  (define-symbolic* x integer?)
  (assert (&& (>= x (*note-lb*)) (<= x (*note-ub*))))
  x)

; symbolic chord chosen from a list of available chords
(define (choose-chord* available-chords)
  (apply choose* available-chords))

(define (negate-progression! p-symbolic p-concrete)
  (assert
    (for/disjoin ([c-symbolic (progression-chords p-symbolic)]
                  [c-concrete (progression-chords p-concrete)])
      (not (equal? (chord-pcs c-symbolic) (chord-pcs c-concrete))))))

; symbolic chord (chosen from the parameter list)
(define (chord*)
  (choose-chord* (*available-chords*)))

; symbolic voice line of length n
(define (voice* n)
  (voice (for/list ([_ (in-range n)]) (note*))))

; symbolic chord progression of length n
(define (progression* n)
  (progression (for/list ([_ (in-range n)]) (chord*))))

(define inc (solve+))
(define inc? #f)
(define (solve*)
  (if inc?
    (inc (vc-asserts (vc)))
    (solve #t)))

; complete a sketch (i.e. a symbolic piece)
(define (complete-sketch* p)
  (define initial-time (current-milliseconds))
  (assert
    (for/conjoin ([v (piece/voices p)])
      (= (length (voice-notes v)) (length (piece/chords p))))
    "unequal lengths")
  (for ([rule-name (*rules*)])
    (define rule (hash-ref rules rule-name))
    (assert (rule p) (format "rule ~a\n" rule-name)))
  (define running-time (- (current-milliseconds) initial-time))
  (printf "Symbolic evaluation: ~ams\n" running-time)
  (match-let-values
    ([((list model) overhead-time solving-time _)
      ; usually we don't care about the global minimum
        ; (time-apply (lambda () (optimize #:minimize (list (cost p)) #:guarantee #t)) null)
        (time-apply solve* null)])
    (printf "Constraint solving: ~ams\n" (- solving-time overhead-time))
    (displayln (if model "SAT" "UNSAT"))
    (and (sat? model) model)))