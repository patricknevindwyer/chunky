defmodule Chunky.Sequence.OEIS.Repr do
   @moduledoc """
   Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with number
   representations, like alternate bases, digit contents, and patterns of digits.
   
   ## Available Sequences

    - [A004176 - Omit 1's from n.](https://oeis.org/A004176) - `:a004176` - `create_sequence_a004176/1`
    - [A004177 - Omit 2's from n.](https://oeis.org/A004177) - `:a004177` - `create_sequence_a004177/1`
    - [A004178 - Omit 3's from n.](https://oeis.org/A004178) - `:a004178` - `create_sequence_a004178/1`
    - [A004179 - Omit 4's from n.](https://oeis.org/A004179) - `:a004179` - `create_sequence_a004179/1`
    - [A004180 - Omit 5's from n.](https://oeis.org/A004180) - `:a004180` - `create_sequence_a004180/1`
    - [A004181 - Omit 6's from n.](https://oeis.org/A004181) - `:a004181` - `create_sequence_a004181/1`
    - [A004182 - Omit 7's from n.](https://oeis.org/A004182) - `:a004182` - `create_sequence_a004182/1`
    - [A004183 - Omit 8's from n.](https://oeis.org/A004183) - `:a004183` - `create_sequence_a004183/1`
    - [A004184 - Omit 9's from n.](https://oeis.org/A004184) - `:a004184` - `create_sequence_a004184/1`
    - [A004719 - Delete all 0's from n.](https://oeis.org/A004719) - `:a004719` - `create_sequence_a004719/1`
    - [A004720 - Delete all digits '1' from the sequence of nonnegative integers.](https://oeis.org/A004720) - `:a004720` - `create_sequence_a004720/1`
    - [A004721 - Delete all 2's from the sequence of nonnegative integers.](https://oeis.org/A004721) - `:a004721` - `create_sequence_a004721/1`
    - [A004722 - Delete all digits 3 from the terms of the sequence of nonnegative integers.](https://oeis.org/A004722) - `:a004722` - `create_sequence_a004722/1`
    - [A004723 - Delete all 4's from the sequence of nonnegative integers.](https://oeis.org/A004723) - `:a004723` - `create_sequence_a004723/1`
    - [A004724 - Delete all 5's from the sequence of nonnegative integers.](https://oeis.org/A004724) - `:a004724` - `create_sequence_a004724/1`
    - [A004725 - Delete all 6's from the sequence of nonnegative integers.](https://oeis.org/A004725) - `:a004725` - `create_sequence_a004725/1`
    - [A004726 - Delete all 7's from the sequence of nonnegative integers.](https://oeis.org/A004726) - `:a004726` - `create_sequence_a004726/1`
    - [A004727 - Delete all 8's from the sequence of nonnegative integers.](https://oeis.org/A004727) - `:a004727` - `create_sequence_a004727/1`
    - [A004728 - Delete all 9's from the sequence of nonnegative integers.](https://oeis.org/A004728) - `:a004728` - `create_sequence_a004728/1`
    - [A007088 - The binary numbers (or binary words, or binary vectors): numbers written in base 2.](https://oeis.org/A007088) - `:a007088` - `create_sequence_a007088/1`
    - [A007089 - Numbers in base 3.](https://oeis.org/A007089) - `:a007089` - `create_sequence_a007089/1`
    - [A007090 - Numbers in base 4.](https://oeis.org/A007090) - `:a007090` - `create_sequence_a007090/1`
    - [A007091 - Numbers in base 5.](https://oeis.org/A007091) - `:a007091` - `create_sequence_a007091/1`
    - [A007092 - Numbers in base 6.](https://oeis.org/A007092) - `:a007092` - `create_sequence_a007092/1`
    - [A007093 - Numbers in base 7.](https://oeis.org/A007093) - `:a007093` - `create_sequence_a007093/1`
    - [A007094 - Numbers in base 8.](https://oeis.org/A007094) - `:a007094` - `create_sequence_a007094/1`
    - [A007095 - Numbers in base 9.](https://oeis.org/A007095) - `:a007095` - `create_sequence_a007095/1`
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
    - [A052382 - Numbers without 0 as a digit, a.k.a. zeroless numbers.](https://oeis.org/A052382) - `:a052382` - `create_sequence_a052382/1`
    - [A052383 - Numbers without 1 as a digit.](https://oeis.org/A052383) - `:a052383` - `create_sequence_a052383/1`
    - [A052404 - Numbers without 2 as a digit.](https://oeis.org/A052404) - `:a052404` - `create_sequence_a052404/1`
    - [A052405 - Numbers without 3 as a digit.](https://oeis.org/A052405) - `:a052405` - `create_sequence_a052405/1`
    - [A052406 - Numbers without 4 as a digit.](https://oeis.org/A052406) - `:a052406` - `create_sequence_a052406/1`
    - [A052413 - Numbers without 5 as a digit.](https://oeis.org/A052413) - `:a052413` - `create_sequence_a052413/1`
    - [A052414 - Numbers without 6 as a digit.](https://oeis.org/A052414) - `:a052414` - `create_sequence_a052414/1`
    - [A052419 - Numbers without 7 as a digit.](https://oeis.org/A052419) - `:a052419` - `create_sequence_a052419/1`
    - [A052421 - Numbers without 8 as a digit.](https://oeis.org/A052421) - `:a052421` - `create_sequence_a052421/1`
    - [A099542 - Rhonda numbers to base 10.](https://oeis.org/A099542) - `:a099542` - `create_sequence_a099542/1`
    - [A100968 - Integers n that are Rhonda numbers to base 4.](https://oeis.org/A100968) - `:a100968` - `create_sequence_a100968/1`
    - [A100969 - Integers n that are Rhonda numbers to base 6.](https://oeis.org/A100969) - `:a100969` - `create_sequence_a100969/1`
    - [A100970 - Integers n that are Rhonda numbers to base 8.](https://oeis.org/A100970) - `:a100970` - `create_sequence_a100970/1`
    - [A100973 - Integers that are Rhonda numbers to base 9.](https://oeis.org/A100973) - `:a100973` - `create_sequence_a100973/1`
    - [A100971 - Integers n that are Rhonda numbers to base 12.](https://oeis.org/A100971) - `:a100971` - `create_sequence_a100971/1`
    - [A100972 - Integers that are Rhonda numbers to base 14.](https://oeis.org/A100972) - `:a100972` - `create_sequence_a100972/1`
    - [A100974 - Integers that are Rhonda numbers to base 15.](https://oeis.org/A100974) - `:a100974` - `create_sequence_a100974/1`
    - [A100975 - Integers that are Rhonda numbers to base 16.](https://oeis.org/A100975) - `:a100975` - `create_sequence_a100975/1`
    - [A100987 - Integers that are Rhonda numbers to some base.](https://oeis.org/A100987) - `:a100987` - `create_sequence_a100987/1`
    - [A100988 - Integers that are Rhonda numbers to more than one base.](https://oeis.org/A100988) - `:a100988` - `create_sequence_a100988/1`
    - [A121022 - Even numbers containing a 2 in their decimal representation.](https://oeis.org/A121022) - `:a121022` - `create_sequence_a121022/1`
    - [A255732 - Rhonda numbers in vigesimal number system.](https://oeis.org/A255732) - `:a255732` - `create_sequence_a255732/1`
    - [A255736 - Integers that are Rhonda numbers to base 30.](https://oeis.org/A255736) - `:a255736` - `create_sequence_a255736/1`
    - [A255731 - Rhonda numbers in sexagesimal number system.](https://oeis.org/A255731) - `:a255731` - `create_sequence_a255731/1`
    - [A255735 - Integers that are Rhonda numbers to base 18.](https://oeis.org/A255735) - `:a255735` - `create_sequence_a255735/1`

   
   """ 
   
   import Chunky.Sequence, only: [sequence_for_function: 1]

   alias Chunky.Math
   
   @doc """
   OEIS Sequence `A004176` - Omit 1's from n.

   From [OEIS A004176](https://oeis.org/A004176):

   > Omit 1's from n.
   > (Formerly )

   **Sequence IDs**: `:a004176`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004176) |> Sequence.take!(75)
       [0,0,2,3,4,5,6,7,8,9,0,0,2,3,4,5,6,7,8,9,20,2,22,23,24,25,26,27,28,29,30,3,32,33,34,35,36,37,38,39,40,4,42,43,44,45,46,47,48,49,50,5,52,53,54,55,56,57,58,59,60,6,62,63,64,65,66,67,68,69,70,7,72,73,74]


   """
   @doc offset: 0,
        sequence: "Omit 1's from n.",
        references: [{:oeis, :a004176, "https://oeis.org/A004176"}]
   def create_sequence_a004176(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004176/1)
   end


   @doc offset: 0
   def seq_a004176(idx) do
       Math.remove_digits!(idx, [1])
   end

   @doc """
   OEIS Sequence `A004177` - Omit 2's from n.

   From [OEIS A004177](https://oeis.org/A004177):

   > Omit 2's from n.
   > (Formerly )

   **Sequence IDs**: `:a004177`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004177) |> Sequence.take!(75)
       [0,1,0,3,4,5,6,7,8,9,10,11,1,13,14,15,16,17,18,19,0,1,0,3,4,5,6,7,8,9,30,31,3,33,34,35,36,37,38,39,40,41,4,43,44,45,46,47,48,49,50,51,5,53,54,55,56,57,58,59,60,61,6,63,64,65,66,67,68,69,70,71,7,73,74]


   """
   @doc offset: 0,
        sequence: "Omit 2's from n.",
        references: [{:oeis, :a004177, "https://oeis.org/A004177"}]
   def create_sequence_a004177(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004177/1)
   end


   @doc offset: 0
   def seq_a004177(idx) do
       Math.remove_digits!(idx, [2])
   end

   @doc """
   OEIS Sequence `A004178` - Omit 3's from n.

   From [OEIS A004178](https://oeis.org/A004178):

   > Omit 3's from n.
   > (Formerly )

   **Sequence IDs**: `:a004178`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004178) |> Sequence.take!(75)
       [0,1,2,0,4,5,6,7,8,9,10,11,12,1,14,15,16,17,18,19,20,21,22,2,24,25,26,27,28,29,0,1,2,0,4,5,6,7,8,9,40,41,42,4,44,45,46,47,48,49,50,51,52,5,54,55,56,57,58,59,60,61,62,6,64,65,66,67,68,69,70,71,72,7,74]


   """
   @doc offset: 0,
        sequence: "Omit 3's from n.",
        references: [{:oeis, :a004178, "https://oeis.org/A004178"}]
   def create_sequence_a004178(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004178/1)
   end


   @doc offset: 0
   def seq_a004178(idx) do
       Math.remove_digits!(idx, [3])
   end

   @doc """
   OEIS Sequence `A004179` - Omit 4's from n.

   From [OEIS A004179](https://oeis.org/A004179):

   > Omit 4's from n.
   > (Formerly )

   **Sequence IDs**: `:a004179`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004179) |> Sequence.take!(75)
       [0,1,2,3,0,5,6,7,8,9,10,11,12,13,1,15,16,17,18,19,20,21,22,23,2,25,26,27,28,29,30,31,32,33,3,35,36,37,38,39,0,1,2,3,0,5,6,7,8,9,50,51,52,53,5,55,56,57,58,59,60,61,62,63,6,65,66,67,68,69,70,71,72,73,7]


   """
   @doc offset: 0,
        sequence: "Omit 4's from n.",
        references: [{:oeis, :a004179, "https://oeis.org/A004179"}]
   def create_sequence_a004179(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004179/1)
   end


   @doc offset: 0
   def seq_a004179(idx) do
       Math.remove_digits!(idx, [4])
   end

   @doc """
   OEIS Sequence `A004180` - Omit 5's from n.

   From [OEIS A004180](https://oeis.org/A004180):

   > Omit 5's from n.
   > (Formerly )

   **Sequence IDs**: `:a004180`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004180) |> Sequence.take!(75)
       [0,1,2,3,4,0,6,7,8,9,10,11,12,13,14,1,16,17,18,19,20,21,22,23,24,2,26,27,28,29,30,31,32,33,34,3,36,37,38,39,40,41,42,43,44,4,46,47,48,49,0,1,2,3,4,0,6,7,8,9,60,61,62,63,64,6,66,67,68,69,70,71,72,73,74]


   """
   @doc offset: 0,
        sequence: "Omit 5's from n.",
        references: [{:oeis, :a004180, "https://oeis.org/A004180"}]
   def create_sequence_a004180(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004180/1)
   end


   @doc offset: 0
   def seq_a004180(idx) do
       Math.remove_digits!(idx, [5])
   end

   @doc """
   OEIS Sequence `A004181` - Omit 6's from n.

   From [OEIS A004181](https://oeis.org/A004181):

   > Omit 6's from n.
   > (Formerly )

   **Sequence IDs**: `:a004181`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004181) |> Sequence.take!(75)
       [0,1,2,3,4,5,0,7,8,9,10,11,12,13,14,15,1,17,18,19,20,21,22,23,24,25,2,27,28,29,30,31,32,33,34,35,3,37,38,39,40,41,42,43,44,45,4,47,48,49,50,51,52,53,54,55,5,57,58,59,0,1,2,3,4,5,0,7,8,9,70,71,72,73,74]


   """
   @doc offset: 0,
        sequence: "Omit 6's from n.",
        references: [{:oeis, :a004181, "https://oeis.org/A004181"}]
   def create_sequence_a004181(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004181/1)
   end


   @doc offset: 0
   def seq_a004181(idx) do
       Math.remove_digits!(idx, [6])
   end

   @doc """
   OEIS Sequence `A004182` - Omit 7's from n.

   From [OEIS A004182](https://oeis.org/A004182):

   > Omit 7's from n.
   > (Formerly )

   **Sequence IDs**: `:a004182`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004182) |> Sequence.take!(73)
       [0,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,1,18,19,20,21,22,23,24,25,26,2,28,29,30,31,32,33,34,35,36,3,38,39,40,41,42,43,44,45,46,4,48,49,50,51,52,53,54,55,56,5,58,59,60,61,62,63,64,65,66,6,68,69,0,1,2]


   """
   @doc offset: 0,
        sequence: "Omit 7's from n.",
        references: [{:oeis, :a004182, "https://oeis.org/A004182"}]
   def create_sequence_a004182(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004182/1)
   end


   @doc offset: 0
   def seq_a004182(idx) do
       Math.remove_digits!(idx, [7])
   end

   @doc """
   OEIS Sequence `A004183` - Omit 8's from n.

   From [OEIS A004183](https://oeis.org/A004183):

   > Omit 8's from n.
   > (Formerly )

   **Sequence IDs**: `:a004183`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004183) |> Sequence.take!(72)
       [0,1,2,3,4,5,6,7,0,9,10,11,12,13,14,15,16,17,1,19,20,21,22,23,24,25,26,27,2,29,30,31,32,33,34,35,36,37,3,39,40,41,42,43,44,45,46,47,4,49,50,51,52,53,54,55,56,57,5,59,60,61,62,63,64,65,66,67,6,69,70,71]


   """
   @doc offset: 0,
        sequence: "Omit 8's from n.",
        references: [{:oeis, :a004183, "https://oeis.org/A004183"}]
   def create_sequence_a004183(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004183/1)
   end


   @doc offset: 0
   def seq_a004183(idx) do
       Math.remove_digits!(idx, [8])
   end

   @doc """
   OEIS Sequence `A004184` - Omit 9's from n.

   From [OEIS A004184](https://oeis.org/A004184):

   > Omit 9's from n.
   > (Formerly )

   **Sequence IDs**: `:a004184`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004184) |> Sequence.take!(72)
       [0,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,1,20,21,22,23,24,25,26,27,28,2,30,31,32,33,34,35,36,37,38,3,40,41,42,43,44,45,46,47,48,4,50,51,52,53,54,55,56,57,58,5,60,61,62,63,64,65,66,67,68,6,70,71]


   """
   @doc offset: 0,
        sequence: "Omit 9's from n.",
        references: [{:oeis, :a004184, "https://oeis.org/A004184"}]
   def create_sequence_a004184(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004184/1)
   end


   @doc offset: 0
   def seq_a004184(idx) do
       Math.remove_digits!(idx, [9])
   end
   
   @doc """
   OEIS Sequence `A004719` - Delete all 0's from n.

   From [OEIS A004719](https://oeis.org/A004719):

   > Delete all 0's from n.
   > (Formerly )

   **Sequence IDs**: `:a004719`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004719) |> Sequence.take!(120)
       [1,2,3,4,5,6,7,8,9,1,11,12,13,14,15,16,17,18,19,2,21,22,23,24,25,26,27,28,29,3,31,32,33,34,35,36,37,38,39,4,41,42,43,44,45,46,47,48,49,5,51,52,53,54,55,56,57,58,59,6,61,62,63,64,65,66,67,68,69,7,71,72,73,74,75,76,77,78,79,8,81,82,83,84,85,86,87,88,89,9,91,92,93,94,95,96,97,98,99,1,11,12,13,14,15,16,17,18,19,11,111,112,113,114,115,116,117,118,119,12]


   """
   @doc offset: 1,
        sequence: "Delete all 0's from n.",
        references: [{:oeis, :a004719, "https://oeis.org/A004719"}]
   def create_sequence_a004719(_opts) do
       %{
           next_fn: &seq_a004719/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004719(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004719(:next, data, _v) do
       
       # find the next number
       r = 0
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004720` - Delete all digits '1' from the sequence of nonnegative integers.

   From [OEIS A004720](https://oeis.org/A004720):

   > Delete all digits '1' from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004720`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004720) |> Sequence.take!(74)
       [0,2,3,4,5,6,7,8,9,0,2,3,4,5,6,7,8,9,20,2,22,23,24,25,26,27,28,29,30,3,32,33,34,35,36,37,38,39,40,4,42,43,44,45,46,47,48,49,50,5,52,53,54,55,56,57,58,59,60,6,62,63,64,65,66,67,68,69,70,7,72,73,74,75]


   """
   @doc offset: 1,
        sequence: "Delete all digits '1' from the sequence of nonnegative integers.",
        references: [{:oeis, :a004720, "https://oeis.org/A004720"}]
   def create_sequence_a004720(_opts) do
       %{
           next_fn: &seq_a004720/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004720(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004720(:next, data, _v) do
       
       # find the next number
       r = 1
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004721` - Delete all 2's from the sequence of nonnegative integers.

   From [OEIS A004721](https://oeis.org/A004721):

   > Delete all 2's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004721`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004721) |> Sequence.take!(74)
       [0,1,3,4,5,6,7,8,9,10,11,1,13,14,15,16,17,18,19,0,1,3,4,5,6,7,8,9,30,31,3,33,34,35,36,37,38,39,40,41,4,43,44,45,46,47,48,49,50,51,5,53,54,55,56,57,58,59,60,61,6,63,64,65,66,67,68,69,70,71,7,73,74,75]


   """
   @doc offset: 0,
        sequence: "Delete all 2's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004721, "https://oeis.org/A004721"}]
   def create_sequence_a004721(_opts) do
       %{
           next_fn: &seq_a004721/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004721(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004721(:next, data, _v) do
       
       # find the next number
       r = 2
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004722` - Delete all digits 3 from the terms of the sequence of nonnegative integers.

   From [OEIS A004722](https://oeis.org/A004722):

   > Delete all digits 3 from the terms of the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004722`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004722) |> Sequence.take!(75)
       [0,1,2,4,5,6,7,8,9,10,11,12,1,14,15,16,17,18,19,20,21,22,2,24,25,26,27,28,29,0,1,2,4,5,6,7,8,9,40,41,42,4,44,45,46,47,48,49,50,51,52,5,54,55,56,57,58,59,60,61,62,6,64,65,66,67,68,69,70,71,72,7,74,75,76]


   """
   @doc offset: 0,
        sequence: "Delete all digits 3 from the terms of the sequence of nonnegative integers.",
        references: [{:oeis, :a004722, "https://oeis.org/A004722"}]
   def create_sequence_a004722(_opts) do           
       %{
           next_fn: &seq_a004722/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004722(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004722(:next, data, _v) do
       
       # find the next number
       r = 3
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004723` - Delete all 4's from the sequence of nonnegative integers.

   From [OEIS A004723](https://oeis.org/A004723):

   > Delete all 4's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004723`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004723) |> Sequence.take!(74)
       [0,1,2,3,5,6,7,8,9,10,11,12,13,1,15,16,17,18,19,20,21,22,23,2,25,26,27,28,29,30,31,32,33,3,35,36,37,38,39,0,1,2,3,5,6,7,8,9,50,51,52,53,5,55,56,57,58,59,60,61,62,63,6,65,66,67,68,69,70,71,72,73,7,75]


   """
   @doc offset: 0,
        sequence: "Delete all 4's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004723, "https://oeis.org/A004723"}]
   def create_sequence_a004723(_opts) do
       %{
           next_fn: &seq_a004723/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004723(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004723(:next, data, _v) do
       
       # find the next number
       r = 4
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004724` - Delete all 5's from the sequence of nonnegative integers.

   From [OEIS A004724](https://oeis.org/A004724):

   > Delete all 5's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004724`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004724) |> Sequence.take!(75)
       [0,1,2,3,4,6,7,8,9,10,11,12,13,14,1,16,17,18,19,20,21,22,23,24,2,26,27,28,29,30,31,32,33,34,3,36,37,38,39,40,41,42,43,44,4,46,47,48,49,0,1,2,3,4,6,7,8,9,60,61,62,63,64,6,66,67,68,69,70,71,72,73,74,7,76]


   """
   @doc offset: 0,
        sequence: "Delete all 5's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004724, "https://oeis.org/A004724"}]
   def create_sequence_a004724(_opts) do
       %{
           next_fn: &seq_a004724/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004724(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004724(:next, data, _v) do
       
       # find the next number
       r = 5
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004725` - Delete all 6's from the sequence of nonnegative integers.

   From [OEIS A004725](https://oeis.org/A004725):

   > Delete all 6's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004725`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004725) |> Sequence.take!(75)
       [0,1,2,3,4,5,7,8,9,10,11,12,13,14,15,1,17,18,19,20,21,22,23,24,25,2,27,28,29,30,31,32,33,34,35,3,37,38,39,40,41,42,43,44,45,4,47,48,49,50,51,52,53,54,55,5,57,58,59,0,1,2,3,4,5,7,8,9,70,71,72,73,74,75,7]


   """
   @doc offset: 0,
        sequence: "Delete all 6's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004725, "https://oeis.org/A004725"}]
   def create_sequence_a004725(_opts) do
       %{
           next_fn: &seq_a004725/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004725(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004725(:next, data, _v) do
       
       # find the next number
       r = 6
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004726` - Delete all 7's from the sequence of nonnegative integers.

   From [OEIS A004726](https://oeis.org/A004726):

   > Delete all 7's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004726`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004726) |> Sequence.take!(72)
       [0,1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,1,18,19,20,21,22,23,24,25,26,2,28,29,30,31,32,33,34,35,36,3,38,39,40,41,42,43,44,45,46,4,48,49,50,51,52,53,54,55,56,5,58,59,60,61,62,63,64,65,66,6,68,69,0,1,2]


   """
   @doc offset: 0,
        sequence: "Delete all 7's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004726, "https://oeis.org/A004726"}]
   def create_sequence_a004726(_opts) do
       %{
           next_fn: &seq_a004726/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004726(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004726(:next, data, _v) do
       
       # find the next number
       r = 7
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004727` - Delete all 8's from the sequence of nonnegative integers.

   From [OEIS A004727](https://oeis.org/A004727):

   > Delete all 8's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004727`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004727) |> Sequence.take!(71)
       [0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,1,19,20,21,22,23,24,25,26,27,2,29,30,31,32,33,34,35,36,37,3,39,40,41,42,43,44,45,46,47,4,49,50,51,52,53,54,55,56,57,5,59,60,61,62,63,64,65,66,67,6,69,70,71]


   """
   @doc offset: 0,
        sequence: "Delete all 8's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004727, "https://oeis.org/A004727"}]
   def create_sequence_a004727(_opts) do
       %{
           next_fn: &seq_a004727/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004727(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004727(:next, data, _v) do
       
       # find the next number
       r = 8
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end

   @doc """
   OEIS Sequence `A004728` - Delete all 9's from the sequence of nonnegative integers.

   From [OEIS A004728](https://oeis.org/A004728):

   > Delete all 9's from the sequence of nonnegative integers.
   > (Formerly )

   **Sequence IDs**: `:a004728`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004728) |> Sequence.take!(71)
       [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,1,20,21,22,23,24,25,26,27,28,2,30,31,32,33,34,35,36,37,38,3,40,41,42,43,44,45,46,47,48,4,50,51,52,53,54,55,56,57,58,5,60,61,62,63,64,65,66,67,68,6,70,71]


   """
   @doc offset: 0,
        sequence: "Delete all 9's from the sequence of nonnegative integers.",
        references: [{:oeis, :a004728, "https://oeis.org/A004728"}]
   def create_sequence_a004728(_opts) do
       %{
           next_fn: &seq_a004728/3,
           data: %{
               last_number: -1
           }
       }
   end

   def seq_a004728(:init, data, _v), do: %{data: data, value: 0}
   def seq_a004728(:next, data, _v) do
       
       # find the next number
       r = 9
       n = Math.next_number(
           fn v -> 
               Math.remove_digits!(v, [r], empty: false)
           end, 
           data.last_number
       )
       
       # store it and return it
       {
           :continue,
           %{
               data: data |> Map.put(:last_number, n),
               value: n |> Math.remove_digits!([r])
           }
       }
       
   end
   
   @doc """
   OEIS Sequence `A007088` - The binary numbers (or binary words, or binary vectors): numbers written in base 2.

   From [OEIS A007088](https://oeis.org/A007088):

   > The binary numbers (or binary words, or binary vectors): numbers written in base 2.
   > (Formerly M4679)

   **Sequence IDs**: `:a007088`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007088) |> Sequence.take!(40)
       [0,1,10,11,100,101,110,111,1000,1001,1010,1011,1100,1101,1110,1111,10000,10001,10010,10011,10100,10101,10110,10111,11000,11001,11010,11011,11100,11101,11110,11111,100000,100001,100010,100011,100100,100101,100110,100111]


   """
   @doc offset: 0,
        sequence: "The binary numbers (or binary words, or binary vectors): numbers written in base 2.",
        references: [{:oeis, :a007088, "https://oeis.org/A007088"}]
   def create_sequence_a007088(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007088/1)
   end


   @doc offset: 0
   def seq_a007088(idx) do
       idx |> Integer.digits(2) |> Integer.undigits()
   end

   @doc """
   OEIS Sequence `A007089` - Numbers in base 3.

   From [OEIS A007089](https://oeis.org/A007089):

   > Numbers in base 3.
   > (Formerly M1960)

   **Sequence IDs**: `:a007089`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007089) |> Sequence.take!(50)
       [0,1,2,10,11,12,20,21,22,100,101,102,110,111,112,120,121,122,200,201,202,210,211,212,220,221,222,1000,1001,1002,1010,1011,1012,1020,1021,1022,1100,1101,1102,1110,1111,1112,1120,1121,1122,1200,1201,1202,1210,1211]


   """
   @doc offset: 0,
        sequence: "Numbers in base 3.",
        references: [{:oeis, :a007089, "https://oeis.org/A007089"}]
   def create_sequence_a007089(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007089/1)
   end


   @doc offset: 0
   def seq_a007089(idx) do
       idx |> Integer.digits(3) |> Integer.undigits()
   end

   @doc """
   OEIS Sequence `A007090` - Numbers in base 4.

   From [OEIS A007090](https://oeis.org/A007090):

   > Numbers in base 4.
   > (Formerly M0900)

   **Sequence IDs**: `:a007090`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007090) |> Sequence.take!(64)
       [0,1,2,3,10,11,12,13,20,21,22,23,30,31,32,33,100,101,102,103,110,111,112,113,120,121,122,123,130,131,132,133,200,201,202,203,210,211,212,213,220,221,222,223,230,231,232,233,300,301,302,303,310,311,312,313,320,321,322,323,330,331,332,333]


   """
   @doc offset: 0,
        sequence: "Numbers in base 4.",
        references: [{:oeis, :a007090, "https://oeis.org/A007090"}]
   def create_sequence_a007090(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007090/1)
   end


   @doc offset: 0
   def seq_a007090(idx) do
       idx |> Integer.digits(4) |> Integer.undigits()
   end

   @doc """
   OEIS Sequence `A007091` - Numbers in base 5.

   From [OEIS A007091](https://oeis.org/A007091):

   > Numbers in base 5.
   > (Formerly M0595)

   **Sequence IDs**: `:a007091`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007091) |> Sequence.take!(66)
       [0,1,2,3,4,10,11,12,13,14,20,21,22,23,24,30,31,32,33,34,40,41,42,43,44,100,101,102,103,104,110,111,112,113,114,120,121,122,123,124,130,131,132,133,134,140,141,142,143,144,200,201,202,203,204,210,211,212,213,214,220,221,222,223,224,230]


   """
   @doc offset: 0,
        sequence: "Numbers in base 5.",
        references: [{:oeis, :a007091, "https://oeis.org/A007091"}]
   def create_sequence_a007091(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007091/1)
   end


   @doc offset: 0
   def seq_a007091(idx) do
       idx |> Integer.digits(5) |> Integer.undigits()
   end

   @doc """
   OEIS Sequence `A007092` - Numbers in base 6.

   From [OEIS A007092](https://oeis.org/A007092):

   > Numbers in base 6.
   > (Formerly M0532)

   **Sequence IDs**: `:a007092`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007092) |> Sequence.take!(66)
       [0,1,2,3,4,5,10,11,12,13,14,15,20,21,22,23,24,25,30,31,32,33,34,35,40,41,42,43,44,45,50,51,52,53,54,55,100,101,102,103,104,105,110,111,112,113,114,115,120,121,122,123,124,125,130,131,132,133,134,135,140,141,142,143,144,145]


   """
   @doc offset: 0,
        sequence: "Numbers in base 6.",
        references: [{:oeis, :a007092, "https://oeis.org/A007092"}]
   def create_sequence_a007092(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007092/1)
   end


   @doc offset: 0
   def seq_a007092(idx) do
       idx |> Integer.digits(6) |> Integer.undigits()
   end

   @doc """
   OEIS Sequence `A007093` - Numbers in base 7.

   From [OEIS A007093](https://oeis.org/A007093):

   > Numbers in base 7.
   > (Formerly M0511)

   **Sequence IDs**: `:a007093`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007093) |> Sequence.take!(64)
       [0,1,2,3,4,5,6,10,11,12,13,14,15,16,20,21,22,23,24,25,26,30,31,32,33,34,35,36,40,41,42,43,44,45,46,50,51,52,53,54,55,56,60,61,62,63,64,65,66,100,101,102,103,104,105,106,110,111,112,113,114,115,116,120]


   """
   @doc offset: 0,
        sequence: "Numbers in base 7.",
        references: [{:oeis, :a007093, "https://oeis.org/A007093"}]
   def create_sequence_a007093(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007093/1)
   end


   @doc offset: 0
   def seq_a007093(idx) do
       idx |> Integer.digits(7) |> Integer.undigits()
   end

   @doc """
   OEIS Sequence `A007094` - Numbers in base 8.

   From [OEIS A007094](https://oeis.org/A007094):

   > Numbers in base 8.
   > (Formerly M0498)

   **Sequence IDs**: `:a007094`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007094) |> Sequence.take!(74)
       [0,1,2,3,4,5,6,7,10,11,12,13,14,15,16,17,20,21,22,23,24,25,26,27,30,31,32,33,34,35,36,37,40,41,42,43,44,45,46,47,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,70,71,72,73,74,75,76,77,100,101,102,103,104,105,106,107,110,111]


   """
   @doc offset: 0,
        sequence: "Numbers in base 8.",
        references: [{:oeis, :a007094, "https://oeis.org/A007094"}]
   def create_sequence_a007094(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007094/1)
   end


   @doc offset: 0
   def seq_a007094(idx) do
       idx |> Integer.digits(8) |> Integer.undigits()    
   end

   @doc """
   OEIS Sequence `A007095` - Numbers in base 9.

   From [OEIS A007095](https://oeis.org/A007095):

   > Numbers in base 9.
   > (Formerly M0490)

   **Sequence IDs**: `:a007095`

   **Finite**: False

   **Offset**: 0

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007095) |> Sequence.take!(77)
       [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,20,21,22,23,24,25,26,27,28,30,31,32,33,34,35,36,37,38,40,41,42,43,44,45,46,47,48,50,51,52,53,54,55,56,57,58,60,61,62,63,64,65,66,67,68,70,71,72,73,74,75,76,77,78,80,81,82,83,84]


   """
   @doc offset: 0,
        sequence: "Numbers in base 9.",
        references: [{:oeis, :a007095, "https://oeis.org/A007095"}]
   def create_sequence_a007095(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007095/1)
   end


   @doc offset: 0
   def seq_a007095(idx) do
       idx |> Integer.digits(9) |> Integer.undigits()    
   end
   
   
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
   
   @doc """
   OEIS Sequence `A052382` - Numbers without 0 as a digit, a.k.a. zeroless numbers.

   From [OEIS A052382](https://oeis.org/A052382):

   > Numbers without 0 as a digit, a.k.a. zeroless numbers.
   > (Formerly )

   **Sequence IDs**: `:a052382`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052382) |> Sequence.take!(94)
       [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,78,79,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,111,112,113,114]


   """
   @doc offset: 1,
        sequence: "Numbers without 0 as a digit, a.k.a. zeroless numbers.",
        references: [{:oeis, :a052382, "https://oeis.org/A052382"}]
   def create_sequence_a052382(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052382/2)
   end


   @doc offset: 1
   def seq_a052382(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 0) == false end, last)
   end

   @doc """
   OEIS Sequence `A052383` - Numbers without 1 as a digit.

   From [OEIS A052383](https://oeis.org/A052383):

   > Numbers without 1 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052383`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052383) |> Sequence.take!(72)
       [0,2,3,4,5,6,7,8,9,20,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,38,39,40,42,43,44,45,46,47,48,49,50,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,72,73,74,75,76,77,78,79,80,82,83,84,85,86,87,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 1 as a digit.",
        references: [{:oeis, :a052383, "https://oeis.org/A052383"}]
   def create_sequence_a052383(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052383/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052383(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 1) == false end, last)    
   end

   @doc """
   OEIS Sequence `A052404` - Numbers without 2 as a digit.

   From [OEIS A052404](https://oeis.org/A052404):

   > Numbers without 2 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052404`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052404) |> Sequence.take!(72)
       [0,1,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,30,31,33,34,35,36,37,38,39,40,41,43,44,45,46,47,48,49,50,51,53,54,55,56,57,58,59,60,61,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,83,84,85,86,87,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 2 as a digit.",
        references: [{:oeis, :a052404, "https://oeis.org/A052404"}]
   def create_sequence_a052404(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052404/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052404(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 2) == false end, last)    
   end

   @doc """
   OEIS Sequence `A052405` - Numbers without 3 as a digit.

   From [OEIS A052405](https://oeis.org/A052405):

   > Numbers without 3 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052405`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052405) |> Sequence.take!(72)
       [0,1,2,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,40,41,42,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,80,81,82,84,85,86,87,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 3 as a digit.",
        references: [{:oeis, :a052405, "https://oeis.org/A052405"}]
   def create_sequence_a052405(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052405/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052405(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 3) == false end, last)    
   end

   @doc """
   OEIS Sequence `A052406` - Numbers without 4 as a digit.

   From [OEIS A052406](https://oeis.org/A052406):

   > Numbers without 4 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052406`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052406) |> Sequence.take!(72)
       [0,1,2,3,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,25,26,27,28,29,30,31,32,33,35,36,37,38,39,50,51,52,53,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70,71,72,73,75,76,77,78,79,80,81,82,83,85,86,87,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 4 as a digit.",
        references: [{:oeis, :a052406, "https://oeis.org/A052406"}]
   def create_sequence_a052406(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052406/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052406(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 4) == false end, last)    
   end

   @doc """
   OEIS Sequence `A052413` - Numbers without 5 as a digit.

   From [OEIS A052413](https://oeis.org/A052413):

   > Numbers without 5 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052413`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052413) |> Sequence.take!(72)
       [0,1,2,3,4,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,46,47,48,49,60,61,62,63,64,66,67,68,69,70,71,72,73,74,76,77,78,79,80,81,82,83,84,86,87,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 5 as a digit.",
        references: [{:oeis, :a052413, "https://oeis.org/A052413"}]
   def create_sequence_a052413(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052413/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052413(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 5) == false end, last)    
   end

   @doc """
   OEIS Sequence `A052414` - Numbers without 6 as a digit.

   From [OEIS A052414](https://oeis.org/A052414):

   > Numbers without 6 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052414`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052414) |> Sequence.take!(72)
       [0,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,27,28,29,30,31,32,33,34,35,37,38,39,40,41,42,43,44,45,47,48,49,50,51,52,53,54,55,57,58,59,70,71,72,73,74,75,77,78,79,80,81,82,83,84,85,87,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 6 as a digit.",
        references: [{:oeis, :a052414, "https://oeis.org/A052414"}]
   def create_sequence_a052414(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052414/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052414(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 6) == false end, last)
   end

   @doc """
   OEIS Sequence `A052419` - Numbers without 7 as a digit.

   From [OEIS A052419](https://oeis.org/A052419):

   > Numbers without 7 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052419`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052419) |> Sequence.take!(72)
       [0,1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,35,36,38,39,40,41,42,43,44,45,46,48,49,50,51,52,53,54,55,56,58,59,60,61,62,63,64,65,66,68,69,80,81,82,83,84,85,86,88,89]


   """
   @doc offset: 1,
        sequence: "Numbers without 7 as a digit.",
        references: [{:oeis, :a052419, "https://oeis.org/A052419"}]
   def create_sequence_a052419(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052419/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052419(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 7) == false end, last)    
   end

   @doc """
   OEIS Sequence `A052421` - Numbers without 8 as a digit.

   From [OEIS A052421](https://oeis.org/A052421):

   > Numbers without 8 as a digit.
   > (Formerly )

   **Sequence IDs**: `:a052421`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052421) |> Sequence.take!(72)
       [0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,39,40,41,42,43,44,45,46,47,49,50,51,52,53,54,55,56,57,59,60,61,62,63,64,65,66,67,69,70,71,72,73,74,75,76,77,79]


   """
   @doc offset: 1,
        sequence: "Numbers without 8 as a digit.",
        references: [{:oeis, :a052421, "https://oeis.org/A052421"}]
   def create_sequence_a052421(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052421/2)
   end


   @doc offset: 1, fill_value: -1
   def seq_a052421(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 8) == false end, last)    
   end
   
   @doc """
   OEIS Sequence `A121022` - Even numbers containing a 2 in their decimal representation.

   From [OEIS A121022](https://oeis.org/A121022):

   > Even numbers containing a 2 in their decimal representation.
   > (Formerly )

   **Sequence IDs**: `:a121022`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a121022) |> Sequence.take!(55)
       [2,12,20,22,24,26,28,32,42,52,62,72,82,92,102,112,120,122,124,126,128,132,142,152,162,172,182,192,200,202,204,206,208,210,212,214,216,218,220,222,224,226,228,230,232,234,236,238,240,242,244,246,248,250,252]


   """
   @doc offset: 1,
        sequence: "Even numbers containing a 2 in their decimal representation.",
        references: [{:oeis, :a121022, "https://oeis.org/A121022"}]
   def create_sequence_a121022(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a121022/2)
   end


   @doc offset: 1, fill_value: 0
   def seq_a121022(_idx, last) do
       Math.next_number(fn v -> Math.contains_number?(v, 2) end, last, 2) 
   end
   
   @doc """
   OEIS Sequence `A100968` - Integers n that are Rhonda numbers to base 4.

   From [OEIS A100968](https://oeis.org/A100968):

   > Integers n that are Rhonda numbers to base 4.
   > (Formerly )

   **Sequence IDs**: `:a100968`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100968) |> Sequence.take!(7)
       [10206,11935,12150,16031,45030,94185,113022]


   """
   @doc offset: 1,
        sequence: "Integers n that are Rhonda numbers to base 4.",
        references: [{:oeis, :a100968, "https://oeis.org/A100968"}]
   def create_sequence_a100968(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100968/2)
   end


   @doc offset: 1, fill_value: 10000
   def seq_a100968(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_4?/1, last)
   end

   @doc """
   OEIS Sequence `A100969` - Integers n that are Rhonda numbers to base 6.

   From [OEIS A100969](https://oeis.org/A100969):

   > Integers n that are Rhonda numbers to base 6.
   > (Formerly )

   **Sequence IDs**: `:a100969`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100969) |> Sequence.take!(13)
       [855,1029,3813,5577,7040,7304,15104,19136,35350,36992,41031,42009,60368]


   """
   @doc offset: 1,
        sequence: "Integers n that are Rhonda numbers to base 6.",
        references: [{:oeis, :a100969, "https://oeis.org/A100969"}]
   def create_sequence_a100969(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100969/2)
   end


   @doc offset: 1, fill_value: 800
   def seq_a100969(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_6?/1, last)
   end

   @doc """
   OEIS Sequence `A100970` - Integers n that are Rhonda numbers to base 8.

   From [OEIS A100970](https://oeis.org/A100970):

   > Integers n that are Rhonda numbers to base 8.
   > (Formerly )

   **Sequence IDs**: `:a100970`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100970) |> Sequence.take!(20)
       [1836,6318,6622,10530,14500,14739,17655,18550,25398,25956,30562,39215,39325,50875,51429,52887,55611,56420,58548,59731]


   """
   @doc offset: 1,
        sequence: "Integers n that are Rhonda numbers to base 8.",
        references: [{:oeis, :a100970, "https://oeis.org/A100970"}]
   def create_sequence_a100970(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100970/2)
   end


   @doc offset: 1, fill_value: 1800
   def seq_a100970(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_8?/1, last)
   end

   @doc """
   OEIS Sequence `A100973` - Integers that are Rhonda numbers to base 9.

   From [OEIS A100973](https://oeis.org/A100973):

   > Integers that are Rhonda numbers to base 9.
   > (Formerly )

   **Sequence IDs**: `:a100973`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100973) |> Sequence.take!(12)
       [15540,21054,25331,44360,44660,44733,47652,50560,54944,76857,77142,83334]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to base 9.",
        references: [{:oeis, :a100973, "https://oeis.org/A100973"}]
   def create_sequence_a100973(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100973/2) 
   end


   @doc offset: 1, fill_value: 15500
   def seq_a100973(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_9?/1, last)
   end

   @doc """
   OEIS Sequence `A099542` - Rhonda numbers to base 10.

   From [OEIS A099542](https://oeis.org/A099542):

   > Rhonda numbers to base 10.
   > (Formerly )

   **Sequence IDs**: `:a099542`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a099542) |> Sequence.take!(28)
       [1568,2835,4752,5265,5439,5664,5824,5832,8526,12985,15625,15698,19435,25284,25662,33475,34935,35581,45951,47265,47594,52374,53176,53742,54479,55272,56356,56718]


   """
   @doc offset: 1,
        sequence: "Rhonda numbers to base 10.",
        references: [{:oeis, :a099542, "https://oeis.org/A099542"}]
   def create_sequence_a099542(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a099542/2)
   end


   @doc offset: 1, fill_value: 1500
   def seq_a099542(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_10?/1, last)    
   end

   @doc """
   OEIS Sequence `A100971` - Integers n that are Rhonda numbers to base 12.

   From [OEIS A100971](https://oeis.org/A100971):

   > Integers n that are Rhonda numbers to base 12.
   > (Formerly )

   **Sequence IDs**: `:a100971`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100971) |> Sequence.take!(35)
       [560,800,3993,4425,4602,4888,7315,8296,9315,11849,12028,13034,14828,15052,16264,18511,18906,25619,25875,27176,32742,37264,37523,46035,50765,52338,58261,58504,59166,62002,66176,66752,66928,67195,68502]


   """
   @doc offset: 1,
        sequence: "Integers n that are Rhonda numbers to base 12.",
        references: [{:oeis, :a100971, "https://oeis.org/A100971"}]
   def create_sequence_a100971(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100971/2)
   end


   @doc offset: 1, fill_value: 500
   def seq_a100971(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_12?/1, last)
   end

   @doc """
   OEIS Sequence `A100972` - Integers that are Rhonda numbers to base 14.

   From [OEIS A100972](https://oeis.org/A100972):

   > Integers that are Rhonda numbers to base 14.
   > (Formerly )

   **Sequence IDs**: `:a100972`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100972) |> Sequence.take!(14)
       [11475,18655,20565,29631,31725,45387,58404,58667,59950,63945,67525,68904,91245,99603]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to base 14.",
        references: [{:oeis, :a100972, "https://oeis.org/A100972"}]
   def create_sequence_a100972(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100972/2)
   end


   @doc offset: 1, fill_value: 11400
   def seq_a100972(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_14?/1, last)
   end

   @doc """
   OEIS Sequence `A100974` - Integers that are Rhonda numbers to base 15.

   From [OEIS A100974](https://oeis.org/A100974):

   > Integers that are Rhonda numbers to base 15.
   > (Formerly )

   **Sequence IDs**: `:a100974`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100974) |> Sequence.take!(22)
       [2392,2472,11468,15873,17424,18126,19152,20079,24388,30758,31150,33004,33550,37925,39483,42550,44714,58870,59605,66950,70182,71485]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to base 15.",
        references: [{:oeis, :a100974, "https://oeis.org/A100974"}]
   def create_sequence_a100974(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100974/2)
   end


   @doc offset: 1, fill_value: 2300
   def seq_a100974(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_15?/1, last)
   end

   @doc """
   OEIS Sequence `A100975` - Integers that are Rhonda numbers to base 16.

   From [OEIS A100975](https://oeis.org/A100975):

   > Integers that are Rhonda numbers to base 16.
   > (Formerly )

   **Sequence IDs**: `:a100975`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100975) |> Sequence.take!(22)
       [1000,1134,6776,15912,19624,20043,20355,23946,26296,29070,31906,32292,34236,34521,36465,39066,50055,50986,52341,54340,58088,59541]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to base 16.",
        references: [{:oeis, :a100975, "https://oeis.org/A100975"}]
   def create_sequence_a100975(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100975/2)
   end


   @doc offset: 1, fill_value: 900
   def seq_a100975(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_16?/1, last)
   end

   @doc """
   OEIS Sequence `A255732` - Rhonda numbers in vigesimal number system.

   From [OEIS A255732](https://oeis.org/A255732):

   > Rhonda numbers in vigesimal number system.
   > (Formerly )

   **Sequence IDs**: `:a255732`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255732) |> Sequence.take!(14)
       [1815,11050,15295,21165,22165,30702,34510,34645,42292,44165,52059,53416,65945,78430]


   """
   @doc offset: 1,
        sequence: "Rhonda numbers in vigesimal number system.",
        references: [{:oeis, :a255732, "https://oeis.org/A255732"}]
   def create_sequence_a255732(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255732/2)
   end


   @doc offset: 1, fill_value: 1800
   def seq_a255732(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_20?/1, last)
   end

   @doc """
   OEIS Sequence `A255736` - Integers that are Rhonda numbers to base 30.

   From [OEIS A255736](https://oeis.org/A255736):

   > Integers that are Rhonda numbers to base 30.
   > (Formerly )

   **Sequence IDs**: `:a255736`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255736) |> Sequence.take!(27)
       [3024,3168,5115,5346,5950,6762,7750,7956,8470,9476,9576,9849,10360,11495,13035,13356,16335,22610,22784,23864,37515,38025,40704,40986,49887,52925,59800]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to base 30.",
        references: [{:oeis, :a255736, "https://oeis.org/A255736"}]
   def create_sequence_a255736(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255736/2)
   end


   @doc offset: 1, fill_value: 3000
   def seq_a255736(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_30?/1, last)
   end

   @doc """
   OEIS Sequence `A255731` - Rhonda numbers in sexagesimal number system.

   From [OEIS A255731](https://oeis.org/A255731):

   > Rhonda numbers in sexagesimal number system.
   > (Formerly )

   **Sequence IDs**: `:a255731`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255731) |> Sequence.take!(17)
       [3348,3510,6750,17430,18750,18876,18944,19475,20564,21312,26550,28280,37230,38396,43940,48042,77770]


   """
   @doc offset: 1,
        sequence: "Rhonda numbers in sexagesimal number system.",
        references: [{:oeis, :a255731, "https://oeis.org/A255731"}]
   def create_sequence_a255731(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255731/2)
   end


   @doc offset: 1, fill_value: 3300
   def seq_a255731(_idx, last) do
       Math.next_number(&Math.is_rhonda_to_base_60?/1, last)
   end

   @doc """
   OEIS Sequence `A100988` - Integers that are Rhonda numbers to more than one base.

   From [OEIS A100988](https://oeis.org/A100988):

   > Integers that are Rhonda numbers to more than one base.
   > (Formerly )

   **Sequence IDs**: `:a100988`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100988) |> Sequence.take!(39)
       [1000,2940,4200,4212,4725,5670,5824,5832,6776,6864,7040,7140,8296,9476,9633,10200,11016,11050,11160,11495,11935,12393,12474,13068,13260,13671,14014,14322,14406,15680,15750,15912,16240,16821,17056,17820,18270,18655,18700]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to more than one base.",
        references: [{:oeis, :a100988, "https://oeis.org/A100988"}]
   def create_sequence_a100988(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100988/2)
   end


   @doc offset: 1, fill_value: 900
   def seq_a100988(_idx, last) do
       Math.next_number(&Math.is_multiple_rhonda?/1, last)
   end

   @doc """
   OEIS Sequence `A100987` - Integers that are Rhonda numbers to some base.

   From [OEIS A100987](https://oeis.org/A100987):

   > Integers that are Rhonda numbers to some base.
   > (Formerly )

   **Sequence IDs**: `:a100987`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100987) |> Sequence.take!(44)
       [560,756,800,855,1000,1029,1134,1470,1568,1632,1750,1815,1836,1944,1995,2080,2100,2392,2472,2662,2695,2709,2835,2940,3000,3024,3060,3087,3094,3168,3240,3264,3348,3456,3510,3600,3672,3675,3744,3750,3813,3888,3952,3976]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to some base.",
        references: [{:oeis, :a100987, "https://oeis.org/A100987"}]
   def create_sequence_a100987(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100987/2)
   end


   @doc offset: 1, fill_value: 500
   def seq_a100987(_idx, last) do
       Math.next_number(
           fn v -> 
               Math.get_rhonda_to(v) |> length() > 0
           end, 
           last
       )
   end
   
   @doc """
   OEIS Sequence `A255735` - Integers that are Rhonda numbers to base 18.

   From [OEIS A255735](https://oeis.org/A255735):

   > Integers that are Rhonda numbers to base 18.
   > (Formerly )

   **Sequence IDs**: `:a255735`

   **Finite**: False

   **Offset**: 1

   ## Example

       iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255735) |> Sequence.take!(19)
       [1470,3000,8918,17025,19402,20650,21120,22156,26522,36549,38354,43281,46035,48768,54229,54528,56584,58216,58224]


   """
   @doc offset: 1,
        sequence: "Integers that are Rhonda numbers to base 18.",
        references: [{:oeis, :a255735, "https://oeis.org/A255735"}]
   def create_sequence_a255735(_opts) do
           sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255735/2)
   end


   @doc offset: 1, fill_value: 1400
   def seq_a255735(_idx, last) do
       Math.next_number(
           fn v -> 
               Math.is_rhonda_to_base?(v, 18)
           end, 
           last
       )
    
   end
   
end