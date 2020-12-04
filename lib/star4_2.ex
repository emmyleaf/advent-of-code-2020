defmodule StarFourTwo do
  defp collect_passport_fields(line) do
    ~r/(byr|iyr|eyr|hgt|hcl|ecl|pid|cid):(\S+)/
    |> Regex.scan(line, capture: :all_but_first)
    |> Enum.into(%{}, fn [k, v] -> {k, v} end)
  end

  defp keys_present(map) do
    ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    |> Enum.all?(&Map.has_key?(map, &1))
  end

  defp is_valid_passport(map) do
    byr_valid = map["byr"] |> String.to_integer() |> Comparable.is_in_range(1920, 2002)
    iyr_valid = map["iyr"] |> String.to_integer() |> Comparable.is_in_range(2010, 2020)
    eyr_valid = map["eyr"] |> String.to_integer() |> Comparable.is_in_range(2020, 2030)

    hgt_valid =
      case Regex.run(~r/(\d+)(cm|in)/, map["hgt"]) do
        [_, x, "cm"] -> x |> String.to_integer() |> Comparable.is_in_range(150, 193)
        [_, x, "in"] -> x |> String.to_integer() |> Comparable.is_in_range(59, 76)
        nil -> false
      end

    hcl_valid = map["hcl"] =~ ~r/^#[0-9a-f]{6}$/
    ecl_valid = map["ecl"] =~ ~r/^amb|blu|brn|gry|grn|hzl|oth$/
    pid_valid = map["pid"] =~ ~r/^\d{9}$/

    byr_valid and iyr_valid and eyr_valid and hgt_valid and hcl_valid and ecl_valid and pid_valid
  end

  def run(file) do
    Inputs.stream(file)
    |> Stream.chunk_by(fn line -> line == "\n" end)
    |> Stream.take_every(2)
    |> Stream.map(&Enum.join(&1, " "))
    |> Stream.map(&collect_passport_fields/1)
    |> Stream.filter(&keys_present/1)
    |> Enum.count(&is_valid_passport/1)
  end
end
