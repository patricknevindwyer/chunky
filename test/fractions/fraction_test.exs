defmodule Chunky.FractionTest do
  use ExUnit.Case
  alias Chunky.Fraction
  
  doctest Chunky.Fraction, import: true

  describe "add/2" do
     
     test "pos/pos + pos/pos" do
         
         test_cases = [
             %{left: {1, 4}, right: {2, 4}, result: {3, 4}, opts: []},
             %{left: {0, 5}, right: {3, 5}, result: {3, 5}, opts: []},
             %{left: {1, 4}, right: {1, 2}, result: {3, 4}, opts: []},
             %{left: {5, 6}, right: {9, 2}, result: {16, 3}, opts: [simplify: true]},
             %{left: {5, 6}, right: {9, 2}, result: {32, 6}, opts: []}
         ]

         test_cases
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )

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
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
     end
     
     test "neg/pos + pos/pos" do
         
         test_cases = [
             %{right: {1, 4}, left: {-2, 4}, result: { -1, 4}, opts: []},
             %{right: {0, 5}, left: {-3, 5}, result: { -3, 5}, opts: []},
             %{right: {1, 4}, left: {-1, 2}, result: { -1, 4}, opts: []},
             %{right: {5, 6}, left: {-9, 2}, result: {-22, 6}, opts: []},
             %{right: {5, 6}, left: {-9, 2}, result: {-11, 3}, opts: [simplify: true]},
             %{right: {8, 7}, left: {-1, 4}, result: { 25, 28}, opts: []}
         ]

         test_cases
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
     end
     
     test "neg/pos + neg/pos" do
         
         test_cases = [
             %{left: {-1, 4}, right: {-2, 4}, result: {-3, 4}, opts: []},
             %{left: { 0, 5}, right: {-3, 5}, result: {-3, 5}, opts: []},
             %{left: {-1, 4}, right: {-1, 2}, result: {-3, 4}, opts: []},
             %{left: {-5, 6}, right: {-9, 2}, result: {-32, 6}, opts: []},
             %{left: {-5, 6}, right: {-9, 2}, result: {-16, 3}, opts: [simplify: true]},
             %{left: {-8, 7}, right: {-1, 4}, result: {-39, 28}, opts: []}
         ]

         test_cases
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = test_case.right

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = test_case.right

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = test_case.right

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = Fraction.new(test_case.left)
                 f_b = test_case.right

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = test_case.left
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = test_case.left
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = test_case.left
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
         |> Enum.each(
             fn test_case ->
                 f_a = test_case.left
                 f_b = Fraction.new(test_case.right)

                 assert Fraction.add(f_a, f_b, test_case.opts) == Fraction.new(test_case.result)
             end
         )
         
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
          
          f = Fraction.new(1000000, 17)
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
      
  end
end