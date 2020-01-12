defmodule Chunky.SequenceDataTest do
  use ExUnit.Case, async: true
  require Chunky.Math.Operations
  import Chunky.Math.Operations, only: [summation: 3]
  alias Chunky.Fraction
  
  describe "summation" do
  
    test "int - literal - 0 to positive" do
       
       assert (summation k, 0..10 do
          k 
       end) == 55
       
    end    
    
    test "int - equation - 0 to positive" do
       
       assert (summation k , 1..5 do
          k * k + 1 
       end) == 60
              
    end
    
    test "int - literal - negative to 0 " do
       
       assert (summation k, -10..0 do
           k
       end) == -55
       
    end
    
    test "int - literal - negative to positive" do
       
       assert (summation k, -5..10 do
          k 
       end) == 40
       
    end
    
    test "int - alt iterator" do
       
       assert (summation j, 1..5 do
          j 
       end) == 15
        
    end
    
    test "int - nested summations" do
    
        assert (summation k, 0..5 do
           
           summation j, k..10 do
               j
           end
           
        end) == 310
        
    end
    
    test "fraction - denominators" do
       
       assert %Fraction{num: 137, den: 60} == (summation k, 1..5 do
          Fraction.new(1, k) 
       end)
       
    end
    
    test "fraction - numerators" do
       
       assert %Fraction{num: 15, den: 1} == (summation k, 1..5 do
          Fraction.new(k, 1) 
       end)
       
    end
    
    test "fraction - iterated sum - nested" do
        assert %Fraction{num: 66, den: 6} == (summation num, 1..3 do
           summation den, 1..3 do
              Fraction.new(num, den) 
           end 
        end)
    end
        
  end

end