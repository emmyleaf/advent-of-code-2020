defmodule Star10 do
  defp find_diffs(chargers, acc \\ {0, 0})
  defp find_diffs([_last], {ones, threes}), do: ones * (threes + 1)

  defp find_diffs([head | tail], {ones, threes}) do
    case hd(tail) - head do
      1 -> find_diffs(tail, {ones + 1, threes})
      3 -> find_diffs(tail, {ones, threes + 1})
    end
  end

  def silver(ints) do
    [0 | Enum.sort(ints)] |> find_diffs()
  end
end
