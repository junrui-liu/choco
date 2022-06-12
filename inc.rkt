#lang rosette

(define inc (solve+))

(define-symbolic* x integer?)

(assert (< x 0))

(vc)