[![Hex version badge](https://img.shields.io/hexpm/v/chunky.svg)](https://hex.pm/packages/chunky)
[![License badge](https://img.shields.io/hexpm/l/chunky.svg)](https://github.com/patricknevindwyer/chunky/blob/master/LICENSE)

# Chunky

Fractions, 2D Grids, and Enumeration manipulations in Elixir.

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

iex> Chunky.combinations(1..4, 3)
[[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]

iex> Chunky.Fraction.power(Chunky.Fraction.new(7, 32), Chunky.Fraction.new(30, 5))
%Chunky.Fraction{num: 117649, den: 1073741824}

iex> Chunky.Fraction.power(Chunky.Fraction.new(7, 32), Chunky.Fraction.new(30, 5)) |> IO.puts()
117649/1073741824

```

## Installation

Install by adding `chunky` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chunky, "~> 0.6.5"}
  ]
end
```

Chunky documentation can be found on Hexdocs at [https://hexdocs.pm/chunky](https://hexdocs.pm/chunky).


## Documentation

 - [Fractions](/chunky/Chunky.Fraction.html#content)
 - [Grids](https://hexdocs.pm/chunky/Chunky.Grid.html#content)
 - [Combinitorics](https://hexdocs.pm/chunky/Chunky.html#content)
