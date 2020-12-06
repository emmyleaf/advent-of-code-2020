defmodule StarFiveAltTest do
  use ExUnit.Case

  test "Examples" do
    assert StarFiveAlt.find_seat("FBFBBFFRLR") == 357
    assert StarFiveAlt.find_seat("BFFFBBFRRR") == 567
    assert StarFiveAlt.find_seat("FFFBBBFRRR") == 119
    assert StarFiveAlt.find_seat("BBFFBBFRLL") == 820
  end

  test "Final Answer - Silver" do
    assert StarFiveAlt.silver() == 806
  end

  test "Final Answer - Gold" do
    assert StarFiveAlt.gold() == 562
  end
end
