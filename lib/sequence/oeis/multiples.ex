defmodule Chunky.Sequence.OEIS.Multiples do
  @moduledoc """
  Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with multiples
  and additions.

  ## Available Sequences

   - [A007770 - Happy numbers: numbers whose trajectory under iteration of sum of squares of digits map (see A003132) includes 1.](https://oeis.org/A007770) - `:a007770` - `create_sequence_a007770/1`
   - [A008585 - a(n) = 3*n.](https://oeis.org/A008585) - `:a008585` - `create_sequence_a008585/1`
   - [A008586 - Multiples of 4.](https://oeis.org/A008586) - `:a008586` - `create_sequence_a008586/1`
   - [A008587 - Multiples of 5.](https://oeis.org/A008587) - `:a008587` - `create_sequence_a008587/1`
   - [A008588 - Nonnegative multiples of 6.](https://oeis.org/A008588) - `:a008588` - `create_sequence_a008588/1`
   - [A008589 - Multiples of 7.](https://oeis.org/A008589) - `:a008589` - `create_sequence_a008589/1`
   - [A008590 - Multiples of 8.](https://oeis.org/A008590) - `:a008590` - `create_sequence_a008590/1`
   - [A008591 - Multiples of 9.](https://oeis.org/A008591) - `:a008591` - `create_sequence_a008591/1`
   - [A008592 - Multiples of 10: a(n) = 10 * n.](https://oeis.org/A008592) - `:a008592` - `create_sequence_a008592/1`
   - [A008593 - Multiples of 11.](https://oeis.org/A008593) - `:a008593` - `create_sequence_a008593/1`
   - [A008594 - Multiples of 12.](https://oeis.org/A008594) - `:a008594` - `create_sequence_a008594/1`
   - [A008595 - Multiples of 13.](https://oeis.org/A008595) - `:a008595` - `create_sequence_a008595/1`
   - [A008596 - Multiples of 14.](https://oeis.org/A008596) - `:a008596` - `create_sequence_a008596/1`
   - [A008597 - Multiples of 15.](https://oeis.org/A008597) - `:a008597` - `create_sequence_a008597/1`
   - [A008598 - Multiples of 16.](https://oeis.org/A008598) - `:a008598` - `create_sequence_a008598/1`
   - [A008599 - Multiples of 17.](https://oeis.org/A008599) - `:a008599` - `create_sequence_a008599/1`
   - [A008600 - Multiples of 18.](https://oeis.org/A008600) - `:a008600` - `create_sequence_a008600/1`
   - [A008601 - Multiples of 19.](https://oeis.org/A008601) - `:a008601` - `create_sequence_a008601/1`
   - [A008602 - Multiples of 20.](https://oeis.org/A008602) - `:a008602` - `create_sequence_a008602/1`
   - [A008603 - Multiples of 21.](https://oeis.org/A008603) - `:a008603` - `create_sequence_a008603/1`
   - [A008604 - Multiples of 22.](https://oeis.org/A008604) - `:a008604` - `create_sequence_a008604/1`
   - [A008605 - Multiples of 23.](https://oeis.org/A008605) - `:a008605` - `create_sequence_a008605/1`
   - [A008606 - Multiples of 24.](https://oeis.org/A008606) - `:a008606` - `create_sequence_a008606/1`
   - [A008607 - Multiples of 25.](https://oeis.org/A008607) - `:a008607` - `create_sequence_a008607/1`
   - [A031177 - Unhappy numbers: numbers having period-8 2-digitized sequences.](https://oeis.org/A031177) - `:a031177` - `create_sequence_a031177/1`
   - [A016825 - Positive integers congruent to 2 mod 4: a(n) = 4*n+2, for n >= 0.](https://oeis.org/A016825) - `:a016825` - `create_sequence_a016825/1`
   - [A169823 - Multiples of 60.](https://oeis.org/A169823) - `:a169823` - `create_sequence_a169823/1`
   - [A169825 - Multiples of 420.](https://oeis.org/A169825) - `:a169825` - `create_sequence_a169825/1`
   - [A169827 - Multiples of 840.](https://oeis.org/A169827) - `:a169827` - `create_sequence_a169827/1`
   - [A044102 - Multiples of 36.](https://oeis.org/A044102) - `:a044102` - `create_sequence_a044102/1`
   - [A062768 - Multiples of 6 such that the sum of the digits is equal to 6.](https://oeis.org/A062768) - `:a062768` - `create_sequence_a062768/1`
   - [A063416 - Multiples of 7 whose sum of digits is equal to 7.](https://oeis.org/A063416) - `:a063416` - `create_sequence_a063416/1`
   - [A063997 - Multiples of 4 whose digits add to 4.](https://oeis.org/A063997) - `:a063997` - `create_sequence_a063997/1`
   - [A069537 - Multiples of 2 with digit sum = 2.](https://oeis.org/A069537) - `:a069537` - `create_sequence_a069537/1`
   - [A069540 - Multiples of 5 with digit sum 5.](https://oeis.org/A069540) - `:a069540` - `create_sequence_a069540/1`
   - [A069543 - Multiples of 8 with digit sum 8.](https://oeis.org/A069543) - `:a069543` - `create_sequence_a069543/1`
   - [A085959 - Multiples of 37.](https://oeis.org/A085959) - `:a085959` - `create_sequence_a085959/1`
   - [A121023 - Multiples of 3 containing a 3 in their decimal representation.](https://oeis.org/A121023) - `:a121023` - `create_sequence_a121023/1`
   - [A121024 - Multiples of 4 containing a 4 in their decimal representation.](https://oeis.org/A121024) - `:a121024` - `create_sequence_a121024/1`
   - [A121025 - Multiples of 5 containing a 5 in their decimal representation.](https://oeis.org/A121025) - `:a121025` - `create_sequence_a121025/1`
   - [A121026 - Multiples of 6 containing a 6 in their decimal representation.](https://oeis.org/A121026) - `:a121026` - `create_sequence_a121026/1`
   - [A121027 - Multiples of 7 containing a 7 in their decimal representation.](https://oeis.org/A121027) - `:a121027` - `create_sequence_a121027/1`
   - [A121028 - Multiples of 8 containing an 8 in their decimal representation.](https://oeis.org/A121028) - `:a121028` - `create_sequence_a121028/1`
   - [A121029 - Multiples of 9 containing a 9 in their decimal representation.](https://oeis.org/A121029) - `:a121029` - `create_sequence_a121029/1`
   - [A121030 - Multiples of 10 containing a 10 in their decimal representation.](https://oeis.org/A121030) - `:a121030` - `create_sequence_a121030/1`
   - [A121031 - Multiples of 11 containing an 11 in their decimal representation.](https://oeis.org/A121031) - `:a121031` - `create_sequence_a121031/1`
   - [A121032 - Multiples of 12 containing a 12 in their decimal representation.](https://oeis.org/A121032) - `:a121032` - `create_sequence_a121032/1`
   - [A121033 - Multiples of 13 containing a 13 in their decimal representation.](https://oeis.org/A121033) - `:a121033` - `create_sequence_a121033/1`
   - [A121034 - Multiples of 14 containing a 14 in their decimal representation.](https://oeis.org/A121034) - `:a121034` - `create_sequence_a121034/1`
   - [A121035 - Multiples of 15 containing a 15 in their decimal representation.](https://oeis.org/A121035) - `:a121035` - `create_sequence_a121035/1`
   - [A121036 - Multiples of 16 containing a 16 in their decimal representation.](https://oeis.org/A121036) - `:a121036` - `create_sequence_a121036/1`
   - [A121037 - Multiples of 17 containing a 17 in their decimal representation.](https://oeis.org/A121037) - `:a121037` - `create_sequence_a121037/1`
   - [A121038 - Multiples of 18 containing a 18 in their decimal representation.](https://oeis.org/A121038) - `:a121038` - `create_sequence_a121038/1`
   - [A121039 - Multiples of 19 containing a 19 in their decimal representation.](https://oeis.org/A121039) - `:a121039` - `create_sequence_a121039/1`
   - [A121040 - Multiples of 20 containing a 20 in their decimal representation.](https://oeis.org/A121040) - `:a121040` - `create_sequence_a121040/1`
   - [A135628 - Multiples of 28.](https://oeis.org/A135628) - `:a135628` - `create_sequence_a135628/1`
   - [A135631 - Multiples of 31.](https://oeis.org/A135631) - `:a135631` - `create_sequence_a135631/1`
   - [A138591 - Sums of two or more consecutive nonnegative integers.](https://oeis.org/A138591) - `:a138591` - `create_sequence_a138591/1`
   - [A152691 - Multiples of 64.](https://oeis.org/A152691) - `:a152691` - `create_sequence_a152691/1`
   - [A174312 - 32*n.](https://oeis.org/A174312) - `:a174312` - `create_sequence_a174312/1`
   - [A195819 - Multiples of 29.](https://oeis.org/A195819) - `:a195819` - `create_sequence_a195819/1`
   - [A249674 - a(n) = 30*n.](https://oeis.org/A249674) - `:a249674` - `create_sequence_a249674/1`
   - [A252994 - Multiples of 26.](https://oeis.org/A252994) - `:a252994` - `create_sequence_a252994/1`
   - [A305548 - a(n) = 27*n.](https://oeis.org/A305548) - `:a305548` - `create_sequence_a305548/1`





  """

  import Chunky.Sequence, only: [sequence_for_function: 1]

  alias Chunky.Math
  alias Chunky.Math.Predicates

  @doc """
  OEIS Sequence `A008585` - a(n) = 3*n.

  From [OEIS A008585](https://oeis.org/A008585):

  > a(n) = 3*n.
  > (Formerly )

  **Sequence IDs**: `:a008585`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008585) |> Sequence.take!(60)
      [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,147,150,153,156,159,162,165,168,171,174,177]


  """
  @doc offset: 0,
       sequence: "a(n) = 3*n.",
       references: [{:oeis, :a008585, "https://oeis.org/A008585"}]
  def create_sequence_a008585(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008585/1)
  end

  @doc offset: 0
  def seq_a008585(idx) do
    idx * 3
  end

  @doc """
  OEIS Sequence `A008586` - Multiples of 4.

  From [OEIS A008586](https://oeis.org/A008586):

  > Multiples of 4.
  > (Formerly )

  **Sequence IDs**: `:a008586`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008586) |> Sequence.take!(58)
      [0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196,200,204,208,212,216,220,224,228]


  """
  @doc offset: 0,
       sequence: "Multiples of 4.",
       references: [{:oeis, :a008586, "https://oeis.org/A008586"}]
  def create_sequence_a008586(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008586/1)
  end

  @doc offset: 0
  def seq_a008586(idx) do
    idx * 4
  end

  @doc """
  OEIS Sequence `A008587` - Multiples of 5.

  From [OEIS A008587](https://oeis.org/A008587):

  > Multiples of 5.
  > (Formerly )

  **Sequence IDs**: `:a008587`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008587) |> Sequence.take!(56)
      [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,250,255,260,265,270,275]


  """
  @doc offset: 0,
       sequence: "Multiples of 5.",
       references: [{:oeis, :a008587, "https://oeis.org/A008587"}]
  def create_sequence_a008587(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008587/1)
  end

  @doc offset: 0
  def seq_a008587(idx) do
    idx * 5
  end

  @doc """
  OEIS Sequence `A008588` - Nonnegative multiples of 6.

  From [OEIS A008588](https://oeis.org/A008588):

  > Nonnegative multiples of 6.
  > (Formerly )

  **Sequence IDs**: `:a008588`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008588) |> Sequence.take!(59)
      [0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300,306,312,318,324,330,336,342,348]


  """
  @doc offset: 0,
       sequence: "Nonnegative multiples of 6.",
       references: [{:oeis, :a008588, "https://oeis.org/A008588"}]
  def create_sequence_a008588(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008588/1)
  end

  @doc offset: 0
  def seq_a008588(idx) do
    idx * 6
  end

  @doc """
  OEIS Sequence `A008589` - Multiples of 7.

  From [OEIS A008589](https://oeis.org/A008589):

  > Multiples of 7.
  > (Formerly )

  **Sequence IDs**: `:a008589`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008589) |> Sequence.take!(55)
      [0,7,14,21,28,35,42,49,56,63,70,77,84,91,98,105,112,119,126,133,140,147,154,161,168,175,182,189,196,203,210,217,224,231,238,245,252,259,266,273,280,287,294,301,308,315,322,329,336,343,350,357,364,371,378]


  """
  @doc offset: 0,
       sequence: "Multiples of 7.",
       references: [{:oeis, :a008589, "https://oeis.org/A008589"}]
  def create_sequence_a008589(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008589/1)
  end

  @doc offset: 0
  def seq_a008589(idx) do
    idx * 7
  end

  @doc """
  OEIS Sequence `A008590` - Multiples of 8.

  From [OEIS A008590](https://oeis.org/A008590):

  > Multiples of 8.
  > (Formerly )

  **Sequence IDs**: `:a008590`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008590) |> Sequence.take!(55)
      [0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,128,136,144,152,160,168,176,184,192,200,208,216,224,232,240,248,256,264,272,280,288,296,304,312,320,328,336,344,352,360,368,376,384,392,400,408,416,424,432]


  """
  @doc offset: 0,
       sequence: "Multiples of 8.",
       references: [{:oeis, :a008590, "https://oeis.org/A008590"}]
  def create_sequence_a008590(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008590/1)
  end

  @doc offset: 0
  def seq_a008590(idx) do
    idx * 8
  end

  @doc """
  OEIS Sequence `A008591` - Multiples of 9.

  From [OEIS A008591](https://oeis.org/A008591):

  > Multiples of 9.
  > (Formerly )

  **Sequence IDs**: `:a008591`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008591) |> Sequence.take!(54)
      [0,9,18,27,36,45,54,63,72,81,90,99,108,117,126,135,144,153,162,171,180,189,198,207,216,225,234,243,252,261,270,279,288,297,306,315,324,333,342,351,360,369,378,387,396,405,414,423,432,441,450,459,468,477]


  """
  @doc offset: 0,
       sequence: "Multiples of 9.",
       references: [{:oeis, :a008591, "https://oeis.org/A008591"}]
  def create_sequence_a008591(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008591/1)
  end

  @doc offset: 0
  def seq_a008591(idx) do
    idx * 9
  end

  @doc """
  OEIS Sequence `A008592` - Multiples of 10: a(n) = 10 * n.

  From [OEIS A008592](https://oeis.org/A008592):

  > Multiples of 10: a(n) = 10 * n.
  > (Formerly )

  **Sequence IDs**: `:a008592`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008592) |> Sequence.take!(54)
      [0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530]


  """
  @doc offset: 0,
       sequence: "Multiples of 10: a(n) = 10 * n.",
       references: [{:oeis, :a008592, "https://oeis.org/A008592"}]
  def create_sequence_a008592(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008592/1)
  end

  @doc offset: 0
  def seq_a008592(idx) do
    idx * 10
  end

  @doc """
  OEIS Sequence `A008593` - Multiples of 11.

  From [OEIS A008593](https://oeis.org/A008593):

  > Multiples of 11.
  > (Formerly )

  **Sequence IDs**: `:a008593`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008593) |> Sequence.take!(54)
      [0,11,22,33,44,55,66,77,88,99,110,121,132,143,154,165,176,187,198,209,220,231,242,253,264,275,286,297,308,319,330,341,352,363,374,385,396,407,418,429,440,451,462,473,484,495,506,517,528,539,550,561,572,583]


  """
  @doc offset: 0,
       sequence: "Multiples of 11.",
       references: [{:oeis, :a008593, "https://oeis.org/A008593"}]
  def create_sequence_a008593(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008593/1)
  end

  @doc offset: 0
  def seq_a008593(idx) do
    idx * 11
  end

  @doc """
  OEIS Sequence `A008594` - Multiples of 12.

  From [OEIS A008594](https://oeis.org/A008594):

  > Multiples of 12.
  > (Formerly )

  **Sequence IDs**: `:a008594`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008594) |> Sequence.take!(54)
      [0,12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192,204,216,228,240,252,264,276,288,300,312,324,336,348,360,372,384,396,408,420,432,444,456,468,480,492,504,516,528,540,552,564,576,588,600,612,624,636]


  """
  @doc offset: 0,
       sequence: "Multiples of 12.",
       references: [{:oeis, :a008594, "https://oeis.org/A008594"}]
  def create_sequence_a008594(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008594/1)
  end

  @doc offset: 0
  def seq_a008594(idx) do
    idx * 12
  end

  @doc """
  OEIS Sequence `A008595` - Multiples of 13.

  From [OEIS A008595](https://oeis.org/A008595):

  > Multiples of 13.
  > (Formerly )

  **Sequence IDs**: `:a008595`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008595) |> Sequence.take!(53)
      [0,13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312,325,338,351,364,377,390,403,416,429,442,455,468,481,494,507,520,533,546,559,572,585,598,611,624,637,650,663,676]


  """
  @doc offset: 0,
       sequence: "Multiples of 13.",
       references: [{:oeis, :a008595, "https://oeis.org/A008595"}]
  def create_sequence_a008595(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008595/1)
  end

  @doc offset: 0
  def seq_a008595(idx) do
    idx * 13
  end

  @doc """
  OEIS Sequence `A008596` - Multiples of 14.

  From [OEIS A008596](https://oeis.org/A008596):

  > Multiples of 14.
  > (Formerly )

  **Sequence IDs**: `:a008596`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008596) |> Sequence.take!(53)
      [0,14,28,42,56,70,84,98,112,126,140,154,168,182,196,210,224,238,252,266,280,294,308,322,336,350,364,378,392,406,420,434,448,462,476,490,504,518,532,546,560,574,588,602,616,630,644,658,672,686,700,714,728]


  """
  @doc offset: 0,
       sequence: "Multiples of 14.",
       references: [{:oeis, :a008596, "https://oeis.org/A008596"}]
  def create_sequence_a008596(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008596/1)
  end

  @doc offset: 0
  def seq_a008596(idx) do
    idx * 14
  end

  @doc """
  OEIS Sequence `A008597` - Multiples of 15.

  From [OEIS A008597](https://oeis.org/A008597):

  > Multiples of 15.
  > (Formerly )

  **Sequence IDs**: `:a008597`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008597) |> Sequence.take!(53)
      [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345,360,375,390,405,420,435,450,465,480,495,510,525,540,555,570,585,600,615,630,645,660,675,690,705,720,735,750,765,780]


  """
  @doc offset: 0,
       sequence: "Multiples of 15.",
       references: [{:oeis, :a008597, "https://oeis.org/A008597"}]
  def create_sequence_a008597(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008597/1)
  end

  @doc offset: 0
  def seq_a008597(idx) do
    idx * 15
  end

  @doc """
  OEIS Sequence `A008598` - Multiples of 16.

  From [OEIS A008598](https://oeis.org/A008598):

  > Multiples of 16.
  > (Formerly )

  **Sequence IDs**: `:a008598`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008598) |> Sequence.take!(53)
      [0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240,256,272,288,304,320,336,352,368,384,400,416,432,448,464,480,496,512,528,544,560,576,592,608,624,640,656,672,688,704,720,736,752,768,784,800,816,832]


  """
  @doc offset: 0,
       sequence: "Multiples of 16.",
       references: [{:oeis, :a008598, "https://oeis.org/A008598"}]
  def create_sequence_a008598(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008598/1)
  end

  @doc offset: 0
  def seq_a008598(idx) do
    idx * 16
  end

  @doc """
  OEIS Sequence `A008599` - Multiples of 17.

  From [OEIS A008599](https://oeis.org/A008599):

  > Multiples of 17.
  > (Formerly )

  **Sequence IDs**: `:a008599`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008599) |> Sequence.take!(53)
      [0,17,34,51,68,85,102,119,136,153,170,187,204,221,238,255,272,289,306,323,340,357,374,391,408,425,442,459,476,493,510,527,544,561,578,595,612,629,646,663,680,697,714,731,748,765,782,799,816,833,850,867,884]


  """
  @doc offset: 0,
       sequence: "Multiples of 17.",
       references: [{:oeis, :a008599, "https://oeis.org/A008599"}]
  def create_sequence_a008599(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008599/1)
  end

  @doc offset: 0
  def seq_a008599(idx) do
    idx * 17
  end

  @doc """
  OEIS Sequence `A008600` - Multiples of 18.

  From [OEIS A008600](https://oeis.org/A008600):

  > Multiples of 18.
  > (Formerly )

  **Sequence IDs**: `:a008600`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008600) |> Sequence.take!(53)
      [0,18,36,54,72,90,108,126,144,162,180,198,216,234,252,270,288,306,324,342,360,378,396,414,432,450,468,486,504,522,540,558,576,594,612,630,648,666,684,702,720,738,756,774,792,810,828,846,864,882,900,918,936]


  """
  @doc offset: 0,
       sequence: "Multiples of 18.",
       references: [{:oeis, :a008600, "https://oeis.org/A008600"}]
  def create_sequence_a008600(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008600/1)
  end

  @doc offset: 0
  def seq_a008600(idx) do
    idx * 18
  end

  @doc """
  OEIS Sequence `A008601` - Multiples of 19.

  From [OEIS A008601](https://oeis.org/A008601):

  > Multiples of 19.
  > (Formerly )

  **Sequence IDs**: `:a008601`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008601) |> Sequence.take!(53)
      [0,19,38,57,76,95,114,133,152,171,190,209,228,247,266,285,304,323,342,361,380,399,418,437,456,475,494,513,532,551,570,589,608,627,646,665,684,703,722,741,760,779,798,817,836,855,874,893,912,931,950,969,988]


  """
  @doc offset: 0,
       sequence: "Multiples of 19.",
       references: [{:oeis, :a008601, "https://oeis.org/A008601"}]
  def create_sequence_a008601(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008601/1)
  end

  @doc offset: 0
  def seq_a008601(idx) do
    idx * 19
  end

  @doc """
  OEIS Sequence `A008602` - Multiples of 20.

  From [OEIS A008602](https://oeis.org/A008602):

  > Multiples of 20.
  > (Formerly )

  **Sequence IDs**: `:a008602`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008602) |> Sequence.take!(51)
      [0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400,420,440,460,480,500,520,540,560,580,600,620,640,660,680,700,720,740,760,780,800,820,840,860,880,900,920,940,960,980,1000]


  """
  @doc offset: 0,
       sequence: "Multiples of 20.",
       references: [{:oeis, :a008602, "https://oeis.org/A008602"}]
  def create_sequence_a008602(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008602/1)
  end

  @doc offset: 0
  def seq_a008602(idx) do
    idx * 20
  end

  @doc """
  OEIS Sequence `A008603` - Multiples of 21.

  From [OEIS A008603](https://oeis.org/A008603):

  > Multiples of 21.
  > (Formerly )

  **Sequence IDs**: `:a008603`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008603) |> Sequence.take!(48)
      [0,21,42,63,84,105,126,147,168,189,210,231,252,273,294,315,336,357,378,399,420,441,462,483,504,525,546,567,588,609,630,651,672,693,714,735,756,777,798,819,840,861,882,903,924,945,966,987]


  """
  @doc offset: 0,
       sequence: "Multiples of 21.",
       references: [{:oeis, :a008603, "https://oeis.org/A008603"}]
  def create_sequence_a008603(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008603/1)
  end

  @doc offset: 0
  def seq_a008603(idx) do
    idx * 21
  end

  @doc """
  OEIS Sequence `A008604` - Multiples of 22.

  From [OEIS A008604](https://oeis.org/A008604):

  > Multiples of 22.
  > (Formerly )

  **Sequence IDs**: `:a008604`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008604) |> Sequence.take!(46)
      [0,22,44,66,88,110,132,154,176,198,220,242,264,286,308,330,352,374,396,418,440,462,484,506,528,550,572,594,616,638,660,682,704,726,748,770,792,814,836,858,880,902,924,946,968,990]


  """
  @doc offset: 0,
       sequence: "Multiples of 22.",
       references: [{:oeis, :a008604, "https://oeis.org/A008604"}]
  def create_sequence_a008604(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008604/1)
  end

  @doc offset: 0
  def seq_a008604(idx) do
    idx * 22
  end

  @doc """
  OEIS Sequence `A008605` - Multiples of 23.

  From [OEIS A008605](https://oeis.org/A008605):

  > Multiples of 23.
  > (Formerly )

  **Sequence IDs**: `:a008605`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008605) |> Sequence.take!(51)
      [0,23,46,69,92,115,138,161,184,207,230,253,276,299,322,345,368,391,414,437,460,483,506,529,552,575,598,621,644,667,690,713,736,759,782,805,828,851,874,897,920,943,966,989,1012,1035,1058,1081,1104,1127,1150]


  """
  @doc offset: 0,
       sequence: "Multiples of 23.",
       references: [{:oeis, :a008605, "https://oeis.org/A008605"}]
  def create_sequence_a008605(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008605/1)
  end

  @doc offset: 0
  def seq_a008605(idx) do
    idx * 23
  end

  @doc """
  OEIS Sequence `A008606` - Multiples of 24.

  From [OEIS A008606](https://oeis.org/A008606):

  > Multiples of 24.
  > (Formerly )

  **Sequence IDs**: `:a008606`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008606) |> Sequence.take!(51)
      [0,24,48,72,96,120,144,168,192,216,240,264,288,312,336,360,384,408,432,456,480,504,528,552,576,600,624,648,672,696,720,744,768,792,816,840,864,888,912,936,960,984,1008,1032,1056,1080,1104,1128,1152,1176,1200]


  """
  @doc offset: 0,
       sequence: "Multiples of 24.",
       references: [{:oeis, :a008606, "https://oeis.org/A008606"}]
  def create_sequence_a008606(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008606/1)
  end

  @doc offset: 0
  def seq_a008606(idx) do
    idx * 24
  end

  @doc """
  OEIS Sequence `A008607` - Multiples of 25.

  From [OEIS A008607](https://oeis.org/A008607):

  > Multiples of 25.
  > (Formerly )

  **Sequence IDs**: `:a008607`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a008607) |> Sequence.take!(50)
      [0,25,50,75,100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575,600,625,650,675,700,725,750,775,800,825,850,875,900,925,950,975,1000,1025,1050,1075,1100,1125,1150,1175,1200,1225]


  """
  @doc offset: 0,
       sequence: "Multiples of 25.",
       references: [{:oeis, :a008607, "https://oeis.org/A008607"}]
  def create_sequence_a008607(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a008607/1)
  end

  @doc offset: 0
  def seq_a008607(idx) do
    idx * 25
  end

  @doc """
  OEIS Sequence `A169823` - Multiples of 60.

  From [OEIS A169823](https://oeis.org/A169823):

  > Multiples of 60.
  > (Formerly )

  **Sequence IDs**: `:a169823`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a169823) |> Sequence.take!(46)
      [0,60,120,180,240,300,360,420,480,540,600,660,720,780,840,900,960,1020,1080,1140,1200,1260,1320,1380,1440,1500,1560,1620,1680,1740,1800,1860,1920,1980,2040,2100,2160,2220,2280,2340,2400,2460,2520,2580,2640,2700]


  """
  @doc offset: 0,
       sequence: "Multiples of 60.",
       references: [{:oeis, :a169823, "https://oeis.org/A169823"}]
  def create_sequence_a169823(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a169823/1)
  end

  @doc offset: 0
  def seq_a169823(idx) do
    idx * 60
  end

  @doc """
  OEIS Sequence `A169825` - Multiples of 420.

  From [OEIS A169825](https://oeis.org/A169825):

  > Multiples of 420.
  > (Formerly )

  **Sequence IDs**: `:a169825`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a169825) |> Sequence.take!(41)
      [0,420,840,1260,1680,2100,2520,2940,3360,3780,4200,4620,5040,5460,5880,6300,6720,7140,7560,7980,8400,8820,9240,9660,10080,10500,10920,11340,11760,12180,12600,13020,13440,13860,14280,14700,15120,15540,15960,16380,16800]


  """
  @doc offset: 0,
       sequence: "Multiples of 420.",
       references: [{:oeis, :a169825, "https://oeis.org/A169825"}]
  def create_sequence_a169825(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a169825/1)
  end

  @doc offset: 0
  def seq_a169825(idx) do
    idx * 420
  end

  @doc """
  OEIS Sequence `A169827` - Multiples of 840.

  From [OEIS A169827](https://oeis.org/A169827):

  > Multiples of 840.
  > (Formerly )

  **Sequence IDs**: `:a169827`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a169827) |> Sequence.take!(39)
      [0,840,1680,2520,3360,4200,5040,5880,6720,7560,8400,9240,10080,10920,11760,12600,13440,14280,15120,15960,16800,17640,18480,19320,20160,21000,21840,22680,23520,24360,25200,26040,26880,27720,28560,29400,30240,31080,31920]


  """
  @doc offset: 0,
       sequence: "Multiples of 840.",
       references: [{:oeis, :a169827, "https://oeis.org/A169827"}]
  def create_sequence_a169827(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a169827/1)
  end

  @doc offset: 0
  def seq_a169827(idx) do
    idx * 840
  end

  @doc """
  OEIS Sequence `A252994` - Multiples of 26.

  From [OEIS A252994](https://oeis.org/A252994):

  > Multiples of 26.
  > (Formerly )

  **Sequence IDs**: `:a252994`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a252994) |> Sequence.take!(54)
      [0,26,52,78,104,130,156,182,208,234,260,286,312,338,364,390,416,442,468,494,520,546,572,598,624,650,676,702,728,754,780,806,832,858,884,910,936,962,988,1014,1040,1066,1092,1118,1144,1170,1196,1222,1248,1274,1300,1326,1352,1378]


  """
  @doc offset: 0,
       sequence: "Multiples of 26.",
       references: [{:oeis, :a252994, "https://oeis.org/A252994"}]
  def create_sequence_a252994(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a252994/1)
  end

  @doc offset: 0
  def seq_a252994(idx) do
    idx * 26
  end

  @doc """
  OEIS Sequence `A305548` - a(n) = 27*n.

  From [OEIS A305548](https://oeis.org/A305548):

  > a(n) = 27*n.
  > (Formerly )

  **Sequence IDs**: `:a305548`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a305548) |> Sequence.take!(57)
      [0,27,54,81,108,135,162,189,216,243,270,297,324,351,378,405,432,459,486,513,540,567,594,621,648,675,702,729,756,783,810,837,864,891,918,945,972,999,1026,1053,1080,1107,1134,1161,1188,1215,1242,1269,1296,1323,1350,1377,1404,1431,1458,1485,1512]


  """
  @doc offset: 0,
       sequence: "a(n) = 27*n.",
       references: [{:oeis, :a305548, "https://oeis.org/A305548"}]
  def create_sequence_a305548(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a305548/1)
  end

  @doc offset: 0
  def seq_a305548(idx) do
    idx * 27
  end

  @doc """
  OEIS Sequence `A121023` - Multiples of 3 containing a 3 in their decimal representation.

  From [OEIS A121023](https://oeis.org/A121023):

  > Multiples of 3 containing a 3 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121023`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121023) |> Sequence.take!(53)
      [3,30,33,36,39,63,93,123,132,135,138,153,183,213,231,234,237,243,273,300,303,306,309,312,315,318,321,324,327,330,333,336,339,342,345,348,351,354,357,360,363,366,369,372,375,378,381,384,387,390,393,396,399]


  """
  @doc offset: 1,
       sequence: "Multiples of 3 containing a 3 in their decimal representation.",
       references: [{:oeis, :a121023, "https://oeis.org/A121023"}]
  def create_sequence_a121023(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121023/2)
  end

  @doc offset: 1
  def seq_a121023(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 3) end, last, 3)
  end

  @doc """
  OEIS Sequence `A121024` - Multiples of 4 containing a 4 in their decimal representation.

  From [OEIS A121024](https://oeis.org/A121024):

  > Multiples of 4 containing a 4 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121024`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121024) |> Sequence.take!(53)
      [4,24,40,44,48,64,84,104,124,140,144,148,164,184,204,224,240,244,248,264,284,304,324,340,344,348,364,384,400,404,408,412,416,420,424,428,432,436,440,444,448,452,456,460,464,468,472,476,480,484,488,492,496]


  """
  @doc offset: 1,
       sequence: "Multiples of 4 containing a 4 in their decimal representation.",
       references: [{:oeis, :a121024, "https://oeis.org/A121024"}]
  def create_sequence_a121024(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121024/2)
  end

  @doc offset: 1
  def seq_a121024(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 4) end, last, 4)
  end

  @doc """
  OEIS Sequence `A121025` - Multiples of 5 containing a 5 in their decimal representation.

  From [OEIS A121025](https://oeis.org/A121025):

  > Multiples of 5 containing a 5 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121025`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121025) |> Sequence.take!(54)
      [5,15,25,35,45,50,55,65,75,85,95,105,115,125,135,145,150,155,165,175,185,195,205,215,225,235,245,250,255,265,275,285,295,305,315,325,335,345,350,355,365,375,385,395,405,415,425,435,445,450,455,465,475,485]


  """
  @doc offset: 1,
       sequence: "Multiples of 5 containing a 5 in their decimal representation.",
       references: [{:oeis, :a121025, "https://oeis.org/A121025"}]
  def create_sequence_a121025(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121025/2)
  end

  @doc offset: 1
  def seq_a121025(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 5) end, last, 5)
  end

  @doc """
  OEIS Sequence `A121026` - Multiples of 6 containing a 6 in their decimal representation.

  From [OEIS A121026](https://oeis.org/A121026):

  > Multiples of 6 containing a 6 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121026`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121026) |> Sequence.take!(53)
      [6,36,60,66,96,126,156,162,168,186,216,246,264,276,306,336,360,366,396,426,456,462,468,486,516,546,564,576,600,606,612,618,624,630,636,642,648,654,660,666,672,678,684,690,696,726,756,762,768,786,816,846,864]


  """
  @doc offset: 1,
       sequence: "Multiples of 6 containing a 6 in their decimal representation.",
       references: [{:oeis, :a121026, "https://oeis.org/A121026"}]
  def create_sequence_a121026(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121026/2)
  end

  @doc offset: 1
  def seq_a121026(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 6) end, last, 6)
  end

  @doc """
  OEIS Sequence `A121027` - Multiples of 7 containing a 7 in their decimal representation.

  From [OEIS A121027](https://oeis.org/A121027):

  > Multiples of 7 containing a 7 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121027`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121027) |> Sequence.take!(50)
      [7,70,77,147,175,217,273,287,357,371,378,427,476,497,567,574,637,672,679,700,707,714,721,728,735,742,749,756,763,770,777,784,791,798,847,875,917,973,987,1057,1071,1078,1127,1176,1197,1267,1274,1337,1372,1379]


  """
  @doc offset: 1,
       sequence: "Multiples of 7 containing a 7 in their decimal representation.",
       references: [{:oeis, :a121027, "https://oeis.org/A121027"}]
  def create_sequence_a121027(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121027/2)
  end

  @doc offset: 1
  def seq_a121027(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 7) end, last, 7)
  end

  @doc """
  OEIS Sequence `A121028` - Multiples of 8 containing an 8 in their decimal representation.

  From [OEIS A121028](https://oeis.org/A121028):

  > Multiples of 8 containing an 8 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121028`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121028) |> Sequence.take!(51)
      [8,48,80,88,128,168,184,208,248,280,288,328,368,384,408,448,480,488,528,568,584,608,648,680,688,728,768,784,800,808,816,824,832,840,848,856,864,872,880,888,896,928,968,984,1008,1048,1080,1088,1128,1168,1184]


  """
  @doc offset: 1,
       sequence: "Multiples of 8 containing an 8 in their decimal representation.",
       references: [{:oeis, :a121028, "https://oeis.org/A121028"}]
  def create_sequence_a121028(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121028/2)
  end

  @doc offset: 1
  def seq_a121028(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 8) end, last, 8)
  end

  @doc """
  OEIS Sequence `A121029` - Multiples of 9 containing a 9 in their decimal representation.

  From [OEIS A121029](https://oeis.org/A121029):

  > Multiples of 9 containing a 9 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121029`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121029) |> Sequence.take!(48)
      [9,90,99,189,198,279,297,369,396,459,495,549,594,639,693,729,792,819,891,900,909,918,927,936,945,954,963,972,981,990,999,1089,1098,1179,1197,1269,1296,1359,1395,1449,1494,1539,1593,1629,1692,1719,1791,1809]


  """
  @doc offset: 1,
       sequence: "Multiples of 9 containing a 9 in their decimal representation.",
       references: [{:oeis, :a121029, "https://oeis.org/A121029"}]
  def create_sequence_a121029(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121029/2)
  end

  @doc offset: 1
  def seq_a121029(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 9) end, last, 9)
  end

  @doc """
  OEIS Sequence `A121030` - Multiples of 10 containing a 10 in their decimal representation.

  From [OEIS A121030](https://oeis.org/A121030):

  > Multiples of 10 containing a 10 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121030`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121030) |> Sequence.take!(44)
      [10,100,110,210,310,410,510,610,710,810,910,1000,1010,1020,1030,1040,1050,1060,1070,1080,1090,1100,1110,1210,1310,1410,1510,1610,1710,1810,1910,2010,2100,2110,2210,2310,2410,2510,2610,2710,2810,2910,3010,3100]


  """
  @doc offset: 1,
       sequence: "Multiples of 10 containing a 10 in their decimal representation.",
       references: [{:oeis, :a121030, "https://oeis.org/A121030"}]
  def create_sequence_a121030(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121030/2)
  end

  @doc offset: 1
  def seq_a121030(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 10) end, last, 10)
  end

  @doc """
  OEIS Sequence `A121031` - Multiples of 11 containing an 11 in their decimal representation.

  From [OEIS A121031](https://oeis.org/A121031):

  > Multiples of 11 containing an 11 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121031`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121031) |> Sequence.take!(39)
      [11,110,1100,1111,1122,1133,1144,1155,1166,1177,1188,1199,2112,2211,3113,3311,4114,4411,5115,5511,6116,6611,7117,7711,8118,8811,9119,9911,11000,11011,11022,11033,11044,11055,11066,11077,11088,11099,11110]


  """
  @doc offset: 1,
       sequence: "Multiples of 11 containing an 11 in their decimal representation.",
       references: [{:oeis, :a121031, "https://oeis.org/A121031"}]
  def create_sequence_a121031(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121031/2)
  end

  @doc offset: 1
  def seq_a121031(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 11) end, last, 11)
  end

  @doc """
  OEIS Sequence `A121032` - Multiples of 12 containing a 12 in their decimal representation.

  From [OEIS A121032](https://oeis.org/A121032):

  > Multiples of 12 containing a 12 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121032`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121032) |> Sequence.take!(43)
      [12,120,312,612,912,1128,1200,1212,1224,1236,1248,1260,1272,1284,1296,1512,1812,2112,2124,2412,2712,3012,3120,3312,3612,3912,4128,4212,4512,4812,5112,5124,5412,5712,6012,6120,6312,6612,6912,7128,7212,7512,7812]


  """
  @doc offset: 1,
       sequence: "Multiples of 12 containing a 12 in their decimal representation.",
       references: [{:oeis, :a121032, "https://oeis.org/A121032"}]
  def create_sequence_a121032(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121032/2)
  end

  @doc offset: 1
  def seq_a121032(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 12) end, last, 12)
  end

  @doc """
  OEIS Sequence `A121033` - Multiples of 13 containing a 13 in their decimal representation.

  From [OEIS A121033](https://oeis.org/A121033):

  > Multiples of 13 containing a 13 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121033`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121033) |> Sequence.take!(38)
      [13,130,1131,1300,1313,1326,1339,1352,1365,1378,1391,2132,2613,3133,3913,4134,5135,5213,6136,6513,7137,7813,8138,9113,9139,10413,11310,11323,11336,11349,11362,11375,11388,11713,13000,13013,13026,13039]


  """
  @doc offset: 1,
       sequence: "Multiples of 13 containing a 13 in their decimal representation.",
       references: [{:oeis, :a121033, "https://oeis.org/A121033"}]
  def create_sequence_a121033(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121033/2)
  end

  @doc offset: 1
  def seq_a121033(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 13) end, last, 13)
  end

  @doc """
  OEIS Sequence `A121034` - Multiples of 14 containing a 14 in their decimal representation.

  From [OEIS A121034](https://oeis.org/A121034):

  > Multiples of 14 containing a 14 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121034`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121034) |> Sequence.take!(40)
      [14,140,714,1148,1400,1414,1428,1442,1456,1470,1484,1498,2114,2142,2814,3514,4144,4214,4914,5614,6146,6314,7014,7140,7714,8148,8414,9114,9142,9814,10514,11144,11214,11410,11424,11438,11452,11466,11480,11494]


  """
  @doc offset: 1,
       sequence: "Multiples of 14 containing a 14 in their decimal representation.",
       references: [{:oeis, :a121034, "https://oeis.org/A121034"}]
  def create_sequence_a121034(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121034/2)
  end

  @doc offset: 1
  def seq_a121034(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 14) end, last, 14)
  end

  @doc """
  OEIS Sequence `A121035` - Multiples of 15 containing a 15 in their decimal representation.

  From [OEIS A121035](https://oeis.org/A121035):

  > Multiples of 15 containing a 15 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121035`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121035) |> Sequence.take!(43)
      [15,150,315,615,915,1155,1215,1500,1515,1530,1545,1560,1575,1590,1815,2115,2415,2715,3015,3150,3315,3615,3915,4155,4215,4515,4815,5115,5415,5715,6015,6150,6315,6615,6915,7155,7215,7515,7815,8115,8415,8715,9015]


  """
  @doc offset: 1,
       sequence: "Multiples of 15 containing a 15 in their decimal representation.",
       references: [{:oeis, :a121035, "https://oeis.org/A121035"}]
  def create_sequence_a121035(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121035/2)
  end

  @doc offset: 1
  def seq_a121035(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 15) end, last, 15)
  end

  @doc """
  OEIS Sequence `A121036` - Multiples of 16 containing a 16 in their decimal representation.

  From [OEIS A121036](https://oeis.org/A121036):

  > Multiples of 16 containing a 16 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121036`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121036) |> Sequence.take!(42)
      [16,160,416,816,1168,1216,1600,1616,1632,1648,1664,1680,1696,2016,2160,2416,2816,3168,3216,3616,4016,4160,4416,4816,5168,5216,5616,6016,6160,6416,6816,7168,7216,7616,8016,8160,8416,8816,9168,9216,9616,10016]


  """
  @doc offset: 1,
       sequence: "Multiples of 16 containing a 16 in their decimal representation.",
       references: [{:oeis, :a121036, "https://oeis.org/A121036"}]
  def create_sequence_a121036(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121036/2)
  end

  @doc offset: 1
  def seq_a121036(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 16) end, last, 16)
  end

  @doc """
  OEIS Sequence `A121037` - Multiples of 17 containing a 17 in their decimal representation.

  From [OEIS A121037](https://oeis.org/A121037):

  > Multiples of 17 containing a 17 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121037`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121037) |> Sequence.take!(37)
      [17,170,1173,1700,1717,1734,1751,1768,1785,2176,3179,3417,5117,6171,6817,7174,8177,8517,10217,11713,11730,11747,11764,11781,11798,11917,12172,13175,13617,14178,15317,17000,17017,17034,17051,17068,17085]


  """
  @doc offset: 1,
       sequence: "Multiples of 17 containing a 17 in their decimal representation.",
       references: [{:oeis, :a121037, "https://oeis.org/A121037"}]
  def create_sequence_a121037(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121037/2)
  end

  @doc offset: 1
  def seq_a121037(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 17) end, last, 17)
  end

  @doc """
  OEIS Sequence `A121038` - Multiples of 18 containing a 18 in their decimal representation.

  From [OEIS A121038](https://oeis.org/A121038):

  > Multiples of 18 containing a 18 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121038`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121038) |> Sequence.take!(39)
      [18,180,918,1188,1800,1818,1836,1854,1872,1890,2718,3186,3618,4518,5184,5418,6318,7182,7218,8118,9018,9180,9918,10188,10818,11718,11808,11826,11844,11862,11880,11898,12186,12618,13518,14184,14418,15318,16182]


  """
  @doc offset: 1,
       sequence: "Multiples of 18 containing a 18 in their decimal representation.",
       references: [{:oeis, :a121038, "https://oeis.org/A121038"}]
  def create_sequence_a121038(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121038/2)
  end

  @doc offset: 1
  def seq_a121038(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 18) end, last, 18)
  end

  @doc """
  OEIS Sequence `A121039` - Multiples of 19 containing a 19 in their decimal representation.

  From [OEIS A121039](https://oeis.org/A121039):

  > Multiples of 19 containing a 19 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121039`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121039) |> Sequence.take!(37)
      [19,190,1197,1900,1919,1938,1957,1976,1995,3192,3819,4199,5719,6194,7619,9196,9519,11191,11419,11913,11932,11951,11970,11989,12198,13319,14193,15219,17119,17195,19000,19019,19038,19057,19076,19095,19114]


  """
  @doc offset: 1,
       sequence: "Multiples of 19 containing a 19 in their decimal representation.",
       references: [{:oeis, :a121039, "https://oeis.org/A121039"}]
  def create_sequence_a121039(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121039/2)
  end

  @doc offset: 1
  def seq_a121039(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 19) end, last, 19)
  end

  @doc """
  OEIS Sequence `A121040` - Multiples of 20 containing a 20 in their decimal representation.

  From [OEIS A121040](https://oeis.org/A121040):

  > Multiples of 20 containing a 20 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121040`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a121040) |> Sequence.take!(44)
      [20,120,200,220,320,420,520,620,720,820,920,1020,1120,1200,1220,1320,1420,1520,1620,1720,1820,1920,2000,2020,2040,2060,2080,2120,2200,2220,2320,2420,2520,2620,2720,2820,2920,3020,3120,3200,3220,3320,3420,3520]


  """
  @doc offset: 1,
       sequence: "Multiples of 20 containing a 20 in their decimal representation.",
       references: [{:oeis, :a121040, "https://oeis.org/A121040"}]
  def create_sequence_a121040(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a121040/2)
  end

  @doc offset: 1
  def seq_a121040(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 20) end, last, 20)
  end

  @doc """
  OEIS Sequence `A135628` - Multiples of 28.

  From [OEIS A135628](https://oeis.org/A135628):

  > Multiples of 28.
  > (Formerly )

  **Sequence IDs**: `:a135628`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a135628) |> Sequence.take!(50)
      [0,28,56,84,112,140,168,196,224,252,280,308,336,364,392,420,448,476,504,532,560,588,616,644,672,700,728,756,784,812,840,868,896,924,952,980,1008,1036,1064,1092,1120,1148,1176,1204,1232,1260,1288,1316,1344,1372]


  """
  @doc offset: 0,
       sequence: "Multiples of 28.",
       references: [{:oeis, :a135628, "https://oeis.org/A135628"}]
  def create_sequence_a135628(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a135628/1)
  end

  @doc offset: 0
  def seq_a135628(idx) do
    idx * 28
  end

  @doc """
  OEIS Sequence `A195819` - Multiples of 29.

  From [OEIS A195819](https://oeis.org/A195819):

  > Multiples of 29.
  > (Formerly )

  **Sequence IDs**: `:a195819`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a195819) |> Sequence.take!(47)
      [0,29,58,87,116,145,174,203,232,261,290,319,348,377,406,435,464,493,522,551,580,609,638,667,696,725,754,783,812,841,870,899,928,957,986,1015,1044,1073,1102,1131,1160,1189,1218,1247,1276,1305,1334]


  """
  @doc offset: 0,
       sequence: "Multiples of 29.",
       references: [{:oeis, :a195819, "https://oeis.org/A195819"}]
  def create_sequence_a195819(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a195819/1)
  end

  @doc offset: 0
  def seq_a195819(idx) do
    idx * 29
  end

  @doc """
  OEIS Sequence `A249674` - a(n) = 30*n.

  From [OEIS A249674](https://oeis.org/A249674):

  > a(n) = 30*n.
  > (Formerly )

  **Sequence IDs**: `:a249674`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a249674) |> Sequence.take!(49)
      [0,30,60,90,120,150,180,210,240,270,300,330,360,390,420,450,480,510,540,570,600,630,660,690,720,750,780,810,840,870,900,930,960,990,1020,1050,1080,1110,1140,1170,1200,1230,1260,1290,1320,1350,1380,1410,1440]


  """
  @doc offset: 0,
       sequence: "a(n) = 30*n.",
       references: [{:oeis, :a249674, "https://oeis.org/A249674"}]
  def create_sequence_a249674(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a249674/1)
  end

  @doc offset: 0
  def seq_a249674(idx) do
    idx * 30
  end

  @doc """
  OEIS Sequence `A135631` - Multiples of 31.

  From [OEIS A135631](https://oeis.org/A135631):

  > Multiples of 31.
  > (Formerly )

  **Sequence IDs**: `:a135631`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a135631) |> Sequence.take!(49)
      [0,31,62,93,124,155,186,217,248,279,310,341,372,403,434,465,496,527,558,589,620,651,682,713,744,775,806,837,868,899,930,961,992,1023,1054,1085,1116,1147,1178,1209,1240,1271,1302,1333,1364,1395,1426,1457,1488]


  """
  @doc offset: 0,
       sequence: "Multiples of 31.",
       references: [{:oeis, :a135631, "https://oeis.org/A135631"}]
  def create_sequence_a135631(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a135631/1)
  end

  @doc offset: 0
  def seq_a135631(idx) do
    idx * 31
  end

  @doc """
  OEIS Sequence `A174312` - 32*n.

  From [OEIS A174312](https://oeis.org/A174312):

  > 32*n.
  > (Formerly )

  **Sequence IDs**: `:a174312`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a174312) |> Sequence.take!(51)
      [0,32,64,96,128,160,192,224,256,288,320,352,384,416,448,480,512,544,576,608,640,672,704,736,768,800,832,864,896,928,960,992,1024,1056,1088,1120,1152,1184,1216,1248,1280,1312,1344,1376,1408,1440,1472,1504,1536,1568,1600]


  """
  @doc offset: 0,
       sequence: "32*n.",
       references: [{:oeis, :a174312, "https://oeis.org/A174312"}]
  def create_sequence_a174312(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a174312/1)
  end

  @doc offset: 0
  def seq_a174312(idx) do
    idx * 32
  end

  @doc """
  OEIS Sequence `A044102` - Multiples of 36.

  From [OEIS A044102](https://oeis.org/A044102):

  > Multiples of 36.
  > (Formerly )

  **Sequence IDs**: `:a044102`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a044102) |> Sequence.take!(48)
      [0,36,72,108,144,180,216,252,288,324,360,396,432,468,504,540,576,612,648,684,720,756,792,828,864,900,936,972,1008,1044,1080,1116,1152,1188,1224,1260,1296,1332,1368,1404,1440,1476,1512,1548,1584,1620,1656,1692]


  """
  @doc offset: 0,
       sequence: "Multiples of 36.",
       references: [{:oeis, :a044102, "https://oeis.org/A044102"}]
  def create_sequence_a044102(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a044102/1)
  end

  @doc offset: 0
  def seq_a044102(idx) do
    idx * 36
  end

  @doc """
  OEIS Sequence `A062768` - Multiples of 6 such that the sum of the digits is equal to 6.

  From [OEIS A062768](https://oeis.org/A062768):

  > Multiples of 6 such that the sum of the digits is equal to 6.
  > (Formerly )

  **Sequence IDs**: `:a062768`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a062768) |> Sequence.take!(46)
      [6,24,42,60,114,132,150,204,222,240,312,330,402,420,510,600,1014,1032,1050,1104,1122,1140,1212,1230,1302,1320,1410,1500,2004,2022,2040,2112,2130,2202,2220,2310,2400,3012,3030,3102,3120,3210,3300,4002,4020,4110]


  """
  @doc offset: 1,
       sequence: "Multiples of 6 such that the sum of the digits is equal to 6.",
       references: [{:oeis, :a062768, "https://oeis.org/A062768"}]
  def create_sequence_a062768(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a062768/2)
  end

  @doc offset: 1
  def seq_a062768(_idx, last) do
    Math.next_number(fn v -> Math.digit_sum(v) == 6 end, last, 6)
  end

  @doc """
  OEIS Sequence `A063416` - Multiples of 7 whose sum of digits is equal to 7.

  From [OEIS A063416](https://oeis.org/A063416):

  > Multiples of 7 whose sum of digits is equal to 7.
  > (Formerly )

  **Sequence IDs**: `:a063416`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a063416) |> Sequence.take!(38)
      [7,70,133,322,511,700,1015,1141,1204,1330,2023,2212,2401,3031,3220,4102,5110,7000,10024,10150,10213,10402,11032,11221,11410,12040,12103,13111,13300,15001,20041,20104,20230,21112,21301,22120,23002,24010]


  """
  @doc offset: 1,
       sequence: "Multiples of 7 whose sum of digits is equal to 7.",
       references: [{:oeis, :a063416, "https://oeis.org/A063416"}]
  def create_sequence_a063416(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a063416/2)
  end

  @doc offset: 1
  def seq_a063416(_idx, last) do
    Math.next_number(fn v -> Math.digit_sum(v) == 7 end, last, 7)
  end

  @doc """
  OEIS Sequence `A063997` - Multiples of 4 whose digits add to 4.

  From [OEIS A063997](https://oeis.org/A063997):

  > Multiples of 4 whose digits add to 4.
  > (Formerly )

  **Sequence IDs**: `:a063997`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a063997) |> Sequence.take!(36)
      [4,40,112,220,400,1012,1120,1300,2020,2200,3100,4000,10012,10120,10300,11020,11200,12100,13000,20020,20200,21100,22000,30100,31000,40000,100012,100120,100300,101020,101200,102100,103000,110020,110200,111100]


  """
  @doc offset: 1,
       sequence: "Multiples of 4 whose digits add to 4.",
       references: [{:oeis, :a063997, "https://oeis.org/A063997"}]
  def create_sequence_a063997(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a063997/2)
  end

  @doc offset: 1
  def seq_a063997(_idx, last) do
    Math.next_number(fn v -> Math.digit_sum(v) == 4 end, last, 4)
  end

  @doc """
  OEIS Sequence `A069537` - Multiples of 2 with digit sum = 2.

  From [OEIS A069537](https://oeis.org/A069537):

  > Multiples of 2 with digit sum = 2.
  > (Formerly )

  **Sequence IDs**: `:a069537`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a069537) |> Sequence.take!(29)
      [2,20,110,200,1010,1100,2000,10010,10100,11000,20000,100010,100100,101000,110000,200000,1000010,1000100,1001000,1010000,1100000,2000000,10000010,10000100,10001000,10010000,10100000,11000000,20000000]


  """
  @doc offset: 1,
       sequence: "Multiples of 2 with digit sum = 2.",
       references: [{:oeis, :a069537, "https://oeis.org/A069537"}]
  def create_sequence_a069537(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a069537/2)
  end

  @doc offset: 1
  def seq_a069537(_idx, last) do
    Math.next_number(fn v -> Math.digit_sum(v) == 2 end, last, 2)
  end

  @doc """
  OEIS Sequence `A069540` - Multiples of 5 with digit sum 5.

  From [OEIS A069540](https://oeis.org/A069540):

  > Multiples of 5 with digit sum 5.
  > (Formerly )

  **Sequence IDs**: `:a069540`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a069540) |> Sequence.take!(39)
      [5,50,140,230,320,410,500,1040,1130,1220,1310,1400,2030,2120,2210,2300,3020,3110,3200,4010,4100,5000,10040,10130,10220,10310,10400,11030,11120,11210,11300,12020,12110,12200,13010,13100,14000,20030,20120]


  """
  @doc offset: 1,
       sequence: "Multiples of 5 with digit sum 5.",
       references: [{:oeis, :a069540, "https://oeis.org/A069540"}]
  def create_sequence_a069540(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a069540/2)
  end

  @doc offset: 1
  def seq_a069540(_idx, last) do
    Math.next_number(fn v -> Math.digit_sum(v) == 5 end, last, 5)
  end

  @doc """
  OEIS Sequence `A069543` - Multiples of 8 with digit sum 8.

  From [OEIS A069543](https://oeis.org/A069543):

  > Multiples of 8 with digit sum 8.
  > (Formerly )

  **Sequence IDs**: `:a069543`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a069543) |> Sequence.take!(40)
      [8,80,152,224,440,512,800,1016,1160,1232,1304,1520,2024,2240,2312,2600,3032,3104,3320,4040,4112,4400,5120,6200,8000,10016,10160,10232,10304,10520,11024,11240,11312,11600,12032,12104,12320,13040,13112,13400]


  """
  @doc offset: 1,
       sequence: "Multiples of 8 with digit sum 8.",
       references: [{:oeis, :a069543, "https://oeis.org/A069543"}]
  def create_sequence_a069543(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a069543/2)
  end

  @doc offset: 1
  def seq_a069543(_idx, last) do
    Math.next_number(fn v -> Math.digit_sum(v) == 8 end, last, 8)
  end

  @doc """
  OEIS Sequence `A085959` - Multiples of 37.

  From [OEIS A085959](https://oeis.org/A085959):

  > Multiples of 37.
  > (Formerly )

  **Sequence IDs**: `:a085959`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a085959) |> Sequence.take!(48)
      [0,37,74,111,148,185,222,259,296,333,370,407,444,481,518,555,592,629,666,703,740,777,814,851,888,925,962,999,1036,1073,1110,1147,1184,1221,1258,1295,1332,1369,1406,1443,1480,1517,1554,1591,1628,1665,1702,1739]


  """
  @doc offset: 0,
       sequence: "Multiples of 37.",
       references: [{:oeis, :a085959, "https://oeis.org/A085959"}]
  def create_sequence_a085959(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a085959/1)
  end

  @doc offset: 0
  def seq_a085959(idx) do
    idx * 37
  end

  @doc """
  OEIS Sequence `A152691` - Multiples of 64.

  From [OEIS A152691](https://oeis.org/A152691):

  > Multiples of 64.
  > (Formerly )

  **Sequence IDs**: `:a152691`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a152691) |> Sequence.take!(46)
      [0,64,128,192,256,320,384,448,512,576,640,704,768,832,896,960,1024,1088,1152,1216,1280,1344,1408,1472,1536,1600,1664,1728,1792,1856,1920,1984,2048,2112,2176,2240,2304,2368,2432,2496,2560,2624,2688,2752,2816,2880]


  """
  @doc offset: 0,
       sequence: "Multiples of 64.",
       references: [{:oeis, :a152691, "https://oeis.org/A152691"}]
  def create_sequence_a152691(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a152691/1)
  end

  @doc offset: 0
  def seq_a152691(idx) do
    idx * 64
  end
  
  @doc """
  OEIS Sequence `A016825` - Positive integers congruent to 2 mod 4: a(n) = 4*n+2, for n >= 0.

  From [OEIS A016825](https://oeis.org/A016825):

  > Positive integers congruent to 2 mod 4: a(n) = 4*n+2, for n >= 0.
  > (Formerly )

  **Sequence IDs**: `:a016825`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a016825) |> Sequence.take!(59)
      [2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62,66,70,74,78,82,86,90,94,98,102,106,110,114,118,122,126,130,134,138,142,146,150,154,158,162,166,170,174,178,182,186,190,194,198,202,206,210,214,218,222,226,230,234]


  """
  @doc offset: 0,
       sequence: "Positive integers congruent to 2 mod 4: a(n) = 4*n+2, for n >= 0.",
       references: [{:oeis, :a016825, "https://oeis.org/A016825"}]
  def create_sequence_a016825(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a016825/2)
  end


  @doc offset: 0
  def seq_a016825(_idx, last) do
      Math.next_number(&Predicates.is_singly_even_number?/1, last + 1)
  end
  
  @doc """
  OEIS Sequence `A007770` - Happy numbers: numbers whose trajectory under iteration of sum of squares of digits map (see A003132) includes 1.

  From [OEIS A007770](https://oeis.org/A007770):

  > Happy numbers: numbers whose trajectory under iteration of sum of squares of digits map (see A003132) includes 1.
  > (Formerly )

  **Sequence IDs**: `:a007770`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a007770) |> Sequence.take!(54)
      [1,7,10,13,19,23,28,31,32,44,49,68,70,79,82,86,91,94,97,100,103,109,129,130,133,139,167,176,188,190,192,193,203,208,219,226,230,236,239,262,263,280,291,293,301,302,310,313,319,320,326,329,331,338]


  """
  @doc offset: 1,
       sequence: "Happy numbers: numbers whose trajectory under iteration of sum of squares of digits map (see A003132) includes 1.",
       references: [{:oeis, :a007770, "https://oeis.org/A007770"}]
  def create_sequence_a007770(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a007770/2)
  end


  @doc offset: 1
  def seq_a007770(_idx, last) do
      Math.next_number(&Predicates.is_happy_number?/1, last)
  end
  
  @doc """
  OEIS Sequence `A031177` - Unhappy numbers: numbers having period-8 2-digitized sequences.

  From [OEIS A031177](https://oeis.org/A031177):

  > Unhappy numbers: numbers having period-8 2-digitized sequences.
  > (Formerly )

  **Sequence IDs**: `:a031177`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a031177) |> Sequence.take!(68)
      [2,3,4,5,6,8,9,11,12,14,15,16,17,18,20,21,22,24,25,26,27,29,30,33,34,35,36,37,38,39,40,41,42,43,45,46,47,48,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,69,71,72,73,74,75,76,77,78,80,81,83]


  """
  @doc offset: 1,
       sequence: "Unhappy numbers: numbers having period-8 2-digitized sequences.",
       references: [{:oeis, :a031177, "https://oeis.org/A031177"}]
  def create_sequence_a031177(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a031177/2)
  end


  @doc offset: 1
  def seq_a031177(_idx, last) do
      Math.next_number(&Predicates.is_unhappy_number?/1, last)
  end
  
  @doc """
  OEIS Sequence `A138591` - Sums of two or more consecutive nonnegative integers.

  From [OEIS A138591](https://oeis.org/A138591):

  > Sums of two or more consecutive nonnegative integers.
  > (Formerly ) 

  **Sequence IDs**: `:a138591`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Multiples, :a138591) |> Sequence.take!(71)
      [1,3,5,6,7,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70,71,72,73,74,75,76,77]


  """
  @doc offset: 1,
       sequence: "Sums of two or more consecutive nonnegative integers.",
       references: [{:oeis, :a138591, "https://oeis.org/A138591"}]
  def create_sequence_a138591(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Multiples.seq_a138591/2)
  end


  @doc offset: 1, fill_value: 0
  def seq_a138591(idx, last) do
      case idx do
          1 -> 1
          _ -> Math.next_number(&Predicates.is_polite_number?/1, last)
      end
  end
end
