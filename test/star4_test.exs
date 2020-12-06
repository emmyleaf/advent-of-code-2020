defmodule StarFourTest do
  use ExUnit.Case

  test "Final Answer - Silver" do
    assert StarFour.silver() == 190
  end

  test "Final Answer - Gold" do
    assert StarFour.gold() == 121
  end
end
