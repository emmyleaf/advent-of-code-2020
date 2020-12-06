defmodule Inputs do
  @spec string(binary) :: binary
  def string(star) do
    Path.join("inputs", star) |> File.read!()
  end

  @spec lines(binary) :: File.Stream.t(binary)
  def lines(star) do
    Path.join("inputs", star) |> File.stream!()
  end

  @spec trimmed_lines(binary) :: Stream.t(binary)
  def trimmed_lines(star) do
    lines(star) |> Stream.map(&String.trim/1)
  end

  @spec ints(binary) :: Stream.t(integer)
  def ints(star) do
    trimmed_lines(star) |> Stream.map(&String.to_integer/1)
  end
end
