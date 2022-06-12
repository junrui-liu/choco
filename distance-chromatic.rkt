#lang rosette

(require "theory.rkt")
(require "distance.rkt")

(provide (all-defined-out))

(define (triad/dist/vl^ c1 c2)
  (cond
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 10 1 5))) 5]	; vii o, vi
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 1 5 8))) 5]	; vii o, I
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 3 6 10))) 2]	; vii o, ii
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 8 12 3))) 2]	; vii o, V
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 5 8 12))) 4]	; vii o, iii
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 6 10 1))) 4]	; vii o, IV
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 12 3 6))) 5]	; vi, vii o
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 1 5 8))) 2]	; vi, I
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 3 6 10))) 3]	; vi, ii
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 8 12 3))) 5]	; vi, V
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 5 8 12))) 3]	; vi, iii
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 6 10 1))) 1]	; vi, IV
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 12 3 6))) 5]	; I, vii o
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 10 1 5))) 2]	; I, vi
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 1 5 8))) 0]	; I, I
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 3 6 10))) 5]	; I, ii
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 8 12 3))) 3]	; I, V
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 5 8 12))) 1]	; I, iii
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 6 10 1))) 3]	; I, IV
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 12 3 6))) 2]	; ii, vii o
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 10 1 5))) 3]	; ii, vi
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 1 5 8))) 5]	; ii, I
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 8 12 3))) 4]	; ii, V
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 5 8 12))) 6]	; ii, iii
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 6 10 1))) 2]	; ii, IV
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 12 3 6))) 2]	; V, vii o
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 10 1 5))) 5]	; V, vi
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 1 5 8))) 3]	; V, I
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 3 6 10))) 4]	; V, ii
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 8 12 3))) 0]	; V, V
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 5 8 12))) 2]	; V, iii
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 6 10 1))) 6]	; V, IV
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 12 3 6))) 4]	; iii, vii o
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 10 1 5))) 3]	; iii, vi
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 1 5 8))) 1]	; iii, I
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 3 6 10))) 6]	; iii, ii
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 8 12 3))) 2]	; iii, V
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 6 10 1))) 4]	; iii, IV
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 12 3 6))) 4]	; IV, vii o
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 10 1 5))) 1]	; IV, vi
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 1 5 8))) 3]	; IV, I
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 3 6 10))) 2]	; IV, ii
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 8 12 3))) 6]	; IV, V
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 5 8 12))) 4]	; IV, iii
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 6 10 1))) 0]	; IV, IV
))
(define (triad/dist/fifth^ c1 c2)
  (cond
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 10 1 5))) 5]	; vii o, vi
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 1 5 8))) 5]	; vii o, I
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 3 6 10))) 6]	; vii o, ii
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 8 12 3))) 4]	; vii o, V
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 5 8 12))) 4]	; vii o, iii
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 6 10 1))) 6]	; vii o, IV
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 12 3 6))) 5]	; vi, vii o
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 1 5 8))) 0]	; vi, I
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 3 6 10))) 1]	; vi, ii
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 8 12 3))) 1]	; vi, V
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 5 8 12))) 1]	; vi, iii
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 6 10 1))) 1]	; vi, IV
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 12 3 6))) 5]	; I, vii o
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 10 1 5))) 0]	; I, vi
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 1 5 8))) 0]	; I, I
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 3 6 10))) 1]	; I, ii
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 8 12 3))) 1]	; I, V
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 5 8 12))) 1]	; I, iii
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 6 10 1))) 1]	; I, IV
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 12 3 6))) 6]	; ii, vii o
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 10 1 5))) 1]	; ii, vi
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 1 5 8))) 1]	; ii, I
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 8 12 3))) 2]	; ii, V
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 5 8 12))) 2]	; ii, iii
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 6 10 1))) 0]	; ii, IV
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 12 3 6))) 4]	; V, vii o
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 10 1 5))) 1]	; V, vi
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 1 5 8))) 1]	; V, I
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 3 6 10))) 2]	; V, ii
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 8 12 3))) 0]	; V, V
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 5 8 12))) 0]	; V, iii
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 6 10 1))) 2]	; V, IV
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 12 3 6))) 4]	; iii, vii o
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 10 1 5))) 1]	; iii, vi
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 1 5 8))) 1]	; iii, I
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 3 6 10))) 2]	; iii, ii
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 8 12 3))) 0]	; iii, V
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 6 10 1))) 2]	; iii, IV
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 12 3 6))) 6]	; IV, vii o
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 10 1 5))) 1]	; IV, vi
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 1 5 8))) 1]	; IV, I
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 3 6 10))) 0]	; IV, ii
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 8 12 3))) 2]	; IV, V
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 5 8 12))) 2]	; IV, iii
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 6 10 1))) 0]	; IV, IV
))
(define (triad/dist/vl+fifth^ c1 c2)
  (cond
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 10 1 5))) 10]	; vii o, vi
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 1 5 8))) 10]	; vii o, I
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 3 6 10))) 8]	; vii o, ii
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 8 12 3))) 6]	; vii o, V
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 5 8 12))) 8]	; vii o, iii
    [(and (equal? c1 (list 12 3 6)) (equal? c2 (list 6 10 1))) 10]	; vii o, IV
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 12 3 6))) 10]	; vi, vii o
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 1 5 8))) 2]	; vi, I
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 3 6 10))) 4]	; vi, ii
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 8 12 3))) 6]	; vi, V
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 5 8 12))) 4]	; vi, iii
    [(and (equal? c1 (list 10 1 5)) (equal? c2 (list 6 10 1))) 2]	; vi, IV
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 12 3 6))) 10]	; I, vii o
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 10 1 5))) 2]	; I, vi
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 1 5 8))) 0]	; I, I
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 3 6 10))) 6]	; I, ii
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 8 12 3))) 4]	; I, V
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 5 8 12))) 2]	; I, iii
    [(and (equal? c1 (list 1 5 8)) (equal? c2 (list 6 10 1))) 4]	; I, IV
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 12 3 6))) 8]	; ii, vii o
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 10 1 5))) 4]	; ii, vi
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 1 5 8))) 6]	; ii, I
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 8 12 3))) 6]	; ii, V
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 5 8 12))) 8]	; ii, iii
    [(and (equal? c1 (list 3 6 10)) (equal? c2 (list 6 10 1))) 2]	; ii, IV
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 12 3 6))) 6]	; V, vii o
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 10 1 5))) 6]	; V, vi
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 1 5 8))) 4]	; V, I
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 3 6 10))) 6]	; V, ii
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 8 12 3))) 0]	; V, V
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 5 8 12))) 2]	; V, iii
    [(and (equal? c1 (list 8 12 3)) (equal? c2 (list 6 10 1))) 8]	; V, IV
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 12 3 6))) 8]	; iii, vii o
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 10 1 5))) 4]	; iii, vi
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 1 5 8))) 2]	; iii, I
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 3 6 10))) 8]	; iii, ii
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 8 12 3))) 2]	; iii, V
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? c1 (list 5 8 12)) (equal? c2 (list 6 10 1))) 6]	; iii, IV
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 12 3 6))) 10]	; IV, vii o
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 10 1 5))) 2]	; IV, vi
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 1 5 8))) 4]	; IV, I
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 3 6 10))) 2]	; IV, ii
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 8 12 3))) 8]	; IV, V
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 5 8 12))) 6]	; IV, iii
    [(and (equal? c1 (list 6 10 1)) (equal? c2 (list 6 10 1))) 0]	; IV, IV
))
