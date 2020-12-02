defmodule StarTwoTwoTest do
  use ExUnit.Case

  test "Example" do
    example_input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"
    ]

    assert StarTwoTwo.find_valid_passwords(example_input) == 1
  end

  test "Final Answer" do
    assert StarTwoTwo.run() == 649
  end
end
