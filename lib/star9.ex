defmodule Star9 do
  def find_invalid_num(ints, count) do
    {xs, [target | _]} = Enum.split(ints, count)

    case SumPair.find_pair(xs, target) do
      nil -> target
      {_, _} -> find_invalid_num(tl(ints), count)
    end
  end

  defp contiguous_sum([x | tail], target, acc) do
    new_acc = [x | acc]

    case Comparable.compare(Enum.sum(new_acc), target) do
      :gt -> nil
      :eq -> new_acc
      :lt -> contiguous_sum(tail, target, new_acc)
    end
  end

  def find_contiguous_sum(ints, target) do
    case contiguous_sum(ints, target, []) do
      nil -> find_contiguous_sum(tl(ints), target)
      sum_list -> sum_list
    end
  end

  def silver(ints) do
    ints |> find_invalid_num(25)
  end

  def gold(ints) do
    invalid = silver(ints)
    invalid_sum = find_contiguous_sum(ints, invalid)
    Enum.min(invalid_sum) + Enum.max(invalid_sum)
  end
end
