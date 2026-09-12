(define (make-rat n d)
  (let* ((g (gcd n d))
         (sign (if (negative? (* n d)) -1 1))
         (new-n (/ (abs n) g))
         (new-d (/ (abs d) g)))
        (cons (* sign new-n) new-d)))
  

; assistant print procedure
(define (print-rat x)
  (newline)
  (display (car x))
  (display "/")
  (display (cdr x)))
