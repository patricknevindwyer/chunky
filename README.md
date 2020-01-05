[![Hex version badge](https://img.shields.io/hexpm/v/chunky.svg)](https://hex.pm/packages/chunky)
[![License badge](https://img.shields.io/hexpm/l/chunky.svg)](https://github.com/patricknevindwyer/chunky/blob/master/LICENSE)

# Chunky

Fractions, Sequences, 2D Grids, and Enumeration manipulations in Elixir.

```elixir
iex> Chunky.permutations("😀🤷🏽‍♀️⭐️")
[
  "😀🤷🏽‍♀️⭐️", 
  "😀⭐️🤷🏽‍♀️", 
  "🤷🏽‍♀️😀⭐️", 
  "🤷🏽‍♀️⭐️😀", 
  "⭐️😀🤷🏽‍♀️", 
  "⭐️🤷🏽‍♀️😀"
]

iex> Chunky.Math.is_prime?(30762542250301270692051460539586166927291732754961)
true

iex> Chunky.combinations(1..4, 3)
[[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]

iex> Chunky.Sequence.create(Chunky.Sequence.OEIS, :a000045) |> Chunky.Sequence.take!(10)
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

iex> Chunky.Fraction.power(Chunky.Fraction.new(7, 32), Chunky.Fraction.new(30, 5))
%Chunky.Fraction{num: 117649, den: 1073741824}

iex> Chunky.Fraction.power(Chunky.Fraction.new(7, 32), Chunky.Fraction.new(30, 5)) |> IO.puts()
117649/1073741824

iex> Chunky.Math.prime_factors(3217644767340672907899084554130)
[1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79]

```

## Installation

Install by adding `chunky` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chunky, "~> 0.11.1"}
  ]
end
```

Chunky documentation can be found on Hexdocs at [https://hexdocs.pm/chunky](https://hexdocs.pm/chunky).


## Documentation

 - [Fractions](https://hexdocs.pm/chunky/Chunky.Fraction.html#content)
 - [Math](https://hexdocs.pm/chunky/Chunky.Math.html#content)
 - [Sequences](https://hexdocs.pm/chunky/Chunky.Sequences.html#content)
 - [Combinitorics](https://hexdocs.pm/chunky/Chunky.html#content)
