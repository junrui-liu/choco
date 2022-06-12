#lang rosette

(require "theory.rkt")
(require "distance.rkt")
(provide (all-defined-out))

(define (jazz/dist/vl^ c1 c2)
  (define pcs1 (chord-pcs (?->triad c1)))
  (define pcs2 (chord-pcs (?->triad c2)))
  (cond
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 9 1 4))) 5]	; vii o, bVI
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 7 10))) 3]	; vii o, V/V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 9 1))) 5]	; vii o, iv
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, V/IV
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 9 12))) 5]	; vii o, V/vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 11 3 6))) 1]	; vii o, bVII
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 8 12 3))) 2]	; vii o, V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 1 5))) 5]	; vii o, vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, I
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 6 10))) 2]	; vii o, ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 2 5))) 4]	; vii o, V/ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 8 12))) 4]	; vii o, iii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 10 1))) 4]	; vii o, IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 12 3 6))) 5]	; bVI, vii o
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 9 1 4))) 0]	; bVI, bVI
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 7 10))) 6]	; bVI, V/V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 9 1))) 2]	; bVI, iv
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 2]	; bVI, V/IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 9 12))) 2]	; bVI, V/vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 11 3 6))) 6]	; bVI, bVII
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 8 12 3))) 3]	; bVI, V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 1 5))) 2]	; bVI, vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 2]	; bVI, I
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 6 10))) 5]	; bVI, ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 2 5))) 3]	; bVI, V/ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 8 12))) 3]	; bVI, iii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 10 1))) 3]	; bVI, IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 12 3 6))) 3]	; V/V, vii o
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 9 1 4))) 6]	; V/V, bVI
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 7 10))) 0]	; V/V, V/V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 9 1))) 4]	; V/V, iv
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 6]	; V/V, V/IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 9 12))) 6]	; V/V, V/vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 11 3 6))) 2]	; V/V, bVII
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 8 12 3))) 3]	; V/V, V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 1 5))) 4]	; V/V, vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 6]	; V/V, I
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 6 10))) 1]	; V/V, ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 2 5))) 3]	; V/V, V/ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 8 12))) 5]	; V/V, iii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 10 1))) 3]	; V/V, IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 12 3 6))) 5]	; iv, vii o
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 9 1 4))) 2]	; iv, bVI
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 7 10))) 4]	; iv, V/V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 9 1))) 0]	; iv, iv
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 2]	; iv, V/IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 9 12))) 2]	; iv, V/vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 11 3 6))) 4]	; iv, bVII
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 8 12 3))) 5]	; iv, V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 1 5))) 2]	; iv, vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 2]	; iv, I
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 6 10))) 3]	; iv, ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 2 5))) 3]	; iv, V/ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 8 12))) 3]	; iv, iii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 10 1))) 1]	; iv, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; V/IV, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 2]	; V/IV, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 6]	; V/IV, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 2]	; V/IV, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 2]	; V/IV, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 6]	; V/IV, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 3]	; V/IV, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 2]	; V/IV, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 5]	; V/IV, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; V/IV, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 1]	; V/IV, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 3]	; V/IV, IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 12 3 6))) 5]	; V/vi, vii o
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 9 1 4))) 2]	; V/vi, bVI
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 7 10))) 6]	; V/vi, V/V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 9 1))) 2]	; V/vi, iv
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 2]	; V/vi, V/IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 9 12))) 0]	; V/vi, V/vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 11 3 6))) 6]	; V/vi, bVII
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 8 12 3))) 3]	; V/vi, V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 1 5))) 2]	; V/vi, vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 2]	; V/vi, I
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 6 10))) 5]	; V/vi, ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 2 5))) 3]	; V/vi, V/ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 8 12))) 1]	; V/vi, iii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 10 1))) 3]	; V/vi, IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 12 3 6))) 1]	; bVII, vii o
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 9 1 4))) 6]	; bVII, bVI
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 7 10))) 2]	; bVII, V/V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 9 1))) 4]	; bVII, iv
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 6]	; bVII, V/IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 9 12))) 6]	; bVII, V/vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 11 3 6))) 0]	; bVII, bVII
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 8 12 3))) 3]	; bVII, V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 1 5))) 4]	; bVII, vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 6]	; bVII, I
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 6 10))) 1]	; bVII, ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 2 5))) 3]	; bVII, V/ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 8 12))) 5]	; bVII, iii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 10 1))) 3]	; bVII, IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 12 3 6))) 2]	; V, vii o
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 9 1 4))) 3]	; V, bVI
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 7 10))) 3]	; V, V/V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 9 1))) 5]	; V, iv
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 3]	; V, V/IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 9 12))) 3]	; V, V/vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 11 3 6))) 3]	; V, bVII
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 8 12 3))) 0]	; V, V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 1 5))) 5]	; V, vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 3]	; V, I
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 6 10))) 4]	; V, ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 2 5))) 6]	; V, V/ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 8 12))) 2]	; V, iii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 10 1))) 6]	; V, IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 12 3 6))) 5]	; vi, vii o
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 9 1 4))) 2]	; vi, bVI
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 7 10))) 4]	; vi, V/V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 9 1))) 2]	; vi, iv
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 2]	; vi, V/IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 9 12))) 2]	; vi, V/vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 11 3 6))) 4]	; vi, bVII
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 8 12 3))) 5]	; vi, V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 2]	; vi, I
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 6 10))) 3]	; vi, ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 2 5))) 1]	; vi, V/ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 8 12))) 3]	; vi, iii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 10 1))) 1]	; vi, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; I, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 2]	; I, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 6]	; I, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 2]	; I, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 2]	; I, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 6]	; I, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 3]	; I, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 2]	; I, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 5]	; I, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; I, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 1]	; I, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 3]	; I, IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 12 3 6))) 2]	; ii, vii o
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 9 1 4))) 5]	; ii, bVI
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 7 10))) 1]	; ii, V/V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 9 1))) 3]	; ii, iv
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 5]	; ii, V/IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 9 12))) 5]	; ii, V/vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 11 3 6))) 1]	; ii, bVII
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 8 12 3))) 4]	; ii, V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 1 5))) 3]	; ii, vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 5]	; ii, I
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 2 5))) 2]	; ii, V/ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 8 12))) 6]	; ii, iii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 10 1))) 2]	; ii, IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 12 3 6))) 4]	; V/ii, vii o
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 9 1 4))) 3]	; V/ii, bVI
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 7 10))) 3]	; V/ii, V/V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 9 1))) 3]	; V/ii, iv
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, V/IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 9 12))) 3]	; V/ii, V/vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 11 3 6))) 3]	; V/ii, bVII
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 8 12 3))) 6]	; V/ii, V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 1 5))) 1]	; V/ii, vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, I
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 6 10))) 2]	; V/ii, ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 2 5))) 0]	; V/ii, V/ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 8 12))) 4]	; V/ii, iii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 10 1))) 2]	; V/ii, IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 12 3 6))) 4]	; iii, vii o
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 9 1 4))) 3]	; iii, bVI
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 7 10))) 5]	; iii, V/V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 9 1))) 3]	; iii, iv
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 1]	; iii, V/IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 9 12))) 1]	; iii, V/vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 11 3 6))) 5]	; iii, bVII
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 8 12 3))) 2]	; iii, V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 1 5))) 3]	; iii, vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 1]	; iii, I
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 6 10))) 6]	; iii, ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 2 5))) 4]	; iii, V/ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 10 1))) 4]	; iii, IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 12 3 6))) 4]	; IV, vii o
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 9 1 4))) 3]	; IV, bVI
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 7 10))) 3]	; IV, V/V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 9 1))) 1]	; IV, iv
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 3]	; IV, V/IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 9 12))) 3]	; IV, V/vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 11 3 6))) 3]	; IV, bVII
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 8 12 3))) 6]	; IV, V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 1 5))) 1]	; IV, vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 3]	; IV, I
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 6 10))) 2]	; IV, ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 2 5))) 2]	; IV, V/ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 8 12))) 4]	; IV, iii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 10 1))) 0]	; IV, IV
    [#t (assert #f "distance jazz/dist/vl^ undefined")]))

(define (jazz/dist/fifth^ c1 c2)
  (define pcs1 (chord-pcs (?->triad c1)))
  (define pcs2 (chord-pcs (?->triad c2)))
  (cond
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 9 1 4))) 3]	; vii o, bVI
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 7 10))) 3]	; vii o, V/V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 9 1))) 6]	; vii o, iv
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, V/IV
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 9 12))) 1]	; vii o, V/vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 11 3 6))) 5]	; vii o, bVII
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 8 12 3))) 4]	; vii o, V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 1 5))) 2]	; vii o, vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, I
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 6 10))) 3]	; vii o, ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 2 5))) 2]	; vii o, V/ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 8 12))) 1]	; vii o, iii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 10 1))) 6]	; vii o, IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 12 3 6))) 3]	; bVI, vii o
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 9 1 4))) 0]	; bVI, bVI
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 7 10))) 6]	; bVI, V/V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 9 1))) 3]	; bVI, iv
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 4]	; bVI, V/IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 9 12))) 4]	; bVI, V/vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 11 3 6))) 2]	; bVI, bVII
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 8 12 3))) 5]	; bVI, V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 1 5))) 5]	; bVI, vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 4]	; bVI, I
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 6 10))) 6]	; bVI, ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 2 5))) 5]	; bVI, V/ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 8 12))) 4]	; bVI, iii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 10 1))) 3]	; bVI, IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 12 3 6))) 3]	; V/V, vii o
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 9 1 4))) 6]	; V/V, bVI
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 7 10))) 0]	; V/V, V/V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 9 1))) 3]	; V/V, iv
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 2]	; V/V, V/IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 9 12))) 2]	; V/V, V/vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 11 3 6))) 4]	; V/V, bVII
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 8 12 3))) 1]	; V/V, V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 1 5))) 1]	; V/V, vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 2]	; V/V, I
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 6 10))) 0]	; V/V, ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 2 5))) 1]	; V/V, V/ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 8 12))) 2]	; V/V, iii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 10 1))) 3]	; V/V, IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 12 3 6))) 6]	; iv, vii o
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 9 1 4))) 3]	; iv, bVI
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 7 10))) 3]	; iv, V/V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 9 1))) 0]	; iv, iv
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 1]	; iv, V/IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 9 12))) 5]	; iv, V/vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 11 3 6))) 1]	; iv, bVII
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 8 12 3))) 2]	; iv, V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 1 5))) 4]	; iv, vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 1]	; iv, I
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 6 10))) 3]	; iv, ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 2 5))) 4]	; iv, V/ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 8 12))) 5]	; iv, iii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 10 1))) 0]	; iv, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; V/IV, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 4]	; V/IV, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 2]	; V/IV, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 1]	; V/IV, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 4]	; V/IV, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 2]	; V/IV, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 1]	; V/IV, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 3]	; V/IV, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 2]	; V/IV, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; V/IV, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 4]	; V/IV, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 1]	; V/IV, IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 12 3 6))) 1]	; V/vi, vii o
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 9 1 4))) 4]	; V/vi, bVI
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 7 10))) 2]	; V/vi, V/V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 9 1))) 5]	; V/vi, iv
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 4]	; V/vi, V/IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 9 12))) 0]	; V/vi, V/vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 11 3 6))) 6]	; V/vi, bVII
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 8 12 3))) 3]	; V/vi, V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 1 5))) 1]	; V/vi, vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 4]	; V/vi, I
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 6 10))) 2]	; V/vi, ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 2 5))) 1]	; V/vi, V/ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 8 12))) 0]	; V/vi, iii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 10 1))) 5]	; V/vi, IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 12 3 6))) 5]	; bVII, vii o
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 9 1 4))) 2]	; bVII, bVI
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 7 10))) 4]	; bVII, V/V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 9 1))) 1]	; bVII, iv
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 2]	; bVII, V/IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 9 12))) 6]	; bVII, V/vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 11 3 6))) 0]	; bVII, bVII
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 8 12 3))) 3]	; bVII, V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 1 5))) 5]	; bVII, vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 2]	; bVII, I
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 6 10))) 4]	; bVII, ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 2 5))) 5]	; bVII, V/ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 8 12))) 6]	; bVII, iii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 10 1))) 1]	; bVII, IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 12 3 6))) 4]	; V, vii o
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 9 1 4))) 5]	; V, bVI
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 7 10))) 1]	; V, V/V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 9 1))) 2]	; V, iv
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 1]	; V, V/IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 9 12))) 3]	; V, V/vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 11 3 6))) 3]	; V, bVII
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 8 12 3))) 0]	; V, V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 1 5))) 2]	; V, vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 1]	; V, I
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 6 10))) 1]	; V, ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 2 5))) 2]	; V, V/ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 8 12))) 3]	; V, iii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 10 1))) 2]	; V, IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 12 3 6))) 2]	; vi, vii o
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 9 1 4))) 5]	; vi, bVI
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 7 10))) 1]	; vi, V/V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 9 1))) 4]	; vi, iv
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 3]	; vi, V/IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 9 12))) 1]	; vi, V/vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 11 3 6))) 5]	; vi, bVII
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 8 12 3))) 2]	; vi, V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 3]	; vi, I
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 6 10))) 1]	; vi, ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 2 5))) 0]	; vi, V/ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 8 12))) 1]	; vi, iii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 10 1))) 4]	; vi, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; I, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 4]	; I, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 2]	; I, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 1]	; I, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 4]	; I, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 2]	; I, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 1]	; I, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 3]	; I, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 2]	; I, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; I, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 4]	; I, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 1]	; I, IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 12 3 6))) 3]	; ii, vii o
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 9 1 4))) 6]	; ii, bVI
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 7 10))) 0]	; ii, V/V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 9 1))) 3]	; ii, iv
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 2]	; ii, V/IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 9 12))) 2]	; ii, V/vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 11 3 6))) 4]	; ii, bVII
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 8 12 3))) 1]	; ii, V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 1 5))) 1]	; ii, vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 2]	; ii, I
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 2 5))) 1]	; ii, V/ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 8 12))) 2]	; ii, iii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 10 1))) 3]	; ii, IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 12 3 6))) 2]	; V/ii, vii o
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 9 1 4))) 5]	; V/ii, bVI
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 7 10))) 1]	; V/ii, V/V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 9 1))) 4]	; V/ii, iv
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, V/IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 9 12))) 1]	; V/ii, V/vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 11 3 6))) 5]	; V/ii, bVII
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 8 12 3))) 2]	; V/ii, V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 1 5))) 0]	; V/ii, vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, I
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 6 10))) 1]	; V/ii, ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 2 5))) 0]	; V/ii, V/ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 8 12))) 1]	; V/ii, iii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 10 1))) 4]	; V/ii, IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 12 3 6))) 1]	; iii, vii o
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 9 1 4))) 4]	; iii, bVI
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 7 10))) 2]	; iii, V/V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 9 1))) 5]	; iii, iv
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 4]	; iii, V/IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 9 12))) 0]	; iii, V/vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 11 3 6))) 6]	; iii, bVII
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 8 12 3))) 3]	; iii, V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 1 5))) 1]	; iii, vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 4]	; iii, I
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 6 10))) 2]	; iii, ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 2 5))) 1]	; iii, V/ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 10 1))) 5]	; iii, IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 12 3 6))) 6]	; IV, vii o
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 9 1 4))) 3]	; IV, bVI
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 7 10))) 3]	; IV, V/V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 9 1))) 0]	; IV, iv
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 1]	; IV, V/IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 9 12))) 5]	; IV, V/vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 11 3 6))) 1]	; IV, bVII
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 8 12 3))) 2]	; IV, V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 1 5))) 4]	; IV, vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 1]	; IV, I
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 6 10))) 3]	; IV, ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 2 5))) 4]	; IV, V/ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 8 12))) 5]	; IV, iii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 10 1))) 0]	; IV, IV
    [#t (assert #f "distance jazz/dist/fifth^ undefined")]))

(define (jazz/dist/sum^ c1 c2)
  (define pcs1 (chord-pcs (?->triad c1)))
  (define pcs2 (chord-pcs (?->triad c2)))
  (cond
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 9 1 4))) 8]	; vii o, bVI
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 7 10))) 6]	; vii o, V/V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 9 1))) 11]	; vii o, iv
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 10]	; vii o, V/IV
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 9 12))) 6]	; vii o, V/vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 11 3 6))) 6]	; vii o, bVII
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 8 12 3))) 6]	; vii o, V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 1 5))) 7]	; vii o, vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 10]	; vii o, I
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 6 10))) 5]	; vii o, ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 2 5))) 6]	; vii o, V/ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 8 12))) 5]	; vii o, iii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 10 1))) 10]	; vii o, IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 12 3 6))) 8]	; bVI, vii o
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 9 1 4))) 0]	; bVI, bVI
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 7 10))) 12]	; bVI, V/V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 9 1))) 5]	; bVI, iv
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 6]	; bVI, V/IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 9 12))) 6]	; bVI, V/vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 11 3 6))) 8]	; bVI, bVII
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 8 12 3))) 8]	; bVI, V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 1 5))) 7]	; bVI, vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 6]	; bVI, I
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 6 10))) 11]	; bVI, ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 2 5))) 8]	; bVI, V/ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 8 12))) 7]	; bVI, iii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 10 1))) 6]	; bVI, IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 12 3 6))) 6]	; V/V, vii o
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 9 1 4))) 12]	; V/V, bVI
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 7 10))) 0]	; V/V, V/V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 9 1))) 7]	; V/V, iv
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 8]	; V/V, V/IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 9 12))) 8]	; V/V, V/vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 11 3 6))) 6]	; V/V, bVII
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 8 12 3))) 4]	; V/V, V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 1 5))) 5]	; V/V, vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 8]	; V/V, I
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 6 10))) 1]	; V/V, ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 2 5))) 4]	; V/V, V/ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 8 12))) 7]	; V/V, iii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 10 1))) 6]	; V/V, IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 12 3 6))) 11]	; iv, vii o
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 9 1 4))) 5]	; iv, bVI
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 7 10))) 7]	; iv, V/V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 9 1))) 0]	; iv, iv
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 3]	; iv, V/IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 9 12))) 7]	; iv, V/vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 11 3 6))) 5]	; iv, bVII
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 8 12 3))) 7]	; iv, V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 1 5))) 6]	; iv, vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 3]	; iv, I
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 6 10))) 6]	; iv, ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 2 5))) 7]	; iv, V/ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 8 12))) 8]	; iv, iii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 10 1))) 1]	; iv, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 10]	; V/IV, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 6]	; V/IV, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 8]	; V/IV, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 3]	; V/IV, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 6]	; V/IV, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 8]	; V/IV, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 4]	; V/IV, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 5]	; V/IV, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 7]	; V/IV, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 6]	; V/IV, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 5]	; V/IV, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 4]	; V/IV, IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 12 3 6))) 6]	; V/vi, vii o
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 9 1 4))) 6]	; V/vi, bVI
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 7 10))) 8]	; V/vi, V/V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 9 1))) 7]	; V/vi, iv
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 6]	; V/vi, V/IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 9 12))) 0]	; V/vi, V/vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 11 3 6))) 12]	; V/vi, bVII
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 8 12 3))) 6]	; V/vi, V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 1 5))) 3]	; V/vi, vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 6]	; V/vi, I
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 6 10))) 7]	; V/vi, ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 2 5))) 4]	; V/vi, V/ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 8 12))) 1]	; V/vi, iii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 10 1))) 8]	; V/vi, IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 12 3 6))) 6]	; bVII, vii o
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 9 1 4))) 8]	; bVII, bVI
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 7 10))) 6]	; bVII, V/V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 9 1))) 5]	; bVII, iv
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 8]	; bVII, V/IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 9 12))) 12]	; bVII, V/vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 11 3 6))) 0]	; bVII, bVII
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 8 12 3))) 6]	; bVII, V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 1 5))) 9]	; bVII, vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 8]	; bVII, I
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 6 10))) 5]	; bVII, ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 2 5))) 8]	; bVII, V/ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 8 12))) 11]	; bVII, iii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 10 1))) 4]	; bVII, IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 12 3 6))) 6]	; V, vii o
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 9 1 4))) 8]	; V, bVI
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 7 10))) 4]	; V, V/V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 9 1))) 7]	; V, iv
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 4]	; V, V/IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 9 12))) 6]	; V, V/vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 11 3 6))) 6]	; V, bVII
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 8 12 3))) 0]	; V, V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 1 5))) 7]	; V, vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 4]	; V, I
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 6 10))) 5]	; V, ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 2 5))) 8]	; V, V/ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 8 12))) 5]	; V, iii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 10 1))) 8]	; V, IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 12 3 6))) 7]	; vi, vii o
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 9 1 4))) 7]	; vi, bVI
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 7 10))) 5]	; vi, V/V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 9 1))) 6]	; vi, iv
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 5]	; vi, V/IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 9 12))) 3]	; vi, V/vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 11 3 6))) 9]	; vi, bVII
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 8 12 3))) 7]	; vi, V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 5]	; vi, I
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 6 10))) 4]	; vi, ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 2 5))) 1]	; vi, V/ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 8 12))) 4]	; vi, iii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 10 1))) 5]	; vi, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 10]	; I, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 6]	; I, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 8]	; I, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 3]	; I, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 6]	; I, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 8]	; I, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 4]	; I, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 5]	; I, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 7]	; I, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 6]	; I, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 5]	; I, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 4]	; I, IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 12 3 6))) 5]	; ii, vii o
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 9 1 4))) 11]	; ii, bVI
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 7 10))) 1]	; ii, V/V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 9 1))) 6]	; ii, iv
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 7]	; ii, V/IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 9 12))) 7]	; ii, V/vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 11 3 6))) 5]	; ii, bVII
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 8 12 3))) 5]	; ii, V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 1 5))) 4]	; ii, vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 7]	; ii, I
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 2 5))) 3]	; ii, V/ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 8 12))) 8]	; ii, iii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 10 1))) 5]	; ii, IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 12 3 6))) 6]	; V/ii, vii o
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 9 1 4))) 8]	; V/ii, bVI
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 7 10))) 4]	; V/ii, V/V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 9 1))) 7]	; V/ii, iv
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 6]	; V/ii, V/IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 9 12))) 4]	; V/ii, V/vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 11 3 6))) 8]	; V/ii, bVII
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 8 12 3))) 8]	; V/ii, V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 1 5))) 1]	; V/ii, vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 6]	; V/ii, I
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 6 10))) 3]	; V/ii, ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 2 5))) 0]	; V/ii, V/ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 8 12))) 5]	; V/ii, iii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 10 1))) 6]	; V/ii, IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 12 3 6))) 5]	; iii, vii o
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 9 1 4))) 7]	; iii, bVI
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 7 10))) 7]	; iii, V/V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 9 1))) 8]	; iii, iv
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 5]	; iii, V/IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 9 12))) 1]	; iii, V/vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 11 3 6))) 11]	; iii, bVII
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 8 12 3))) 5]	; iii, V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 1 5))) 4]	; iii, vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 5]	; iii, I
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 6 10))) 8]	; iii, ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 2 5))) 5]	; iii, V/ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 10 1))) 9]	; iii, IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 12 3 6))) 10]	; IV, vii o
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 9 1 4))) 6]	; IV, bVI
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 7 10))) 6]	; IV, V/V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 9 1))) 1]	; IV, iv
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 4]	; IV, V/IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 9 12))) 8]	; IV, V/vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 11 3 6))) 4]	; IV, bVII
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 8 12 3))) 8]	; IV, V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 1 5))) 5]	; IV, vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 4]	; IV, I
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 6 10))) 5]	; IV, ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 2 5))) 6]	; IV, V/ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 8 12))) 9]	; IV, iii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 10 1))) 0]	; IV, IV
    [#t (assert #f "distance jazz/dist/sum^ undefined")]))

(define (jazz/dist/min^ c1 c2)
  (define pcs1 (chord-pcs (?->triad c1)))
  (define pcs2 (chord-pcs (?->triad c2)))
  (cond
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 9 1 4))) 3]	; vii o, bVI
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 7 10))) 3]	; vii o, V/V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 9 1))) 5]	; vii o, iv
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, V/IV
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 9 12))) 1]	; vii o, V/vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 11 3 6))) 1]	; vii o, bVII
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 8 12 3))) 2]	; vii o, V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 1 5))) 2]	; vii o, vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, I
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 6 10))) 2]	; vii o, ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 2 5))) 2]	; vii o, V/ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 8 12))) 1]	; vii o, iii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 10 1))) 4]	; vii o, IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 12 3 6))) 3]	; bVI, vii o
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 9 1 4))) 0]	; bVI, bVI
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 7 10))) 6]	; bVI, V/V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 9 1))) 2]	; bVI, iv
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 2]	; bVI, V/IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 9 12))) 2]	; bVI, V/vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 11 3 6))) 2]	; bVI, bVII
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 8 12 3))) 3]	; bVI, V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 1 5))) 2]	; bVI, vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 2]	; bVI, I
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 6 10))) 5]	; bVI, ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 2 5))) 3]	; bVI, V/ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 8 12))) 3]	; bVI, iii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 10 1))) 3]	; bVI, IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 12 3 6))) 3]	; V/V, vii o
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 9 1 4))) 6]	; V/V, bVI
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 7 10))) 0]	; V/V, V/V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 9 1))) 3]	; V/V, iv
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 2]	; V/V, V/IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 9 12))) 2]	; V/V, V/vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 11 3 6))) 2]	; V/V, bVII
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 8 12 3))) 1]	; V/V, V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 1 5))) 1]	; V/V, vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 2]	; V/V, I
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 6 10))) 0]	; V/V, ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 2 5))) 1]	; V/V, V/ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 8 12))) 2]	; V/V, iii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 10 1))) 3]	; V/V, IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 12 3 6))) 5]	; iv, vii o
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 9 1 4))) 2]	; iv, bVI
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 7 10))) 3]	; iv, V/V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 9 1))) 0]	; iv, iv
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 1]	; iv, V/IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 9 12))) 2]	; iv, V/vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 11 3 6))) 1]	; iv, bVII
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 8 12 3))) 2]	; iv, V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 1 5))) 2]	; iv, vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 1]	; iv, I
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 6 10))) 3]	; iv, ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 2 5))) 3]	; iv, V/ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 8 12))) 3]	; iv, iii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 10 1))) 0]	; iv, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; V/IV, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 2]	; V/IV, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 2]	; V/IV, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 1]	; V/IV, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 2]	; V/IV, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 2]	; V/IV, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 1]	; V/IV, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 2]	; V/IV, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 2]	; V/IV, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; V/IV, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 1]	; V/IV, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 1]	; V/IV, IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 12 3 6))) 1]	; V/vi, vii o
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 9 1 4))) 2]	; V/vi, bVI
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 7 10))) 2]	; V/vi, V/V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 9 1))) 2]	; V/vi, iv
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 2]	; V/vi, V/IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 9 12))) 0]	; V/vi, V/vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 11 3 6))) 6]	; V/vi, bVII
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 8 12 3))) 3]	; V/vi, V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 1 5))) 1]	; V/vi, vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 2]	; V/vi, I
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 6 10))) 2]	; V/vi, ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 2 5))) 1]	; V/vi, V/ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 8 12))) 0]	; V/vi, iii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 10 1))) 3]	; V/vi, IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 12 3 6))) 1]	; bVII, vii o
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 9 1 4))) 2]	; bVII, bVI
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 7 10))) 2]	; bVII, V/V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 9 1))) 1]	; bVII, iv
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 2]	; bVII, V/IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 9 12))) 6]	; bVII, V/vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 11 3 6))) 0]	; bVII, bVII
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 8 12 3))) 3]	; bVII, V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 1 5))) 4]	; bVII, vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 2]	; bVII, I
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 6 10))) 1]	; bVII, ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 2 5))) 3]	; bVII, V/ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 8 12))) 5]	; bVII, iii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 10 1))) 1]	; bVII, IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 12 3 6))) 2]	; V, vii o
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 9 1 4))) 3]	; V, bVI
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 7 10))) 1]	; V, V/V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 9 1))) 2]	; V, iv
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 1]	; V, V/IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 9 12))) 3]	; V, V/vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 11 3 6))) 3]	; V, bVII
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 8 12 3))) 0]	; V, V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 1 5))) 2]	; V, vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 1]	; V, I
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 6 10))) 1]	; V, ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 2 5))) 2]	; V, V/ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 8 12))) 2]	; V, iii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 10 1))) 2]	; V, IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 12 3 6))) 2]	; vi, vii o
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 9 1 4))) 2]	; vi, bVI
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 7 10))) 1]	; vi, V/V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 9 1))) 2]	; vi, iv
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 2]	; vi, V/IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 9 12))) 1]	; vi, V/vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 11 3 6))) 4]	; vi, bVII
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 8 12 3))) 2]	; vi, V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 2]	; vi, I
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 6 10))) 1]	; vi, ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 2 5))) 0]	; vi, V/ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 8 12))) 1]	; vi, iii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 10 1))) 1]	; vi, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; I, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 2]	; I, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 2]	; I, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 1]	; I, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 2]	; I, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 2]	; I, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 1]	; I, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 2]	; I, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 2]	; I, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; I, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 1]	; I, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 1]	; I, IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 12 3 6))) 2]	; ii, vii o
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 9 1 4))) 5]	; ii, bVI
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 7 10))) 0]	; ii, V/V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 9 1))) 3]	; ii, iv
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 2]	; ii, V/IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 9 12))) 2]	; ii, V/vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 11 3 6))) 1]	; ii, bVII
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 8 12 3))) 1]	; ii, V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 1 5))) 1]	; ii, vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 2]	; ii, I
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 2 5))) 1]	; ii, V/ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 8 12))) 2]	; ii, iii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 10 1))) 2]	; ii, IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 12 3 6))) 2]	; V/ii, vii o
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 9 1 4))) 3]	; V/ii, bVI
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 7 10))) 1]	; V/ii, V/V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 9 1))) 3]	; V/ii, iv
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, V/IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 9 12))) 1]	; V/ii, V/vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 11 3 6))) 3]	; V/ii, bVII
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 8 12 3))) 2]	; V/ii, V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 1 5))) 0]	; V/ii, vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, I
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 6 10))) 1]	; V/ii, ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 2 5))) 0]	; V/ii, V/ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 8 12))) 1]	; V/ii, iii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 10 1))) 2]	; V/ii, IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 12 3 6))) 1]	; iii, vii o
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 9 1 4))) 3]	; iii, bVI
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 7 10))) 2]	; iii, V/V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 9 1))) 3]	; iii, iv
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 1]	; iii, V/IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 9 12))) 0]	; iii, V/vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 11 3 6))) 5]	; iii, bVII
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 8 12 3))) 2]	; iii, V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 1 5))) 1]	; iii, vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 1]	; iii, I
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 6 10))) 2]	; iii, ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 2 5))) 1]	; iii, V/ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 10 1))) 4]	; iii, IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 12 3 6))) 4]	; IV, vii o
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 9 1 4))) 3]	; IV, bVI
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 7 10))) 3]	; IV, V/V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 9 1))) 0]	; IV, iv
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 1]	; IV, V/IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 9 12))) 3]	; IV, V/vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 11 3 6))) 1]	; IV, bVII
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 8 12 3))) 2]	; IV, V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 1 5))) 1]	; IV, vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 1]	; IV, I
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 6 10))) 2]	; IV, ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 2 5))) 2]	; IV, V/ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 8 12))) 4]	; IV, iii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 10 1))) 0]	; IV, IV
    [#t (assert #f "distance jazz/dist/min^ undefined")]))

(define (jazz/dist/avg^ c1 c2)
  (define pcs1 (chord-pcs (?->triad c1)))
  (define pcs2 (chord-pcs (?->triad c2)))
  (cond
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 12 3 6))) 0]	; vii o, vii o
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 9 1 4))) 4]	; vii o, bVI
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 7 10))) 3]	; vii o, V/V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 9 1))) 6]	; vii o, iv
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, V/IV
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 9 12))) 3]	; vii o, V/vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 11 3 6))) 3]	; vii o, bVII
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 8 12 3))) 3]	; vii o, V
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 1 5))) 4]	; vii o, vi
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 1 5 8))) 5]	; vii o, I
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 3 6 10))) 3]	; vii o, ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 10 2 5))) 3]	; vii o, V/ii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 5 8 12))) 3]	; vii o, iii
    [(and (equal? pcs1 (list 12 3 6)) (equal? pcs2 (list 6 10 1))) 5]	; vii o, IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 12 3 6))) 4]	; bVI, vii o
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 9 1 4))) 0]	; bVI, bVI
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 7 10))) 6]	; bVI, V/V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 9 1))) 3]	; bVI, iv
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 3]	; bVI, V/IV
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 9 12))) 3]	; bVI, V/vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 11 3 6))) 4]	; bVI, bVII
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 8 12 3))) 4]	; bVI, V
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 1 5))) 4]	; bVI, vi
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 1 5 8))) 3]	; bVI, I
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 3 6 10))) 6]	; bVI, ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 10 2 5))) 4]	; bVI, V/ii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 5 8 12))) 4]	; bVI, iii
    [(and (equal? pcs1 (list 9 1 4)) (equal? pcs2 (list 6 10 1))) 3]	; bVI, IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 12 3 6))) 3]	; V/V, vii o
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 9 1 4))) 6]	; V/V, bVI
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 7 10))) 0]	; V/V, V/V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 9 1))) 4]	; V/V, iv
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 4]	; V/V, V/IV
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 9 12))) 4]	; V/V, V/vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 11 3 6))) 3]	; V/V, bVII
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 8 12 3))) 2]	; V/V, V
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 1 5))) 3]	; V/V, vi
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 1 5 8))) 4]	; V/V, I
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 3 6 10))) 1]	; V/V, ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 10 2 5))) 2]	; V/V, V/ii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 5 8 12))) 4]	; V/V, iii
    [(and (equal? pcs1 (list 3 7 10)) (equal? pcs2 (list 6 10 1))) 3]	; V/V, IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 12 3 6))) 6]	; iv, vii o
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 9 1 4))) 3]	; iv, bVI
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 7 10))) 4]	; iv, V/V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 9 1))) 0]	; iv, iv
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 2]	; iv, V/IV
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 9 12))) 4]	; iv, V/vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 11 3 6))) 3]	; iv, bVII
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 8 12 3))) 4]	; iv, V
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 1 5))) 3]	; iv, vi
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 1 5 8))) 2]	; iv, I
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 3 6 10))) 3]	; iv, ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 10 2 5))) 4]	; iv, V/ii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 5 8 12))) 4]	; iv, iii
    [(and (equal? pcs1 (list 6 9 1)) (equal? pcs2 (list 6 10 1))) 1]	; iv, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; V/IV, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 3]	; V/IV, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 4]	; V/IV, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 2]	; V/IV, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 3]	; V/IV, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 4]	; V/IV, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 2]	; V/IV, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 3]	; V/IV, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; V/IV, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 4]	; V/IV, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; V/IV, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 3]	; V/IV, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 2]	; V/IV, IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 12 3 6))) 3]	; V/vi, vii o
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 9 1 4))) 3]	; V/vi, bVI
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 7 10))) 4]	; V/vi, V/V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 9 1))) 4]	; V/vi, iv
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 3]	; V/vi, V/IV
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 9 12))) 0]	; V/vi, V/vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 11 3 6))) 6]	; V/vi, bVII
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 8 12 3))) 3]	; V/vi, V
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 1 5))) 2]	; V/vi, vi
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 1 5 8))) 3]	; V/vi, I
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 3 6 10))) 4]	; V/vi, ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 10 2 5))) 2]	; V/vi, V/ii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 5 8 12))) 1]	; V/vi, iii
    [(and (equal? pcs1 (list 5 9 12)) (equal? pcs2 (list 6 10 1))) 4]	; V/vi, IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 12 3 6))) 3]	; bVII, vii o
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 9 1 4))) 4]	; bVII, bVI
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 7 10))) 3]	; bVII, V/V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 9 1))) 3]	; bVII, iv
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 4]	; bVII, V/IV
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 9 12))) 6]	; bVII, V/vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 11 3 6))) 0]	; bVII, bVII
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 8 12 3))) 3]	; bVII, V
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 1 5))) 5]	; bVII, vi
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 1 5 8))) 4]	; bVII, I
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 3 6 10))) 3]	; bVII, ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 10 2 5))) 4]	; bVII, V/ii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 5 8 12))) 6]	; bVII, iii
    [(and (equal? pcs1 (list 11 3 6)) (equal? pcs2 (list 6 10 1))) 2]	; bVII, IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 12 3 6))) 3]	; V, vii o
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 9 1 4))) 4]	; V, bVI
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 7 10))) 2]	; V, V/V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 9 1))) 4]	; V, iv
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 2]	; V, V/IV
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 9 12))) 3]	; V, V/vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 11 3 6))) 3]	; V, bVII
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 8 12 3))) 0]	; V, V
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 1 5))) 4]	; V, vi
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 1 5 8))) 2]	; V, I
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 3 6 10))) 3]	; V, ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 10 2 5))) 4]	; V, V/ii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 5 8 12))) 3]	; V, iii
    [(and (equal? pcs1 (list 8 12 3)) (equal? pcs2 (list 6 10 1))) 4]	; V, IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 12 3 6))) 4]	; vi, vii o
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 9 1 4))) 4]	; vi, bVI
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 7 10))) 3]	; vi, V/V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 9 1))) 3]	; vi, iv
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 3]	; vi, V/IV
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 9 12))) 2]	; vi, V/vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 11 3 6))) 5]	; vi, bVII
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 8 12 3))) 4]	; vi, V
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 1 5))) 0]	; vi, vi
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 1 5 8))) 3]	; vi, I
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 3 6 10))) 2]	; vi, ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 10 2 5))) 1]	; vi, V/ii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 5 8 12))) 2]	; vi, iii
    [(and (equal? pcs1 (list 10 1 5)) (equal? pcs2 (list 6 10 1))) 3]	; vi, IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 12 3 6))) 5]	; I, vii o
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 9 1 4))) 3]	; I, bVI
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 7 10))) 4]	; I, V/V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 9 1))) 2]	; I, iv
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, V/IV
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 9 12))) 3]	; I, V/vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 11 3 6))) 4]	; I, bVII
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 8 12 3))) 2]	; I, V
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 1 5))) 3]	; I, vi
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 1 5 8))) 0]	; I, I
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 3 6 10))) 4]	; I, ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 10 2 5))) 3]	; I, V/ii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 5 8 12))) 3]	; I, iii
    [(and (equal? pcs1 (list 1 5 8)) (equal? pcs2 (list 6 10 1))) 2]	; I, IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 12 3 6))) 3]	; ii, vii o
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 9 1 4))) 6]	; ii, bVI
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 7 10))) 1]	; ii, V/V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 9 1))) 3]	; ii, iv
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 4]	; ii, V/IV
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 9 12))) 4]	; ii, V/vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 11 3 6))) 3]	; ii, bVII
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 8 12 3))) 3]	; ii, V
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 1 5))) 2]	; ii, vi
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 1 5 8))) 4]	; ii, I
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 3 6 10))) 0]	; ii, ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 10 2 5))) 2]	; ii, V/ii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 5 8 12))) 4]	; ii, iii
    [(and (equal? pcs1 (list 3 6 10)) (equal? pcs2 (list 6 10 1))) 3]	; ii, IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 12 3 6))) 3]	; V/ii, vii o
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 9 1 4))) 4]	; V/ii, bVI
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 7 10))) 2]	; V/ii, V/V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 9 1))) 4]	; V/ii, iv
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, V/IV
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 9 12))) 2]	; V/ii, V/vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 11 3 6))) 4]	; V/ii, bVII
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 8 12 3))) 4]	; V/ii, V
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 1 5))) 1]	; V/ii, vi
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 1 5 8))) 3]	; V/ii, I
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 3 6 10))) 2]	; V/ii, ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 10 2 5))) 0]	; V/ii, V/ii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 5 8 12))) 3]	; V/ii, iii
    [(and (equal? pcs1 (list 10 2 5)) (equal? pcs2 (list 6 10 1))) 3]	; V/ii, IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 12 3 6))) 3]	; iii, vii o
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 9 1 4))) 4]	; iii, bVI
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 7 10))) 4]	; iii, V/V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 9 1))) 4]	; iii, iv
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 3]	; iii, V/IV
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 9 12))) 1]	; iii, V/vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 11 3 6))) 6]	; iii, bVII
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 8 12 3))) 3]	; iii, V
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 1 5))) 2]	; iii, vi
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 1 5 8))) 3]	; iii, I
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 3 6 10))) 4]	; iii, ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 10 2 5))) 3]	; iii, V/ii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 5 8 12))) 0]	; iii, iii
    [(and (equal? pcs1 (list 5 8 12)) (equal? pcs2 (list 6 10 1))) 5]	; iii, IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 12 3 6))) 5]	; IV, vii o
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 9 1 4))) 3]	; IV, bVI
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 7 10))) 3]	; IV, V/V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 9 1))) 1]	; IV, iv
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 2]	; IV, V/IV
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 9 12))) 4]	; IV, V/vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 11 3 6))) 2]	; IV, bVII
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 8 12 3))) 4]	; IV, V
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 1 5))) 3]	; IV, vi
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 1 5 8))) 2]	; IV, I
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 3 6 10))) 3]	; IV, ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 10 2 5))) 3]	; IV, V/ii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 5 8 12))) 5]	; IV, iii
    [(and (equal? pcs1 (list 6 10 1)) (equal? pcs2 (list 6 10 1))) 0]	; IV, IV
    [#t (assert #f "distance jazz/dist/avg^ undefined")]))

