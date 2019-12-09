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

iex> Chunky.chunk_length(10_000..10_100, 7)
[
  [10000, 10001, 10002, 10003, 10004, 10005, 10006],
  [10007, 10008, 10009, 10010, 10011, 10012, 10013],
  [10014, 10015, 10016, 10017, 10018, 10019, 10020],
  [10021, 10022, 10023, 10024, 10025, 10026, 10027],
  [10028, 10029, 10030, 10031, 10032, 10033, 10034], 
  [10035, 10036, 10037, 10038, 10039, 10040, 10041],
  [10042, 10043, 10044, 10045, 10046, 10047, 10048],
  [10049, 10050, 10051, 10052, 10053, 10054, 10055],
  [10056, 10057, 10058, 10059, 10060, 10061, 10062],
  [10063, 10064, 10065, 10066, 10067, 10068, 10069],
  [10070, 10071, 10072, 10073, 10074, 10075, 10076],
  [10077, 10078, 10079, 10080, 10081, 10082, 10083],
  [10084, 10085, 10086, 10087, 10088, 10089, 10090],
  [10091, 10092, 10093, 10094, 10095, 10096, 10097],
  [10098, 10099, 10100]
]
```

## Installation

Install by adding `chunky` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chunky, "~> 0.2.0"}
  ]
end
```

Chunky documentation can be found on Hexdocs at [https://hexdocs.pm/chunky](https://hexdocs.pm/chunky).


## Documentation

See [Chunky on Hexdocs](https://hexdocs.pm/chunky).
