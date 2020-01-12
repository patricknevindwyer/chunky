defmodule Chunky.SequenceDataTest do
  use ExUnit.Case, async: true
  require Chunky.Math.Operations
  import Chunky.Math.Operations, only: [summation: 3]
  
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
    
  end

end