defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  def main(_args) do
    {:ok, input} = File.read "challenge1.input"
    items = String.split(input, "\n")

    items 
    |> Enum.filter(fn x -> String.length(x) != 0 end)
    |> Day1.times(200)
    |> Enum.map(&extract_item/1) 
    |> Enum.reduce([], &mod_redux/2) 
    |> Enum.reverse
    |> Day1.find_dup_freq([])
    |> IO.puts
    #|> Enum.each(&IO.puts/1)
  end

  def extract_item(item) do
    sign = String.slice(item, 0..0)
    mag = case Integer.parse(String.slice(item, 1..-1)) do
      { num, _ } -> num
      _ -> :error
    end

    case sign do
      "-" -> { :neg, mag }
      "+" -> { :pos, mag }
      _ -> { :error }
    end
  end

  def redux(x, acc) do
    case x do
      { :pos, mag } -> acc + mag
      { :neg, mag } -> acc - mag
      _ -> :error
    end
  end

  def mod_redux(x, []) do
    case x do
      { :pos, mag } -> [0 + mag]
      { :neg, mag } -> [0 - mag]
      _ -> :error
    end
  end

  def mod_redux(x, [head | tail]) do
    case x do
      { :pos, mag } -> [ head + mag, head ] ++ tail
      { :neg, mag } -> [ head - mag, head ] ++ tail
      _ -> :error
    end
  end

  def find_dup_freq([], _) do
    nil
  end

  def find_dup_freq([freq | next], seen) do
    if Enum.member? seen, freq do
      freq
    else
      find_dup_freq(next, [ freq ] ++ seen)
    end
  end

  def times(li, 1) do
    li
  end

  def times(li, n) do
    li ++ times(li, n-1)
  end
end
