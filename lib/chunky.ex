defmodule Chunky do
  @moduledoc """
  Extended chunking and enumeration manipulations.

  ## Functions

   - `Chunky.permutations/1` - Generate all combinations of a set of values, with no duplication
   - `Chunky.filter_with_predicates/2` - Filter an enumeration to _only_ those entries that meet all the provided predicate functions
   - `Chunky.chunk_runs/1` - Chunk an enumerable by runs of duplicate values
   - `Chunky.chunk_to_length/2` - Chunk an enumerable into specific length chunks

  TODO: Chunky.filter_with_predicates/2
  TODO: Chunky.take_sequences/1
  TODO: Chunky.take_chunks/2
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
  def permutations([]), do: [[]]

  def permutations(list) when is_list(list),
    do: for(elem <- list, rest <- permutations(list -- [elem]), do: [elem | rest])

  def permutations(str) when is_binary(str) do
    str

    # break into characters
    |> String.split("")

    # remove the blanks
    |> Enum.reject(fn v -> v == "" end)

    # permute
    |> permutations()

    # reconstruct strings
    |> Enum.map(fn perm -> perm |> Enum.join("") end)
  end

  def permutations(tup) when is_tuple(tup) do
    tup
    |> Tuple.to_list()
    |> permutations()
    |> Enum.map(&List.to_tuple/1)
  end

  def permutations(%Range{} = range) do
    range
    |> Enum.to_list()
    |> permutations()
  end
end
