defmodule Chunky.Sequence.OEIS.Repr do
   @moduledoc """
   Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with number
   representations, like alternate bases, digit contents, and patterns of digits.
   
   ## Available Sequences


    - [A011531 - Numbers that contain a digit 1 in their decimal representation.](https://oeis.org/A011531) - `:a011531` - `create_sequence_a011531/1`
    - [A011532 - Numbers that contain a 2.](https://oeis.org/A011532) - `:a011532` - `create_sequence_a011532/1`
    - [A011533 - Numbers that contain a 3.](https://oeis.org/A011533) - `:a011533` - `create_sequence_a011533/1`
    - [A011534 - Numbers that contain a 4.](https://oeis.org/A011534) - `:a011534` - `create_sequence_a011534/1`
    - [A011535 - Numbers that contain a 5.](https://oeis.org/A011535) - `:a011535` - `create_sequence_a011535/1`
    - [A011536 - Numbers that contain a 6.](https://oeis.org/A011536) - `:a011536` - `create_sequence_a011536/1`
    - [A011537 - Numbers that contain at least one 7.](https://oeis.org/A011537) - `:a011537` - `create_sequence_a011537/1`
    - [A011538 - Numbers that contain an 8.](https://oeis.org/A011538) - `:a011538` - `create_sequence_a011538/1`
    - [A011539 - "9ish numbers": decimal representation contains at least one nine.](https://oeis.org/A011539) - `:a011539` - `create_sequence_a011539/1`
    - [A011540 - Numbers that contain a digit 0.](https://oeis.org/A011540) - `:a011540` - `create_sequence_a011540/1`

   
   
   """ 
   
   import Chunky.Sequence, only: [sequence_for_function: 1]

   alias Chunky.Math
   
   
   @doc """
   OEIS Sequence `A011531` - Numbers that contain a digit 1 in their decimal representation.

   From [OEIS A011531](https://oeis.org/A011531):

   > Numbers that contain a digit 1 in their decimal representation.
   > (Formerly )

   **Sequence IDs**: `:a011531`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011531) |> Sequence.take!(53)
       [1,10,11,12,13,14,15,16,17,18,19,21,31,41,51,61,71,81,91,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a digit 1 in their decimal representation.",
        references: [{:oeis, :a011531, "https://oeis.org/A011531"}]
   def create_sequence_a011531(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011531/2)
   end


   @doc offset: 1
   def seq_a011531(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 1) end, last)
   end

   @doc """
   OEIS Sequence `A011532` - Numbers that contain a 2.

   From [OEIS A011532](https://oeis.org/A011532):

   > Numbers that contain a 2.
   > (Formerly )

   **Sequence IDs**: `:a011532`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011532) |> Sequence.take!(53)
       [2,12,20,21,22,23,24,25,26,27,28,29,32,42,52,62,72,82,92,102,112,120,121,122,123,124,125,126,127,128,129,132,142,152,162,172,182,192,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a 2.",
        references: [{:oeis, :a011532, "https://oeis.org/A011532"}]
   def create_sequence_a011532(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011532/2)
   end


   @doc offset: 1
   def seq_a011532(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 2) end, last)    
   end

   @doc """
   OEIS Sequence `A011533` - Numbers that contain a 3.

   From [OEIS A011533](https://oeis.org/A011533):

   > Numbers that contain a 3.
   > (Formerly )

   **Sequence IDs**: `:a011533`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011533) |> Sequence.take!(53)
       [3,13,23,30,31,32,33,34,35,36,37,38,39,43,53,63,73,83,93,103,113,123,130,131,132,133,134,135,136,137,138,139,143,153,163,173,183,193,203,213,223,230,231,232,233,234,235,236,237,238,239,243,253]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a 3.",
        references: [{:oeis, :a011533, "https://oeis.org/A011533"}]
   def create_sequence_a011533(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011533/2)
   end


   @doc offset: 1
   def seq_a011533(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 3) end, last)    
   end

   @doc """
   OEIS Sequence `A011534` - Numbers that contain a 4.

   From [OEIS A011534](https://oeis.org/A011534):

   > Numbers that contain a 4.
   > (Formerly )

   **Sequence IDs**: `:a011534`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011534) |> Sequence.take!(53)
       [4,14,24,34,40,41,42,43,44,45,46,47,48,49,54,64,74,84,94,104,114,124,134,140,141,142,143,144,145,146,147,148,149,154,164,174,184,194,204,214,224,234,240,241,242,243,244,245,246,247,248,249,254]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a 4.",
        references: [{:oeis, :a011534, "https://oeis.org/A011534"}]
   def create_sequence_a011534(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011534/2)
   end


   @doc offset: 1
   def seq_a011534(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 4) end, last)    
   end

   @doc """
   OEIS Sequence `A011535` - Numbers that contain a 5.

   From [OEIS A011535](https://oeis.org/A011535):

   > Numbers that contain a 5.
   > (Formerly )

   **Sequence IDs**: `:a011535`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011535) |> Sequence.take!(53)
       [5,15,25,35,45,50,51,52,53,54,55,56,57,58,59,65,75,85,95,105,115,125,135,145,150,151,152,153,154,155,156,157,158,159,165,175,185,195,205,215,225,235,245,250,251,252,253,254,255,256,257,258,259]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a 5.",
        references: [{:oeis, :a011535, "https://oeis.org/A011535"}]
   def create_sequence_a011535(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011535/2)
   end


   @doc offset: 1
   def seq_a011535(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 5) end, last)    
   end

   @doc """
   OEIS Sequence `A011536` - Numbers that contain a 6.

   From [OEIS A011536](https://oeis.org/A011536):

   > Numbers that contain a 6.
   > (Formerly )

   **Sequence IDs**: `:a011536`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011536) |> Sequence.take!(53)
       [6,16,26,36,46,56,60,61,62,63,64,65,66,67,68,69,76,86,96,106,116,126,136,146,156,160,161,162,163,164,165,166,167,168,169,176,186,196,206,216,226,236,246,256,260,261,262,263,264,265,266,267,268]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a 6.",
        references: [{:oeis, :a011536, "https://oeis.org/A011536"}]
   def create_sequence_a011536(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011536/2)
   end


   @doc offset: 1
   def seq_a011536(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 6) end, last)    
   end

   @doc """
   OEIS Sequence `A011537` - Numbers that contain at least one 7.

   From [OEIS A011537](https://oeis.org/A011537):

   > Numbers that contain at least one 7.
   > (Formerly )

   **Sequence IDs**: `:a011537`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011537) |> Sequence.take!(53)
       [7,17,27,37,47,57,67,70,71,72,73,74,75,76,77,78,79,87,97,107,117,127,137,147,157,167,170,171,172,173,174,175,176,177,178,179,187,197,207,217,227,237,247,257,267,270,271,272,273,274,275,276,277]


   """
   @doc offset: 1,
        sequence: "Numbers that contain at least one 7.",
        references: [{:oeis, :a011537, "https://oeis.org/A011537"}]
   def create_sequence_a011537(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011537/2)
   end


   @doc offset: 1
   def seq_a011537(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 7) end, last)    
   end

   @doc """
   OEIS Sequence `A011538` - Numbers that contain an 8.

   From [OEIS A011538](https://oeis.org/A011538):

   > Numbers that contain an 8.
   > (Formerly )

   **Sequence IDs**: `:a011538`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011538) |> Sequence.take!(53)
       [8,18,28,38,48,58,68,78,80,81,82,83,84,85,86,87,88,89,98,108,118,128,138,148,158,168,178,180,181,182,183,184,185,186,187,188,189,198,208,218,228,238,248,258,268,278,280,281,282,283,284,285,286]


   """
   @doc offset: 1,
        sequence: "Numbers that contain an 8.",
        references: [{:oeis, :a011538, "https://oeis.org/A011538"}]
   def create_sequence_a011538(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011538/2)
   end


   @doc offset: 1
   def seq_a011538(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 8) end, last)    
   end

   @doc """
   OEIS Sequence `A011539` - "9ish numbers": decimal representation contains at least one nine.

   From [OEIS A011539](https://oeis.org/A011539):

   > "9ish numbers": decimal representation contains at least one nine.
   > (Formerly )

   **Sequence IDs**: `:a011539`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011539) |> Sequence.take!(53)
       [9,19,29,39,49,59,69,79,89,90,91,92,93,94,95,96,97,98,99,109,119,129,139,149,159,169,179,189,190,191,192,193,194,195,196,197,198,199,209,219,229,239,249,259,269,279,289,290,291,292,293,294,295]


   """
   @doc offset: 1,
        sequence: "9ish numbers: decimal representation contains at least one nine.",
        references: [{:oeis, :a011539, "https://oeis.org/A011539"}]
   def create_sequence_a011539(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011539/2)
   end


   @doc offset: 1
   def seq_a011539(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 9) end, last)    
   end

   @doc """
   OEIS Sequence `A011540` - Numbers that contain a digit 0.

   From [OEIS A011540](https://oeis.org/A011540):

   > Numbers that contain a digit 0.
   > (Formerly )

   **Sequence IDs**: `:a011540`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011540) |> Sequence.take!(51)
       [0,10,20,30,40,50,60,70,80,90,100,101,102,103,104,105,106,107,108,109,110,120,130,140,150,160,170,180,190,200,201,202,203,204,205,206,207,208,209,210,220,230,240,250,260,270,280,290,300,301,302]


   """
   @doc offset: 1,
        sequence: "Numbers that contain a digit 0.",
        references: [{:oeis, :a011540, "https://oeis.org/A011540"}]
   def create_sequence_a011540(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011540/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a011540(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 0) end, last)    
   end
   
end