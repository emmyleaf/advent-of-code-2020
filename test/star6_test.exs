defmodule StarSixTest do
  use ExUnit.Case

  @example_input """
  abc

  a
  b
  c

  ab
  ac

  a
  a
  a
  a

  b
  """

  test "Examples - Silver" do
    assert StarSix.unique_answers("abcx abcy abcz") == 6
    assert StarSix.sum_unique_answers(@example_input) == 11
  end

  test "Examples - Gold" do
    assert StarSix.unanimous_answers("abcx\nabcy\nabcz") == 3
    assert StarSix.sum_unanimous_answers(@example_input) == 6
  end

  test "Final Answer - Silver" do
    assert StarSix.silver() == 6775
  end

  test "Final Answer - Gold" do
    assert StarSix.gold() == 3356
  end
end
