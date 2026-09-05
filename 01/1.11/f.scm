; f_n = f_(n-1) + 2f_(n-2) + 3f_(n-3)
; tree cursive
(define (calculate-f n)
  (if (< n 3)
    n
    (+ (calculate-f (- n 1)) (* 2 (calculate-f (- n 2))) (* 3 (calculate-f (- n 3))))))

; linear cursive
(define (calculate n)
  (calc-iter 0 1 2 n))
(define (calc-iter a b c count)
  (if (= count 0)
    a
    (calc-iter b c
      (+ (* a 3) (* b 2) c)
      (- count 1))))