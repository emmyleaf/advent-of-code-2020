defmodule StarThreeTest do
  use ExUnit.Case

  @example_input [
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#"
  ]

  test "Example - Silver" do
    assert StarThree.tree_collisions(@example_input, {3, 1}) == 7
  end

  test "Example - Gold" do
    assert StarThree.multi_collisions(@example_input) == 336
  end

  test "Final Answer - Silver" do
    assert StarThree.silver() == 191
  end

  test "Final Answer - Gold" do
    assert StarThree.gold() == 1_478_615_040
  end
end
