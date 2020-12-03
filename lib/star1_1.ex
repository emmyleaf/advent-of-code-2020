defmodule StarOneOne do
  import Helpers

  @target 2020

  defp _find_pair(ls = [l | tls], rs = [r | trs]) do
    case compare(l + r, @target) do
      :gt -> _find_pair(ls, trs)
      :eq -> l * r
      :lt -> _find_pair(tls, rs)
    end
  end

  def find_pair(input) do
    xs = Enum.sort(input)
    _find_pair(xs, Enum.reverse(xs))
  end

  def run do
    int_stream_input("star1_1")
    |> find_pair()
  end
end
