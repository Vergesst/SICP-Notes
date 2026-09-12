; defination of points
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; defination of segments
(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (midpoint-segment seg)
  (let* ((s  (start-segment seg))
         (e  (end-segment seg))
         (sx (x-point s))
         (sy (y-point s))
         (ex (x-point e))
         (ey (y-point e)))
    (make-point (/ (+ sx ex) 2)
                (/ (+ sy ey) 2))))