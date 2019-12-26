defmodule Chunky.Sequence.OEIS.Factors do
  @moduledoc """
  OEIS Sequences dealing with Factors, Factorization, and properties of integer factors. 

  ## Available Sequences

   - [A001694 - Powerful Numbers](https://oeis.org/A001694) - `:a001694` - `create_sequence_a001694/1`
  
  """
  import Chunky.Sequence, only: [sequence_for_function: 1]
  alias Chunky.Math

  require Integer
  
  @doc """
  OEIS Sequence `A001694` - Powerful Numbers

  From [OEIS A001694](https://oeis.org/A001694):

  > Powerful numbers, definition (1): if a prime p divides n then p^2 must also divide n (also called squareful, square full, square-full or 2-powerful numbers). 
  > (Formerly M3325 N1335)
  
  **Sequence IDs**: `:a001694`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a001694) |> Sequence.take!(20)
      [1, 4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 72, 81, 100, 108, 121, 125, 128, 144, 169]

  """
  @doc offset: 1, sequence: "Powerful numbers", references: [{:oeis, :a001694, "https://oeis.org/A001694"}]
  def create_sequence_a001694(_opts) do
      sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a001694/2)
  end
  
  @doc offset: 1
  def seq_a001694(_idx, last) do
      Math.next_number(&Math.is_powerful_number?/1, last)
  end

end