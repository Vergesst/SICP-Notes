// recursive version
function simpson(f: (x: number) => number, a: number, b: number, n: number): number {
  if (n % 2 !== 0) {
    throw new Error("invalid arg")
  }
  let h = (b - a) / n
  
  const calculate = (h: number, k: number): number => {
    if (k > n) {
      return 0
    } else if (k === 0 || k === n) {
      return f(a + h * k) + calculate(h, k + 1)
    } else if (k % 2 === 0) {
      return 2 * f(a + h * k) + calculate(h, k + 1)
    } else {
      return 4 * f(a + h * k) + calculate(h, k + 1)
    }
  }
  return h/3 * calculate(h, 0)
}

// iterative version
