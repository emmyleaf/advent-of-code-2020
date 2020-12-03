defmodule Helpers do
  def stream_input(star) do
    Path.join("inputs", star) |> File.stream!()
  end

  def int_stream_input(star) do
    stream_input(star)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end

  def compare(a, b) do
    cond do
      a == b -> :eq
      a > b -> :gt
      true -> :lt
    end
  end

  def is_in_range(x, min, max) do
    x >= min and x <= max
  end
end
