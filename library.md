The Chunky library brings Fractions, Sequences, and extended Math functions
to elixir.

Install by adding `chunky` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chunky, "~> 0.11.5"}
  ]
end
```


# Fractions

Chunky features a Fractions module with common operations, conversions, and functionality
for creating and manipulating fractions.

Create fractions from just about anything:

```elixir
iex> Chunky.Fraction.new("1/3")
%Fraction{num: 1, den: 3}

iex> Chunky.Fraction.new(0.25)
%Fraction{num: 25, den: 100}

iex> Chunky.Fraction.new(22, 7)
%Fraction{num: 22, den: 7}
```

Use common math operations:

```elixir
iex> Chunky.Fraction.new(12, 7) |> Chunky.Fraction.add(1)
%Fraction{num: 22, den: 7}

iex> Chunky.Fraction.new("10/7") |> Chunky.Fraction.multiply(0.75) |> Chunky.Fraction.divide("3/57")
%Fraction{num: 42750, den: 2100}
```

take integer or fractional powers of fractions or integers:

```elixir
iex> Chunky.Fraction.power(16, Chunky.Fraction.new("1/4"))
%Fraction{num: 2, den: 1}
```

See `Chunky.Fraction` for more.

# Sequences

Chunky makes it easy to work with finite and infinite sequences, with built in manipulation functions and
sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org).

For instance, take the 100-th through 109-th prime numbers:

```elixir
iex> Chunky.Sequence.create(Chunky.Sequence.OEIS.Core, :a000040) |> Chunky.Sequence.drop(100) |> Chunky.Sequence.take!(10)
[547, 557, 563, 569, 571, 577, 587, 593, 599, 601]
```

or get the first 20 values of Ramanujan's Tau sequence:

```elixir
iex> Chunky.Sequence.create(Chunky.Sequence.OEIS.Core, :a000594) |> Chunky.Sequence.take!(20)
[1, -24, 252, -1472, 4830, -6048, -16744, 84480, -113643, -115920, 534612, -370944, -577738, 401856, 1217160, 987136, -6905934, 2727432, 10661420, -7109760]
```

See `Chunky.Sequence` for more about creating and manipulating sequences. Or find specific sequences to work with
in:

 - `Chunky.Sequence.OEIS.Combinatorics` - Permutations, Combinations, and general Combinatorics sequences
 - `Chunky.Sequence.OEIS.Constants` - Constant values, digit expansions, and constant cycles
 - `Chunky.Sequence.OEIS.Core` - The OEIS [Core](https://oeis.org/search?q=keyword%3Acore) sequences.
 - `Chunky.Sequence.OEIS.Factors` - OEIS non-core sequences dealing with integer factors and factorization
 - `Chunky.Sequence.OEIS.Multiples` - Multiples and addition sequences
 - `Chunky.Sequence.OEIS.Powers` - OEIS non-core sequences dealing with powers and simple polynomials
 - `Chunky.Sequence.OEIS.Primes` - OEIS non-core sequences dealing with primes
 - `Chunky.Sequence.OEIS.Repr` - Number representations, digit contents, and digit patterns
 - `Chunky.Sequence.OEIS.Sigma` - OEIS non-core sequences related to the Sigma functions


# Math

Chunky provides a large selection of pure integer (and a few fraction and float) mathematical functions, constructs, 
and predicates. Things like, finding the factors (or just the prime factors) of an integer, small or large:

```elixir
iex> Chunky.Math.factors(124)
[1, 2, 4, 31, 62, 124]

iex> Chunky.Math.prime_factors(124)
[1, 2, 2, 31]

iex> Chunky.Math.factors(1234567890)
[1, 2, 3, 5, 6, 9, 10, 15, 18, 30, 45, 90, 3607, 3803, 7214, 7606, 10821, 11409, 18035, 19015, 21642, 22818, 32463, 34227, 36070, 38030, 54105, 57045, 64926, 68454, 108210, 114090, 162315, 171135, 324630, 342270, 13717421, 27434842, 41152263, 68587105, 82304526, 123456789, 137174210, 205761315, 246913578, 411522630, 617283945, 1234567890]
 
iex> Chunky.Math.prime_factors(1234567890987654321)
[1, 3, 3, 7, 19, 928163, 1111211111]
```

Or testing properties of numbers with predicates:

```elixir
iex> Chunky.Math.is_abundant?(945)
true

iex> Chunky.Math.is_highly_abundant?(945)
false
```

or testing all the predicates at once, to determine the properties of a number:

```elixir
iex> Chunky.Math.analyze_number(12345678)
[:abundant, :arithmetic_number, :cubefree, :even, :positive]

iex> Chunky.Math.analyze_number(1299209)
[:arithmetic_number, :cubefree, :deficient, :odd, :positive, :prime, :prime_power, :squarefree]
```

Chunky also has more advanced functions:

```elixir
iex> Chunky.Math.binomial(7, 3)
35

iex> Chunky.Math.euler_polynomial(2, 15) |> Chunky.Fraction.get_whole()
210
```

See `Chunky.Math` for functions dealing with _number theory_, _combinatorics_, _predicates_, and much more.

# Series Operations

You can use `Chunky.Math.Operations` for macro based shortcuts for some common series operations, like
summation:

```elixir
 # Step sum of j^3 + k^2 + 3
 summation k, 1.10 do
     summation j, k..10 do
         j * j * j + k * k + 3
     end
 end
```

and product:

```elixir
 # continued fractional product 1/2 * 2/3 * ... 100/101
 product n, 1..100 do
     Fraction.new(n, n + 1)
 end
```