defmodule Chunky.Math.Operations do
  @moduledoc """
  The Operations module provides functions and macros for making particular repeated
  operations and series easier to work with. Most of these are just simplifications
  around enumerations over values, with support for either Integer or Fraction values.

  To use the macro operations, you need to `require Chunky.Math.Operations` first, and
  then you can import specific operations, like `import Chunky.Math.Operations, only: [summation: 3]`.
  """

  alias Chunky.Fraction

  @doc """
  Run a summation across an expression. Any `key` or variable name can be used, along
  with a range and an expression:

  ```elixir
  # simple summations of `2k + 1` over the range of 1 to 10
  summation k, 1..10 do
      k * 2 + 1
  end
  ```

  Summations can also be nested:

  ```elixir
  # find y^2 + x + 1 over a 2 dimensional range
  summation x, 5..50 do
      summation y, 3..30 do
          y * y + x + 1
      end
  end 
  ```

  If Fraction values are detected, they will be automatically handled as well:

  ```elixir
  # Sum the fraction series 1/n for 1/1 to 1/100
  summation den, 1..100 do
      Fraction.new(1, den)
  end
  ```

  Any enumerable can be passed to summation:

  ```elixir
  # sum the divisors of 100
  summation k, Math.factors(100) do
      k
  end
  ```

  """
  defmacro summation(key, range, do: expression) do
    quote do
      unquote(range)
      |> Enum.map(fn k_a ->
        var!(unquote(key)) = k_a
        unquote(expression)
      end)
      |> Enum.reduce(
        0,
        fn v, acc ->
          case v do
            # we're summing fractions. 
            %Fraction{} -> Fraction.add(v, acc)
            # integers...
            _ -> v + acc
          end
        end
      )
    end
  end

  @doc """
  Run a product across an expression. Any `key` or variable name can be used, along
  with a range and an expression:

  ```elixir
  # 1 * 2 * 3 * 4 * ... * 100
  product k, 1..100 do
      k
  end
  ```

  Products can be nested:

  ```elixir
  # Step product of `j^3 + k^2 + 3`
  product k, 2..6 do
      product j, k..10 do
          j * j * j + k * k + 3
      end
  end
  ```

  Fractions are also supported:

  ```elixir
  # fractional series of 1/2 * 2/3 * ... 100/101
  product k, 1..100 do
      Fraction.new(k, k + 1)
  end
  ```

  Any enumerable can be passed to product:

  ```elixir
  # multiply the divisors of 100
  product k, Math.factors(100) do
      k
  end
  ```

  """
  defmacro product(key, range, do: expression) do
    quote do
      unquote(range)
      |> Enum.map(fn k_a ->
        var!(unquote(key)) = k_a
        unquote(expression)
      end)
      # |> Enum.sum()
      |> Enum.reduce(
        1,
        fn v, acc ->
          case v do
            # we're running a product over fractions. 
            %Fraction{} -> Fraction.multiply(v, acc)
            # integers...
            _ -> v * acc
          end
        end
      )
    end
  end
end
