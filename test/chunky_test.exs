defmodule ChunkyTest do
  use ExUnit.Case
  doctest Chunky

  import Chunky

  describe "permutations/1" do
    test "integer list" do
      assert permutations([1, 2, 3]) == [
               [1, 2, 3],
               [1, 3, 2],
               [2, 1, 3],
               [2, 3, 1],
               [3, 1, 2],
               [3, 2, 1]
             ]

      assert length(permutations([1, 2, 3, 4])) == 24
    end

    test "atom list" do
      assert permutations([:a]) == [[:a]]
      assert permutations([:a, :b]) == [[:a, :b], [:b, :a]]

      assert permutations([:a, :b, :c]) == [
               [:a, :b, :c],
               [:a, :c, :b],
               [:b, :a, :c],
               [:b, :c, :a],
               [:c, :a, :b],
               [:c, :b, :a]
             ]
    end

    test "string" do
      assert permutations("a") == ["a"]
      assert permutations("ab") == ["ab", "ba"]
      assert permutations("abc") == ["abc", "acb", "bac", "bca", "cab", "cba"]
    end

    test "unicode" do
      assert permutations("★⍵¥") == ["★⍵¥", "★¥⍵", "⍵★¥", "⍵¥★", "¥★⍵", "¥⍵★"]
      assert permutations("😀🤷🏽‍♀️⭐️") == ["😀🤷🏽‍♀️⭐️", "😀⭐️🤷🏽‍♀️", "🤷🏽‍♀️😀⭐️", "🤷🏽‍♀️⭐️😀", "⭐️😀🤷🏽‍♀️", "⭐️🤷🏽‍♀️😀"]
    end

    test "tuple" do
      assert permutations({:a}) == [{:a}]
      assert permutations({:a, :b}) == [{:a, :b}, {:b, :a}]

      assert permutations({:a, :b, :c}) == [
               {:a, :b, :c},
               {:a, :c, :b},
               {:b, :a, :c},
               {:b, :c, :a},
               {:c, :a, :b},
               {:c, :b, :a}
             ]
    end

    test "ranges" do
      assert permutations(1..3) == [
               [1, 2, 3],
               [1, 3, 2],
               [2, 1, 3],
               [2, 3, 1],
               [3, 1, 2],
               [3, 2, 1]
             ]

      assert permutations(1..-1) == [
               [1, 0, -1],
               [1, -1, 0],
               [0, 1, -1],
               [0, -1, 1],
               [-1, 1, 0],
               [-1, 0, 1]
             ]
    end

    test "large permutations" do
      assert length(permutations(1..8)) == 40320
    end
  end
end
