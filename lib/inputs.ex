defmodule Inputs do
  def stream(star) do
    Path.join("inputs", star) |> File.stream!()
  end

  def int_stream(star) do
    stream(star)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end
end
