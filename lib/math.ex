defmodule Chunky.Math do
  @moduledoc """
  Integer math, number theory, factorization, prime numbers, and numerical analysis predicates.
  
  
  ## Modular Arithmetic
  
  Pure integer operations for Modular Arithmetic.
  
   - `pow/3` - Integer power in modular exponentiation

  
  ## Generating Constants
  
   - `digits_of_pi/1` - Generate `n` digits of pi, as a large integer
  
  ## Integer Arithmetic
  
  Arithmetic functions for pure integer operations.

   - `pow/2` - Integer exponentiation
   - `factorial/1` - Factorial (`n!`) of `n`
   - `rising_factorial/2` - Rising factorial of `n^(m)`
   - `falling_factorial/2` - Falling factorial of `(n)m`
  

  ## Factorization and Divisors
  
  Work with divisors and prime factors.

   - `factors/1` - All divisors for an integer
   - `is_power_of?/2` - Is `n` a power of `m`?
   - `is_root_of?/2` - Check if `m` is a k-th root of `n`
   - `prime_factors/1` - Factorize an integer into prime factors
   - `sigma/1` - Sigma-1 function (sum of divisors)
   - `tau/1` - Tau function, number of divisors of `n`


  ## Primes
  
  Analyze, test, and generate prime numbers.
  
   - `greatest_prime_factor/1` - Find the largest prime factor of `n`
   - `is_coprime?/2` - Test if two integers are _coprime_ or _relatively prime_
   - `least_prime_factor/1` - Find the smallest prime factor of `n`
   - `prime_factor_exponents/1` - Find the exponents of all prime factors of `n`
   - `prime_pi/1` - Prime counting function, number of primes less than or equal `n`
  
  
  ## Predicates
  
  Assess integers using _predicate_ functions. Every predicate function takes a single
  integer, and returns a boolean. These predicates span all areas of integer math, from
  number theory, to factorization and primes, to combinatorics and beyond.
  
   - `is_abundant?/1` - Test if an integer is _abundant_
   - `is_achilles_number?/1` - Is `n` an Achilles Number?
   - `is_arithmetic_number?/1` - Test if an integer is an _arithmetic_ number
   - `is_cubefree?/1` - Are any factors of `n` perfect cubes?
   - `is_deficient?/1` - Test if an integer is _deficient_
   - `is_highly_abundant?/1` - Test if an integer is a _highly abundant_ number
   - `is_highly_powerful_number?/1` - Test if an integer is a _highly powerful_ number
   - `is_odious_number?/1` - Does binary expansion of `n` have odd number of `1`s?
   - `is_perfect?/1` - Test if an integer is _perfect_
   - `is_perfect_cube?/1` - Is `m` a perfect square?
   - `is_perfect_power?/1` - Is `n` a perfect power?
   - `is_perfect_square?/1` - Is `n` a perfect square?
   - `is_powerful_number?/1` - Test if an integer is a _powerful_ number
   - `is_prime?/1` - Test if an integer is prime
   - `is_prime_fast?/1` - Alternative prime test, faster in specific cases of `n`
   - `is_sphenic_number?/1` - Is `n` the product of three distinct primes?
   - `is_squarefree?/1` - Are any factors of `n` perfect squares?


  ## Number Theory
  
  Functions related to [Number Theory](https://en.wikipedia.org/wiki/Number_theory) operations over the integers.
  
   - `aliquot_sum/1` - Find the Aliquot Sum of `n`
   - `bigomega/1` - Big Omega function - count of distinct primes, with multiplicity
   - `divisors_of_form_mx_plus_b/3` - Divisors of `n` that conform to values of `mx + b`
   - `hamming_weight/2` - Find the Hamming Weight, the count of digits not `0`, in different base representations of `n`
   - `is_of_mx_plux_b/3` - Does `n` conform to values of `mx + b`
   - `jordan_totient/2` - Calculate the Jordan totient `J-k(n)`
   - `lucas_number/1` - Find the `n`-th Lucas Number
   - `mobius_function/1` - Classical Mobius Function
   - `omega/1` - Omega function - count of distinct primes
   - `partition_count/1` - Number of ways to partition `n` into sums
   - `p_adic_valuation/2` - The _p-adic_ valuation function (for prime `p` and integer `n`)
   - `pell_number/1` - Find the `n`-th denominator in the infinite sequence of fractional approximations of `sqrt(2)`
   - `pentagonal_number/1` - Find the `n`-th pentagonal number
   - `product_of_prime_factor_exponents/1` - Decompose `n` to prime factors of the form `x^y`, find product of all `y`
   - `radical/1` - Square-free kernel, or `rad(n)` - product of distict prime factors
   - `sigma/2` - Generalized Sigma function for integers
   - `square_pyramidal_number/1` - Number of elements in an `n x n` stacked square pyramid
   - `tetrahedral_number/1` - Find the `n`-th tetrahedral number
   - `totient/1` - Calculate Euler's totient for `n`
   - `triangle_number/1` - Number of elements in a triangle of `n` rows
   - `triangle_row_for_element/1` - Row in triangle for `n`-th element
   - `triangle_position_for_element/1` - Position in triangel for `n`-th element


  ## Polynomials
  
   - `binomial/2` - Compute the binomial coefficient over `(n k)`
   - `euler_polynomial/2` - Calculate the Euler polynomial `E_m(x)`
   - `j_invariant_q_coefficient/1` - Find the `n`-th coefficient of the _q_ expansion of the modular J invariant function.
   - `ramanujan_tau/1` - Find Ramanujan's Tau of `n`

  
  ## Combinatorics
  
  Functions dealing with [Combinatorics](https://en.wikipedia.org/wiki/Combinatorics), permutation calculations, and related topics.
  
   - `bell_number/1` - Compute the number of partitions of a set of size `n`
   - `catalan_number/1` - Find the Catalan number for `n`, counts of highly recursive objects and sets
   - `derangement_count/1` - Number of derangements of set size `n`, or _subfactorial n_
   - `endomorphism_count/1` - Number of endomorphisms of a set of size `n`
   - `euler_number/1` - Find the `n`-th Euler number. Also written `EulerE`.
   - `eulerian_number/2` - `A(n, m)`, the number of permutations of the numbers 1 to `n` in which exactly `m` elements are greater than the previous element
   - `euler_zig/1` - Find the `n`-th Euler _zig_ number
   - `euler_zig_zag/1` - Calculate the size of certain set permutations
   - `fubini_number/1` - Find the `n`-th Fubini number, the number of ordered partitions of a set size `n`
   - `involutions_count/1` - Number of self-inverse permutations of `n` elements
   - `ordered_subsets_count/1` - Count the number of partitions of a set of size `n` into any number of ordered lists.
   - `plane_partition_count/1` - Number of plane partitions with sum `n`
   - `wedderburn_etherington_number/1` - Calculate the size of certain binary tree sets
  
  
  ## Graph Theory
  
  Analyze numbers related to graph theory and trees.
  
   - `cayley_number/1` - Number of trees for `n` labeled vertices
   - `labeled_rooted_forests_count/1` - Number of labeled, rooted forests with `n` nodes
   - `labeled_rooted_trees_count/1` - Number of labeled, rooted trees with `n` nodes
   - `rooted_tree_count/1` - The number of unlabeled, or planted, trees with `n` nodes
  
  
  ## Fractals
  
  Integer fractals, and related number sets.
  
   - `start_kolakoski_sequence/1` - Initialize the structure for a Kolakoski sequence
   - `extend_kolakoski_sequence/1` - Extend a Kolakoski sequence by one iteration
   - `extend_kolakoski_sequence_to_length/2` - Extend a Kolakoski sequence to be _at least_ the given length
  
  
  ## Abstract Algebra
  
  Functions, numbers, and set counting related to [Abstract Algebra](https://en.wikipedia.org/wiki/Abstract_algebra).

   - `abelian_group_count/1` - Number of Abelian groups of order `n`

  
  ## Differential Topology
  
  Manifolds, differential geometry, and [differential topology](https://en.wikipedia.org/wiki/Differential_topology) functions.
  
   - `hurwitz_radon_number/1` - Calculate the Hurwitz-Radon number for `n`

  
  ## Cryptography
  
  Functions related to cryptographc analysis, factorization in cryptography, and numeric constructions.

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
  
  Number sequence iteration functions used by the `Chunky.Sequence` library.

   - `next_abundant/1` - Find the next abundant number after `n`
   - `next_deficient/1` - Find the next deficient number after `n`
   - `next_number/2` - Use a number theory predicate to find the next integer in a sequence
  """

  require Integer
  alias Chunky.Math
  alias Chunky.Fraction
  alias Chunky.CacheAgent
  require Chunky.CacheAgent
  
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
  The _factorial_ of `n`, or `n!`.
  
  A factorial of `n` is the product of `n * (n - 1) * (n - 2) * ... 1`.
  
  This implementation uses a cache to speed up efficiency.
  
  ## Examples
  
      iex> Math.factorial(1)
      1
      
      iex> Math.factorial(10)
      3628800
  
      iex> Math.factorial(20)
      2432902008176640000
  
      iex> Math.factorial(100)
      93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000
  """
  def factorial(0), do: 1
  def factorial(1), do: 1
  def factorial(n) when is_integer(n) and n > 1 do
  
      CacheAgent.start_link(:factorial)
      
      if CacheAgent.has?(:factorial, n) do
          CacheAgent.get(:factorial, n)
      else
          f = n * factorial(n - 1)
          CacheAgent.put(:factorial, n, f)
          f
      end
  end
  
  @doc """
  Count the number of primes less than or equal to `n`.
  
  Sometimes written `pi(n)` or `π(n)`, this is the prime counting function.
  
  This impementation uses a summation over fractions of the `sigma/1` function. If the
  counting function needs to be applied over a sequence of numbers, it is more efficient
  to use the OEIS A000720 sequence from `Chunky.Sequences.OEIS.Core`, as it unrolls the
  continued summation using historic values:
  
  ```elixir
  counter = Sequence.create(Sequence.OEIS.Core, :a000720)
  ```
  
  ## Examples
  
      iex> Math.prime_pi(1)
      0

      iex> Math.prime_pi(38)
      12

      iex> Math.prime_pi(945)
      160

      iex> Math.prime_pi(100000)
      9592
  
  """
  def prime_pi(1), do: 0
  def prime_pi(n) do
     # a(n) = Sum_{i=2..n} floor((i+1)/A000203(i)). 
     2..n
     |> Enum.map(
         fn i -> 
             Fraction.new(i + 1, sigma(i)) |> Fraction.get_whole()
         end
     )
     |> Enum.sum()
  end
  
  @doc """
  Generate `n` digits of pi, as a single large integer.
  
  This function uses a non-digit extraction version of Bailey-Borwein-Plouffe summation
  for generating accurate digits of Pi in base 10. This uses a summation over fractional
  values to maintain precision:
  
   ![BBP Formula](https://wikimedia.org/api/rest_v1/media/math/render/svg/a675e5ac4cf478f78b22b812c974d14acbdde1a9)
  
  Using this formula, it is possible to create many hundreds of digits of Pi in less than a second. Generating
  5,000 digits takes roughly 30 seconds.
  
  ## Examples
  
      iex> Math.digits_of_pi(3)
      314
  
      iex> Math.digits_of_pi(31)
      3141592653589793238462643383279
  
      iex> Math.digits_of_pi(45)
      314159265358979323846264338327950288419716939
  
  """
  def digits_of_pi(1), do: 3
  def digits_of_pi(2), do: 31
  def digits_of_pi(3), do: 314
  def digits_of_pi(n) when n > 3 do
      # Pi = Sum_{n>=0} (1/16^n) * (4/(8*n+1) - 2/(8*n+4) - 1/(8*n+5) - 1/(8*n+6))
      0..n
      |> Enum.map(
          fn k -> 
              
              m_0 = Fraction.new(1, Math.pow(16, k))
              
              f_1 = Fraction.new(4, 8 * k + 1)
              f_2 = Fraction.new(2, 8 * k + 4)
              f_3 = Fraction.new(1, 8 * k + 5)
              f_4 = Fraction.new(1, 8 * k + 6)
              
              f_0 = Fraction.subtract(f_1, f_2) |> Fraction.subtract(f_3) |> Fraction.subtract(f_4)
              
              Fraction.multiply(m_0, f_0)
              
          end
      )
      |> Fraction.sum()     
      |> Fraction.multiply(Math.pow(10, n - 1)) |> Fraction.get_whole()
  end
  
  @doc """
  Carry forward calculation of the next digit of Pi.
  
  The `next_digit_of_pi/0` and `next_digit_of_pi/1` functions provide a digit-at-a-time
  iterative generation of digits of Pi, accurate to at least 3,000 digits. This is useful
  for on demand generation of digits, but it does require a carry forward state value.
  
  Use like:
  
  ```elixir
  {digit_0, carry} = next_digit_of_pi()
  {digit_1, carry} = next_digit_of_pi(carry)
  {digit_2, carry} = next_digit_of_pi(carry)
  ...
  ```
  
  This version of the Pi digit generation function will likely be updated in a future
  release to use a base-16 algorithm that is accurate for a larger number of digits.
  """
  def next_digit_of_pi() do
      calc_pi(1, 0, 1, 1, 3, 3)
  end
  
  @doc """
  See `next_digit_of_pi/0`.
  
  """
  def next_digit_of_pi({q, r, t, k, n, l}) do
     calc_pi(q, r, t, k, n, l) 
  end

  # fast continuous pi calculation - seems to be a variant of the Chudnovsky's algorithm
  # via http://rosettacode.org/wiki/Pi#Elixir  
  defp calc_pi(q,r,t,k,n,l) when (4*q + r - t) < n*t do
    {n, {q*10, 10*(r-n*t), t, k, div(10*(3*q+r), t) - 10*n, l}}
  end
  
  defp calc_pi(q,r,t,k,_n,l) do
    calc_pi(q*k, (2*q+r)*l, t*l, k+1, div(q*7*k+2+r*l, t*l), l+2)
  end
  
  @doc """
  Caculate the rising factorial `n^(m)`.
  
  Also called the Pochhammer function, Pochhammer polynomial, ascending factorial, or upper factorial, 
  this is the polynomial expansion:
  
   ![Rising Factorial](https://wikimedia.org/api/rest_v1/media/math/render/svg/582bbc9f3d2d7a530c5a7efd9ab60fb76d3390a7)
  
  ## Examples
  
      iex> Math.rising_factorial(3, 0)
      1
  
      iex> Math.rising_factorial(4, 3)
      120

      iex> Math.rising_factorial(7, 5)
      55440

      iex> Math.rising_factorial(11, 13)
      7124122778572800

  """
  def rising_factorial(_n, 0), do: 1
  def rising_factorial(n, m) do
      0..m-1
      |> Enum.map(
          fn k -> 
              n + k
          end
      )
      |> Enum.reduce(1, fn x, acc -> x * acc end)
  end
  
  @doc """
  Calculate the falling factorial `(n)m`.
  
  Also called the descending factorial, falling sequential product, or lower factorial, this is the polynomial
  expansion:
  
   ![falling factorial](https://wikimedia.org/api/rest_v1/media/math/render/svg/3c904ddd2ae9825f11215663784898e30ead84bb)
  
  ## Examples
  
      iex> Math.falling_factorial(4, 0)
      1

      iex> Math.falling_factorial(6, 3)
      120

      iex> Math.falling_factorial(8, 10)
      0

      iex> Math.falling_factorial(21, 7)
      586051200
  
  """
  def falling_factorial(_n, 0), do: 1
  def falling_factorial(n, m) do
      0..m-1
      |> Enum.map(
          fn k -> 
              n - k
          end
      )
      |> Enum.reduce(1, fn x, acc -> x * acc end)      
  end

  @doc """
  Find the `n`-th Fubini number, the number of ordered partitions of a set size `n`.
  
  The Fubini numbers are also useful as (via [OEIS A000670](https://oeis.org/search?q=a000670&sort=&language=&go=Search)):
  
   - the number of preferential arrangements of n labeled elements
   - the number of weak orders on n labeled elements
   - the number of ways n competitors can rank in a competition, allowing for the possibility of ties
   - the number of chains of subsets starting with the empty set and ending with a set of n distinct objects
   - the number of 'factor sequences' of N for the case in which N is a product of n distinct primes
  
  This implementation is recursive and relies on `binomial/2`, so it uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.fubini_number(0)
      1

      iex> Math.fubini_number(3)
      13

      iex> Math.fubini_number(19)
      92801587319328411133

      iex> Math.fubini_number(52)
      11012069943086163504795579947992458193990796847590859607173763880168176185195
  
  """  
  def fubini_number(0), do: 1
  def fubini_number(n) when is_integer(n) and n > 0 do
     CacheAgent.cache_as(:fubini_number, n) do
         # a(n) = Sum_{k=1..n} binomial(n, k)*a(n-k), a(0) = 1 
         1..n
         |> Enum.map(
             fn k -> 
                 binomial(n, k) * fubini_number(n - k)
             end
         )
         |> Enum.sum()
     end
  end
  
  @doc """
  Find the `n`-th tetrahedral number.
  
  Tetrahedral numbers can be represented as a sum of triangular numbers:
  
   ![Tetrahedral summation](https://wikimedia.org/api/rest_v1/media/math/render/svg/f75ff3f01f58729aafe89087b0001ac84d1ca766)
  
  or a binomial:
  
   ![Tetrahedral binomial](https://wikimedia.org/api/rest_v1/media/math/render/svg/d91b89cbba8e06657f7f2734a9f6d250f1b00d46)
  
  or as a rising factorial:
  
   ![Tetrahedral rising factorial](https://wikimedia.org/api/rest_v1/media/math/render/svg/cd0d400f129098e951207d52c19a470d610b0606)
  
  This implementation uses the rising factorial, which reduces to just addition and multiplication operations.
  
  ## Examples
  
      iex> Math.tetrahedral_number(0)
      0

      iex> Math.tetrahedral_number(34)
      7140

      iex> Math.tetrahedral_number(47)
      18424

      iex> Math.tetrahedral_number(9876)
      160591999876
  
  """
  def tetrahedral_number(0), do: 0
  def tetrahedral_number(n) when is_integer(n) and n > 0 do
      div(rising_factorial(n, 3), 6)
  end
  
  @doc """
  Find the `n`-th pentagonal number.
  
  See [Pentagonal number](https://en.wikipedia.org/wiki/Pentagonal_number) for a useful visualization of how
  pentagonal numbers grow.
  
  ## Examples
  
      iex> Math.pentagonal_number(0)
      0

      iex> Math.pentagonal_number(30)
      1335

      iex> Math.pentagonal_number(300)
      134850

      iex> Math.pentagonal_number(874)
      1145377
  
  """
  def pentagonal_number(0), do: 0
  def pentagonal_number(n) when is_integer(n) and n > 0 do
      div(3 * n * n - n, 2)
  end
  
  @doc """
  Find the `n`-th _square_ pyramidal number.
  
  The number of elements in a square stacked pyramid `n` levels tall, or `n x n` at the base.
  
  Via [Pyramidal square number](https://en.wikipedia.org/wiki/Square_pyramidal_number) on Wikipedia:
  
  >  Square pyramidal numbers also solve the problem of counting 
  > the number of squares in an n × n grid
  
  ## Examples
  
      iex> Math.square_pyramidal_number(0)
      0

      iex> Math.square_pyramidal_number(20)
      2870

      iex> Math.square_pyramidal_number(147)
      1069670

      iex> Math.square_pyramidal_number(970)
      304694945
  
  """
  def square_pyramidal_number(0), do: 0
  def square_pyramidal_number(n) when is_integer(n) and n >= 0 do
     div(n * (n + 1) * (2 * n + 1), 6)
  end
  
  @doc """
  Find the triangle or triangular number of `n`.
  
  The triangle number is the number of elements in the triangular arrangement of elements
  with `n` elements on a side. 
  
  ## Examples
  
      iex> Math.triangle_number(0)
      0
  
      iex> Math.triangle_number(4)
      10

      iex> Math.triangle_number(50)
      1275
        
      iex> Math.triangle_number(475)
      113050

      iex> Math.triangle_number(29999)
      449985000

  """
  def triangle_number(0), do: 0
  def triangle_number(1), do: 1
  def triangle_number(n) when is_integer(n) and n > 1 do
      div(n * (n + 1), 2)
  end
  
  @doc """
  Find the triangle row and offset for the `n`th item in a triangle.
  
  Given an element or number triangle with a single element at the root, counting rows
  from 1, and elements from 0, this function will determine at which row and offset the `n`-th
  element will occur.
  
  So, given the triangle:
  
  ```
        *
       * *
      * * *
     * + * *
    * * * * *
   * * * * * *
  ```
  
  The `+` is the 8th item (index 7) in the triangle, and is on row 4, offset `1` from the left
  
    iex> Math.triangle_position_for_element(7)
    {4, 1}
  
  ## Examples
  
      iex> Math.triangle_position_for_element(0)
      {1, 0}

      iex> Math.triangle_position_for_element(11)
      {5, 1}

      iex> Math.triangle_position_for_element(20)
      {6, 5}
    
      iex> Math.triangle_position_for_element(32003)
      {253, 125}
  
  """
  def triangle_position_for_element(n) when is_integer(n) and n >= 0 do
      
      row = triangle_row_for_element(n)
      col = n - triangle_number(row - 1)
      
      {row, col}
  end
  
  @doc """
  Calculate the row in which the `n`-th element would be in an element triangle.
  
  Given an element or number triangle with a single element at the root, counting rows
  from 1, and elements from 0, this function will determine at which row the `n`-th
  element will occur.
  
  So, given the triangle:
  
  ```
        *
       * *
      * * *
     * + * *
    * * * * *
   * * * * * *
  ```
  
  The `+` is the 8th item (index 7) in the triangle, and is on row 4:
  
    iex> Math.triangle_row_for_element(7)
    4
  
  ## Examples
  
      iex> Math.triangle_row_for_element(0)
      1
  
      iex> Math.triangle_row_for_element(11)
      5
      
      iex> Math.triangle_row_for_element(20)
      6

      iex> Math.triangle_row_for_element(30130)
      245

  """
  def triangle_row_for_element(n) when is_integer(n) and n >= 0 do
      check_triangle_row(n, 1)
  end
  
  defp check_triangle_row(n, row) do
     if triangle_number(row) > n do
         row
     else
         check_triangle_row(n, row + 1)
     end 
  end
  
  @doc """
  Count the maximum number of pieces that can be made from `n` cuts of a disk.
  
  Also called the Central Polygonal Numbers, Pizza Numbers, or the Lazy Caterer's Sequence.
  
  ## Examples
  
      iex> Math.pancake_cut_max(1)
      2
  
      iex> Math.pancake_cut_max(3)
      7

      iex> Math.pancake_cut_max(7)
      29

      iex> Math.pancake_cut_max(24)
      301
      
  """
  def pancake_cut_max(n) do
      div(n * n + n + 2, 2)
  end
  
  @doc """
  Calculate Cayley's formula for `n` - the number of trees on `n` labeled vertices.
  
  This formula also works for:
  
   - number of spanning trees of a complete graph with labeled vertices
   - number of transitive subtree acyclic digraphs on n-1 vertices
   - counts parking functions
   - the number of nilpotent partial bijections (of an n-element set)
  
  ## Examples
  
      iex> Math.cayley_number(1)
      1

      iex> Math.cayley_number(5)
      125

      iex> Math.cayley_number(18)
      121439531096594251776

      iex> Math.cayley_number(37)  
      7710105884424969623139759010953858981831553019262380893
  
  """
  def cayley_number(0), do: 1
  def cayley_number(1), do: 1
  def cayley_number(n) when is_integer(n) and n > 1 do
      Math.pow(n, n - 2)
  end
  
  @doc """
  Count the number of partitions of a set into any number of ordered lists.
  
  Also known as the sum of all sizes of _k-subsets_ of original set of size `n`.
  
  This implementation is based on a recurrence relation:
  
  ```
  A(n) = (2 * n - 1) * A(n - 1) - (n - 1) * (n - 2) * A(n - 2)
  ```
  
  As this is a highly recursive relation, a cache is used for efficiency.
  
  ## Examples
  
      iex> Math.ordered_subsets_count(1)
      1

      iex> Math.ordered_subsets_count(3)
      13

      iex> Math.ordered_subsets_count(11)
      824073141

      iex> Math.ordered_subsets_count(30)
      197987401295571718915006598239796851
  
  
  """
  def ordered_subsets_count(0), do: 1
  def ordered_subsets_count(1), do: 1
  def ordered_subsets_count(n) when is_integer(n) and n > 1 do
  
    # a(n) = (2*n-1)*a(n-1) - (n-1)*(n-2)*a(n-2).    
    CacheAgent.cache_as(:ordered_subsets_count, n) do
        (2 * n - 1) * ordered_subsets_count(n - 1) - (n - 1) * (n - 2) * ordered_subsets_count(n - 2)
    end
    
  end
  
  @doc """
  Calculate the binomial coefficient (n k).
  
  The binomial coefficient function determines the coefficient on the `x^k` term in the polynomial expansion
  of `(1 + x)^n`. 
  
  Rather than run a full expansion, this function relies on the simple formula:
  
  ![Binomial coefficient](https://wikimedia.org/api/rest_v1/media/math/render/svg/a2457a7ef3c77831e34e06a1fe17a80b84a03181)
  
  As the `factorial/1` function in Chunky.Math uses a cached speed up strategy, the calculation of the
  binomial by this method is fairly efficient.
  
  ## Examples
  
      iex> Math.binomial(7, 3)
      35
  
      iex> Math.binomial(20, 3)
      1140
  
      iex> Math.binomial(20, 10)
      184756
  
      iex> Math.binomial(100, 50)
      100891344545564193334812497256
  """
  def binomial(n, k) do
      
      # n! / (k! * (n - k)!)
      div(factorial(n), (factorial(k) * factorial(n - k)))
  end
  
  @doc """
  Calculate the Bell Number of `n`, or the number of possible partitions of a set of size `n`.
  
  This function implementation relies on caching for efficiency.
  
  ## Examples
  
      iex> Math.bell_number(3)
      5

      iex> Math.bell_number(10)
      115975

      iex> Math.bell_number(15)
      1382958545

      iex> Math.bell_number(35)
      281600203019560266563340426570
  
  """
  def bell_number(0), do: 1
  def bell_number(1), do: 1
  def bell_number(n) when is_integer(n) and n > 1 do
     # a(n+1) = Sum_{k=0..n} a(k)*binomial(n, k)  
     CacheAgent.start_link(:bell_number)
     
     if CacheAgent.has?(:bell_number, n) do
         CacheAgent.get(:bell_number, n)
     else
         
         b_n = 0..n - 1
         |> Enum.map(
             fn k -> 
                 bell_number(k) * binomial(n - 1, k)
             end
         )
         |> Enum.sum()
         
         CacheAgent.put(:bell_number, n, b_n)
         b_n
     end
  end
  
  @doc """
  Find the Pell Number for `n`.
  
  Pell numbers are an infinite sequence of integers that form the denominators of increasingly
  accurate fractional representations of `sqrt(2)`. See [Pell Number](https://en.wikipedia.org/wiki/Pell_number) on
  Wikipedia or [Pell Number](http://mathworld.wolfram.com/PellNumber.html) on MathWorld.
  
  Calculating the Pell numbers takes a similar recursive form to calculating the Fibonacci sequence:
  
  ```
  Pell(n) = 2 * Pell(n - 1) + Pell(n - 2)
  ```
  
  This implementation uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.pell_number(1)
      1

      iex> Math.pell_number(10)
      2378

      iex> Math.pell_number(67)
      15646814150613670132332869

      iex> Math.pell_number(123)
      42644625325266431622582204734101084193553730205
  
  """
  def pell_number(0), do: 0
  def pell_number(1), do: 1
  def pell_number(n) when is_integer(n) and n > 1 do
      
      CacheAgent.cache_as(:pell_number, n) do
          2 * pell_number(n - 1) + pell_number(n - 2)          
      end
      
  end
  
  @doc """
  Count the number of endofunctions (as endomorphisms) for a set of size `n`.
  
  This counts endofunctions as an endomorphism over the set of size `n`, which is equivalent to `n^n`.
  
  ## Examples
  
      iex> Math.endomorphism_count(0)
      1

      iex> Math.endomorphism_count(4)
      256

      iex> Math.endomorphism_count(40)
      12089258196146291747061760000000000000000000000000000000000000000

      iex> Math.endomorphism_count(123)
      114374367934617190099880295228066276746218078451850229775887975052369504785666896446606568365201542169649974727730628842345343196581134895919942820874449837212099476648958359023796078549041949007807220625356526926729664064846685758382803707100766740220839267
  
  """
  def endomorphism_count(n) when is_integer(n) and n >= 0 do
     Math.pow(n, n) 
  end
  
  @doc """
  Calculate the Eulerian Number `A(n, m)`, the number of permutations of the numbers 1 to `n` in which exactly `m` 
  elements are greater than the previous element.
  
  The Eulerian numbers form the Euler triangle:
  
  ```
                   1								
               1       1							
            1      4       1						
         1     11      11     1					
      1     26     66     26    1
    1    57    302    302    57   1	
  ```
  
  Where `n` is the row (starting at 1) and `m` is the offset in the row (starting at 0). So the value `66` is at
  row 5, offset 2:
  
      iex> Math.eulerian_number(5, 2)
      66
  
  The sum of values at row `n` is `n!`
  
  This implementation of Eulerian Number calculation uses a recursive algorithm with caching for efficiency.
  
  ## Examples
  
      iex> Math.eulerian_number(5, 4)
      1

      iex> Math.eulerian_number(7, 4)
      1191

      iex> Math.eulerian_number(9, 3)
      88234

      iex> Math.eulerian_number(25, 13)
      3334612565134607644610436
  
  """
  def eulerian_number(_n, 0), do: 1
  def eulerian_number(n, m) when is_integer(n) and is_integer(m) and m >= n, do: 0
  def eulerian_number(n, m) do
      
      CacheAgent.start_link(:eulerian_number)
      
      if CacheAgent.has?(:eulerian_number, {n, m}) do
          CacheAgent.get(:eulerian_number, {n, m})
      else
          # We use the recursive definition so we can take advantage of caching
          # A(n, m) = (n - m) * A(n - 1, m - 1) + (m + 1) * A(n - 1, m)      
          e_n = (n - m) * eulerian_number(n - 1, m - 1) + (m + 1) * eulerian_number(n - 1, m)
          
          # cache and return
          CacheAgent.put(:eulerian_number, {n, m}, e_n)
          e_n
      end
      
  end
  
  @doc """
  Calculate the Euler _zig zag_, or up/down, number for `n`.
  
  The zig zag set is used in combinatorics to count the size of alternating sets of permutations.
  
  Other noted uses of the zig zag numbers (via OEIS [A000111](https://oeis.org/A000111)):
  
   - Number of linear extensions of the "zig-zag" poset.
   - Number of increasing 0-1-2 trees on n vertices. 
   - ... the number of refinements of partitions.
   - For n >= 2, a(n-2) = number of permutations w of an ordered n-set
   - The number of binary, rooted, unlabeled histories with n+1 leaves
  
  As the calculation of the Euler Zig Zag is multiply recursive, this implementation
  uses a cache for efficiency. 
  
  ## Examples
  
      iex> Math.euler_zig_zag(1)
      1
  
      iex> Math.euler_zig_zag(10)
      50521
  
      iex> Math.euler_zig_zag(20)
      370371188237525
  
      iex> Math.euler_zig_zag(99)
      45608516616801111821043829531451697185581949239892414478770427720660171869441004793654782298700276817088804993740898668991870306963423232
  """
  def euler_zig_zag(n) when is_integer(n) and n >=0 and n <= 2, do: 1
  def euler_zig_zag(n) when is_integer(n) and n > 2 do
      
      #a(n) = (Sum_{k=0..n - 1} binomial(n - 1, k) * a(k)*a(n - 1-k)) / 2    
      
      CacheAgent.start_link(:euler_zig_zag)
      if CacheAgent.has?(:euler_zig_zag, n) do
          CacheAgent.get(:euler_zig_zag, n)
      else
          bin_sum = 0..n-1
          |> Enum.map(
              fn k -> 
                  binomial(n - 1, k) * euler_zig_zag(k) * euler_zig_zag(n - 1 - k)
              end
          )
          |> Enum.sum()
      
          ezz = div(bin_sum, 2)
          CacheAgent.put(:euler_zig_zag, n, ezz)
          ezz
      end
      
      
  end
  
  @doc """
  Find the `n`-th Euler _zig_ number.
  
  Values for this function are based on the relation of the zig numbers to Euler Numbers, of
  the form `ezig(n) = abs(EulerE(2n))`
  
  ## Examples
  
      iex> Math.euler_zig(0)
      1

      iex> Math.euler_zig(2)
      5

      iex> Math.euler_zig(10)
      370371188237525
  
  """
  def euler_zig(n) do
     abs(euler_number(n * 2))
  end
  
  @doc """
  Find the `n`-th Euler number. Also written `EulerE`.
  
  This calculation of the `n`-th Euler number is based on the Euler Polynomial:
  
  ```
  E_n(1/2) * 2^n
  ```
  
  such that the 6th Euler Number would be:
  
  ```
  E_6(1/2) * 2^6
  ```
  
  or `-61`
  
  ## Examples
  
      iex> Math.euler_number(0)
      1
  
      iex> Math.euler_number(3)
      0
  
      iex> Math.euler_number(6)
      -61
      
      iex> Math.euler_number(16)
      19391512145

      iex> Math.euler_number(64)
      45358103330017889174746887871567762366351861519470368881468843837919695760705
  
  
  """
  def euler_number(0), do: 1
  def euler_number(n) when n > 0 do
      
      # eulerE(n) implies euler_polynomial(n, 1/2)
      euler_polynomial(n, Fraction.new(1, 2)) |> Fraction.multiply(Math.pow(2, n)) |> Fraction.get_whole()
  end
    
  @doc """
  Calculate the Euler polynomial `E_m(x)`.
  
  This calculate is based on the explicit double summation:
  
   ![Euler Polynomial](https://wikimedia.org/api/rest_v1/media/math/render/svg/366c7fd491d5020bb3b39a761f965f8b9f608c13)
  
  In this implementation the value of `x` is always converted to a fraction before calculations
  begin.
  
  ## Examples
  
      iex> Math.euler_polynomial(6, Fraction.new(1, 2))
      %Chunky.Fraction{den: 4096, num: -3904}

      iex> Math.euler_polynomial(6, 4) |> Fraction.get_whole()
      1332

      iex> Math.euler_polynomial(2, 15) |> Fraction.get_whole()
      210

      iex> Math.euler_polynomial(8, Fraction.new(1, 3))
      %Chunky.Fraction{den: 1679616, num: 7869952}
  
  """
  def euler_polynomial(m, x) when is_integer(x) do
      euler_polynomial(m, Fraction.new(x))
  end
  
  def euler_polynomial(m, %Fraction{}=x) do
     
     # hoo boy.
     # e<m>(x) = sum {0..m:n} (1 / 2^n * sum {0..n:k} (-1)^k * binomial(n k) * (x + k)^m)
     
     0..m
     |> Enum.map(
         fn n -> 
             
             # fractional first sum
             frac = Fraction.new(1, Math.pow(2, n))
             
             # run the inner summation
             inner_sum = 0..n
             |> Enum.map(
                 fn k -> 
                     
                     # fractional inner summation components
                     carry = Math.pow(-1, k) * binomial(n, k)
                     Fraction.add(x, k) |> Fraction.power(m) |> Fraction.multiply(carry)
                 end
             )
             |> Fraction.sum()
             
             # fraction times inner sum
             Fraction.multiply(frac, inner_sum)
         end
     )
     |> Fraction.sum()

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
  Find the `n`-th Lucas Number.
  
  The Lucas Number is a recursive sequence, similar to the Fibonacci sequence, with alternative
  starting values. The successive values in the Lucas sequence form a ratio that approaches the Golden Ratio.
  
  This implementation uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.lucas_number(4)
      7
      
      iex> Math.lucas_number(203)
      2657608295638762232902023676028758508503879
  
  """
  def lucas_number(0), do: 2
  def lucas_number(1), do: 1
  def lucas_number(n) when is_integer(n) and n > 1 do
      
      CacheAgent.start_link(:lucas_number)
      
      if CacheAgent.has?(:lucas_number, n) do
          CacheAgent.get(:lucas_number, n)
      else
          ln = lucas_number(n - 1) + lucas_number(n - 2)
          CacheAgent.put(:lucas_number, n, ln)
          ln
      end

  end
  
  @doc """
  Count the number of planar partitions with sum `n`.
  
  Via [Plane partition](https://en.wikipedia.org/wiki/Plane_partition):
  
  > in combinatorics, a plane partition is a two-dimensional array of nonnegative integers `π{i,j}`
  > (with positive integer indices i and j) that is nonincreasing in both indices.
  
  The generalized formula for counting the number of plane partitions is
  
   ![Plane Partitions](https://wikimedia.org/api/rest_v1/media/math/render/svg/6a47dc6d5f1c5433e41e61d5a9c1c32301d8a0ad)
  
  This implementation uses the recurrence relationship:
  
  ```
  PL(n) = sum{1..n:k} PL(n - k) * sigma-2(k)
  ```
  
  As this is a deeply recursive recurrence, this implementation uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.plane_partition_count(1)
      1

      iex> Math.plane_partition_count(7)
      86

      iex> Math.plane_partition_count(13)
      2485

      iex> Math.plane_partition_count(34)
      28175955
  
  """
  def plane_partition_count(0), do: 1
  def plane_partition_count(1), do: 1
  def plane_partition_count(n) when is_integer(n) and n > 1 do
      
      # Working from the recurrence relation:
      # a(n) = sum{1..n:k} a(n - k) * sigma(k, 2)
      CacheAgent.cache_as(:plane_partition_count, n) do
          a = 1..n
          |> Enum.map(
              fn k -> 
                  plane_partition_count(n - k) * sigma(k, 2)
              end
          )
          |> Enum.sum()
          div(a, n)
      end
  end
  
  @doc """
  The number of unlabeled, or planted, trees with `n` nodes.
  
  Alternative definitions:
  
   - Sometimes called [Polya Trees](https://projecteuclid.org/download/pdfview_1/euclid.cbms/1362163749)
   - Number of ways of arranging n-1 nonoverlapping circles
   - Number of connected multigraphs of order n without cycles except for one loop
  
  This function is _highly_ recursive, and in this implementation uses a cache
  to increase efficiency.
  
  ## Examples
  
      iex> Math.rooted_tree_count(2)
      1
  
      iex> Math.rooted_tree_count(21)
      35221832
  
      iex> Math.rooted_tree_count(53)
      10078062032127180323468
  
      iex> Math.rooted_tree_count(150)
      9550651408538850116424040916940356193332141892140610711711231180087
  """
  def rooted_tree_count(n) when is_integer(n) and n >= 0 and n < 2, do: n
  def rooted_tree_count(n) when is_integer(n) and n >= 2 do

      # def a(n):
      #     if n < 2: return n
      #     return add(
      #         add( d * a(d) for d in divisors(j) )
      #         * a(n-j) for j in (1..n-1)
      #     ) / (n - 1)
      #  ref: sage version via [Peter Luschny](https://oeis.org/wiki/User:Peter_Luschny)

      CacheAgent.start_link(:rooted_tree_count)
      
      if CacheAgent.has?(:rooted_tree_count, n) do
         CacheAgent.get(:rooted_tree_count, n) 
      else
          
          # iterate up to n - 1
          part_a = 1..n-1

          |> Enum.map(
              fn j -> 
              
                  # iterate divisors of j
                  inner = factors(j)
                  |> Enum.map(
                      fn d -> 
                          d * rooted_tree_count(d)
                      end
                  )
              
                  # add result of d in divisors(j)
                  |> Enum.sum() 
              
                  # tail tree count term with (n - j)
                  inner * rooted_tree_count(n - j)
              
              end
          )
      
          # add result of j in (1..n-1)
          |> Enum.sum()
      
          # final division
          ans = div(part_a, n - 1)
          
          # cache and return
          CacheAgent.put(:rooted_tree_count, n, ans)
          ans
          
      end

  end
  
  @doc """
  Determine if `n` is a value of the form `mx + b` or `mk + b`, for specific
  values of `m` and `b`.
  
  This function checks if an integer `n` is of a specific form, and is not
  an interpolation of the line formula.
  
  ## Examples
  
  Check if numbers are of the form `4k + 3`:
  
      iex> Math.is_of_mx_plus_b?(4, 3, 1)
      false
  
      iex> Math.is_of_mx_plus_b?(4, 3, 27)
      true
  
      iex> Math.is_of_mx_plus_b?(4, 3, 447)
      true
  """
  def is_of_mx_plus_b?(m, b, n, x \\ 0) do
      v = (m * x) + b
      cond do
         v == n -> true
         v < n -> false || is_of_mx_plus_b?(m, b, n, x + 1) 
         true -> false
      end
  end
  
  @doc """
  Find all divisors of `n` of the form `mx + b`.
  
  ## Examples
  
      iex> Math.divisors_of_form_mx_plus_b(4, 1, 5)
      [1, 5]
  
      iex> Math.divisors_of_form_mx_plus_b(4, 1, 45)
      [1, 5, 9, 45]
  
      iex> Math.divisors_of_form_mx_plus_b(4, 3, 4)
      []
  
      iex> Math.divisors_of_form_mx_plus_b(4, 3, 9975)
      [3, 7, 15, 19, 35, 75, 95, 175, 399, 475, 1995, 9975]
  """
  def divisors_of_form_mx_plus_b(m, b, n) do
     
     # find divisors
     factors(n)
     
     # filter to form
     |> Enum.filter(fn f -> is_of_mx_plus_b?(m, b, f) end)
     
  end

  @doc """
  Calculate the Hurwitz-Radon number for `n`, the number of independent vector
  fields on a sphere in `n`-dimensional euclidean space.
  
  See [Vector fields on spheres](https://en.wikipedia.org/wiki/Vector_fields_on_spheres) for more
  information.
  
  This function uses a set of `2-adic` calculations to compute `n` in a closed form.
  
  ## Examples
  
      iex> Math.hurwitz_radon_number(9)
      1
  
      iex> Math.hurwitz_radon_number(32)
      10
  
      iex> Math.hurwitz_radon_number(288)
      10
  
      iex> Math.hurwitz_radon_number(9600)
      16
  
  """
  def hurwitz_radon_number(n) when is_integer(n) and n > 0 do
     # a(n)=8*(valuation(n, 2)\4)+2^(valuation(n, 2)%4)    
     #  [Paul D Hanna](https://oeis.org/wiki/User:Paul_D._Hanna)
     
     8 * div(p_adic_valuation(2, n), 4) + Math.pow(2, rem(p_adic_valuation(2, n), 4))
  end
  
  @doc """
  Find the Catalan number of `n`, `C(n)`.
  
  In combinatorial math, the Catalan numbers occur in a wide range of counting problems.
  
  ![Catalan Number](https://wikimedia.org/api/rest_v1/media/math/render/svg/58374aa2b2e2c016a5b313e2bbd59940a2e1a5f9)
  
  Rather than the factorial or binomial expansion, this implementation uses a product over
  fractional parts to avoid recursion and precision loss.
  
  ## Examples
  
      iex> Math.catalan_number(2)
      2
  
      iex> Math.catalan_number(20)
      6564120420
  
      iex> Math.catalan_number(100)
      896519947090131496687170070074100632420837521538745909320
  
      iex> Math.catalan_number(256)
      1838728806050447178945542295919013188631170099776194095631629802153953581076132688111479765113051517392441367036708073775588228430597313880732554755142
  """
  def catalan_number(0), do: 1
  def catalan_number(1), do: 1
  def catalan_number(2), do: 2
  def catalan_number(n) when is_integer(n) and n > 2 do
      
      # fractional product over n and k
      2..n
      |> Enum.map(
          fn k -> 
              Fraction.new(n + k, k)
          end
      )
      |> Enum.reduce(1, fn x, acc -> Fraction.multiply(x, acc) end)
      |> Fraction.get_whole()
  end
  
  @doc """
  Count the number of labeled, rooted trees with `n` nodes.
  
  A rooted tree will have exactly one path between any two nodes, and the total number of such
  trees with `n` nodes is `n^(n - 1)`.
  
  ## Examples
  
      iex> Math.labeled_rooted_trees_count(1)
      1

      iex> Math.labeled_rooted_trees_count(5)
      625

      iex> Math.labeled_rooted_trees_count(17)
      48661191875666868481

      iex> Math.labeled_rooted_trees_count(29)
      88540901833145211536614766025207452637361
  
  
  """
  def labeled_rooted_trees_count(n) when is_integer(n) and n > 0 do
      Math.pow(n, n - 1)
  end
  
  @doc """
  Count the number of labeled, rooted forests with `n` nodes.
  
  A rooted forest will have _at most_ one path between any two nodes, and the total number of
  such forets with `n` nodes is `(n + 1)^(n - 1)` (a generalization of the Cayley formula).
  
  ## Examples
  
      iex> Math.labeled_rooted_forests_count(1)
      1
    
      iex> Math.labeled_rooted_forests_count(3)
      16

      iex> Math.labeled_rooted_forests_count(11)
      61917364224

      iex> Math.labeled_rooted_forests_count(32)
      118558347188026655500106547231096910504441858017
  
  """
  def labeled_rooted_forests_count(n) when is_integer(n) and n > 0 do
      Math.pow(n + 1, n - 1)
  end
  
  @doc """
  Calculate the Wedderburn-Etherington number for `n`.
  
  In combinatorics, the Wedderburn-Etherington number is used to determine the size
  of certain sets of Binary Trees. Other uses include (via [Wikipedia](https://en.wikipedia.org/wiki/Wedderburn–Etherington_number) and
  [OEIS A001190](https://oeis.org/A001190)):
  
   - Otter Trees - the number of unordered rooted trees with n leaves in which all nodes including the root have either zero or exactly two children.
   - Planted Trees - the number of unordered rooted trees with n nodes in which the root has degree zero or one and all other nodes have at most two children.
   - The number of different ways of organizing a single-elimination tournament for n players
   - Number of colorations of Kn (complete graph of order n) with n-1 colors such that no triangle is three-colored
  
  Calculation of the Wedderburn-Etherington number is done via a recurrence relationship for odd `n`:
  
   ![Wedderburn-Etherington for Odd N](https://wikimedia.org/api/rest_v1/media/math/render/svg/2840c45affaa88907f57ffcb16aa5887adf7c8de)
  
  and even `n`:
  
   ![Wedderburn-Etherington for Even N](https://wikimedia.org/api/rest_v1/media/math/render/svg/c0d95535d780adb26ddcc780dbb59bab0c495d19)
  
  Because these relations are _highly_ recursive, this implementation uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.wedderburn_etherington_number(3)
      1

      iex> Math.wedderburn_etherington_number(5)
      3
      
      iex> Math.wedderburn_etherington_number(9)
      46

      iex> Math.wedderburn_etherington_number(45)
      639754054803187

      iex> Math.wedderburn_etherington_number(300)
      1972666500548256069567265504055115733765719122240464770401890754621349706143463425967160618093669965967626678829167
  
  """
  def wedderburn_etherington_number(0), do: 0
  def wedderburn_etherington_number(n) when is_integer(n) and n < 4, do: 1
  
  def wedderburn_etherington_number(n) when is_integer(n) and Integer.is_odd(n) do
      
      # start the cache
      CacheAgent.start_link(:wedderburn_etherington_number)
      
      if CacheAgent.has?(:wedderburn_etherington_number, n) do
          CacheAgent.get(:wedderburn_etherington_number, n)
      else

          # odd case is based on recurrence relation of 2n - 1
          sub_n = div(n + 1, 2)
      
          wen = 1..sub_n - 1
          |> Enum.map(
              fn i -> 
                  wedderburn_etherington_number(i) * wedderburn_etherington_number(2 * sub_n - i - 1)
              end
          )
          |> Enum.sum()
          
          CacheAgent.put(:wedderburn_etherington_number, n, wen)
          wen
      end
      
  end
  
  def wedderburn_etherington_number(n) when is_integer(n) and Integer.is_even(n) do
      
      # start the cache
      CacheAgent.start_link(:wedderburn_etherington_number)
      
      if CacheAgent.has?(:wedderburn_etherington_number, n) do
         CacheAgent.get(:wedderburn_etherington_number, n) 
      else
          # even case is based on recurrence relation of 2n
          sub_n = div(n, 2)
      
          # determine the summation portion
          sum_part = 1..sub_n - 1
          |> Enum.map(
              fn i -> 
                  wedderburn_etherington_number(i) * wedderburn_etherington_number(2 * sub_n - i)
              end
          )
          |> Enum.sum()
      
          # fractional portion
          s_n = wedderburn_etherington_number(sub_n)
          frac_part = div(s_n * (s_n + 1), 2)
      
          wen = frac_part + sum_part
          
          CacheAgent.put(:wedderburn_etherington_number, n, wen)
          wen
          
      end
      
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
  Create a Kolakoski Sequence over the default alphabet of [1, 2]. 
  
  A [Kolakoski Sequence](https://en.wikipedia.org/wiki/Kolakoski_sequence) is a self-describing, **Run Length Encoding**
  over a specific alphabet of integers. The first values of the sequence are:
  
  ```
  1,2,2,1,1,2,1,2,2,1,2,...
  ```
  
  In the OEIS catalog, this is sequence [A000002](https://oeis.org/A000002).
  
  This sequence, unlike most others, does not extend by a single value at a time, rather by a length
  related to the size of the alphabet. 
  
  See also `extend_kolakoski_sequence/1` and `extend_kolakoski_sequence_to_size/2` for ways to
  work with the sequence. The data returned by this function, and the other Kolakoski
  functions, carries the calculated sequence, the iteration number, and the alphabet, all of which
  are required for generating new values for the sequence.
  
  See also `Chunky.Sequence.OEIS.Core` and the `A000002` sequence.
  
  ## Examples
  
      iex> Math.start_kolakoski_sequence()
      {[], 0, {1, 2}}
  
      iex> Math.start_kolakoski_sequence() |> Math.extend_kolakoski_sequence()
      {[1], 1, {1, 2}}
  
      iex> Math.start_kolakoski_sequence() |> Math.extend_kolakoski_sequence_to_length(20)
      {[1, 2, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2, 1], 13, {1, 2}}
  
  """
  def start_kolakoski_sequence(alphabet \\ {1, 2}) do
     {[], 0, alphabet} 
  end
  
  @doc """
  Extend a Kolakoski sequence by one iteration.
  
  Each iteration of the sequence will add one, or more, elements to the sequence.
  
  See `start_kolakoski_sequence/1` and `extend_kolakoski_sequence_to_length/2`.
  
  ## Examples
  
      iex> Math.start_kolakoski_sequence() |> Math.extend_kolakoski_sequence()
      {[1], 1, {1, 2}}
  
  """
  def extend_kolakoski_sequence({[], 0, alphabet}), do: {[1], 1, alphabet}
  def extend_kolakoski_sequence({[1], 1, alphabet}), do: {[1, 2, 2], 2, alphabet}
  def extend_kolakoski_sequence({seq, iter, alphabet}) when is_list(seq) and is_integer(iter) do
      
      xi = Enum.at(seq, iter)
      
      if Integer.is_odd(iter + 1) do
          # outputs 1's 
          {seq ++ repeat(1, xi), iter + 1, alphabet}
      else
          # outputs 2's
          {seq ++ repeat(2, xi), iter + 1, alphabet}
      end
      
  end
  
  @doc """
  Extend a Kolakoski sequence by successive iterations until the sequence is _at least_
  the given length.
  
  As each iteration of the sequence will add one _or more_ elements to the sequence, the
  best guarantee that can be made is that the newly extended sequence will have _at least_
  a certain number of elements.
  
  ## Examples
  
      iex> Math.start_kolakoski_sequence() |> Math.extend_kolakoski_sequence_to_length(23)
      {[1, 2, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 1, 1], 15, {1, 2}}
  
      iex> {seq, _, _} = Math.start_kolakoski_sequence() |> Math.extend_kolakoski_sequence_to_length(26)
      iex> length(seq)
      27
  
  """
  def extend_kolakoski_sequence_to_length({seq, _, _}=k_seq, size) when is_integer(size) do
     if length(seq) >= size do
         k_seq 
     else
         k_seq |> extend_kolakoski_sequence() |> extend_kolakoski_sequence_to_length(size)
     end
  end
  
  defp repeat(n, 1), do: [n]
  defp repeat(n, c) do
      [n] ++ repeat(n, c - 1)
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
  Find the `n`-th coefficient of the _q_ expansion of the modular J invariant function.
  
  The Laurent series of the q-expansion begins:
  
   ![q-expansion fourier transform](https://wikimedia.org/api/rest_v1/media/math/render/svg/008db1b5f38a2d653aa56b2930705d30c40a97e1)
  
  This function finds the `n`-th `q` coefficient using a recursive relation to the sigma-5 and sigma-3
  of components of the expansion.
  
  Because this implementation is recursive, it uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.j_invariant_q_coefficient(-1)
      1

      iex> Math.j_invariant_q_coefficient(10)
      22567393309593600

      iex> Math.j_invariant_q_coefficient(20)
      189449976248893390028800

      iex> Math.j_invariant_q_coefficient(121)
      20834019715817024229638765444619811002731409879518705977860
  
  """
  def j_invariant_q_coefficient(-1), do: 1
  def j_invariant_q_coefficient(n) do
     # a(n) = (1/(n+1))*Sum_{k=1..n+1} (504*A001160(k) - 240*(n-k) * A001158(k)) * a(n-k) 
     # A001160 = sigma-5 
     # A001158 = sigma-3
     
     CacheAgent.cache_as(:j_invariant_q_coefficient, n) do
         # gather the summation
         sum_term = 1..n+1
         |> Enum.map(
             fn k -> 
                 (504 * sigma(k, 5) - 240 * (n - k) * sigma(k, 3)) * j_invariant_q_coefficient(n - k)
             end
         )
         |> Enum.sum()
     
         # build the fractional component and complete
         Fraction.new(1, n + 1) |> Fraction.multiply(sum_term) |> Fraction.get_whole()
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
  Determine if a positive integer is prime. 
  
  This function uses a cache of the first 100 primes as a first stage sieve and comparison set. In some
  cases using this method will result in a speed up over using `is_prime?/1`:
  
   - For numbers < 542, `is_prime_fast?/1` is a MapSet membership check
   - When iterating integers for prime candidates, `is_prime_fast?/1` can show an ~9% speed up over `is_prime?/1`
  
  In all cases, `is_prime_fast?/1` falls back to calling `is_prime?` and the Miller-Rabin primality test code
  in cases where the prime cache cannot conclusively prove or disprove primality.
  
  ## Examples
  
      iex> 1299601 |> Math.is_prime_fast?()
      true
  
      iex> 1237940039285380274899124225 |> Math.is_prime_fast?()
      false
  """
  @first_primes_list [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73,79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157,163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241,251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347,349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439,443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541]
  @first_primes_mapset MapSet.new(@first_primes_list)
  def is_prime_fast?(i) when is_integer(i) and i < 2, do: false
  def is_prime_fast?(2), do: true
  def is_prime_fast?(i) when is_integer(i) and i > 2 and Integer.is_even(i), do: false
  def is_prime_fast?(i) when is_integer(i) and i > 2 do
     if i < 542 do
        @first_primes_mapset |> MapSet.member?(i) 
     else
         # partial sieve, this is a fast reject sieve
         if is_factored_by_first_primes?(@first_primes_list, i) do
             false
         else
             # now miller rabin if we haven't bailed yet
             is_prime?(i)
         end
     end
  end
  
  defp is_factored_by_first_primes?([], _i), do: false
  defp is_factored_by_first_primes?([h | rest], i) do
     if rem(i, h) == 0 do
         true
     else
         is_factored_by_first_primes?(rest, i)
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
  Find the Hamming Weight of `n` in a specific numeric base.
  
  By default, the Hamming Weight is calculated in Base 2.
  
  Hamming weight, binary weight, population count, or (in binary) bit summation, is the number of symbols
  in a given base representation of an integer that _are not_ `0`. See [Hamming Weight](https://en.wikipedia.org/wiki/Hamming_weight).
  
  ## Examples
  
      iex> Math.hamming_weight(29)
      4
      
      iex> Math.hamming_weight(29, 10)
      2
      
      iex> Math.hamming_weight(100)
      3
  
      iex> Math.hamming_weight(100, 10)
      1
  
  """
  def hamming_weight(n, base \\ 2) do
     n
     |> Integer.digits(base)
     |> Enum.filter(fn d -> d != 0 end)
     |> length() 
  end
  
  @doc """
  Odious numbers have an odd number of `1`s in their binary expansion.
  
  See definition on [MathWorld](http://mathworld.wolfram.com/OdiousNumber.html) or [Wikipedia](https://en.wikipedia.org/wiki/Odious_number).
  
  ## Examples
  
      iex> Math.is_odious_number?(2)
      true

      iex> Math.is_odious_number?(37)
      true

      iex> Math.is_odious_number?(144)
      false

      iex> Math.is_odious_number?(280)
      true

      iex> Math.is_odious_number?(19897)
      true
  
  """
  def is_odious_number?(i) when is_integer(i) and i > 0 do
     ones = i
     |> Integer.digits(2)
     |> Enum.filter(fn d -> d == 1 end)
     |> Enum.sum() 
     
     rem(ones, 2) == 1
  end
  
  @doc """
  Find the number of derangements of a set of size `n`.
  
  A derangement of a set is a permutation of the set, such that no element is in its original 
  position. Also called the _subfactorial of n_, the _recontres number_, or _de Montmor_ number.
  
  This implementation uses the Euler recurrence, `a(n) = n * a(n - 1) + -1^n`.
  
  ## Examples
  
      iex> Math.derangement_count(1)
      0

      iex> Math.derangement_count(8)
      14833

      iex> Math.derangement_count(17)
      130850092279664

      iex> Math.derangement_count(134)
      733162663744579191293964143415001307906325722892139819974619962654978249255036185299413091417144999745154783570225783145979302466795277487832988219926200862943908125847693470304687165754228414941338831577093697357593753008645129
  
  """
  def derangement_count(0), do: 1
  def derangement_count(n) when is_integer(n) and n > 0 do
      n * derangement_count(n - 1) + Math.pow(-1, n)
  end
  
  @doc """
  Find the number of involutions, or self-inverse permutations, on `n` elements.
  
  Also known as [Permutation Involution](http://mathworld.wolfram.com/PermutationInvolution.html).
  
  This implementation is based on a recursive calculation, and so uses a cache for efficiency.
  
  ## Examples
  
      iex> Math.involutions_count(1)
      1

      iex> Math.involutions_count(10)
      9496

      iex> Math.involutions_count(100)
      24053347438333478953622433243028232812964119825419485684849162710512551427284402176

      iex> Math.involutions_count(234)
      60000243887036070789348415368171135887062020098670503272477698436854394126572492217644586010812169497365274140196122299728842304082915845220986966530354668079910372211697866503760297656388279100434472952800147699927974040547172024320
  
  
  """
  def involutions_count(0), do: 1
  def involutions_count(1), do: 1
  def involutions_count(n) when n > 1 do
     # a(n) = a(n-1) + (n-1)*a(n-2), n>1.
     CacheAgent.start_link(:involutions_count)
     
     if CacheAgent.has?(:involutions_count, n) do
         CacheAgent.get(:involutions_count, n)
     else
        a_n = involutions_count(n - 1) + (n - 1) * involutions_count(n - 2) 
        CacheAgent.put(:involutions_count, n, a_n)
        a_n
     end
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
  def next_number(property_func, n, step \\ 1)
      when is_function(property_func, 1) and is_integer(n) and n >= 0 do
    if property_func.(n + 1) do
      n + 1
    else
      next_number(property_func, n + 1, step)
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
