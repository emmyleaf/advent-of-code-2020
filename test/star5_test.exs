defmodule StarFiveTest do
  use ExUnit.Case

  test "Examples" do
    assert StarFive.find_seat("FBFBBFFRLR") == 357
    assert StarFive.find_seat("BFFFBBFRRR") == 567
    assert StarFive.find_seat("FFFBBBFRRR") == 119
    assert StarFive.find_seat("BBFFBBFRLL") == 820
  end

  test "Final Answer - Silver" do
    assert StarFive.silver() == 806
  end

  test "Final Answer - Gold" do
    assert StarFive.gold() == 562
  end
end
