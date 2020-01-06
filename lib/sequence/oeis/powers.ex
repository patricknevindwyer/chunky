defmodule Chunky.Sequence.OEIS.Powers do
   @moduledoc """
   Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with powers
   and simple polynomials.
   
   ## Available Sequences
   
    - [A000051 - a(n) = 2^n + 1.](https://oeis.org/A000051) - `:a000051` - `create_sequence_a000051/1`
   
   """ 
   
   import Chunky.Sequence, only: [sequence_for_function: 1]

   alias Chunky.Math
   
   
   @doc """
   OEIS Sequence `A000051` - a(n) = 2^n + 1.

   From [OEIS A000051](https://oeis.org/A000051):

   > a(n) = 2^n + 1.
   > (Formerly M0717 N0266)

   **Sequence IDs**: `:a000051`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a000051) |> Sequence.take!(32)
       [2,3,5,9,17,33,65,129,257,513,1025,2049,4097,8193,16385,32769,65537,131073,262145,524289,1048577,2097153,4194305,8388609,16777217,33554433,67108865,134217729,268435457,536870913,1073741825,2147483649]


   """
   @doc offset: 0,
        sequence: "a(n) = 2^n + 1.",
        references: [{:oeis, :a000051, "https://oeis.org/A000051"}]
   def create_sequence_a000051(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a000051/1)
   end


   @doc offset: 0
   def seq_a000051(idx) do
       Math.pow(2, idx) + 1
   end
end