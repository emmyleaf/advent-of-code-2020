defmodule StarThreeOneTest do
  use ExUnit.Case

  test "Example" do
    example_input = [
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

    assert StarThreeOne.tree_collisions(example_input) == 7
  end

  test "Final Answer" do
    assert StarThreeOne.run() == 191
  end
end
