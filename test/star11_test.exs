defmodule Star11Test do
  use ExUnit.Case

  @example_input [
    "L.LL.LL.LL",
    "LLLLLLL.LL",
    "L.L.L..L..",
    "LLLL.LL.LL",
    "L.LL.LL.LL",
    "L.LLLLL.LL",
    "..L.L.....",
    "LLLLLLLLLL",
    "L.LLLLLL.L",
    "L.LLLLL.LL"
  ]

  test "Example - Silver" do
    assert Star11.silver(@example_input) == 37
  end

  test "Example - Gold" do
    assert Star11.gold(@example_input) == 26
  end

  test "Final Answer - Silver" do
    assert Star11.silver(Inputs.trimmed_lines("star11")) == 2406
  end

  test "Final Answer - Gold" do
    assert Star11.gold(Inputs.trimmed_lines("star11")) == 2149
  end
end
