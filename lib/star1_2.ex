defmodule StarOneTwo do
  import Helpers

  @target 2020

  defp _find_pair([], _, _) do
    nil
  end

  defp _find_pair(_, [], _) do
    nil
  end

  defp _find_pair(ls = [l | tls], rs = [r | trs], target) do
    case compare(l + r, target) do
      :gt -> _find_pair(ls, trs, target)
      :eq -> l * r
      :lt -> _find_pair(tls, rs, target)
    end
  end

  def find_pair(input, target) do
    xs = Enum.sort(input)
    _find_pair(xs, Enum.reverse(xs), target)
  end

  def find_trip(input) do
    [x | xs] = Enum.sort(input)

    case find_pair(xs, @target - x) do
      nil -> find_trip(xs)
      y -> x * y
    end
  end

  def run do
    input("star1_1")
    |> to_int_list()
    |> find_trip()
  end
end
