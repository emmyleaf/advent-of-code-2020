defmodule StarFive do
  defp find_seat(dirs, lower, upper) do
    diff = div(upper - lower + 1, 2)

    case dirs do
      [d | []] when d in 'FL' -> lower
      [d | []] when d in 'BR' -> upper
      [d | tail] when d in 'FL' -> find_seat(tail, lower, upper - diff)
      [d | tail] when d in 'BR' -> find_seat(tail, lower + diff, upper)
    end
  end

  def find_seat(line) do
    {row_dirs, col_dirs} = String.split_at(line, 7)
    row = find_seat(String.to_charlist(row_dirs), 0, 127)
    col = find_seat(String.to_charlist(col_dirs), 0, 7)
    row * 8 + col
  end

  def find_empty_seat(seats) do
    [head | tail] = Enum.sort(seats)

    Enum.reduce_while(tail, head, fn curr, prev ->
      if(curr == prev + 1, do: {:cont, curr}, else: {:halt, prev + 1})
    end)
  end

  def silver do
    Inputs.trimmed_lines("star5")
    |> Stream.map(&find_seat/1)
    |> Enum.max()
  end

  def gold do
    Inputs.trimmed_lines("star5")
    |> Stream.map(&find_seat/1)
    |> find_empty_seat()
  end
end
