defmodule StarTwoTwo do
  import Helpers

  @regex ~r/^(?<pos1>\d+)-(?<pos2>\d+) (?<char>[a-z]): (?<pass>[a-z]+)/

  defp is_valid_password(line) do
    caps = Regex.named_captures(@regex, line)
    pos1 = String.to_integer(caps["pos1"]) - 1
    pos2 = String.to_integer(caps["pos2"]) - 1

    match1 = String.at(caps["pass"], pos1) == caps["char"]
    match2 = String.at(caps["pass"], pos2) == caps["char"]

    match1 != match2
  end

  def find_valid_passwords(lines) do
    lines
    |> Enum.map(&String.trim/1)
    |> Enum.count(&is_valid_password/1)
  end

  def run do
    stream_input("star2_1") |> find_valid_passwords()
  end
end
