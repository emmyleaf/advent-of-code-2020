defmodule StarFiveOneTest do
  use ExUnit.Case

  test "Examples" do
    assert StarFiveOne.find_seat("FBFBBFFRLR") == 357
    assert StarFiveOne.find_seat("BFFFBBFRRR") == 567
    assert StarFiveOne.find_seat("FFFBBBFRRR") == 119
    assert StarFiveOne.find_seat("BBFFBBFRLL") == 820
  end

  test "Final Answer" do
    assert StarFiveOne.run() == 806
  end
end
