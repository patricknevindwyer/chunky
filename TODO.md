
# Chunky.chunk_length

 - add option `pad_right` to pad out trailing missing data in last chunk
 - add option `pad_left` to pad out the chunking at the start of the data
 - add option `drop_incomplete_chunk` option to drop the last chunk if it doesn't fill out to the right size
 
# Chunky.permutations

 - add N permute R
 

# New functions
 
 - Chunky.filter_with_predicates/2 (day04.ex)
  - `Chunky.filter_with_predicates/2` - Filter an enumeration to _only_ those entries that meet all the provided predicate functions
  - add a Predicates module, with different types of predicates
 - Chunky.take_sequences/1 or Chunky.chunk_runs/1 (day04.ex)
  - `Chunky.chunk_runs/1` - Chunk an enumerable by runs of duplicate values
 - TODO: nPr
 - crop 2d array (Day 11)
 
# Updates
 
 - better parameter names
 - type specs?
 - credo and dialyzer?
 - circleCI?
 - code coverage?
 - code coverage badge?
