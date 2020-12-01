defmodule StarOneTwoTest do
  use ExUnit.Case

  test "Example" do
    example_input = [1721, 979, 366, 299, 675, 1456]
    assert StarOneTwo.find_trip(example_input) == 241_861_950
  end

  test "Final Answer" do
    assert StarOneTwo.run() == 281_473_080
  end
end
