
# Chunky.Sets

 - add N permute R
 - is <pattern> a permutation of Chunky.permutations([....])?
 - is <pattern> a combination of chunky.combinations([...], k)?
 - move permute/combine et al to Chunky.Sets or Chunky.Combinitorics
 - move enumeration ops to Chunky.Enums
 - move grids ops to Chunky.Grid
 - more enumerations from https://en.wikipedia.org/wiki/Combinatorics (approaches and subfields)
 - more alternations from https://en.wikipedia.org/wiki/Twelvefold_way (see Formulas) (see the twentyfold way)
 
# New functions
  
 - Chunky.take_sequences/1 or Chunky.chunk_runs/1 (day04.ex)
  - `Chunky.chunk_runs/1` - Chunk an enumerable by runs of duplicate values
 - TODO: nPr
  
## Generator for new Sequences  

```elixir
"A000688" |> OEIS.Util.generate_sequence_stub(sequence_for_function: true, in_module: Chunky.Sequence.OEIS.Core)
"A000688" |> OEIS.Util.generate_sequence_stub(sequence_for_list: true, in_module: Chunky.Sequence.OEIS.Core)
```  

## Finding Sequences to work on

```elixir
OEIS.missing_sequences(OEIS, :keyword_core_easy) |> Enum.sort()
```

## Timing things

```elixir
alias Chunky.Math
st = Time.utc_now()
Math.digits_of_pi(5000)
ed = Time.utc_now()
Time.diff(ed, st, :millisecond)

```


## Crawling Search

```
OEIS.Util.crawl_keywords(["core", "hard"])
```

```
OEIS.Util.crawl_keywords(["core", "eigen"]) |> Enum.map(fn %{seq_id: seq_id} -> "#{seq_id |> String.downcase()}" |> String.to_atom() end) |> Enum.sort() |> IO.inspect(limit: :infinity)
```

## Templates

 - TODOs for functions
  - TOF
  - test
  - inline
  - CHANGELOG

 - module refactoring TODOs
  - create module
  - create test file
  - move funcs
  - move tests
  - TOF doc in new module
  - intro in new module
  - link from Math
  - link from library.md
 
 - TODO for new predicate
  - predicate function
  - predicate TOF
  - predicate doc (inline, OEIS ref, see also, examples)
  - OEIS sequence
  - sequence test
  - CHANGELOG (sequence and func)
 
## TODO
 
   
### release 0.13.* - documentation and refactoring, triangles



### release 0.13.n + 1 - recreationals

 - Math
  - josephus numbers
  - leyland numbers
  - hilbert numbers


### release 0.13. n + 2 - summations of sequences
 
 - Extended Summation (when: of:) (see notes from MCO to BWI flight)
 
 - sequence genserver/client
 
 - Summation with sequences
 
 - document next steps for Geometry.Triangle

 
### Articles

 - Project Euler Template
  - static site generator
   - jekyll
  - asciidoc
  - chunky version
  - OEIS refs
  - chunky refs
  - notes/callouts
  
 - numberphile triangles 
   - triangles from latest Numberphile
    - use stills
    - build up triangle analysis
   - write up on building/testing/finding numberphile triangles

 - Project Euler 001
 
 - Project Euler 002
 
 - Project Euler 003
 
 - Project Euler 004
 
 - Project Euler 005
 
 - Project Euler 006
 
 - Project Euler 007
 
 - Project Euler 008
 
 - Project Euler 009
 
 - Project Euler 010
   
   
### Future   

 - triangles
  - [ ] all angluar functions need to either annotate params ({:radians, 1.5}, {:degree, 90}) or offer an option for selecting mode
   - or we work purely in degrees or radians and offer methods for conversion
  - [ ] get_heronian_multiple/1 - derive the multiple for `b-heronian` (this is a complement of is_multiple_heronian?/2)
  - [ ] !! scalene_base/1 needs to account for multiple integer heights
  - [ ] rad to deg
  - [ ] deg to rad
  - we could have a rad type that maintains a x * 180/pi relationship
 
 - sequence modules documentation
   - [ ] factors
    - [ ] OEIS backref to Math module functions
   - [ ] multiples
    - [ ] OEIS backref to Math module functions
   - [ ] repr
    - [ ] OEIS backref to Math module functions
   
  
  - belphegor numbers - http://mathworld.wolfram.com/BelphegorNumber.html
  - belphegor primes - http://mathworld.wolfram.com/BelphegorPrime.html

 Future
  - monica set - http://mathworld.wolfram.com/MonicaSet.html
  - suzanne set - http://mathworld.wolfram.com/SuzanneSet.html
  - check Classes of Natural Numbers
  - check Divisibility-based sets of integers (ref section of https://en.wikipedia.org/wiki/Practical_number)
  - congruences (https://en.wikipedia.org/wiki/Table_of_congruences)
  - [-] giuga numbers
  - [-] ulam numbers (s-additive sets, series calculation)
  - [-] wolstenholme (congruences)

 - update summation and product to be `summation k, 1..100 over: ... end` or `of:`
     
 - functions    
  - egyptian fraction
  - generalized harmonic number
  - dirichlet functions
  - limits?
 
 - how would we do a decimal type?
 - how would we do a complex number type?
 
 - better docs for sequence libraries
  - group by commonality, link to just internal ref

 
 - check all the added OEIS sequences, and add refs to any discrete functions they use
  - add refs to sequence library instead of OEIS
  - how do we shorten or change those links?
 
 - @doc nil all the sequence functions
 
 - document all math triangle functions with a grid so we can tell which ones use zero indexing on row/column, or are grid shifted, etc
  - chebyshev (A049310)
  - stirling numbers (A008277)
  - pascals triangle (A007318)
  - ?
 
### release 0.*.*
 
 - do we rename? 
 - sequence generators as processes with macro for send/receive
 - multi-sequence zip
 - writeups of doing... Project Euler problems with Chunky? Project Rosalind? Advent of Code?
 - draw triangles
 - draw graphs
 - splines/beziers/lines/curves as sequences
 
 
 - move util scripts that use JASON and HTTPoison into a scripts directory as .exs files
 - move jason and HTTPoison to dev only
 - benchee setup for prime factors and factors and binomial and factorial
 - type specs
 - application level cache agent
  - null cache/max cache
  - clear cache
  - LRU/time option for expiration
  
 - future refactors
  - better docs in each module
   - where possible, break down by commonality, or just have high level details
   - rely on inline docs
   - cross refs to similar/other functions
  - Math.Factorization
  - Math.NumberTheory
   - add aliases for psi/phi/tau/etc
  - Math.Triangles?
  - Math.Combinatorics
  - Math.Representations
  - Math (high level common ops)
   
 
  > todo
  - Is editable prime (delete digit anywhere) 
  
  - other pseudo-primes
  
  
 - update summations in Math
 - add numberphile references?
 
 - sequence manipulations
  - map
  - filter
  - sum
  - reject (with count)
  - take while item time < some time
  - drop while (with count) or time
  - count option vs time option
  
 - Sequence composition  
  - zip
  - with_index
  - add max_time or some way to short-circuit when an item takes too long to get/filter/etc
  - add an agent as a wrapper around sequence state
  - have a total_time/max_time, for doing larger operations (take, etc)
  
  - or do we build sequence manipulations as combinators of some kind, like a pipeline, like streams

 - Sequence functions that iterate need to use a timeout
  - next
  - drop
  - take
  
 - in Math  
  - Negative powers (convert to inverse fractions)
  - Build left truncatable prime of length(n)
  - Build right truncatable prime of length(n)
 
 
     https://en.wikipedia.org/wiki/Fibonacci_prime
     https://en.wikipedia.org/wiki/Lucas_number#Lucas_primes
     https://en.wikipedia.org/wiki/Pell_number#Primes_and_squares
     https://en.wikipedia.org/wiki/Newman–Shanks–Williams_prime
     https://en.wikipedia.org/wiki/Perrin_number#Perrin_primes
     https://en.wikipedia.org/wiki/Wolstenholme_prime
     https://en.wikipedia.org/wiki/Wilson_prime
     https://en.wikipedia.org/wiki/Fortunate_number
     https://en.wikipedia.org/wiki/Ramanujan_prime
     https://en.wikipedia.org/wiki/Pillai_prime
     https://en.wikipedia.org/wiki/Strong_prime
     https://en.wikipedia.org/wiki/Stern_prime
     https://en.wikipedia.org/wiki/Supersingular_prime_(algebraic_number_theory)
     https://en.wikipedia.org/wiki/Good_prime
     https://en.wikipedia.org/wiki/Super-prime
     https://en.wikipedia.org/wiki/Higgs_prime
     https://en.wikipedia.org/wiki/Highly_cototient_number
     https://en.wikipedia.org/wiki/Pernicious_number
     https://en.wikipedia.org/wiki/Interprime
     https://en.wikipedia.org/wiki/Semiprime
     https://en.wikipedia.org/wiki/Almost_prime
     https://en.wikipedia.org/wiki/Carmichael_number
     https://en.wikipedia.org/wiki/Catalan_pseudoprime
     https://en.wikipedia.org/wiki/Elliptic_pseudoprime
     https://en.wikipedia.org/wiki/Euler_pseudoprime
     https://en.wikipedia.org/wiki/Euler–Jacobi_pseudoprime
     https://en.wikipedia.org/wiki/Fermat_pseudoprime
     https://en.wikipedia.org/wiki/Frobenius_pseudoprime
     https://en.wikipedia.org/wiki/Lucas_pseudoprime
     https://en.wikipedia.org/wiki/Somer–Lucas_pseudoprime
     https://en.wikipedia.org/wiki/Strong_pseudoprime


Lucas numbers as primality test - Lucas Pseudo prime

Lucas-Lehmer sequence n = (n - 1)^2 - 2 with n(0) = 4

Lucas-lahmer primality test (2^p - 1 = m) if LL seq (p - 1) is multiple of m, def prime for Mersenne primes
 - can use modular exponentiation


s Highly composite number? (We can use a carry method with sigma ?)

Do we have a count of all factors ?
Factor_count = exponents_of_prime_factors() |> &(&1 + 1) |> Enum.reduce(1, fn x, acc -> x * acc end)

Highly composite: consecutive prime factors, weakly decreasing powers, last prime power is 1 (two exceptions, 4 and 36)


In Mersenne prime in form (2^n - 1) n must be prime
 
 - Fractions to Decimals
  - duh. http://mathforum.org/library/drmath/view/58126.html
  - Could we store this result as an integer, and increase fidelity with iteration, ala continued fractional expansions?
   
 
 - Fractions
  - update all coercion compatible functions to use single entry form
      def <> (a, b) when is_coercible?(a) and is_coercible?(b)
  - round/2 (nearest fractional part)
  - log/ln
  - other functions

 - summation macro?
  - smart output, or selective output (fraction vs integer vs get_whole)
  - smart aggregator/summation
  
 - product macro?
  - smart output, or selective output (fraction vs integer vs get_whole)
  - smart reduction/product
 
 - later do integral/derivative or similar
 - infinite summation with boundary check/condition
 
 - do we need an :infinity value?
 
 - check predicates - some _could_ apply to odd numbers
  
  
  Add a whole module for modular arithmetic

  Add a module for primes

  Add a module for number theory
  
 
 - new modes for sequence stub generator
  - verbose sequence
 
 - testing and validation
  - typespecs
  - dialyzer
  - circle/ci integration
  
  
 - Move combinations/permutations to a new modules
 - add combinatorics functions that match the sequence iterators for different combinatorics
  - involutions
  - derangements
  - etc
   
```
In aliases

     quality: ["format", "credo --strict", "sobelow --config", "dialyzer", "test”]

In project:

    aliases: aliases(),
      deps: deps(),

      # static analysis/code quality
      elixirc_options: [warnings_as_errors: true],
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        ignore_warnings: ".dialyzer_ignore.exs"
      ]

In .dialyzer_ingore.exs:

[
  {":0:unknown_function Function ExUnit.Callbacks.__merge__/3 does not exist."},
  {":0:unknown_function Function ExUnit.CaseTemplate.__proxy__/2 does not exist."},
  {":0:unknown_function Function Mix.env/0 does not exist."}
]
```  
  
  
  Approx of primes less than x

  Gauss: x / ln(x)

  Dirichlet: Li(x) (below)

  Logarithmic integral 2-> x 1/log e dt


  https://en.wikipedia.org/wiki/Incomplete_gamma_function
  https://en.wikipedia.org/wiki/Logarithmic_integral_function
  https://www.integral-calculator.com
  
  
  Could we do an equation system, where an eq is parsed, and will respond with values? Could we do partial solvers?

  i.e.: enter “y=2x^5-5x^3+3z^2”
  Provide x & z, get result
  Provide x & y, solve for result
  Provide ranges, solve for ranges/constraints
  Value constraints: solvable with fraction vs integer vs float
  This would be a gateway to reducers, solvers, rewriters, etc
  
 - Caching
  - we're not really using caches right - we aren't rooting the Agent in a supervisor structure, so it isn't seeing data across processes
  - add option for global cache as part of supervisor?
  
  
 - Additions
  - generalize the Kolakoski sequence functions to any alphabet
  - add Sigma-21 through 24
  - add 5^n through 48^n
  - p-adic groups
   - 2-adic https://oeis.org/A007814
   - 3-adic https://oeis.org/A007949
   - 5-adic https://oeis.org/A112765
   - 7-adic https://oeis.org/A214411
  
  - builder for particular list sequences
   - list builder
   - fini, hard, bref modules
  - add coverage checks for specific list sequence groups
  
  - zeta function
  - more core sequences
   
  - add Panarithmetic Numbers (https://oeis.org/A005153)
  - add van Mangoldt function (https://en.wikipedia.org/wiki/Von_Mangoldt_function) and related series
 
  - Sequence.at(seq, idx)
  - Sequence.take_with/3  (take with filter predicate)
  - Sequence.take_without/3
  - Sequence.take_groups
  
  - add Math.partition(int) for [0, 250] - use sequence a000041
    
 - Large Numbers
  - mod_pow fails on large enough numbers
  - random/rand/randit on large numbers will lose precision/drop values
  - what other common functions are doing an int->float or int->float->int loss?

 - Modulo Arithmetic
  
 - Sequences
  - document patterns of developing sequences
   - using Math.next_number/2 for easy computable sequences (see a001597 in OEIS.Factors)
   - for _highly_ or _record value_ sequences (see a002093 in OEIS.Sigma)
   
  - powers of N
  - check power of 2 sequence, make sure we're using our Math.pow/2 instead of :math.pow/2
 
 - tool - download JSON of sequence, build formatted @doc string and @doc attrs
 
  - OEIS.find/1 or Sequence.find/1 to lookup by ref number/name
  - Sequence.create from module def map
  
  - Future Sequences
   - https://oeis.org/A005237 - Numbers n such that n and n+1 have the same number of divisors.
   - Divisor sequences - https://en.wikipedia.org/wiki/Category:Divisor_function

 - Math module
  - add next_arithmetic_number/1 from OEIS 3601 impl
  - generalize next_* number function to be next(func, n)
   
  - factorization
   - x prime factorization
   - all factorizations
  - generalized newtons method
  - do I still have the old programmish content on Dreamhost?
  - LCM
  - sqrt, cube_root, nth_root, nth_integer_root, has_nth_integer_root?
  
   - we could mark sequences from lists as finite
   - top level label for finite
   - normal map/filter/etc methods could block on finite labels
            
   - utility
    - create sequence from Map returned by available/1     
   - New Sequences
    - fractional types
    - OEIS top N
    - float sequences?
   - new functions   
    - finite sequences handle differently than other sequences
     - enum methods can all take an optional _count_ keyword param
    - functions for pretty printing sequence info
    - fraction sequence creator (function to turn one fractional denom into another)
    - sequence comparisons/ordering (OEIS ordering)
    - more Enum.* compatible functions
    - take_without(sequence, count, drop/reject function)

   
 - Math
  - rewrite totient to map to generic totient, or named totient
   - add euler_totient/1
   - totient should take a keyword param to point to either jordan or euler
   
  - exotic math functions (newtons method generalized, etc)
  - OEIS support functions
  
 - Chunky.Fraction

  - partition by (integer divisor)

  - adversarial tests for anything using fractionalize
   - non-fractionalized values
   - garbage (atoms, nil, maps, lists, etc)
     
  - can_scale_denominator_to?(frac, size)
  - scale_denominator_to(frac, size)
  - nearest_fraction(frac, denominator), ie: nearest_fraction(1/2, 64) -> 32/64
  
  - exotic math functions
  - fractionable?/1
  
  - typespecs
  
 - Chunky.Grid
  - day 17 has:
   - Enum.filter for grids
   - cardinal neighbors
   - draw
   - put_all
   - at_edge?
  - add a struct for coordinate or a convetion of %{x, y}
  - functions with coords should take def(grid, x, y, ...) def(grid, {x, y}, ...) or def(grid, %{}, ...)
  - day 15 
  - get/put/update
  - count (extract with val or func)
  - find_index(val or func)
  - any?
  - clamp coordinates (list of maps with x/y)
  - map
  - draw grid
  - put_all(points, val) put_all(points, func)
   - point is map? tuple?
   - map can carry extra data
   - tuple needs to be a 2-tuple
  - step from point by cardinal directions (or ordinal)
   - step(point, direction, amount)
  - neighbors(point, step amount) (get the 8 neighbors, 22 neighbors, etc)
  - steps from/to (maze solving)
  - maze methods?
  - update_all()
   
  - update_at
  - get and update at
  - replace_at
  - find_index(fn)
  - find_value()
  - grid point for value 
  - crop grid
   - crop 2d array (Day 11)
  - get row/col
  - insert row/col
  - delete row/col
  - update row/col
  - replace row/col  
  - grid slice
  - replace_area
  - update_area
  - paste grid in grid
  - merge(fn {(x, y), a_val, b_val} -> val)
  - display_grid (func for value)
  - grid point for sub grid
  - rotate
  - to_string(s)
  - from_string(s)
  - Enumerations for 2D (Enum.*)
  
  - get identity
  - matrix ops
  - append (A(3x10) + )
   - take a list of grid, or grid of grids
   - size a new grid to contain them
   - paste grids
  
  - break out an extended math module (Chunky.Sequences, Chunky.Fractions)
   - OEIS sequences as generators
   - sequences to fractions
   - eulerian functions
   - triangulars, etc
   - primality
      
# Updates
 
 - better parameter names
 - type specs?
 - credo and dialyzer/dialyxir?
 - circleCI?
 - code coverage?
 - code coverage badge?


# Documentation

Refs for permute vs combine
 - http://mathworld.wolfram.com/Combination.html
 - https://rosettacode.org/wiki/Combinations_with_repetitions
 - https://en.wikipedia.org/wiki/Combination