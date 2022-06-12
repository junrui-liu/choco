#lang rosette 

(provide (all-defined-out))

(require "parameters.rkt")
(require "utils.rkt")

; a voice is a list of notes
(struct voice (notes) #:transparent)
; a progression is a list of chords
(struct progression (chords) #:transparent)
; a chord is a list of pitch classes (root, third, etc.) and an inversion number
(struct chord (pcs inversion) #:transparent)
; a piece is four voices along with a chord progression
(struct piece (s a t b progression) #:transparent)

(define (chord/root c)
  (first (chord-pcs c)))

(define (chord/3rd c)
  (second (chord-pcs c)))

(define (chord/fifth c)
  (third (chord-pcs c)))

(define (chord/seventh c)
  (fourth (chord-pcs c)))

(define (piece/voices p)
  (match-let ([(piece s a t b _) p])
    (list s a t b)))

(define (piece/chords p)
  (match-let ([(piece _ _ _ _ (progression chords)) p])
    chords))

; Convenient constructors for various triads

; triad inversions
(define (triad . pcs) (chord pcs 0))
(define (triad^6 . pcs) (chord pcs 1))
(define (triad^64 . pcs) (chord pcs 2))

; seventh chord inversions
(define (seventh . pcs) (chord pcs 0))
(define (seventh^65 . pcs) (chord pcs 1))
(define (seventh^64 . pcs) (chord pcs 2))
(define (seventh^42 . pcs) (chord pcs 3))

; get the pitch class of a note
(define (note->pc note)
  (+ (modulo (- note (*note-offset*)) (*octave-size*))
     (*note-offset*)))

; get the register of a note (which octave)
(define (note->reg note)
  (quotient (- note (*note-offset*)) (*octave-size*)))

; test if two intervals are equivalent
(define (~= x y)
  (equal? (modulo x (*octave-size*)) (modulo y (*octave-size*))))

; Custom formatter generator
(define ((format-piece-gen chord->string note->string) p)
  (string-append
    (apply string-append
      (for/list ([voice (piece/voices p)])
        (string-join
          (for/list ([note (voice-notes voice)])
            (format "~a" (note->string note)))
          "\t"
          #:after-last "\n")))
    (string-join (map chord->string (piece/chords p)) "\t" #:after-last "\n")))


; a slice is the vertical view of a piece at each time step
(struct slice (s a t b chord) #:transparent)

; turn a piece into a list of slices
(define (piece->slices p)
  (match-let (
    [(piece
      (voice S) (voice A) (voice T) (voice B)
      (progression chords)) p])
    (for/list (
      [s S] [a A] [t T] [b B] [c chords])
      (slice s a t b c))))

(define (slices->piece sls)
  (piece
    (voice (map slice-s sls))
    (voice (map slice-a sls))
    (voice (map slice-t sls))
    (voice (map slice-b sls))
    (progression (map slice-chord sls))))

; extract four voices of a slice
(define (slice/voices s)
  (match-let ([(slice s a t b _) s])
    (list s a t b)))

; extract inner voices of a slice
(define (slice/inner s)
  (match-let ([(slice s a t b _) s])
    (list a t)))

(define (slice/outer s)
  (match-let ([(slice s a t b _) s])
    (list s b)))


; extract chordal pitch classes of a slice
(define (slice/pcs s)
  (match-let ([(slice _ _ _ _ (chord pcs _)) s])
    pcs))


(define (raise-M3 n)
  (note->pc (+ n 4)))
(define (raise-m3 n)
  (note->pc (+ n 3)))
(define (raise-P5 n)
  (note->pc (+ n (*fifth-size*))))
(define (raise-Oct n)
  (note->pc (+ n (*octave-size*))))
(define (raise-aug4 n)
  (note->pc (+ n (sub1 (*fifth-size*)))))

(define (form-chord bass stackings)
  (reverse (foldl
    (lambda (st pcs) (cons (st (car pcs)) pcs))
    (list bass)
    stackings)))


(define (major bass)
  (apply triad (form-chord bass (list raise-M3 raise-m3))))
(define (minor bass)
  (apply triad (form-chord bass (list raise-m3 raise-M3))))
(define (diminished bass)
  (apply triad (form-chord bass (list raise-m3 raise-m3))))

(define (fake-major bass)
  (triad bass (raise-M3 bass) (raise-P5 bass) bass))
(define (fake-minor bass)
  (triad bass (raise-m3 bass) (raise-P5 bass) bass))
(define (fake-diminished bass)
  (triad bass (raise-m3 bass) (raise-aug4 bass) bass))

(define (seventh/M bass)
  (apply triad (form-chord bass (list raise-M3 raise-m3 raise-M3))))
(define (seventh/dom bass)
  (apply triad (form-chord bass (list raise-M3 raise-m3 raise-m3))))
(define (seventh/m bass)
  (apply triad (form-chord bass (list raise-m3 raise-M3 raise-m3))))
(define (seventh/dim bass)
  (apply triad (form-chord bass (list raise-m3 raise-m3 raise-m3))))
(define (seventh/half-dim bass)
  (apply triad (form-chord bass (list raise-m3 raise-m3 raise-M3))))
(define (seventh->triad seventh)
  (match-let ([(chord pcs inv) seventh])
    (chord (drop-right pcs 1) inv)))
(define (?->triad c)
  (if (triad? c) c (seventh->triad c)))

(define (seventh? c)
  (= 4 (length (chord-pcs c))))
(define (seventh/dom? c)
  (equal? c (seventh/dom (chord/root c))))
(define (seventh/dominates dom)
  (define rel-tonic (note->pc (+ (chord/root dom) (*fourth-size*))))
  (list (fake-major rel-tonic) (fake-minor rel-tonic)))
(define (triad? c)
  (= 3 (length (chord-pcs c))))
(define (fake-traid? c)
  (equal? (first (chord-pcs c)) (fourth (chord-pcs c))))

(define (triad/minor? c)
  (equal? c (minor (chord/root c))))
(define (triad/m->M c)
  (major (raise-m3 (chord/root c))))
(define (triad/?->M c)
  (if (triad/minor? c) (triad/m->M c) c))

; (define (seventh/minor? c)
;   (equal? c (seventh/m (chord/root c))))
; (define (seventh/m->M c)
;   (seventh/M (raise-m3 (chord/root c))))
; (define (seventh/?->M c)
;   (if (seventh/minor? c) (seventh/m->M c) c))

