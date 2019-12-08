[![Hex version badge](https://img.shields.io/hexpm/v/chunky.svg)](https://hex.pm/packages/chunky)
[![License badge](https://img.shields.io/hexpm/l/chunky.svg)](https://github.com/patricknevindwyer/chunky/blob/master/LICENSE)

# Chunky

Chunking and Enumeration manipulations in Elixir.

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

iex> Chunky.permutations(1..4)
[ 
  [1, 2, 3, 4],
  [1, 2, 4, 3],
  [1, 3, 2, 4],
  [1, 3, 4, 2],
  [1, 4, 2, 3],
  [1, 4, 3, 2],
  ...
]
```

## Installation

Install by adding `chunky` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chunky, "~> 0.1.0"}
  ]
end
```

Chunky documentation can be found on Hexdocs at [https://hexdocs.pm/chunky](https://hexdocs.pm/chunky).

