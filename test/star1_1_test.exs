defmodule StarOneOneTest do
  use ExUnit.Case

  test "Example" do
    example_input = [1721, 979, 366, 299, 675, 1456]
    assert StarOneOne.find_sum_pair(example_input) == 514_579
  end
end
