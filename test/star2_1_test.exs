defmodule StarTwoOneTest do
  use ExUnit.Case

  test "Example" do
    example_input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"
    ]

    assert StarTwoOne.find_valid_passwords(example_input) == 2
  end

  test "Final Answer" do
    assert StarTwoOne.run() == 454
  end
end
