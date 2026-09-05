- 1.1 
**examples on inner functions for scheme and haskell**:
> code from 1.1 example for sqrt

scheme: 
```scheme
(define (square x)
    (* x x))

(define (average a b)
    (/ (+ a b) 2))

(define (sqrt x accuracy) 
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) accuracy))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (sqrt-iter guess)
        (if (good-enough? guess)
            guess
            (sqrt-iter (improve guess))))
(sqrt-iter (/ x 2)))
```
haskell:
```haskell
selfSqrt :: (Ord a, Fractional a) => a -> a -> a
selfSqrt x acc = sqrtIter (x / 2)
  where
    sqrtIter guess = if goodEnough guess
      then guess
      else sqrtIter (improve guess)

    goodEnough guess = abs (square guess - x) < acc

    square a = a * a

    improve guess = average guess (x / guess)

    average a b = (a + b) / 2
```