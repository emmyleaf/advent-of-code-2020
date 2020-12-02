defmodule StarTwoOne do
  import Helpers

  @regex ~r/^(?<min>\d+)-(?<max>\d+) (?<char>[a-z]): (?<pass>[a-z]+)/

  defp is_valid_password(line) do
    caps = Regex.named_captures(@regex, line)
    min = String.to_integer(caps["min"])
    max = String.to_integer(caps["max"])

    caps["pass"]
    |> String.codepoints()
    |> Enum.count(fn c -> c == caps["char"] end)
    |> is_in_range(min, max)
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
