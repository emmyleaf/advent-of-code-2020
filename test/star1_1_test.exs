defmodule StarOneOneTest do
  use ExUnit.Case

  test "Example" do
    example_input = [1721, 979, 366, 299, 675, 1456]
    assert StarOneOne.find_pair(example_input) == 514_579
  end

  test "Final Answer" do
    assert StarOneOne.run() == 864_864
  end
end
