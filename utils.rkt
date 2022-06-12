#lang rosette 

(provide (all-defined-out))

(require (for-syntax syntax/for-body))
(define-syntax (for/conjoin stx)
    (syntax-case stx ()
      [(_ clauses body ... tail-expr)
       (with-syntax ([original stx]
                     [((pre-body ...) (post-body ...))
                      (split-for-body stx #'(body ... tail-expr))])
         #'(for/fold/derived original
             ([current #t])
             clauses
             pre-body ...
             (define maybe-new (let () post-body ...))
             (and maybe-new current)))]))

(define-syntax (for/disjoin stx)
    (syntax-case stx ()
      [(_ clauses body ... tail-expr)
       (with-syntax ([original stx]
                     [((pre-body ...) (post-body ...))
                      (split-for-body stx #'(body ... tail-expr))])
         #'(for/fold/derived original
             ([current #f])
             clauses
             pre-body ...
             (define maybe-new (let () post-body ...))
             (or maybe-new current)))]))

(define (rotate-L n l)
  (match l
    [(cons x y) #:when (> n 0)
     (rotate-L (sub1 n) (append y (list x)))]
    [_ l]))

(define (association-list . l)
  (match l
    [(list k v tl ...)
     (cons (cons k v) (apply association-list tl))]
    [_ (list)]))

(define (swap p)
  (match p
    [(cons x y) (cons y x)]))

(define (choose-k l k)
  (cond
    [(<= (length l) k)
     (list l)]
    [(= k 0)
     (list '())]
    [#t
     (append
      ; attach car to (k-1) items w/o head
      (map ((curry cons) (car l))
        (choose-k (cdr l) (sub1 k)))
      ; form k items w/o car
      (choose-k (cdr l) k))]))

(define (zip xs ys)
  (for/list ([x xs] [y ys])
    (cons x y)))

(define ((mod-equiv n) . xs)
  (match xs
    [(list x y ys ...)
     (and
      (equal? (modulo x n) (modulo y n))
      (apply (mod-equiv n) (cons y ys)))]
    [_ #t]))

(define (formula-size)
  (let ([subformulae (mutable-seteq)]
        [nodes 0]
        [variables 0])
    (define (recurse term)
      (unless (set-member? subformulae term)
        (set-add! subformulae term)
        (match term
          [(expression _ terms ...)
           (set! nodes (+ nodes 1))
           (for-each recurse terms)]
          [(constant name _)
           (set! variables (+ variables 1))]
          [_
           (void)])))
    (for-each recurse (vc))
    (values nodes variables)))

(define (step-count from target move)
  (define (f x i)
    (if (= x target)
      i
      (f (move x) (add1 i))))
  (f from 0))