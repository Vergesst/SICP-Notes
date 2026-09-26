(define (same-parity first . rest) 
  (define (iter items result)
    (cond ((null? items)
            (reverse result))
          ((= (remainder (car items) 2) (remainder first 2))
            (iter (cdr items) (cons (car items) result)))
          (else 
            (iter (cdr items) result))))
  (iter rest (list first)))
