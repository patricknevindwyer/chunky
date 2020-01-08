defmodule Chunky.Sequence.OEIS.Combinatorics do
   @moduledoc """
   Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with number
   representations, like alternate bases, digit contents, and patterns of digits.
    
   ## Available Sequences
   
    - [A159981 - Catalan numbers read modulo 4 .](https://oeis.org/A159981) - `:a159981` - `create_sequence_a159981/1`
    - [A159984 - Catalan numbers read modulo 5 .](https://oeis.org/A159984) - `:a159984` - `create_sequence_a159984/1`
    - [A159986 - Catalan numbers read modulo 7 .](https://oeis.org/A159986) - `:a159986` - `create_sequence_a159986/1`
    - [A159987 - Catalan numbers read modulo 8.](https://oeis.org/A159987) - `:a159987` - `create_sequence_a159987/1`
    - [A159988 - Catalan numbers read modulo 11 .](https://oeis.org/A159988) - `:a159988` - `create_sequence_a159988/1`
    - [A159989 - Catalan numbers read modulo 12.](https://oeis.org/A159989) - `:a159989` - `create_sequence_a159989/1`
    - [A289682 - Catalan numbers read modulo 16.](https://oeis.org/A289682) - `:a289682` - `create_sequence_a289682/1`
      
   """
   
   import Chunky.Sequence, only: [sequence_for_function: 1]

   alias Chunky.Math
   
   @doc """
   OEIS Sequence `A159981` - Catalan numbers read modulo 4 .

   From [OEIS A159981](https://oeis.org/A159981):

   > Catalan numbers read modulo 4 .
   > (Formerly )

   **Sequence IDs**: `:a159981`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a159981) |> Sequence.take!(105)
       [1,1,2,1,2,2,0,1,2,2,0,2,0,0,0,1,2,2,0,2,0,0,0,2,0,0,0,0,0,0,0,1,2,2,0,2,0,0,0,2,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,0,2,0,0,0,2,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 4 .",
        references: [{:oeis, :a159981, "https://oeis.org/A159981"}]
   def create_sequence_a159981(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a159981/1)
   end


   @doc offset: 0
   def seq_a159981(idx) do
       Math.catalan_number(idx) |> rem(4)
   end

   @doc """
   OEIS Sequence `A159984` - Catalan numbers read modulo 5 .

   From [OEIS A159984](https://oeis.org/A159984):

   > Catalan numbers read modulo 5 .
   > (Formerly )

   **Sequence IDs**: `:a159984`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a159984) |> Sequence.take!(105)
       [1,1,2,0,4,2,2,4,0,2,1,1,2,0,0,0,0,0,0,0,0,0,0,0,4,2,2,4,0,3,4,4,3,0,4,2,2,4,0,0,0,0,0,0,0,0,0,0,0,2,1,1,2,0,4,2,2,4,0,2,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 5 .",
        references: [{:oeis, :a159984, "https://oeis.org/A159984"}]
   def create_sequence_a159984(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a159984/1)
   end


   @doc offset: 0
   def seq_a159984(idx) do
       Math.catalan_number(idx) |> rem(5)
   end

   @doc """
   OEIS Sequence `A159986` - Catalan numbers read modulo 7 .

   From [OEIS A159986](https://oeis.org/A159986):

   > Catalan numbers read modulo 7 .
   > (Formerly )

   **Sequence IDs**: `:a159986`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a159986) |> Sequence.take!(106)
       [1,1,2,5,0,0,6,2,2,4,3,0,0,4,6,6,5,2,0,0,4,6,6,5,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,2,2,4,3,0,0,5,4,4,1,6,0,0,1,5,5,3,4,0,0,1,5,5,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,6,6,5,2,0,0,1,5]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 7 .",
        references: [{:oeis, :a159986, "https://oeis.org/A159986"}]
   def create_sequence_a159986(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a159986/1)
   end


   @doc offset: 0
   def seq_a159986(idx) do
       Math.catalan_number(idx) |> rem(7)
   end

   @doc """
   OEIS Sequence `A159987` - Catalan numbers read modulo 8.

   From [OEIS A159987](https://oeis.org/A159987):

   > Catalan numbers read modulo 8.
   > (Formerly )

   **Sequence IDs**: `:a159987`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a159987) |> Sequence.take!(105)
       [1,1,2,5,6,2,4,5,6,6,4,2,4,4,0,5,6,6,4,6,4,4,0,2,4,4,0,4,0,0,0,5,6,6,4,6,4,4,0,6,4,4,0,4,0,0,0,2,4,4,0,4,0,0,0,4,0,0,0,0,0,0,0,5,6,6,4,6,4,4,0,6,4,4,0,4,0,0,0,6,4,4,0,4,0,0,0,4,0,0,0,0,0,0,0,2,4,4,0,4,0,0,0,4,0]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 8.",
        references: [{:oeis, :a159987, "https://oeis.org/A159987"}]
   def create_sequence_a159987(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a159987/1)
   end


   @doc offset: 0
   def seq_a159987(idx) do
       Math.catalan_number(idx) |> rem(8)
   end

   @doc """
   OEIS Sequence `A159988` - Catalan numbers read modulo 11 .

   From [OEIS A159988](https://oeis.org/A159988):

   > Catalan numbers read modulo 11 .
   > (Formerly )

   **Sequence IDs**: `:a159988`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a159988) |> Sequence.take!(85)
       [1,1,2,5,3,9,0,0,0,0,10,2,2,4,10,6,7,0,0,0,0,8,6,6,1,8,7,10,0,0,0,0,1,9,9,7,1,5,4,0,0,0,0,9,4,4,8,9,1,3,0,0,0,0,6,10,10,9,6,8,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 11 .",
        references: [{:oeis, :a159988, "https://oeis.org/A159988"}]
   def create_sequence_a159988(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a159988/1)
   end


   @doc offset: 0
   def seq_a159988(idx) do
       Math.catalan_number(idx) |> rem(11)
   end

   @doc """
   OEIS Sequence `A159989` - Catalan numbers read modulo 12.

   From [OEIS A159989](https://oeis.org/A159989):

   > Catalan numbers read modulo 12.
   > (Formerly )

   **Sequence IDs**: `:a159989`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a159989) |> Sequence.take!(119)
       [1,1,2,5,2,6,0,9,2,2,8,10,4,4,0,9,6,6,0,6,0,0,0,6,0,0,8,8,8,4,4,1,6,6,0,10,4,4,8,2,8,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,6,6,0,6,0,0,0,6,0,0,0,0,0,0,0,6,8,8,8,4,4,4,0,0,0,4,4,4,8,8,8,6,0,0,0,0,0,0,0,0,0,0,0,4,4,4,8,8,8,0,0,0,8,8,8]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 12.",
        references: [{:oeis, :a159989, "https://oeis.org/A159989"}]
   def create_sequence_a159989(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a159989/1)
   end


   @doc offset: 0
   def seq_a159989(idx) do
       Math.catalan_number(idx) |> rem(12)
   end

   @doc """
   OEIS Sequence `A289682` - Catalan numbers read modulo 16.

   From [OEIS A289682](https://oeis.org/A289682):

   > Catalan numbers read modulo 16.
   > (Formerly )

   **Sequence IDs**: `:a289682`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Combinatorics, :a289682) |> Sequence.take!(88)
       [1,1,2,5,14,10,4,13,6,14,12,2,12,4,8,13,6,6,12,6,4,12,8,2,12,12,8,4,8,8,0,13,6,6,12,14,4,12,8,6,4,4,8,12,8,8,0,2,12,12,8,12,8,8,0,4,8,8,0,8,0,0,0,13,6,6,12,14,4,12,8,14,4,4,8,12,8,8,0,6,4,4,8,4,8,8,0,12]


   """
   @doc offset: 0,
        sequence: "Catalan numbers read modulo 16.",
        references: [{:oeis, :a289682, "https://oeis.org/A289682"}]
   def create_sequence_a289682(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Combinatorics.seq_a289682/1)
   end


   @doc offset: 0
   def seq_a289682(idx) do
       Math.catalan_number(idx) |> rem(16)
   end
   
end