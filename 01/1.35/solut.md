### and the prove:
```text
-> % scheme ./fixed-point.scm 
Chez Scheme Version 10.3.0
Copyright 1984-2025 Cisco Systems, Inc.

> (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0 0.00001)
1.6180327868852458
> 
```