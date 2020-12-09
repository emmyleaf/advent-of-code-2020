defprotocol Comparable do
  @fallback_to_any true
  def compare(a, b)
  def is_in_range(x, min, max)
end

defimpl Comparable, for: Any do
  def compare(a, b) do
    cond do
      a == b -> :eq
      a > b -> :gt
      true -> :lt
    end
  end

  def is_in_range(x, min, max) do
    x >= min and x <= max
  end
end
