defmodule ChunkyTest do
  use ExUnit.Case
  doctest Chunky

  import Chunky

  describe "combinations/2" do
    test "integer nCk(_, 3)" do
       assert combinations([0, 1, 2, 3, 4], 3) == [
           [0,1,2],
           [0,1,3],
           [0,1,4],
           [0,2,3],
           [0,2,4],
           [0,3,4],
           [1,2,3],
           [1,2,4],
           [1,3,4],
           [2,3,4]
       ]
    end
    
    test "integer nCk(_, 2)" do
       assert combinations([1, 3, 5, 7, 11, 13], 2)  == [
           [1, 3],
           [1, 5],
           [1, 7],
           [1, 11],
           [1, 13],
           [3, 5],
           [3, 7],
           [3, 11],
           [3, 13],
           [5, 7],
           [5, 11],
           [5, 13], 
           [7, 11],
           [7, 13],
           [11, 13]
       ]
    end
    
    test "integer nCk(_, 1)" do
       assert combinations([1, 2, 3, 4, 5, 6, 7, 8], 1) == [[1], [2], [3], [4], [5], [6], [7], [8]] 
    end
    
    test "integer ordering nCk(_, 2)" do
       assert combinations([7, 0, 3, 6, 4, 6], 2) == [
           [7, 0],
           [7, 3],
           [7, 6],
           [7, 4],
           [7, 6],
           [0, 3],
           [0, 6],
           [0, 4],
           [0, 6],
           [3, 6],
           [3, 4],
           [3, 6],
           [6, 4],
           [6, 6],
           [4, 6]
       ] 
    end
    
    test "atom list nCk(_, 3)" do
        assert combinations([:a, :b, :c, :d], 3) == [[:a, :b, :c], [:a, :b, :d], [:a, :c, :d], [:b, :c, :d]]
    end
    
    test "atom list nCk(_, 1)" do
        assert combinations([:a, :b, :c, :d], 1) == [ [:a], [:b], [:c], [:d]]
    end
    
    # string
    test "string nCk(_, 3)" do
        assert combinations("abcd", 3) == ["abc", "abd", "acd", "bcd"]
    end
    
    test "string nCk(_, 1)" do
        assert combinations("abcd", 1) == ["a", "b", "c", "d"]
    end
    
    # unicdoe
    test "unicode nCk(_, 3)" do
        assert combinations("★⍵¥᙭", 3) == ["★⍵¥", "★⍵᙭", "★¥᙭", "⍵¥᙭"]
        assert combinations("😀🤷🏽‍♀️⭐️🙎🏻‍♀️", 3) == ["😀🤷🏽‍♀️⭐️", "😀🤷🏽‍♀️🙎🏻‍♀️", "😀⭐️🙎🏻‍♀️", "🤷🏽‍♀️⭐️🙎🏻‍♀️"]
    end
    
    test "unicode nCk(_, 1)" do
        assert combinations("★⍵¥᙭", 1) == ["★", "⍵", "¥", "᙭"]
        assert combinations("😀🤷🏽‍♀️⭐️🙎🏻‍♀️", 1) == ["😀", "🤷🏽‍♀️", "⭐️", "🙎🏻‍♀️"]        
    end
    
    # tuple
    test "tuple nCk(_, 3)" do
        assert combinations({:a, :b, :c, :d}, 3) == [{:a, :b, :c}, {:a, :b, :d}, {:a, :c, :d}, {:b, :c, :d}]
        assert combinations({:a, 1, true, %{}}, 3) == [{:a, 1, true}, {:a, 1, %{}}, {:a, true, %{}}, {1, true, %{}}]
    end
    
    test "tuple nCk(_, 1)" do
        assert combinations({:a, :b, :c, :d}, 1) == [{:a}, {:b}, {:c}, {:d}]
        assert combinations({:a, 1, true, %{}}, 1) == [{:a}, {1}, {true}, {%{}}]        
    end
    
    # range
    test "range nCk(_, 3)" do
        assert combinations(1..4, 3) == [ [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
        assert combinations(1..-2, 3) == [ [1, 0, -1], [1, 0, -2], [1, -1, -2], [0, -1, -2]]
    end
    
    test "range nCk(_, 1)" do
        assert combinations(1..4, 1) == [ [1], [2], [3], [4]]
        assert combinations(1..-2, 1) == [ [1], [0], [-1], [-2]]        
    end
    
    # large combinations
    test "large size nCk(10, 4)" do
        assert length(combinations([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4)) == 210
    end
    
    test "large size nCk(20, 6)" do
        assert length(combinations(1..20, 6)) == 38760
    end
    
  end
  
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
  
  describe "permutations_size/1" do
     
     test "integer list" do
         assert permutations_size([1, 2, 3, 4, 5]) == 120
     end
     
     test "atom list" do
         assert permutations_size([:a, :b, :c]) == 6
         assert permutations_size([:a, :b]) == 2
         assert permutations_size([:a]) == 1
         assert permutations_size([]) == 0
     end
     
     test "tuple" do
         assert permutations_size({:a, :b, :c, :d, :e}) == 120
     end
     
     test "range" do
         assert permutations_size(1..20) == 2432902008176640000
     end
     
     test "string" do
         assert permutations_size("abcdefghijklmnopqrstuvwxyz") == 403291461126605635584000000
     end
     
     test "unicode" do
         assert permutations_size("😀🤷🏽‍♀️⭐️😀🤷🏽‍♀️⭐️") == 720
     end
  end

  describe "chunk_length/2" do
    test "integer list" do
      assert chunk_length([1, 2, 3, 4, 5, 6, 7, 8], 4) == [[1, 2, 3, 4], [5, 6, 7, 8]]
      assert chunk_length([1, 2, 3, 4, 5, 6], 4) == [[1, 2, 3, 4], [5, 6]]
      assert chunk_length([1, 2, 3], 8) == [[1, 2, 3]]
    end

    test "atom list" do
      assert chunk_length([:a, :b, :c, :d, :e], 2) == [[:a, :b], [:c, :d], [:e]]
    end

    test "string" do
      assert chunk_length("abcdefg", 4) == ["abcd", "efg"]

      assert chunk_length("Sphinx of black quartz, judge my vow", 4) == [
               "Sphi",
               "nx o",
               "f bl",
               "ack ",
               "quar",
               "tz, ",
               "judg",
               "e my",
               " vow"
             ]
    end

    test "unicode" do
      assert chunk_length("😀🤷🏽‍♀️⭐️℉😐T", 3) == ["😀🤷🏽‍♀️⭐️", "℉😐T"]
      assert chunk_length("😀🤷🏽‍♀️⭐️℉😐T", 1) == ["😀", "🤷🏽‍♀️", "⭐️", "℉", "😐", "T"]
    end

    test "tuple" do
      assert chunk_length({true, :a, 13, %{z: "foo"}, [1, 2, 3], ~D(2019-11-11)}, 3) == [
               {true, :a, 13},
               {%{z: "foo"}, [1, 2, 3], ~D(2019-11-11)}
             ]
    end

    test "range" do
      assert chunk_length(1..20, 5) == [
               [1, 2, 3, 4, 5],
               [6, 7, 8, 9, 10],
               [11, 12, 13, 14, 15],
               [16, 17, 18, 19, 20]
             ]

      assert chunk_length(10..-10, 6) == [
               [10, 9, 8, 7, 6, 5],
               [4, 3, 2, 1, 0, -1],
               [-2, -3, -4, -5, -6, -7],
               [-8, -9, -10]
             ]
    end
  end
end
