defmodule StarFiveAlt do
  def find_seat(line) do
    String.to_charlist(line)
    |> Enum.map(fn char -> if char in 'BR', do: ?1, else: ?0 end)
    |> :erlang.list_to_integer(2)
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
