defmodule Star8Test do
  use ExUnit.Case

  @example_input [
    "nop +0",
    "acc +1",
    "jmp +4",
    "acc +3",
    "jmp -3",
    "acc -99",
    "acc +1",
    "jmp -4",
    "acc +6"
  ]

  test "Example - Silver" do
    assert Star8.silver(@example_input) == 5
  end

  test "Example - Gold" do
    assert Star8.gold(@example_input) == 8
  end

  test "Final Answer - Silver" do
    assert Star8.silver(Inputs.trimmed_lines("star8")) == 1797
  end

  test "Final Answer - Gold" do
    assert Star8.gold(Inputs.trimmed_lines("star8")) == 1036
  end
end
