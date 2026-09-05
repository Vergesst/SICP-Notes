## 如果使用了`new-if`会显然的崩溃

### 原有的Scheme代码如下，运行时会发现此时会崩溃
```scheme
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause))
    (else else-clause))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                       x)))
(define (improve guess x)
    average guess (/ x guess))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
    (sqrt-iter 1.0 x))
```
> 使用`mit-scheme`运行如上代码
> ```bash
> scheme ./sqrt-iter.scm
> ```
> 之后在interactive emvironment中使用`display (sqrt N)`获取结果

### 语义类似的Haskell，同样使用自定义的`if`
```haskell
newIf :: Bool -> a -> a -> a
newIf predicate tclause eclause
  | predicate = tclause
  | otherwise = eclause

sqrtIter :: Float -> Float -> Float
sqrtIter guess x =
  newIf (goodEnough guess x 0.00001) guess (sqrtIter (improve guess x) x)

goodEnough :: Float -> Float -> Float -> Bool
goodEnough guess x accuracy= abs (square guess - x) < accuracy

square :: Float -> Float
square x = x * x

improve :: Float -> Float -> Float
improve guess x = (guess + x / guess) / 2

sqrt' :: Float -> Float
sqrt' = sqrtIter 1.0

main :: IO ()
main = do
  let res = sqrt' 16.0
  putStrLn ("result is " ++ show res)
```

在运行Haskell的时候发现其实相当正常，问题出在什么地方呢？
---
由于在处理 `new-if` 函数的时候，haskell 采用了 lazy order 来进行计算，导致原本会产生无限递归的 `eclause` 被包装成 `thunk` 而不被计算，从而保证了程序的良好运行。

但是对于 scheme，这里的 `new-if` 采用了 applicative order 即尽早进行所有的分值计算，这就会导致 `else-clause` 的递归被解释器直接运行或展开了，从而使得程序崩溃。

或许要问，为什么 `if` 和 `cond else` 就不会这样？

因为对于 scheme，尽管和许多命令式语言一样，使用 applicative order 作为求值策略，但是也在 `if` 和 `cond` 这种分支语句上采用了 `normal order` 进行求值，就是为了避免全部使用 applicative order 导致的程序崩溃。毕竟 applicative order 很容易带来此类崩溃。
