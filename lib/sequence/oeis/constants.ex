defmodule Chunky.Sequence.OEIS.Constants do
  @moduledoc """
  Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with numeric
  constants, digit expansions of constants, constant value sequences, or constant cycle sequences.

  ## Available Sequences

   - [A007395 - Constant sequence: the all 2's sequence.](https://oeis.org/A007395) - `:a007395` - `create_sequence_a007395/1`
   - [A010701 - Constant sequence: the all 3's sequence.](https://oeis.org/A010701) - `:a010701` - `create_sequence_a010701/1`
   - [A010709 - Constant sequence: the all 4's sequence.](https://oeis.org/A010709) - `:a010709` - `create_sequence_a010709/1`
   - [A010716 - Constant sequence: the all 5's sequence.](https://oeis.org/A010716) - `:a010716` - `create_sequence_a010716/1`
   - [A010722 - Constant sequence: the all 6's sequence.](https://oeis.org/A010722) - `:a010722` - `create_sequence_a010722/1`
   - [A010727 - Constant sequence: the all 7's sequence.](https://oeis.org/A010727) - `:a010727` - `create_sequence_a010727/1`
   - [A010731 - Constant sequence: the all 8's sequence.](https://oeis.org/A010731) - `:a010731` - `create_sequence_a010731/1`
   - [A010734 - Constant sequence: the all 9's sequence.](https://oeis.org/A010734) - `:a010734` - `create_sequence_a010734/1`
   - [A010692 - Constant sequence: a(n) = 10.](https://oeis.org/A010692) - `:a010692` - `create_sequence_a010692/1`
   - [A010850 - Constant sequence: a(n) = 11.](https://oeis.org/A010850) - `:a010850` - `create_sequence_a010850/1`
   - [A010851 - Constant sequence: a(n) = 12.](https://oeis.org/A010851) - `:a010851` - `create_sequence_a010851/1`
   - [A010852 - Constant sequence: a(n) = 13.](https://oeis.org/A010852) - `:a010852` - `create_sequence_a010852/1`
   - [A010853 - Constant sequence: a(n) = 14.](https://oeis.org/A010853) - `:a010853` - `create_sequence_a010853/1`
   - [A010854 - Constant sequence: a(n) = 15.](https://oeis.org/A010854) - `:a010854` - `create_sequence_a010854/1`
   - [A010855 - Constant sequence: a(n) = 16.](https://oeis.org/A010855) - `:a010855` - `create_sequence_a010855/1`
   - [A010856 - Constant sequence: a(n) = 17.](https://oeis.org/A010856) - `:a010856` - `create_sequence_a010856/1`
   - [A010857 - Constant sequence: a(n) = 18.](https://oeis.org/A010857) - `:a010857` - `create_sequence_a010857/1`
   - [A010858 - Constant sequence: a(n) = 19.](https://oeis.org/A010858) - `:a010858` - `create_sequence_a010858/1`
   - [A010859 - Constant sequence: a(n) = 20.](https://oeis.org/A010859) - `:a010859` - `create_sequence_a010859/1`
   - [A010860 - Constant sequence: a(n) = 21.](https://oeis.org/A010860) - `:a010860` - `create_sequence_a010860/1`
   - [A010861 - Constant sequence: a(n) = 22.](https://oeis.org/A010861) - `:a010861` - `create_sequence_a010861/1`
   - [A010862 - Constant sequence: a(n) = 23.](https://oeis.org/A010862) - `:a010862` - `create_sequence_a010862/1`
   - [A010863 - Constant sequence: a(n) = 24.](https://oeis.org/A010863) - `:a010863` - `create_sequence_a010863/1`
   - [A010864 - Constant sequence: a(n) = 25.](https://oeis.org/A010864) - `:a010864` - `create_sequence_a010864/1`
   - [A010865 - Constant sequence: a(n) = 26.](https://oeis.org/A010865) - `:a010865` - `create_sequence_a010865/1`
   - [A010866 - Constant sequence: a(n) = 27.](https://oeis.org/A010866) - `:a010866` - `create_sequence_a010866/1`
   - [A010867 - Constant sequence: a(n) = 28.](https://oeis.org/A010867) - `:a010867` - `create_sequence_a010867/1`
   - [A010868 - Constant sequence: a(n) = 29.](https://oeis.org/A010868) - `:a010868` - `create_sequence_a010868/1`
   - [A010869 - Constant sequence: a(n) = 30.](https://oeis.org/A010869) - `:a010869` - `create_sequence_a010869/1`
   - [A010870 - Constant sequence: a(n) = 31.](https://oeis.org/A010870) - `:a010870` - `create_sequence_a010870/1`
   - [A010871 - Constant sequence: a(n) = 32.](https://oeis.org/A010871) - `:a010871` - `create_sequence_a010871/1`

  """
  import Chunky.Sequence, only: [sequence_for_function: 1]

  @doc """
  OEIS Sequence `A007395` - Constant sequence: the all 2's sequence.

  From [OEIS A007395](https://oeis.org/A007395):

  > Constant sequence: the all 2's sequence.
  > (Formerly M0208)

  **Sequence IDs**: `:a007395`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a007395) |> Sequence.take!(102)
      [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]


  """
  @doc offset: 1,
       sequence: "Constant sequence: the all 2's sequence.",
       references: [{:oeis, :a007395, "https://oeis.org/A007395"}]
  def create_sequence_a007395(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a007395/1)
  end

  @doc offset: 1
  def seq_a007395(_idx) do
    2
  end

  @doc """
  OEIS Sequence `A010701` - Constant sequence: the all 3's sequence.

  From [OEIS A010701](https://oeis.org/A010701):

  > Constant sequence: the all 3's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010701`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010701) |> Sequence.take!(81)
      [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 3's sequence.",
       references: [{:oeis, :a010701, "https://oeis.org/A010701"}]
  def create_sequence_a010701(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010701/1)
  end

  @doc offset: 0
  def seq_a010701(_idx) do
    3
  end

  @doc """
  OEIS Sequence `A010709` - Constant sequence: the all 4's sequence.

  From [OEIS A010709](https://oeis.org/A010709):

  > Constant sequence: the all 4's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010709`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010709) |> Sequence.take!(105)
      [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 4's sequence.",
       references: [{:oeis, :a010709, "https://oeis.org/A010709"}]
  def create_sequence_a010709(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010709/1)
  end

  @doc offset: 0
  def seq_a010709(_idx) do
    4
  end

  @doc """
  OEIS Sequence `A010716` - Constant sequence: the all 5's sequence.

  From [OEIS A010716](https://oeis.org/A010716):

  > Constant sequence: the all 5's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010716`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010716) |> Sequence.take!(81)
      [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 5's sequence.",
       references: [{:oeis, :a010716, "https://oeis.org/A010716"}]
  def create_sequence_a010716(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010716/1)
  end

  @doc offset: 0
  def seq_a010716(_idx) do
    5
  end

  @doc """
  OEIS Sequence `A010722` - Constant sequence: the all 6's sequence.

  From [OEIS A010722](https://oeis.org/A010722):

  > Constant sequence: the all 6's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010722`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010722) |> Sequence.take!(81)
      [6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 6's sequence.",
       references: [{:oeis, :a010722, "https://oeis.org/A010722"}]
  def create_sequence_a010722(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010722/1)
  end

  @doc offset: 0
  def seq_a010722(_idx) do
    6
  end

  @doc """
  OEIS Sequence `A010727` - Constant sequence: the all 7's sequence.

  From [OEIS A010727](https://oeis.org/A010727):

  > Constant sequence: the all 7's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010727`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010727) |> Sequence.take!(81)
      [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 7's sequence.",
       references: [{:oeis, :a010727, "https://oeis.org/A010727"}]
  def create_sequence_a010727(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010727/1)
  end

  @doc offset: 0
  def seq_a010727(_idx) do
    7
  end

  @doc """
  OEIS Sequence `A010731` - Constant sequence: the all 8's sequence.

  From [OEIS A010731](https://oeis.org/A010731):

  > Constant sequence: the all 8's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010731`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010731) |> Sequence.take!(81)
      [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 8's sequence.",
       references: [{:oeis, :a010731, "https://oeis.org/A010731"}]
  def create_sequence_a010731(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010731/1)
  end

  @doc offset: 0
  def seq_a010731(_idx) do
    8
  end

  @doc """
  OEIS Sequence `A010734` - Constant sequence: the all 9's sequence.

  From [OEIS A010734](https://oeis.org/A010734):

  > Constant sequence: the all 9's sequence.
  > (Formerly )

  **Sequence IDs**: `:a010734`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010734) |> Sequence.take!(81)
      [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]


  """
  @doc offset: 0,
       sequence: "Constant sequence: the all 9's sequence.",
       references: [{:oeis, :a010734, "https://oeis.org/A010734"}]
  def create_sequence_a010734(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010734/1)
  end

  @doc offset: 0
  def seq_a010734(_idx) do
    9
  end

  @doc """
  OEIS Sequence `A010692` - Constant sequence: a(n) = 10.

  From [OEIS A010692](https://oeis.org/A010692):

  > Constant sequence: a(n) = 10.
  > (Formerly )

  **Sequence IDs**: `:a010692`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010692) |> Sequence.take!(66)
      [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 10.",
       references: [{:oeis, :a010692, "https://oeis.org/A010692"}]
  def create_sequence_a010692(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010692/1)
  end

  @doc offset: 0
  def seq_a010692(_idx) do
    10
  end

  @doc """
  OEIS Sequence `A010850` - Constant sequence: a(n) = 11.

  From [OEIS A010850](https://oeis.org/A010850):

  > Constant sequence: a(n) = 11.
  > (Formerly )

  **Sequence IDs**: `:a010850`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010850) |> Sequence.take!(65)
      [11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 11.",
       references: [{:oeis, :a010850, "https://oeis.org/A010850"}]
  def create_sequence_a010850(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010850/1)
  end

  @doc offset: 0
  def seq_a010850(_idx) do
    11
  end

  @doc """
  OEIS Sequence `A010851` - Constant sequence: a(n) = 12.

  From [OEIS A010851](https://oeis.org/A010851):

  > Constant sequence: a(n) = 12.
  > (Formerly )

  **Sequence IDs**: `:a010851`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010851) |> Sequence.take!(65)
      [12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 12.",
       references: [{:oeis, :a010851, "https://oeis.org/A010851"}]
  def create_sequence_a010851(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010851/1)
  end

  @doc offset: 0
  def seq_a010851(_idx) do
    12
  end

  @doc """
  OEIS Sequence `A010852` - Constant sequence: a(n) = 13.

  From [OEIS A010852](https://oeis.org/A010852):

  > Constant sequence: a(n) = 13.
  > (Formerly )

  **Sequence IDs**: `:a010852`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010852) |> Sequence.take!(54)
      [13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 13.",
       references: [{:oeis, :a010852, "https://oeis.org/A010852"}]
  def create_sequence_a010852(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010852/1)
  end

  @doc offset: 0
  def seq_a010852(_idx) do
    13
  end

  @doc """
  OEIS Sequence `A010853` - Constant sequence: a(n) = 14.

  From [OEIS A010853](https://oeis.org/A010853):

  > Constant sequence: a(n) = 14.
  > (Formerly )

  **Sequence IDs**: `:a010853`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010853) |> Sequence.take!(54)
      [14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 14.",
       references: [{:oeis, :a010853, "https://oeis.org/A010853"}]
  def create_sequence_a010853(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010853/1)
  end

  @doc offset: 0
  def seq_a010853(_idx) do
    14
  end

  @doc """
  OEIS Sequence `A010854` - Constant sequence: a(n) = 15.

  From [OEIS A010854](https://oeis.org/A010854):

  > Constant sequence: a(n) = 15.
  > (Formerly )

  **Sequence IDs**: `:a010854`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010854) |> Sequence.take!(54)
      [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 15.",
       references: [{:oeis, :a010854, "https://oeis.org/A010854"}]
  def create_sequence_a010854(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010854/1)
  end

  @doc offset: 0
  def seq_a010854(_idx) do
    15
  end

  @doc """
  OEIS Sequence `A010855` - Constant sequence: a(n) = 16.

  From [OEIS A010855](https://oeis.org/A010855):

  > Constant sequence: a(n) = 16.
  > (Formerly )

  **Sequence IDs**: `:a010855`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010855) |> Sequence.take!(54)
      [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 16.",
       references: [{:oeis, :a010855, "https://oeis.org/A010855"}]
  def create_sequence_a010855(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010855/1)
  end

  @doc offset: 0
  def seq_a010855(_idx) do
    16
  end

  @doc """
  OEIS Sequence `A010856` - Constant sequence: a(n) = 17.

  From [OEIS A010856](https://oeis.org/A010856):

  > Constant sequence: a(n) = 17.
  > (Formerly )

  **Sequence IDs**: `:a010856`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010856) |> Sequence.take!(54)
      [17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 17.",
       references: [{:oeis, :a010856, "https://oeis.org/A010856"}]
  def create_sequence_a010856(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010856/1)
  end

  @doc offset: 0
  def seq_a010856(_idx) do
    17
  end

  @doc """
  OEIS Sequence `A010857` - Constant sequence: a(n) = 18.

  From [OEIS A010857](https://oeis.org/A010857):

  > Constant sequence: a(n) = 18.
  > (Formerly )

  **Sequence IDs**: `:a010857`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010857) |> Sequence.take!(54)
      [18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 18.",
       references: [{:oeis, :a010857, "https://oeis.org/A010857"}]
  def create_sequence_a010857(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010857/1)
  end

  @doc offset: 0
  def seq_a010857(_idx) do
    18
  end

  @doc """
  OEIS Sequence `A010858` - Constant sequence: a(n) = 19.

  From [OEIS A010858](https://oeis.org/A010858):

  > Constant sequence: a(n) = 19.
  > (Formerly )

  **Sequence IDs**: `:a010858`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010858) |> Sequence.take!(54)
      [19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 19.",
       references: [{:oeis, :a010858, "https://oeis.org/A010858"}]
  def create_sequence_a010858(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010858/1)
  end

  @doc offset: 0
  def seq_a010858(_idx) do
    19
  end

  @doc """
  OEIS Sequence `A010859` - Constant sequence: a(n) = 20.

  From [OEIS A010859](https://oeis.org/A010859):

  > Constant sequence: a(n) = 20.
  > (Formerly )

  **Sequence IDs**: `:a010859`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010859) |> Sequence.take!(54)
      [20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 20.",
       references: [{:oeis, :a010859, "https://oeis.org/A010859"}]
  def create_sequence_a010859(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010859/1)
  end

  @doc offset: 0
  def seq_a010859(_idx) do
    20
  end

  @doc """
  OEIS Sequence `A010860` - Constant sequence: a(n) = 21.

  From [OEIS A010860](https://oeis.org/A010860):

  > Constant sequence: a(n) = 21.
  > (Formerly )

  **Sequence IDs**: `:a010860`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010860) |> Sequence.take!(54)
      [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 21.",
       references: [{:oeis, :a010860, "https://oeis.org/A010860"}]
  def create_sequence_a010860(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010860/1)
  end

  @doc offset: 0
  def seq_a010860(_idx) do
    21
  end

  @doc """
  OEIS Sequence `A010861` - Constant sequence: a(n) = 22.

  From [OEIS A010861](https://oeis.org/A010861):

  > Constant sequence: a(n) = 22.
  > (Formerly )

  **Sequence IDs**: `:a010861`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010861) |> Sequence.take!(54)
      [22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 22.",
       references: [{:oeis, :a010861, "https://oeis.org/A010861"}]
  def create_sequence_a010861(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010861/1)
  end

  @doc offset: 0
  def seq_a010861(_idx) do
    22
  end

  @doc """
  OEIS Sequence `A010862` - Constant sequence: a(n) = 23.

  From [OEIS A010862](https://oeis.org/A010862):

  > Constant sequence: a(n) = 23.
  > (Formerly )

  **Sequence IDs**: `:a010862`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010862) |> Sequence.take!(54)
      [23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 23.",
       references: [{:oeis, :a010862, "https://oeis.org/A010862"}]
  def create_sequence_a010862(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010862/1)
  end

  @doc offset: 0
  def seq_a010862(_idx) do
    23
  end

  @doc """
  OEIS Sequence `A010863` - Constant sequence: a(n) = 24.

  From [OEIS A010863](https://oeis.org/A010863):

  > Constant sequence: a(n) = 24.
  > (Formerly )

  **Sequence IDs**: `:a010863`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010863) |> Sequence.take!(54)
      [24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 24.",
       references: [{:oeis, :a010863, "https://oeis.org/A010863"}]
  def create_sequence_a010863(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010863/1)
  end

  @doc offset: 0
  def seq_a010863(_idx) do
    24
  end

  @doc """
  OEIS Sequence `A010864` - Constant sequence: a(n) = 25.

  From [OEIS A010864](https://oeis.org/A010864):

  > Constant sequence: a(n) = 25.
  > (Formerly )

  **Sequence IDs**: `:a010864`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010864) |> Sequence.take!(54)
      [25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 25.",
       references: [{:oeis, :a010864, "https://oeis.org/A010864"}]
  def create_sequence_a010864(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010864/1)
  end

  @doc offset: 0
  def seq_a010864(_idx) do
    25
  end

  @doc """
  OEIS Sequence `A010865` - Constant sequence: a(n) = 26.

  From [OEIS A010865](https://oeis.org/A010865):

  > Constant sequence: a(n) = 26.
  > (Formerly )

  **Sequence IDs**: `:a010865`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010865) |> Sequence.take!(54)
      [26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 26.",
       references: [{:oeis, :a010865, "https://oeis.org/A010865"}]
  def create_sequence_a010865(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010865/1)
  end

  @doc offset: 0
  def seq_a010865(_idx) do
    26
  end

  @doc """
  OEIS Sequence `A010866` - Constant sequence: a(n) = 27.

  From [OEIS A010866](https://oeis.org/A010866):

  > Constant sequence: a(n) = 27.
  > (Formerly )

  **Sequence IDs**: `:a010866`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010866) |> Sequence.take!(54)
      [27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 27.",
       references: [{:oeis, :a010866, "https://oeis.org/A010866"}]
  def create_sequence_a010866(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010866/1)
  end

  @doc offset: 0
  def seq_a010866(_idx) do
    27
  end

  @doc """
  OEIS Sequence `A010867` - Constant sequence: a(n) = 28.

  From [OEIS A010867](https://oeis.org/A010867):

  > Constant sequence: a(n) = 28.
  > (Formerly )

  **Sequence IDs**: `:a010867`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010867) |> Sequence.take!(54)
      [28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 28.",
       references: [{:oeis, :a010867, "https://oeis.org/A010867"}]
  def create_sequence_a010867(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010867/1)
  end

  @doc offset: 0
  def seq_a010867(_idx) do
    28
  end

  @doc """
  OEIS Sequence `A010868` - Constant sequence: a(n) = 29.

  From [OEIS A010868](https://oeis.org/A010868):

  > Constant sequence: a(n) = 29.
  > (Formerly )

  **Sequence IDs**: `:a010868`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010868) |> Sequence.take!(54)
      [29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 29.",
       references: [{:oeis, :a010868, "https://oeis.org/A010868"}]
  def create_sequence_a010868(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010868/1)
  end

  @doc offset: 0
  def seq_a010868(_idx) do
    29
  end

  @doc """
  OEIS Sequence `A010869` - Constant sequence: a(n) = 30.

  From [OEIS A010869](https://oeis.org/A010869):

  > Constant sequence: a(n) = 30.
  > (Formerly )

  **Sequence IDs**: `:a010869`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010869) |> Sequence.take!(54)
      [30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 30.",
       references: [{:oeis, :a010869, "https://oeis.org/A010869"}]
  def create_sequence_a010869(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010869/1)
  end

  @doc offset: 0
  def seq_a010869(_idx) do
    30
  end

  @doc """
  OEIS Sequence `A010870` - Constant sequence: a(n) = 31.

  From [OEIS A010870](https://oeis.org/A010870):

  > Constant sequence: a(n) = 31.
  > (Formerly )

  **Sequence IDs**: `:a010870`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010870) |> Sequence.take!(54)
      [31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 31.",
       references: [{:oeis, :a010870, "https://oeis.org/A010870"}]
  def create_sequence_a010870(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010870/1)
  end

  @doc offset: 0
  def seq_a010870(_idx) do
    31
  end

  @doc """
  OEIS Sequence `A010871` - Constant sequence: a(n) = 32.

  From [OEIS A010871](https://oeis.org/A010871):

  > Constant sequence: a(n) = 32.
  > (Formerly )

  **Sequence IDs**: `:a010871`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Constants, :a010871) |> Sequence.take!(54)
      [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]


  """
  @doc offset: 0,
       sequence: "Constant sequence: a(n) = 32.",
       references: [{:oeis, :a010871, "https://oeis.org/A010871"}]
  def create_sequence_a010871(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Constants.seq_a010871/1)
  end

  @doc offset: 0
  def seq_a010871(_idx) do
    32
  end
end
