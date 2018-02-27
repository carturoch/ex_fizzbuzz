use ExUnitProperties

defmodule XfbTest do
  use ExUnit.Case
  import Xfb, only: [at: 1]

  doctest Xfb

  property "at returns fizz for multiples of 3" do
    check all num <- multiples_of(3), max_runs: 10_000 do
      assert at(num) |> String.contains?("fizz")
    end
  end

  property "at returns buzz for multiples of 5" do
    check all num <- multiples_of(5), max_runs: 10_000 do
      assert at(num) |> String.contains?("buzz")
    end
  end

  property "at returns fizzbuzz for multiples of 3 and 5" do
    check all num <- multiples_of(15), max_runs: 10_000 do
      assert at(num) == "fizzbuzz"
    end
  end

  defp multiples_of(n) do
    gen all num <-
              StreamData.integer()
              |> StreamData.map(&(&1 * n))
              |> StreamData.filter(&(&1 > 0)) do
      num
    end
  end
end
