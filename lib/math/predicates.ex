defmodule Chunky.Math.Predicates do
   @moduledoc """
   Predicate functions are functions of the form `is_*?/1`. Predicates take any integer, and return a boolean.
   Using these functions you can test numbers for specific qualities. Some of the numeric qualities are useful
   across a wide set of domains, like `is_prime?/1`, some are specific to number theory, like `is_pseudo_prime?/1`
   or `is_carmichael_number?/1`. Others look at the representation of numbers as patterns of digits, like `is_palindromic?/1`
   and `is_cyclops_number?/1`. 
   
   The predicates are used throughout the Chunky math libraries and sequence generation libraries. They can be
   used directly in any boolean context, or via special functions like `Chunky.Math.next_number/3` and `analyze_number/2`. Some
   of the predicate functions assume that the number being evaluated is in Base 10 - these function will often have
   counterparts in `Chunky.Math` that work on numbers in _any_ base.
   
   All of the predicates can be used to analyze an integer with:

    - `analyze_number/2` - Apply all of the predicates to an integer, and collect resulting labels
   
   
   ## Factors and Divisors
   
   These predicates deal with the factorization, or properties of factors, of a number.
   
   Abundant, perfect, and deficient numbers take the sum of all proper divisors of a number `n`, and compare that sum to the number
   itself, or all numbers less than `n`.    
   
    - `is_abundant?/1` - Is the sum of divisors of `n` great than to `2 * n`?
    - `is_arithmetic_number?/1` - Is the average of the sum of divisors of `n` a whole number?
    - `is_deficient?/1` - Is the sum of divisors of `n` less than `2 * n`?
    - `is_highly_abundant?/1` - Is the sum of divisors of `n` greater than the sum of divisors of any number _less_ than `n`?
    - `is_perfect?/1` - Is the sum of divisors of `n` equal to `n`?

   Variations on _perfect_ numbers take different approaches to summing the divisors of `n`.
   
    - `is_erdos_nicolas_number?/1` - An abundant number `n` where the first `k` factors sum to `n`.
    - `is_primary_pseudoperfect_number?/1` - A number is primary pseudoperfect if the sum of 1 over `n` and 1 over the prime factors of `n` equals `1`.
    - `is_pseudoperfect_number?/1` - Does any subset of the factors of `n` sum to `n`?
   
   Powerful numbers look at the exponents of prime factors of a number `n`. For instance, `8` has the prime factorization
   `2 * 2 * 2`, or `2^3`. The number `72` has the prime factorization `2^3 * 3^2`.
   
    - `is_achilles_number?/1` - Is the number `n` _powerful_ but not a _perfect power_?
    - `is_highly_powerful_number?/1` - Is the product of the exponents of the prime factorization of `n` greater than the same property for any number less than `n`?
    - `is_powerful_number?/1` - Do the squares of all prime factors of `n` also evenly divide `n`?
      
   Economical, equidigital, and wasteful numbers all look at how the prime factorization of a number can be written,
   and how many digits that requires relative to the number of digits in the original number. The prime factorization of `16`, for
   example, can be written with just `2` and `4`, while the prime factors of `24` (`2^3 * 3^1`) requires only the digits `233`.
   
    - `is_economical_number?/1` - Does writing the prime factors of `n` take fewer digits than writing `n`?
    - `is_equidigital_number?/1` - Does writing the prime factors of `n` take exactly as many digits as writing `n`?
    - `is_wasteful_number?/1` - Does writing the prime factors of `n` take more digits that writing `n`?
   
   
   ## Sums and Sequences
   
   Some number properties are based on summations or sequences of numbers.
   
   The polite and impolite numbers are based on writing a number `n` as the sum of two or more consecutive positive
   integers. The number `5` is a polite number, as it can be written as `2+3`. The number `8` is _impolite_, there are
   no consecutive positive integers that add up to `8`.
   
    - `is_impolite_number?/1` - The number `n` cannot be written as the sum of two or more consecutive positive integers
    - `is_polite_number?/1` - The number `n` _can_ be written as the sum of two or more consecutive positive integers
   
   The _practical_ numbers extend the idea of polite numbers, such that a polite number is a positive integer `n` where
   all positive integers _less_ than `n` can be written as sums of the distinct divisors of `n`.
   
    - `is_practical_number?/1` - All `m` less than `n` can be written as sums of distinct divisors of `n`.
   
   The Smith and Hoax numbers involve the digit sum of a number compared to the digit sum of the prime factors of the
   number.
   
    - `is_hoax_number?/1` - Hoax numbers have equal digits sums in `n` and the summed _unique_ prime factors of `n`.
    - `is_smith_number?/1` - Smith numbers have equal digit sums in `n` and the summed prime factors of `n`.
   
   The hypotenuse and nonhypotenuse numbers determine which numbers can be the hypotenuse of integer right triangles.
   
    - `is_nonhypotenuse_number?/1` - Can the square of `n` not be written as the sum of two other squares?
    - `is_hypotenuse_number?/1` - Can the square of `n` be written as the sum of two other squares?
      
   
   ## Number Theory
   
   The general mathematical properties of numbers fall into the Number Theory cateogry.
   
    - `is_even?/1` - Is an integer even?
    - `is_negative?/1` - Is an integer a negative number?
    - `is_odd?/1` - Is an integer odd?
    - `is_positive?/1` - Is an integer a positive number?
    - `is_zero?/1` - Is an integer `0`?   
   
   The single and doubly even numbers put further constraints on the even numbers.
   
    - `is_doubly_even_number?/1` - Is `n` divisible by 4?
    - `is_singly_even_number?/1` - Is `n` divisible by 2, but not by 4?
   
   
   ## Convergences
   
   Some numeric analysis is based on the eventual convergence of a function or iteration.
   
   By repeatedly taking the digits of a number, squaring them, and summing the result, all
   numbers will eventually converge to one of the numbers `0, 1, 4, 16, 20, 37, 42, 58, 89, or 145`. 
   
    - `is_happy_number?/1` - Happy numbers coverge to `1`
    - `is_unhappy_number?/1` - Unhappy numbers converge to a value other than `1`
   
   
   ## Patterns
   
   Patterns of digits in numbers are a common topic in recreational math. These predicates deal with the sequencing, arrangement,
   or visual pattern of digits in numbers. 

   Palindromic numbers are like palindromic words, the same forwards and backwards. The number `12344321` is a palindromic number,
   while `123432` is not.
   
    - `is_palindromic?/1` - Is `n` palindromic, the same number forward and backward, in base 10?
    - `is_palindromic_prime?/1` - Is `n` a palindromic prime number?
    - `is_strictly_non_palindromic?/1` - Is `n` non-palindromic in all bases `2` through `n - 2`?
   
   Rep-digits, or repunits in base 2, are number made up of a single, repeating, digit. The number `222222` is a repdigit. The
   number `11111110` is _not_ a repdigit number.
   
    - `is_repdigit?/1` - Is `n` a repdigit number?
    - `is_repunit?/1` - Is `n` a Repunit - a sequence of only `1`s?

   Patterns specific to base-2:
   
    - `is_evil_number?/1` - Does the binary expansion of `n` have an _even_ number of `1`s?
    - `is_odious_number?/1` - Does the binary expansion of `n` have _odd_ number of `1`s?
   
   
   Miscellaneous patterns:
      
    - `is_cyclops_number?/1` - Does `n` have an odd number of digits and a single `0` in the center most digit?
    - `is_pandigital?/1` - Does `n` contain all of the decimal digits at least once?
    - `is_plaindrome?/1` - Do the digits of `n` always stay the same or increase when read left to right?
   
   
   ## Powers
   
   Some predicate functions examine numbers as powers of other numbers. 
   
   The cubed numbers, of the form `n^3`.
   
    - `is_cubefree?/1` - Is `n` a number that _cannot_ be written as the cube of another number?
    - `is_perfect_cube?/1` - Is `n` a perfect cube?

   The square numbers, of the form `n^2`.
   
    - `is_perfect_square?/1` - Is `n` a perfect square?
    - `is_squarefree?/1` - Is `n` a number that _cannot_ be written as the square of another number?

   Other powers, of the form `n^m`.
   
    - `is_perfect_power?/1` - Can `n` be written as another number `m` to a power?
    - `is_prime_power?/1` - Is `n` a power greater than `1` of a prime number?
   
   
   ## Primes
   
   Prime numbers and rearrangements and patterns in prime numbers, are the focus of these
   predicates.
   
   Basic primality tests, based on the Rabin-Miller probabalistic primality test.
   
    - `is_prime?/1` - Is `n` a prime number?
    - `is_prime_fast?/1` - Is `n` a prime number? An alternative to `is_prime?/1`, that can be faster for values of `n` < `2^16`.
   
   Reading primes forwards and backwards:
   
    - `is_palindromic_prime?/1` - Is `n` a prime number, _and_ a palindromic number?
    - `is_emirp_prime?/1` - Is `n` a prime number, that is a different prime when reversed?

   Re-arrangements or edited digits of prime numbers:
   
    - `is_circular_prime?/1` - Is `n` a prime number that remains prime through all possible circular rotations of digits?
    - `is_weakly_prime?/1` - Is `n` a prime number that is _never_ prime when any one digit is changed to any other value?

   Truncation involves removing a digit of a number from the left, right, or both sides at once to create a new
   number. Truncatable primes are prime numbers that _are still prime_ throughout the truncation down to a single or
   double digit number.
   
    - `is_left_truncatable_prime?/1` - Is `n` a prime number that remains prime through all left-truncations down to a single digit?
    - `is_left_right_truncatable_prime?/1` - Is `n` a prime number that remains prime through all simultaneous truncation of left and right digits down to a double or single digit number?
    - `is_right_truncatable_prime?/1` - Is `n` a prime number that remains prime through all right-trucations down to a single digit?
    - `is_two_sided_prime?/1` - Is `n` a prime that is both a left and a right truncatable prime?

   Some prime predicate functions check composite and prime numbers for prime factors:
   
    - `is_prime_power?/1` - Is `n` a power `m` of a prime `p`, where `m` >= 1, such that `n = p^m`.
    - `is_prime_vampire_number?/1` - Is `n` a _vampire number_ with prime fangs? See **Vampire Numbers** below.
    - `is_sphenic_number?/1` - Is `n` a composite numer that is the product of three _distinct_ primes?
      
   
   ## Pseudo-primes
   
   The pseudo-prime numbers are composite numbers (by definition _not prime_) that fulfill certain constraints, and
   are useful in various number theory and algebraic contexts.

   The Euler and Euler-Jacobi pseudo primes are numbers `n` that when used as powers for a base `a` are congruent to
   a specific value. Euler pseudo primes are more permissive in their congruence than Euler-Jacobi pseudo-primes. In
   both of these cases, base 10 is used, hence any values that are found to be pseudo-prime by these functions are
   pseudo-prime to base 10. 
   
    - `is_euler_jacobi_pseudo_prime?/1` - Is `n` an Euler-jacobi pseudo prime to base 10?
    - `is_euler_pseudo_prime?/1` - Is `n` an Euler pseudo-prime to base 10?

   When no other label is given, pseudo-primes are generally understood to imply _Fermat_ pseudo-primes. Like
   Euler and Euler-Jacobi psedu-primes, numbers that are Fermat pseudo-prime are calculated accoring to a congruence
   to a specific base; for these predicates that is base 10. 
   
    - `is_carmichael_number?/1` - Is `n` a Carmichael number, a number pseudo-prime to all bases `a` when `a` is coprime to `n`?
    - `is_poulet_number?/1` - Is `n` a Poulet number, a Fermat pseudo-prime in base 2? 
    - `is_pseudo_prime?/1` - Is `n` a Fermat pseudo prime in base 10?
   
   Generalizations of the Euler, Euler-Jacobi, and Fermat pseudo-prime functions across _any_ base (not just base 10)
   are available in `Chunky.Math`.


   ## Rhonda Numbers
   
   A number `n` is a _Rhonda Number_ in base `b` if the product of the digits of `n` in base `b` is equal to `b` multiplied by
   the sum of the prime factors of `n`. Rhonda numbers seem to be primarily of interest as recreational terms - numbers
   that display an interesting property, but have little or no use otherwise. The `Chunky.Math` function `Chunky.Math.is_rhonda_to_base?/2`
   is a  generalization of checking Rhonda numbers to any base.
      
    - `is_multiple_rhonda?/1` - Test if `n` is a Rhonda number in multiple bases (checks bases 4 to 1000)
    - `is_rhonda_to_base_4?/1` - Determine if `n` is a Rhonda number to base 4
    - `is_rhonda_to_base_6?/1` - Determine if `n` is a Rhonda number to base 6
    - `is_rhonda_to_base_8?/1` - Determine if `n` is a Rhonda number to base 8
    - `is_rhonda_to_base_9?/1` - Determine if `n` is a Rhonda number to base 9
    - `is_rhonda_to_base_10?/1` - Determine if `n` is a Rhonda number to base 10
    - `is_rhonda_to_base_12?/1` - Determine if `n` is a Rhonda number to base 12
    - `is_rhonda_to_base_14?/1` - Determine if `n` is a Rhonda number to base 14
    - `is_rhonda_to_base_15?/1` - Determine if `n` is a Rhonda number to base 15
    - `is_rhonda_to_base_16?/1` - Determine if `n` is a Rhonda number to base 16
    - `is_rhonda_to_base_20?/1` - Determine if `n` is a Rhonda number to base 20
    - `is_rhonda_to_base_30?/1` - Determine if `n` is a Rhonda number to base 30
    - `is_rhonda_to_base_60?/1` - Determine if `n` is a Rhonda number to base 60
   
   
   ## Vampire Numbers
   
   A number `n` is a _vampire numbers_ if it can be factored into two divisors (called _fangs_) `a` and `b`,
   and meet the criteria that:
   
    1. `n` has an even number of digits
    2. Both `a` and `b` half exactly half as many digits as `n`
    3. One or the other of `a` or `b` can have trailing zeros, but not both
    4. `a` and `b` contain all of the original digits of `n`, in any order, _including_ duplicated digits in `n`
   
   The canonical example of a true vampire number is `1260`, which has among its divisor pairs `21 x 60`. So
   `21` and `60` are the fangs of the vampire number `1260`. Each of the vampire number predicates is based 
   off of interpretations or modifications of these rules.
   
    - `is_double_vampire_number?/1` - Is `n` a vampire number whose fangs are also vampire numbers?
    - `is_prime_vampire_number?/1` - Is `n` a vampire number with fangs that are prime numbers?
    - `is_pseudo_vampire_number?/1` - Is `n` a vampire number with relaxed constraints, like fangs with unequal numbers of digits?
    - `is_vampire_number?/1` - Is `n` a vampire number?
   
   
   ## Cryptography
   
   Smooth numbers, or `b-smooth` numbers, are composite integers whose prime factors are all less than or equal to
   a specific value. Numbers that are `3-smooth`, for instance, are composites that only have `2` and `3` as prime
   factors. The number `8` is 3-smooth (factors `2 * 2 * 2`), as is `648` (factors `2^3 * 3^4`), while `15` is _not_
   3-smooth (factors `3 * 5`). The generalized function for testing `b-smooth` is `Chunky.Math.is_b_smooth?/2`.
   
    - `is_3_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `3`?
    - `is_5_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `5`?
    - `is_7_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `7`?
    - `is_11_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `11`?
    - `is_13_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `13`?
    - `is_17_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `17`?
    - `is_19_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `19`?
    - `is_23_smooth?/1` - Is `n` a composite with prime factors all less than or equal to `23`?

   """
    
   require Integer
   require Chunky.Math.Operations
  
   import Chunky.Math.Operations, only: [summation: 3]
   
   alias Chunky.Fraction
   alias Chunky.Math
   
   import Chunky.Math, 
       only: 
           [
               coprimes: 1,
               digit_count: 3, 
               digit_sum: 1,
               factor_pairs: 1,
               factors: 1, 
               get_rhonda_to: 1,
               has_subset_sum?: 2,
               is_b_smooth?: 2, 
               is_cyclops_number_in_base?: 2,
               is_euler_jacobi_pseudo_prime?: 2,
               is_euler_pseudo_prime?: 2,
               is_rhonda_to_base?: 2,
               is_root_of?: 2,
               is_pandigital_in_base?: 2,
               is_palindromic_in_base?: 2,
               is_plaindrome_in_base?: 2,
               is_power_of?: 2,
               is_pseudo_prime?: 2, 
               length_in_base: 2,
               prime_factors: 1,
               product_of_prime_factor_exponents: 1,
               reduced_prime_factors: 1,
               reverse_number: 1,
               rotations: 1, 
               sigma: 1, 
           ]
   
   # tracking value for certain functions to test for integer/float
   # higher bounds
   @rand_max Kernel.trunc(:math.pow(2, 63))
   
   # First primes list is used by is_prime_fast?/1 function
   @first_primes_list [
     2,
     3,
     5,
     7,
     11,
     13,
     17,
     19,
     23,
     29,
     31,
     37,
     41,
     43,
     47,
     53,
     59,
     61,
     67,
     71,
     73,
     79,
     83,
     89,
     97,
     101,
     103,
     107,
     109,
     113,
     127,
     131,
     137,
     139,
     149,
     151,
     157,
     163,
     167,
     173,
     179,
     181,
     191,
     193,
     197,
     199,
     211,
     223,
     227,
     229,
     233,
     239,
     241,
     251,
     257,
     263,
     269,
     271,
     277,
     281,
     283,
     293,
     307,
     311,
     313,
     317,
     331,
     337,
     347,
     349,
     353,
     359,
     367,
     373,
     379,
     383,
     389,
     397,
     401,
     409,
     419,
     421,
     431,
     433,
     439,
     443,
     449,
     457,
     461,
     463,
     467,
     479,
     487,
     491,
     499,
     503,
     509,
     521,
     523,
     541
   ]
   
   # keep a map of the first primes, we we use for gast lookup
   @first_primes_mapset MapSet.new(@first_primes_list)
   
   @doc """
   Apply all predicates to `n`, and collect the resulting labels.

   This function uses the names of all of the predicate functions as sources for labels, and collects
   the resulting labels from a number being analyzed. This will work with all integers in the range `(-∞..0..+∞)`.

   Some predicate functions can take a long time to run depending on the size of `n`, so the `analyze_number/2` function
   uses a timeout for each predicate. See the `predicate_wait_time` option for more details.

   ## Options

    - `skip_smooth` - Boolean, default `false`. If `true`, skip all smooth number predicates of form `is_#_smooth?/1`
    - `predicate_wait_time` - Integer, default `100`. Maximum number of milliseconds to wait for an answer from each predicate function

   ## Examples

       iex> Predicates.analyze_number(2048)
       [:"11_smooth", :"13_smooth", :"17_smooth", :"19_smooth", :"23_smooth",:"3_smooth", :"5_smooth", :"7_smooth", :deficient, :doubly_even_number, :economical_number, :even, :impolite_number, :nonhypotenuse_number, :odious_number, :perfect_power, :positive, :powerful_number, :practical_number, :prime_power, :unhappy_number]

       iex> Predicates.analyze_number(2048, skip_smooth: true)
       [:deficient, :doubly_even_number, :economical_number, :even, :impolite_number, :nonhypotenuse_number, :odious_number, :perfect_power, :positive, :powerful_number, :practical_number, :prime_power, :unhappy_number]

       iex> Predicates.analyze_number(-37)
       [:negative, :odd, :odious_number]

       iex> Predicates.analyze_number(0)
       [:cyclops_number, :doubly_even_number, :even, :evil_number, :palindromic, :perfect_square, :plaindrome, :repdigit, :zero]

       iex> Predicates.analyze_number(105840, skip_smooth: true)
       [:abundant, :arithmetic_number, :doubly_even_number, :even, :hypotenuse_number, :odious_number, :polite_number, :positive, :practical_number, :unhappy_number, :wasteful_number]

       iex> Predicates.analyze_number(105840, skip_smooth: true, predicate_wait_time: 20_000)
       [:abundant, :arithmetic_number, :doubly_even_number, :even, :highly_abundant, :hypotenuse_number, :odious_number, :polite_number, :positive, :practical_number, :pseudoperfect_number, :unhappy_number, :wasteful_number]

       iex> Predicates.analyze_number(1000, skip_smooth: true)
       [:abundant, :doubly_even_number, :equidigital_number, :even, :evil_number, :happy_number, :hypotenuse_number, :multiple_rhonda, :perfect_cube, :perfect_power, :polite_number, :positive, :powerful_number, :practical_number, :pseudoperfect_number, :rhonda_to_base_16]
    
       iex> Predicates.analyze_number(1435)
       [:arithmetic_number, :cubefree, :deficient, :equidigital_number, :hypotenuse_number, :odd, :odious_number, :polite_number, :positive, :pseudo_vampire_number, :sphenic_number, :squarefree, :unhappy_number, :vampire_number]
   """
   def analyze_number(n, opts \\ []) when is_integer(n) do
     # how long are we waiting for each predicate
     wait_time = opts |> Keyword.get(:predicate_wait_time, 100)

     # are we skipping smooth functions?
     skip_smooth = opts |> Keyword.get(:skip_smooth, false)

     skip_list =
       if skip_smooth do
         [
           :is_3_smooth?,
           :is_5_smooth?,
           :is_7_smooth?,
           :is_11_smooth?,
           :is_13_smooth?,
           :is_17_smooth?,
           :is_19_smooth?,
           :is_23_smooth?
         ]
       else
         []
       end

     # what functions are we skipping?
     skip_set = MapSet.new([:is_prime_fast?] ++ skip_list)

     # find all predicates
     Chunky.Math.Predicates.__info__(:functions)
     |> Enum.filter(fn {func, arity} ->
       # take these apart and find is_*?/1 functions
       f_name = func |> Atom.to_string()

       String.starts_with?(f_name, "is_") && String.ends_with?(f_name, "?") && arity == 1
     end)

     # reject anything in our skip set
     |> Enum.reject(fn {func, _arity} -> skip_set |> MapSet.member?(func) end)
     # map to funct/name pairs
     |> Enum.map(fn {func, _arity} ->
       f_atom = func |> Atom.to_string() |> String.slice(3..-2) |> String.to_atom()
       {func, f_atom}
     end)

     # apply and filter
     |> Enum.filter(fn {func, _name} ->
       pred_task =
         Task.async(fn ->
           apply(Chunky.Math.Predicates, func, [n])
         end)

       case Task.yield(pred_task, wait_time) || Task.shutdown(pred_task) do
         {:ok, result} ->
           # ran to completion
           result

         nil ->
           # timed out
           false
       end
     end)

     # map to names
     |> Enum.map(fn {_func, name} -> name end)
     |> Enum.sort()
   end
   
   @doc """
   Is `n` a composite with prime factors all less than or equal to `3`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_3_smooth?(3)
       true

       iex> Predicates.is_3_smooth?(40)
       false

       iex> Predicates.is_3_smooth?(107)
       false

       iex> Predicates.is_3_smooth?(2020)
       false
   """
   def is_3_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_3_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 3)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `5`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_5_smooth?(3)
       true

       iex> Predicates.is_5_smooth?(40)
       true

       iex> Predicates.is_5_smooth?(107)
       false

       iex> Predicates.is_5_smooth?(2020)
       false
   """
   def is_5_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_5_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 5)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `7`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_7_smooth?(3)
       true

       iex> Predicates.is_7_smooth?(40)
       true

       iex> Predicates.is_7_smooth?(107)
       false

       iex> Predicates.is_7_smooth?(2020)
       false
   """
   def is_7_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_7_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 7)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `11`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_11_smooth?(3)
       true

       iex> Predicates.is_11_smooth?(40)
       true

       iex> Predicates.is_11_smooth?(107)
       false

       iex> Predicates.is_11_smooth?(2020)
       false
   """
   def is_11_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_11_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 11)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `13`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_13_smooth?(3)
       true

       iex> Predicates.is_13_smooth?(40)
       true

       iex> Predicates.is_13_smooth?(107)
       false

       iex> Predicates.is_13_smooth?(2020)
       false
   """
   def is_13_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_13_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 13)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `17`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_17_smooth?(3)
       true

       iex> Predicates.is_17_smooth?(40)
       true

       iex> Predicates.is_17_smooth?(107)
       false

       iex> Predicates.is_17_smooth?(2020)
       false
   """
   def is_17_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_17_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 17)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `19`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_19_smooth?(3)
       true

       iex> Predicates.is_19_smooth?(40)
       true

       iex> Predicates.is_19_smooth?(107)
       false

       iex> Predicates.is_19_smooth?(2020)
       false
   """
   def is_19_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_19_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 19)

   @doc """
   Is `n` a composite with prime factors all less than or equal to `23`?
    
   **Generalized function**: `Chunky.Math.is_b_smooth?/2`

   ## Examples

       iex> Predicates.is_23_smooth?(3)
       true

       iex> Predicates.is_23_smooth?(40)
       true

       iex> Predicates.is_23_smooth?(107)
       false

       iex> Predicates.is_23_smooth?(2020)
       false
   """
   def is_23_smooth?(n) when is_integer(n) and n <= 0, do: false
   def is_23_smooth?(n) when is_integer(n) and n > 0, do: is_b_smooth?(n, 23)

   @doc """
   Determine if an integer is _abundant_. 

   An abundant number is an integer `n`, such that the sum of all proper divisors of `n` (including itself)
   is greater than `2 * n`. 

   Alternatively, an abundant number is a number that satisfies: `𝜎(n) > 2n`

   See also: 
   
    - `is_arithmetic_number?/1`
    - `is_deficient?/1`
    - `is_highly_abundant?/1`
    - `is_perfect?/1`
    - `Chunky.Math.sigma/1`


   ## Examples

       iex> Predicates.is_abundant?(3)
       false
      
       iex> Predicates.is_abundant?(12)
       true
      
       iex> Predicates.is_abundant?(945)
       true

   """
   def is_abundant?(n) when is_integer(n) and n <= 0, do: false

   def is_abundant?(n) when is_integer(n) and n > 0 do
     sigma(n) > 2 * n
   end

   @doc """
   Check if a number is an Achilles Number.

   Achilles numbers are `n` that are _powerful_ (see `is_powerful_number?/1`) but not _perfect powers_ (see `is_perfect_power?/1`).

   OEIS References:
   
    - [A052486 - Achilles numbers](https://oeis.org/search?q=A052486&language=english&go=Search)

   See also:  
   
    - `is_powerful_number?/1`
    - `is_highly_powerful_number?/1`
    - `is_perfect?/1`
   

   ## Examples

       iex> Predicates.is_achilles_number?(70)
       false
      
       iex> Predicates.is_achilles_number?(72)
       true

       iex> Predicates.is_achilles_number?(2700)
       true

       iex> Predicates.is_achilles_number?(784)
       false
   """
   def is_achilles_number?(n) when is_integer(n) and n <= 71, do: false

   def is_achilles_number?(n) when is_integer(n) and n > 71 do
     is_powerful_number?(n) and !is_perfect_power?(n)
   end
   
   @doc """
   Determine if an integer is an _arithmetic number_.

   An arithmetic number is an integer `n` such that the average of the sum of the proper divisors of `n` is
   a whole integer. Alternatively, `n` that satisfy `𝜎(n) / 𝜏(n) == 0`.

   See also:
    
    - `Chunky.Math.factors/1`
    - `is_abundant?/1`
    - `is_deficient?/1`
    - `is_perfect?/1`
    - `is_highly_abundant?/1`
   
   
   ## Examples

       iex> Predicates.is_arithmetic_number?(11)
       true
      
       iex> Predicates.is_arithmetic_number?(32)
       false
      
       iex> Predicates.is_arithmetic_number?(12953)
       true
   """
   def is_arithmetic_number?(n) when is_integer(n) and n <= 0, do: false

   def is_arithmetic_number?(n) when is_integer(n) and n > 0 do
     divs = factors(n)
     rem(divs |> Enum.sum(), length(divs)) == 0
   end
      
   @doc """
   Check if `n` is a Carmichael number.

   A Carmichael number `n` is a composite number that satisfies the congruence:

    ![Carmichael Number](https://wikimedia.org/api/rest_v1/media/math/render/svg/6a865f5eed65bd5f1a68ddb9ad0f35cfe9aa1208)

   for all `b` that are coprime to `n`. 
   
   See also:
   
    - `Chunky.Math.coprimes/1`
    - `is_pseudo_prime?/1`
    - `is_poulet_number?/1`


   ## Examples

       iex> Predicates.is_carmichael_number?(517)
       false

       iex> Predicates.is_carmichael_number?(561)
       true

       iex> Predicates.is_carmichael_number?(1105)
       true

       iex> Predicates.is_carmichael_number?(1107)
       false

       iex> Predicates.is_carmichael_number?(41041)
       true
      
   """
   def is_carmichael_number?(n) when n > 1 do
     (coprimes(n) -- [1])
     |> Enum.all?(fn a -> is_pseudo_prime?(n, a) end)
   end

   def is_carmichael_number?(_), do: false
      
   @doc """
   Is `n` a circular prime?

   A circular prime is a number `n` that remains a prime number through all
   possible rotations of the digits of `n`. For instance, `1193` is a circular
   prime because `1193`, `1931`, `9311`, and `3119` are all prime.

   See also:
   
    - `is_prime?/1`
    - `Chunky.Math.rotations/1`
   
   
   ## Examples

       iex> Predicates.is_circular_prime?(1193)
       true

       iex> Predicates.is_circular_prime?(3)
       true

       iex> Predicates.is_circular_prime?(193939)
       true

       iex> Predicates.is_circular_prime?(135)
       false

   """
   def is_circular_prime?(n) when n <= 0, do: false

   def is_circular_prime?(n) when n > 0 do
     rotations(n)
     |> Enum.all?(fn v -> is_prime?(v) end)
   end
   
   @doc """
   Check if an integer `n` has no factors greater than `1` that are perfect cubes.

   See also:

    - `Chunky.Math.factors/1`
    - `Chunky.Math.prime_factors/1`
    - `is_perfect_cube?/1`
    - `is_perfect_square?/1`
    - `is_squarefree?/1`
   
   
   ## Examples

       iex> Predicates.is_cubefree?(3)
       true

       iex> Predicates.is_cubefree?(64)
       false

       iex> Predicates.is_cubefree?(2744)
       false
   """
   def is_cubefree?(1), do: true
   def is_cubefree?(n) when is_integer(n) and n <= 0, do: false

   def is_cubefree?(n) when is_integer(n) and n > 0 do
     (factors(n) -- prime_factors(n))
     |> Enum.uniq()
     |> Enum.filter(fn c_f -> is_perfect_cube?(c_f) end)
     |> length() == 0
   end
   
   @doc """
   Check if `n` is a Cyclops number in base 10.

   Cyclops numbers in base 10 are numbers with:
   
    - an odd number of digits
    - exactly one `0`
    - a `0` in the center-most digit of `n`
   
   So the numbers `101`, `904`, and `12034` are cyclops numbers, but `1023` and `10001` are not.
   
   **Generalized function**: `Chunky.Math.is_cyclops_number_in_base?/2`


   ## Examples

       iex> Predicates.is_cyclops_number?(0)
       true

       iex> Predicates.is_cyclops_number?(50)
       false

       iex> Predicates.is_cyclops_number?(104)
       true

       iex> Predicates.is_cyclops_number?(1005)
       false

       iex> Predicates.is_cyclops_number?(19010)
       false

       iex> Predicates.is_cyclops_number?(1230456)
       true

   """
   def is_cyclops_number?(n), do: is_cyclops_number_in_base?(n, 10)
   
   @doc """
   Determine if an integer is _deficient_.

   A deficient number is an integer `n`, such that the sum of all proper divisors of `n` (including itself)
   is less than `2 * n`. 

   Alternatively, a deficient number is a number that satisfies: `𝜎(n) < 2n`

   See also:
    
    - `Chunky.Math.sigma/1`
    - `is_abundant?/1`
    - `is_arithmetic_number?/1`
    - `is_highly_abundant?/1`
    - `is_perfect?/1`

   ## Examples

       iex> Predicates.is_deficient?(1)
       true

       iex> Predicates.is_deficient?(71)
       true

       iex> Predicates.is_deficient?(33550336)
       false

       iex> Predicates.is_deficient?(60)
       false
   """
   def is_deficient?(n) when is_integer(n) and n <= 0, do: false

   def is_deficient?(n) when is_integer(n) and n > 0 do
     sigma(n) < 2 * n
   end
   
   @doc """
   Check of `n` is a **double** _vampire number_.

   Double vampire numbers meet all the criteria of a regular vampire number (see `is_vampire_number?/1`)
   with the additional constraint:

    1. The two factors of `n`, `a` and `b`, must _also be_ vampire numbers

   See also:
   
    - `is_prime_vampire_number?/1`
    - `is_pseudo_vampire_number?/1`
    - `is_vampire_number?/1`
   
   ## Examples

       iex> Predicates.is_double_vampire_number?(6880)
       false
      
       iex> Predicates.is_double_vampire_number?(1047527295416280)
       true
   """
   def is_double_vampire_number?(n) when n <= 0, do: false

   def is_double_vampire_number?(n) when is_integer(n) and n > 0 do
     # even number of digits?
     if length_in_base(n, 10) |> rem(2) == 1 do
       false
     else
       # find our sorted digits of N for later
       n_digits = Integer.digits(n) |> Enum.sort()

       # find factors
       factor_pairs(n)

       # filter factors

       # same length
       |> Enum.filter(fn {a, b} -> length_in_base(a, 10) == length_in_base(b, 10) end)

       # can't both end in zero
       |> Enum.filter(fn {a, b} ->
         a_z = Integer.digits(a) |> List.last()
         b_z = Integer.digits(b) |> List.last()

         !(a_z == 0 && b_z == 0)
       end)

       # both factors must _also_ be vampire numbers
       |> Enum.filter(fn {a, b} -> is_vampire_number?(a) && is_vampire_number?(b) end)

       # do we have all of our digits?
       |> Enum.filter(fn {a, b} ->
         (Integer.digits(a) ++ Integer.digits(b)) |> Enum.sort() == n_digits
       end)

       # if we have anything left over, it's a vampire
       |> length() > 0
     end
   end
   
   @doc """
   Is `n` divisible by 4?
   
   Doubly even numbers are an extension of the even numbers.
   
   OEIS References:
   
    - [A008586 - Multiples of 4](http://oeis.org/A008586)
   
   See also:
   
    - `is_even?/1`
    - `is_singly_even_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_doubly_even_number?(4)
       true

       iex> Predicates.is_doubly_even_number?(14)
       false

       iex> Predicates.is_doubly_even_number?(892)
       true

       iex> Predicates.is_doubly_even_number?(3956)
       true
   
   """
   def is_doubly_even_number?(n) when Integer.is_odd(n), do: false
   def is_doubly_even_number?(n) when Integer.is_even(n) do
      rem(n, 4) == 0 
   end
   
   @doc """
   Does the prime factorization of `n` have fewer digits (counting primes and powers) than `n`?
   
   The economical numbers are sometimes called the _frugal_ numbers. When counting digits of
   the prime factorization the prime and it's exponent are combined together, so `125` is a frugal
   number, because its prime factorization is `5^3` or `53` written out.
   
   OEIS References:
   
    - [A046759 - The economical numbers](http://oeis.org/A046759)
   
   See also:
   
    - `is_wasteful_number?/1`
    - `is_equidigital_number?/1`
   
   ## Examples
   
       iex> Predicates.is_economical_number?(125)
       true

       iex> Predicates.is_economical_number?(1875)
       true

       iex> Predicates.is_economical_number?(1880)
       false

       iex> Predicates.is_economical_number?(1946430)
       true
   
   """
   def is_economical_number?(n) when n > 124 do
       (reduced_prime_factors(n)
       |> Enum.map(
           fn {base, power} -> 
               case power do
                   1 -> Integer.digits(base)
                   _ -> Integer.digits(base) ++ Integer.digits(power) 
               end
           end
       )
       |> List.flatten()
       |> length()) < length_in_base(n, 10)
   end
   def is_economical_number?(_), do: false
   
   @doc """
   Is `n` an _emirp_ - a prime number that is a _different_ prime number when reversed?

   Emirp primes are related to _palindromic_ primes, except that the
   reverse of `n` must be a _different_ prime number.

   See also:
   
    - `is_prime?/1`
    - `is_palindromic?/1`
    - `Chunky.Math.reverse_number/1`
   
   ## Examples

       iex> Predicates.is_emirp_prime?(373)
       false

       iex> Predicates.is_emirp_prime?(13)
       true

       iex> Predicates.is_emirp_prime?(983)
       true

       iex> Predicates.is_emirp_prime?(947351)
       true

   """
   def is_emirp_prime?(n) when n <= 0, do: false

   def is_emirp_prime?(n) when n > 0 do
     r_n = reverse_number(n)
     is_prime?(n) && is_prime?(r_n) && n != r_n
   end
   
   @doc """
   Does the prime factorization of `n` use exactly as many digits (counting primes and powers) as `n`?
   
   When counting digits of the prime factorization the prime and it's exponent are combined together, 
   so `16` is an equidigital number, because its prime factorization is `2^4` or `24` written out.
   
   OEIS References:
   
    - [A046758 - Equidigital numbers](http://oeis.org/A046758)
   
   See also:
   
    - `is_economical_number?/1`
    - `is_wasteful_number?/1`
   
   ## Examples
   
       iex> Predicates.is_equidigital_number?(2)
       true

       iex> Predicates.is_equidigital_number?(49)
       true

       iex> Predicates.is_equidigital_number?(433)
       true

       iex> Predicates.is_equidigital_number?(33701)
       true
   
   """
   def is_equidigital_number?(n) when n > 0 do
       (reduced_prime_factors(n)
       |> Enum.map(
           fn {base, power} -> 
               case power do
                   1 -> Integer.digits(base)
                   _ -> Integer.digits(base) ++ Integer.digits(power) 
               end
           end
       )
       |> List.flatten()
       |> length()) == length_in_base(n, 10)
   end
   def is_equidigital_number?(_), do: false
   
   @doc """
   Is `n` an abundant number whose first `k` factors sum to `n`?
   
   The Erdős-Nicolas numbers are a variation on abundant and perfect numbers. The first `k` factors
   of `n` must sum to `n`; for instance `2016` is an Erdős-Nicolas number, as the first 31 factors (of 35
   factors) sums to `2016`.
   
   OEIS References
   
    - [A194472 - Erdős-Nicolas numbers](https://oeis.org/A194472)
   
   See also:
   
    - `is_primary_pseudoperfect_number?/1`
    - `is_pseudoperfect_number?/1`
   
   ## Examples
   
       iex> Predicates.is_erdos_nicolas_number?(6)
       false

       iex> Predicates.is_erdos_nicolas_number?(24)
       true

       iex> Predicates.is_erdos_nicolas_number?(2016)
       true

       iex> Predicates.is_erdos_nicolas_number?(4096)
       false

       iex> Predicates.is_erdos_nicolas_number?(8190)
       true
   
   """
   def is_erdos_nicolas_number?(n) when n > 0 do
       is_abundant?(n) && has_prefix_sum?(factors(n) -- [n], 0, n)
   end
   def is_erdos_nicolas_number?(_), do: false
   
   defp has_prefix_sum?([], sum, val) do
       sum == val
   end
   
   defp has_prefix_sum?([pre | nums], sum, val) do
       if sum == val do
           true
       else
           has_prefix_sum?(nums, sum + pre, val)
       end
   end
   
   @doc """
   Check if `n` is an Euler-Jacobi pseudo-prime to base 10.

   **Generalized function**: `Chunky.Math.is_euler_jacobi_pseudo_prime?/2`
   
   See also:
   
    - `is_euler_pseudo_prime?/1`
    - `is_pseudo_prime?/1`
   

   ## Examples

       iex> Predicates.is_euler_jacobi_pseudo_prime?(17)
       false

       iex> Predicates.is_euler_jacobi_pseudo_prime?(481)
       true

       iex> Predicates.is_euler_jacobi_pseudo_prime?(487)
       false

       iex> Predicates.is_euler_jacobi_pseudo_prime?(6601)
       true


   """
   def is_euler_jacobi_pseudo_prime?(n) when n > 1 and Integer.is_odd(n),
     do: is_euler_jacobi_pseudo_prime?(n, 10)

   def is_euler_jacobi_pseudo_prime?(_), do: false
   
   @doc """
   Check if `n` is an Euler pseudo-prime in base 10.

   **Generalized function**: `Chunky.Math.is_euler_pseudo_prime?/2`
   
   See also:
   
    - `is_euler_jacobi_pseudo_prime?/1`
    - `is_pseudo_prime?/1`
   

   ## Examples

       iex> Predicates.is_euler_pseudo_prime?(9)
       true
    
       iex> Predicates.is_euler_pseudo_prime?(14)
       false

       iex> Predicates.is_euler_pseudo_prime?(33)
       true

       iex> Predicates.is_euler_pseudo_prime?(91)
       true

   """
   def is_euler_pseudo_prime?(n) when n > 1 and Integer.is_odd(n),
     do: is_euler_pseudo_prime?(n, 10)

   def is_euler_pseudo_prime?(_), do: false
   
   @doc """
   Predicate version of `is_even/1` Integer guard.

   ## Examples

       iex> Predicates.is_even?(34)
       true

       iex> Predicates.is_even?(0)
       true

       iex> Predicates.is_even?(3)
       false
   """
   def is_even?(n) when Integer.is_even(n), do: true
   def is_even?(n) when is_integer(n), do: false
   
   @doc """
   Does `n` have an even number of `1`s in base 2?
   
   Evil numbers, and their counterpart the _odious_ numbers, count the quantity of set bits (`1`s) in
   the base 2 expansion of a number.
   
   OEIS References:
   
    - [A001969 - Evil Numbers](http://oeis.org/A001969)
   
   See also:
   
    - `is_odious_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_evil_number?(3)
       true

       iex> Predicates.is_evil_number?(23)
       true

       iex> Predicates.is_evil_number?(25)
       false

       iex> Predicates.is_evil_number?(19940)
       true
   
   """
   def is_evil_number?(n) when is_integer(n) do
       digit_count(n, [1], base: 2) |> rem(2) == 0    
   end
   
   @doc """
   Does the repeated sum of squares of the digits of `n` converge to `1`?
   
   By repeatedly taking the digits of a number, squaring them, and summing the result, all
   numbers will eventually converge to one of the numbers `0, 1, 4, 16, 20, 37, 42, 58, 89, or 145`. Happy
   numbers coverge to `1`.
   
   OEIS References:
   
    - [A007770 - Happy numbers](http://oeis.org/A007770)
   
   See also:
   
    - `is_unhappy_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_happy_number?(0)
       false

       iex> Predicates.is_happy_number?(1)
       true

       iex> Predicates.is_happy_number?(193)
       true
   
       iex> Predicates.is_happy_number?(3323)
       true
   
       iex> Predicates.is_happy_number?(999989)
       true
   
   """
   def is_happy_number?(n) when n >= 0 do
       
       h = Integer.digits(n)
       |> Enum.map(fn d -> d * d end)
       |> Enum.sum()
       
       case h do
          0 -> false
          1 -> true
          4 -> false
          16 -> false
          20 -> false
          37 -> false
          42 -> false
          58 -> false
          89 -> false
          145 -> false
          _ -> is_happy_number?(h)
       end
       
   end
   def is_happy_number?(_), do: false
   
   @doc """
   Check if a number `n` is _highly abundant_.

   A number `n` is _highly abundant_ when the sum of the proper factors of `n` is
   greater than the sum of the proper factors of any number `m` that is in ` 0 < m < n`.

   Alternatively, for all natural numbers, `m < n ; 𝜎(m) < 𝜎(n)`.

   See also:
   
    - `Chunky.Math.sigma/1`
    - `is_abundant?/1`
    - `is_arithmetic_number?/1`
    - `is_deficient?/1`
    - `is_perfect?/1`
   

   ## Examples

       iex> Predicates.is_highly_abundant?(1)
       true
        
       iex> Predicates.is_highly_abundant?(5)
       false

       iex> Predicates.is_highly_abundant?(30)
       true
      
       iex> Predicates.is_highly_abundant?(2099)
       false
      
       iex> Predicates.is_highly_abundant?(2100)
       true
   """
   def is_highly_abundant?(1), do: true
   def is_highly_abundant?(n) when is_integer(n) and n <= 0, do: false

   def is_highly_abundant?(n) when is_integer(n) and n > 1 do
     s_n = sigma(n)

     1..(n - 1)
     |> Enum.filter(fn m -> sigma(m) > s_n end)
     |> length() == 0
   end
   
   @doc """
   Check if a number `n` is a _highly powerful number_.

   Highly powerful numbers are similar in concept to highly _abundant_ numbers. For highly powerful numbers,
   the product of the exponents of prime factors of the number `n` need to be greater than the same property
   for any number `m`, such that `0 < m < n`.

   If you need a _sequence_ of highly powerful numbers, use the `A005934` sequence in `Chunky.Sequence.OEIS.Factors`, which
   uses an max/compare method for building the sequence, which is _vastly_ more efficient than repeated
   calls to `is_highly_powerful_number?/1`.

   OEIS References:
   
    - [A005934 - Highly powerful numbers](https://oeis.org/search?q=A005934&sort=&language=english&go=Search)
   
   See also:
    
    - `is_powerful_number?/1`
    - `Chunky.Math.product_of_prime_factor_exponents/1`


   ## Examples

       iex> Predicates.is_highly_powerful_number?(4)
       true

       iex> Predicates.is_highly_powerful_number?(256)
       false
      
       iex> Predicates.is_highly_powerful_number?(62208)
       true
   """
   def is_highly_powerful_number?(1), do: true
   def is_highly_powerful_number?(n) when is_integer(n) and n <= 0, do: false

   def is_highly_powerful_number?(n) when is_integer(n) and n > 1 do
     # find prod of prim factors exponents for N
     ppfe_n = product_of_prime_factor_exponents(n)

     # check all previous values, and compare
     1..(n - 1)
     |> Enum.filter(fn m -> product_of_prime_factor_exponents(m) >= ppfe_n end)
     |> length() == 0
   end
   
   @doc """
   Is `n` a hoax number? Hoax numbers have a digit sum of `n` equal to the digit 
   sum of the unique prime factors of `n`.
   
   For instance `22` has a digit sum of `4`, and the unique prime factors `2^1 * 11^1`,
   with digit sum of `2 + 1 + 1` or `4`.
   
   OEIS References:
   
    - [A019506 - Hoax Numbers](http://oeis.org/A019506)
   
   See also:
   
    - `is_smith_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_hoax_number?(20)
       false

       iex> Predicates.is_hoax_number?(22)
       true

       iex> Predicates.is_hoax_number?(160)
       true

       iex> Predicates.is_hoax_number?(170)
       false
   
       iex> Predicates.is_hoax_number?(11209)
       true
   
       iex> Predicates.is_hoax_number?(11220)
       false
   
   
   """
   def is_hoax_number?(n) when n > 0 do
       if is_prime?(n) do
           false
       else
           (prime_factors(n) -- [1]
      
           # digit sums of parts
           |> Enum.uniq()
           |> Enum.map(fn d -> digit_sum(d) end)
           |> Enum.sum()) == digit_sum(n)
       end
       
   end
   
   def is_hoax_number?(_), do: false
   
   @doc """
   Is `n` a hypotenuse number? A hypotenuse number is a numer whose square can be written as the sum of two other squares.
   
   A hypotenuse number is fairly literal - it can be the hypotenuse of an integer right triangle, i.e. it fullfils `c` in
   the equation `a^2 + b^c = c^2`.
   
   OEIS References:
   
    - [A009003 - Nonhypotenuse numbers](https://oeis.org/A009003)
   
   See also:
   
    - `is_nonhypotenuse_number?/1`
   
   ## Examples
   
       iex> Predicates.is_hypotenuse_number?(5)
       true

       iex> Predicates.is_hypotenuse_number?(8)
       false

       iex> Predicates.is_hypotenuse_number?(25)
       true

       iex> Predicates.is_hypotenuse_number?(121)
       false

       iex> Predicates.is_hypotenuse_number?(592)
       true
   
   """
   def is_hypotenuse_number?(n) when n > 0 do
       # cannot have any prime factors of the form 4k + 1
       (
           prime_factors(n) -- [1]
           |> Enum.any?(fn f -> rem(f, 4) == 1 end)
       )
   end
   
   def is_hypotenuse_number?(_), do: false
   
   @doc """
   Is `n` an impolite number? Impolite numbers cannot be written as the sum of two consecutive integers.
   
   OEIS References:
   
    - [A000079 - Powers of 2](https://oeis.org/A000079)
   
   See also:
   
    - `is_polite_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_impolite_number?(2)
       true

       iex> Predicates.is_impolite_number?(5)
       false

       iex> Predicates.is_impolite_number?(8)
       true

       iex> Predicates.is_impolite_number?(32)
       true

       iex> Predicates.is_impolite_number?(512)
       true
   
   """
   def is_impolite_number?(n) when n > 0 do
      is_power_of?(n, 2) 
   end
   
   def is_impolite_number?(_), do: false
   
   @doc """
   Is `n` a _left/right_ truncatable prime?

   Truncatable primes are prime number that remain prime when successive digits are removed. For
   a **left/right** truncatable prime, the number will start, and remain, prime as the left and right digits of the
   number are recursively dropped at the same time, until the number is a single or double digit prime. For instance, `99729779`
   is a left/right-truncatable prime, because `99729779`, `972977`, `7297`, and `29` are all prime. For left/right
   truncation the final number can be a one _or_ two digit prime, depending on if the original number nad an odd or even
   number of digits.
    
   See also:
   
    - `is_left_truncatable_prime?/1`
    - `is_right_truncatable_prime?/1`
    - `is_two_sided_prime?/1`
   
   
   ## Examples

       iex> Predicates.is_left_right_truncatable_prime?(433)
       true

       iex> Predicates.is_left_right_truncatable_prime?(1193)
       true

       iex> Predicates.is_left_right_truncatable_prime?(89)
       true

       iex> Predicates.is_left_right_truncatable_prime?(7)
       true

       iex> Predicates.is_left_right_truncatable_prime?(99729779)
       true

   """
   def is_left_right_truncatable_prime?(n) when n <= 0, do: false

   def is_left_right_truncatable_prime?(n) when n > 0 do
     is_prime_with_edit?(n, :both)
   end
   
   @doc """
   Is `n` a _left_ truncatable prime?

   Truncatable primes are prime number that remain prime when successive digits are removed. For
   a left truncatable prime, the number will start, and remain, prime as the left digit of the
   number is recursively dropped, until the number is a single digit prime. For instance, `967`
   is a left-truncatable prime, because `967`, `67`, and `7` are all prime.

   See also:
   
    - `is_left_right_truncatable_prime?/1`
    - `is_right_truncatable_prime?/1`
    - `is_two_sided_prime?/1`


   ## Examples

       iex> Predicates.is_left_truncatable_prime?(967)
       true

       iex> Predicates.is_left_truncatable_prime?(9137)
       true
      
       iex> Predicates.is_left_truncatable_prime?(9656934675)
       false

       iex> Predicates.is_left_truncatable_prime?(396334245663786197)
       true
   """
   def is_left_truncatable_prime?(n) when n <= 0, do: false

   def is_left_truncatable_prime?(n) when n > 0 do
     is_prime_with_edit?(n, :left)
   end
   
   @doc """
   Check if the integer `n` is a Rhonda number to more than one base.
  
   **Generalized function**: `Chunky.Math.get_rhonda_to/2`
   
   See also:
   
    - `Chunky.Math.is_rhonda_to_base?/2`
   

   ## Examples

       iex> Predicates.is_multiple_rhonda?(1000)
       true
      
       iex> Predicates.is_multiple_rhonda?(1230)
       false
   """
   def is_multiple_rhonda?(n) when n < 2, do: false

   def is_multiple_rhonda?(n) when is_integer(n) do
     case get_rhonda_to(n) do
       [] -> false
       [_] -> false
       _ -> true
     end
   end
   
   @doc """
   Determine if a number is a negative integer.

   ## Examples

       iex> Predicates.is_negative?(-34)
       true
      
       iex> Predicates.is_negative?(0)
       false

       iex> Predicates.is_negative?(34)
       false
   """
   def is_negative?(n) when is_integer(n) and n < 0, do: true
   def is_negative?(n) when is_integer(n), do: false
   
   @doc """
   Is `n` a non-hypotenuse number? A non hypotenuse number is a numer whose square cannot be written as the sum of two other squares.
   
   A non-hypotenuse number is fairly literal - it cannot be the hypotenuse of an integer right triangle, i.e. it cannot fullfil `c` in
   the equation `a^2 + b^c = c^2`.
   
   OEIS References:
   
    - [A004144 - Nonhypotenuse numbers](https://oeis.org/A004144)
   
   See also:
   
    - `is_hypotenuse_number?/1`
   
   ## Examples
   
       iex> Predicates.is_nonhypotenuse_number?(1)
       true

       iex> Predicates.is_nonhypotenuse_number?(5)
       false

       iex> Predicates.is_nonhypotenuse_number?(22)
       true

       iex> Predicates.is_nonhypotenuse_number?(25)
       false

       iex> Predicates.is_nonhypotenuse_number?(332)
       true
   
   """
   def is_nonhypotenuse_number?(n) when n > 0 do
       # cannot have any prime factors of the form 4k + 1
       (
           prime_factors(n) -- [1]
           |> Enum.any?(fn f -> rem(f, 4) == 1 end)
       ) == false
   end
   
   def is_nonhypotenuse_number?(_), do: false
   
   @doc """
   Predicate version of `is_odd?/1` Integer guard.

   ## Examples

       iex> Predicates.is_odd?(33)
       true

       iex> Predicates.is_odd?(0)
       false

       iex> Predicates.is_odd?(34)
       false
   """
   def is_odd?(n) when Integer.is_odd(n), do: true
   def is_odd?(n) when is_integer(n), do: false
   
   @doc """
   Odious numbers have an odd number of `1`s in their binary expansion.

   See definition on [MathWorld](http://mathworld.wolfram.com/OdiousNumber.html) or [Wikipedia](https://en.wikipedia.org/wiki/Odious_number).
   
   OEIS References:
   
    - [A000069 - Odious Numbers](http://oeis.org/A000069)
   
   See also:
    
    - `is_evil_number?/1`
   
   
   ## Examples

       iex> Predicates.is_odious_number?(2)
       true

       iex> Predicates.is_odious_number?(37)
       true

       iex> Predicates.is_odious_number?(144)
       false

       iex> Predicates.is_odious_number?(280)
       true

       iex> Predicates.is_odious_number?(19897)
       true

   """
   def is_odious_number?(n) when is_integer(n) do
       digit_count(n, [1], base: 2) |> rem(2) == 1    
   end
   
   @doc """
   Check if `n` is a palindromic number in base 10.

   Palindromic numbers, like palindromic words, are the same value when read forward and reversed.
   
   See also:
   
    - `Chunky.Math.reverse_number/1`
    - `is_palindromic_prime?/1`
    - `is_strictly_non_palindromic?/1`


   ## Examples

       iex> Predicates.is_palindromic?(1234)
       false
      
       iex> Predicates.is_palindromic?(123454321)
       true

       iex> Predicates.is_palindromic?(1004006004001)
       true
   """
   def is_palindromic?(n) when is_integer(n) do
     n == reverse_number(n)
   end
   
   @doc """
   Is `n` a palindromic prime number?

   Palindromic prime numbers are both palindromes (the same digits/number when the digits are reversed) and
   prime numbers. By definition palindromic primes are prime when their digits are reversed.

   See also:
   
    - `is_prime?/1`
    - `is_palindromic?/1`
   
   
   ## Examples

       iex> Predicates.is_palindromic_prime?(373)
       true
        
       iex> Predicates.is_palindromic_prime?(78247074287)
       true

       iex> Predicates.is_palindromic_prime?(55)
       false

   """
   def is_palindromic_prime?(n) when n <= 0, do: false

   def is_palindromic_prime?(n) when n > 0 do
     is_prime?(n) && n == reverse_number(n)
   end
   
   @doc """
   Check if `n` is _pandigital_ in base 10.

   **Generalized function**: `Chunky.Math.is_pandigital_in_base?/2`

   ## Examples

       iex> Predicates.is_pandigital?(123456789)
       false

       iex> Predicates.is_pandigital?(1023456789)
       true
   """
   def is_pandigital?(n), do: is_pandigital_in_base?(n, 10)
   
   @doc """
   Determine if an integer is a _perfect_ number.

   A perfect integer is an `n` where the sum of the proper divisors of `n` is equal to `n`. Alternatively,
   an `n` that satisfies `𝜎(n) == 2n`.

   See also:
   
    - `Chunky.Math.sigma/1`
    - `is_abundant?/1`
    - `is_arithmetic_number?/1`
    - `is_highly_abundant?/1`
    - `is_deficient?/1`
   

   ## Examples

       iex> Predicates.is_perfect?(5)
       false
      
       iex> Predicates.is_perfect?(6)
       true

       iex> Predicates.is_perfect?(20)
       false
      
       iex> Predicates.is_perfect?(33550336)
       true
   """
   def is_perfect?(n) when is_integer(n) and n <= 0, do: false

   def is_perfect?(n) when is_integer(n) and n > 0 do
     sigma(n) == 2 * n
   end
   
   @doc """
   Check if `n` is a perfect cube.

   Perfect cubes are `n` such that there exists an `m` where `m * m * m == n` or `m^3 == n`.
   
   See also:
   
    - `Chunky.Math.factors/1`
    - `Chunky.Math.prime_factors/1`
    - `is_cubefree?/1`
    - `is_perfect_square?/1`
    - `is_squarefree?/1`


   ## Examples

       iex> Predicates.is_perfect_cube?(6)
       false

       iex> Predicates.is_perfect_cube?(8000)
       true

       iex> Predicates.is_perfect_cube?(1879080904)
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

   See also:
   
    - `Chunky.Math.factors/1`
    - `Chunky.Math.is_root_of?/2`
    - `is_prime_power?/1`
   
   
   ## Examples

       iex> Predicates.is_perfect_power?(4)
       true
      
       iex> Predicates.is_perfect_power?(100)
       true
      
       iex> Predicates.is_perfect_power?(226)
       false
   """
   def is_perfect_power?(1), do: true
   def is_perfect_power?(n) when is_integer(n) and n <= 0, do: false

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
   Check if `n` is a perfect square.

   Perfect squares are `n` such that there exists an `m` where `m * m == n`.

   See also:
   
    - `Chunky.Math.factors/1`
    - `Chunky.Math.prime_factors/1`
    - `is_cubefree?/1`
    - `is_perfect_cube?/1`
    - `is_squarefree?/1`
   
   
   ## Examples

       iex> Predicates.is_perfect_square?(0)
       true

       iex> Predicates.is_perfect_square?(1)
       true

       iex> Predicates.is_perfect_square?(3)
       false

       iex> Predicates.is_perfect_square?(25)
       true

       iex> Predicates.is_perfect_square?(123456)
       false
   """
   def is_perfect_square?(0), do: true
   def is_perfect_square?(1), do: true
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
   Check if `n` is a _plaindrome_ in base 10.

   The digits of `n` always stay the same or increase when read left to right.
   
   **Generalized function**: `Chunky.Math.is_plaindrome_in_base?/2`
   
   
   ## Examples

       iex> Predicates.is_plaindrome?(22367)
       true

       iex> Predicates.is_plaindrome?(2048)
       false
   """
   def is_plaindrome?(n), do: is_plaindrome_in_base?(n, 10)

   @doc """
   Is `n` a polite number? Polite numbers can be expressed as the sum of two consecutive digits.
   
   OEIS References:
   
    - [A138591 - Sums of two or more consecutive nonnegative integers](https://oeis.org/A138591)
    - [A057716 - The non-powers of 2](https://oeis.org/A057716)
   
   See also:
   
    - `is_impolite_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_polite_number?(0)
       false

       iex> Predicates.is_polite_number?(3)
       true

       iex> Predicates.is_polite_number?(4)
       false

       iex> Predicates.is_polite_number?(17)
       true

       iex> Predicates.is_polite_number?(333)
       true

       iex> Predicates.is_polite_number?(4098)
       true
   
   """
   def is_polite_number?(n) when n > 0 do
       is_power_of?(n, 2) == false
   end
   
   def is_polite_number?(_), do: false
   
   @doc """
   Determine if a number is a positive integer.

   ## Examples

       iex> Predicates.is_positive?(4)
       true
      
       iex> Predicates.is_positive?(-3)
       false

       iex> Predicates.is_positive?(0)
       false
   """
   def is_positive?(n) when is_integer(n) and n > 0, do: true
   def is_positive?(n) when is_integer(n), do: false

   @doc """
   Is `n` a Poulet number?

   Poulet numbers are Fermat pseudo-primes to base 2.
   
   See also:
    
    - `Chunky.Math.is_pseudo_prime?/2`
    - `is_pseudo_prime?/1`


   ## Examples

       iex> Predicates.is_poulet_number?(107)
       false

       iex> Predicates.is_poulet_number?(271)
       false

       iex> Predicates.is_poulet_number?(341)
       true

       iex> Predicates.is_poulet_number?(1387)
       true

       iex> Predicates.is_poulet_number?(10261)
       true

   """
   def is_poulet_number?(n) when n > 1, do: is_pseudo_prime?(n, 2)
   def is_poulet_number?(_), do: false

   @doc """
   Determine if an integer `n` is a _powerful number_.

   A _powerful number_ is an integer `n` such that for all _prime factors_ `m` of `n`,
   `m^2` also evenly divides `n`. Alternatively, a _powerful number_ `n` can be written
   as `n = a^2 * b^3` for positive integers `a` and `b`; `n` is the product of a square
   and a cube.

   See also:
   
    - `Chunky.Math.prime_factors/1`
    - `is_achilles_number?/1`
    - `is_highly_powerful_number?/1`
   
   
   ## Examples

       iex> Predicates.is_powerful_number?(8)
       true

       iex> Predicates.is_powerful_number?(10)
       false

       iex> Predicates.is_powerful_number?(800)
       true

       iex> Predicates.is_powerful_number?(970)
       false
   """
   def is_powerful_number?(n) when is_integer(n) and n <= 0, do: false

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
   Is `n` a practical number? A practical number is a positive integer `n` where all positive 
   integers less than `n` can be written as a sum of the distinct divisors of `n`.
   
   For instance, `8` is a practical number. Given the divisors `1, 2, 4`, the non-divisors
   smaller than `8` can be writen as `3 = 1 + 2, 5 = 2 + 3, 6 = 3 + 2 + 1, 7 = 4 + 2 + 1`.
   
   Also called the _panarithmic_ numbers.
   
   OEIS References:
   
    - [A005153 - Practical numbers](https://oeis.org/A005153)
   
   ## Examples
   
       iex> Predicates.is_practical_number?(1)
       true

       iex> Predicates.is_practical_number?(11)
       false

       iex> Predicates.is_practical_number?(120)
       true

       iex> Predicates.is_practical_number?(124)
       false
   
       iex> Predicates.is_practical_number?(5152)
       true
   

   """
   def is_practical_number?(n) when n > 0 do
      
      [{pf_a, _} | _] = rpfs = reduced_prime_factors(n) 
      
      # first factor must be 2
      case {pf_a, length(rpfs)} do
          
          # one is, by definition, a practical number
          {1, _} -> true
          
          # it's a power of 2
          {2, 1} -> true
          
          # otherwise 2 must be the first factor of a longer factorization
          {2, _} -> 
              
              # drop our first factor, and test each remaining factor in our
              # inequality of factor_i <= sigma(factor_1^pow_1 * ... factor_(i - 1)^pow_(i - 1)) + 1
          
              # build up the sets we need to compare
              0..length(rpfs) - 2
              |> Enum.map(
                  fn idx -> 
                  
                      # what's our factor
                      {f, _} = Enum.at(rpfs, idx + 1)
                  
                      # whats our inner sigma value
                      ins = rpfs
                      |> Enum.take(idx + 1)
                      |> Enum.map(fn {base, power} -> Math.pow(base, power) end)
                      |> Enum.reduce(1, fn x, acc -> x * acc end)
                  
                      {f, ins}
                  end
              )
              |> Enum.all?(fn {fac, prod} -> fac <= (sigma(prod) + 1) end)

          
          # any other first factor, and the number is not practical
          _ -> false
      end
   end
   def is_practical_number?(_), do: false
   
   @doc """
   Is `n` a primary pseudoperfect number? A number is primary pseudoperfect if the sum of 1 over `n` and 1 over the
   prime factors of `n` equals `1`.
   
   This summation over reciprocals of prime factors is also called the Egyptian fraction:
   
    ![Egyptian fraction](https://wikimedia.org/api/rest_v1/media/math/render/svg/5771d36b75526fc2b111629deba3776de7913b8a)
   
   This function uses the alternate fractional summation of:
   
    ![Pseudoperfect Summation](https://wikimedia.org/api/rest_v1/media/math/render/svg/fd4e0622e97b7cfca74c6d1186848be5b04c86d4)
   
   OEIS References:
   
    - [A054377 - Primary pseudoperfect numbers](https://oeis.org/A054377)
   
   See also:
   
    - `is_erdos_nicolas_number?/1`
    - `is_pseudoperfect_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_primary_pseudoperfect_number?(2)
       true

       iex> Predicates.is_primary_pseudoperfect_number?(4)
       false

       iex> Predicates.is_primary_pseudoperfect_number?(6)
       true

       iex> Predicates.is_primary_pseudoperfect_number?(210)
       false

       iex> Predicates.is_primary_pseudoperfect_number?(1806)
       true
   
   """
   def is_primary_pseudoperfect_number?(n) when n > 1 do
   
       ef = (summation p, prime_factors(n) -- [1] do
           Fraction.new(n, p)
       end)
       |> Fraction.add(1)
       
       Fraction.is_whole?(ef) && (Fraction.get_whole(ef) == n)
          
   end
   
   def is_primary_pseudoperfect_number?(_), do: false
   
   @doc """
   Determine if a positive integer is prime.

   This function uses a [Miller-Rabin](https://en.wikipedia.org/wiki/Miller–Rabin_primality_test) primality 
   test, with 40 iterations.

   See also:
   
    - `is_prime_fast?/1`
   
   
   ## Examples

       iex> Predicates.is_prime?(13)
       true
      
       iex> Predicates.is_prime?(233*444*727*456)
       false

       iex> Predicates.is_prime?(30762542250301270692051460539586166927291732754961)
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

   See also:
   
    - `is_prime?/1`
   
   
   ## Examples

       iex> 1299601 |> Predicates.is_prime_fast?()
       true

       iex> 1237940039285380274899124225 |> Predicates.is_prime_fast?()
       false
   """
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
   
   @doc """
   Check if `n` is a power `m` of a prime, where `m` >= 1.

   This is functionally a combination of `is_perfect_power?/1` and `is_prime?/1`, but
   interleaves the factorization, leading to a speed up over using the two functions
   independently.
    
   See also:
   
    - `Chunky.Math.prime_factors/1`
    - `Chunky.Math.is_root_of?/2`
    - `is_perfect_power?/1`
   
   
   ## Examples

       iex> Predicates.is_prime_power?(2)
       true

       iex> Predicates.is_prime_power?(9)
       true
      
       iex> Predicates.is_prime_power?(10)
       false

       iex> Predicates.is_prime_power?(144)
       false

   """
   def is_prime_power?(1), do: true
   def is_prime_power?(n) when is_integer(n) and n <= 0, do: false

   def is_prime_power?(n) when is_integer(n) and n > 0 do
     # find all factors
     case prime_factors(n) do
       # is this a prime itself?
       [1, ^n] ->
         true

       # see if these are prime perfect powers
       p_fs ->
         # drop 1 and N
         (p_fs -- [1, n])

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
   end
   
   @doc """
   Check if `n` is a _prime vampire number_.

   A _prime_ vampire number needs to mee the same criteria as a standard _vampire number_ (see `is_vampire_number?/1`),
   with the additional criteria of:

    1. Both of the factors of `n`, `a` and `b`, must be prime

   See also:
   
    - `is_double_vampire_number?/1`
    - `is_pseudo_vampire_number?/1`
    - `is_vampire_number?/1`


   ## Examples

       iex> Predicates.is_prime_vampire_number?(6881)
       false
      
       iex> Predicates.is_prime_vampire_number?(117067)
       true

   """
   def is_prime_vampire_number?(n) when n <= 0, do: false

   def is_prime_vampire_number?(n) when is_integer(n) and n > 0 do
     # even number of digits?
     if length_in_base(n, 10) |> rem(2) == 1 do
       false
     else
       # find our sorted digits of N for later
       n_digits = Integer.digits(n) |> Enum.sort()

       # find factors
       factor_pairs(n)

       # filter factors

       # same length
       |> Enum.filter(fn {a, b} -> length_in_base(a, 10) == length_in_base(b, 10) end)

       # can't both end in zero
       |> Enum.filter(fn {a, b} ->
         a_z = Integer.digits(a) |> List.last()
         b_z = Integer.digits(b) |> List.last()

         !(a_z == 0 && b_z == 0)
       end)

       # both factors prime?
       |> Enum.filter(fn {a, b} -> is_prime?(a) && is_prime?(b) end)

       # do we have all of our digits?
       |> Enum.filter(fn {a, b} ->
         (Integer.digits(a) ++ Integer.digits(b)) |> Enum.sort() == n_digits
       end)

       # if we have anything left over, it's a vampire
       |> length() > 0
     end
   end
   
   @doc """
   Can `n` be written as a sum of some or all of its divisors?
   
   The pseudoperfect numbers are a super-set of the perfect numbers (where the sum of factors is equal to `n`), such
   that the sum of any combination of the factors of `n` equal `n`. Finding pseudoperfect numbers
   is equivalent to solving the Subset Sum, an NP-Complete problem. For numbers with a lot of factors, this
   algorithm will run in the worst case of exponential time.
   
   OEIS References:
   
    - [A005835 - Pseudoperfect](https://oeis.org/A005835)
   
   See also:
   
    - `is_erdos_nicolas_number?/1`
    - `is_primary_pseudoperfect_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_pseudoperfect_number?(4)
       false

       iex> Predicates.is_pseudoperfect_number?(6)
       true

       iex> Predicates.is_pseudoperfect_number?(12)
       true

       iex> Predicates.is_pseudoperfect_number?(150)
       true

       iex> Predicates.is_pseudoperfect_number?(1944)
       true
   
   """
   def is_pseudoperfect_number?(n) when n > 0 do
       factors(n) -- [n]
       |> has_subset_sum?(n)
   end
   def is_pseudoperfect_number?(_), do: false
   
   @doc """
   Determine if `n` is pseudo-prime to base 10.

   **Generalized function**: `Chunky.Math.is_pseudo_prime?/2`

   See also:
   
    - `is_poulet_number?/1`
    - `is_carmichael_number?/1`
   
   
   ## Examples

       iex> Predicates.is_pseudo_prime?(9)
       true

       iex> Predicates.is_pseudo_prime?(33)
       true

       iex> Predicates.is_pseudo_prime?(47)
       false

       iex> Predicates.is_pseudo_prime?(481)
       true

       iex> Predicates.is_pseudo_prime?(559)
       false

       iex> Predicates.is_pseudo_prime?(8401)
       true

   """
   def is_pseudo_prime?(n) when n > 1, do: is_pseudo_prime?(n, 10)
   def is_pseudo_prime?(_), do: false
   
   @doc """
   Check if `n` is a _pseudo_ vampire number.

   The pseudo-vampire numbers have more relaxed criteria than the standard
   vampire numbers (see `is_vampire_number?/1`). Pseudo-vampires change the restrictions on the number of
   digits in `n` and the factors `a` and `b`, such that:

    1. `n` can have an even _or odd_ number of digits
    2. The factors `a` and `b` can be of any length, not strictly of half the length of `n`

   See also:
   
    - `is_double_vampire_number?/1`
    - `is_prime_vampire_number?/1`
    - `is_vampire_number?/1`


   ## Examples

       iex> Predicates.is_pseudo_vampire_number?(126)
       true

       iex> Predicates.is_pseudo_vampire_number?(128)
       false

       iex> Predicates.is_pseudo_vampire_number?(19026)
       true

       iex> Predicates.is_pseudo_vampire_number?(1025779)
       true
   """
   def is_pseudo_vampire_number?(n) when n <= 0, do: false

   def is_pseudo_vampire_number?(n) do
     # find our sorted digits of N for later
     n_digits = Integer.digits(n) |> Enum.sort()

     # find factors
     factor_pairs(n)

     # filter factors

     # can't both end in zero
     |> Enum.filter(fn {a, b} ->
       a_z = Integer.digits(a) |> List.last()
       b_z = Integer.digits(b) |> List.last()

       !(a_z == 0 && b_z == 0)
     end)

     # do we have all of our digits?
     |> Enum.filter(fn {a, b} ->
       (Integer.digits(a) ++ Integer.digits(b)) |> Enum.sort() == n_digits
     end)

     # if we have anything left over, it's a vampire
     |> length() > 0
   end
   
   @doc """
   Check if `n` is a Repdigit number.

   Repdigits numbers are a generalization of a Repunit - a number consisting of a single repeating
   digit. Repdigit numbers can occur in any numeric base > 1. When evaluating numbers in bases
   greater than base 10, lists of digits should be used (see `to_base/2`).

   ## Examples

       iex> Predicates.is_repdigit?(123)
       false
      
       iex> Predicates.is_repdigit?(22222)
       true

       iex> Predicates.is_repdigit?(88888888888)
       true

       iex> Math.to_base(9884745, 60) |> Predicates.is_repdigit?()
       true
      
       iex> Math.to_base(9884745, 60)
       [45, 45, 45, 45]

   """
   def is_repdigit?(n) when is_integer(n) do
     n
     |> Integer.digits()
     |> Enum.uniq()
     |> length() == 1
   end

   def is_repdigit?(n) when is_list(n) do
     n
     |> Enum.uniq()
     |> length() == 1
   end
   
   @doc """
   Check if `n` is a Repunit.

   Repunits are numbers consisting of all `1`s in base 10. Hence, **R1** == `1`, **R2** == `11`, etc.

   ## Examples

       iex> Predicates.is_repunit?(0)
       false

       iex> Predicates.is_repunit?(11)
       true

       iex> Predicates.is_repunit?(11011)
       false

       iex> Predicates.is_repunit?(1111111)
       true

       iex> Predicates.is_repunit?(2071723 * 5363222357)
       true

   """
   def is_repunit?(n) when n <= 1, do: false

   def is_repunit?(n) when n > 0 do
     digs =
       n
       |> Integer.digits()
       |> Enum.uniq()

     digs == [1]
   end 
   
   @doc """
   Determine if `n` is a Rhonda number to base 4.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_4?(94185)
       true

       iex> Predicates.is_rhonda_to_base_4?(327)
       false

   """
   def is_rhonda_to_base_4?(n), do: is_rhonda_to_base?(n, 4)

   @doc """
   Determine if `n` is a Rhonda number to base 6.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_6?(15104)
       true

       iex> Predicates.is_rhonda_to_base_4?(327)
       false

   """
   def is_rhonda_to_base_6?(n), do: is_rhonda_to_base?(n, 6)

   @doc """
   Determine if `n` is a Rhonda number to base 8.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_8?(56420)
       true

       iex> Predicates.is_rhonda_to_base_8?(327)
       false

   """
   def is_rhonda_to_base_8?(n), do: is_rhonda_to_base?(n, 8)

   @doc """
   Determine if `n` is a Rhonda number to base 9.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_9?(47652)
       true

       iex> Predicates.is_rhonda_to_base_9?(327)
       false

   """
   def is_rhonda_to_base_9?(n), do: is_rhonda_to_base?(n, 9)

   @doc """
   Determine if `n` is a Rhonda number to base 10.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_10?(35581)
       true

       iex> Predicates.is_rhonda_to_base_10?(327)
       false

   """
   def is_rhonda_to_base_10?(n), do: is_rhonda_to_base?(n, 10)

   @doc """
   Determine if `n` is a Rhonda number to base 12.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_12?(32742)
       true

       iex> Predicates.is_rhonda_to_base_12?(327)
       false

   """
   def is_rhonda_to_base_12?(n), do: is_rhonda_to_base?(n, 12)

   @doc """
   Determine if `n` is a Rhonda number to base 14.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_14?(135196)
       true

       iex> Predicates.is_rhonda_to_base_14?(327)
       false

   """
   def is_rhonda_to_base_14?(n), do: is_rhonda_to_base?(n, 14)

   @doc """
   Determine if `n` is a Rhonda number to base 15.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_15?(15873)
       true

       iex> Predicates.is_rhonda_to_base_15?(327)
       false

   """
   def is_rhonda_to_base_15?(n), do: is_rhonda_to_base?(n, 15)

   @doc """
   Determine if `n` is a Rhonda number to base 16.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_16?(50055)
       true

       iex> Predicates.is_rhonda_to_base_16?(327)
       false

   """
   def is_rhonda_to_base_16?(n), do: is_rhonda_to_base?(n, 16)

   @doc """
   Determine if `n` is a Rhonda number to base 20.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_20?(86591)
       true

       iex> Predicates.is_rhonda_to_base_20?(327)
       false

   """
   def is_rhonda_to_base_20?(n), do: is_rhonda_to_base?(n, 20)

   @doc """
   Determine if `n` is a Rhonda number to base 30.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_30?(22784)
       true

       iex> Predicates.is_rhonda_to_base_30?(327)
       false

   """
   def is_rhonda_to_base_30?(n), do: is_rhonda_to_base?(n, 30)

   @doc """
   Determine if `n` is a Rhonda number to base 60.

   **Generalized function**: `Chunky.Math.is_rhonda_to_base?/2`
   
   See also:
   
    - `is_multiple_rhonda?/1`
   

   ## Examples

       iex> Predicates.is_rhonda_to_base_60?(91224)
       true

       iex> Predicates.is_rhonda_to_base_60?(327)
       false

   """
   def is_rhonda_to_base_60?(n), do: is_rhonda_to_base?(n, 60)
   
   @doc """
   Is `n` a _right_ truncatable prime?

   Truncatable primes are prime number that remain prime when successive digits are removed. For
   a right truncatable prime, the number will start, and remain, prime as the right digit of the
   number is recursively dropped, until the number is a single digit prime. For instance, `23399`
   is a right-truncatable prime, because `23399`, `2339`, `233`, `23`, and `2` are all prime.

   See also:
   
    - `is_left_truncatable_prime?/1`
    - `is_left_right_truncatable_prime?/1`
    - `is_two_sided_prime?/1`

   ## Examples

       iex> Predicates.is_right_truncatable_prime?(23399)
       true

       iex> Predicates.is_right_truncatable_prime?(37)
       true

       iex> Predicates.is_right_truncatable_prime?(59393)
       true

       iex> Predicates.is_right_truncatable_prime?(59397)
       false
   """
   def is_right_truncatable_prime?(n) when n <= 0, do: false

   def is_right_truncatable_prime?(n) when n > 0 do
     is_prime_with_edit?(n, :right)
   end
   
   @doc """
   Is `n` a divisible by 2, but not by 4?
   
   Singly divisible numbers are of the form `4*n + 2`.
  
   OEIS References:
   
    - [A016825 - Positive integers congruent to 2 mod 4](http://oeis.org/A016825)
   
   
   See also:
   
    - `is_even?/1`
   
   
   ## Examples
   
       iex> Predicates.is_singly_even_number?(2)
       true

       iex> Predicates.is_singly_even_number?(8)
       false
    
       iex> Predicates.is_singly_even_number?(1930)
       true

       iex> Predicates.is_singly_even_number?(79874)
       true
   
   """
   def is_singly_even_number?(n) when Integer.is_odd(n), do: false
   def is_singly_even_number?(n) when Integer.is_even(n) do
       rem(n, 2) == 0 && rem(n, 4) != 0
   end
   
   @doc """
   Is `n` a Smith Number? Smith numbers have equal digit sums in `n` and the summed factors of `n`.
  
   The canonical example of a Smith number is `4937775`. The digits sum is `42` (`4 + 9 + 3 + 7 + 7 + 7 + 5`),
   as is the sum of the prime factorization `3^1 + 5^2 + 65837^1` (`3 + (5 * 2) + (6 + 5 + 8 + 3 + 7)`).
  
   OEIS References:
  
    - [A006753 - Smith (or joke) numbers](https://oeis.org/A006753)
  
   See also:
   
    - `is_hoax_number?/1`
   
   
   ## Examples
  
       iex> Predicates.is_smith_number?(4)
       true
   
       iex> Predicates.is_smith_number?(5)
       false

       iex> Predicates.is_smith_number?(8)
       false

       iex> Predicates.is_smith_number?(382)
       true

       iex> Predicates.is_smith_number?(436)
       false

       iex> Predicates.is_smith_number?(8545)
       true

       iex> Predicates.is_smith_number?(13444)
       false

       iex> Predicates.is_smith_number?(4937775)
       true
  
   """
   def is_smith_number?(n) when n > 0 do
      
       if is_prime?(n) do
           false
       else
           (prime_factors(n) -- [1]
      
           # digit sums of parts
           |> Enum.map(fn d -> digit_sum(d) end)
           |> Enum.sum()) == digit_sum(n)
       end
   end
   def is_smith_number?(_), do: false
   
   @doc """
   Check if `n` is a _sphenic number_, the product of three distinct primes.
   
   See also:
   
    - `Chunky.Math.prime_factors/1`
    - `is_prime_power?/1`
    - `is_prime_vampire_number?/1`
   
   
   ## Example

       iex> Predicates.is_sphenic_number?(4)
       false

       iex> Predicates.is_sphenic_number?(66)
       true

       iex> Predicates.is_sphenic_number?(51339)
       true
   """
   def is_sphenic_number?(n) when is_integer(n) and n <= 0, do: false

   def is_sphenic_number?(n) when is_integer(n) and n > 0 do
     facs = prime_factors(n) -- [1]
     length(facs) == 3 && length(Enum.uniq(facs)) == 3
   end
   
   @doc """
   Check if `n` is _strictly_ non-palindromic.

   These numbers are non-palindromic in any numeric base from 2 to `n - 2`. For larger
   numbers this can be a very expensive check.
   
   See also:
   
    - `Chunky.Math.is_palindromic_in_base?/2`
    - `is_palindromic?/1`
   

   ## Examples

       iex> Predicates.is_strictly_non_palindromic?(6)
       true

       iex> Predicates.is_strictly_non_palindromic?(19)
       true

       iex> Predicates.is_strictly_non_palindromic?(80)
       false

       iex> Predicates.is_strictly_non_palindromic?(317)
       true

   """
   def is_strictly_non_palindromic?(n) when n < 4 and n > -4, do: false

   def is_strictly_non_palindromic?(n) when is_integer(n) and (n >= 4 or n <= -4) do
     2..(abs(n) - 2)
     |> Enum.any?(fn base -> is_palindromic_in_base?(abs(n), base) end) == false
   end
   
   @doc """
   Check if an integer `n` has no factors greater than `1` that are perfect squares.

   See also:
   
    - `Chunky.Math.factors/1`
    - `Chunky.Math.prime_factors/1`
    - `is_cubefree?/1`
    - `is_perfect_cube?/1`
    - `is_perfect_square?/1`
   

   ## Examples

       iex> Predicates.is_squarefree?(3)
       true
      
       iex> Predicates.is_squarefree?(8)
       false

       iex> Predicates.is_squarefree?(99935)
       true

   """
   def is_squarefree?(1), do: true
   def is_squarefree?(n) when is_integer(n) and n <= 0, do: false

   def is_squarefree?(n) when is_integer(n) and n > 0 do
     (factors(n) -- prime_factors(n))
     |> Enum.uniq()
     |> Enum.filter(fn c_f -> is_perfect_square?(c_f) end)
     |> length() == 0
   end
   
   @doc """
   Is `n` a _two sided_ prime, a number that is both a left and right trucatable prime.

   Truncatable primes are prime number that remain prime when successive digits are removed. For
   a two sided prime, the number will start, and remain, prime under both left and right truncation. 
   For instance, `3137` is a two-sided prime, because:

    - `3137` is prime
    - `313`, `31`, and `3` are prime (right truncation)
    - `137`, `37`, and `7` are prime (left truncation)

   See also:
   
    - `is_left_truncatable_prime?/1`
    - `is_left_right_truncatable_prime?/1`
    - `is_right_truncatable_prime?/1`

   ## Examples

       iex> Predicates.is_two_sided_prime?(7)
       true

       iex> Predicates.is_two_sided_prime?(313)
       true

       iex> Predicates.is_two_sided_prime?(3137)
       true

       iex> Predicates.is_two_sided_prime?(739397)
       true

   """
   def is_two_sided_prime?(n) when n <= 0, do: false

   def is_two_sided_prime?(n) when n > 0 do
     is_prime_with_edit?(n, :left) && is_prime_with_edit?(n, :right)
   end
   
   @doc """
   Does the repeated sum of squares of the digits of `n` converge to a value other than `1`?
   
   By repeatedly taking the digits of a number, squaring them, and summing the result, all
   numbers will eventually converge to one of the numbers `0, 1, 4, 16, 20, 37, 42, 58, 89, or 145`. Unhappy
   numbers coverge to a value other than `1`.
   
   OEIS References:
   
    - [A031177 - Unappy numbers](http://oeis.org/A031177)
   
   See also:
   
    - `is_happy_number?/1`
   
   
   ## Examples
   
       iex> Predicates.is_unhappy_number?(2)
       true

       iex> Predicates.is_unhappy_number?(25)
       true

       iex> Predicates.is_unhappy_number?(475)
       true
   
       iex> Predicates.is_unhappy_number?(953)
       true
   
       iex> Predicates.is_unhappy_number?(11728)
       true
   
   """
   def is_unhappy_number?(n) when n > 1 do
       is_happy_number?(n) == false
   end
   def is_unhappy_number?(_), do: false
   
   
   @doc """
   Check if `n` is a _true vampire number_.

   A vampire number is a number `n` that fullfils the following criteria:

    1. `n` has an even number of digits
    2. `n` can be factored into two digits `a` and `b`
    3. Both `a` and `b` half exactly half as many digits as `n`
    4. One or the other of `a` or `b` can have trailing zeros, but not both
    5. `a` and `b` contain all of the original digits of `n`, in any order, _including_ duplicated digits in `n`

   See also:
   
    - `is_double_vampire_number?/1`
    - `is_prime_vampire_number?/1`
    - `is_pseudo_vampire_number?/1`


   ## Examples

       iex> Predicates.is_vampire_number?(1260)
       true
      
       iex> Predicates.is_vampire_number?(6000)
       false

       iex> Predicates.is_vampire_number?(6880)
       true
      
       iex> Predicates.is_vampire_number?(125500)
       true
   """
   def is_vampire_number?(n) when n <= 0, do: false

   def is_vampire_number?(n) when is_integer(n) and n > 0 do
     # even number of digits?
     if length_in_base(n, 10) |> rem(2) == 1 do
       false
     else
       # find our sorted digits of N for later
       n_digits = Integer.digits(n) |> Enum.sort()

       # find factors
       factor_pairs(n)

       # filter factors

       # same length
       |> Enum.filter(fn {a, b} -> length_in_base(a, 10) == length_in_base(b, 10) end)

       # can't both end in zero
       |> Enum.filter(fn {a, b} ->
         a_z = Integer.digits(a) |> List.last()
         b_z = Integer.digits(b) |> List.last()

         !(a_z == 0 && b_z == 0)
       end)

       # do we have all of our digits?
       |> Enum.filter(fn {a, b} ->
         (Integer.digits(a) ++ Integer.digits(b)) |> Enum.sort() == n_digits
       end)

       # if we have anything left over, it's a vampire
       |> length() > 0
     end
   end
   
   @doc """
   Does the prime factorization of `n` have mored digits (counting primes and powers) than `n`?
   
   The wasteful numbers are sometimes called the _extravagant_ numbers. When counting digits of
   the prime factorization the prime and it's exponent are combined together, so `4` is an extravagant
   number, because its prime factorization is `2^2` or `22` written out.
   
   OEIS References:
   
    - [A046760 - Wasteful numbers](http://oeis.org/A046760)
   
   See also:
   
    - `is_economical_number?/1`
    - `is_equidigital_number?/1`
   
   ## Examples
   
       iex> Predicates.is_wasteful_number?(4)
       true

       iex> Predicates.is_wasteful_number?(24)
       true

       iex> Predicates.is_wasteful_number?(110)
       true

       iex> Predicates.is_wasteful_number?(14330)
       true
   
   """
   def is_wasteful_number?(n) when n > 3 do
       (reduced_prime_factors(n)
       |> Enum.map(
           fn {base, power} -> 
               case power do
                   1 -> Integer.digits(base)
                   _ -> Integer.digits(base) ++ Integer.digits(power) 
               end
           end
       )
       |> List.flatten()
       |> length()) > length_in_base(n, 10)
   end
   def is_wasteful_number?(_), do: false
      
   @doc """
   Is `n` a _weakly_ prime number?

   A prime number `n` is called weakly prime if it becomes not prime when any one of its digits 
   is changed to every single other digit. Testing the number `347` would involve testing all
   of the numbers `147`, `247`, `447`, `547`, ..., `348`, and `349` to see if they were prime. The
   number `347` is _not_ weakly prime because `947` _is_ prime.

   See also:
   
    - `is_prime?/1`


   ## Examples

       iex> Predicates.is_weakly_prime?(294001)
       true

       iex> Predicates.is_weakly_prime?(294007)
       false
        
       iex> Predicates.is_weakly_prime?(3085553)
       true

   """
   def is_weakly_prime?(n) when n <= 0, do: false

   def is_weakly_prime?(n) when n > 0 do
     if is_prime?(n) do
       n_digs = Integer.digits(n)

       # generate the permutations of n
       0..(length_in_base(n, 10) - 1)

       # loop over the places in the number
       |> Enum.map(fn idx ->
         # loop over the digits
         # remove our original number
         (0..9
          |> Enum.map(fn sub_digit ->
            # generate a new number
            List.update_at(n_digs, idx, fn _ -> sub_digit end)
            |> Integer.undigits()
          end)) --
           [n]
       end)
       |> List.flatten()
       |> Enum.all?(fn v -> is_prime?(v) == false end)
     else
       false
     end
   end
   
   @doc """
   Predicate for testing for `0`

   ## Examples

       iex> Predicates.is_zero?(0)
       true
      
       iex> Predicates.is_zero?(34)
       false

       iex> Predicates.is_zero?(-34)
       false
   """
   def is_zero?(0), do: true
   def is_zero?(n) when is_integer(n), do: false
   
   ####
   ## Private functions
   ####
   
   # used by
   #    - is_prime_fast?/1
   defp is_factored_by_first_primes?([], _i), do: false

   defp is_factored_by_first_primes?([h | rest], i) do
     if rem(i, h) == 0 do
       true
     else
       is_factored_by_first_primes?(rest, i)
     end
   end
   
   # used by
   #    - is_left_truncatable_prime?/1
   #    - is_right_truncatable_prime?/1
   #    - is_left_right_truncatable_prime?/1
   #    - is_two_sided_prime?/1
   defp is_prime_with_edit?(p, mode) do
     if (mode == :both && length_in_base(p, 10) == 2 && is_prime?(p)) ||
          (length_in_base(p, 10) == 1 and is_prime?(p)) do
       true
     else
       if is_prime?(p) do
         case mode do
           :left -> p |> Integer.digits() |> Enum.drop(1) |> Integer.undigits()
           :right -> p |> Integer.digits() |> Enum.slice(0..-2) |> Integer.undigits()
           :both -> p |> Integer.digits() |> Enum.slice(1..-2) |> Integer.undigits()
         end
         |> is_prime_with_edit?(mode)
       else
         false
       end
     end
   end
   
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

     if x != 1 do
       if x != n - 1 do
         miller_rabin(n, x, r - 1)
       else
         true
       end
     else
       false
     end
   end
   
end