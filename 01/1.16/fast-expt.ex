defmodule FastExponentiation do
  require Integer

  # Private helper function (no @spec needed!)
  defp square(n), do: n * n

  @spec fastExpt(integer(), integer()) :: integer()
  def fastExpt(_b, 0), do: 1
  def fastExpt(b, n) when Integer.is_even(n), do: square(fastExpt(b, div(n, 2)))
  def fastExpt(b, n), do: b * fastExpt(b, n - 1)
end
