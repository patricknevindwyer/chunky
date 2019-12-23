defmodule Chunky.Sequence.OEIS do
   
   @moduledoc """
   Online Encyclopedia of Integer Sequences (OEIS) sequence iterators.
   
   ## Available Sequences
   
    - [A000045 - Fibonacci Numbers](https://oeis.org/A000045) - `:a000045` or `:fibonacci`
   
   """ 
   import Chunky.Sequence, only: [sequence_for_function: 2]
   defp info_oeis(data) do
      %{
          oeis_id: data.oeis_id
      } 
   end
   
   @doc """
   OEIS Sequence `A000045` - Fibonacci numbers
   
   > Fibonacci numbers: F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1. 
   > (Formerly M0692 N0256)
   
   **Sequence IDs**: `:a000045`, `:fibonacci`
   
   **Finite**: false
   
   """
   @doc sequence: "OEIS A000045 - Fibonacci Numbers [1, 1, 2, 3, 5, ...]"
   def create_sequence_a000045(_opts) do
       sequence_for_function(&seq_a000045/3, &info_oeis/1)
   end
   
   @doc sequence: "OEIS A000045 - Fibonacci Numbers [1, 1, 2, 3, 5, ...]"
   def create_sequence_fibonacci(_opts) do
       sequence_for_function(&seq_a000045/3, &info_oeis/1)
   end
   
   @doc sequence: "OEIS A000045 - Fibonacci Numbers [1, 2, 3, 4, 5, ...]", data: %{oeis_id: "A000045"}
   def seq_a000045(idx, a, b) do
       case idx do
           0 -> 0
           1 -> 1
           _ -> a + b
       end
   end
   

end