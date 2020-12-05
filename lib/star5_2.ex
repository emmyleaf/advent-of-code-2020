defmodule StarFiveTwo do
  @lower_dirs 'FL'
  @upper_dirs 'BR'

  defp partition(dirs, lower, upper) do
    diff = div(upper - lower + 1, 2)

    case dirs do
      [d | []] when d in @lower_dirs -> lower
      [d | []] when d in @upper_dirs -> upper
      [d | tail] when d in @lower_dirs -> partition(tail, lower, upper - diff)
      [d | tail] when d in @upper_dirs -> partition(tail, lower + diff, upper)
    end
  end

  def find_seat(line) do
    {row_dirs, col_dirs} = String.split_at(line, 7)
    row = partition(String.to_charlist(row_dirs), 0, 127)
    col = partition(String.to_charlist(col_dirs), 0, 7)
    row * 8 + col
  end

  def find_empty_seat(seats) do
    [head | tail] = Enum.sort(seats)

    Enum.reduce_while(tail, head, fn curr, prev ->
      if(curr == prev + 1, do: {:cont, curr}, else: {:halt, prev + 1})
    end)
  end

  def run do
    Inputs.stream("star5_1")
    |> Stream.map(&String.trim/1)
    |> Stream.map(&find_seat/1)
    |> find_empty_seat()
  end
end
