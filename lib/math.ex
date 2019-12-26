defmodule Chunky.Math do
  @moduledoc """
  Extended integer and float mathematical functions and operations.

  ## Modular Arithmetic

   - `pow/3` - Integer power in modular exponentiation

  ## Integer Arithmetic

   - `factors/1` - All divisors for an integer
   - `pow/2` - Integer exponentiation
   - `prime_factors/1` - Factorize an integer into prime factors
  
  ## Number Theory

   - `is_prime?/1` - Test if an integer is prime
   - `is_perfect?/1` - Test if an integer is _perfect_
   - `is_abundant?/1` - Test if an integer is _abundant_
   - `is_deficient?/1` - Test if an integer is _deficient_
   - `is_arithmetic_number?/1` - Test if an integer is an _arithmetic_ number
   - `sigma/1` - Sigma-1 function (sum of divisors)
   - `sigma/2` - Generalized Sigma function for integers
   - `next_abundant/1` - Find the next abundant number after `n`
   - `next_deficient/1` - Find the next deficient number after `n`
   - `aliquot_sum/1` - Find the Aliquot Sum of `n`
  
  """

  require Integer
  alias Chunky.Math

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
      factors(n) -- [n] |> Enum.sum()
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
  def sigma(n, p) when is_integer(n) and is_integer(p) and n > 0 and p >= 0 do
    factors(n)
    |> Enum.map(fn fac -> pow(fac, p) end)
    |> Enum.sum()
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
  
  See also; `is_deficient?/1`, `is_perfect?/1`, `next_abundant/1`.
  
  ## Examples
  
      iex> Math.is_abundant?(3)
      false
      
      iex> Math.is_abundant?(12)
      true
      
      iex> Math.is_abundant?(945)
      true
  
  """
  def is_abundant?(n) when is_integer(n) and n > 0 do
     sigma(n) > (2 * n) 
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
  
  See also; `is_abundant?/1`, `is_deficient?/1`.
  
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
     sigma(n) == (2 * n) 
  end
  
  @doc """
  Determine if an integer is _deficient_.
  
  A deficient number is an integer `n`, such that the sum of all proper divisors of `n` (including itself)
  is less than `2 * n`. 
  
  Alternatively, a deficient number is a number that satisfies: `𝜎(n) < 2n`
  
  See also; `is_abundant?/1`, `is_perfect?/1`, `next_deficient/1`.
  
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
     sigma(n) < (2 * n) 
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
