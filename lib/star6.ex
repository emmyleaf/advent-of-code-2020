defmodule StarSix do
  def unique_answers(group) do
    group
    |> String.split()
    |> Stream.flat_map(&String.to_charlist/1)
    |> Stream.uniq()
    |> Enum.count()
  end

  def sum_unique_answers(string) do
    string
    |> String.split("\n\n")
    |> Stream.map(&unique_answers/1)
    |> Enum.sum()
  end

  def unanimous_answers(group) do
    group
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> Enum.count()
  end

  def sum_unanimous_answers(string) do
    string
    |> String.split("\n\n")
    |> Stream.map(&unanimous_answers/1)
    |> Enum.sum()
  end

  def silver do
    Inputs.string("star6") |> sum_unique_answers()
  end

  def gold do
    Inputs.string("star6") |> sum_unanimous_answers()
  end
end
