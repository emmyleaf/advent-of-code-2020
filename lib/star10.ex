defmodule Star10 do
  defp find_diffs(chargers, acc \\ {0, 0})
  defp find_diffs([_last], {ones, threes}), do: ones * (threes + 1)

  defp find_diffs([head | tail], {ones, threes}) do
    case hd(tail) - head do
      1 -> find_diffs(tail, {ones + 1, threes})
      3 -> find_diffs(tail, {ones, threes + 1})
    end
  end

  defp count_combos(x, acc) do
    if Map.has_key?(acc, x) do
      combos = Map.get(acc, x - 1, 0) + Map.get(acc, x - 2, 0) + Map.get(acc, x - 3, 0)
      Map.put(acc, x, combos)
    else
      acc
    end
  end

  def silver(ints) do
    [0 | Enum.sort(ints)] |> find_diffs()
  end

  def gold(ints) do
    target = Enum.max(ints)
    int_map = [0 | ints] |> Map.new(fn x -> {x, 1} end)
    Enum.reduce(1..target, int_map, &count_combos/2) |> Map.get(target)
  end
end
