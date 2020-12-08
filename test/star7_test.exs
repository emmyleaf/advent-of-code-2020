defmodule StarSevenTest do
  use ExUnit.Case

  @example_input1 [
    "light red bags contain 1 bright white bag, 2 muted yellow bags.",
    "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
    "bright white bags contain 1 shiny gold bag.",
    "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
    "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
    "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
    "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
    "faded blue bags contain no other bags.",
    "dotted black bags contain no other bags."
  ]

  @example_input2 [
    "shiny gold bags contain 2 dark red bags.",
    "dark red bags contain 2 dark orange bags.",
    "dark orange bags contain 2 dark yellow bags.",
    "dark yellow bags contain 2 dark green bags.",
    "dark green bags contain 2 dark blue bags.",
    "dark blue bags contain 2 dark violet bags.",
    "dark violet bags contain no other bags."
  ]

  test "Examples - Silver" do
    assert StarSeven.count_shiny_gold(@example_input1) == 4
  end

  test "Examples - Gold" do
    assert StarSeven.shiny_gold_contents(@example_input1) == 32
    assert StarSeven.shiny_gold_contents(@example_input2) == 126
  end

  test "Final Answer - Silver" do
    assert StarSeven.silver() == 252
  end

  test "Final Answer - Gold" do
    assert StarSeven.gold() == 35487
  end
end
