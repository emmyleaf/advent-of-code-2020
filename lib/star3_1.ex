defmodule StarThreeOne do
  @tree "#"
  @xskip 3

  defp _tree_collisions([], _, _, acc), do: acc

  defp _tree_collisions([line | tail], width, x, acc) do
    x_clamped = Integer.mod(x, width)

    case String.at(line, x_clamped) do
      @tree -> _tree_collisions(tail, width, x_clamped + @xskip, acc + 1)
      _ -> _tree_collisions(tail, width, x_clamped + @xskip, acc)
    end
  end

  def tree_collisions([head | tail]) do
    width = String.length(head)
    _tree_collisions(tail, width, @xskip, 0)
  end

  def run do
    Inputs.stream("star3_1")
    |> Enum.map(&String.trim/1)
    |> tree_collisions()
  end
end
