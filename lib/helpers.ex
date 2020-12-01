defmodule Helpers do
  def input(star) do
    Path.join("inputs", star) |> File.read!()
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
end
