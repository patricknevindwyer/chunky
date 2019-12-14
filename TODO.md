
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
 
 - Sequences
  - create basic struct
   - named sequence
   - sequence info func
   - multiple modules
   - OEIS sequences
   - iterators (embed a next/1 function)
   - struct has a value and data section to carry info
   - sequence ID
   - sequence index
  - sequence listing
  - sequence sizing (finite vs infinite)
   
 - Chunky.Fraction
  - x add (frac, frac)
  - x add (frac, whole)
  - x add (whole, frac)
  - x new(integer)
  - x sub (frac, frac)
  - x sub (frac, whole)
  - x sub (whole, frac)
  - 
  - mult (frac, frac)
  - mult (frac, whole)
  - mult (whole, frac)
  - div (frac, frac)
  - div (frac, whole)
  - div (whole, frac)
  - pow(frac, frac)
  - pow(frac, whole)
  - pow(whole, frac)
  - gt(frac, frac)
  - gt(frac, whole)
  - lt(frac, frac)
  - lt(frac, whole)
  - eq(frac, frac)
  - eq(frac, whole)
  - sum(fracs)
  - to_float
  - can_scale_denominator_to?(frac, size)
  - scale_denominator_to(frac, size)
  - nearest_fraction(frac, denominator)
 
 - Chunky.Grid
  - x new grid (value)
  - x new grid (function)
  - x value at grid point
  - x coord in grid
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