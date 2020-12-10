defmodule Star10Test do
  use ExUnit.Case

  @example_input1 [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]
  @example_input2 [
    28,
    33,
    18,
    42,
    31,
    14,
    46,
    20,
    48,
    47,
    24,
    23,
    49,
    45,
    19,
    38,
    39,
    11,
    1,
    32,
    25,
    35,
    8,
    17,
    7,
    9,
    4,
    2,
    34,
    10,
    3
  ]

  test "Examples - Silver" do
    assert Star10.silver(@example_input1) == 35
    assert Star10.silver(@example_input2) == 220
  end

  # test "Examples - Gold" do
  #   assert Star10.find_contiguous_sum(@example_input, 127) == [40, 47, 25, 15]
  # end

  test "Final Answer - Silver" do
    assert Star10.silver(Inputs.ints("star10")) == 2080
  end

  # test "Final Answer - Gold" do
  #   assert Star10.gold(Inputs.ints("star10")) == 0
  # end
end
