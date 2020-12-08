defmodule StarSeven do
  defp to_bag_rule(line) do
    [top_bag, rest] = String.split(line, " bags contain ")

    contents =
      Regex.scan(~r/(\d) (\w+ \w+)/, rest)
      |> Enum.into(%{}, fn [_, n, bag] -> {bag, String.to_integer(n)} end)

    {top_bag, contents}
  end

  defp count_containing(bags, types) do
    {matching, non_matching} =
      Enum.split_with(bags, fn {_, contents} ->
        Enum.any?(types, &Map.has_key?(contents, &1))
      end)

    case Enum.map(matching, fn {bag, _} -> bag end) do
      [] -> Enum.count(types) - 1
      containing -> count_containing(non_matching, types ++ containing)
    end
  end

  defp count_contents(bags, type) do
    Map.get(bags, type)
    |> Map.to_list()
    |> Enum.map(fn {bag, num} -> num + num * count_contents(bags, bag) end)
    |> Enum.sum()
  end

  def count_shiny_gold(lines) do
    lines |> Stream.map(&to_bag_rule/1) |> count_containing(["shiny gold"])
  end

  def shiny_gold_contents(lines) do
    lines |> Enum.into(%{}, &to_bag_rule/1) |> count_contents("shiny gold")
  end

  def silver do
    Inputs.trimmed_lines("star7") |> count_shiny_gold()
  end

  def gold do
    Inputs.trimmed_lines("star7") |> shiny_gold_contents()
  end
end
