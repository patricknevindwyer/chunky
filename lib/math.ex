defmodule Chunky.Math do
  @moduledoc """
  Integer math, number theory, factorization, prime numbers, and numerical analysis.

  A seperate module of predicate functions (inspection and analysis of individual integers, like
  testing for primality) are available in `Chunky.Math.Predicates`.
  

  ## Modular Arithmetic

  Pure integer operations for Modular Arithmetic.

   - `pow/3` - Integer power in modular exponentiation


  ## Generating Constants

   - `digits_of_pi/1` - Generate `n` digits of pi, as a large integer
   - `next_digit_of_pi/0` and `next_digit_of_pi/1` - A state carrying digit generator for Pi


  ## Integer Arithmetic

  Arithmetic functions for pure integer operations.

   - `double_factorial/1` - Double factorial (`n!!`) of `n`
   - `factorial/1` - Factorial (`n!`) of `n`
   - `falling_factorial/2` - Falling factorial of `(n)m`
   - `integer_nth_root?/3` - Determine if an integer has a specific `n-th` root
   - `integer_nth_root/3` - Find the `n`-th integer root, if it exists
   - `lcm/2` - Least common multiple of `n` and `m`
   - `lcm/1` - Least common multiple of a list of integers
   - `nth_integer_root/2` - Nearest `m`-th root of `n` such that `root^m <= n`, returning a tuple
   - `nth_integer_root!/2` - Nearest `m`-th root of `n` such that `root^m <= n`, returning an integer
   - `pow/2` - Integer exponentiation
   - `rising_factorial/2` - Rising factorial of `n^(m)`


  ## Float Arithmetic

   - `nth_root/3` - Floating point `n-th` root of an integer
   - `floats_equal?/3` - Determine if two floats are equal, within an error bound

  
  ## Sets and Lists
  
   - `has_subset_sum?/2` - Does any subset of integers in a list sum to `n`?
  
  
  ## Factorization and Divisors

  Work with divisors and prime factors.

   - `factorization_count/1` - Count the number of possible factorizations of `n`.
   - `factor_pairs/2` - Find pair wise factors of `n`.
   - `factors/1` - All divisors for an integer
   - `is_power_of?/2` - Is `n` a power of `m`?
   - `is_root_of?/2` - Check if `m` is a k-th root of `n`
   - `ordered_factorization_count/1` - Count the number of _ordered_ factorizations of `n`
   - `partitions_into_two_squares/1` - Count the number of partitions of `n` into the sum of two squares
   - `prime_factors/1` - Factorize an integer into prime factors
   - `reduced_prime_factors/1` - Find the prime factors and their powers for `n`
   - `sigma/1` - Sigma-1 function (sum of divisors)
   - `tau/1` - Tau function, number of divisors of `n`


  ## Digit Checks and Manipulations

   - `contains_digit?/2` - Check if `n` contains the digit in its current base representation
   - `is_cyclops_number_in_base?/2` - Is `n` a cyclops number in base `b`?
   - `digit_count/3` - Count digits in `n` in any base representation
   - `digit_runs/2` - Break `n` apart into runs of similar digits
   - `digit_runs_count/2` - Count the number of digit runs in `n`
   - `digit_sum/1` - Calculate the sum of the digits of `n`
   - `is_in_base?/2` - Is the number or list of digits `n` a valid number in base `b`?
   - `is_pandigital_in_base?/2` - Is `n` a pandigital number in base `b`?
   - `is_plaindrome_in_base?/2` - Does `n` have never decreasing digits in base `b`?
   - `is_palindromic_in_base?/2` - Is `n` palindromic in base `b`?
   - `length_in_base/2` - How many digits long is `n` in base `b`?
   - `remove_digits!/3` - Remove one or more digits from `n`, returning a reconstituted number
   - `repunit/1` - Calculate the `n`th Repunit
   - `reverse_number/1` - Reverse the digits of `n`
   - `rotations/1` - Enumerate all circular rotations of `n`
   - `to_base/2` - Convert a decimal integer to any base, returning an integer or list depending on base


  ## Primes

  Analyze, test, and generate prime numbers.

   - `coprimes/1` - Find coprimes of `n` from 2 to `n - 1`
   - `coprimes/2` - Find coprimes of `n` up to `a`
   - `greatest_prime_factor/1` - Find the largest prime factor of `n`
   - `is_coprime?/2` - Test if two integers are _coprime_ or _relatively prime_
   - `is_euler_jacobi_pseudo_prime?/2` - Euler-Jacobi pseudo-primality of `n` in base `b`
   - `is_euler_pseudo_prime?/2` - Euler pseudo-primality of `n` in base `b`
   - `is_pseudo_prime?/2` - Fermat pseudo-primality of `n` in base `b`
   - `least_prime_factor/1` - Find the smallest prime factor of `n`
   - `prime_factor_exponents/1` - Find the exponents of all prime factors of `n`
   - `prime_pi/1` - Prime counting function, number of primes less than or equal `n`


  ## Number Theory

  Functions related to [Number Theory](https://en.wikipedia.org/wiki/Number_theory) operations over the integers.

   - `aliquot_sum/1` - Find the Aliquot Sum of `n`
   - `bernoulli_number/1` - Find the `n`-th Bernoulli number
   - `bigomega/1` - Big Omega function - count of distinct primes, with multiplicity
   - `chebyshev_triangle_coefficient/2` - Calculate coefficient of Chebyshev's polynomial of the second kind
   - `divisors_of_form_mx_plus_b/3` - Divisors of `n` that conform to values of `mx + b`
   - `get_rhonda_to/2` - Find the bases for which `n` is a Rhonda number
   - `hamming_weight/2` - Find the Hamming Weight, the count of digits not `0`, in different base representations of `n`
   - `is_of_mx_plux_b/3` - Does `n` conform to values of `mx + b`
   - `is_rhonda_to_base?/2` - Is `n` a Rhonda number to base `b`?
   - `jacobi_symbol/2` - Calculate the Jacobi symbol for `(a/n)`
   - `jordan_totient/2` - Calculate the Jordan totient `J-k(n)`
   - `legendre_symbol/2` - Calculate the Legendre symbol for `(a/p)`
   - `lucas_number/1` - Find the `n`-th Lucas Number
   - `lucky_numbers/1` - Generate the first `n` Lucky Numbers
   - `mobius_function/1` - Classical Mobius Function
   - `omega/1` - Omega function - count of distinct primes
   - `partition_count/1` - Number of ways to partition `n` into sums
   - `p_adic_valuation/2` - The _p-adic_ valuation function (for prime `p` and integer `n`)
   - `pell_number/1` - Find the `n`-th denominator in the infinite sequence of fractional approximations of `sqrt(2)`
   - `pentagonal_number/1` - Find the `n`-th pentagonal number
   - `perfect_partition_count/1` - Count of perfect partitions of `n`
   - `product_of_prime_factor_exponents/1` - Decompose `n` to prime factors of the form `x^y`, find product of all `y`
   - `radical/1` - Square-free kernel, or `rad(n)` - product of distict prime factors
   - `sigma/2` - Generalized Sigma function for integers
   - `square_pyramidal_number/1` - Number of elements in an `n x n` stacked square pyramid
   - `stern_diatomic_series/1` - Find the `n`th number in the diatomic series
   - `tetrahedral_number/1` - Find the `n`-th tetrahedral number
   - `totient/1` - Calculate Euler's totient for `n`
   - `triangle_number/1` - Number of elements in a triangle of `n` rows
   - `triangle_row_for_element/1` - Row in triangle for `n`-th element
   - `triangle_position_for_element/1` - Position in triangle for `n`-th element


  ## Polynomials

   - `binomial/2` - Compute the binomial coefficient over `(n k)`
   - `euler_polynomial/2` - Calculate the Euler polynomial `E_m(x)`
   - `j_invariant_q_coefficient/1` - Find the `n`-th coefficient of the _q_ expansion of the modular J invariant function.
   - `ramanujan_tau/1` - Find Ramanujan's Tau of `n`


  ## Combinatorics

  Functions dealing with [Combinatorics](https://en.wikipedia.org/wiki/Combinatorics), permutation calculations, and related topics.

   - `bell_number/1` - Compute the number of partitions of a set of size `n`
   - `binary_partitions_count/1` - Find the number of ways to partition `2 * n` into powers of `2`
   - `catalan_number/1` - Find the Catalan number for `n`, counts of highly recursive objects and sets
   - `derangement_count/1` - Number of derangements of set size `n`, or _subfactorial n_
   - `endomorphism_count/1` - Number of endomorphisms of a set of size `n`
   - `euler_number/1` - Find the `n`-th Euler number. Also written `EulerE`.
   - `eulerian_number/2` - `A(n, m)`, the number of permutations of the numbers 1 to `n` in which exactly `m` elements are greater than the previous element
   - `euler_zig/1` - Find the `n`-th Euler _zig_ number
   - `euler_zig_zag/1` - Calculate the size of certain set permutations
   - `fubini_number/1` - Find the `n`-th Fubini number, the number of ordered partitions of a set size `n`
   - `hipparchus_number/1` - Find the `n`-th Hipparchus/Schroeder/super-Catalan number
   - `involutions_count/1` - Number of self-inverse permutations of `n` elements
   - `jacobsthal_number/1` - Calculate the `n`-th Jacobsthal number
   - `motzkin_number/1` - The number of different ways of drawing non-intersecting chords between `n` points on a circle
   - `n_choose_k/2` - Calculate the number of `k` element sets that can be obtained from an `n` element set
   - `ordered_subsets_count/1` - Count the number of partitions of a set of size `n` into any number of ordered lists.
   - `pancake_cut_max/1` - Count the maximum number of pieces that can be made from `n` cuts of a disk.
   - `plane_partition_count/1` - Number of plane partitions with sum `n`
   - `schroder_number/1` - Find the `n`th Schröder number.
   - `stirling_partition_number/2` - Number of non-empty sets of size `k` that can be made from a set of size `n`
   - `total_partitions/1` - Count the number of total, or series reduced tree, partitions of `n` elements
   - `two_color_bracelet_with_period_count/2` - The number of bracelet permutations for `n` beads, with period `n`
   - `two_color_bracelet_count/2` - The number of bracelet permutations for `n` beads of two colors
   - `wedderburn_etherington_number/1` - Calculate the size of certain binary tree sets


  ## Graph Theory

  Analyze numbers related to graph theory and trees.

   - `cayley_number/1` - Number of trees for `n` labeled vertices
   - `labeled_rooted_forests_count/1` - Number of labeled, rooted forests with `n` nodes
   - `labeled_rooted_trees_count/1` - Number of labeled, rooted trees with `n` nodes
   - `planted_3_trees_count/1` - The number of planted 3 trees of height less than `n`
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


  ## Number Generation

  Number sequence iteration functions used by the `Chunky.Sequence` library.

   - `next_number/2` - Use a number theory predicate to find the next integer in a sequence
  """

  require Integer
  alias Chunky.CacheAgent
  alias Chunky.Fraction
  alias Chunky.Math
  alias Chunky.Math.Predicates
  
  require Chunky.CacheAgent
  require Chunky.Math.Operations
  
  import Chunky.Math.Operations, only: [summation: 3]

  @doc """
  Find the prime factors of `n` as the factors to a power.
  
  While the `prime_factors/1` function will return the full prime factorization
  of `n` as a list of all factors (such as `[1, 2, 2, 3]` for factors of `12`), this
  function returns a list of tuples, with each tuple containing the prime factor, and
  the power of the prime factor, such as `[{1, 1}, {2, 2}, {3, 1}]` for the prime
  factors of `12`.
  
  ## Examples
  
      iex> Math.reduced_prime_factors(1)
      [{1, 1}]

      iex> Math.reduced_prime_factors(16)
      [{2, 4}]

      iex> Math.reduced_prime_factors(34560)
      [{2, 8}, {3, 3}, {5, 1}]

      iex> Math.reduced_prime_factors(30223017)
      [{3, 3}, {11, 3}, {29, 2}]
  
  """
  def reduced_prime_factors(1), do: [{1, 1}]
  def reduced_prime_factors(n) when is_integer(n) and n > 1 do
      prime_factors(n) -- [1]
      |> Enum.chunk_by(fn v -> v end)
      |> Enum.map(fn run -> {run |> List.first(), length(run)} end)
  end
  
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
  Find all pairs of factors of `n`, with or without duplicates.

  This is a variant of the `factors/1` function, in that it builds the full pairs
  of factors of `n` in tuple form.

  ## Options

   - `duplicates` - Boolean. Default `false`. If `true`, include the ordered duplicates of factors (see examples)

  ## Examples

      iex> Math.factor_pairs(8)
      [{1, 8}, {2, 4}]
      
      iex> Math.factor_pairs(8, duplicates: true)
      [{1, 8}, {2, 4}, {4, 2}, {8, 1}]

      iex> Math.factor_pairs(84)
      [1, 2, 3, 4, 6, 7, 12, 14, 21, 28, 42, 84]
      [{1, 84}, {2, 42}, {3, 28}, {4, 21}, {6, 14}, {7, 12}]

      
  """
  def factor_pairs(n, opts \\ []) do
    # are we including the pair wise duplicates?
    dupes = opts |> Keyword.get(:duplicates, false)

    # find our factors and break everything down, taking only
    # the parts of the original factors that we need
    n_fs = factors(n)

    if dupes do
      n_fs
    else
      n_fs |> Enum.take(n_fs |> length() |> div(2))
    end
    |> Enum.map(fn f -> {f, div(n, f)} end)
  end

  @doc """
  Count the number of _ordered_ factorizations of `n`.

  Also called the Hille function, or Kalmár's problem, this counts all possible factorizations (not all necessarily prime)
  of `n`, regardless of order. So `10` has 3 factorizations, `2x5`, `5x2`, and `10`.

  OEIS References:

   - [A074206 - Kalmár's problem: number of ordered factorizations of n](https://oeis.org/A074206)

  ## Examples

      iex> Math.ordered_factorization_count(1)
      1

      iex> Math.ordered_factorization_count(8)
      4

      iex> Math.ordered_factorization_count(25)
      2

      iex> Math.ordered_factorization_count(104)
      20

      iex> Math.ordered_factorization_count(3648)
      2496

  """
  def ordered_factorization_count(0), do: 0
  def ordered_factorization_count(1), do: 1

  def ordered_factorization_count(n) when is_integer(n) and n > 1 do
    CacheAgent.cache_as :ordered_factorization_count, n do
      summation k, factors(n) -- [n] do
        ordered_factorization_count(k)
      end
    end
  end
  
  @doc """
  Does a list of numbers contain any subset that sums to `n`?
  
  The [subset sum](https://en.wikipedia.org/wiki/Subset_sum_problem) solution is an NP-Complete problem. For this
  implementation a series of heuristics is used to quickly eliminate edge cases, and then an exponential time exact
  combinatoric algorithm is used to search for solutions. This algoritm is a _fast pass_ recursion - as soon as a
  valid solution is found, the algorithm terminates. The best case running time is `O(1)`, while the worst case (a full
  search of all solutions, with no valid sum) is exponential to the size of the list of numbers, or approximates `O(2^N*N)`.
  
  
  ## Examples
  
      iex> Math.has_subset_sum?([1, 2, 3, 5, 11], 9)
      true

      iex> Math.has_subset_sum?([1, 2, 3, 5, 11], 11)
      true

      iex> Math.has_subset_sum?([1, 2, 3, 5, 11], 23)
      false
  
      iex> Math.has_subset_sum?([-3, 2, 4, 11], -1)
      true

      iex> Math.has_subset_sum?([-3, 2, 4, 11], 14)
      true

      iex> Math.has_subset_sum?([-3, 2, 4, 11], 10)
      true
  
  
  """
  def has_subset_sum?(nums, n) when is_list(nums) and is_integer(n) do
            
      # Our heuristics
      #  - is N an explict member of the set?
      #  - are nums all positive and n negative
      #  - are nums all positive and n > sum(nums)
      #  - are nums all even and n is negative?
      #  - are nums all negative and n positive
      #  - are nums all negative and n < sum(nums)
      #  - is N < sum(negatives)
      #  - is N > sum(positives)
      all_pos = nums |> Enum.all?(&Predicates.is_positive?/1)
      all_neg = nums |> Enum.all?(&Predicates.is_negative?/1)
      all_evs = nums |> Enum.all?(&Predicates.is_even?/1)
      pos_sum = nums |> Enum.filter(&Predicates.is_positive?/1) |> Enum.sum()
      neg_sum = nums |> Enum.filter(&Predicates.is_negative?/1) |> Enum.sum()
      
      cond do
          
         Enum.member?(nums, n) -> true 
         
         all_pos && Predicates.is_negative?(n) -> false
         
         all_pos && Enum.sum(nums) < n -> false
         
         all_evs && Predicates.is_odd?(n) -> false
         
         all_neg && Predicates.is_positive?(n) -> false
         
         all_neg && Enum.sum(nums) > n -> false
         
         n > pos_sum -> false
         
         n < neg_sum -> false
         
         true ->
             # drop into a pass fast check of all combinations
             1..length(nums)
             |> Enum.any?(fn subset_size ->
                 case subset_check(nums, subset_size, n) do
                     true -> true
                     _ -> false
                 end 
             end)
             
      end
      
  end
  
  defp subset_check(_, 0, _), do: [[]]
  defp subset_check([], k, _) when is_integer(k), do: []
  defp subset_check([head | tail], k, value) when is_integer(k) and is_integer(value) do
      
      # our tail call could have a boolean or a list
      tail_comb = subset_check(tail, k - 1, value)
      # IO.inspect(tail_comb)
            
      cond do
                    
          # if it's a boolean, pass it back
          is_boolean(tail_comb) -> tail_comb
          
          # not a bool, keep tryin
          true -> 
              
              # check these inner values
              inner_comb = Enum.map(
                tail_comb,
                fn r_comb ->
                  [head | r_comb]
                end
              )
              
              # now we check to see if any of the inner values calculated so far
              # match our test value - if so, return boolean, otherwise return
              # our tail sets
              if Enum.any?(inner_comb, fn vals -> Enum.sum(vals) == value end) do
                  true
              else
                  
                  # before we return our tail set, check if the _tail_ had a boolean
                  # answer
                  subs = subset_check(tail, k, value)
                  cond do
                      is_boolean(subs) -> subs
                      true -> inner_comb ++ subs
                  end                  
              end
          
      end
  end
  

  @doc """
  Count the number of possible factorizations of `n`.

  This counts a number as a factor of itself, as well as multi-set factorizations. So `8`
  has `3` factorizations; `8`, `2*4`, and `2*2*2`.

  ## Examples

      iex> Math.factorization_count(1)
      1

      iex> Math.factorization_count(30)
      5

      iex> Math.factorization_count(286)
      5

      iex> Math.factorization_count(9984)
      254

  """
  def factorization_count(n) when is_integer(n) and n > 0, do: factorization_count(n, n)

  defp factorization_count(n, m) do
    # based on the Python version by [Indranil Ghosh](https://oeis.org/wiki/User:Indranil_Ghosh)
    if Predicates.is_prime?(n) do
      if n <= m do
        1
      else
        0
      end
    else
      s =
        (factors(n) -- [1, n])
        |> Enum.filter(fn d -> d <= m end)
        |> Enum.map(fn d -> factorization_count(div(n, d), d) end)
        |> Enum.sum()

      if n <= m do
        s + 1
      else
        s
      end
    end
  end

  @doc """
  Check if a number `n` in numeric base `b` is a _plaindrome_. A _plaindrome_ has digits that
  never _decrease_ in value when read from left to right.

  ## Examples

      iex> Math.is_plaindrome_in_base?(123456, 10)
      true
      
      iex> Math.is_plaindrome_in_base?(11111, 10)
      true

      iex> Math.is_plaindrome_in_base?(111232, 10)
      false

      iex> Math.is_plaindrome_in_base?(9842, 3)
      true
  """
  def is_plaindrome_in_base?(n, b) when is_integer(n) and is_integer(b) and b > 1 do
    p_digits = Integer.digits(n, b)
    s_digits = p_digits |> Enum.sort()

    p_digits == s_digits
  end

  @doc """
  Determine if `n` is _pandigital_ in base `b`.

  A number `n` is _pandigital_ when it contains all of the digits used in its base
  _at least_ once. So in base 10 `1234567888890` is pandigital, but `123456789` is not. The
  number `n` is treated as base 10, and converted to the base `b` before being tested.

  ## Examples

      iex> Math.is_pandigital_in_base?(75, 4)
      true
      
      iex> Math.is_pandigital_in_base?(1182263086756, 5)
      true
      
      iex> Math.is_pandigital_in_base?(2048, 10)
      false
  """
  def is_pandigital_in_base?(n, b) do
    Integer.digits(n, b)
    |> Enum.uniq()
    |> length() == b
  end

  @doc """
  Check if `n` is a valid number in base `b`.

  A number `n` that contains only valid digits in base `b` will be considered
  to be a valid number in that base. This test assumes that the value being
  provided is already in base `b`.

  If the value being tested is a number, this will only check number up to base 10. To
  check bases above 10, provide a list of digits, like `[10, 17, 1, 29]` (`285359` in base 30).

  ## Examples

      iex> Math.is_in_base?(123456, 5)
      false
      
      iex> Math.is_in_base?(101011101, 2)
      true
      
      iex> Math.is_in_base?(2430432, 6)
      true

      iex> Math.is_in_base?([1, 17, 4, 10], 17)
      false

      iex> Math.is_in_base?([1, 17, 4, 10], 18)
      true

  """
  def is_in_base?(n, b) when is_integer(n) and b > 1 and b <= 10 do
    b_digits = 0..(b - 1) |> Enum.to_list() |> MapSet.new()

    Integer.digits(n)
    |> Enum.filter(fn d -> MapSet.member?(b_digits, d) == false end)
    |> length() == 0
  end

  def is_in_base?(digits, b) when is_list(digits) and b > 1 do
    b_digits = 0..(b - 1) |> Enum.to_list() |> MapSet.new()

    digits
    |> Enum.filter(fn d -> MapSet.member?(b_digits, d) == false end)
    |> length() == 0
  end

  @doc """
  Break apart `n` into runs of digits.

  Optionally specify the base (default 10) in which to expand the number `n`. A run
  of digits is any grouping of identical digits. The groups of digits are returned
  as lists, so the final result is a list of lists.

  ## Options

   - `base` - Integer. Default `10`.

  ## Examples

      iex> Math.digit_runs(1233455)
      [[1], [2], [3, 3], [4], [5, 5]]

      iex> Math.digit_runs(847, base: 2)
      [ [1, 1], [0], [1], [0, 0], [1, 1, 1, 1]]

      iex> Math.digit_runs(1442792515, base: 16)
      [ [5, 5], [15, 15], [4, 4, 4], [3]]

      iex> Math.digit_runs(614482, base: 30)
      [ [22, 22, 22, 22] ]

      iex> Math.digit_runs(-100200)
      [ [1], [0, 0], [2], [0, 0]]
      
  """
  def digit_runs(n, opts \\ []) do
    b = opts |> Keyword.get(:base, 10)

    Integer.digits(abs(n), b)
    |> Enum.chunk_by(fn v -> v end)
  end

  @doc """
  Count the number of digit runs in `n`.

  Optionally specify the base (default 10) in which to expand `n`. See `digit_runs/2` for more
  details on how digit runs are constructed.

  OEIS References:

   - [A005811 - Number of runs in binary expansion of n](https://oeis.org/A005811)

  ## Examples

      iex> Math.digit_runs_count(1233455)
      5
      
      iex> Math.digit_runs_count(54321, base: 2)
      9
      
      iex> Math.digit_runs_count(1234567890987654321, base: 8)
      18
  """
  def digit_runs_count(n, opts \\ []) do
    digit_runs(n, opts) |> length()
  end

  @doc """
  Count the number of planted 3-trees of height < `n`.

  Used in combinatoric calculations of tree rootings admitting trees of certain heights. The number of
  planted 3 trees grows _very_ quickly - `planted_3_trees_count(20)` is a 50,084 digit number.

  OEIS Reference:

   - [A006894 - Number of planted 3-trees of height < n](https://oeis.org/A006894)

  This function is recursive, and uses a cache for efficiency.


  ## Examples

      iex> Math.planted_3_trees_count(1)
      1

      iex> Math.planted_3_trees_count(3)
      4

      iex> Math.planted_3_trees_count(6)
      2279

      iex> Math.planted_3_trees_count(9)
      5695183504492614029263279

  """
  def planted_3_trees_count(1), do: 1

  def planted_3_trees_count(n) when n > 0 do
    # a(n)=a(n-1)*(a(n-1) + 1)/2 + 1
    CacheAgent.cache_as :plated_3_trees_count, n do
      n_1 = planted_3_trees_count(n - 1)

      ((n_1 * (n_1 + 1)) |> div(2)) + 1
    end
  end

  @doc """
  The _factorial_ of `n`, or `n!`.

  A factorial of `n` is the product of `n * (n - 1) * (n - 2) * ... 1`.

  This implementation uses a cache to speed up efficiency.

  ## Examples

      iex> Math.factorial(4)
      24

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
    CacheAgent.cache_as :factorial, n do
      n * factorial(n - 1)
    end
  end

  @doc """
  Calculate the double factorial of `n`, `n!!`.

  The double factorial steps down by `2` each iteration, with `0!!` and `1!!` both equal to `1`. So
  the double factorial of `5` is

  ```
  5!! == 5 * 3 * 1 == 15
  ```

  This function uses a cache for efficiency.

  ## Examples

      iex> Math.double_factorial(1)
      1

      iex> Math.double_factorial(5)
      15

      iex> Math.double_factorial(10)
      3840

      iex> Math.double_factorial(18)
      185794560

      iex> Math.double_factorial(29)
      6190283353629375

  """
  def double_factorial(n) when n < 2, do: 1

  def double_factorial(n) when n >= 2 do
    CacheAgent.cache_as :double_factorial, n do
      n * double_factorial(n - 2)
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
    |> Enum.map(fn i ->
      Fraction.new(i + 1, sigma(i)) |> Fraction.get_whole()
    end)
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
    |> Enum.map(fn k ->
      m_0 = Fraction.new(1, Math.pow(16, k))

      f_1 = Fraction.new(4, 8 * k + 1)
      f_2 = Fraction.new(2, 8 * k + 4)
      f_3 = Fraction.new(1, 8 * k + 5)
      f_4 = Fraction.new(1, 8 * k + 6)

      f_0 = Fraction.subtract(f_1, f_2) |> Fraction.subtract(f_3) |> Fraction.subtract(f_4)

      Fraction.multiply(m_0, f_0)
    end)
    |> Fraction.sum()
    |> Fraction.multiply(Math.pow(10, n - 1))
    |> Fraction.get_whole()
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
  defp calc_pi(q, r, t, k, n, l) when 4 * q + r - t < n * t do
    {n, {q * 10, 10 * (r - n * t), t, k, div(10 * (3 * q + r), t) - 10 * n, l}}
  end

  defp calc_pi(q, r, t, k, _n, l) do
    calc_pi(q * k, (2 * q + r) * l, t * l, k + 1, div(q * 7 * k + 2 + r * l, t * l), l + 2)
  end

  @doc """
  Generate the first `n` Lucky Numbers.

  The [Lucky Numbers](http://mathworld.wolfram.com/LuckyNumber.html) are generated as a sequential sieve, like the
  prime Sieve of Eratosthenes. This makes generating the `n`th term as a digit extraction of negligble utility, as
  it would require generating the preceding terms as part of the sieve process.

  Instead, this function takes advantage of the fact that the ratio of numbers before and after sieving grows at
  approximately the natural log of the size of the starting list. I.e., if we want `n` lucky numbers, we need a
  starting list of approximately `n * log(m)` integers. We can solve for `m` via a fast gradient. This will generally
  result in calculating more digits than necessary, but only by a small margin - extra digits are truncated in the
  returned list.

  ## Examples

        iex> Math.lucky_numbers(5)
        [1, 3, 7, 9, 13]
        
        iex> Math.lucky_numbers(10)
        [1, 3, 7, 9, 13, 15, 21, 25, 31, 33]
        
        iex> Math.lucky_numbers(20)
        [1, 3, 7, 9, 13, 15, 21, 25, 31, 33, 37, 43, 49, 51, 63, 67, 69, 73, 75, 79]

        iex> Math.lucky_numbers(30)
        [1, 3, 7, 9, 13, 15, 21, 25, 31, 33, 37, 43, 49, 51, 63, 67, 69, 73, 75, 79, 87, 93, 99, 105, 111, 115, 127, 129, 133, 135]

  """
  def lucky_numbers(n) do
    1..estimate_candidate_pool_size(n)
    |> Enum.to_list()

    # first stage sieve is fine with enum
    |> Enum.take_every(2)

    # second stage sieve is recursive
    |> drop_from(1)

    # take only as many as we need
    |> Enum.take(n)
  end

  # run the lucky number sieve drop
  defp drop_from(candidates, idx) do
    if idx >= length(candidates) do
      candidates
    else
      # what number/cycle are we removing
      iter = candidates |> Enum.at(idx)

      # pad out because take every always takes the 0th item
      remove = ([0] ++ candidates) |> Enum.take_every(iter)

      # continue
      drop_from(candidates -- remove, idx + 1)
    end
  end

  # y = x/ln(x)
  # x - y * ln(x) = 0
  defp estimate_candidate_pool_size(y) when y < 10 do
    pool_estimate(10, 3) |> Kernel.trunc()
  end

  defp estimate_candidate_pool_size(y) do
    pool_estimate(y, 10) |> Kernel.trunc()
  end

  defp pool_estimate(y, x, e \\ 1) do
    v = x - y * :math.log(x)

    if abs(v) < e do
      x
    else
      step = :math.log(abs(v)) |> Kernel.trunc() |> max(1)

      if v < 0 do
        pool_estimate(y, x + step, e)
      else
        pool_estimate(y, x - step, e)
      end
    end
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
    0..(m - 1)
    |> Enum.map(fn k ->
      n + k
    end)
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
    0..(m - 1)
    |> Enum.map(fn k ->
      n - k
    end)
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
    CacheAgent.cache_as :fubini_number, n do
      # a(n) = Sum_{k=1..n} binomial(n, k)*a(n-k), a(0) = 1 
      1..n
      |> Enum.map(fn k ->
        binomial(n, k) * fubini_number(n - k)
      end)
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
    CacheAgent.cache_as :ordered_subsets_count, n do
      (2 * n - 1) * ordered_subsets_count(n - 1) -
        (n - 1) * (n - 2) * ordered_subsets_count(n - 2)
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
  def binomial(n, k) when n < 0 or k < 0, do: 0
  def binomial(n, k) when n < k, do: 0

  def binomial(n, k) do
    # n! / (k! * (n - k)!)
    div(factorial(n), factorial(k) * factorial(n - k))
  end

  @doc """
  Find the Stirling partition number (or Stirling number of the second kind) `{n, k}`.

  In combinatorics, the Stirling partition number describes the number of ways to partition a set of `n` elements
  into `k` non-empty subsets.

  The explicit formula for `{n, k}` is:

   ![Stirling Partition Number](https://wikimedia.org/api/rest_v1/media/math/render/svg/21344eaf46bde946b0ec224c2cb5fff938d91f92)

  ## Examples

      iex> Math.stirling_partition_number(0, 0)
      1

      iex> Math.stirling_partition_number(3, 0)
      0

      iex> Math.stirling_partition_number(5, 2)
      15

      iex> Math.stirling_partition_number(7, 4)
      350

      iex> Math.stirling_partition_number(10, 6)
      22827

      iex> Math.stirling_partition_number(10, 13)
      0

  """
  def stirling_partition_number(0, 0), do: 1
  def stirling_partition_number(_, 0), do: 0
  def stirling_partition_number(0, _), do: 0
  def stirling_partition_number(n, k) when k > n, do: 0

  def stirling_partition_number(n, k) when n > 0 and k > 0 and n >= k do
    part_a =
      summation j, 0..k do
        Math.pow(-1, k - j) * binomial(k, j) * Math.pow(j, n)
      end

    div(part_a, Math.factorial(k))
  end

  @doc """
  Determine the number of subsets of `n` of `k` elements. Also written `nCr`.

  Also describes Pascals triangle by (row, offset), as well as the binomial expansion `(n/k)`.

  ## Examples

      iex> Math.n_choose_k(5, 3)
      10

      iex> Math.n_choose_k(10, 4)
      210

      iex> Math.n_choose_k(25, 2)
      300

      iex> Math.n_choose_k(50, 14)
      937845656300


  """
  def n_choose_k(n, k) when n >= k do
    binomial(n, k)
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

    CacheAgent.cache_as :bell_number, n do
      0..(n - 1)
      |> Enum.map(fn k ->
        bell_number(k) * binomial(n - 1, k)
      end)
      |> Enum.sum()
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
    CacheAgent.cache_as :pell_number, n do
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
    CacheAgent.cache_as :eulerian_number, {n, m} do
      (n - m) * eulerian_number(n - 1, m - 1) + (m + 1) * eulerian_number(n - 1, m)
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
  def euler_zig_zag(n) when is_integer(n) and n >= 0 and n <= 2, do: 1

  def euler_zig_zag(n) when is_integer(n) and n > 2 do
    # a(n) = (Sum_{k=0..n - 1} binomial(n - 1, k) * a(k)*a(n - 1-k)) / 2    

    CacheAgent.cache_as :euler_zig_zag, n do
      bin_sum =
        0..(n - 1)
        |> Enum.map(fn k ->
          binomial(n - 1, k) * euler_zig_zag(k) * euler_zig_zag(n - 1 - k)
        end)
        |> Enum.sum()

      div(bin_sum, 2)
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
    euler_polynomial(n, Fraction.new(1, 2))
    |> Fraction.multiply(Math.pow(2, n))
    |> Fraction.get_whole()
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

  def euler_polynomial(m, %Fraction{} = x) do
    # hoo boy.
    # e<m>(x) = sum {0..m:n} (1 / 2^n * sum {0..n:k} (-1)^k * binomial(n k) * (x + k)^m)

    0..m
    |> Enum.map(fn n ->
      # fractional first sum
      frac = Fraction.new(1, Math.pow(2, n))

      # run the inner summation
      inner_sum =
        0..n
        |> Enum.map(fn k ->
          # fractional inner summation components
          carry = Math.pow(-1, k) * binomial(n, k)
          Fraction.add(x, k) |> Fraction.power(m) |> Fraction.multiply(carry)
        end)
        |> Fraction.sum()

      # fraction times inner sum
      Fraction.multiply(frac, inner_sum)
    end)
    |> Fraction.sum()
  end

  @doc """
  Calculate the `n`-th Bernoulli number, and return it as a Fraction.

  Bernoulli numbers are used throughout number theory for analysis, series construction,
  and topology. While the odd Bernoulli numbers greater than `B_1` are technically `0`,
  this function returns a zero value fraction (the reduced value `0/1`).

  ## Examples

      iex> Math.bernoulli_number(1)
      %Fraction{num: 1, den: 2}

      iex> Math.bernoulli_number(4)
      %Fraction{num: -1, den: 30}

      iex> Math.bernoulli_number(7)
      %Fraction{num: 0, den: 1}

      iex> Math.bernoulli_number(8)
      %Fraction{num: -1, den: 30}

      iex> Math.bernoulli_number(20)
      %Fraction{num: -174611, den: 330}

  """
  def bernoulli_number(0), do: Fraction.new(1, 1)
  def bernoulli_number(1), do: Fraction.new(1, 2)
  def bernoulli_number(n) when n > 0 and Integer.is_odd(n), do: Fraction.new(0, 1)

  def bernoulli_number(n) when n > 0 and Integer.is_even(n) do
    f = Fraction.new(n, Math.pow(4, n) - Math.pow(2, n))

    summation k, 0..(n - 1) do
      part_a = binomial(n - 1, k) * euler_number(k)
      f |> Fraction.multiply(part_a)
    end
    |> Fraction.simplify()
  end

  @doc """
  Calculate Chebyshev's triangle of coefficients at `S(n, k)`.

  The coefficient triangle is used for diophantine polynomial analysis, [spherical harmonics](http://mathworld.wolfram.com/ChebyshevPolynomialoftheSecondKind.html),
  series analysis, and other number theoretic applications.

  While a recurrence relationship exists, this function uses a binomial expansion to
  find values.

  ## Examples
      
      iex> Math.chebyshev_triangle_coefficient(0, 0)
      1

      iex> Math.chebyshev_triangle_coefficient(4, 2)
      -3

      iex> Math.chebyshev_triangle_coefficient(9, 4)
      0

      iex> Math.chebyshev_triangle_coefficient(11, 7)
      36

  """
  def chebyshev_triangle_coefficient(0, 0), do: 1
  def chebyshev_triangle_coefficient(_n, -1), do: 0
  def chebyshev_triangle_coefficient(-1, _k), do: 0
  def chebyshev_triangle_coefficient(n, k) when n < k or Integer.is_odd(n + k), do: 0

  def chebyshev_triangle_coefficient(n, k) do
    # Using closed form T(n,k) via binomial expansion
    # T(n,k) := 0 if n < k or n+k odd
    # else ((-1)^((n+k)/2+k))*binomial((n+k)/2, k); 

    # ((-1)^((n+k)/2+k))*binomial((n+k)/2, k); 
    Math.pow(-1, div(n + k, 2) + k) * binomial(div(n + k, 2), k)
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
    CacheAgent.cache_as :lucas_number, n do
      lucas_number(n - 1) + lucas_number(n - 2)
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
    CacheAgent.cache_as :plane_partition_count, n do
      a =
        1..n
        |> Enum.map(fn k ->
          plane_partition_count(n - k) * sigma(k, 2)
        end)
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
    #  ref: sage version via [Peter Luschny](https://oeis.org/wiki/User:Peter_Luschny)

    CacheAgent.cache_as :rooted_tree_count, n do
      # iterate up to n - 1
      part_a =
        1..(n - 1)
        |> Enum.map(fn j ->
          # iterate divisors of j
          inner =
            factors(j)
            |> Enum.map(fn d ->
              d * rooted_tree_count(d)
            end)

            # add result of d in divisors(j)
            |> Enum.sum()

          # tail tree count term with (n - j)
          inner * rooted_tree_count(n - j)
        end)

        # add result of j in (1..n-1)
        |> Enum.sum()

      # final division
      div(part_a, n - 1)
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
    v = m * x + b

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
  Find the `n`th Schröder number.

  The Schroder numbers describe the number of lattice paths across a grid from a south east corner
  to a north east corner, using only north, east, or north-east steps.

  ## Examples

      iex> Math.schroder_number(0)
      1

      iex> Math.schroder_number(2)
      6

      iex> Math.schroder_number(6)
      1806

      iex> Math.schroder_number(10)
      1037718

      iex> Math.schroder_number(18)
      600318853926

  """
  def schroder_number(0), do: 1

  def schroder_number(n) do
    2 * hipparchus_number(n)
  end

  @doc """
  Find the `n`-th Hipparchus number.

  Also known as **Schröder–Hipparchus** numbers, **super-Catalan** numbers, or the **little Schröder** numbers.

  In combinatorics, the Hipparchus numbers are useful for (via [Schröder–Hipparchus number](https://en.wikipedia.org/wiki/Schröder–Hipparchus_number) on Wikipedia):

   - The _nth_ number in the sequence counts the number of different ways of subdividing of a polygon with `n + 1` sides into smaller polygons by adding diagonals of the original polygon.
   - The _nth_ number counts the number of different plane trees with `n` leaves and with all internal vertices having two or more children.
   - The _nth_ number counts the number of different ways of inserting parentheses into a sequence of `n` symbols, with each pair of parentheses surrounding two or more symbols or parenthesized groups, and without any parentheses surrounding the entire sequence.
   - The _nth_ number counts the number of faces of all dimensions of an associahedron `Kn + 1` of dimension `n − 1`, including the associahedron itself as a face, but not including the empty set. For instance, the two-dimensional associahedron K4 is a pentagon; it has five vertices, five faces, and one whole associahedron, for a total of 11 faces.

  Sometimes denoted by `S(n)`, this implementation is based on the recurrence relationship:

  ```
  (n+1) * S(n) = (6*n-3) * S(n-1) - (n-2) * S(n-2)
  ```

  Because of the double recurrence, this implementation uses a cache for efficiency.

  ## Examples

      iex> Math.hipparchus_number(4)
      45

      iex> Math.hipparchus_number(10)
      518859

      iex> Math.hipparchus_number(36)
      6593381114984955663097869

      iex> Math.hipparchus_number(180)
      104947841676596807726623444466946904465025819465719020148363699314181613887673617931952223933467760579812079483371393916388262613163133

  """
  def hipparchus_number(0), do: 1
  def hipparchus_number(1), do: 1
  def hipparchus_number(2), do: 3

  def hipparchus_number(n) when is_integer(n) and n > 2 do
    # (n+1) * a(n) = (6*n-3) * a(n-1) - (n-2) * a(n-2) if n>1. a(0) = a(1) = 1.

    CacheAgent.cache_as :hipparchus_number, n do
      # recurrences
      p_a = (6 * n - 3) * hipparchus_number(n - 1)
      p_b = (n - 2) * hipparchus_number(n - 2)

      # isolation
      div(p_a - p_b, n + 1)
    end
  end

  @doc """
  Calculate the `n`-th Motzkin number.

  In combinatorics, number theory, and geometry, the Motzkin number is used to find (via [Wikipedia](https://en.wikipedia.org/wiki/Motzkin_number) and [OEIS A001006](https://oeis.org/A001006)):

   - the number of different ways of drawing non-intersecting chords between `n` points on a circle
   - the number of routes on the upper right quadrant of a grid from coordinate (0, 0) to coordinate (`n`, 0) in `n` steps if one is allowed to move only to the right (up, down or straight)
   - the number of involutions of {1,2,...,`n`} having genus 0
   - a wide variety of limits in sequence combinatorics and sub-sequence generation

  Motzkin numbers, for this implementation, are found via binomials (see `binomial/2`) and Catalan numbers (see `catalan_number/1`):

   ![Motzkin Number](https://wikimedia.org/api/rest_v1/media/math/render/svg/bb720a1ad038049569101610065cc75e4153f42a)

  ## Examples

      iex> Math.motzkin_number(1)
      1

      iex> Math.motzkin_number(15)
      310572

      iex> Math.motzkin_number(57)
      5127391665653918424581931

      iex> Math.motzkin_number(132)
      906269136562156220773088044844995547011445535121944413744427

  """
  def motzkin_number(0), do: 1
  def motzkin_number(1), do: 1

  def motzkin_number(n) when is_integer(n) and n > 1 do
    # sum{0, floor(n / 2): k} binomial(n, 2k) * C(k)
    0..div(n, 2)
    |> Enum.map(fn k ->
      binomial(n, 2 * k) * catalan_number(k)
    end)
    |> Enum.sum()
  end

  @doc """
  Find the `n`-th Jacobsthal number.

  These numbers are sometimes used in combinatorics for counting tiling variations, as well as having applications in number theory.

  The Jacobsthal numbers are a recurrence relation similar to the Fibonacci numbers, following the pattern:

   ![Jacobsthal Number](https://wikimedia.org/api/rest_v1/media/math/render/svg/9f8f7a97f76059ef3761bd66e22c2f63973e3061)

  For this implementation, a closed form is used instead of a recurrence.

  ## Examples

        iex> Math.jacobsthal_number(0)
        0

        iex> Math.jacobsthal_number(10)
        341

        iex> Math.jacobsthal_number(100)
        422550200076076467165567735125

        iex> Math.jacobsthal_number(250)
        603083798111021851164432213586916186735781170133544604372174916707880883541

  """
  def jacobsthal_number(n) when is_integer(n) and n >= 0 do
    div(Math.pow(2, n) - Math.pow(-1, n), 3)
  end

  @doc """
  Check if `n` is a Rhonda number to the base `b`.

  Via [OEIS](https://oeis.org/A099542):

  > An integer n is a Rhonda number to base b if the product of its digits in base b equals b*Sum of prime factors of n (including multiplicity).

  ## Examples

      iex> Math.is_rhonda_to_base?(1568, 10)
      true
      
      iex> Math.is_rhonda_to_base?(2048, 10)
      false

      iex> Math.is_rhonda_to_base?(855, 6)
      true

      iex> Math.is_rhonda_to_base?(47652, 9)
      true

      iex> Math.is_rhonda_to_base?(91224, 60)
      true
  """
  def is_rhonda_to_base?(n, _b) when n < 2, do: false

  def is_rhonda_to_base?(n, b) when is_integer(n) and is_integer(b) and b >= 2 do
    # find the base product
    base_prod =
      Integer.digits(n, b)
      |> Enum.reduce(1, fn x, acc -> x * acc end)

    # find the factor sum
    f_sum =
      ((prime_factors(n) -- [1])
       |> Enum.sum()) * b

    base_prod == f_sum
  end

  @doc """
  Find the bases for which `n` is a Rhonda number.

  Via [OEIS](https://oeis.org/A099542):

  > An integer n is a Rhonda number to base b if the product of its digits in base b equals b*Sum of prime factors of n (including multiplicity).

  Numbers can be Rhonda to more than one base, see [OEIS A100988](http://oeis.org/A100988). By default the `get_rhonda_to/1`
  function evaluates all bases from 4 to 500. You can specify an alternate set of bases with
  the `:bases` option.

  ## Options

   - `:bases` - List of Integer. Bases to evaluate.

  ## Examples

      iex> Math.get_rhonda_to(1000)
      [16, 36]
      
      iex> Math.get_rhonda_to(5670)
      [36, 106, 108, 196]

      iex> Math.get_rhonda_to(5670, bases: 100..150 |> Enum.to_list())
      [106, 108]
  """
  def get_rhonda_to(n, opts \\ []) when is_integer(n) do
    bases = opts |> Keyword.get(:bases, 4..1000 |> Enum.to_list())

    # pre-calculate the base prime factor
    f_base =
      (prime_factors(n) -- [1])
      |> Enum.sum()

    bases
    |> Enum.filter(fn base ->
      # find the base product
      base_prod =
        Integer.digits(n, base)
        |> Enum.reduce(1, fn x, acc -> x * acc end)

      base_prod == f_base * base
    end)
  end

  @doc """
  Determine the number of digits, or length, of a number `n` in base `b`.

  ## Examples

      iex> Math.length_in_base(12345, 10)
      5

      iex> Math.length_in_base(2048, 2)
      12
      
      iex> Math.length_in_base(123456789, 60)
      5
  """
  def length_in_base(n, b) do
    Integer.digits(n, b) |> length()
  end

  @doc """
  Convert a decimal integer into another base.

  If the new base can be represented with the decimal digits (i.e.; bases 2 through 10), the
  returned value will be an integer. If the base is greater than 10, the return value will be
  a list of digits that are in base `b`.

  ## Examples

      iex> Math.to_base(123, 3)
      11120

      iex> Math.to_base(123456789, 8)
      726746425

      iex> Math.to_base(987654321, 2)
      111010110111100110100010110001

      iex> Math.to_base(2048, 60)
      [34, 8]
  """
  def to_base(n, b) when is_integer(n) and is_integer(b) and b > 1 and b <= 10 do
    n
    |> Integer.digits(b)
    |> Integer.undigits()
  end

  def to_base(n, b) when is_integer(n) and is_integer(b) and b > 10 do
    n
    |> Integer.digits(b)
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
    |> Enum.map(fn k ->
      Fraction.new(n + k, k)
    end)
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
    CacheAgent.cache_as :wedderburn_etherington_number, n do
      # odd case is based on recurrence relation of 2n - 1
      sub_n = div(n + 1, 2)

      1..(sub_n - 1)
      |> Enum.map(fn i ->
        wedderburn_etherington_number(i) * wedderburn_etherington_number(2 * sub_n - i - 1)
      end)
      |> Enum.sum()
    end
  end

  def wedderburn_etherington_number(n) when is_integer(n) and Integer.is_even(n) do
    CacheAgent.cache_as :wedderburn_etherington_number, n do
      # even case is based on recurrence relation of 2n
      sub_n = div(n, 2)

      # determine the summation portion
      sum_part =
        1..(sub_n - 1)
        |> Enum.map(fn i ->
          wedderburn_etherington_number(i) * wedderburn_etherington_number(2 * sub_n - i)
        end)
        |> Enum.sum()

      # fractional portion
      s_n = wedderburn_etherington_number(sub_n)
      frac_part = div(s_n * (s_n + 1), 2)

      frac_part + sum_part
    end
  end

  @doc """
  Count the number of ways `n` can be partitioned into the sum of two squares.

  For the purposes of this function, the partition count for `0` and `1` is `1`. For
  all cases, `1` counts as a square number.

  As examples:

   - `5` has one partition, `1^2 + 2^2`
   - `25` has two partitions, `3^2 + 4^2` and `0^2 + 5^2`

  OEIS References

   - [A000161 - Number of partitions of n into 2 squares](https://oeis.org/A000161)


  ## Examples

      iex> Math.partitions_into_two_squares(20)
      1

      iex> Math.partitions_into_two_squares(300)
      0

      iex> Math.partitions_into_two_squares(986)
      2

      iex> Math.partitions_into_two_squares(9945)
      4

  """
  def partitions_into_two_squares(n) when n >= 0 and n < 3, do: 1

  def partitions_into_two_squares(n) when n >= 3 do
    # sum(k=sqrtint((n-1)\2)+1, sqrtint(n), issquare(n-k^2))
    summation k, (Math.nth_integer_root!(div(n - 1, 2), 2) + 1)..Math.nth_integer_root!(n, 2) do
      case n - Math.pow(k, 2) do
        1 ->
          1

        v ->
          if Predicates.is_perfect_square?(v) do
            1
          else
            0
          end
      end
    end
  end

  @doc """
  Euler's totient function for `n`.

  Also called _phi_ or written as `Φ(n)`, the Eulerian totient function counts the positive
  integers up to `n` that are _relatively prime_ or _coprime_ to `n`. The method used for
  calculating this function relies on a partially closed form of Euler's product formula
  that grows relative to the number of prime factors of `n`.

  If you need the actual coprimes of `n`, and not just the count of coprimes, see `coprimes/1`
  or `coprimes/2`.

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
  Find the number of ways to partition `2 * n` into powers of `2`.

  As this function is highly recursive, and uses a recurrence relationship, it uses a cache for efficiency.

  OEIS References:

   - [A000123 - Number of binary partitions: number of partitions of 2n into powers of 2](https://oeis.org/A000123)

  ## Examples

      iex> Math.binary_partitions_count(1)
      2

      iex> Math.binary_partitions_count(5)
      14

      iex> Math.binary_partitions_count(12)
      94

      iex> Math.binary_partitions_count(37)
      3074

  """
  def binary_partitions_count(0), do: 1

  def binary_partitions_count(n) when n >= 0 do
    # a(n) = a(n-1) + a(floor(n/2))
    CacheAgent.cache_as :binary_partition_count, n do
      binary_partitions_count(n - 1) + binary_partitions_count(div(n, 2))
    end
  end

  @doc """
  Count the number of bracelet permutations for `n` beads, with primitive period of `n`, with two colors.

  OEIS References:

   - [A000048 - Number of n-bead necklaces with beads of 2 colors and primitive period n, when turning over is not allowed](https://oeis.org/A000048)

  ## Options

   - `allow_turning_over` - Boolean. Default `false`. Currently only supports `false`.

  ## Examples

      iex> Math.two_color_bracelet_with_period_count(1)
      1

      iex> Math.two_color_bracelet_with_period_count(5)
      3

      iex> Math.two_color_bracelet_with_period_count(12)
      170

      iex> Math.two_color_bracelet_with_period_count(38)
      3616814565

  """
  def two_color_bracelet_with_period_count(n, opts \\ []) when n >= 0 do
    allow_turns = opts |> Keyword.get(:allow_turning_over, false)

    if allow_turns do
      0
    else
      if n == 0 do
        1
      else
        # a(n) = (1/(2*n)) * Sum_{odd d divides n} mu(d)*2^(n/d)
        facs = factors(n) |> Enum.filter(&Predicates.is_odd?/1)

        part_a =
          summation k, facs do
            mobius_function(k) * Math.pow(2, div(n, k))
          end

        Fraction.new(1, 2 * n) |> Fraction.multiply(part_a) |> Fraction.get_whole()
      end
    end
  end

  @doc """
  Count the number of bracelet permutations for `n` beads of two colors.

  By default the "turning over" of beads is allowed. See options below for configuraitons.

  OEIS References: 
   
   - [A000029 - Number of bracelets with n beads of two colors with turning over](https://oeis.org/A000029)
   - [A000031 - Number of bracelets with n beads of two colors without turning over](https://oeis.org/A000031)

  ## Options

   - `allow_turning_over` - Boolean. Default `true`. Allow or disallow "turning over" of beads on bracelet

  ## Examples

      iex> Math.two_color_bracelet_count(5)
      8

      iex> Math.two_color_bracelet_count(12)
      224

      iex> Math.two_color_bracelet_count(37)
      1857545300

      iex> Math.two_color_bracelet_count(5, allow_turning_over: false)
      8

      iex> Math.two_color_bracelet_count(12, allow_turning_over: false)
      352

      iex> Math.two_color_bracelet_count(37, allow_turning_over: false)
      3714566312

  """
  def two_color_bracelet_count(n, opts \\ []) when n >= 0 do
    allow_turns = opts |> Keyword.get(:allow_turning_over, true)

    if allow_turns do
      cond do
        n >= 0 && n < 3 ->
          n + 1

        true ->
          # a(n) = Sum_{d divides n} phi(d)*2^(n/d)/(2*n) + 
          #     2^((n - 1)/2) if n odd 
          #     2^(n/2 - 1) + 2^(n/2 - 2) if n even.

          part_a =
            summation k, factors(n) do
              totient(k) * Math.pow(2, div(n, k))
            end
            |> div(2 * n)

          part_a +
            if Predicates.is_even?(n) do
              Math.pow(2, div(n, 2) - 1) + Math.pow(2, div(n, 2) - 2)
            else
              Math.pow(2, div(n - 1, 2))
            end
      end
    else
      cond do
        n == 0 ->
          1

        true ->
          # a(n) = (1/n)*Sum_{ d divides n } phi(d)*2^(n/d)
          part_a =
            summation k, factors(n) do
              totient(k) * Math.pow(2, div(n, k))
            end

          Fraction.new(1, n) |> Fraction.multiply(part_a) |> Fraction.get_whole()
      end
    end
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
  def extend_kolakoski_sequence_to_length({seq, _, _} = k_seq, size) when is_integer(size) do
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
  Determine if an integer `n` is `b`-smooth, a composite of prime factors less than or equal to `b`.

  Numbers can be `b`-smooth for any `b` that is prime. For instance, the number `8` is 3-smooth, as
  it's factors would be: `1^1 * 2^3 * 3^0`, whereas `15` is not 3-smooth, as it's factors would be
  `1^1 * 2^0 * 3^1 * 5^1` - it has prime factors whose value is greater than `3`.

  ## Shortcut Functions

  There are a collection of pre-defined predicate functions (see `Chunky.Math.Predicates`) for checking b-smooth for the primes `3` to `23`:

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
    if Predicates.is_prime?(b) == false do
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

    sum_term =
      1..(n - 1)
      |> Enum.map(fn k ->
        (35 * Math.pow(k, 4) - 52 * Math.pow(k, 3) * n + 18 * Math.pow(k, 2) * Math.pow(n, 2)) *
          sigma(k, 1) * sigma(n - k, 1)
      end)
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
    if !Predicates.is_prime?(p) do
      raise ArgumentError, message: "p value of p-adic valuation must be prime"
    end

    # walk the possible exponents of p^v
    exps =
      1..p_adic_max_v(p, 1, n)
      |> Enum.filter(fn v ->
        # does p^v divide N?
        rem(n, Math.pow(p, v)) == 0
      end)

    if Enum.empty?(exps) do
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

    CacheAgent.cache_as :j_invariant_q_coefficient, n do
      # gather the summation
      sum_term =
        1..(n + 1)
        |> Enum.map(fn k ->
          (504 * sigma(k, 5) - 240 * (n - k) * sigma(k, 3)) * j_invariant_q_coefficient(n - k)
        end)
        |> Enum.sum()

      # build the fractional component and complete
      Fraction.new(1, n + 1) |> Fraction.multiply(sum_term) |> Fraction.get_whole()
    end
  end

  @doc """
  Count the number of total, or series reduced tree, partitions of `n` elements.

  Also known as Schröder's Fourth problem. In combinatorics, this is the number of
  singleton reduced trees with `n` labels, where the leaves are non-empty sets.

  OEIS References:

   - [A000311 - series-reduced rooted trees with n labeled leaves; also number of total partitions of n](https://oeis.org/A000311)

  ## Examples

      iex> Math.total_partitions(0)
      0

      iex> Math.total_partitions(3)
      4

      iex> Math.total_partitions(8)
      660032

      iex> Math.total_partitions(20)
      887094711304119347388416

  """
  def total_partitions(0), do: 0
  def total_partitions(1), do: 1

  def total_partitions(n) when n > 1 do
    # a(1)=1; for n>1, a(n) = -(n-1) * a(n-1) + Sum_{k=1..n-1} binomial(n, k) * a(k) * a(n-k)
    CacheAgent.cache_as :total_partitions, n do
      part_a = -1 * (n - 1) * total_partitions(n - 1)

      part_b =
        summation k, 1..(n - 1) do
          binomial(n, k) * total_partitions(k) * total_partitions(n - k)
        end

      part_a + part_b
    end
  end

  @doc """
  Count the number of _perfect_ partitions of `n`.

  A perfect partition of `n` is a partition of `n` such that any number from 1 to `n` can
  be _uniquely_ generated using the values of the partition. Take, for example, the perfect
  partition of `4`; `{1, 1, 1, 1}`. In this case the base required value (`n` copies of `1`)
  is the only perfect partition. The partition `{2, 1, 1}` isn't part of the perfect partition
  because the value `2` could be constructed in two different ways with those values (`{2, _, _}` and `{_, 1, 1}`).

  When assessing a perfect partition, an intermediate value that can be constructed with the _same_ 
  partition values multiple times is still a perfect partition. For instance, `5` has as one of its
  valid perfect partitions `{2, 2, 1}`. The value `3` can be constructed twice, as `{2, _, 1}` and
  `{2, 1, _}`, but as both constructions use identical values (`2 + 1`), this is still a perfect
  partition.

  OEIS References:

   - [A002033 - Number of perfect partitions of n](https://oeis.org/A002033)

  ## Examples

      iex> Math.perfect_partition_count(3)
      2

      iex> Math.perfect_partition_count(23)
      20

      iex> Math.perfect_partition_count(351)
      112

      iex> Math.perfect_partition_count(2345)
      75

  """
  def perfect_partition_count(n) when is_integer(n) and n >= 0 do
    # we use the congruence with H(n + 1) - number of ordered factorizations
    ordered_factorization_count(n + 1)
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
    CacheAgent.cache_as :partition_count, n do
      # a(n) = (1/n) * Sum_{k=0..n-1} sigma(n-k)*a(k)  
      sum_part =
        0..(n - 1)
        |> Enum.map(fn k ->
          sigma(n - k, 1) * partition_count(k)
        end)
        |> Enum.sum()

      Fraction.new(1, n) |> Fraction.multiply(sum_part) |> Fraction.get_whole()
    end
  end

  @doc """
  Enumerate all of the rotations of `n`.

  A rotate of `n` involves a circular rotation of digits - the first digit moved to the end of the
  number, repeated until all possible rotations are enumerated.

  ## Examples

      iex> Math.rotations(1234)
      [1234, 2341, 3412, 4123]

      iex> Math.rotations(232)
      [232, 322, 223]

      iex> Math.rotations(7)
      [7]

      iex> Math.rotations(123456)
      [123456, 234561, 345612, 456123, 561234, 612345]

      iex> Math.rotations(123123)
      [123123, 231231, 312312]

      iex> Math.rotations(1111)
      [1111]
  """
  def rotations(n) do
    [n] ++ generate_rotations(n, n)
  end

  defp generate_rotations(c, n) do
    # find the rotated number
    rot_dig = Integer.digits(c)
    rot = (Enum.drop(rot_dig, 1) ++ [List.first(rot_dig)]) |> Integer.undigits()

    # if we're at our original, just return
    if rot == n do
      []
    else
      [rot] ++ generate_rotations(rot, n)
    end
  end

  @doc """
  Reverse the digits of `n`.

  If the rotated digits of `n` would have leading zeros, they are truncated.

  ## Examples

      iex> Math.reverse_number(12345)
      54321
      
      iex> Math.reverse_number(12300)
      321
      
      iex> Math.reverse_number(11)
      11
  """
  def reverse_number(n) do
    n
    |> Integer.digits()
    |> Enum.reverse()
    |> Integer.undigits()
  end

  @doc """
  Check if `n` is palindromic in base `b`.

  The number `n` is converted from base 10 to base `b` before being checked as a palindrome.

  ## Examples

      iex> Math.is_palindromic_in_base?(27, 2)
      true

      iex> Math.to_base(27, 2)
      11011

      iex> Math.is_palindromic_in_base?(105, 20)
      true

      iex> Math.to_base(105, 20)
      [5, 5]

      iex> Math.is_palindromic_in_base?(222, 3)
      false
      
      iex> Math.to_base(222, 3)
      22020
      
  """
  def is_palindromic_in_base?(n, b) do
    digits = Integer.digits(n, b)

    digits == Enum.reverse(digits)
  end

  @doc """
  Calculate the Legendre Symbol of `(a/p)`, where `p` is prime.

  The Legendre symbol is used in number theory when working with prime numbers and
  quadratic constructions. It was originally defined via the formula:

   ![Legendre Symbol](https://wikimedia.org/api/rest_v1/media/math/render/svg/7ad53226ea2a06b6fcd0d8f69c3a40ce3edf2407)

  ## Examples

      iex> Math.legendre_symbol(12, 3)
      0

      iex> Math.legendre_symbol(14, 11)
      1

      iex> Math.legendre_symbol(29, 31)
      -1

      iex> Math.legendre_symbol(14, 9)
      ** (ArgumentError) p must be prime

  """
  def legendre_symbol(a, p) when Integer.is_odd(p) do
    if Predicates.is_prime?(p) do
      case Math.pow(a, div(p - 1, 2), p) do
        1 -> 1
        0 -> 0
        _ -> -1
      end
    else
      raise ArgumentError, message: "p must be prime"
    end
  end

  @doc """
  Calculate the Jacobi Symbol `(n/k)`.

  Via Wikipedia [Jacobi Symbol](https://en.wikipedia.org/wiki/Jacobi_symbol):

  > The Jacobi symbol is a generalization of the Legendre symbol. Introduced by Jacobi 
  > in 1837,[1] it is of theoretical interest in modular arithmetic and other branches 
  > of number theory, but its main use is in computational number theory, especially 
  > primality testing and integer factorization...

  The value of `n` can be any integer, while `k` must be a _positive_ and _odd_ integer.

  ## Examples

      iex> Math.jacobi_symbol(13, 13)
      0

      iex> Math.jacobi_symbol(2, 7)
      1

      iex> Math.jacobi_symbol(156, 3)
      0

      iex> Math.jacobi_symbol(199, 213)
      1

  """
  def jacobi_symbol(n, k) when is_integer(n) and Integer.is_odd(k) and k > 0 do
    {_n, k, t} = jacobi_symbol_outer(n, k, 1)

    if k == 1 do
      t
    else
      0
    end
  end

  defp jacobi_symbol_inner(n, k, t) when Integer.is_odd(n), do: {n, k, t}

  defp jacobi_symbol_inner(n, k, t) when Integer.is_even(n) do
    n = div(n, 2)

    t =
      case rem(k, 8) do
        3 -> t * -1
        5 -> t * -1
        _ -> t
      end

    jacobi_symbol_inner(n, k, t)
  end

  defp jacobi_symbol_outer(n, k, t) when n == 0, do: {n, k, t}

  defp jacobi_symbol_outer(n, k, t) when n != 0 do
    {k, n, t} = jacobi_symbol_inner(n, k, t)

    t =
      if rem(n, 4) == 3 && rem(k, 4) == 3 do
        t * -1
      else
        t
      end

    n = rem(n, k)
    jacobi_symbol_outer(n, k, t)
  end

  @doc """
  Check if `n` is an Euler pseudo-prime in base `a`.

  Euler pseudo-primes are similar to the more standard definition of Euler-Jacobi pseudo-primes, but only need to
  satisfy the more permissive assertion that if `a` and `n` are coprime:

   ![Weak Euler pseudo-prime](https://wikimedia.org/api/rest_v1/media/math/render/svg/1cff79763c8950b703cb3daf38151a80b6905dc0)

  See also `is_euler_pseudo_prime?/1` for implicit base 10 check, or `is_euler_jacobi_pseudo_prime?/2` for the more
  commonly accepted pseudo-prime check.

  ## Examples

      iex> Math.is_euler_pseudo_prime?(185, 5)
      false

      iex> Math.is_euler_pseudo_prime?(185, 6)
      true

      iex> Math.is_euler_pseudo_prime?(91, 9)
      true

      iex> Math.is_euler_pseudo_prime?(1105, 16)
      true

  """
  def is_euler_pseudo_prime?(n, a) when a > 1 and n > 0 and Integer.is_odd(n) do
    m_n = n - 1

    case Math.pow(a, div(n - 1, 2), n) do
      1 -> true
      ^m_n -> true
      _ -> false
    end && is_coprime?(n, a) && Predicates.is_prime?(n) == false
  end

  def is_euler_pseudo_prime?(_, _), do: false

  @doc """
  Check if `n` is an Euler-Jacobi pseudo-prime to base `a`.

  These numbers are like Euler pseudo-primes, but with a stricter congruence:

   ![Euler Jacobi pseudo-prime](https://wikimedia.org/api/rest_v1/media/math/render/svg/f13cbb4f0c18a0bf6021b8d5d0dcb92f2e9a6281)

  where ![Jacobi Symbol](https://wikimedia.org/api/rest_v1/media/math/render/svg/42ee8ba7e649c05c1a3642c7a932095c47e25353) is the Jacobi symbol (see `jacobi_symbol/1`).

  ## Examples

      iex> Math.is_euler_jacobi_pseudo_prime?(91, 10)
      true

      iex> Math.is_euler_jacobi_pseudo_prime?(52633, 12)
      true

      iex> Math.is_euler_jacobi_pseudo_prime?(15, 16)
      true
      
      iex> Math.is_euler_jacobi_pseudo_prime?(169, 22)
      true

      iex> Math.is_euler_jacobi_pseudo_prime?(133, 102)
      true


  """
  def is_euler_jacobi_pseudo_prime?(n, a) when a > 1 and n > 0 and Integer.is_odd(n) do
    # calculate the leading congruence
    m_n = n - 1

    part_a =
      case Math.pow(a, div(n - 1, 2), n) do
        1 -> 1
        ^m_n -> -1
        v -> v
      end

    # trailing congruene
    part_b = jacobi_symbol(a, n)

    # put it all together
    part_a == part_b && is_coprime?(n, a) && Predicates.is_prime?(n) == false
  end

  def is_euler_jacobi_pseudo_prime?(_, _), do: false

  @doc """
  Determine if `n` is a Fermat pseudo-prime to base `a`.

  The pseudo-primes, or Fermat pseudo-primes, define a relationship between coprimes `n` and `a`, where `n` is a composite
  number, and `a^(n - 1) % n == 1`.

  The pseudo-primes over base 2 are often called the Poulet numbers.

  If `n` is pseudo-prime to all bases `a` that are coprime to `n`, it is a Carmichael number.

  ## Examples

      iex> Math.is_pseudo_prime?(33, 10)
      true

      iex> Math.is_pseudo_prime?(17, 10)
      false

      iex> Math.is_pseudo_prime?(65, 12)
      true

      iex> Math.is_pseudo_prime?(27, 12)
      false

      iex> Math.is_pseudo_prime?(341, 60)
      true
      
      iex> Math.is_pseudo_prime?(291, 60)
      false
      
      
  """
  def is_pseudo_prime?(n, a) when a > 1 and n > 1 do
    Predicates.is_prime?(n) == false && Math.pow(a, n - 1, n) == 1
  end

  def is_pseudo_prime?(_, _), do: false

  @doc """
  Find all positive coprimes of `n`, from `2` up to `n`.

  Two numbers `a` and `b` are coprime if, and only if, the only positive integer factor
  that divides both of them is `1`.

  If you need comprimes of `n` greater than `n`, see `coprimes/2`. If you only need the
  count of coprimes of `n`, see `totient/1`.

  ## Examples

      iex> Math.coprimes(2)
      [1]

      iex> Math.coprimes(3)
      [1, 2]

      iex> Math.coprimes(10)
      [1, 3, 7, 9]

      iex> Math.coprimes(36)
      [1, 5, 7, 11, 13, 17, 19, 23, 25, 29, 31, 35]


  """
  def coprimes(1), do: [1]
  def coprimes(2), do: [1]

  def coprimes(n) when n > 2 do
    # find all prime roots of n
    p_fs = prime_factors(n) -- [1, n]

    # enumerate all digits from 2 to n that aren't powers of roots of n
    [1] ++
      (2..(n - 1)
       |> Enum.filter(fn m -> is_in_multiples?(m, p_fs) == false end))
  end

  @doc """
  Find all positive coprimes of `n` from `2` up to `d`.

  Two numbers `a` and `b` are coprime if, and only if, the only positive integer factor
  that divides both of them is `1`.

  If you only need the coprimes of `n` less than or equal to `n`, see `coprimes/1`.

  ## Examples

      iex> Math.coprimes(2, 10)
      [1, 3, 5, 7, 9]

      iex> Math.coprimes(3, 20)
      [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20]

      iex> Math.coprimes(10, 30)
      [1, 3, 7, 9, 11, 13, 17, 19, 21, 23, 27, 29]

      iex> Math.coprimes(38, 50)
      [1, 3, 5, 7, 9, 11, 13, 15, 17, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49]
      

  """
  def coprimes(n, d) when n > 1 and d > 1 do
    p_fs = prime_factors(n) -- [1, n]

    # enumerate all digits from 2 to D
    [1] ++
      (2..d
       |> Enum.filter(fn m ->
         # make sure our candidate isn't a mulitple of a prime factor of N
         # and make sure it isn't a multiple of N itself
         is_in_multiples?(m, p_fs) == false && rem(m, n) != 0
       end))
  end

  # is n a multiple of any of the numbers in the list?
  defp is_in_multiples?(_n, []), do: false

  defp is_in_multiples?(n, [p | p_fs]) do
    if rem(n, p) == 0 do
      true
    else
      is_in_multiples?(n, p_fs)
    end
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
    CacheAgent.cache_as :involutions_count, n do
      # a(n) = a(n-1) + (n-1)*a(n-2), n>1.
      involutions_count(n - 1) + (n - 1) * involutions_count(n - 2)
    end
  end

  @doc """
  Find the `n`th term of Stern's diatomic series.

  This function calculates the [diatomic series](http://mathworld.wolfram.com/SternsDiatomicSeries.html) via
  a binomial summation.

  ## Examples

      iex> Math.stern_diatomic_series(0)
      0

      iex> Math.stern_diatomic_series(25)
      7

      iex> Math.stern_diatomic_series(30)
      4

      iex> Math.stern_diatomic_series(90)
      12

      iex> Math.stern_diatomic_series(127)
      7

  """
  def stern_diatomic_series(0), do: 0
  def stern_diatomic_series(1), do: 1
  def stern_diatomic_series(2), do: 1

  def stern_diatomic_series(n) when n > 2 do
    summation k, 0..(n - 1) do
      binomial(k, n - k - 1) |> rem(2)
    end
  end

  @doc """
  Is `n` a cyclops number in base `b`?

  A cyclops number in a given base has exactly one `0` in its representation, in the exact middle
  of the number, with an equal number of digits on each side. This implies that there must
  be an odd number of digits.

  The provided number `n` is converted from base 10 to base `b` before being evaluated.

  ## Examples

      iex> Math.is_cyclops_number_in_base?(119, 2)
      true

      iex> Math.is_cyclops_number_in_base?(2146, 5)
      true

      iex> Math.is_cyclops_number_in_base?(451, 8)
      true

      iex> Math.is_cyclops_number_in_base?(68413345263, 16)
      true

      iex> Math.is_cyclops_number_in_base?(956966581810, 60)
      true

  """
  def is_cyclops_number_in_base?(n, b) do
    digs =
      n
      |> Integer.digits(b)

    # odd number of digits
    c_1 = length(digs) |> Predicates.is_odd?()

    # only one zero
    c_2 = digit_count(n, [0], base: b) == 1

    # zero in the middle
    c_3 = Enum.at(digs, length(digs) |> div(2)) == 0

    c_1 && c_2 && c_3
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
  Calculate the sum of the digits of `n`.

  ## Examples

      iex> Math.digit_sum(1234)
      10

      iex> Math.digit_sum(2048)
      14
      
      iex> Math.digit_sum(1234567890987654321)
      90
  """
  def digit_sum(n) when is_integer(n) do
    n |> Integer.digits() |> Enum.sum()
  end

  @doc """
  Calculate the `n`th Repunit, or `R_n`.


  ## Examples

      iex> Math.repunit(0)
      0
      
      iex> Math.repunit(1)
      1
    
      iex> Math.repunit(5)
      11111

      iex> Math.repunit(10)
      1111111111

      iex> Math.repunit(25)
      1111111111111111111111111

  """
  def repunit(0), do: 0

  def repunit(n) when n > 0 do
    (Math.pow(10, n) - 1) |> div(9)
  end

  @doc """
  Count the number of specific digits in `n`.

  Using the `base` option, you can select which base the number is converted to
  before counting digits. 

  The list of digits being counted can have one or more integers, allowing flexible
  counting of different combinations of digits (see examples).

  ## Options

   - `base` - Integer. Default `10`. Numeric base to convert `n` to before counting.

  ## Examples

  Count how many `2`s are in a number:

      iex> Math.digit_count(200454232, [2])
      3

  Count the even digits in a number:
      
      iex> Math.digit_count(123456789, [2, 4, 6, 8])
      4

  Count the `1`s and `2`s in the ternary expansion (base 3) of a number:
      
      iex> Math.digit_count(245_987_340, [1, 2], base: 3)
      12

  Count the number of `25`s in the base **60** expansion of a number:

      iex> Math.digit_count(1173840858356, [25], base: 60)
      2

  """
  def digit_count(n, digits, opts \\ []) when is_integer(n) and is_list(digits) do
    base = opts |> Keyword.get(:base, 10)

    abs(n)
    |> Integer.digits(base)
    |> Enum.filter(fn d -> Enum.member?(digits, d) end)
    |> length()
  end

  @doc """
  Check if a number `n` contains the number `m` in it's decimal
  digit representation.

  ## Examples

      iex> Math.contains_number?(34, 3)
      true

      iex> Math.contains_number?(2048, 20)
      true

      iex> Math.contains_number?(2048, 49)
      false
  """
  def contains_number?(n, m) when is_integer(n) and is_integer(m) do
    Integer.to_string(n) |> String.contains?(Integer.to_string(m))
  end

  @doc """
  Remove all occurances of one or more digits from `n`.

  Once removed, the the remaining digits of `n` are reconstituted into a number. If
  no digits are remaining then `0` (or a configurable value) is returned.

  ## Examples

      iex> Math.remove_digits!(123, [4, 5])
      123
      
      iex> Math.remove_digits!(123, [2])
      13
      
      iex> Math.remove_digits!(123, [1, 2, 3])
      0
      
      iex> Math.remove_digits!(123, [1, 2, 3], empty: nil)
      nil
  """
  def remove_digits!(n, digits, opts \\ []) when is_integer(n) and is_list(digits) do
    on_empty = Keyword.get(opts, :empty, 0)

    case Integer.digits(n)
         |> Enum.reject(fn dig -> Enum.member?(digits, dig) end) do
      [] -> on_empty
      f_n -> Integer.undigits(f_n)
    end
  end

  @doc """
  Apply a number theoretic property test to integers to find the next number
  in a sequence.

  ## Examples

      iex> Math.next_number(&Math.Predicates.is_powerful_number?/1, 49)
      64

      iex> Math.next_number(&Math.Predicates.is_abundant?/1, 60)
      66
  """
  def next_number(property_func, n, step \\ 1)
      when is_function(property_func, 1) and is_integer(n) do
    if property_func.(n + step) do
      n + step
    else
      next_number(property_func, n + step, step)
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
  trucation in large values using the built-in `:math` exponentiation functions. For negative
  exponents a Fraction will be returned.

  For pure integer roots, see `nth_root_int/2`.

  ## Example
      
      iex> Math.pow(2, 10)
      1024

      iex> Math.pow(17, 14)
      168377826559400929

      iex> Math.pow(4, -3)
      %Fraction{num: 1, den: 64}
  """
  def pow(x, y) when is_integer(x) and y < 0 do
    Fraction.new(1, Math.pow(x, abs(y)))
  end

  def pow(_x, 0), do: 1
  def pow(x, 1), do: x

  def pow(x, y) when is_integer(x) and is_integer(y) and Integer.is_even(y),
    do: pow(x * x, div(y, 2))

  def pow(x, y) when is_integer(x) and is_integer(y), do: x * pow(x * x, div(y - 1, 2))

  @doc """
  Find the _least common multiple_ of a list of integers.

  By definition **LCM** is a composable function, such that finding the least common
  multiple of a list of integers `[a, b, c, d]` is `lcm(a, lcm(b, lcm(c, d)))`.

  ## Example

      iex> Math.lcm([3, 5, 7, 11, 13, 17])
      255255
      
      iex> Math.lcm([2, 4, 8])
      8

      iex> Math.lcm([1, 3, 27])
      27
      
      iex> Math.lcm([1, 3, 37, 0, 145])
      0
  """
  def lcm([a, b]), do: lcm(a, b)
  def lcm([a | rest]), do: lcm(a, lcm(rest))

  @doc """
  Find the _least commom multiple_ of two integers.

  The **LCM** of two integers `n` and `m` is the smallest number `b` that is divisible
  by both `n` and `m` with no remainder - or satisfies the relationship `b/n = 0, b/m = 0`.

  ## Examples

      iex> Math.lcm(2, 3)
      6

      iex> Math.lcm(10, 5)
      10

      iex> Math.lcm(17, 29)
      493

      iex> Math.lcm(14, 230)
      1610

      iex> Math.lcm(257, 0)
      0
  """
  def lcm(_a, 0), do: 0
  def lcm(0, _b), do: 0
  def lcm(a, b) when is_integer(a) and is_integer(b), do: div(abs(a * b), Integer.gcd(a, b))

  @doc """
  Find the nearest integer `n`th root of `x`, such that `root^n <= x`.

  This is an iterative root method that bypasses any floating point operations, so is suitable
  for finding large integer roots. For numbers less than `2^64-1` the `nth_root` method may be
  faster.
  
  The return value of `nth_integer_root` is a tuple of either `{:exact, value}` or `{:nearest, value}`
  depending on the root. To get an immediate value, see `nth_integer_root!/2`.

  ## Examples

      iex> a = 1234567890987654321
      iex> Math.nth_integer_root(a * a * a * a * a, 5)
      {:exact, 1234567890987654321}

      iex> Math.nth_integer_root(100_000, 4)
      {:nearest, 17}

      iex> Math.nth_integer_root(8, 3)
      {:exact, 2}
  """
  def nth_integer_root(x, n) when n > 1 and x > 0 do
    # iterative binary search across the answer space
    refine_nth_root_int(x, n, 1, x)
  end
  
  @doc """
  Find the nearest integer `n`th root of `x`, such that `root^n <= x`.

  This is an iterative root method that bypasses any floating point operations, so is suitable
  for finding large integer roots. For numbers less than `2^64-1` the `nth_root` method may be
  faster.
  
  The return value of `nth_integer_root` is an integer that is the exact, or nearest, `n`th root
  of `x`. If you need to _know_ if the root is exact or nearest, see `nth_integer_root/2`.

  ## Examples

      iex> a = 1234567890987654321
      iex> Math.nth_integer_root!(a * a * a * a * a, 5)
      1234567890987654321

      iex> Math.nth_integer_root!(100_000, 4)
      17

      iex> Math.nth_integer_root!(8, 3)
      2
  """
  def nth_integer_root!(x, n) when n > 1 and x > 0 do
     {_, v} = nth_integer_root(x, n)
     v 
  end

  # run a binary search to find our optimal candidate value
  defp refine_nth_root_int(x, n, c_low, c_hi) do
    # are low and hi right next to one another?
    if c_low == c_hi - 1 do
        if Math.pow(c_low, n) == x do
            {:exact, c_low}
        else
            {:nearest, c_low}
        end
    else
      # pick a mid point
      c_mid = div(c_hi - c_low, 2) + c_low

      # eval our options
      val_low = Math.pow(c_low, n)
      val_mid = Math.pow(c_mid, n)
      val_hi = Math.pow(c_hi, n)

      # determine if one of our values is exact, or
      # if we need to refine
      cond do
        # any exact?
        val_low == x -> {:exact, c_low}
        val_mid == x -> {:exact, c_mid}
        val_hi == x -> {:exact, c_hi}
        # bounding
        val_low < x && val_mid > x -> refine_nth_root_int(x, n, c_low, c_mid)
        val_mid < x && val_hi > x -> refine_nth_root_int(x, n, c_mid, c_hi)
        # how?
        true -> {:error, nil}
      end
    end
  end

  @doc """
  Generalized floating point nth root, from:

      https://github.com/acmeism/RosettaCodeData/blob/master/Task/Nth-root/Elixir/nth-root.elixir

  based on a fast converging Newton's Method process.

  Note: Because the `nth_root` function is based on floating point operations, it _will_ lose
  precision and introduce error for integers larger than ~16 digits

  ## Options

   - `precision` - **Float**. Default `1.0e-7`. Precision to which root is calculated.

  ## Examples

      iex> Math.nth_root(8, 3)
      2.0

      iex> Math.nth_root(27, 3)
      3.0

      iex> Math.nth_root(78125, 7)
      5.0

      iex> Math.nth_root(104, 3)
      4.702669375441515
  """
  def nth_root(x, n, precision \\ 1.0e-7)
  def nth_root(0, _, _), do: 0
  def nth_root(_, 0, _), do: :zero_root_undefined

  def nth_root(x, n, precision) do
    f = fn prev ->
      ((n - 1) * prev + x / :math.pow(prev, n - 1)) / n
    end

    fixed_point(f, x, precision, f.(x))
  end

  defp fixed_point(_, guess, tolerance, next) when abs(guess - next) < tolerance, do: next

  defp fixed_point(f, _guess, tolerance, next) do
    fixed_point(f, next, tolerance, f.(next))
  end

  @doc """
  Compare two floating points number using an epsilon error boundary.

  ## Example

      iex> Math.floats_equal?(3.11, 3.1)
      false

      iex> Math.floats_equal?(3.11, 3.1, 0.05)
      true

      iex> Math.floats_equal?(104.9999999, 104.9999996)
      true
  """
  def floats_equal?(a, b, epsilon \\ 1.0e-6) do
    abs(a - b) < epsilon
  end

  @doc """
  Determine if the n-th root of a number is a whole integer, returning a boolean and the 
  root value.

  If the result n-th root is within `epsilon` of a whole
  integer, we consider the result an integer n-th root. 
  This calcualtion runs the fast converging n-th root at a higher
  epsilon than it's configured to use for comparison and testing of the
  result value. 

  ## Options

   - `epsilon` - **Float**. Default `1.0e-6`. Error bounds for calculating float equality.

  ## Examples

      iex> Math.integer_nth_root(27, 3)
      {true, 3}

      iex> Math.integer_nth_root(1234, 6)
      {false, :no_integer_nth_root, 3.2750594908836885}

      iex> Math.integer_nth_root(33_038_369_407, 5)
      {true, 127}
  """
  def integer_nth_root(x, n, epsilon \\ 1.0e-6) when is_integer(x) and is_integer(n) do
    case nth_root(x, n, epsilon * 0.001) do
      0 ->
        {true, 0}

      :zero_root_undefined ->
        {false, :zero_root_undefined}

      root ->
        i_root = Float.round(root)

        if abs(root - i_root) < epsilon do
          {true, Kernel.trunc(i_root)}
        else
          {false, :no_integer_nth_root, root}
        end
    end
  end

  @doc """
  Predicate version of `integer_nth_root/3` - does `x` have an integer `n`-th root.

  ## Examples

      iex> Math.integer_nth_root?(27, 3)
      true

      iex> Math.integer_nth_root?(1234, 6)
      false

      iex> Math.integer_nth_root?(33_038_369_407, 5)
      true

  """
  def integer_nth_root?(x, n, epsilon \\ 1.0e-6) do
    case integer_nth_root(x, n, epsilon) do
      {true, _} -> true
      _ -> false
    end
  end
end
