defmodule SqrtIter do
  @spec sqrtIter(number(), number()) :: number()
  def sqrtIter(guess, x) do
    if goodEnough?(guess, x, 0.00001) do
      guess
    else
      sqrtIter(improve(guess, x), x)
    end
  end

  @spec goodEnough?(number(), number(), number()) :: boolean()
  def goodEnough?(guess, x, accuracy) do
    abs(square(guess) - x) < accuracy
  end

  @spec square(number()) :: number()
  def square(x), do: x*x

  @spec improve(number(), number()) :: number()
  def improve(guess, x), do: (guess + x / guess) / 2

  @spec sqrt(number()) :: number()
  def sqrt(x), do: sqrtIter(1.0, x)
end
