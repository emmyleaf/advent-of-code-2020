defmodule StarOneTwo do
  @target 2020

  defp find_pair([], _, _), do: nil
  defp find_pair(_, [], _), do: nil

  defp find_pair(ls = [l | tls], rs = [r | trs], target) do
    case Comparable.compare(l + r, target) do
      :gt -> find_pair(ls, trs, target)
      :eq -> l * r
      :lt -> find_pair(tls, rs, target)
    end
  end

  def find_trip(input) do
    [x | xs] = Enum.sort(input)
    pair = find_pair(xs, Enum.reverse(xs), @target - x)

    case pair do
      nil -> find_trip(xs)
      y -> x * y
    end
  end

  def run do
    Inputs.int_stream("star1_1")
    |> find_trip()
  end
end
