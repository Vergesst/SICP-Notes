(define (square-list items)
  (map (lambda (x) (* x x)) items))

(define (square-lst items)
  (if (null? items)
    '()
    (let ((first (car items))
          (rest (cdr items)))
         (cons (* first first) (square-lst rest)))))