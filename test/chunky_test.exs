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
  
  describe "chunk_length/2" do
     
      test "integer list" do
          assert chunk_length([1, 2, 3, 4, 5, 6, 7, 8], 4) == [ [1, 2, 3, 4], [5, 6, 7, 8]]
          assert chunk_length([1, 2, 3, 4, 5, 6], 4) == [ [1, 2, 3, 4], [5, 6]]
          assert chunk_length([1, 2, 3], 8) == [ [1, 2, 3]]
      end
      
      test "atom list" do
          assert chunk_length([:a, :b, :c, :d, :e], 2) == [ [:a, :b], [:c, :d], [:e]]
      end
      
      test "string" do
          assert chunk_length("abcdefg", 4) == ["abcd", "efg"]
          assert chunk_length("Sphinx of black quartz, judge my vow", 4) == ["Sphi", "nx o", "f bl", "ack ", "quar", "tz, ", "judg", "e my", " vow"]
      end
      
      test "unicode" do
          assert chunk_length("😀🤷🏽‍♀️⭐️℉😐T", 3) == ["😀🤷🏽‍♀️⭐️", "℉😐T"]
          assert chunk_length("😀🤷🏽‍♀️⭐️℉😐T", 1) == ["😀", "🤷🏽‍♀️", "⭐️", "℉", "😐", "T"]
      end
      
      test "tuple" do
          assert chunk_length({true, :a, 13, %{z: "foo"}, [1, 2, 3], ~D(2019-11-11)}, 3) == [ {true, :a, 13}, {%{z: "foo"}, [1, 2, 3], ~D(2019-11-11)}]
      end
      
      test "range" do
          assert chunk_length(1..20, 5) == [[1,2,3,4,5], [6,7,8,9,10], [11,12,13,14,15], [16,17,18,19,20]]
          assert chunk_length(10..-10, 6) == [ [10,9,8,7,6,5], [4,3,2,1,0,-1], [-2,-3,-4,-5,-6,-7], [-8,-9,-10]]
      end
  end
  
end
