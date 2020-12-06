defmodule StarTwo do
  def silver_validator(line) do
    regex = ~r/^(?<min>\d+)-(?<max>\d+) (?<char>[a-z]): (?<pass>[a-z]+)/
    caps = Regex.named_captures(regex, line)
    min = String.to_integer(caps["min"])
    max = String.to_integer(caps["max"])

    caps["pass"]
    |> String.codepoints()
    |> Enum.count(fn c -> c == caps["char"] end)
    |> Comparable.is_in_range(min, max)
  end

  def gold_validator(line) do
    regex = ~r/^(?<pos1>\d+)-(?<pos2>\d+) (?<char>[a-z]): (?<pass>[a-z]+)/
    caps = Regex.named_captures(regex, line)
    pos1 = String.to_integer(caps["pos1"]) - 1
    pos2 = String.to_integer(caps["pos2"]) - 1

    match1 = String.at(caps["pass"], pos1) == caps["char"]
    match2 = String.at(caps["pass"], pos2) == caps["char"]

    match1 != match2
  end

  def silver do
    Inputs.trimmed_lines("star2") |> Enum.count(&silver_validator/1)
  end

  def gold do
    Inputs.trimmed_lines("star2") |> Enum.count(&gold_validator/1)
  end
end
