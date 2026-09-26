(define (reverse lst) 
  (reverse-iter lst '()))

(define (reverse-iter origin target)
  (if (null? origin)
    target
    (reverse-iter (cdr origin) (cons (car origin) target))))
