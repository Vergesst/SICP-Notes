; recursive ver of simpson's rule
; f: target function
(define (simpson f a b n)
  (if (not (= (modulo n 2) 0))
      (error "invalid arg")
      (let ((h (/ (- b a) n)))
        ;; This named let 'calculate' matches your inner TypeScript helper precisely
        (let calculate ((k 0))
          (cond
            ((> k n) 0)
            ((or (= k 0) (= k n))
             (+ (f (+ a (* h k))) (calculate (+ k 1))))
            ((= (modulo k 2) 0)
             (+ (* 2 (f (+ a (* h k)))) (calculate (+ k 1))))
            (else
             (+ (* 4 (f (+ a (* h k)))) (calculate (+ k 1)))))))))