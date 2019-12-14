defmodule Chunky.FractionTest do
  use ExUnit.Case
  alias Chunky.Fraction
  
  doctest Chunky.Fraction, import: true


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