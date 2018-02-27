defmodule Xfb do
  @moduledoc """
  Documentation for Xfb.
  """

  defguard is_divisible_by(n, d) when rem(n, d) == 0

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
  def at(n) when is_divisible_by(n, 15), do: "fizzbuzz"
  def at(n) when is_divisible_by(n, 3), do: "fizz"
  def at(n) when is_divisible_by(n, 5), do: "buzz"
  def at(n), do: "#{n}"

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
