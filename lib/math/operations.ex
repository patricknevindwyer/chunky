defmodule Chunky.Math.Operations do
   
    alias Chunky.Fraction
    
   defmacro summation(key, range, do: expression) do
              
       quote do
          unquote(range)
          |> Enum.map(
              fn k_a -> 
                  # var!(k) = k_a
                  var!(unquote(key)) = k_a
                  unquote(expression)
              end
          ) 
          # |> Enum.sum()
          |> Enum.reduce(
              0, 
              fn v, acc -> 
                  case v do
                      
                      # we're summing fractions. 
                     %Fraction{} ->  Fraction.add(v, acc)
                     
                     # integers...
                     _ -> v + acc
                     
                  end
              end
          )
       end
   end
   
end