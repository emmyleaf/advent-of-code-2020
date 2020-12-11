defmodule Star11 do
  @directions [
    {-1, -1},
    {0, -1},
    {1, -1},
    {-1, 0},
    {1, 0},
    {-1, 1},
    {0, 1},
    {1, 1}
  ]

  defp add_seat_line_to_map({line, y}, line_acc) do
    String.to_charlist(line)
    |> Enum.with_index()
    |> Enum.reduce(line_acc, fn
      {?L, x}, acc -> Map.put(acc, {x, y}, :empty)
      {?., x}, acc -> Map.put(acc, {x, y}, :floor)
    end)
  end

  defp to_seat_map(lines) do
    Enum.with_index(lines)
    |> Enum.reduce(%{}, &add_seat_line_to_map/2)
  end

  defp adjacent_occupied(seat_map, {x, y}) do
    @directions
    |> Enum.count(fn {dx, dy} -> Map.get(seat_map, {x + dx, y + dy}) == :occupied end)
  end

  defp see_occupied_in_dir?(seat_map, {dx, dy}, {x, y}) do
    new_index = {x + dx, y + dy}

    case(Map.get(seat_map, new_index)) do
      :occupied -> true
      :floor -> see_occupied_in_dir?(seat_map, {dx, dy}, new_index)
      _ -> false
    end
  end

  defp visible_occupied(seat_map, index) do
    @directions
    |> Enum.count(fn dir -> see_occupied_in_dir?(seat_map, dir, index) end)
  end

  defp process_until_stable(seat_map, occupied_func, occupied_threshold) do
    new_map =
      Enum.reduce(seat_map, seat_map, fn {index, state}, acc_map ->
        case {state, occupied_func.(seat_map, index)} do
          {:empty, 0} -> Map.put(acc_map, index, :occupied)
          {:occupied, x} when x >= occupied_threshold -> Map.put(acc_map, index, :empty)
          _ -> acc_map
        end
      end)

    if new_map == seat_map,
      do: new_map,
      else: process_until_stable(new_map, occupied_func, occupied_threshold)
  end

  def silver(lines) do
    lines
    |> to_seat_map()
    |> process_until_stable(&adjacent_occupied/2, 4)
    |> Enum.count(fn {_, state} -> state == :occupied end)
  end

  def gold(lines) do
    lines
    |> to_seat_map()
    |> process_until_stable(&visible_occupied/2, 5)
    |> Enum.count(fn {_, state} -> state == :occupied end)
  end
end
