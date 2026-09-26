(define (nfor-each items proc)
  (cond ((null? items) '())
        (else 
          (proc (car items))
          (nfor-each (cdr items) proc))))