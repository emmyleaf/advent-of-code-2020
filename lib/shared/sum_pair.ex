defmodule SumPair do
  def find_pair([], _, _), do: nil
  def find_pair(_, [], _), do: nil

  def find_pair(ls = [l | tls], rs = [r | trs], target) do
    case Comparable.compare(l + r, target) do
      :gt -> find_pair(ls, trs, target)
      :eq -> {l, r}
      :lt -> find_pair(tls, rs, target)
    end
  end

  def find_pair(input, target) do
    xs = Enum.sort(input)
    find_pair(xs, Enum.reverse(xs), target)
  end
end
