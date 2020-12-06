defmodule StarOneTest do
  use ExUnit.Case

  @example_input [1721, 979, 366, 299, 675, 1456]

  test "Example - Silver" do
    assert StarOne.find_2020_pair(@example_input) == 514_579
  end

  test "Example - Gold" do
    assert StarOne.find_trip(@example_input) == 241_861_950
  end

  test "Final Answer - Silver" do
    assert StarOne.silver() == 864_864
  end

  test "Final Answer - Gold" do
    assert StarOne.gold() == 281_473_080
  end
end
