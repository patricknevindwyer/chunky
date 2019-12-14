defmodule Chunky do
  @moduledoc """
  Extended chunking and enumeration manipulations.

  ## Functions

   - `Chunky.permutations/1` - Generate all permutations of a set of values, with no duplication
   - `Chunky.permutations_size/1` - Calculate the size of a permutation result from `Chunky.permutations/1`
   - `Chunky.combinations/2` - Generate combinations of a set of values, with no duplication
   - `Chunky.combinations_size/2` - Calculate the size of a combanation result from `Chunky.combinations/2`
   - `Chunky.chunk_length/2` - Chunk an enumerable into a list of specific length chunks
  
  For combinations and permutations, it can be helpful compare the differences:
  
  |                    | Unordered               | Ordered                 |
  |--------------------|-------------------------|-------------------------|
  | **No Replacement** | `Chunky.combinations/2` | `Chunky.permutations/1` |
  | **Replacement**    |  unsupported            | unsupported             |
  
  And expected outputs from simple string parameters:
  
  |                    | Unordered                        | Ordered                                      |
  |--------------------|----------------------------------|----------------------------------------------|
  | **No Replacement** | `[ "abc", "abd", "acd", "bcd"]`  | `["abc", "acb", "bac", "bca", "cab", "cba"]` |
  | **Replacement**    |                                  |                                              |
  
  
  """

  @doc """
  Generate all of the [permutations](https://en.wikipedia.org/wiki/Permutation), without duplicates, 
  from a set of values. 

  The _type_ of the set of values can be:

   - a list of any type, like `[1, 2, 3]` or `[:a, :b, %{}]`
   - a string or binary, like `"abcd"`
   - a tuple, like `{1, :b, "asdf"}`
   - a range, like `1..4` or `3..-1`

  This is _not_ lazy generated, so a permutation of a large set may take awhile. Keep in mind
  that the total number of permutations for a set of `N` values is `N!`. 

  When a set is permuted, the resulting list will contain values in the _shape_ of the original; a
  permuted list will contains lists, permuted tuples will contain tuples, permuted strings will
  contain strings. The only exception is ranges, which will result in lists. 

  So, for instance, a permuted string will result in a list of strings. Chunky _should_ handle
  Unicode just fine:

  ```elixir
  iex> Chunky.permutations("😀★⍵")
  ["😀★⍵", "😀⍵★", "★😀⍵", "★⍵😀", "⍵😀★", "⍵★😀"]
  ```

  ## Supported Permutations

  The `Chunky.permutations/1` function can work with sets of any size (memory and time permitting). Examples that
  follow usually use sets with a length of 3 for ease of documentation. The following types of sets are supported 
  as permutations:

  ### List

  A list with just about _any_ kind of value can be permuted, and the result will be a list of lists:

  ```elixir
  iex> Chunky.permutations([1, 2, 3])
  [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

  iex> Chunky.permutations([:a, "b", 3])
  [
      [:a, "b", 3],
      [:a, 3, "b"],
      ["b", :a, 3],
      ["b", 3, :a],
      [3, :a, "b"],
      [3, "b", :a]
  ]
  ```

  Collections, types, and other values can be permuted as well:

  ```elixir
  iex> Chunky.permutations([~D(2019-12-05), %{a: "foo"}, {:tup, :le}])
  [
      [~D[2019-12-05], %{a: "foo"}, {:tup, :le}],
      [~D[2019-12-05], {:tup, :le}, %{a: "foo"}],
      [%{a: "foo"}, ~D[2019-12-05], {:tup, :le}],
      [%{a: "foo"}, {:tup, :le}, ~D[2019-12-05]],
      [{:tup, :le}, ~D[2019-12-05], %{a: "foo"}],
      [{:tup, :le}, %{a: "foo"}, ~D[2019-12-05]]
  ]    
  ```

  ### String/Binary

  Permuted strings are returned as a list of strings. Chunky works with full UTF-8, including multi-code point
  glyphs like emojis and variable emojis. 

  ```elixir
  iex> Chunky.permutations("abc")
  ["abc", "acb", "bac", "bca", "cab", "cba"]

  iex> Chunky.permutations("😀🤷🏽‍♀️⭐️")
  [
      "😀🤷🏽‍♀️⭐️", 
      "😀⭐️🤷🏽‍♀️",
      "🤷🏽‍♀️😀⭐️", 
      "🤷🏽‍♀️⭐️😀",
      "⭐️😀🤷🏽‍♀️", 
      "⭐️🤷🏽‍♀️😀"
  ]
  ```

  ### Tuple

  When tuples are permuted, the resulting list will also contain tuples. As part of the permutation the original
  tuple is converted to a list, before the final values of the permutation are re-assembled into tuples. Like working
  with lists, tuples can contain _any_ values:

  ```elixir
  iex> Chunky.permutations({:a, :b, :c})
  [
      {:a, :b, :c},
      {:a, :c, :b},
      {:b, :a, :c},
      {:b, :c, :a},
      {:c, :a, :b},
      {:c, :b, :a}
  ]    

  iex> Chunky.permutations({:task, ~D(2019-12-09), %{value: "timer"}})
  [
      {:task, ~D[2019-12-09], %{value: "timer"}},
      {:task, %{value: "timer"}, ~D[2019-12-09]}, 
      {~D[2019-12-09], :task, %{value: "timer"}},
      {~D[2019-12-09], %{value: "timer"}, :task},
      {%{value: "timer"}, :task, ~D[2019-12-09]},
      {%{value: "timer"}, ~D[2019-12-09], :task}
  ]    
  ```

  ### Ranges

  Ranges can be used to create permutations over ordered lists of numbers. Before permutation the provided
  range is converted into a list. Increasing or decreasing ranges are supported.

  ```elixir
  iex> Chunky.permutations(3..5)
  [[3, 4, 5], [3, 5, 4], [4, 3, 5], [4, 5, 3], [5, 3, 4], [5, 4, 3]]

  iex> Chunky.permutations(-10..-12)
  [
      [-10, -11, -12],
      [-10, -12, -11],
      [-11, -10, -12],
      [-11, -12, -10],
      [-12, -10, -11],
      [-12, -11, -10]
  ]    
  ```

  ## Examples

      iex> Chunky.permutations([1, 2, 3])
      [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

      iex> Chunky.permutations("abc")
      ["abc", "acb", "bac", "bca", "cab", "cba"]

      iex> Chunky.permutations({:a, :b, :c})
      [ {:a, :b, :c}, {:a, :c, :b}, {:b, :a, :c}, {:b, :c, :a}, {:c, :a, :b}, {:c, :b, :a} ]

      iex> Chunky.permutations(1..-1)
      [ [1, 0, -1], [1, -1, 0], [0, 1, -1], [0, -1, 1], [-1, 1, 0], [-1, 0, 1]]

  """
  def permutations([]), do: []

  def permutations(list) when is_list(list) do
      permutations_calc(list)
  end

  def permutations(""), do: []
  def permutations(str) when is_binary(str) do
    str

    # break into characters
    |> String.split("")

    # remove the blanks
    |> Enum.reject(fn v -> v == "" end)

    # permute
    |> permutations_calc()

    # reconstruct strings
    |> Enum.map(fn perm -> perm |> Enum.join("") end)
  end

  def permutations(tup) when is_tuple(tup) do
    tup
    |> Tuple.to_list()
    |> permutations_calc()
    |> Enum.map(&List.to_tuple/1)
  end

  def permutations(%Range{} = range) do
    range
    |> Enum.to_list()
    |> permutations_calc()
  end
  
  # private functions to run actual permutations
  defp permutations_calc([]), do: [[]]

  defp permutations_calc(list) when is_list(list),
    do: for(elem <- list, rest <- permutations_calc(list -- [elem]), do: [elem | rest])
  
  @doc """
  Compute the size of the result of calling `Chunky.permutations/1`, without actually
  running a permutation.
  
  The results of a permutation of a set of `n` items grows at a rate of `n!`.
  
  This can be a quick sanity check before running a permutation. Works with all of the
  parameters that work with `Chunky.permutations/1`, as a drop in replacement. Uses
  a closed form factorial to calculate the size of the list that would result from an
  indentical call to `Chunky.permutations/1`:
  
  ```elixir
  iex> Chunky.permutations_size("abcd")
  24
  
  iex> Chunky.permutations_size(1..10)
  3628800
  
  iex> Chunky.permutations_size({:a, :b, :c, :d, :e, :f, :g})
  5040
  
  iex> Chunky.permutations_size([1, 4, 8, 10, 15, 37, 91, 113, 3345, 8765, 101010, 345678])
  479001600
  ```
  
  See `Chunky.permutations/1` for more details on supported types.
  """
  def permutations_size([]), do: 0
  def permutations_size(list) when is_list(list) do
      list |> length() |> fac()
  end
  
  def permutations_size(str) when is_binary(str) do
      str

      # break into characters
      |> String.split("")

      # remove the blanks
      |> Enum.reject(fn v -> v == "" end)

      # permute
      |> permutations_size()
      
  end
  
  def permutations_size(tup) when is_tuple(tup) do
      
      tup
      |> Tuple.to_list()
      |> permutations_size()
      
  end
  
  def permutations_size(%Range{} = range) do
      range
      |> Enum.to_list()
      |> permutations_size()
  end
  
  
  @doc """
  Generate the set of [combinations](http://mathworld.wolfram.com/Combination.html) from a set of
  values.
  
  The _type_ of the set of values can be:

   - a list of any type, like `[1, 2, 3]` or `[:a, :b, %{}]`
   - a string or binary, like `"abcd"`
   - a tuple, like `{1, :b, "asdf"}`
   - a range, like `1..4` or `3..-1`

  This is _not_ lazy generated, so a combination of a large set may take awhile. Keep in mind
  that the total number of combinations of `k` length for a set of `n` values is:
  
  ```math
       n!
  ----------
  k!(n - k)!
  ``` 

  When a set is generated, the resulting list will contain values in the _shape_ of the original; a
  combination from a list will contains lists, combination from tuples will contain tuples, combination
  from strings will contain strings. The only exception is ranges, which will result in lists. 

  So, for instance, a combination from a string will result in a list of strings. Chunky _should_ handle
  Unicode just fine:

  ```elixir
  iex> Chunky.combinations("😀★⍵😀🤷🏽‍♀️", 3)
  ["😀★⍵", "😀★😀", "😀★🤷🏽‍♀️", "😀⍵😀", "😀⍵🤷🏽‍♀️", "😀😀🤷🏽‍♀️", "★⍵😀", "★⍵🤷🏽‍♀️", "★😀🤷🏽‍♀️", "⍵😀🤷🏽‍♀️"]
  ```
  
  ## Supported Combinations

  The `Chunky.combinations/2` function can work with sets of any size (memory and time permitting). Examples that
  follow usually use sets with a length of 2 or 3 for ease of documentation. The following types of sets are supported 
  as combinations:

  ### List

  A list with just about _any_ kind of value can be permuted, and the result will be a list of lists:

  ```elixir
  iex> Chunky.combinations([1, 5, 7, 11, 27], 3)
  [[1, 5, 7], [1, 5, 11], [1, 5, 27], [1, 7, 11], [1, 7, 27], [1, 11, 27], [5, 7, 11], [5, 7, 27], [5, 11, 27], [7, 11, 27]]

  iex> Chunky.combinations([:a, "b", 3, 26.2], 2)
  [
      [:a, "b"],
      [:a, 3],
      [:a, 26.2],
      ["b", 3],
      ["b", 26.2],
      [3, 26.2]
  ]
  ```

  Collections, types, and other values can be combined as well:

  ```elixir
  iex> Chunky.combinations([~D(2019-12-05), %{a: "foo"}, {:tup, :le}, [1, 2, 3]], 3)
  [
      [~D[2019-12-05], %{a: "foo"}, {:tup, :le}],
      [~D[2019-12-05], %{a: "foo"}, [1, 2, 3]],
      [~D[2019-12-05], {:tup, :le}, [1, 2, 3]],
      [%{a: "foo"}, {:tup, :le}, [1, 2, 3]]
  ]    
  ```

  ### String/Binary

  Combined strings are returned as a list of strings. Chunky works with full UTF-8, including multi-code point
  glyphs like emojis and variable emojis. 

  ```elixir
  iex> Chunky.combinations("abcd", 2)
  ["ab", "ac", "ad", "bc", "bd", "cd"]

  iex> Chunky.combinations("😀🤷🏽‍♀️⭐️🧁🦴", 3)
  [
      "😀🤷🏽‍♀️⭐️", 
      "😀🤷🏽‍♀️🧁", 
      "😀🤷🏽‍♀️🦴", 
      "😀⭐️🧁", 
      "😀⭐️🦴", 
      "😀🧁🦴", 
      "🤷🏽‍♀️⭐️🧁", 
      "🤷🏽‍♀️⭐️🦴", 
      "🤷🏽‍♀️🧁🦴",
      "⭐️🧁🦴"
  ]
  ```

  ### Tuple

  When tuples are combined, the resulting list will also contain tuples. As part of the combination the original
  tuple is converted to a list, before the final values of the combination are re-assembled into tuples. Like working
  with lists, tuples can contain _any_ values:

  ```elixir
  iex> Chunky.combinations({:a, :b, :c, :d, :e}, 3)
  [
      {:a, :b, :c},
      {:a, :b, :d},
      {:a, :b, :e},
      {:a, :c, :d},
      {:a, :c, :e},
      {:a, :d, :e},
      {:b, :c, :d},
      {:b, :c, :e},
      {:b, :d, :e},
      {:c, :d, :e}
  ]    

  iex> Chunky.combinations({:task, ~D(2019-12-09), %{value: "timer"}, [1, 2, 3]}, 3)
  [
      {:task, ~D[2019-12-09], %{value: "timer"}},
      {:task, ~D[2019-12-09], [1, 2, 3]},
      {:task, %{value: "timer"}, [1, 2, 3]},
      {~D[2019-12-09], %{value: "timer"}, [1, 2, 3]}
  ]    
  ```

  ### Ranges

  Ranges can be used to create combinations over ordered lists of numbers. Before combination the provided
  range is converted into a list. Increasing or decreasing ranges are supported.

  ```elixir
  iex> Chunky.combinations(3..6, 2)
  [ [3, 4], [3, 5], [3, 6], [4, 5], [4, 6], [5, 6] ]

  iex> Chunky.combinations(-10..-13, 3)
  [
      [-10, -11, -12],
      [-10, -11, -13],
      [-10, -12, -13],
      [-11, -12, -13]
  ]    
  ```

  ## Examples

      iex> Chunky.combinations([4, 3, 4, 3], 3)
      [[4, 3, 4], [4, 3, 3], [4, 4, 3], [3, 4, 3]]

      iex> Chunky.combinations("abcd", 2)
      ["ab", "ac", "ad", "bc", "bd", "cd"]

      iex> Chunky.combinations({:a, :b, :c}, 1)
      [ {:a}, {:b}, {:c}]

      iex> Chunky.combinations(2..-2, 3)
      [ [2, 1, 0], [2, 1, -1], [2, 1, -2], [2, 0, -1], [2, 0, -2], [2, -1, -2], [1, 0, -1], [1, 0, -2], [1, -1, -2], [0, -1, -2]]
  """
  def combinations(_, 0), do: []
  def combinations([], k) when is_integer(k), do: []
  def combinations(list, k) when is_list(list) and is_integer(k) do
      combinations_calc(list, k)
  end
    
  def combinations(str, k) when is_binary(str) and is_integer(k) do
    str

    # break into characters
    |> String.split("")

    # remove the blanks
    |> Enum.reject(fn v -> v == "" end)

    # permute
    |> combinations_calc(k)

    # reconstruct strings
    |> Enum.map(fn perm -> perm |> Enum.join("") end)
  end

  def combinations(tup, k) when is_tuple(tup) and is_integer(k) do
    tup
    |> Tuple.to_list()
    |> combinations_calc(k)
    |> Enum.map(&List.to_tuple/1)
  end

  def combinations(%Range{} = range, k) when is_integer(k) do
    range
    |> Enum.to_list()
    |> combinations_calc(k)
  end
  
  defp combinations_calc(_, 0), do: [[]]
  defp combinations_calc([], k) when is_integer(k), do: []
  defp combinations_calc([head|tail], k) when is_integer(k) do
      
      Enum.map(
          combinations_calc(tail, k - 1), 
          fn r_comb -> 
              [head | r_comb]
          end
      ) 
      ++ combinations_calc(tail, k)
  end
  
  
  @doc """
  Compute the size of the result of calling `Chunky.combinations/2`, without actually
  running a combination.
  
  This is particularly useful, as the number of results of a combination of `k` elements
  from a set of `n`, grows as:
  
  ```
       n!
  ----------
  k!(n - k)!
  ```
  
  This can be a quick sanity check before running a permutation. Works with all of the
  parameters that work with `Chunky.permutations/1`, as a drop in replacement. Uses
  a closed form factorial to calculate the size of the list that would result from an
  indentical call to `Chunky.permutations/1`:
  
  ```elixir
  iex> Chunky.combinations_size("abcd", 2)
  6
  
  iex> Chunky.combinations_size(1..10, 4)
  210
  
  iex> Chunky.combinations_size({:a, :b, :c, :d, :e, :f, :g}, 5)
  21
  
  iex> Chunky.combinations_size([2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30], 3)
  455
  ```
  
  See `Chunky.combinations/2` for more details on supported types.  
  """
  def combinations_size(list, k) when is_list(list) and is_integer(k) do
      if k > length(list) do
          0
      else
          Kernel.trunc(fac(length(list)) / (fac(k) * fac(length(list) - k)))
      end
  end
  
  def combinations_size(str, k) when is_binary(str) and is_integer(k) do
    str

    # break into characters
    |> String.split("")

    # remove the blanks
    |> Enum.reject(fn v -> v == "" end)

    # permute
    |> combinations_size(k)

  end

  def combinations_size(tup, k) when is_tuple(tup) and is_integer(k) do
    tup
    |> Tuple.to_list()
    |> combinations_size(k)
  end

  def combinations_size(%Range{} = range, k) when is_integer(k) do
    range
    |> Enum.to_list()
    |> combinations_size(k)
  end
  
  
  @doc """
  Break a set of values into smaller chunks of a specific length.

  ```elixir
  iex> Chunky.chunk_length([1, 2, 3, 4, 5, 6], 3)
  [ [1, 2, 3], [4, 5, 6]]

  iex> Chunky.chunk_length("Sphinx of black quartz, judge my vow", 5)
  ["Sphin", "x of ", "black", " quar", "tz, j", "udge ", "my vo", "w"]
  ```

  The _type_ of the set of values can be:

   - a list of any type, like `[1, 2, 3]` or `[:a, :b, %{}]`
   - a string or binary, like `"abcd"`
   - a tuple, like `{1, :b, "asdf"}`
   - a range, like `1..4` or `3..-1`

  When a set is chunked, the resulting list will contain values in the _shape_ of the original; a
  chunked list will contains lists, chunked tuples will contain tuples, chunked strings will
  contain strings. The only exception is ranges, which will result in lists. 

  ## Supported Chunking Types

  The following types of sets are supported for chunking:

  ### List

  A list with just about _any_ kind of value can be chunked, and the result will be a list of lists:

  ```elixir
  iex> Chunky.chunk_length([1, 2, 3, 4, 5, 6, 7, 8], 3)
  [ [1, 2, 3], [4, 5, 6], [7, 8]]

  iex> Chunky.chunk_length([:a, 1, :b, 2, :c, 3, :d, 4, :e, 5, :f, 6], 4)
  [ [:a, 1, :b, 2], [:c, 3, :d, 4], [:e, 5, :f, 6]]  
  ```

  Collections, types, and other values can be in the chunked set:

  ```elixir
  iex> Chunky.chunk_length([~D(2019-12-05), %{a: "foo"}, {:tup, :le}, true], 2)
  [ [~D(2019-12-05), %{a: "foo"}], [{:tup, :le}, true]]  
  ```

  ### String/Binary

  Chunked strings are returned as a list of strings. Chunky works with full UTF-8, including multi-code point
  glyphs like emojis and variable emojis. 

  ```elixir
  iex> Chunky.chunk_length("abcdefghijklmnop", 7)
  [ "abcdefg", "hijklmn", "op"]

  iex> Chunky.chunk_length("😀🤷🏽‍♀️⭐️℉😐", 3)
  ["😀🤷🏽‍♀️⭐️", "℉😐"]
  ```

  ### Tuple

  When tuples are chunked, the resulting list will also contain tuples. As part of the chunking process the original
  tuple is converted to a list, before the final values are re-assembled into tuples. Like working with lists, tuples 
  can contain _any_ values:

  ```elixir
  iex> Chunky.chunk_length({:a, :b, :c, :d, :e, :f, :g, :h, :i, :j}, 4)
  [ {:a, :b, :c, :d}, {:e, :f, :g, :h}, {:i, :j}]

  iex> Chunky.chunk_length({:task, ~D(2019-12-09), %{value: "timer"}, true, 123, "foo"}, 2)
  [ {:task, ~D(2019-12-09)}, {%{value: "timer"}, true}, {123, "foo"}]
  ```

  ### Ranges

  Ranges can be used to create chunks over ordered lists of numbers. Before chunking the provided
  range is converted into a list. Increasing or decreasing ranges are supported.

  ```elixir
  iex> Chunky.chunk_length(1..20, 5)
  [ [1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20]]

  iex> Chunky.chunk_length(10..-10, 3)
  [
      [10, 9, 8],
      [7, 6, 5],
      [4, 3, 2],
      [1, 0, -1],
      [-2, -3, -4],
      [-5, -6, -7],
      [-8, -9, -10]
  ]    
  ```
  """
  def chunk_length([], _s), do: []

  def chunk_length(d, s) when is_list(d) and is_integer(s) do
    [Enum.take(d, s)] ++ chunk_length(Enum.drop(d, s), s)
  end

  def chunk_length(str, s) when is_binary(str) and is_integer(s) do
    str

    # break into characters
    |> String.split("")

    # remove the blanks
    |> Enum.reject(fn v -> v == "" end)

    # chunk
    |> chunk_length(s)

    # reconstruct strings
    |> Enum.map(fn perm -> perm |> Enum.join("") end)
  end

  def chunk_length(%Range{} = range, s) when is_integer(s) do
    range

    # expand the range, and chunk
    |> Enum.to_list()
    |> chunk_length(s)
  end

  def chunk_length(tup, s) when is_tuple(tup) and is_integer(s) do
    tup

    # convert to list, and then chunk
    |> Tuple.to_list()
    |> chunk_length(s)

    # remap to tuples
    |> Enum.map(&List.to_tuple/1)
  end
  
  # integer factorial - used by permutations_size/1 and combinations_size/2
  defp fac(0), do: 1
  defp fac(1), do: 1
  defp fac(n) when is_integer(n) do
     if n > 1 do
         n * fac(n - 1)
     else
         0
     end 
  end
  
end
