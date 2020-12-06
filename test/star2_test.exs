defmodule StarTwoTest do
  use ExUnit.Case

  test "Examples - Silver" do
    assert StarTwo.silver_validator("1-3 a: abcde") == true
    assert StarTwo.silver_validator("1-3 b: cdefg") == false
    assert StarTwo.silver_validator("2-9 c: ccccccccc") == true
  end

  test "Examples - Gold" do
    assert StarTwo.gold_validator("1-3 a: abcde") == true
    assert StarTwo.gold_validator("1-3 b: cdefg") == false
    assert StarTwo.gold_validator("2-9 c: ccccccccc") == false
  end

  test "Final Answer - Silver" do
    assert StarTwo.silver() == 454
  end

  test "Final Answer - Gold" do
    assert StarTwo.gold() == 649
  end
end
