defmodule StarOneOne do
  import Helpers

  @target 2020

  defp go(ls = [l | tls], rs = [r | trs]) do
    case compare(l + r, @target) do
      :gt -> go(ls, trs)
      :eq -> l * r
      :lt -> go(tls, rs)
    end
  end

  def find_sum_pair(input) do
    xs = Enum.sort(input)
    go(xs, Enum.reverse(xs))
  end

  def run do
    input("star1_1")
    |> to_int_list()
    |> find_sum_pair()
  end
end
