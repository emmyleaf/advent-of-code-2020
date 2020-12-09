defmodule StarOne do
  @target 2020

  def find_2020_pair(input) do
    {x, y} = SumPair.find_pair(input, @target)
    x * y
  end

  def find_trip(input) do
    [x | xs] = Enum.sort(input)
    pair = SumPair.find_pair(xs, Enum.reverse(xs), @target - x)

    case pair do
      nil -> find_trip(xs)
      {y, z} -> x * y * z
    end
  end

  def silver do
    Inputs.ints("star1") |> find_2020_pair()
  end

  def gold do
    Inputs.ints("star1") |> find_trip()
  end
end
