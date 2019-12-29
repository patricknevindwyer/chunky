defmodule Chunky.Math do
  @moduledoc """
  Extended integer and float mathematical functions and operations.

  ## Modular Arithmetic

   - `pow/3` - Integer power in modular exponentiation

  ## Integer Arithmetic

   - `factors/1` - All divisors for an integer
   - `pow/2` - Integer exponentiation
   - `prime_factors/1` - Factorize an integer into prime factors
   - `product_of_prime_factor_exponents/1` - Decompose `n` to prime factors of the form `x^y`, find product of all `y`
   - `least_prime_factor/1` - Find the smallest prime factor of `n`
   - `greatest_prime_factor/1` - Find the largest prime factor of `n`

  ## Number Theory

   - `is_prime?/1` - Test if an integer is prime
   - `is_coprime?/2` - Test if two integers are _coprime_ or _relatively prime_
   - `is_perfect?/1` - Test if an integer is _perfect_
   - `is_abundant?/1` - Test if an integer is _abundant_
   - `is_deficient?/1` - Test if an integer is _deficient_
   - `is_arithmetic_number?/1` - Test if an integer is an _arithmetic_ number
   - `is_powerful_number?/1` - Test if an integer is a _powerful_ number
   - `is_highly_abundant?/1` - Test if an integer is a _highly abundant_ number
   - `is_highly_powerful_number?/1` - Test if an integer is a _highly powerful_ number
   - `sigma/1` - Sigma-1 function (sum of divisors)
   - `sigma/2` - Generalized Sigma function for integers
   - `tau/1` - Tau function, number of divisors of `n`
   - `aliquot_sum/1` - Find the Aliquot Sum of `n`
   - `is_perfect_power?/1` - Is `n` a perfect power?
   - `is_root_of?/2` - Check if `m` is a k-th root of `n`
   - `is_perfect_square?/1` - Is `n` a perfect square?
   - `is_perfect_cube?/1` - Is `m` a perfect square?
   - `is_achilles_number?/1` - Is `n` an Achilles Number?
   - `totient/1` - Calculate Euler's totient for `n`
   - `jordan_totient/2` - Calculate the Jordan totient `J-k(n)`
   - `mobius_function/1` - Classical Mobius Function
   - `omega/1` - Omega function - count of distinct primes
   - `bigomega/1` - Big Omega function - count of distinct primes, with multiplicity
   - `is_squarefree?/1` - Are any factors of `n` perfect squares?
   - `is_cubefree?/1` - Are any factors of `n` perfect cubes?
   - `radical/1` - Square-free kernel, or `rad(n)` - product of distict prime factors
   - `prime_factor_exponents/1` - Find the exponents of all prime factors of `n`
   - `is_power_of?/2` - Is `n` a power of `m`?
   - `is_sphenic_number?/1` - Is `n` the product of three distinct primes?
   - `ramanujan_tau/1` - Find Ramanujan's Tau of `n`
   - `partition_count/1` - Number of ways to partition `n` into sums
   - `abelian_group_count/1` - Number of Abelian groups of order `n`
   - `p_adic_valuation/2` - The _p-adic_ valuation function (for prime `p` and integer `n`)
  
  ## Cryptographic Math

   - `is_b_smooth?/2` - Is `n` prime factor smooth up to `b` - all prime factors <= `b`  
   - `is_3_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 3)`
   - `is_5_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 5)`
   - `is_7_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 7)`
   - `is_11_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 11)`
   - `is_13_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 13)`
   - `is_17_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 17)`
   - `is_19_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 19)`
   - `is_23_smooth?/1` - Predicate shortcut for `is_b_smooth?(n, 23)`

  ## Number Generation

   - `next_number/2` - Use a number theory predicate to find the next integer in a sequence
   - `next_abundant/1` - Find the next abundant number after `n`
   - `next_deficient/1` - Find the next deficient number after `n`
  """

  require Integer
  alias Chunky.Math
  alias Chunky.Fraction
  alias Chunky.CacheAgent

  @rand_max Kernel.trunc(:math.pow(2, 63))

  @doc """
  Decompose an integer to prime factors.

  This is not an exhaustive factorization, but a reduction to all
  prime factors for an integer. 

  ## Examples

      iex> Math.prime_factors(12)
      [1, 2, 2, 3]

      iex> Math.prime_factors(101)
      [1, 101]
      
      iex> Math.prime_factors(79170)
      [1, 2, 3, 5, 7, 13, 29]

      iex> Math.prime_factors(233*444*727*456)
      [1, 2, 2, 2, 2, 2, 3, 3, 19, 37, 233, 727]


  """
  def prime_factors(1), do: [1]
  def prime_factors(n) when is_integer(n) and n > 1, do: decomposition(n, 2, [1])

  @doc """
  Factorize an integer into all divisors.

  This will find all divisors, prime and composite, of an integer. The algorithm used
  for factorization is not optimal for very large numbers, as it uses a multiple pass
  calculation for co-factors and composite factors.


  ## Example

      iex> Math.factors(2)
      [1, 2]

      iex> Math.factors(84)
      [1, 2, 3, 4, 6, 7, 12, 14, 21, 28, 42, 84]

      iex> Math.factors(123456)
      [1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 192, 643, 1286, 1929, 2572, 3858, 5144, 7716, 10288, 15432, 20576, 30864, 41152, 61728, 123456]

  """
  def factors(n) when is_integer(n) and n > 0 do
    # start with prime factors
    pf =
      prime_factors(n)
      |> Enum.uniq()

    # get complements from primes
    cf =
      pf
      |> Enum.map(fn p_factor -> div(n, p_factor) end)
      |> Enum.uniq()

    # run powers of primes up to sqrt(n)
    pf_powers = power_factors_up_to(pf, n)

    # check each of the pf powers as a factor to build other factors
    of =
      pf_powers
      |> Enum.filter(fn pf_power -> rem(n, pf_power) == 0 end)
      |> Enum.map(fn pf_power -> [div(n, pf_power), pf_power] end)
      |> List.flatten()

    (pf ++ cf ++ of) |> Enum.uniq() |> Enum.sort()
  end

  # given a list of factors of N, and N, build a list of the powers of each integer
  # in factor_list up to sqrt(N)
  defp power_factors_up_to(factor_list, n) when is_list(factor_list) and is_integer(n) do
    # find our max value
    up_to_ceil = :math.sqrt(n) |> Float.ceil() |> Kernel.trunc()

    factor_list
    |> Enum.map(fn factor -> power_factor_up_to(factor, 2, up_to_ceil) end)
    |> List.flatten()
  end

  # build powers of `base` up to `up_to_ceil`
  defp power_factor_up_to(1, _f, _u), do: []

  defp power_factor_up_to(base, factor, up_to_ceil) do
    # v = :math.pow(base, factor) |> Kernel.trunc()
    v = base * factor

    if v > up_to_ceil do
      []
    else
      [v] ++ power_factor_up_to(base, factor + 1, up_to_ceil)
    end
  end

  #
  # prime decomposition via trial division Adapted from Rosetta Code
  #   http://rosettacode.org/wiki/Prime_decomposition#Elixir
  #
  defp decomposition(n, k, acc) when n < k * k, do: Enum.reverse(acc, [n])
  defp decomposition(n, k, acc) when rem(n, k) == 0, do: decomposition(div(n, k), k, [k | acc])
  defp decomposition(n, k, acc), do: decomposition(n, k + 1, acc)

  @doc """
  Determine if two numbers, `a` and `b`, are co-prime.

  From [Wikipedia](https://en.wikipedia.org/wiki/Coprime_integers):

  > In number theory, two integers a and b are said to be relatively prime, 
  > mutually prime,[1] or coprime (also written co-prime) if the only positive 
  > integer (factor) that divides both of them is 1

  ## Examples

      iex> Math.is_coprime?(14, 15)
      true

      iex> Math.is_coprime?(14, 21)
      false

      iex> Math.is_coprime?(17, 2048)
      true
  """
  def is_coprime?(a, b) when is_integer(a) and is_integer(b) and a > 0 and b > 0 do
    Integer.gcd(a, b) == 1
  end

  @doc """
  Check if `n` is a _sphenic number_, the product of three distinct primes.

  ## Example

      iex> Math.is_sphenic_number?(4)
      false

      iex> Math.is_sphenic_number?(66)
      true

      iex> Math.is_sphenic_number?(51339)
      true
  """
  def is_sphenic_number?(n) when is_integer(n) and n > 0 do
    facs = Math.prime_factors(n) -- [1]
    length(facs) == 3 && length(Enum.uniq(facs)) == 3
  end

  @doc """
  Euler's totient function for `n`.

  Also called _phi_ or written as `Φ(n)`, the Eulerian totient function counts the positive
  integers up to `n` that are _relatively prime_ or _coprime_ to `n`. The method used for
  calculating this function relies on a partially closed form of Euler's product formula
  that grows relative to the number of prime factors of `n`.

  ## Examples

      iex> Math.totient(36)
      12

      iex> Math.totient(101)
      100

      iex> Math.totient(99999)
      64800

  """
  def totient(n) when is_integer(n) and n > 0 do
    # ref: https://en.wikipedia.org/wiki/Euler%27s_totient_function#Euler's_product_formula

    # find prime factors, reduce to factors > 1
    p_fs =
      (prime_factors(n)
       |> Enum.uniq()) --
        [1]

    # run an eulerian product
    c_f =
      p_fs
      |> Enum.map(fn p_f ->
        Fraction.subtract(1, Fraction.new(1, p_f))
      end)

      # reduce 1/pK via multiplication
      |> Enum.reduce(Fraction.new(1, 1), fn x, acc -> Fraction.multiply(x, acc) end)

    # now the result should be N*(continued fraction eulerian product)
    Fraction.multiply(n, c_f)
    |> Fraction.get_whole()
  end

  @doc """
  Jordan totient function `Jk(n)`.

  The Jordan totient is a generalized form of the Euler totient function, where `J1(n) = Φ(n)`. The
  Jordan totient is a positive integer `m` of `k`-tuples that are co-prime to `n`.

  Calculating the totient is a semi-closed form of a Dirichlet series/Euler product, and is dependent
  on the size of `n` for factorization and `k` for exponentiation.

  ## Examples

  Finding `J2(3)`:

        iex> Math.jordan_totient(3, 2)
        8

  Finding `J9(7)`:

        iex> Math.jordan_totient(7, 9)
        40353606

  Finding `J10(9999)`:
      
        iex> Math.jordan_totient(9999, 10)
        9989835316811664782653775044519099200000
        
  """
  def jordan_totient(n, k) when is_integer(n) and n > 0 and is_integer(k) and k > 0 do
    # ref: https://en.wikipedia.org/wiki/Jordan%27s_totient_function#Definition

    # find prime factors, reduce to factors > 1
    p_fs =
      (prime_factors(n)
       |> Enum.uniq()) --
        [1]

    # run an eulerian product
    c_f =
      p_fs
      |> Enum.map(fn p_f ->
        # take p_f to the k
        pfk = Math.pow(p_f, k)
        Fraction.subtract(1, Fraction.new(1, pfk))
      end)

      # reduce 1/pK via multiplication
      |> Enum.reduce(Fraction.new(1, 1), fn x, acc -> Fraction.multiply(x, acc) end)

    # now the result should be N*(continued fraction eulerian product)
    # but first we take n to the k
    Math.pow(n, k)
    |> Fraction.multiply(c_f)
    |> Fraction.get_whole()
  end

  @doc """
  The classical Möbius function `μ(n)`.

  From [Möbius Function](https://en.wikipedia.org/wiki/Möbius_function) on Wikipedia:

  For any positive integer n, define μ(n) as the sum of the primitive nth roots of unity. It has values in {−1, 0, 1} depending on the factorization of n into prime factors:

   - μ(n) = 1 if n is a square-free positive integer with an even number of prime factors.
   - μ(n) = −1 if n is a square-free positive integer with an odd number of prime factors.
   - μ(n) = 0 if n has a squared prime factor.

  ## Examples

      iex> Math.mobius_function(1)
      1

      iex> Math.mobius_function(24)
      0

      iex> Math.mobius_function(99999)
      0
  """
  def mobius_function(1), do: 1

  def mobius_function(n) when is_integer(n) and n > 0 do
    # prime factors, dropping 1
    p_fs = prime_factors(n) -- [1]

    # build the grouping of factors
    p_gs = p_fs |> Enum.group_by(fn p_f -> p_f end)

    # how big is the largest PF group?
    largest_p_gs = p_gs |> Enum.map(fn {_base, quant} -> length(quant) end) |> Enum.max()

    # how many factors are there?
    count_p_fs = length(p_fs)

    cond do
      largest_p_gs > 1 -> 0
      Integer.is_even(count_p_fs) -> 1
      true -> -1
    end
  end

  @doc """
  Check if an integer `n` has no factors greater than `1` that are perfect squares.

  ## Examples

      iex> Math.is_squarefree?(3)
      true
      
      iex> Math.is_squarefree?(8)
      false

      iex> Math.is_squarefree?(99935)
      true

  """
  def is_squarefree?(1), do: true

  def is_squarefree?(n) when is_integer(n) and n > 0 do
    (factors(n) -- prime_factors(n))
    |> Enum.uniq()
    |> Enum.filter(fn c_f -> is_perfect_square?(c_f) end)
    |> length() == 0
  end

  @doc """
  Check if an integer `n` has no factors greater than `1` that are perfect cubes.

  ## Examples

      iex> Math.is_cubefree?(3)
      true

      iex> Math.is_cubefree?(64)
      false

      iex> Math.is_cubefree?(2744)
      false
  """
  def is_cubefree?(1), do: true

  def is_cubefree?(n) when is_integer(n) and n > 0 do
    (factors(n) -- prime_factors(n))
    |> Enum.uniq()
    |> Enum.filter(fn c_f -> is_perfect_cube?(c_f) end)
    |> length() == 0
  end

  @doc """
  Calculate `ω(n)` - the number of distinct prime factors of `n`.

  See also `bigomega/1` - number of total prime factors of `n`.

  ## Examples

      iex> Math.omega(3)
      1
      
      iex> Math.omega(15)
      2

      iex> Math.omega(25)
      1

      iex> Math.omega(99960)
      5
  """
  def omega(n) when is_integer(n) and n > 0 do
    (prime_factors(n) -- [1])
    |> Enum.uniq()
    |> length()
  end

  @doc """
  Find the radical of an integer `n`.

  Also called the _square-free kernel_, or written as `rad(n)`, the radical of an integer is
  the product of the distinct primes of `n`.

  ## Examples

      iex> Math.radical(1)
      1

      iex> Math.radical(504)
      42

      iex> Math.radical(99960)
      3570
  """
  def radical(n) when is_integer(n) and n > 0 do
    prime_factors(n)
    |> Enum.uniq()
    |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  @doc """
  Find the `lpf(n)` or _least prime factor_.

  ## Examples

      iex> Math.least_prime_factor(1)
      1
      
      iex> Math.least_prime_factor(39)
      3

      iex> Math.least_prime_factor(99973)
      257
  """
  def least_prime_factor(1), do: 1

  def least_prime_factor(n) when is_integer(n) and n > 0 do
    (prime_factors(n) -- [1])
    |> Enum.min()
  end

  @doc """
  Find the `gpf(n)` or _greatest prime factor_.

  ## Examples

      iex> Math.greatest_prime_factor(1)
      1

      iex> Math.greatest_prime_factor(39)
      13

      iex> Math.greatest_prime_factor(99973)
      389
  """
  def greatest_prime_factor(1), do: 1

  def greatest_prime_factor(n) when is_integer(n) and n > 0 do
    (prime_factors(n) -- [1])
    |> Enum.max()
  end

  @doc """
  Calculate `Ω(n)` - number of distinct prime factors, with multiplicity.

  See also `omega/1` - number of distinct prime factors.

  ## Examples

      iex> Math.bigomega(3)
      1
      
      iex> Math.bigomega(15)
      2

      iex> Math.bigomega(25)
      2

      iex> Math.bigomega(99960)
      8
  """
  def bigomega(n) when is_integer(n) and n > 0 do
    (prime_factors(n) -- [1])
    |> length()
  end

  @doc """
  Check if an integer `n` is 3-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_3_smooth?(3)
      true

      iex> Math.is_3_smooth?(40)
      false

      iex> Math.is_3_smooth?(107)
      false

      iex> Math.is_3_smooth?(2020)
      false
  """
  def is_3_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 3)

  @doc """
  Check if an integer `n` is 5-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_5_smooth?(3)
      true

      iex> Math.is_5_smooth?(40)
      true

      iex> Math.is_5_smooth?(107)
      false

      iex> Math.is_5_smooth?(2020)
      false
  """
  def is_5_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 5)

  @doc """
  Check if an integer `n` is 7-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_7_smooth?(3)
      true

      iex> Math.is_7_smooth?(40)
      true

      iex> Math.is_7_smooth?(107)
      false

      iex> Math.is_7_smooth?(2020)
      false
  """
  def is_7_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 7)

  @doc """
  Check if an integer `n` is 11-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_11_smooth?(3)
      true

      iex> Math.is_11_smooth?(40)
      true

      iex> Math.is_11_smooth?(107)
      false

      iex> Math.is_11_smooth?(2020)
      false
  """
  def is_11_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 11)

  @doc """
  Check if an integer `n` is 13-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_13_smooth?(3)
      true

      iex> Math.is_13_smooth?(40)
      true

      iex> Math.is_13_smooth?(107)
      false

      iex> Math.is_13_smooth?(2020)
      false
  """
  def is_13_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 13)

  @doc """
  Check if an integer `n` is 17-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_17_smooth?(3)
      true

      iex> Math.is_17_smooth?(40)
      true

      iex> Math.is_17_smooth?(107)
      false

      iex> Math.is_17_smooth?(2020)
      false
  """
  def is_17_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 17)

  @doc """
  Check if an integer `n` is 19-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_19_smooth?(3)
      true

      iex> Math.is_19_smooth?(40)
      true

      iex> Math.is_19_smooth?(107)
      false

      iex> Math.is_19_smooth?(2020)
      false
  """
  def is_19_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 19)

  @doc """
  Check if an integer `n` is 23-smooth.

  See `is_b_smooth?/2` for more details.

  ## Examples

      iex> Math.is_23_smooth?(3)
      true

      iex> Math.is_23_smooth?(40)
      true

      iex> Math.is_23_smooth?(107)
      false

      iex> Math.is_23_smooth?(2020)
      false
  """
  def is_23_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 23)

  @doc """
  Determine if an integer `n` is `b`-smooth, a composite of prime factors less than or equal to `b`.

  Numbers can be `b`-smooth for any `b` that is prime. For instance, the number `8` is 3-smooth, as
  it's factors would be: `1^1 * 2^3 * 3^0`, whereas `15` is not 3-smooth, as it's factors would be
  `1^1 * 2^0 * 3^1 * 5^1` - it has prime factors whose value is greater than `3`.

  ## Shortcut Functions

  There are a collection of pre-defined predicate functions for checking b-smooth for the primes `3` to `23`:

      - `is_3_smooth?/1`
      - `is_5_smooth?/1`
      - `is_7_smooth?/1`
      - `is_11_smooth?/1`
      - `is_13_smooth?/1`
      - `is_17_smooth?/1`
      - `is_19_smooth?/1`
      - `is_23_smooth?/1`

  ## Examples

      iex> Math.is_b_smooth?(1944, 3)
      true
      
      iex> Math.is_b_smooth?(101, 5)
      false

      iex> Math.is_b_smooth?(705, 47)
      true
  """
  def is_b_smooth?(n, b) when is_integer(n) and is_integer(b) and b > 2 and n > 0 do
    if !is_prime?(b) do
      raise ArgumentError, message: "b parameter must be prime"
    else
      prime_factors(n)
      |> Enum.filter(fn fac ->
        fac > b
      end)
      |> length() == 0
    end
  end

  @doc """
  Find the Aliquot Sum of `n`.

  An [Aliquot Sum](https://en.wikipedia.org/wiki/Aliquot_sum) of an integer `n` is the sum of
  the _proper divisors_ (all divisors _except_ `n`) of `n`.

  ## Examples

      iex> Math.aliquot_sum(1)
      0

      iex> Math.aliquot_sum(10)
      8
      
      iex> Math.aliquot_sum(48)
      76
  """
  def aliquot_sum(n) when is_integer(n) and n > 0 do
    (factors(n) -- [n]) |> Enum.sum()
  end

  @doc """
  Find the product of the exponents of the prime factors of `n`.

  This function takes the prime factors of `n`, such as the factors of `8 = {1, 2, 2, 2}`,
  groups the factors and to find the exponents, such as `8 = 1^1 * 2^3`, and then 
  finds the product of the _exponents_, like `1 * 3`. Here the product of
  prime factorization exponents for `8` is `3`.

  The numbers generated by this function are related to the OEIS Sequence [A005361](https://oeis.org/A005361),
  and the [prodex](https://en.wikipedia.org/wiki/Highly_powerful_number) function.

  ## Examples

      iex> Math.product_of_prime_factor_exponents(8)
      3
      
      iex> Math.product_of_prime_factor_exponents(100000)
      25
  """
  def product_of_prime_factor_exponents(n) when is_integer(n) and n > 0 do
    # find the prime factors
    Math.prime_factors(n)

    # group by factor - this is effectively finding the exponent of the factor
    |> Enum.group_by(fn i -> i end)

    # map to the length of the group (extract the exponent)
    |> Enum.map(fn {_base, exp} -> length(exp) end)

    # multiply
    |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  @doc """
  Count the exponents of the prime factors of `n`.

  This function counts the exponents on the prime factors of `n`, for example the
  number `2,025,000` can be factored to: `[2, 2, 2, 3, 3, 3, 3, 5, 5, 5, 5, 5]`
  or `2^3 * 3^4 * 5^5`, hence the exponent of `2` is `3`, the exponent of `3` is
  `4`, and the exponent of `5` is `5`.

  As a simpler example, the prime factors of `49` are `[7, 7]`, or `7^2`, so the
  result of `prime_factor_exponents(49)` would be `%{7 => 2}`

  ## Examples

      iex> Math.prime_factor_exponents(2)
      %{2 => 1}

      iex> Math.prime_factor_exponents(8)
      %{2 => 3}

      iex> Math.prime_factor_exponents(2025000)
      %{2 => 3, 3 => 4, 5 => 5}

      iex> Math.prime_factor_exponents(49)
      %{7 => 2}
  """
  def prime_factor_exponents(n) when is_integer(n) and n > 0 do
    # find the prime factors
    (Math.prime_factors(n) -- [1])

    # group by factor - this is effectively finding the exponent of the factor
    |> Enum.group_by(fn i -> i end)

    # map to the length of the group (extract the exponent)
    |> Enum.map(fn {base, exp} -> {base, length(exp)} end)
    |> Map.new()
  end

  @doc """
  Calculate the sigma-1 (or `σ1(n)`), also known as sum-of-divisors of an integer.

  This is all of the divisors of `n` summed.

  ## Example

      iex> Math.sigma(70)
      144
    
      iex> Math.sigma(408)
      1080

      iex> Math.sigma(100000)
      246078

  """
  def sigma(n) when is_integer(n) and n > 0 do
    factors(n)
    |> Enum.sum()
  end

  @doc """
  Calculate a sigma function of an integer, for any `p`-th powers.

  This is a generalized Sigma function of the form `σp(n)`, so the Sigma-0 of
  a number `σ0(n)` would be `sigma(n, 0)`, while the Sigma-4 (`σ4(n)`) would be `sigma(n, 4)`.

  For a faster version of `σ1(n)` (or the sum-of-divisors) see `sigma/1`.

  ## Examples

      iex> Math.sigma(12, 2)
      210

      iex> Math.sigma(19, 4)
      130322

      iex> Math.sigma(24, 0)
      8
  """
  def sigma(0, 1), do: 1
  def sigma(n, p) when is_integer(n) and is_integer(p) and n > 0 and p >= 0 do
    factors(n)
    |> Enum.map(fn fac -> pow(fac, p) end)
    |> Enum.sum()
  end

  @doc """
  The tau (number of divisors) function.

  Also written as `𝜏(n)` or `sigma(n, 0)`, this is a shortcut to `sigma/2`.

  ## Examples

      iex> Math.tau(9)
      3

      iex> Math.tau(34)
      4

      iex> Math.tau(50)
      6

      iex> Math.tau(3402)
      24
  """
  def tau(n) when is_integer(n) and n > 0 do
    sigma(n, 0)
  end

  @doc """
  Calculate the Ramanujan Tau function for `n`.
  
  The Ramanujan Tau function is defined as:
  
      ![Ramanujan Tau](https://wikimedia.org/api/rest_v1/media/math/render/svg/846fc5e7ae7e57f2df206054ea0aba4124e6f124)
  
  It's use in mathematics is noted by Wikipedia as
  
  > an "error term" involved in counting the number of ways of expressing an integer as a sum of 24 squares
  
  When calculating the Nth term of the Ramanujan Tau, this function uses a summation form (developed in GP/Pari 
  by [Joerg Arndt](https://oeis.org/wiki/User:Joerg_Arndt)), that looks like:
  
  ```
  a(n) = 
        n^4 * sigma(n) 
      - 24 * 
          sum(
              k = 1, 
              n - 1, 
              (
                    35 * k^4 
                  - 52 * k^3 * n 
                  + 18 * k^2 * n^2
              ) 
              * sigma(k) 
              * sigma(n - k)
          )
  ```
  
  Note that the summation in `sum(k = 1, n - 1, ...` is linear to the size of `n`.
  
  ## Examples
  
      iex> Math.ramanujan_tau(1)
      1
  
      iex> Math.ramanujan_tau(15)
      1217160
  
      iex> Math.ramanujan_tau(460)
      -132549189534720
  
  """
  def ramanujan_tau(1), do: 1
  def ramanujan_tau(n) when is_integer(n) and n > 0 do
  
      # Using the gp/pari formula from [Joerg Arndt](https://oeis.org/wiki/User:Joerg_Arndt)
      # a(n) = n^4 * sigma(n) - 24 * sum(k=1, n-1, (35*k^4 - 52*k^3*n + 18*k^2*n^2) * sigma(k) * sigma(n-k))

    sum_term  = 1..n - 1
    |> Enum.map(
        fn k -> 
            (35 * Math.pow(k, 4) - 52 * Math.pow(k, 3) * n + 18 * Math.pow(k, 2) * Math.pow(n, 2)) * sigma(k, 1) * sigma(n - k, 1)
        end
    ) 
    |> Enum.sum()

    Math.pow(n, 4) * sigma(n, 1) - 24 * sum_term
 
  end
  
  @doc """
  Count the number of Abelian groups of order `n`.
  
  An Abelian group is a commutative group of elements in Abstract Algebra; this function counts the
  number of Abelian groups of a certain size. 
  
  This implementation of size counting for Abelian groups of order `n` is based on finding
  the number of _partitions_ (see `partition_count/1`) of the exponents of the prime factors
  of `n`. For instance, when `n` is `144`, the prime factorization is `2^4 * 3^2`, with exponents `4`
  and `2`. Finding the product of the partitions of the exponents via `p(4) * p(2)` yields `5 * 2`, or `10`.
  
  ## Examples
  
      iex> Math.abelian_groups_count(1)
      1
  
      iex> Math.abelian_groups_count(9984)
      22
  """
  def abelian_groups_count(1), do: 1
  def abelian_groups_count(n) when is_integer(n) and n > 0 do
     
     prime_factor_exponents(n)
     |> Enum.map(fn {_base, e} -> partition_count(e) end)
     |> Enum.reduce(1, fn x, acc -> x * acc end) 
     
  end
  
  @doc """
  Find the _p-adic_ valuation of `n`.
  
  From [p-adic order](https://en.wikipedia.org/wiki/P-adic_order) on Wikipedia:
  
  > In number theory, for a given prime number p, the p-adic order or p-adic valuation of a non-zero integer n is the highest exponent `ν`
  > such that `p^ν` divides `n`.
  
  The `p` value for `p_adic_valuation` **must** be prime. By defintion the `p-adic` value of `0` is
  always _infinity_.
  
  ## Examples
  
  A handful of examples for `3-adic`, `5-adic`, and `7-adic` valuation, though _any_ prime number
  can be used as the `p` value:
  
  2-adic valutions:
  
      iex> Math.p_adic_valuation(2, 1)
      0
  
      iex> Math.p_adic_valuation(2, 24)
      3
  
      iex> Math.p_adic_valuation(2, 9728)
      9
  
  3-adic valutions:
  
      iex> Math.p_adic_valuation(3, 137)
      0
  
      iex> Math.p_adic_valuation(3, 999)
      3
  
  7-adic valutions
      
      iex> Math.p_adic_valuation(7, 686)
      3
  
      iex> Math.p_adic_valuation(7, 980)
      2
  """
  def p_adic_valuation(_, 0), do: :infinity
  def p_adic_valuation(p, n) when is_integer(p) and is_integer(n) and p > 1 and n > 0 do
     if !is_prime?(p) do
         raise ArgumentError, message: "p value of p-adic valuation must be prime" 
     end
     
     # walk the possible exponents of p^v
     exps = 1..p_adic_max_v(p, 1, n)
     |> Enum.filter(
         fn v -> 
             
             # does p^v divide N?
             rem(n, Math.pow(p, v)) == 0
         end
     )
     
     if length(exps) == 0 do
         0
     else
         Enum.max(exps)
     end
     
  end
  
  defp p_adic_max_v(p, v, n) do
     if Math.pow(p, v) > n do
         v
     else
         p_adic_max_v(p, v + 1, n)
     end 
  end
  
  @doc """
  Count the number of partitions of `n`.
    
  A partition of `n` is the set of ways of creating a sum of `n`. For example, `4` has a partition
  count of `5`, as it can be represented as the following sums:
  
   - `4`
   - `3 + 1`
   - `2 + 2`
   - `2 + 1 + 1`
   - `1 + 1 + 1 + 1`
  
  This is a recursive form of the Partition Function, yielding an exact answer, but computationally
  intensive for larger numbers. Because this function is exponentially recursive, it uses a value
  cache that persists as a named Agent, which is used by any call to `partition_count`. On a reasonably
  fast computer this results in the following execution times for different values of `n`:
  
  |  `n`  |  Seconds  |
  |-------|-----------|
  | 10    |   0.021   |
  | 100   |   0.071   |
  | 1000  |   7.301   |
  | 2500  |  43.616   |
  | 3000  |  61.921   |
  | 5000  | 185.277   |
  
  ## Examples
  
      iex> Math.partition_count(1)
      1
  
      iex> Math.partition_count(10)
      42
      
      iex> Math.partition_count(100)
      190569292
  
      iex> Math.partition_count(416)
      17873792969689876004
  
  """
  def partition_count(0), do: 1
  def partition_count(1), do: 1
  def partition_count(n) when is_integer(n) and n > 1 do
      
      # start and check our cache for our value
      CacheAgent.start_link(:partition_count)
      if CacheAgent.has?(:partition_count, n) do
          CacheAgent.get(:partition_count, n)
      else
          # a(n) = (1/n) * Sum_{k=0..n-1} sigma(n-k)*a(k)  
          sum_part = 0..n - 1
          |> Enum.map(
              fn k -> 
                  sigma(n - k, 1) * partition_count(k)
              end
          )
          |> Enum.sum()
     
          p = Fraction.new(1, n) |> Fraction.multiply(sum_part) |> Fraction.get_whole()
          CacheAgent.put(:partition_count, n, p)
          p
      end 
  end
  
  @doc """
  Determine if a positive integer is prime.

  This function uses a [Miller-Rabin](https://en.wikipedia.org/wiki/Miller–Rabin_primality_test) primality 
  test, with 40 iterations.

  ## Examples

      iex> Math.is_prime?(13)
      true
      
      iex> Math.is_prime?(233*444*727*456)
      false

      iex> Math.is_prime?(30762542250301270692051460539586166927291732754961)
      true
  """
  def is_prime?(i) when is_integer(i) and i < 2, do: false
  def is_prime?(i) when is_integer(i) and i > 2 and Integer.is_even(i), do: false

  def is_prime?(i) when is_integer(i) do
    case i do
      2 -> true
      3 -> true
      _ -> miller_rabin?(i, 40)
    end
  end

  @doc """
  Determine if an integer is an _arithmetic number_.

  An arithmetic number `n` such that the average of the sum of the proper divisors of `n` is
  a whole integer. Alternatively, `n` that satisfy `𝜎(n) / 𝜏(n) == 0`.

  ## Examples

      iex> Math.is_arithmetic_number?(11)
      true
      
      iex> Math.is_arithmetic_number?(32)
      false
      
      iex> Math.is_arithmetic_number?(12953)
      true
  """
  def is_arithmetic_number?(n) when is_integer(n) and n > 0 do
    divs = Math.factors(n)
    rem(divs |> Enum.sum(), length(divs)) == 0
  end

  @doc """
  Determine if an integer is _abundant_. 

  An abundant number is an integer `n`, such that the sum of all proper divisors of `n` (including itself)
  is greater than `2 * n`. 

  Alternatively, an abundant number is a number that satisfies: `𝜎(n) > 2n`

  See also; `is_deficient?/1`, `is_perfect?/1`, `is_highly_abundant?/1`, `next_abundant/1`.

  ## Examples

      iex> Math.is_abundant?(3)
      false
      
      iex> Math.is_abundant?(12)
      true
      
      iex> Math.is_abundant?(945)
      true

  """
  def is_abundant?(n) when is_integer(n) and n > 0 do
    sigma(n) > 2 * n
  end

  @doc """
  Check if a number `n` is _highly abundant_.

  A number `n` is _highly abundant_ when the sum of the proper factors of `n` is
  greater than the sum of the proper factors of any number `m` that is in ` 0 < m < n`.

  Alternatively, for all natural numbers, `m < n ; 𝜎(m) < 𝜎(n)`.

  See also; `is_deficient?/1`, `is_perfect?/1`, `is_abundant?/1`.

  ## Examples

      iex> Math.is_highly_abundant?(1)
      true
        
      iex> Math.is_highly_abundant?(5)
      false

      iex> Math.is_highly_abundant?(30)
      true
      
      iex> Math.is_highly_abundant?(2099)
      false
      
      iex> Math.is_highly_abundant?(2100)
      true
  """
  def is_highly_abundant?(1), do: true

  def is_highly_abundant?(n) when is_integer(n) and n > 1 do
    s_n = sigma(n)

    1..(n - 1)
    |> Enum.filter(fn m -> sigma(m) > s_n end)
    |> length() == 0
  end

  @doc """
  Check if `n` is a perfect square.

  Perfect squares are `n` such that there exists an `m` where `m * m == n`.

  ## Examples

      iex> Math.is_perfect_square?(3)
      false

      iex> Math.is_perfect_square?(25)
      true

      iex> Math.is_perfect_square?(123456)
      false
  """
  def is_perfect_square?(n) when is_integer(n) and n <= 3, do: false

  def is_perfect_square?(n) when is_integer(n) and n > 3 do
    # find all factors
    # remove 1 and N
    (factors(n) --
       [1, n])

    # check if any are the perfect square
    |> Enum.filter(fn fac -> fac * fac == n end)
    |> length() > 0
  end

  @doc """
  Check if `n` is a perfect cube.

  Perfect cubes are `n` such that there exists an `m` where `m * m * m == n` or `m^3 == n`.

  ## Examples

      iex> Math.is_perfect_cube?(6)
      false

      iex> Math.is_perfect_cube?(8000)
      true

      iex> Math.is_perfect_cube?(1879080904)
      true
  """
  def is_perfect_cube?(n) when is_integer(n) and n <= 7, do: false

  def is_perfect_cube?(n) when is_integer(n) and n > 7 do
    # find all factors
    # remove 1 and N
    (factors(n) --
       [1, n])

    # check if any are the perfect cube
    |> Enum.filter(fn fac -> fac * fac * fac == n end)
    |> length() > 0
  end

  @doc """
  Check if `n` is a _perfect power_.

  Perfect powers are `n` where positive integers `m` and `k` exist, such 
  that `m^k == n`.

  ## Examples

      iex> Math.is_perfect_power?(4)
      true
      
      iex> Math.is_perfect_power?(100)
      true
      
      iex> Math.is_perfect_power?(226)
      false
  """
  def is_perfect_power?(1), do: true

  def is_perfect_power?(n) when is_integer(n) and n > 0 do
    # find all factors
    # drop 1 and N
    (factors(n) --
       [1, n])

    # drop duplicates
    |> Enum.uniq()

    # check if any are roots
    |> Enum.filter(fn fac ->
      if fac * fac <= n do
        is_root_of?(fac, n)
      else
        false
      end
    end)
    |> length() > 0
  end

  @doc """
  Check if a number is an Achilles Number.

  Achilles numbers are `n` that are _powerful_ (see `is_powerful_number?/1` but not _perfect powers_ (see `is_perfect_power?/1`).

  See `Chunky.Sequence.OEIS.Factor`, sequence `A052486`.

  ## Examples

      iex> Math.is_achilles_number?(70)
      false
      
      iex> Math.is_achilles_number?(72)
      true

      iex> Math.is_achilles_number?(2700)
      true

      iex> Math.is_achilles_number?(784)
      false
  """
  def is_achilles_number?(n) when is_integer(n) and n <= 71, do: false

  def is_achilles_number?(n) when is_integer(n) and n > 71 do
    is_powerful_number?(n) and !is_perfect_power?(n)
  end

  @doc """
  Check if `n` is a power of `m`.

  This is partially the inverse of `is_root_of?/2`.

  ## Examples

      iex> Math.is_power_of?(8, 2)
      true

      iex> Math.is_power_of?(243, 3)
      true

      iex> Math.is_power_of?(9, 2)
      false

      iex> Math.is_power_of?(2, 2)
      true
      
      iex> Math.is_power_of?(1, 17)
      true
  """
  def is_power_of?(n, m) when n == m, do: true
  def is_power_of?(1, _m), do: true

  def is_power_of?(n, m) do
    is_root_of?(m, n)
  end

  @doc """
  Check if `n` is any `k`-th root of `m`, where `k > 2`.

  This function uses a repeated multiplication method to test if `n` has any
  power `k` such that `n^k == m`.

  ## Examples

      iex> Math.is_root_of?(2, 8)
      true
      
      iex> Math.is_root_of?(2, 2048)
      true

      iex> Math.is_root_of?(7, 16807)
      true

      iex> Math.is_root_of?(5, 16808)
      false
  """
  def is_root_of?(n, m) when is_integer(n) and is_integer(m) and n >= m, do: false

  def is_root_of?(n, m) when is_integer(n) and is_integer(m) and n < m do
    # walk powers of n until we're equal to or bigger than
    # the target number
    is_root_of_iter(n, n, m)
  end

  defp is_root_of_iter(_base, n, m) when n == m, do: true
  defp is_root_of_iter(base, n, m) when n < m, do: is_root_of_iter(base, n * base, m)
  defp is_root_of_iter(_base, n, m) when n > m, do: false

  @doc """
  Check if a number `n` is a _highly powerful number_.

  Highly powerful numbers are similar in concept to highly _abundant_ numbers. For highly powerful numbers,
  the product of the exponents of prime factors of the number `n` need to be greater than the same property
  for any number `m`, such that `0 < m < n`.

  If you need a _sequence_ of highly powerful numbers, use the `A005934` sequence in `Chunky.Sequence.OEIS.Factors`, which
  uses an max/compare method for building the sequence, which is _vastly_ more efficient than repeated
  calls to `is_highly_powerful_number?/1`.

  See also `is_powerful_number?/1`, and [Highly powerful number](https://en.wikipedia.org/wiki/Highly_powerful_number).

  ## Examples

      iex> Math.is_highly_powerful_number?(4)
      true

      iex> Math.is_highly_powerful_number?(256)
      false
      
      iex> Math.is_highly_powerful_number?(62208)
      true
  """
  def is_highly_powerful_number?(1), do: true

  def is_highly_powerful_number?(n) when is_integer(n) and n > 1 do
    # find prod of prim factors exponents for N
    ppfe_n = product_of_prime_factor_exponents(n)

    # check all previous values, and compare
    1..(n - 1)
    |> Enum.filter(fn m -> product_of_prime_factor_exponents(m) >= ppfe_n end)
    |> length() == 0
  end

  @doc """
  Find the next abundant number after `n`.

  See `is_abundant?/1`.

  ## Examples

      iex> Math.next_abundant(1)
      12

      iex> Math.next_abundant(12)
      18

      iex> Math.next_abundant(60)
      66

      iex> Math.next_abundant(264)
      270
  """
  def next_abundant(n) when is_integer(n) and n > 0 do
    if is_abundant?(n + 1) do
      n + 1
    else
      next_abundant(n + 1)
    end
  end

  @doc """
  Determine if an integer is a _perfect_ number.

  A perfect integer is an `n` where the sum of the proper divisors of `n` is equal to `n`. Alternatively,
  an `n` that satisfies `𝜎(n) == 2n`.

  See also; `is_abundant?/1`, `is_highly_abundant?/1`, `is_deficient?/1`.

  ## Examples

      iex> Math.is_perfect?(5)
      false
      
      iex> Math.is_perfect?(6)
      true

      iex> Math.is_perfect?(20)
      false
      
      iex> Math.is_perfect?(33550336)
      true
  """
  def is_perfect?(n) when is_integer(n) and n > 0 do
    sigma(n) == 2 * n
  end

  @doc """
  Determine if an integer is _deficient_.

  A deficient number is an integer `n`, such that the sum of all proper divisors of `n` (including itself)
  is less than `2 * n`. 

  Alternatively, a deficient number is a number that satisfies: `𝜎(n) < 2n`

  See also; `is_abundant?/1`, `is_highly_abundant?/1`, `is_perfect?/1`, `next_deficient/1`.

  ## Examples

      iex> Math.is_deficient?(1)
      true

      iex> Math.is_deficient?(71)
      true

      iex> Math.is_deficient?(33550336)
      false

      iex> Math.is_deficient?(60)
      false
  """
  def is_deficient?(n) when is_integer(n) and n > 0 do
    sigma(n) < 2 * n
  end

  @doc """
  Determine if an integer `n` is a _powerful number_.

  A _powerful number_ is an integer `n` such that for all _prime factors_ `m` of `n`,
  `m^2` also evenly divides `n`. Alternatively, a _powerful number_ `n` can be written
  as `n = a^2 * b^3` for positive integers `a` and `b`; `n` is the product of a square
  and a cube.

  ## Examples

      iex> Math.is_powerful_number?(8)
      true

      iex> Math.is_powerful_number?(10)
      false

      iex> Math.is_powerful_number?(800)
      true

      iex> Math.is_powerful_number?(970)
      false
  """
  def is_powerful_number?(n) when is_integer(n) and n > 0 do
    p_fs = prime_factors(n) |> Enum.uniq()

    # walk through the prime factors and filter out to those that aren't
    # also squared factors such that n % p_f^2 == 0
    p_fs
    |> Enum.filter(fn p_f ->
      rem(n, p_f * p_f) != 0
    end)
    |> length() == 0
  end

  @doc """
  Apply a number theoretic property test to integers to find the next number
  in a sequence.

  ## Examples

      iex> Math.next_number(&Math.is_powerful_number?/1, 49)
      64

      iex> Math.next_number(&Math.is_abundant?/1, 60)
      66
  """
  def next_number(property_func, n)
      when is_function(property_func, 1) and is_integer(n) and n >= 0 do
    if property_func.(n + 1) do
      n + 1
    else
      next_number(property_func, n + 1)
    end
  end

  @doc """
  Find the next deficient number after `n`.

  See `is_deficient?/1`.

  ## Examples

      iex> Math.next_deficient(0)
      1

      iex> Math.next_deficient(5)
      7

      iex> Math.next_deficient(41)
      43

  """
  def next_deficient(n) when is_integer(n) and n >= 0 do
    if is_deficient?(n + 1) do
      n + 1
    else
      next_deficient(n + 1)
    end
  end

  @doc """
  Integer power/exponentiation in Modular Arithmetic.

  ## Examples

      iex> Math.pow(5, 3, 13)
      8
      
      iex> Math.pow(67930, 32319, 103969)
      6582

  """
  def pow(x, y, mod) when is_integer(x) and is_integer(y) and is_integer(mod) do
    :crypto.mod_pow(x, y, mod) |> :binary.decode_unsigned()
  end

  @doc """
  Integer exponentiation, `x^y`.

  This function uses pure integer methods to bypass issues with floating point precision
  trucation in large values using the built-in `:math` exponentiation functions.

  ## Example
      
      iex> Math.pow(2, 10)
      1024

      iex> Math.pow(17, 14)
      168377826559400929
  """
  def pow(_x, 0), do: 1
  def pow(x, 1), do: x

  def pow(x, y) when is_integer(x) and is_integer(y) and Integer.is_even(y),
    do: pow(x * x, div(y, 2))

  def pow(x, y) when is_integer(x) and is_integer(y), do: x * pow(x * x, div(y - 1, 2))

  #
  # Miller-Rabin primality test adapted from Rosetta Code:
  #   https://rosettacode.org/wiki/Miller–Rabin_primality_test#Elixir
  #
  defp miller_rabin?(n, g) do
    {s, d} = miller_rabin(n - 1, 0)
    miller_rabin(n, g, s, d)
  end

  defp miller_rabin(d, s) when rem(d, 2) == 0, do: {s, d}
  defp miller_rabin(d, s), do: miller_rabin(div(d, 2), s + 1)

  defp miller_rabin(_n, 0, _, _), do: true

  defp miller_rabin(n, g, s, d) do
    a =
      if n > @rand_max do
        1 + :rand.uniform(@rand_max - 3)
      else
        1 + :rand.uniform(n - 3)
      end

    x = Math.pow(a, d, n)

    if x == 1 or x == n - 1 do
      miller_rabin(n, g - 1, s, d)
    else
      if miller_rabin(n, x, s - 1) == true, do: miller_rabin(n, g - 1, s, d), else: false
    end
  end

  defp miller_rabin(_n, _x, r) when r <= 0, do: false

  defp miller_rabin(n, x, r) do
    x = Math.pow(x, 2, n)

    unless x == 1 do
      unless x == n - 1, do: miller_rabin(n, x, r - 1), else: true
    else
      false
    end
  end
end
