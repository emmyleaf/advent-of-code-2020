defmodule Star9Test do
  use ExUnit.Case

  @example_input [
    35,
    20,
    15,
    25,
    47,
    40,
    62,
    55,
    65,
    95,
    102,
    117,
    150,
    182,
    127,
    219,
    299,
    277,
    309,
    576
  ]

  test "Examples - Silver" do
    assert Star9.find_invalid_num(@example_input, 5) == 127
  end

  test "Examples - Gold" do
    assert Star9.find_contiguous_sum(@example_input, 127) == [40, 47, 25, 15]
  end

  test "Final Answer - Silver" do
    assert Star9.silver(Inputs.ints("star9")) == 731_031_916
  end

  test "Final Answer - Gold" do
    assert Star9.gold(Inputs.ints("star9")) == 93_396_727
  end
end
