# credo:disable-for-this-file Credo.Check.Design.AliasUsage
defmodule Chunky.Sequence.OEIS.Primes do
  @moduledoc """
  OEIS Sequences dealing with Primes. For related sequences, see `Chunky.Sequences.OEIS.Factors`

  ## Available Sequences

   - [A162511 - Multiplicative function with a(p^e)=(-1)^(e-1)](https://oeis.org/A162511) - `:a162511` - `create_sequence_a162511/1`

  """

  import Chunky.Sequence, only: [sequence_for_function: 1]
  alias Chunky.Math

  # require Integer

  @doc """
  OEIS Sequence `A162511` - Multiplicative function with a(p^e)=(-1)^(e-1)

  From [OEIS A162511](https://oeis.org/A162511):

  > Multiplicative function with a(p^e)=(-1)^(e-1)

  **Sequence IDs**: `:a162511`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a162511) |> Sequence.take!(92)
      [1,1,1,-1,1,1,1,1,-1,1,1,-1,1,1,1,-1,1,-1,1,-1,1,1,1,1,-1,1,1,-1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,1,1,-1,-1,-1,1,-1,1,1,1,1,1,1,1,-1,1,1,-1,-1,1,1,1,-1,1,1,1,-1,1,1,-1,-1,1,1,1,-1,-1,1,1,-1,1,1,1,1,1,-1,1,-1]


  """
  @doc offset: 1,
       sequence: "Multiplicative function with a(p^e)=(-1)^(e-1)",
       references: [{:oeis, :a162511, "https://oeis.org/A162511"}]
  def create_sequence_a162511(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a162511/1)
  end

  @doc offset: 1
  def seq_a162511(idx) do
    -1 |> Math.pow(Math.bigomega(idx) - Math.omega(idx))
  end
end
