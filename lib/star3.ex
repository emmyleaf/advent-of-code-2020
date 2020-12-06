defmodule StarThree do
  defp _tree_collisions([], _, _, acc), do: acc

  defp _tree_collisions([line | tail], x_func, x, acc) do
    case String.at(line, x) do
      "#" -> _tree_collisions(tail, x_func, x_func.(x), acc + 1)
      _ -> _tree_collisions(tail, x_func, x_func.(x), acc)
    end
  end

  def tree_collisions(lines, {xskip, yskip}) do
    [head | tail] = Enum.take_every(lines, yskip)
    width = String.length(head)
    x_func = &Integer.mod(&1 + xskip, width)

    _tree_collisions(tail, x_func, x_func.(0), 0)
  end

  def multi_collisions(lines) do
    [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]
    |> Enum.map(&tree_collisions(lines, &1))
    |> Enum.reduce(&*/2)
  end

  def silver do
    Inputs.trimmed_lines("star3") |> tree_collisions({3, 1})
  end

  def gold do
    Inputs.trimmed_lines("star3") |> multi_collisions()
  end
end
