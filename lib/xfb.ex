defmodule Xfb do
  @moduledoc """
  Documentation for Xfb.
  """

  @doc """
  Gets the FB value at the given numbers

  ## Examples

      iex> Xfb.at(1)
      "1"

      iex> Xfb.at(2)
      "2"

      iex> Xfb.at(3)
      "fizz"

      iex> Xfb.at(5)
      "buzz"

      iex> Xfb.at(6)
      "fizz"

      iex> Xfb.at(10)
      "buzz"

      iex> Xfb.at(15)
      "fizzbuzz"

      iex> Xfb.at(30)
      "fizzbuzz"

  """
  def at(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} ->
        "fizzbuzz"
      {0, _} ->
        "fizz"
      {_, 0} ->
        "buzz"
      _ ->
        "#{n}" 
    end
  end

  @doc """
  Gets the sequence til the given number inclusive

  ## Examples

      iex> Xfb.until(-1)
      {:error, "invalid number"}

      iex> Xfb.until(0)
      {:error, "invalid number"}

      iex> Xfb.until(6)
      ["1", "2", "fizz", "4", "buzz", "fizz"]

  """
  def until(n) when n < 1, do: {:error, "invalid number"}

  def until(n),
    do:
      1..n
      |> Enum.map(&at/1)
end
