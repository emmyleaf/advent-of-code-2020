defmodule Star8 do
  defp parse_inst(line) do
    [inst, arg] = String.split(line)
    {String.to_atom(inst), String.to_integer(arg)}
  end

  defp parse_code(lines) do
    lines |> Enum.map(&parse_inst/1) |> :array.from_list()
  end

  defp find_loop(code, acc, pc, hist) do
    if pc in hist do
      {:loop, acc, pc, hist}
    else
      case :array.get(pc, code) do
        {:nop, _} -> find_loop(code, acc, pc + 1, [pc | hist])
        {:jmp, arg} -> find_loop(code, acc, pc + arg, [pc | hist])
        {:acc, arg} -> find_loop(code, acc + arg, pc + 1, [pc | hist])
        :undefined -> {:ok, acc}
      end
    end
  end

  defp find_acc_before_loop(code) do
    {:loop, acc, _, _} = find_loop(code, 0, 0, [])
    acc
  end

  defp test_halts(code) do
    case find_loop(code, 0, 0, []) do
      {:loop, _, _, _} -> false
      {:ok, acc} -> acc
    end
  end

  defp fix_loop(code) do
    {:loop, _, _, hist} = find_loop(code, 0, 0, [])

    Enum.find_value(hist, fn pc ->
      case :array.get(pc, code) do
        {:nop, arg} -> :array.set(pc, {:jmp, arg}, code) |> test_halts()
        {:jmp, arg} -> :array.set(pc, {:nop, arg}, code) |> test_halts()
        {:acc, _} -> false
      end
    end)
  end

  def silver(lines) do
    lines |> parse_code() |> find_acc_before_loop()
  end

  def gold(lines) do
    lines |> parse_code() |> fix_loop()
  end
end
