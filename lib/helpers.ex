defmodule Helpers do
  def input(star) do
    Path.join("inputs", star) |> File.read!()
  end

  def stream_input(star) do
    Path.join("inputs", star) |> File.stream!()
  end

  def to_int_list(input) do
    String.trim(input)
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
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
