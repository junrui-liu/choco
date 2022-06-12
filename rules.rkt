#lang rosette

(require "theory.rkt")
(require "utils.rkt")
(require "parameters.rkt")

(provide (all-defined-out))


; lift a rule on (individual) slices to a rule on pieces
(define ((rule/slice->piece rule) p)
  (for/conjoin ([s (piece->slices p)])
    (rule s)))

; a slice is in harmony, if
; - every voice is contained in the chord
; - every chord tone is realized in some voice
(define (slice/harmony? s)
  (and
    ; every note is a valid pitch in the chord
    (for/conjoin ([note (slice/voices s)])
      (for/disjoin ([chord-pc (slice/pcs s)])
        (equal? (note->pc note) chord-pc)))
    ; every pitch in the chord is realized by some note, except for the fifth
    (for/conjoin ([chord-pc (slice/pcs s)])
      (=> (not (= chord-pc (chord/fifth (slice-chord s))))
        (for/disjoin ([note (slice/voices s)])
          (equal? (note->pc note) chord-pc))))))

; maintain the invariant that upper voices are higher than lower voices
(define (slice/voices-sorted? sl)
  (match-let ([(slice s a t b _) sl])
    (>= s a t b)))

; bass note match chord inversion
(define (slice/correct-inversion? sl)
  (match-let ([(slice _ _ _ b (chord pcs inv)) sl])
    (equal? (list-ref pcs inv) b)))

; do not double a pitch class
(define ((slice/do-not-double pc) sl)
  ; (printf "don't double ~a\n" pc)
  ; (for ([i (in-range 14)])
  ;   (printf "= ~a ~a ? ~a\n" i pc (~= i pc)))
  (not
    (for/disjoin ([c (choose-k (slice/voices sl) 2)])
      (match-let ([(list v1 v2) c])
        (and
          (~= v1 pc)
          (~= v2 pc))))))

; leading tone cannot be doubled
(define (slice/no-lt-doubling? sl)
  (slice/do-not-double (*leading-tone*)))

; fifth should not be doubled
(define (slice/no-fifth-doubling? sl)
  (match-let ([(slice _ _ _ _ (chord pcs _)) sl])
    ((slice/do-not-double (list-ref pcs 2)) sl)))

; seventh should not be doubled
(define (slice/no-seventh-doubling? sl)
  (=> (not (fake-traid? (slice-chord sl)))
    ((slice/do-not-double (chord/seventh (slice-chord sl))) sl)))

; leading tone must resolve to tonic
(define (slices/lt-resolves? sl1 sl2)
  (let ([v1 (slice-s sl1)] [v2 (slice-s sl2)])
    (=> (~= v1 (*leading-tone*))
      (or (= v2 v1) (= v2 (add1 v1))))))

(define (slices/dominant-resolves? sl1 sl2)
  (let*
    ([doms (remove-duplicates (filter seventh/dom? (*available-chords*)))]
     [relatives (map seventh/dominates doms)]
     [c1 (slice-chord sl1)]
     [c2 (slice-chord sl2)])
    ; (printf "doms: ~a\n" (map (*chord->string*) doms))
    ; (printf "relatives :~a\n" (map (*chord->string*) relatives))
    (for/conjoin ([dom doms] [rels relatives])
      (=> (equal? (chord-pcs c1) (chord-pcs dom))
        (for/disjoin ([rel rels])
          (equal? (chord-pcs (?->triad c2)) (chord-pcs (?->triad rel))))))))


; forbid certain kinds of parallel motion
(define (slices/no-parallel? sl1 sl2)
  (let*
    ([v1 (slice/voices sl1)]
     [v2 (slice/voices sl2)]
     [voices (zip v1 v2)]
     [forbidden
      (list 
        (*octave-size*)
        (*fifth-size*)
        (- (*fifth-size*)))]) ; fourth
    (for/conjoin ([interval forbidden]) ; for each forbidden interval
      (for/conjoin ([vij (choose-k voices 2)]) ; pick two voices
        (match-let*
          ([(list vi vj) vij]
           [(cons i1 i2) vi]
           [(cons j1 j2) vj])
          (=> (= (- i1 j1) (- i2 j2))
            (not (~= (- i2 j2) interval))))))))

; no voice crossing
(define (slices/no-crossing? sl1 sl2)
  (let
    ([v1 (slice/voices sl1)]
     [v2 (slice/voices sl2)])
  (and
    ; higher voice >= previous (adjacent) lower voice
    (for/conjoin ([n1 v1] [n2 (cdr v2)])
      (> n1 n2))
    ; lower voice <= previous (adjacent) higher voice
    (for/conjoin ([n1 (cdr v1)] [n2 v2])
      (< n1 n2)))))

; inner voices should not jump by >= 5th
(define (slices/no-jump? sl1 sl2)
  (and
    (for/conjoin ([n1 (slice/inner sl1)] [n2 (slice/inner sl2)])
      (< (abs (- n2 n1)) (*fifth-size*)))
    (< (abs (- (slice-s sl2) (slice-s sl1))) (*fifth-size*))
    ; (<= (abs (- (slice-b sl2) (slice-b sl1))) (*fifth-size*))
    ))

; distinct chords
(define (slices/distinct? sl1 sl2)
  (not (equal?
    (chord-pcs (slice-chord sl1))
    (chord-pcs (slice-chord sl2)))))

(define (slice/spaced? sl)
  (for/conjoin ([n1 (slice/voices sl)] [n2 (cdr (slice/voices sl))])
    (>= (abs (- n1 n2)) 1)))

(define (slices/distinct-voices? sl1 sl2)
  (for/disjoin ([n1 (slice/inner sl1)]
                [n2 (slice/inner sl2)])
    (not (equal? n1 n2)))
  (not (equal? (slice-b sl1) (slice-b sl2))))

(define ((rule/slices->piece rule) p)
  (define slices (piece->slices p))
  (for/conjoin ([s1 slices] [s2 (cdr slices)])
    (rule s1 s2)))


(define (piece/PAC p)
  (define L (length (piece->slices p)))
  (>= L 2)
  (match-let
    ([(slice s _ _ _ _) (list-ref (piece->slices p) (sub1 L))])
    (~= s (*tonic*))))


(define rules
  (hash
    "harmony" (rule/slice->piece slice/harmony?)
    "voices-sorted" (rule/slice->piece slice/voices-sorted?)
    "correct-inversion" (rule/slice->piece slice/correct-inversion?)
    "no-lt-doubling" (rule/slice->piece slice/no-lt-doubling?)
    "no-5th-doubling" (rule/slice->piece slice/no-fifth-doubling?)
    "no-7th-doubling" (rule/slice->piece slice/no-seventh-doubling?)
    "no-parallel" (rule/slices->piece slices/no-parallel?)
    "lt-resolves" (rule/slices->piece slices/lt-resolves?)
    "dominant-resolves" (rule/slices->piece slices/dominant-resolves?)
    "no-crossing" (rule/slices->piece slices/no-crossing?)
    "no-jump" (rule/slices->piece slices/no-jump?)
    "distinct" (rule/slices->piece slices/distinct?)
    "distinct-voices" (rule/slices->piece slices/distinct-voices?)
    "spaced" (rule/slice->piece slice/spaced?)
    "PAC" piece/PAC))