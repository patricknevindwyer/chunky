defmodule Chunky.Math.Operations do
   
   defmacro summation(key, range, do: expression) do
       
       # find our key name and iteration range
       # range = opts |> Keyword.get(:k)
       
       
       # quote bind_quoted: [range: Macro.escape(range, unquoted: false), expression: expression] do
       #    range
       #    |> Enum.map(
       #        fn k_a ->
       #            var!(k) = k_a
       #            expression
       #        end
       #    )
       #    |> Enum.sum()
       # end
       # var_name = :k
       
       quote do
          unquote(range)
          |> Enum.map(
              fn k_a -> 
                  # var!(k) = k_a
                  var!(unquote(key)) = k_a
                  unquote(expression)
              end
          ) 
          |> Enum.sum()
       end
   end
   
end