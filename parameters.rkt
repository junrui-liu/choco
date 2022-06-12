
#lang rosette

(provide (all-defined-out))

; Ideally a theory should be parameterized, using units (ML-style functors)
; For now, we leave it to theory instantiations to imperatively modify
; these parameters

; # of notes in an octave
(define *octave-size* (make-parameter #f))
; # of notes in a fifth
(define *fifth-size* (make-parameter #f))
; # of notes in a fourth
(define *fourth-size* (make-parameter #f))
; ?
(define *note-offset* (make-parameter #f))
; tonic's representation
(define *tonic* (make-parameter #f))
; middle C's representation
(define *C4* (make-parameter #f))
; leading tone's representation
(define *leading-tone* (make-parameter #f))
; range of available notes for synthesis
(define *note-lb* (make-parameter #f))
(define *note-ub* (make-parameter #f))
; available chords for synthesis
(define *available-chords* (make-parameter #f))
; rules to be enforced
(define *rules* (make-parameter #f))
(define *chord->string* (make-parameter #f))