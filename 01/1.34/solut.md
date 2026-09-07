显然会直接报 Exception
```text
> (f f)
Exception: attempt to apply non-procedure 2
Type (debug) to enter the debugger.
```

因为 `f` 的类型是 `(Num a) => (a -> b) -> b`，也就是说需要的参数应该是 `a -> b` 而不是和 `f` 一样的 `(a -> b) -> b`. 
因此直接传入 `f` 会导致类型不匹配而失败.
> 或者展开会有 f f = f 2 = 2 2，但是 2 并不是 procedure 因此必然出错
