defmodule SICPF do
  # f_n = f_(n-1) + 2f_(n-2) + 3f_(n-3)
  # tree recursive
  @spec calculateF(integer()) :: integer()
  def calculateF(n) do
    if n < 3 do
      n
    else
      calculateF(n - 1) +
      calculateF(n - 2) * 2 +
      calculateF(n - 3) * 3
    end
  end

  @spec calculate(integer()) :: integer()
  def calculate(n), do: calcIter(0, 1, 2, n)

  defp calcIter(a, _b, _c, 0), do: a
  defp calcIter(a, b, c, cnt), do: calcIter(b, c, 3*a + 2*b + c, cnt - 1)
end
