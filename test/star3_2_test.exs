defmodule StarThreeTwoTest do
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

    assert StarThreeTwo.multi_collisions(example_input) == 336
  end

  test "Final Answer" do
    assert StarThreeTwo.run() == 1_478_615_040
  end
end
