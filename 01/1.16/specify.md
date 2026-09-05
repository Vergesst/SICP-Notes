for those procedures like this:
```scheme
; f_n = f_(n-1) + 2f_(n-2) + 3f_(n-3)
; tree cursive
(define (calculate-f n)
  (if (< n 3)
    n
    (+ (calculate-f (- n 1)) (* 2 (calculate-f (- n 2))) (* 3 (calculate-f (- n 3))))))
```
call the function itslef more than once, is the `tree recursive`, belongs to `recursive`.

and those like this:
```scheme
(define (fact n)
    (cond ((= n 0) 1)
        else (* n (fact (- n 1)))))
```
in which there is just one call for themselves, called `linear recursive`, also belongs to `recursive`

and there is processes completely different from `recursive`, even if they are similar in syntax:
```scheme
(define (fact b n)
    (cond ((= n 0) b) 
        else (fact (* b n) (- n 1))))
```
which is called `iterative process`, which is just the same as `for`, `while`, `loop` or something else like these in `Instructive Programming Language` like Rust, Java and so on. 
> since there is **no** expand procedure in its running process, so even though they are almost the same in syntax, they are divided into two different parts.
---
> and why not haskell? since writing those functions with haskell is not so natural as scheme