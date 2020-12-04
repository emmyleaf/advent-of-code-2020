defmodule StarFourOne do
  @regex ~r/(byr|iyr|eyr|hgt|hcl|ecl|pid|cid):(\S+)/

  defp collect_passport_fields(line) do
    Regex.scan(@regex, line, capture: :all_but_first)
    |> Enum.into(%{}, fn [k, v] -> {k, v} end)
  end

  defp is_valid_passport(map) do
    ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    |> Enum.all?(&Map.has_key?(map, &1))
  end

  def valid_passports(lines) do
    lines
    |> Stream.chunk_by(fn line -> line == "\n" end)
    |> Stream.take_every(2)
    |> Stream.map(&Enum.join(&1, " "))
    |> Stream.map(&collect_passport_fields/1)
    |> Enum.count(&is_valid_passport/1)
  end

  def run do
    Inputs.stream("star4_1") |> valid_passports()
  end
end
