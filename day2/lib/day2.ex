defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def main(_args) do
    {:ok, input} = File.read "challenge2.input"
    items = String.split(input, "\n")

    items 
    |> Enum.filter(fn x -> String.length(x) != 0 end)
    |> IO.inspect
  end

  @doc """
  Hello world.

  ## Examples

      iex> Day2.hello()
      :world

  """
  def hello do
    :world
  end
end
