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
实际上对于haskell，因为采取了[惰性求值]()的策略，在运行类似于`newIf`的时候，并不会对`predicate` `tclause` `eclause`分别进行求值。

也就是说，并不会开始就计算存在递归的`eclause`，其中有一个递归的`sqrtIter`。

而反观Scheme，采取尽早求值的策略会需要Scheme对`new-if`的三个参数`predicate` `then-clause` `else-clause`进行求值，此时`else-clause`中埋的`sqrt-iter`就会引爆运行时，使得运行时崩溃。

那么为什么使用`if`就没事呢？Scheme中的`if`是对于`cond`的一种特殊，`if predicate then t-clause else e-clause`并不会导致`predicate` `t-clause` `e-clause`被尽早计算，从而避免了引爆埋在`e-clause`中的递归。
