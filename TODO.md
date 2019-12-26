
# Chunky.chunk_length

 - add option `pad_right` to pad out trailing missing data in last chunk
 - add option `pad_left` to pad out the chunking at the start of the data
 - add option `drop_incomplete_chunk` option to drop the last chunk if it doesn't fill out to the right size
 - this is Enum.chunk_every/2
  
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
  
 - Chunky.filter_with_predicates/2 (day04.ex)
  - `Chunky.filter_with_predicates/2` - Filter an enumeration to _only_ those entries that meet all the provided predicate functions
  - add a Predicates module, with different types of predicates
 - Chunky.take_sequences/1 or Chunky.chunk_runs/1 (day04.ex)
  - `Chunky.chunk_runs/1` - Chunk an enumerable by runs of duplicate values
 - TODO: nPr
  
 - Additions
  - add Sigma-21 through 24
  - add an OEIS.Factors module
 
  - Sequence.drop(seq, quant)
  - Sequence.at(seq, idx)
  - add Math.partition(int) for [0, 250] - use sequence a000041
    
 - Large Numbers
  - mod_pow fails on large enough numbers

 - Modulo Arithmetic
  
 - Sequences
  - Future Sequences
   - https://oeis.org/A005237 - Numbers n such that n and n+1 have the same number of divisors.
   - Divisor sequences - https://en.wikipedia.org/wiki/Category:Divisor_function

 - Math module
  - add next_arithmetic_number/1 from OEIS 3601 impl
 
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
  - exotic math functions (totients, newtons method generalized, etc)
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