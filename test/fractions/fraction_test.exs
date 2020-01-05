defmodule Chunky.FractionTest do
  use ExUnit.Case, async: true
  alias Chunky.Fraction
  alias Chunky.Math

  doctest Chunky.Fraction, import: true

  describe "is_coercible?/1" do
  
      test "int" do
         assert Fraction.is_coercible?(3) 
      end
      
      test "float" do
          assert Fraction.is_coercible?(3.3) 
      end
      
      test "binary" do
          assert Fraction.is_coercible?("22/3") 
      end
      
      test "tuples" do
          assert Fraction.is_coercible?({1, 3}) 
      end
      
  end
  
  describe "within/3" do
      
      test "fraction/fraction" do
          
          f_a = Fraction.new(22, 7)
          f_b = Fraction.new(-22, 5)
          
          f_low = Fraction.new(-100, 2)
          f_zero = Fraction.new(0, 3)
          f_hi = Fraction.new(30, 3)
         
          # in
          assert Fraction.within?(f_a, f_zero, f_hi)
          assert Fraction.within?(f_a, f_low, f_hi)
          
          assert Fraction.within?(f_b, f_low, f_zero)
          assert Fraction.within?(f_b, f_low, f_hi)
          
          # out
          assert Fraction.within?(f_a, f_low, f_zero) == false
          assert Fraction.within?(f_b, f_zero, f_hi) == false
      end
      
      test "int/int" do
          
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0, 2) == true
          assert Fraction.within?(f_b, -2, 0) == true
          
          # out
          assert Fraction.within?(f_a, -2, 0) == false
          assert Fraction.within?(f_b, 0, 2) == false
          
          # pos/pos
          assert Fraction.within?(f_a, 1, 2) == true
          assert Fraction.within?(f_b, 1, 2) == false
          
          # neg/neg
          assert Fraction.within?(f_a, -2, -1) == false
          assert Fraction.within?(f_b, -2, -1) == true
          
          # neg/pos
          assert Fraction.within?(f_a, -2, 2) == true
          assert Fraction.within?(f_b, -2, 2) == true
          
      end
      
      test "int/float" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0, 2.2) == true
          assert Fraction.within?(f_b, -2, 0.1) == true
          
          # out
          assert Fraction.within?(f_a, -2, 0.2) == false
          assert Fraction.within?(f_b, 0, 2.2) == false
          
          # pos/pos
          assert Fraction.within?(f_a, 1, 2.3) == true
          assert Fraction.within?(f_b, 1, 2.3) == false
          
          # neg/neg
          assert Fraction.within?(f_a, -2, -1.1) == false
          assert Fraction.within?(f_b, -2, -1.1) == true
          
          # neg/pos
          assert Fraction.within?(f_a, -2, 2.3) == true
          assert Fraction.within?(f_b, -2, 2.3) == true
          
      end
      
      test "float/int" do
          
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0.0, 2) == true
          assert Fraction.within?(f_b, -2.1, 0) == true
          
          # out
          assert Fraction.within?(f_a, -2.2, 0) == false
          assert Fraction.within?(f_b, 0.1, 2) == false
          
          # pos/pos
          assert Fraction.within?(f_a, 1.04, 2) == true
          assert Fraction.within?(f_b, 1.32, 2) == false
          
          # neg/neg
          assert Fraction.within?(f_a, -2.5, -1) == false
          assert Fraction.within?(f_b, -2.5, -1) == true
          
          # neg/pos
          assert Fraction.within?(f_a, -2.3, 2) == true
          assert Fraction.within?(f_b, -2.3, 2) == true
          
      end
      
      test "str/str" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, "0/1", "2/1") == true
          assert Fraction.within?(f_b, "-2/1", "0/1") == true
          
          # out
          assert Fraction.within?(f_a, "-2/1", "0/1") == false
          assert Fraction.within?(f_b, "0/1", "2/1") == false
          
          # pos/pos
          assert Fraction.within?(f_a, "1/1", "2/1") == true
          assert Fraction.within?(f_b, "1/1", "2/1") == false
          
          # neg/neg
          assert Fraction.within?(f_a, "-2/1", "-1/1") == false
          assert Fraction.within?(f_b, "-2/1", "-1/1") == true
          
          # neg/pos
          assert Fraction.within?(f_a, "-2/1", "2/1") == true
          assert Fraction.within?(f_b, "-2/1", "2/1") == true
          
      end
      
      test "str/int" do

          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, "0/1", 2) == true
          assert Fraction.within?(f_b, "-2/1", 0) == true
          
          # out
          assert Fraction.within?(f_a, "-2/1", 0) == false
          assert Fraction.within?(f_b, "0/1", 2) == false
          
          # pos/pos
          assert Fraction.within?(f_a, "1/1", 2) == true
          assert Fraction.within?(f_b, "1/1", 2) == false
          
          # neg/neg
          assert Fraction.within?(f_a, "-2/1", -1) == false
          assert Fraction.within?(f_b, "-2/1", -1) == true
          
          # neg/pos
          assert Fraction.within?(f_a, "-2/1", 2) == true
          assert Fraction.within?(f_b, "-2/1", 2) == true
          
      end
      
      test "str/float" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, "0/1", 2.1) == true
          assert Fraction.within?(f_b, "-2/1", 0.1) == true
          
          # out
          assert Fraction.within?(f_a, "-2/1", 0.1) == false
          assert Fraction.within?(f_b, "0/1", 2.1) == false
          
          # pos/pos
          assert Fraction.within?(f_a, "1/1", 2.2) == true
          assert Fraction.within?(f_b, "1/1", 2.2) == false
          
          # neg/neg
          assert Fraction.within?(f_a, "-2/1", -1.1) == false
          assert Fraction.within?(f_b, "-2/1", -1.1) == true
          
          # neg/pos
          assert Fraction.within?(f_a, "-2/1", 2.4) == true
          assert Fraction.within?(f_b, "-2/1", 2.4) == true
          
          
      end
      
      test "int/str" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0, "2/1") == true
          assert Fraction.within?(f_b, -2, "0/1") == true
          
          # out
          assert Fraction.within?(f_a, -2, "0/1") == false
          assert Fraction.within?(f_b, 0, "2/1") == false
          
          # pos/pos
          assert Fraction.within?(f_a, 1, "2/1") == true
          assert Fraction.within?(f_b, 1, "2/1") == false
          
          # neg/neg
          assert Fraction.within?(f_a, -2, "-1/1") == false
          assert Fraction.within?(f_b, -2, "-1/1") == true
          
          # neg/pos
          assert Fraction.within?(f_a, -2, "2/1") == true
          assert Fraction.within?(f_b, -2, "2/1") == true
          
      end
      
      test "float/str" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0.1, "2/1") == true
          assert Fraction.within?(f_b, -2.1, "0/1") == true
          
          # out
          assert Fraction.within?(f_a, -2.1, "0/1") == false
          assert Fraction.within?(f_b, 0.1, "2/1") == false
          
          # pos/pos
          assert Fraction.within?(f_a, 1.1, "2/1") == true
          assert Fraction.within?(f_b, 1.1, "2/1") == false
          
          # neg/neg
          assert Fraction.within?(f_a, -2.1, "-1/1") == false
          assert Fraction.within?(f_b, -2.1, "-1/1") == true
          
          # neg/pos
          assert Fraction.within?(f_a, -2.1, "2/1") == true
          assert Fraction.within?(f_b, -2.1, "2/1") == true
          
      end
      
      test "float/float" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0.1, 2.1) == true
          assert Fraction.within?(f_b, -2.1, 0.1) == true
          
          # out
          assert Fraction.within?(f_a, -2.1, 0.1) == false
          assert Fraction.within?(f_b, 0.1, 2.1) == false
          
          # pos/pos
          assert Fraction.within?(f_a, 1.1, 2.1) == true
          assert Fraction.within?(f_b, 1.1, 2.1) == false
          
          # neg/neg
          assert Fraction.within?(f_a, -2.1, -1.1) == false
          assert Fraction.within?(f_b, -2.1, -1.1) == true
          
          # neg/pos
          assert Fraction.within?(f_a, -2.1, 2.2) == true
          assert Fraction.within?(f_b, -2.1, 2.2) == true
          
      end
      
      test "range" do
          f_a = Fraction.new("5/4")
          f_b = Fraction.new("-5/4")
          
          # in
          assert Fraction.within?(f_a, 0..2)
          assert Fraction.within?(f_b, -2..0)
          
          # out
          assert Fraction.within?(f_a, 3..4) == false
          assert Fraction.within?(f_b, -4..-3) == false
          
          # pos pos
          assert Fraction.within?(f_a, 1..100)
          assert Fraction.within?(f_b, 3..30) == false
          
          # neg pos
          assert Fraction.within?(f_a, -100..100)
          assert Fraction.within?(f_b, -20..20)
          
          # neg neg
          assert Fraction.within?(f_a, -100..-3) == false
          assert Fraction.within?(f_b, -30..-1)
      end
  end
  
  describe "increment/2" do
      test "numerator" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4", "-1/3"]
          outs = ["2/4", "6/4", "17/4", "-2/4", "-4/4", "1/4", "0/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.increment(:numerator) |> Fraction.eq?(Fraction.new(o))
          end)          
      end
      
      test "num" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4", "-1/3"]
          outs = ["2/4", "6/4", "17/4", "-2/4", "-4/4", "1/4", "0/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.increment(:num) |> Fraction.eq?(Fraction.new(o))
          end)                    
      end

      test "denominator" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["1/5", "5/5", "16/5", "-3/5", "-5/5", "0/5"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.increment(:denominator) |> Fraction.eq?(Fraction.new(o))
          end)          
      end
      
      test "den" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["1/5", "5/5", "16/5", "-3/5", "-5/5", "0/5"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.increment(:den) |> Fraction.eq?(Fraction.new(o))
          end)                    
      end
      
      test "both" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4", "-1/1"]
          outs = ["2/5", "6/5", "17/5", "-2/5", "-4/5", "1/5", "0/2"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.increment(:both) |> Fraction.eq?(Fraction.new(o))
          end)                    
          
      end
            
  end
  
  describe "decrement/2" do
      test "numerator" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4", "-1/3"]
          outs = ["0/4", "4/4", "15/4", "-4/4", "-6/4", "-1/4", "-2/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.decrement(:numerator) |> Fraction.eq?(Fraction.new(o))
          end)          
      end
      
      test "num" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4", "-1/3"]
          outs = ["0/4", "4/4", "15/4", "-4/4", "-6/4", "-1/4", "-2/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.decrement(:num) |> Fraction.eq?(Fraction.new(o))
          end)                    
      end

      test "denominator" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["1/3", "5/3", "16/3", "-3/3", "-5/3", "0/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.decrement(:denominator) |> Fraction.eq?(Fraction.new(o))
          end)          
      end
      
      test "den" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["1/3", "5/3", "16/3", "-3/3", "-5/3", "0/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.decrement(:den) |> Fraction.eq?(Fraction.new(o))
          end)                    
      end
      
      test "both" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["0/3", "4/3", "15/3", "-4/3", "-6/3", "-1/3"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.decrement(:both) |> Fraction.eq?(Fraction.new(o))
          end)                    
          
      end
      
      
      test "denominator to zero" do
          
          assert Fraction.new("3/1") |> Fraction.decrement(:den) == {:error, :invalid_denominator}
          assert Fraction.new("3/1") |> Fraction.decrement(:both) == {:error, :invalid_denominator}
          assert Fraction.new("-1/1") |> Fraction.decrement(:both) == {:error, :invalid_denominator}
          
      end
  end
  
  describe "floor/1" do
      test "value tests" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["0/4", "4/4", "16/4", "-4/4", "-8/4", "0/4"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.floor() |> Fraction.eq?(Fraction.new(o))
          end)
          
      end
  end
  
  describe "ceiling/1" do
      test "value tests" do
          ins = ["1/4", "5/4", "16/4", "-3/4", "-5/4", "0/4"]
          outs = ["4/4", "8/4", "16/4", "0/4", "-4/4", "0/4"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.ceiling() |> Fraction.eq?(Fraction.new(o))
          end)
          
      end          
  end
  
  describe "near_equal?/3" do
      test "value tests" do
          ins = [
              {"1/4", "2/4", 1}, {"-1/4", "3/4", 1}, {"-1/4", "-4/4", 1}, {"1/10", "2/10", "1/10"}, 
              {"1/12", "2/12", 0.1}, {"-1/4", "5/4", 1}, {"1/10", "3/10", "1/9"}, {"9/5", "7/5", "1/4"},
              {"1/5", "2/5", -0.5}
          ]
          outs = [
              true, true, true, true, 
              true, false, false, false,
              true
          ]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {{l, r, e}, o} -> 
              assert Fraction.near_equal?(Fraction.new(l), Fraction.new(r), Fraction.new(e)) == o
          end)
          
      end
  end
  
  describe "abs/1" do
      test "value tests" do
          ins = ["-3/4", "4/1", -3]
          outs = ["3/4", "4/1", "3/1"]
        
          Enum.zip(ins, outs)
          |> Enum.each(fn {i, o} -> 
              assert Fraction.new(i) |> Fraction.absolute_value() |> Fraction.eq?(Fraction.new(o))
          end)
          
      end
  end
  
  describe "String.Chars protocol" do
    test "to_string" do
      assert "#{Fraction.new(3, 5)}" == "3/5"
    end
  end

  describe "to_float/2" do
    test "zero" do
      assert Fraction.new(0, 3) |> Fraction.to_float() == 0.0
    end

    test "negative" do
      assert Fraction.new(-3, 4) |> Fraction.to_float() |> Math.floats_equal?(-0.75)
    end

    test "positive" do
      assert Fraction.new(1, 16) |> Fraction.to_float() |> Math.floats_equal?(0.0625)
    end

    test "precision" do
      assert Fraction.new(22, 7) |> Fraction.to_float() |> Math.floats_equal?(3.14) == false

      assert Fraction.new(22, 7)
             |> Fraction.to_float(precision: 2)
             |> Math.floats_equal?(3.14)
    end
  end

  describe "min_max_of/1" do
    test "empty" do
      assert Fraction.min_max_of([]) == {nil, nil}
    end

    test "one value" do
      assert Fraction.min_max_of(["1/2"]) ==
               {%Fraction{num: 1, den: 2}, %Fraction{num: 1, den: 2}}
    end

    test "two values" do
      assert Fraction.min_max_of([Fraction.new(1, 2), Fraction.new(4, 5)]) ==
               {%Fraction{num: 1, den: 2}, %Fraction{num: 4, den: 5}}
    end

    test "equal values" do
      assert Fraction.min_max_of(["1/2", "1/2", "1/2"]) ==
               {%Fraction{num: 1, den: 2}, %Fraction{num: 1, den: 2}}
    end

    test "multiple values" do
      fracs = 1..9 |> Enum.map(fn den -> Fraction.new(9, den) end)
      assert Fraction.min_max_of(fracs) == {%Fraction{num: 9, den: 9}, %Fraction{num: 9, den: 1}}
    end

    test "type mix" do
      assert Fraction.min_max_of([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == {%Fraction{num: 3, den: 7}, %Fraction{num: 9, den: 1}}
    end
  end

  describe "clamp/2" do
    @fracs ["-3", "-4/2", -1.5, 0, Fraction.new(3, 4), "4/2", 3.14]

    test "defaults" do
      assert Fraction.clamp(@fracs) == [
               %Fraction{num: 0, den: 1},
               %Fraction{num: 3, den: 4}
             ]
    end

    test "[vals]" do
      assert Fraction.clamp(
               @fracs,
               min: -2,
               max: 2,
               inclusive_min: true,
               inclusive_max: true
             ) == [
               %Fraction{num: -4, den: 2},
               %Fraction{num: -15, den: 10},
               %Fraction{num: 0, den: 1},
               %Fraction{num: 3, den: 4},
               %Fraction{num: 4, den: 2}
             ]
    end

    test "[vals] fractional bounsd" do
      assert Fraction.clamp(
               @fracs,
               min: -1.5,
               max: "3/4",
               inclusive_min: true,
               inclusive_max: true
             ) == [
               %Fraction{num: -15, den: 10},
               %Fraction{num: 0, den: 1},
               %Fraction{num: 3, den: 4}
             ]
    end

    test "[vals)" do
      assert Fraction.clamp(
               @fracs,
               min: -2,
               max: 2,
               inclusive_min: true,
               inclusive_max: false
             ) == [
               %Fraction{num: -4, den: 2},
               %Fraction{num: -15, den: 10},
               %Fraction{num: 0, den: 1},
               %Fraction{num: 3, den: 4}
             ]
    end

    test "(vals]" do
      assert Fraction.clamp(
               @fracs,
               min: -2,
               max: 2,
               inclusive_min: false,
               inclusive_max: true
             ) == [
               %Fraction{num: -15, den: 10},
               %Fraction{num: 0, den: 1},
               %Fraction{num: 3, den: 4},
               %Fraction{num: 4, den: 2}
             ]
    end

    test "(vals)" do
      assert Fraction.clamp(
               @fracs,
               min: -2,
               max: 2,
               inclusive_min: false,
               inclusive_max: false
             ) == [
               %Fraction{num: -15, den: 10},
               %Fraction{num: 0, den: 1},
               %Fraction{num: 3, den: 4}
             ]
    end
  end

  describe "sort/2" do
    test "empty" do
      assert Fraction.sort([]) == []
    end

    test "lte - type mix" do
      assert Fraction.sort([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == [
               %Fraction{num: 3, den: 7},
               %Fraction{num: 8, den: 11},
               %Fraction{num: 13, den: 10},
               %Fraction{num: 15, den: 10},
               %Fraction{num: 22, den: 7},
               %Fraction{num: 8, den: 1},
               %Fraction{num: 9, den: 1}
             ]
    end

    test "gte - type mix" do
      assert Fraction.sort(
               [
                 Fraction.new(3, 7),
                 1.5,
                 8,
                 "9",
                 "1.3",
                 "22/7",
                 {8, 11}
               ],
               sorter: &>=/2
             ) == [
               %Fraction{num: 9, den: 1},
               %Fraction{num: 8, den: 1},
               %Fraction{num: 22, den: 7},
               %Fraction{num: 15, den: 10},
               %Fraction{num: 13, den: 10},
               %Fraction{num: 8, den: 11},
               %Fraction{num: 3, den: 7}
             ]
    end
  end

  describe "uniq/2" do
    test "default by" do
      assert Fraction.uniq(["6/22", "4/2", "2/1", "42/21", "3/11"]) == [
               %Fraction{num: 6, den: 22},
               %Fraction{num: 4, den: 2}
             ]
    end

    test "by: :value" do
      assert Fraction.uniq(["4/10", "-3/9", "2/5", "-9/27"]) == [
               %Fraction{num: 4, den: 10},
               %Fraction{num: -3, den: 9}
             ]
    end

    test "by: :components" do
      assert Fraction.uniq(
               ["4/10", "-3/9", "2/5", "-9/27"],
               by: :components
             ) == [
               %Fraction{num: 4, den: 10},
               %Fraction{num: -3, den: 9},
               %Fraction{num: 2, den: 5},
               %Fraction{num: -9, den: 27}
             ]
    end

    test "type mix" do
      assert Fraction.uniq([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == [
               %Fraction{num: 3, den: 7},
               %Fraction{num: 15, den: 10},
               %Fraction{num: 8, den: 1},
               %Fraction{num: 9, den: 1},
               %Fraction{num: 13, den: 10},
               %Fraction{num: 22, den: 7},
               %Fraction{num: 8, den: 11}
             ]
    end
  end

  describe "fractionalize/1" do
    test "empty" do
      assert Fraction.fractionalize([]) == []
    end

    test "fraction struct transliteration" do
      assert Fraction.fractionalize([Fraction.new(2, 4), Fraction.new(8, 16)]) == [
               %Fraction{num: 2, den: 4},
               %Fraction{num: 8, den: 16}
             ]
    end

    test "type mix" do
      assert Fraction.fractionalize([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == [
               %Fraction{num: 3, den: 7},
               %Fraction{num: 15, den: 10},
               %Fraction{num: 8, den: 1},
               %Fraction{num: 9, den: 1},
               %Fraction{num: 13, den: 10},
               %Fraction{num: 22, den: 7},
               %Fraction{num: 8, den: 11}
             ]
    end
  end

  describe "max_of/2" do
    test "equal" do
      assert Fraction.max_of(Fraction.new(2, 4), Fraction.new(4, 8)) == Fraction.new(2, 4)
    end

    test "min last" do
      assert Fraction.max_of(Fraction.new(22, 7), Fraction.new(7, 22)) == Fraction.new(22, 7)
    end

    test "zeros" do
      assert Fraction.max_of(Fraction.new(7, 3), Fraction.new(0, 3)) == Fraction.new(7, 3)
    end

    test "negative" do
      assert Fraction.max_of(Fraction.new(-1, 3), Fraction.new(-3, 1)) == Fraction.new(-1, 3)
    end

    test "strings frac" do
      assert Fraction.max_of(Fraction.new(3, 4), "-1/3") == Fraction.new(3, 4)
      assert Fraction.max_of("3/7", Fraction.new(7, 4)) == Fraction.new(7, 4)
    end

    test "strings int" do
      assert Fraction.max_of(Fraction.new(3, 4), "-1") == Fraction.new(3, 4)
      assert Fraction.max_of("5", Fraction.new(7, 4)) == Fraction.new(5, 1)
    end

    test "strings float" do
      assert Fraction.max_of(Fraction.new(8, 3), "3.14") == Fraction.new(314, 100)
      assert Fraction.max_of("0.25", Fraction.new(0, 3)) == Fraction.new(25, 100)
      assert Fraction.max_of("0.25", Fraction.new(4, 3)) == Fraction.new(4, 3)
    end

    test "floats" do
      assert Fraction.max_of(1.3, Fraction.new(0, 3)) == Fraction.new(13, 10)
      assert Fraction.max_of(Fraction.new(7, 3), 1.25) == Fraction.new(7, 3)
    end

    test "ints" do
      assert Fraction.max_of(-3, Fraction.new(0, 3)) == Fraction.new(0, 3)
      assert Fraction.max_of(Fraction.new(0, 3), 4) == Fraction.new(4, 1)
    end
  end

  describe "min_of/2" do
    test "equal" do
      assert Fraction.min_of(Fraction.new(2, 4), Fraction.new(4, 8)) == Fraction.new(2, 4)
    end

    test "min last" do
      assert Fraction.min_of(Fraction.new(22, 7), Fraction.new(7, 22)) == Fraction.new(7, 22)
    end

    test "zeros" do
      assert Fraction.min_of(Fraction.new(7, 3), Fraction.new(0, 3)) == Fraction.new(0, 3)
    end

    test "negative" do
      assert Fraction.min_of(Fraction.new(-1, 3), Fraction.new(-3, 1)) == Fraction.new(-3, 1)
    end

    test "strings frac" do
      assert Fraction.min_of(Fraction.new(3, 4), "-1/3") == Fraction.new(-1, 3)
      assert Fraction.min_of("3/7", Fraction.new(7, 4)) == Fraction.new(3, 7)
    end

    test "strings int" do
      assert Fraction.min_of(Fraction.new(3, 4), "-1") == Fraction.new(-1, 1)
      assert Fraction.min_of("5", Fraction.new(7, 4)) == Fraction.new(7, 4)
    end

    test "strings float" do
      assert Fraction.min_of(Fraction.new(8, 3), "3.14") == Fraction.new(8, 3)
      assert Fraction.min_of("0.25", Fraction.new(0, 3)) == Fraction.new(0, 3)
      assert Fraction.min_of("0.25", Fraction.new(4, 3)) == Fraction.new(25, 100)
    end

    test "floats" do
      assert Fraction.min_of(1.3, Fraction.new(0, 3)) == Fraction.new(0, 3)
      assert Fraction.min_of(Fraction.new(7, 3), 1.25) == Fraction.new(125, 100)
    end

    test "ints" do
      assert Fraction.min_of(-3, Fraction.new(0, 3)) == Fraction.new(-3, 1)
      assert Fraction.min_of(Fraction.new(0, 3), 4) == Fraction.new(0, 3)
    end
  end

  describe "min_of/1" do
    test "single" do
      assert Fraction.min_of([Fraction.new(3, 4)]) == Fraction.new(3, 4)
    end

    test "equal fractions" do
      # should keep first min
      assert Fraction.min_of([Fraction.new(9, 16), Fraction.new(3, 4)]) |> Fraction.components() ==
               {9, 16}
    end

    test "out of order" do
      fracs = 9..1 |> Enum.map(fn d -> Fraction.new(1, d) end)
      assert Fraction.min_of(fracs) == Fraction.new(1, 9)
    end

    test "zero" do
      assert Fraction.min_of([Fraction.new(1, 3), Fraction.new(0, 4), Fraction.new(9, 1)]) ==
               Fraction.new(0, 4)
    end

    test "negative" do
      assert Fraction.min_of([Fraction.new(3, 1), Fraction.new("0/3"), Fraction.new(-3, 9)]) ==
               Fraction.new(-3, 9)
    end

    test "empty" do
      assert Fraction.min_of([]) == nil
    end

    test "type mix" do
      assert Fraction.min_of([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == Fraction.new(3, 7)
    end
  end

  describe "max_of/1" do
    test "single" do
      assert Fraction.max_of([Fraction.new(3, 4)]) == Fraction.new(3, 4)
    end

    test "equal fractions" do
      # should keep first min
      assert Fraction.max_of([Fraction.new(9, 16), Fraction.new(3, 4)]) |> Fraction.components() ==
               {3, 4}
    end

    test "out of order" do
      fracs = 9..1 |> Enum.map(fn d -> Fraction.new(1, d) end)
      assert Fraction.max_of(fracs) == Fraction.new(1, 1)
    end

    test "zero" do
      assert Fraction.max_of([Fraction.new(1, 3), Fraction.new(0, 4), Fraction.new(9, 1)]) ==
               Fraction.new(9, 1)
    end

    test "negative" do
      assert Fraction.max_of([Fraction.new(3, 1), Fraction.new("0/3"), Fraction.new(-3, 9)]) ==
               Fraction.new(3, 1)
    end

    test "empty" do
      assert Fraction.max_of([]) == nil
    end

    test "type mix" do
      assert Fraction.max_of([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == Fraction.new(9, 1)
    end
  end

  describe "sum/1" do
    test "unsimplified" do
      assert Fraction.sum([
               Fraction.new(1, 2),
               Fraction.new(2, 3),
               Fraction.new(3, 4),
               Fraction.new(4, 5),
               Fraction.new(17, 60),
               3
             ]) == Fraction.new(360, 60)
    end

    test "simplified" do
      assert Fraction.sum(
               [
                 Fraction.new(1, 2),
                 Fraction.new(2, 3),
                 Fraction.new(3, 4),
                 Fraction.new(4, 5),
                 Fraction.new(17, 60),
                 3
               ],
               simplify: true
             ) == Fraction.new(6, 1)
    end

    test "type mix" do
      assert Fraction.sum([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == %Fraction{num: 18556, den: 770}
    end
  end

  describe "normalize_all/1" do
    test "all fractions" do
      assert Fraction.normalize_all([
               Fraction.new(1, 2),
               Fraction.new(2, 3),
               Fraction.new(3, 4),
               Fraction.new(4, 5)
             ]) == [
               %Fraction{num: 30, den: 60},
               %Fraction{num: 40, den: 60},
               %Fraction{num: 45, den: 60},
               %Fraction{num: 48, den: 60}
             ]
    end

    test "type mix" do
      assert Fraction.normalize_all([
               Fraction.new(3, 7),
               1.5,
               8,
               "9",
               "1.3",
               "22/7",
               {8, 11}
             ]) == [
               %Fraction{num: 330, den: 770},
               %Fraction{num: 1155, den: 770},
               %Fraction{num: 6160, den: 770},
               %Fraction{num: 6930, den: 770},
               %Fraction{num: 1001, den: 770},
               %Fraction{num: 2420, den: 770},
               %Fraction{num: 560, den: 770}
             ]
    end
  end

  describe "comparators" do
    test "gt?(int, frac)" do
      test_cases = [
        %{left: -3, right: {3, 4}, result: false},
        %{left: 0, right: {3, 4}, result: false},
        %{left: 1, right: {0, 4}, result: true},
        %{left: 1, right: {4, 4}, result: false},
        %{left: 3, right: {3, 4}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.gt?(left, right) == test_case.result
      end)
    end

    test "gt?(frac, int)" do
      test_cases = [
        %{left: {-3, 4}, right: 2, result: false},
        %{left: {0, 4}, right: 2, result: false},
        %{left: {0, 4}, right: 0, result: false},
        %{left: {1, 2}, right: 2, result: false},
        %{left: {4, 2}, right: 2, result: false},
        %{left: {5, 2}, right: 2, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.gt?(left, right) == test_case.result
      end)
    end

    test "gt?(frac, frac)" do
      test_cases = [
        %{left: {-3, 4}, right: {3, 4}, result: false},
        %{left: {0, 4}, right: {3, 4}, result: false},
        %{left: {0, 4}, right: {0, 4}, result: false},
        %{left: {1, 2}, right: {2, 4}, result: false},
        %{left: {4, 2}, right: {8, 4}, result: false},
        %{left: {5, 2}, right: {3, 4}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = Fraction.new(test_case.right)

        assert Fraction.gt?(left, right) == test_case.result
      end)
    end

    test "gt?(_, frac)" do
      test_cases = [
        %{left: Fraction.new(3, 7), right: {2, 1}, result: false},
        %{left: 1.5, right: {2, 1}, result: false},
        %{left: 8, right: {2, 1}, result: true},
        %{left: "9", right: {2, 1}, result: true},
        %{left: "1.3", right: {2, 1}, result: false},
        %{left: "22/7", right: {2, 1}, result: true},
        %{left: {8, 11}, right: {2, 1}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.gt?(left, right) == test_case.result
      end)
    end

    test "gt?(frac, _)" do
      test_cases = [
        %{right: Fraction.new(3, 7), left: {2, 1}, result: true},
        %{right: 1.5, left: {2, 1}, result: true},
        %{right: 8, left: {2, 1}, result: false},
        %{right: "9", left: {2, 1}, result: false},
        %{right: "1.3", left: {2, 1}, result: true},
        %{right: "22/7", left: {2, 1}, result: false},
        %{right: {8, 11}, left: {2, 1}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.gt?(left, right) == test_case.result
      end)
    end

    test "gte?(int, frac)" do
      test_cases = [
        %{left: -3, right: {3, 4}, result: false},
        %{left: 0, right: {3, 4}, result: false},
        %{left: 1, right: {0, 4}, result: true},
        %{left: 1, right: {4, 4}, result: true},
        %{left: 3, right: {3, 4}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.gte?(left, right) == test_case.result
      end)
    end

    test "gte?(frac, int)" do
      test_cases = [
        %{left: {-3, 4}, right: 2, result: false},
        %{left: {0, 4}, right: 2, result: false},
        %{left: {0, 4}, right: 0, result: true},
        %{left: {1, 2}, right: 2, result: false},
        %{left: {4, 2}, right: 2, result: true},
        %{left: {5, 2}, right: 2, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.gte?(left, right) == test_case.result
      end)
    end

    test "gte?(frac, frac)" do
      test_cases = [
        %{left: {-3, 4}, right: {3, 4}, result: false},
        %{left: {0, 4}, right: {3, 4}, result: false},
        %{left: {0, 4}, right: {0, 4}, result: true},
        %{left: {1, 2}, right: {2, 4}, result: true},
        %{left: {4, 2}, right: {8, 4}, result: true},
        %{left: {5, 2}, right: {3, 4}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = Fraction.new(test_case.right)

        assert Fraction.gte?(left, right) == test_case.result
      end)
    end

    test "gte?(_, frac)" do
      test_cases = [
        %{left: Fraction.new(3, 7), right: {2, 1}, result: false},
        %{left: 1.5, right: {2, 1}, result: false},
        %{left: 8, right: {2, 1}, result: true},
        %{left: "9", right: {2, 1}, result: true},
        %{left: "1.3", right: {2, 1}, result: false},
        %{left: "22/7", right: {2, 1}, result: true},
        %{left: {8, 11}, right: {2, 1}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.gte?(left, right) == test_case.result
      end)
    end

    test "gte?(frac, _)" do
      test_cases = [
        %{right: Fraction.new(3, 7), left: {2, 1}, result: true},
        %{right: 1.5, left: {2, 1}, result: true},
        %{right: 8, left: {2, 1}, result: false},
        %{right: "9", left: {2, 1}, result: false},
        %{right: "1.3", left: {2, 1}, result: true},
        %{right: "22/7", left: {2, 1}, result: false},
        %{right: {8, 11}, left: {2, 1}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.gte?(left, right) == test_case.result
      end)
    end

    test "lt?(int, frac)" do
      test_cases = [
        %{left: -3, right: {3, 4}, result: true},
        %{left: 0, right: {3, 4}, result: true},
        %{left: 1, right: {0, 4}, result: false},
        %{left: 1, right: {4, 4}, result: false},
        %{left: 3, right: {3, 4}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.lt?(left, right) == test_case.result
      end)
    end

    test "lt?(frac, int)" do
      test_cases = [
        %{left: {-3, 4}, right: 2, result: true},
        %{left: {0, 4}, right: 2, result: true},
        %{left: {0, 4}, right: 0, result: false},
        %{left: {1, 2}, right: 2, result: true},
        %{left: {4, 2}, right: 2, result: false},
        %{left: {5, 2}, right: 2, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.lt?(left, right) == test_case.result
      end)
    end

    test "lt?(frac, frac)" do
      test_cases = [
        %{left: {-3, 4}, right: {3, 4}, result: true},
        %{left: {0, 4}, right: {3, 4}, result: true},
        %{left: {0, 4}, right: {0, 4}, result: false},
        %{left: {1, 2}, right: {2, 4}, result: false},
        %{left: {4, 2}, right: {8, 4}, result: false},
        %{left: {5, 2}, right: {3, 4}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = Fraction.new(test_case.right)

        assert Fraction.lt?(left, right) == test_case.result
      end)
    end

    test "lt?(_, frac)" do
      test_cases = [
        %{left: Fraction.new(3, 7), right: {2, 1}, result: true},
        %{left: 1.5, right: {2, 1}, result: true},
        %{left: 8, right: {2, 1}, result: false},
        %{left: "9", right: {2, 1}, result: false},
        %{left: "1.3", right: {2, 1}, result: true},
        %{left: "22/7", right: {2, 1}, result: false},
        %{left: {8, 11}, right: {2, 1}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.lt?(left, right) == test_case.result
      end)
    end

    test "lt?(frac, _)" do
      test_cases = [
        %{right: Fraction.new(3, 7), left: {2, 1}, result: false},
        %{right: 1.5, left: {2, 1}, result: false},
        %{right: 8, left: {2, 1}, result: true},
        %{right: "9", left: {2, 1}, result: true},
        %{right: "1.3", left: {2, 1}, result: false},
        %{right: "22/7", left: {2, 1}, result: true},
        %{right: {8, 11}, left: {2, 1}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.lt?(left, right) == test_case.result
      end)
    end

    test "lte?(int, frac)" do
      test_cases = [
        %{left: -3, right: {3, 4}, result: true},
        %{left: 0, right: {3, 4}, result: true},
        %{left: 1, right: {0, 4}, result: false},
        %{left: 1, right: {4, 4}, result: true},
        %{left: 3, right: {3, 4}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.lte?(left, right) == test_case.result
      end)
    end

    test "lte?(frac, int)" do
      test_cases = [
        %{left: {-3, 4}, right: 2, result: true},
        %{left: {0, 4}, right: 2, result: true},
        %{left: {0, 4}, right: 0, result: true},
        %{left: {1, 2}, right: 2, result: true},
        %{left: {4, 2}, right: 2, result: true},
        %{left: {5, 2}, right: 2, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.lte?(left, right) == test_case.result
      end)
    end

    test "lte?(frac, frac)" do
      test_cases = [
        %{left: {-3, 4}, right: {3, 4}, result: true},
        %{left: {0, 4}, right: {3, 4}, result: true},
        %{left: {0, 4}, right: {0, 4}, result: true},
        %{left: {1, 2}, right: {2, 4}, result: true},
        %{left: {4, 2}, right: {8, 4}, result: true},
        %{left: {5, 2}, right: {3, 4}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = Fraction.new(test_case.right)

        assert Fraction.lte?(left, right) == test_case.result
      end)
    end

    test "lte?(_, frac)" do
      test_cases = [
        %{left: Fraction.new(3, 7), right: {2, 1}, result: true},
        %{left: 1.5, right: {2, 1}, result: true},
        %{left: 8, right: {2, 1}, result: false},
        %{left: "9", right: {2, 1}, result: false},
        %{left: "1.3", right: {2, 1}, result: true},
        %{left: "22/7", right: {2, 1}, result: false},
        %{left: {8, 11}, right: {2, 1}, result: true}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.lte?(left, right) == test_case.result
      end)
    end

    test "lte?(frac, _)" do
      test_cases = [
        %{right: Fraction.new(3, 7), left: {2, 1}, result: false},
        %{right: 1.5, left: {2, 1}, result: false},
        %{right: 8, left: {2, 1}, result: true},
        %{right: "9", left: {2, 1}, result: true},
        %{right: "1.3", left: {2, 1}, result: false},
        %{right: "22/7", left: {2, 1}, result: true},
        %{right: {8, 11}, left: {2, 1}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.lte?(left, right) == test_case.result
      end)
    end

    test "eq?(int, frac)" do
      test_cases = [
        %{left: -3, right: {3, 4}, result: false},
        %{left: 0, right: {3, 4}, result: false},
        %{left: 1, right: {0, 4}, result: false},
        %{left: 1, right: {4, 4}, result: true},
        %{left: 3, right: {3, 4}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.eq?(left, right) == test_case.result
      end)
    end

    test "eq?(frac, int)" do
      test_cases = [
        %{left: {-3, 4}, right: 2, result: false},
        %{left: {0, 4}, right: 2, result: false},
        %{left: {0, 4}, right: 0, result: true},
        %{left: {1, 2}, right: 2, result: false},
        %{left: {4, 2}, right: 2, result: true},
        %{left: {5, 2}, right: 2, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.eq?(left, right) == test_case.result
      end)
    end

    test "eq?(frac, frac)" do
      test_cases = [
        %{left: {-3, 4}, right: {3, 4}, result: false},
        %{left: {0, 4}, right: {3, 4}, result: false},
        %{left: {0, 4}, right: {0, 4}, result: true},
        %{left: {1, 2}, right: {2, 4}, result: true},
        %{left: {4, 2}, right: {8, 4}, result: true},
        %{left: {5, 2}, right: {3, 4}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = Fraction.new(test_case.right)

        assert Fraction.eq?(left, right) == test_case.result
      end)
    end

    test "eq?(_, frac)" do
      test_cases = [
        %{left: Fraction.new(3, 7), right: {2, 1}, result: false},
        %{left: 1.5, right: {2, 1}, result: false},
        %{left: 8, right: {2, 1}, result: false},
        %{left: "9", right: {2, 1}, result: false},
        %{left: "1.3", right: {2, 1}, result: false},
        %{left: "22/7", right: {2, 1}, result: false},
        %{left: {8, 11}, right: {2, 1}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = test_case.left
        right = Fraction.new(test_case.right)

        assert Fraction.eq?(left, right) == test_case.result
      end)
    end

    test "eq?(frac, _)" do
      test_cases = [
        %{right: Fraction.new(3, 7), left: {2, 1}, result: false},
        %{right: 1.5, left: {2, 1}, result: false},
        %{right: 8, left: {2, 1}, result: false},
        %{right: "9", left: {2, 1}, result: false},
        %{right: "1.3", left: {2, 1}, result: false},
        %{right: "22/7", left: {2, 1}, result: false},
        %{right: {8, 11}, left: {2, 1}, result: false}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        left = Fraction.new(test_case.left)
        right = test_case.right

        assert Fraction.eq?(left, right) == test_case.result
      end)
    end
  end

  describe "is_positive?" do
    test "pos" do
      assert Fraction.is_positive?(Fraction.new(3, 5))
    end

    test "neg" do
      assert Fraction.is_positive?(Fraction.new(-3, 5)) == false
    end

    test "zero" do
      assert Fraction.is_positive?(Fraction.new(0, 5))
    end
  end

  describe "is_negative?" do
    test "pos" do
      assert Fraction.is_negative?(Fraction.new(3, 5)) == false
    end

    test "neg" do
      assert Fraction.is_negative?(Fraction.new(-3, 5))
    end

    test "zero" do
      assert Fraction.is_negative?(Fraction.new(0, 5)) == false
    end
  end

  describe "normalize" do
    test "identical base" do
      assert Fraction.normalize(
               Fraction.new(3, 5),
               Fraction.new(7, 5)
             ) == {
               %Fraction{num: 3, den: 5},
               %Fraction{num: 7, den: 5}
             }
    end

    test "pos, pos" do
      assert Fraction.normalize(
               Fraction.new(5, 7),
               Fraction.new(11, 3)
             ) == {
               %Fraction{num: 15, den: 21},
               %Fraction{num: 77, den: 21}
             }
    end

    test "neg, pos" do
      assert Fraction.normalize(
               Fraction.new(-3, 5),
               Fraction.new(7, 3)
             ) == {
               %Fraction{num: -9, den: 15},
               %Fraction{num: 35, den: 15}
             }
    end

    test "neg, neg" do
      assert Fraction.normalize(
               Fraction.new(-4, 3),
               Fraction.new(-6, 9)
             ) == {
               %Fraction{num: -12, den: 9},
               %Fraction{num: -6, den: 9}
             }
    end

    test "int, frac" do
      assert Fraction.normalize(
               3,
               Fraction.new(7, 5)
             ) == {
               %Fraction{num: 15, den: 5},
               %Fraction{num: 7, den: 5}
             }
    end

    test "frac, int" do
      assert Fraction.normalize(
               Fraction.new(3, 5),
               6
             ) == {
               %Fraction{num: 3, den: 5},
               %Fraction{num: 30, den: 5}
             }
    end
  end

  describe "power/3 - reducables" do
    # These are fractionals that _should_ have proper roots

    test "need simplification" do
        ins = [{"80/5", "1/4"}]
        outs = ["2/1"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)
    end
    
  end
  
  describe "power/3 - coercion values" do
    test "string ^ string" do
        ins = [{"2", "8/4"}, {"4/5", "3"}]
        outs = ["4/1", "64/125"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)
    end
    
    test "string ^ int" do
        ins = [{"2/1", 3}, {"4/5", 2}]
        outs = ["8/1", "16/25"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)        
    end
    
    test "string ^ float" do
        ins = [{"16", 0.5}, {"4/5", 3.0}]
        outs = ["4/1", "64/125"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            # IO.puts("#{b}^#{e} == #{o}")
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)
    end
    
    test "int ^ string" do
        ins = [{64, "1/3"}, {4, "0.5"}]
        outs = ["4/1", "2/1"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)        
    end
    
    test "int ^ float" do
        ins = [{16, 0.5}, {4, 3.5}]
        outs = ["4/1", "128/1"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)
    end
    
    test "float ^ string" do
        ins = [{16.0, "1/2"}, {0.8, "3.0"}]
        outs = ["4/1", "64/125"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)
    end
    
    test "float ^ int" do
        ins = [{0.75, 2}, {-3.5, 4}]
        outs = ["9/16", "2401/16"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)
    end    
    
    test "float ^ float" do
        ins = [{0.75, 2.0}, {-3.5, 4.0}]
        outs = ["9/16", "2401/16"]
        
        Enum.zip(ins, outs)
        |> Enum.each(fn {{b, e}, o} -> 
            assert Fraction.power(b, e, simplify: true) |> Fraction.eq?(Fraction.new(o))
        end)        
    end
  end
  
  describe "power/3 - frac ^ frac" do
    test "fractional roots" do
      test_cases = [
        %{fraction: {4, 16}, power: {1, 2}, result: {1, 2}, opts: []},
        %{fraction: {4, 16}, power: {1, 2}, result: {1, 2}, opts: [simplify: true]},
        %{fraction: {8, 27}, power: {1, 3}, result: {2, 3}, opts: []},
        %{fraction: {8, 8}, power: {2, 3}, result: {1, 1}, opts: []},
        %{fraction: {8, 8}, power: {2, 3}, result: {1, 1}, opts: [simplify: true]},

        # so. SO. I randomly plugged these in for the "irrationals, not allowed" section. Pulled
        # the number out of thin air. Turns out, 7 and 32 both have 30th powers with 5th roots. 
        %{fraction: {7, 32}, power: {30, 5}, result: {117_649, 1_073_741_824}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = Fraction.new(test_case.power)

        assert Fraction.power(f_a, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(f_a, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "irrational roots - not allowed" do
      test_cases = [
        %{fraction: {4, 27}, power: {3, 2}},
        %{fraction: {7, 32}, power: {31, 5}}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = Fraction.new(test_case.power)

        assert Fraction.power(f_a, pow) == {:error, :no_fractional_power}
      end)
    end

    test "irrational roots - allowed" do
      test_cases = [
        %{
          fraction: {4, 27},
          power: {3, 2},
          result: 0.05702224880885193,
          opts: [allow_irrational: true]
        },
        %{
          fraction: {7, 32},
          power: {31, 5},
          result: 8.08496199028741e-5,
          opts: [allow_irrational: true]
        },
        %{
          fraction: {7, 32},
          power: {-17, 5},
          result: 175.45937993085406,
          opts: [allow_irrational: true]
        }
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = Fraction.new(test_case.power)

        assert Fraction.power(f_a, pow, test_case.opts) == test_case.result
      end)
    end

    test "frac ^ (0/pos)" do
      assert Fraction.power(Fraction.new(3, 34), Fraction.new(0, 4)) == Fraction.new(1, 1)
    end
  end

  describe "power/3 - int ^ frac" do
    test "int^(pos/pos)" do
      test_cases = [
        %{base: 4, power: {4, 8}, result: {2, 1}, opts: []},
        %{base: 2, power: {10, 5}, result: {4, 1}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        base = test_case.base
        pow = Fraction.new(test_case.power)

        assert Fraction.power(base, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(base, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "int^(neg/pos)" do
      test_cases = [
        %{base: 4, power: {-4, 8}, result: {1, 2}, opts: []},
        %{base: 2, power: {-10, 5}, result: {1, 4}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        base = test_case.base
        pow = Fraction.new(test_case.power)

        assert Fraction.power(base, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(base, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "int^(0/pos)" do
      assert Fraction.power(7, Fraction.new(0, 4)) == Fraction.new(1, 1)
    end

    test "int^frac - irrationals not allowed" do
      assert Fraction.power(9, Fraction.new(7, 13)) == {:error, :no_fractional_power}
    end

    test "int^frac - irrationals allowed" do
      assert Fraction.power(9, Fraction.new(7, 13), allow_irrational: true) == 3.26454673038995
    end
  end

  describe "power/2 - frac ^ int" do
    test "pos/pos ^ pos" do
      test_cases = [
        %{fraction: {1, 3}, power: 3, result: {1, 27}, opts: []},
        %{fraction: {3, 5}, power: 3, result: {27, 125}, opts: []},
        %{fraction: {2, 4}, power: 2, result: {4, 16}, opts: []},
        %{fraction: {2, 4}, power: 2, result: {1, 4}, opts: [simplify: true]},
        %{fraction: {4, 3}, power: 3, result: {64, 27}, opts: []},
        %{fraction: {0, 3}, power: 2, result: {0, 9}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = test_case.power

        assert Fraction.power(f_a, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(f_a, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "neg/pos ^ pos" do
      test_cases = [
        %{fraction: {-1, 3}, power: 3, result: {-1, 27}, opts: []},
        %{fraction: {-3, 5}, power: 3, result: {-27, 125}, opts: []},
        %{fraction: {-2, 4}, power: 2, result: {4, 16}, opts: []},
        %{fraction: {-2, 4}, power: 2, result: {1, 4}, opts: [simplify: true]},
        %{fraction: {-4, 3}, power: 3, result: {-64, 27}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = test_case.power

        assert Fraction.power(f_a, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(f_a, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "pos/pos ^ neg" do
      test_cases = [
        %{fraction: {1, 3}, power: -3, result: {27, 1}, opts: []},
        %{fraction: {3, 5}, power: -3, result: {125, 27}, opts: []},
        %{fraction: {2, 4}, power: -2, result: {16, 4}, opts: []},
        %{fraction: {2, 4}, power: -2, result: {4, 1}, opts: [simplify: true]},
        %{fraction: {4, 3}, power: -3, result: {27, 64}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = test_case.power

        assert Fraction.power(f_a, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(f_a, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "neg/pos ^ neg" do
      test_cases = [
        %{fraction: {-1, 3}, power: -3, result: {-27, 1}, opts: []},
        %{fraction: {-3, 5}, power: -3, result: {-125, 27}, opts: []},
        %{fraction: {-2, 4}, power: -2, result: {16, 4}, opts: []},
        %{fraction: {-2, 4}, power: -2, result: {4, 1}, opts: [simplify: true]},
        %{fraction: {-4, 3}, power: -3, result: {-27, 64}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)
        pow = test_case.power

        assert Fraction.power(f_a, pow, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.power(f_a, pow, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "0/pos ^ neg" do
      z_f = Fraction.new(0, 3)

      assert z_f |> Fraction.power(-3) == {:error, :invalid_denominator}
    end
  end

  describe "reciprocal/2" do
    test "reciprocals" do
      test_cases = [
        # positive
        %{fraction: {3, 4}, result: {4, 3}, opts: []},
        %{fraction: {6, 4}, result: {4, 6}, opts: []},
        %{fraction: {6, 4}, result: {2, 3}, opts: [simplify: true]},

        # negative
        %{fraction: {-3, 4}, result: {-4, 3}, opts: []},
        %{fraction: {-4, 8}, result: {-8, 4}, opts: []},
        %{fraction: {-4, 8}, result: {-2, 1}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.fraction)

        assert Fraction.reciprocal(f_a, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.reciprocal(f_a, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "reciprocal of zero" do
      assert Fraction.new(0, 3) |> Fraction.reciprocal() == {:error, :invalid_denominator}
    end
  end

  describe "divide/*" do
    test "frac / frac" do
      test_cases = [
        # pos / pos == pos
        %{left: {3, 4}, right: {1, 2}, result: {6, 4}, opts: []},
        %{left: {3, 4}, right: {1, 2}, result: {3, 2}, opts: [simplify: true]},
        %{left: {4, 1}, right: {3, 4}, result: {16, 3}, opts: []},
        %{left: {8, 7}, right: {7, 3}, result: {24, 49}, opts: []},

        # pos / neg == neg
        %{left: {3, 4}, right: {-7, 2}, result: {-6, 28}, opts: []},
        %{left: {3, 4}, right: {-7, 2}, result: {-3, 14}, opts: [simplify: true]},
        %{left: {0, 3}, right: {-3, 4}, result: {0, 9}, opts: []},

        # neg / pos == neg
        %{left: {-6, 11}, right: {4, 9}, result: {-54, 44}, opts: []},
        %{left: {-6, 11}, right: {4, 9}, result: {-27, 22}, opts: [simplify: true]},

        # nev / neg == pos
        %{left: {-3, 7}, right: {-11, 2}, result: {6, 77}, opts: []},
        %{left: {-11, 3}, right: {-11, 3}, result: {33, 33}, opts: []},
        %{left: {-11, 3}, right: {-11, 3}, result: {1, 1}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.divide(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.divide(f_a, f_b, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "frac / int" do
      test_cases = [
        # pos / pos == pos
        %{left: {3, 4}, right: 3, result: {3, 12}, opts: []},
        %{left: {3, 4}, right: 3, result: {1, 4}, opts: [simplify: true]},
        %{left: {4, 1}, right: 7, result: {4, 7}, opts: []},
        %{left: {8, 7}, right: 11, result: {8, 77}, opts: []},

        # pos / neg == neg
        %{left: {3, 4}, right: -3, result: {-3, 12}, opts: []},
        %{left: {3, 4}, right: -3, result: {-1, 4}, opts: [simplify: true]},
        %{left: {0, 3}, right: -7, result: {0, 21}, opts: []},

        # neg / pos == neg
        %{left: {-6, 11}, right: 4, result: {-6, 44}, opts: []},
        %{left: {-6, 11}, right: 4, result: {-3, 22}, opts: [simplify: true]},

        # nev / neg == pos
        %{left: {-3, 7}, right: -3, result: {3, 21}, opts: []},
        %{left: {-3, 7}, right: -3, result: {1, 7}, opts: [simplify: true]},
        %{left: {-11, 3}, right: -11, result: {11, 33}, opts: []},
        %{left: {-11, 3}, right: -11, result: {1, 3}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.divide(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.divide(f_a, f_b, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "int / frac" do
      test_cases = [
        # pos / pos == pos
        %{left: 3, right: {1, 2}, result: {6, 1}, opts: []},
        %{left: 4, right: {4, 2}, result: {2, 1}, opts: [simplify: true]},
        %{left: 5, right: {3, 4}, result: {20, 3}, opts: []},
        %{left: 9, right: {7, 3}, result: {27, 7}, opts: []},

        # pos / neg == neg
        %{left: 14, right: {-7, 2}, result: {-28, 7}, opts: []},
        %{left: 14, right: {-7, 2}, result: {-4, 1}, opts: [simplify: true]},
        %{left: 0, right: {-3, 4}, result: {0, 3}, opts: []},

        # neg / pos == neg
        %{left: -6, right: {4, 9}, result: {-54, 4}, opts: []},
        %{left: -6, right: {4, 9}, result: {-27, 2}, opts: [simplify: true]},

        # nev / neg == pos
        %{left: -3, right: {-11, 2}, result: {6, 11}, opts: []},
        %{left: -11, right: {-11, 3}, result: {33, 11}, opts: []},
        %{left: -11, right: {-11, 3}, result: {3, 1}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.divide(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)

        assert Fraction.divide(f_a, f_b, test_case.opts) |> Fraction.components() ==
                 test_case.result
      end)
    end

    test "zeros" do
      f_a = Fraction.new(3, 2)
      f_b = Fraction.new(0, 3)

      assert Fraction.divide(f_b, f_a) |> Fraction.components() == {0, 9}
      assert Fraction.divide(f_a, f_b) == {:error, :invalid_denominator}
    end

    test "type mixing frac / _" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.divide(Fraction.new(3, 4), val)
      end)
    end

    test "type mixing _ / frac" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.divide(val, Fraction.new(3, 4))
      end)
    end
  end

  describe "multiply/*" do
    test "frac * frac" do
      test_cases = [
        # pos * pos
        %{left: {3, 4}, right: {4, 4}, result: {12, 16}, opts: []},
        %{left: {3, 4}, right: {4, 4}, result: {3, 4}, opts: [simplify: true]},
        %{left: {3, 4}, right: {5, 7}, result: {15, 28}, opts: []},
        %{left: {6, 4}, right: {9, 4}, result: {54, 16}, opts: []},
        %{left: {6, 4}, right: {9, 4}, result: {27, 8}, opts: [simplify: true]},

        # neg * pos
        %{left: {-3, 4}, right: {4, 4}, result: {-12, 16}, opts: []},
        %{left: {-3, 4}, right: {4, 4}, result: {-3, 4}, opts: [simplify: true]},
        %{left: {-3, 4}, right: {5, 7}, result: {-15, 28}, opts: []},
        %{left: {-6, 4}, right: {9, 4}, result: {-54, 16}, opts: []},
        %{left: {-6, 4}, right: {9, 4}, result: {-27, 8}, opts: [simplify: true]},

        # pos * neg
        %{left: {3, 4}, right: {-4, 4}, result: {-12, 16}, opts: []},
        %{left: {3, 4}, right: {-4, 4}, result: {-3, 4}, opts: [simplify: true]},
        %{left: {3, 4}, right: {-5, 7}, result: {-15, 28}, opts: []},
        %{left: {6, 4}, right: {-9, 4}, result: {-54, 16}, opts: []},
        %{left: {6, 4}, right: {-9, 4}, result: {-27, 8}, opts: [simplify: true]},

        # neg * neg
        %{left: {-3, 4}, right: {-4, 4}, result: {12, 16}, opts: []},
        %{left: {-3, 4}, right: {-4, 4}, result: {3, 4}, opts: [simplify: true]},
        %{left: {-3, 4}, right: {-5, 7}, result: {15, 28}, opts: []},
        %{left: {-6, 4}, right: {-9, 4}, result: {54, 16}, opts: []},
        %{left: {-6, 4}, right: {-9, 4}, result: {27, 8}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.multiply(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "frac * int" do
      test_cases = [
        # pos * pos
        %{left: {3, 4}, right: 4, result: {12, 4}, opts: []},
        %{left: {3, 4}, right: 4, result: {3, 1}, opts: [simplify: true]},
        %{left: {3, 4}, right: 3, result: {9, 4}, opts: []},
        %{left: {6, 4}, right: 8, result: {48, 4}, opts: []},
        %{left: {6, 4}, right: 8, result: {12, 1}, opts: [simplify: true]},

        # neg * pos
        %{left: {-3, 4}, right: 4, result: {-12, 4}, opts: []},
        %{left: {-3, 4}, right: 4, result: {-3, 1}, opts: [simplify: true]},
        %{left: {-3, 4}, right: 5, result: {-15, 4}, opts: []},
        %{left: {-6, 4}, right: 7, result: {-42, 4}, opts: []},
        %{left: {-6, 4}, right: 7, result: {-21, 2}, opts: [simplify: true]},

        # pos * neg
        %{left: {3, 4}, right: -4, result: {-12, 4}, opts: []},
        %{left: {3, 4}, right: -4, result: {-3, 1}, opts: [simplify: true]},
        %{left: {3, 4}, right: -5, result: {-15, 4}, opts: []},
        %{left: {6, 4}, right: -9, result: {-54, 4}, opts: []},
        %{left: {6, 4}, right: -9, result: {-27, 2}, opts: [simplify: true]},

        # neg * neg
        %{left: {-3, 4}, right: -4, result: {12, 4}, opts: []},
        %{left: {-3, 4}, right: -4, result: {3, 1}, opts: [simplify: true]},
        %{left: {-3, 4}, right: -5, result: {15, 4}, opts: []},
        %{left: {-6, 4}, right: -9, result: {54, 4}, opts: []},
        %{left: {-6, 4}, right: -9, result: {27, 2}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.multiply(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "int * frac" do
      test_cases = [
        # pos * pos
        %{right: {3, 4}, left: 4, result: {12, 4}, opts: []},
        %{right: {3, 4}, left: 4, result: {3, 1}, opts: [simplify: true]},
        %{right: {3, 4}, left: 3, result: {9, 4}, opts: []},
        %{right: {6, 4}, left: 8, result: {48, 4}, opts: []},
        %{right: {6, 4}, left: 8, result: {12, 1}, opts: [simplify: true]},

        # neg * pos
        %{right: {-3, 4}, left: 4, result: {-12, 4}, opts: []},
        %{right: {-3, 4}, left: 4, result: {-3, 1}, opts: [simplify: true]},
        %{right: {-3, 4}, left: 5, result: {-15, 4}, opts: []},
        %{right: {-6, 4}, left: 7, result: {-42, 4}, opts: []},
        %{right: {-6, 4}, left: 7, result: {-21, 2}, opts: [simplify: true]},

        # pos * neg
        %{right: {3, 4}, left: -4, result: {-12, 4}, opts: []},
        %{right: {3, 4}, left: -4, result: {-3, 1}, opts: [simplify: true]},
        %{right: {3, 4}, left: -5, result: {-15, 4}, opts: []},
        %{right: {6, 4}, left: -9, result: {-54, 4}, opts: []},
        %{right: {6, 4}, left: -9, result: {-27, 2}, opts: [simplify: true]},

        # neg * neg
        %{right: {-3, 4}, left: -4, result: {12, 4}, opts: []},
        %{right: {-3, 4}, left: -4, result: {3, 1}, opts: [simplify: true]},
        %{right: {-3, 4}, left: -5, result: {15, 4}, opts: []},
        %{right: {-6, 4}, left: -9, result: {54, 4}, opts: []},
        %{right: {-6, 4}, left: -9, result: {27, 2}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.multiply(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "type mixing frac * _" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.multiply(Fraction.new(3, 4), val)
      end)
    end

    test "type mixing _ * frac" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.multiply(val, Fraction.new(3, 4))
      end)
    end
  end

  describe "subtract/*" do
    test "frac - frac" do
      test_cases = [
        # pos - pos == pos
        %{left: {3, 5}, right: {1, 5}, result: {2, 5}, opts: []},
        %{left: {7, 3}, right: {1, 9}, result: {20, 9}, opts: []},
        %{left: {8, 3}, right: {3, 9}, result: {21, 9}, opts: []},
        %{left: {8, 3}, right: {3, 9}, result: {7, 3}, opts: [simplify: true]},

        # pos - pos == neg
        %{left: {1, 3}, right: {9, 9}, result: {-6, 9}, opts: []},
        %{left: {1, 3}, right: {9, 9}, result: {-2, 3}, opts: [simplify: true]},

        # pos - neg == pos
        %{left: {1, 3}, right: {-6, 9}, result: {9, 9}, opts: []},
        %{left: {1, 3}, right: {-6, 9}, result: {1, 1}, opts: [simplify: true]},

        # neg - pos == neg
        %{left: {-1, 3}, right: {6, 9}, result: {-9, 9}, opts: []},
        %{left: {-1, 3}, right: {6, 9}, result: {-1, 1}, opts: [simplify: true]},

        # neg - neg
        %{left: {-1, 3}, right: {-6, 9}, result: {3, 9}, opts: []},
        %{left: {-1, 3}, right: {-6, 9}, result: {1, 3}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.subtract(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "int - frac" do
      test_cases = [
        # pos - pos == pos
        %{left: 3, right: {1, 5}, result: {14, 5}, opts: []},
        %{left: 1, right: {3, 9}, result: {6, 9}, opts: []},
        %{left: 1, right: {3, 9}, result: {2, 3}, opts: [simplify: true]},

        # pos - pos == neg
        %{left: 1, right: {15, 9}, result: {-6, 9}, opts: []},
        %{left: 1, right: {15, 9}, result: {-2, 3}, opts: [simplify: true]},

        # pos - neg == pos
        %{left: 2, right: {-6, 9}, result: {24, 9}, opts: []},
        %{left: 2, right: {-6, 9}, result: {8, 3}, opts: [simplify: true]},

        # neg - pos == neg
        %{left: -3, right: {6, 9}, result: {-33, 9}, opts: []},
        %{left: -3, right: {6, 9}, result: {-11, 3}, opts: [simplify: true]},

        # neg - neg
        %{left: -1, right: {-6, 9}, result: {-3, 9}, opts: []},
        %{left: -1, right: {-6, 9}, result: {-1, 3}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.subtract(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "frac - int" do
      test_cases = [
        # pos - pos == pos
        %{left: {7, 5}, right: 1, result: {2, 5}, opts: []},
        %{left: {24, 9}, right: 2, result: {6, 9}, opts: []},
        %{left: {24, 9}, right: 2, result: {2, 3}, opts: [simplify: true]},

        # pos - pos == neg
        %{left: {8, 6}, right: 2, result: {-4, 6}, opts: []},
        %{left: {8, 6}, right: 2, result: {-2, 3}, opts: [simplify: true]},

        # pos - neg == pos
        %{left: {2, 6}, right: -4, result: {26, 6}, opts: []},
        %{left: {2, 6}, right: -4, result: {13, 3}, opts: [simplify: true]},

        # neg - pos == neg
        %{left: {-2, 4}, right: 3, result: {-14, 4}, opts: []},
        %{left: {-2, 4}, right: 3, result: {-7, 2}, opts: [simplify: true]},

        # neg - neg
        %{left: {-2, 4}, right: -5, result: {18, 4}, opts: []},
        %{left: {-2, 4}, right: -5, result: {9, 2}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.subtract(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "type mixing frac - _" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.subtract(Fraction.new(3, 4), val)
      end)
    end

    test "type mixing _ - frac" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.subtract(val, Fraction.new(3, 4))
      end)
    end
  end

  describe "add/*" do
    test "pos/pos + pos/pos" do
      test_cases = [
        %{left: {1, 4}, right: {2, 4}, result: {3, 4}, opts: []},
        %{left: {0, 5}, right: {3, 5}, result: {3, 5}, opts: []},
        %{left: {1, 4}, right: {1, 2}, result: {3, 4}, opts: []},
        %{left: {5, 6}, right: {9, 2}, result: {16, 3}, opts: [simplify: true]},
        %{left: {5, 6}, right: {9, 2}, result: {32, 6}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "pos/pos + neg/pos" do
      test_cases = [
        %{left: {1, 4}, right: {-2, 4}, result: {-1, 4}, opts: []},
        %{left: {0, 5}, right: {-3, 5}, result: {-3, 5}, opts: []},
        %{left: {1, 4}, right: {-1, 2}, result: {-1, 4}, opts: []},
        %{left: {5, 6}, right: {-9, 2}, result: {-11, 3}, opts: [simplify: true]},
        %{left: {5, 6}, right: {-9, 2}, result: {-22, 6}, opts: []},
        %{left: {8, 7}, right: {-1, 4}, result: {25, 28}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "neg/pos + pos/pos" do
      test_cases = [
        %{right: {1, 4}, left: {-2, 4}, result: {-1, 4}, opts: []},
        %{right: {0, 5}, left: {-3, 5}, result: {-3, 5}, opts: []},
        %{right: {1, 4}, left: {-1, 2}, result: {-1, 4}, opts: []},
        %{right: {5, 6}, left: {-9, 2}, result: {-22, 6}, opts: []},
        %{right: {5, 6}, left: {-9, 2}, result: {-11, 3}, opts: [simplify: true]},
        %{right: {8, 7}, left: {-1, 4}, result: {25, 28}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "neg/pos + neg/pos" do
      test_cases = [
        %{left: {-1, 4}, right: {-2, 4}, result: {-3, 4}, opts: []},
        %{left: {0, 5}, right: {-3, 5}, result: {-3, 5}, opts: []},
        %{left: {-1, 4}, right: {-1, 2}, result: {-3, 4}, opts: []},
        %{left: {-5, 6}, right: {-9, 2}, result: {-32, 6}, opts: []},
        %{left: {-5, 6}, right: {-9, 2}, result: {-16, 3}, opts: [simplify: true]},
        %{left: {-8, 7}, right: {-1, 4}, result: {-39, 28}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "pos/pos + pos integer" do
      test_cases = [
        %{left: {1, 4}, right: 0, result: {1, 4}, opts: []},
        %{left: {0, 5}, right: 1, result: {1, 1}, opts: [simplify: true]},
        %{left: {0, 5}, right: 1, result: {5, 5}, opts: []},
        %{left: {1, 4}, right: 4, result: {17, 4}, opts: []},
        %{left: {5, 6}, right: 9, result: {59, 6}, opts: []},
        %{left: {8, 7}, right: 3, result: {29, 7}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "neg/pos + pos integer" do
      test_cases = [
        %{left: {-1, 4}, right: 0, result: {-1, 4}, opts: []},
        %{left: {-1, 4}, right: 4, result: {15, 4}, opts: []},
        %{left: {-5, 6}, right: 9, result: {49, 6}, opts: []},
        %{left: {-8, 7}, right: 3, result: {13, 7}, opts: []},
        %{left: {-4, 2}, right: 3, result: {2, 2}, opts: []},
        %{left: {-4, 2}, right: 3, result: {1, 1}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "pos/pos + neg integer" do
      test_cases = [
        %{left: {0, 5}, right: -1, result: {-5, 5}, opts: []},
        %{left: {0, 5}, right: -1, result: {-1, 1}, opts: [simplify: true]},
        %{left: {1, 4}, right: -4, result: {-15, 4}, opts: []},
        %{left: {5, 6}, right: -9, result: {-49, 6}, opts: []},
        %{left: {8, 7}, right: -3, result: {-13, 7}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "neg/pos + neg integer" do
      test_cases = [
        %{left: {-1, 4}, right: -4, result: {-17, 4}, opts: []},
        %{left: {-5, 6}, right: -9, result: {-59, 6}, opts: []},
        %{left: {-8, 7}, right: -3, result: {-29, 7}, opts: []},
        %{left: {-3, 9}, right: -2, result: {-21, 9}, opts: []},
        %{left: {-3, 9}, right: -2, result: {-7, 3}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = Fraction.new(test_case.left)
        f_b = test_case.right

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "pos integer + pos/pos" do
      test_cases = [
        %{right: {1, 4}, left: 0, result: {1, 4}, opts: []},
        %{right: {0, 5}, left: 1, result: {1, 1}, opts: [simplify: true]},
        %{right: {0, 5}, left: 1, result: {5, 5}, opts: []},
        %{right: {1, 4}, left: 4, result: {17, 4}, opts: []},
        %{right: {5, 6}, left: 9, result: {59, 6}, opts: []},
        %{right: {8, 7}, left: 3, result: {29, 7}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "pos integer + neg/pos" do
      test_cases = [
        %{right: {-1, 4}, left: 0, result: {-1, 4}, opts: []},
        %{right: {-1, 4}, left: 4, result: {15, 4}, opts: []},
        %{right: {-5, 6}, left: 9, result: {49, 6}, opts: []},
        %{right: {-8, 7}, left: 3, result: {13, 7}, opts: []},
        %{right: {-2, 4}, left: 8, result: {30, 4}, opts: []},
        %{right: {-2, 4}, left: 8, result: {15, 2}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "neg integer + pos/pos" do
      test_cases = [
        %{right: {0, 5}, left: -1, result: {-5, 5}, opts: []},
        %{right: {0, 5}, left: -1, result: {-1, 1}, opts: [simplify: true]},
        %{right: {1, 4}, left: -4, result: {-15, 4}, opts: []},
        %{right: {5, 6}, left: -9, result: {-49, 6}, opts: []},
        %{right: {8, 7}, left: -3, result: {-13, 7}, opts: []}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "neg integer + neg/pos" do
      test_cases = [
        %{right: {-1, 4}, left: -4, result: {-17, 4}, opts: []},
        %{right: {-5, 6}, left: -9, result: {-59, 6}, opts: []},
        %{right: {-8, 7}, left: -3, result: {-29, 7}, opts: []},
        %{right: {-3, 3}, left: -5, result: {-18, 3}, opts: []},
        %{right: {-3, 3}, left: -5, result: {-6, 1}, opts: [simplify: true]}
      ]

      test_cases
      |> Enum.each(fn test_case ->
        f_a = test_case.left
        f_b = Fraction.new(test_case.right)

        assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
      end)
    end

    test "type mixing frac + _" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.add(Fraction.new(3, 4), val)
      end)
    end

    test "type mixing _ + frac" do
      [
        Fraction.new(3, 7),
        1.5,
        8,
        "9",
        "1.3",
        "22/7",
        {8, 11}
      ]
      |> Enum.each(fn val ->
        assert %Fraction{} = Fraction.add(val, Fraction.new(3, 4))
      end)
    end
  end

  describe "is_whole?/1" do
    test "pos/pos - true" do
      f = Fraction.new(10, 10)
      assert Fraction.is_whole?(f)

      f = Fraction.new(100, 10)
      assert Fraction.is_whole?(f)
    end

    test "pos/pos - false" do
      f = Fraction.new(11, 10)
      assert Fraction.is_whole?(f) == false

      f = Fraction.new(9, 10)
      assert Fraction.is_whole?(f) == false
    end

    test "neg/pos - true" do
      f = Fraction.new(-10, 10)
      assert Fraction.is_whole?(f)

      f = Fraction.new(-100, 10)
      assert Fraction.is_whole?(f)
    end

    test "neg/pos - false" do
      f = Fraction.new(-1, 3)
      assert Fraction.is_whole?(f) == false

      f = Fraction.new(-4, 3)
      assert Fraction.is_whole?(f) == false
    end

    test "0/pos - true" do
      f = Fraction.new(0, 3)
      assert Fraction.is_whole?(f)
    end
  end

  describe "has_whole?/1" do
    test "pos/pos - false" do
      f = Fraction.new(1, 3)
      assert f |> Fraction.has_whole?() == false
    end

    test "pos/pos - true" do
      f = Fraction.new(3, 3)
      assert f |> Fraction.has_whole?()

      f = Fraction.new(5, 3)
      assert f |> Fraction.has_whole?()

      f = Fraction.new(9, 3)
      assert f |> Fraction.has_whole?()
    end

    test "pos/pos - large true" do
      f = Fraction.new(1000, 3)
      assert f |> Fraction.has_whole?()

      f = Fraction.new(1_000_000, 17)
      assert f |> Fraction.has_whole?()
    end

    test "neg/pos - false" do
      f = Fraction.new(-1, 3)
      assert f |> Fraction.has_whole?() == false
    end

    test "neg/pos - true" do
      f = Fraction.new(-3, 3)
      assert f |> Fraction.has_whole?()

      f = Fraction.new(-4, 3)
      assert f |> Fraction.has_whole?()

      f = Fraction.new(-31, 3)
      assert f |> Fraction.has_whole?()
    end

    test "neg/pos - large true" do
      f = Fraction.new(-3000, 3)
      assert f |> Fraction.has_whole?()
    end

    test "0/pos - false" do
      f = Fraction.new(0, 3)
      assert f |> Fraction.has_whole?() == false
    end
  end

  describe "is_zero?/1" do
    test "pos/pos" do
      f = Fraction.new(3, 3)
      assert f |> Fraction.is_zero?() == false
    end

    test "neg/pos" do
      f = Fraction.new(-30, 3)
      assert f |> Fraction.is_zero?() == false
    end

    test "0/pos" do
      f = Fraction.new(0, 3)
      assert f |> Fraction.is_zero?()
    end
  end

  describe "is_simplified?/1" do
    test "pos/pos - partial - true" do
      f = Fraction.new(2, 3)
      assert f |> Fraction.is_simplified?()
    end

    test "pos/pos - partial - false" do
      f = Fraction.new(2, 4)
      assert f |> Fraction.is_simplified?() == false
    end

    test "pos/pos - whole - true" do
      f = Fraction.new(3, 3)
      assert f |> Fraction.is_simplified?() == false
    end

    test "pos/pos - whole - false" do
      f = Fraction.new(6, 4)
      assert f |> Fraction.is_simplified?() == false
    end

    test "pos/pos - multiple - false" do
      f = Fraction.new(8, 4)
      assert f |> Fraction.is_simplified?() == false
    end

    test "pos/pos - multiple - true" do
      f = Fraction.new(11, 3)
      assert f |> Fraction.is_simplified?()
    end

    test "neg/pos - partial - true" do
      f = Fraction.new(-2, 3)
      assert f |> Fraction.is_simplified?()
    end

    test "neg/pos - partial - false" do
      f = Fraction.new(-2, 4)
      assert f |> Fraction.is_simplified?() == false
    end

    test "neg/pos - whole - true" do
      f = Fraction.new(-4, 3)
      assert f |> Fraction.is_simplified?()
    end

    test "neg/pos - whole - false" do
      f = Fraction.new(-6, 4)
      assert f |> Fraction.is_simplified?() == false
    end

    test "neg/pos - multiple - false" do
      f = Fraction.new(-8, 4)
      assert f |> Fraction.is_simplified?() == false
    end

    test "neg/pos - multiple - true" do
      f = Fraction.new(-22, 7)
      assert f |> Fraction.is_simplified?()
    end

    test "0/pos - false" do
      f = Fraction.new(0, 3)
      assert f |> Fraction.is_simplified?() == false
    end

    test "0/pos - true" do
      f = Fraction.new(0, 1)
      assert f |> Fraction.is_simplified?()
    end
  end

  describe "get_whole/1" do
    test "pos/pos - partial" do
      f = Fraction.new(1, 4)
      assert f |> Fraction.get_whole() == 0
    end

    test "pos/pos - whole" do
      f = Fraction.new(4, 4)
      assert f |> Fraction.get_whole() == 1

      f = Fraction.new(6, 4)
      assert f |> Fraction.get_whole() == 1
    end

    test "pos/pos - multiple" do
      f = Fraction.new(8, 4)
      assert f |> Fraction.get_whole() == 2

      f = Fraction.new(11, 4)
      assert f |> Fraction.get_whole() == 2
    end

    test "neg/pos - partial" do
      f = Fraction.new(-1, 4)
      assert f |> Fraction.get_whole() == 0
    end

    test "neg/pos - whole" do
      f = Fraction.new(-4, 4)
      assert f |> Fraction.get_whole() == -1

      f = Fraction.new(-6, 4)
      assert f |> Fraction.get_whole() == -1
    end

    test "neg/pos - multiple" do
      f = Fraction.new(-8, 4)
      assert f |> Fraction.get_whole() == -2

      f = Fraction.new(-13, 4)
      assert f |> Fraction.get_whole() == -3
    end

    test "0/pos" do
      f = Fraction.new(0, 3)
      assert f |> Fraction.get_whole() == 0
    end
  end

  describe "remainder" do
    test "pos/pos - partial" do
      f = Fraction.new(1, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {1, 4}
    end

    test "pos/pos - whole" do
      f = Fraction.new(4, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {0, 4}

      f = Fraction.new(6, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {2, 4}
    end

    test "pos/pos - multiple" do
      f = Fraction.new(8, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {0, 4}

      f = Fraction.new(11, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {3, 4}
    end

    test "neg/pos - partial" do
      f = Fraction.new(-1, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {-1, 4}
    end

    test "neg/pos - whole" do
      f = Fraction.new(-4, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {0, 4}

      f = Fraction.new(-6, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {-2, 4}
    end

    test "neg/pos - multiple" do
      f = Fraction.new(-8, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {0, 4}

      f = Fraction.new(-11, 4)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {-3, 4}
    end

    test "0/pos" do
      f = Fraction.new(0, 3)
      assert f |> Fraction.get_remainder() |> Fraction.components() == {0, 3}
    end
  end

  describe "split/1" do
    test "pos/pos - partial" do
      f = Fraction.new(1, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 0
      assert remainder |> Fraction.components() == {1, 4}
    end

    test "pos/pos - whole" do
      f = Fraction.new(4, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 1
      assert remainder |> Fraction.components() == {0, 4}

      f = Fraction.new(6, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 1
      assert remainder |> Fraction.components() == {2, 4}
    end

    test "pos/pos - multiple" do
      f = Fraction.new(8, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 2
      assert remainder |> Fraction.components() == {0, 4}

      f = Fraction.new(15, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 3
      assert remainder |> Fraction.components() == {3, 4}
    end

    test "neg/pos - partial" do
      f = Fraction.new(-1, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 0
      assert remainder |> Fraction.components() == {-1, 4}
    end

    test "neg/pos - whole" do
      f = Fraction.new(-4, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == -1
      assert remainder |> Fraction.components() == {0, 4}

      f = Fraction.new(-6, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == -1
      assert remainder |> Fraction.components() == {-2, 4}
    end

    test "neg/pos - multiple" do
      f = Fraction.new(-8, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == -2
      assert remainder |> Fraction.components() == {0, 4}

      f = Fraction.new(-11, 4)
      {whole, remainder} = f |> Fraction.split()
      assert whole == -2
      assert remainder |> Fraction.components() == {-3, 4}
    end

    test "0/pos" do
      f = Fraction.new(0, 3)
      {whole, remainder} = f |> Fraction.split()
      assert whole == 0
      assert remainder |> Fraction.components() == {0, 3}
    end
  end

  describe "simplify/1" do
    test "pos/pos - partial" do
      f = Fraction.new(2, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {1, 2}

      f = Fraction.new(9, 51)
      assert f |> Fraction.simplify() |> Fraction.components() == {3, 17}
    end

    test "pos/pos - whole" do
      f = Fraction.new(4, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {1, 1}

      f = Fraction.new(6, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {3, 2}
    end

    test "pos/pos - multiple" do
      f = Fraction.new(8, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {2, 1}

      f = Fraction.new(21, 6)
      assert f |> Fraction.simplify() |> Fraction.components() == {7, 2}
    end

    test "neg/pos - partial" do
      f = Fraction.new(-2, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {-1, 2}

      f = Fraction.new(-9, 51)
      assert f |> Fraction.simplify() |> Fraction.components() == {-3, 17}
    end

    test "neg/pos - whole" do
      f = Fraction.new(-5, 5)
      assert f |> Fraction.simplify() |> Fraction.components() == {-1, 1}

      f = Fraction.new(-10, 6)
      assert f |> Fraction.simplify() |> Fraction.components() == {-5, 3}
    end

    test "neg/pos - multiple" do
      f = Fraction.new(-16, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {-4, 1}

      f = Fraction.new(-36, 27)
      assert f |> Fraction.simplify() |> Fraction.components() == {-4, 3}
    end

    test "0/pos" do
      f = Fraction.new(0, 4)
      assert f |> Fraction.simplify() |> Fraction.components() == {0, 1}
    end
  end

  describe "new/1" do
    test "pos int" do
      f = Fraction.new(5)
      assert f |> Fraction.components() == {5, 1}
    end

    test "neg int" do
      f = Fraction.new(-7)
      assert f |> Fraction.components() == {-7, 1}
    end

    test "tuple" do
      assert Fraction.new({7, 11}) == %Fraction{num: 7, den: 11}
    end

    test "string - frac" do
      assert Fraction.new("49/76") == %Fraction{num: 49, den: 76}
    end

    test "string - int" do
      assert Fraction.new("-312") == %Fraction{num: -312, den: 1}
    end

    test "string - float" do
      assert Fraction.new("1.5") == %Fraction{num: 15, den: 10}
    end

    test "float" do
      assert Fraction.new(0.5) == %Fraction{num: 5, den: 10}
    end

    test "float variations" do
      assert Fraction.new(-0.5) == %Fraction{num: -5, den: 10}
      assert Fraction.new(-1.5) == %Fraction{num: -15, den: 10}
      assert Fraction.new(-2.5) == %Fraction{num: -25, den: 10}
      assert Fraction.new(-1.33) == %Fraction{num: -133, den: 100}
    end
  end

  describe "new/2" do
    test "pos/pos partial" do
      f = Fraction.new(1, 3)
      assert f |> Fraction.components() == {1, 3}

      f = Fraction.new(2, 4)
      assert f |> Fraction.components() == {2, 4}
    end

    test "pos/pos whole" do
      f = Fraction.new(3, 3)
      assert f |> Fraction.components() == {3, 3}

      f = Fraction.new(6, 4)
      assert f |> Fraction.components() == {6, 4}
    end

    test "pos/pos multiple" do
      f = Fraction.new(9, 3)
      assert f |> Fraction.components() == {9, 3}

      f = Fraction.new(18, 4)
      assert f |> Fraction.components() == {18, 4}
    end

    test "neg/pos partial" do
      f = Fraction.new(-1, 3)
      assert f |> Fraction.components() == {-1, 3}

      f = Fraction.new(-2, 4)
      assert f |> Fraction.components() == {-2, 4}
    end

    test "neg/pos whole" do
      f = Fraction.new(-3, 3)
      assert f |> Fraction.components() == {-3, 3}

      f = Fraction.new(-6, 4)
      assert f |> Fraction.components() == {-6, 4}
    end

    test "neg/pos multiple" do
      f = Fraction.new(-9, 3)
      assert f |> Fraction.components() == {-9, 3}

      f = Fraction.new(-18, 4)
      assert f |> Fraction.components() == {-18, 4}
    end

    test "pos/neg partial" do
      f = Fraction.new(1, -3)
      assert f |> Fraction.components() == {-1, 3}

      f = Fraction.new(2, -4)
      assert f |> Fraction.components() == {-2, 4}
    end

    test "pos/neg whole" do
      f = Fraction.new(3, -3)
      assert f |> Fraction.components() == {-3, 3}

      f = Fraction.new(6, -4)
      assert f |> Fraction.components() == {-6, 4}
    end

    test "pos/neg multiple" do
      f = Fraction.new(9, -3)
      assert f |> Fraction.components() == {-9, 3}

      f = Fraction.new(18, -4)
      assert f |> Fraction.components() == {-18, 4}
    end

    test "neg/neg partial" do
      f = Fraction.new(-1, -3)
      assert f |> Fraction.components() == {1, 3}

      f = Fraction.new(-2, -4)
      assert f |> Fraction.components() == {2, 4}
    end

    test "neg/neg whole" do
      f = Fraction.new(-3, -3)
      assert f |> Fraction.components() == {3, 3}

      f = Fraction.new(-6, -4)
      assert f |> Fraction.components() == {6, 4}
    end

    test "neg/neg multiple" do
      f = Fraction.new(-9, -3)
      assert f |> Fraction.components() == {9, 3}

      f = Fraction.new(-18, -4)
      assert f |> Fraction.components() == {18, 4}
    end

    test "0/pos" do
      f = Fraction.new(0, 10)
      assert f |> Fraction.components() == {0, 10}
    end

    test "0/neg" do
      f = Fraction.new(0, -10)
      assert f |> Fraction.components() == {0, 10}
    end

    test "pos/0" do
      assert Fraction.new(5, 0) == {:error, :invalid_denominator}
    end

    test "0/0" do
      assert Fraction.new(0, 0) == {:error, :invalid_denominator}
    end

    test "float, natural" do
      assert Fraction.new(0.25, conversion: :natural) == %Fraction{num: 25, den: 100}
      assert Fraction.new(3.14, conversion: :natural) == %Fraction{num: 314, den: 100}
    end

    test "float, precision" do
      assert Fraction.new(0.25, conversion: :precision) == %Fraction{num: 1, den: 4}

      assert Fraction.new(3.14, conversion: :precision) == %Fraction{
               num: 7_070_651_414_971_679,
               den: 2_251_799_813_685_248
             }
    end
  end
end
