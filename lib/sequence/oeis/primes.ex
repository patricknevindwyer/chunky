# credo:disable-for-this-file Credo.Check.Design.AliasUsage
defmodule Chunky.Sequence.OEIS.Primes do
  @moduledoc """
  OEIS Sequences dealing with Primes, Pseudo-primes, and primality. For related sequences, see `Chunky.Sequences.OEIS.Factors`

  ## Available Sequences

  ### Pseudoprimes
  
  Fermat pseudoprimes to specific bases:
  
   - `create_sequence_a001567/1` - A001567 - Fermat pseudoprimes to base 2, also called Sarrus numbers or Poulet numbers.
   - `create_sequence_a005935/1` - A005935 - Pseudoprimes to base 3.
   - `create_sequence_a020136/1` - A020136 - Fermat pseudoprimes to base 4.
   - `create_sequence_a005936/1` - A005936 - Pseudoprimes to base 5.
   - `create_sequence_a005937/1` - A005937 - Pseudoprimes to base 6.
   - `create_sequence_a005938/1` - A005938 - Pseudoprimes to base 7.
   - `create_sequence_a020137/1` - A020137 - Pseudoprimes to base 8.
   - `create_sequence_a020138/1` - A020138 - Pseudoprimes to base 9.
   - `create_sequence_a005939/1` - A005939 - Pseudoprimes to base 10.
   - `create_sequence_a020139/1` - A020139 - Pseudoprimes to base 11.
   - `create_sequence_a020140/1` - A020140 - Pseudoprimes to base 12.
   - `create_sequence_a020141/1` - A020141 - Pseudoprimes to base 13.
   - `create_sequence_a020142/1` - A020142 - Pseudoprimes to base 14.
   - `create_sequence_a020143/1` - A020143 - Pseudoprimes to base 15.
   - `create_sequence_a020144/1` - A020144 - Pseudoprimes to base 16.
   - `create_sequence_a020145/1` - A020145 - Pseudoprimes to base 17.
   - `create_sequence_a020146/1` - A020146 - Pseudoprimes to base 18.
   - `create_sequence_a020147/1` - A020147 - Pseudoprimes to base 19.
   - `create_sequence_a020148/1` - A020148 - Pseudoprimes to base 20.
   - `create_sequence_a020149/1` - A020149 - Pseudoprimes to base 21.
   - `create_sequence_a020150/1` - A020150 - Pseudoprimes to base 22.
   - `create_sequence_a020151/1` - A020151 - Pseudoprimes to base 23.
   - `create_sequence_a020152/1` - A020152 - Pseudoprimes to base 24.
   - `create_sequence_a020153/1` - A020153 - Pseudoprimes to base 25.
   - `create_sequence_a020154/1` - A020154 - Pseudoprimes to base 26.
   - `create_sequence_a020155/1` - A020155 - Pseudoprimes to base 27.
   - `create_sequence_a020156/1` - A020156 - Pseudoprimes to base 28.
   - `create_sequence_a020157/1` - A020157 - Pseudoprimes to base 29.
   - `create_sequence_a020158/1` - A020158 - Pseudoprimes to base 30.
   - `create_sequence_a020159/1` - A020159 - Pseudoprimes to base 31.
   - `create_sequence_a020160/1` - A020160 - Pseudoprimes to base 32.
   - `create_sequence_a020161/1` - A020161 - Pseudoprimes to base 33.
   - `create_sequence_a020162/1` - A020162 - Pseudoprimes to base 34.
   - `create_sequence_a020163/1` - A020163 - Pseudoprimes to base 35.
   - `create_sequence_a020164/1` - A020164 - Pseudoprimes to base 36.
   - `create_sequence_a020165/1` - A020165 - Pseudoprimes to base 37.
   - `create_sequence_a020166/1` - A020166 - Pseudoprimes to base 38.
   - `create_sequence_a020167/1` - A020167 - Pseudoprimes to base 39.
   - `create_sequence_a020168/1` - A020168 - Pseudoprimes to base 40.
   - `create_sequence_a020169/1` - A020169 - Pseudoprimes to base 41.
   - `create_sequence_a020170/1` - A020170 - Pseudoprimes to base 42.
   - `create_sequence_a020171/1` - A020171 - Pseudoprimes to base 43.
   - `create_sequence_a020172/1` - A020172 - Pseudoprimes to base 44.
   - `create_sequence_a020173/1` - A020173 - Pseudoprimes to base 45.
   - `create_sequence_a020174/1` - A020174 - Pseudoprimes to base 46.
   - `create_sequence_a020175/1` - A020175 - Pseudoprimes to base 47.
   - `create_sequence_a020176/1` - A020176 - Pseudoprimes to base 48.
   - `create_sequence_a020177/1` - A020177 - Pseudoprimes to base 49.
   - `create_sequence_a020178/1` - A020178 - Pseudoprimes to base 50.
   - `create_sequence_a020179/1` - A020179 - Pseudoprimes to base 51.
   - `create_sequence_a020180/1` - A020180 - Pseudoprimes to base 52.
   - `create_sequence_a020181/1` - A020181 - Pseudoprimes to base 53.
   - `create_sequence_a020182/1` - A020182 - Pseudoprimes to base 54.
   - `create_sequence_a020183/1` - A020183 - Pseudoprimes to base 55.
   - `create_sequence_a020184/1` - A020184 - Pseudoprimes to base 56.
   - `create_sequence_a020185/1` - A020185 - Pseudoprimes to base 57.
   - `create_sequence_a020186/1` - A020186 - Pseudoprimes to base 58.
   - `create_sequence_a020187/1` - A020187 - Pseudoprimes to base 59.
   - `create_sequence_a020188/1` - A020188 - Pseudoprimes to base 60.
   - `create_sequence_a020189/1` - A020189 - Pseudoprimes to base 61.
   - `create_sequence_a020190/1` - A020190 - Pseudoprimes to base 62.
   - `create_sequence_a020191/1` - A020191 - Pseudoprimes to base 63.
   - `create_sequence_a020192/1` - A020192 - Pseudoprimes to base 64.
   - `create_sequence_a020193/1` - A020193 - Pseudoprimes to base 65.
   - `create_sequence_a020194/1` - A020194 - Pseudoprimes to base 66.
   - `create_sequence_a020195/1` - A020195 - Pseudoprimes to base 67.
   - `create_sequence_a020196/1` - A020196 - Pseudoprimes to base 68.
   - `create_sequence_a020197/1` - A020197 - Pseudoprimes to base 69.
   - `create_sequence_a020198/1` - A020198 - Pseudoprimes to base 70.
   - `create_sequence_a020199/1` - A020199 - Pseudoprimes to base 71.
   - `create_sequence_a020200/1` - A020200 - Pseudoprimes to base 72.
   - `create_sequence_a020201/1` - A020201 - Pseudoprimes to base 73.
   - `create_sequence_a020202/1` - A020202 - Pseudoprimes to base 74.
   - `create_sequence_a020203/1` - A020203 - Pseudoprimes to base 75.
   - `create_sequence_a020204/1` - A020204 - Pseudoprimes to base 76.
   - `create_sequence_a020205/1` - A020205 - Pseudoprimes to base 77.
   - `create_sequence_a020206/1` - A020206 - Pseudoprimes to base 78.
   - `create_sequence_a020207/1` - A020207 - Pseudoprimes to base 79.
   - `create_sequence_a020208/1` - A020208 - Pseudoprimes to base 80.
   - `create_sequence_a020209/1` - A020209 - Pseudoprimes to base 81.
   - `create_sequence_a020210/1` - A020210 - Pseudoprimes to base 82.
   - `create_sequence_a020211/1` - A020211 - Pseudoprimes to base 83.
   - `create_sequence_a020212/1` - A020212 - Pseudoprimes to base 84.
   - `create_sequence_a020213/1` - A020213 - Pseudoprimes to base 85.
   - `create_sequence_a020214/1` - A020214 - Pseudoprimes to base 86.
   - `create_sequence_a020215/1` - A020215 - Pseudoprimes to base 87.
   - `create_sequence_a020216/1` - A020216 - Pseudoprimes to base 88.
   - `create_sequence_a020217/1` - A020217 - Pseudoprimes to base 89.
   - `create_sequence_a020218/1` - A020218 - Pseudoprimes to base 90.
   - `create_sequence_a020219/1` - A020219 - Pseudoprimes to base 91.
   - `create_sequence_a020220/1` - A020220 - Pseudoprimes to base 92.
   - `create_sequence_a020221/1` - A020221 - Pseudoprimes to base 93.
   - `create_sequence_a020222/1` - A020222 - Pseudoprimes to base 94.
   - `create_sequence_a020223/1` - A020223 - Pseudoprimes to base 95.
   - `create_sequence_a020224/1` - A020224 - Pseudoprimes to base 96.
   - `create_sequence_a020225/1` - A020225 - Pseudoprimes to base 97.
   - `create_sequence_a020226/1` - A020226 - Pseudoprimes to base 98.
   - `create_sequence_a020227/1` - A020227 - Pseudoprimes to base 99.
   - `create_sequence_a020228/1` - A020228 - Pseudoprimes to base 100.

  
  ### Characterizations of Primes
  
   - `create_sequence_a162511/1` - A162511 - Multiplicative function with a(p^e)=(-1)^(e-1)


  """

  import Chunky.Sequence, only: [sequence_for_function: 1]
  alias Chunky.Math

  # require Integer

  @doc """
  OEIS Sequence `A001567` - Fermat pseudoprimes to base 2, also called Sarrus numbers or Poulet numbers.

  From [OEIS A001567](https://oeis.org/A001567):

  > Fermat pseudoprimes to base 2, also called Sarrus numbers or Poulet numbers.
  > (Formerly M5441 N2365)

  **Sequence IDs**: `:a001567`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a001567) |> Sequence.take!(40)
      [341,561,645,1105,1387,1729,1905,2047,2465,2701,2821,3277,4033,4369,4371,4681,5461,6601,7957,8321,8481,8911,10261,10585,11305,12801,13741,13747,13981,14491,15709,15841,16705,18705,18721,19951,23001,23377,25761,29341]


  """
  @doc offset: 1,
       sequence: "Fermat pseudoprimes to base 2, also called Sarrus numbers or Poulet numbers.",
       references: [{:oeis, :a001567, "https://oeis.org/A001567"}]
  def create_sequence_a001567(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a001567/2)
  end

  @doc false
  @doc offset: 1
  def seq_a001567(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 2) end, last)
  end

  @doc """
  OEIS Sequence `A005935` - Pseudoprimes to base 3.

  From [OEIS A005935](https://oeis.org/A005935):

  > Pseudoprimes to base 3.
  > (Formerly M5362)

  **Sequence IDs**: `:a005935`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a005935) |> Sequence.take!(40)
      [91,121,286,671,703,949,1105,1541,1729,1891,2465,2665,2701,2821,3281,3367,3751,4961,5551,6601,7381,8401,8911,10585,11011,12403,14383,15203,15457,15841,16471,16531,18721,19345,23521,24046,24661,24727,28009,29161]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 3.",
       references: [{:oeis, :a005935, "https://oeis.org/A005935"}]
  def create_sequence_a005935(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a005935/2)
  end

  @doc false
  @doc offset: 1
  def seq_a005935(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 3) end, last)
  end

  @doc """
  OEIS Sequence `A005936` - Pseudoprimes to base 5.

  From [OEIS A005936](https://oeis.org/A005936):

  > Pseudoprimes to base 5.
  > (Formerly M3712)

  **Sequence IDs**: `:a005936`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a005936) |> Sequence.take!(39)
      [4,124,217,561,781,1541,1729,1891,2821,4123,5461,5611,5662,5731,6601,7449,7813,8029,8911,9881,11041,11476,12801,13021,13333,13981,14981,15751,15841,16297,17767,21361,22791,23653,24211,25327,25351,29341,29539]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 5.",
       references: [{:oeis, :a005936, "https://oeis.org/A005936"}]
  def create_sequence_a005936(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a005936/2)
  end

  @doc false
  @doc offset: 1
  def seq_a005936(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 5) end, last)
  end

  @doc """
  OEIS Sequence `A005937` - Pseudoprimes to base 6.

  From [OEIS A005937](https://oeis.org/A005937):

  > Pseudoprimes to base 6.
  > (Formerly M5246)

  **Sequence IDs**: `:a005937`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a005937) |> Sequence.take!(39)
      [35,185,217,301,481,1105,1111,1261,1333,1729,2465,2701,2821,3421,3565,3589,3913,4123,4495,5713,6533,6601,8029,8365,8911,9331,9881,10585,10621,11041,11137,12209,14315,14701,15841,16589,17329,18361,18721]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 6.",
       references: [{:oeis, :a005937, "https://oeis.org/A005937"}]
  def create_sequence_a005937(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a005937/2)
  end

  @doc false
  @doc offset: 1
  def seq_a005937(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 6) end, last)
  end

  @doc """
  OEIS Sequence `A005938` - Pseudoprimes to base 7.

  From [OEIS A005938](https://oeis.org/A005938):

  > Pseudoprimes to base 7.
  > (Formerly M4168)

  **Sequence IDs**: `:a005938`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a005938) |> Sequence.take!(40)
      [6,25,325,561,703,817,1105,1825,2101,2353,2465,3277,4525,4825,6697,8321,10225,10585,10621,11041,11521,12025,13665,14089,16725,16806,18721,19345,20197,20417,20425,22945,25829,26419,29234,29341,29857,29891,30025,30811]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 7.",
       references: [{:oeis, :a005938, "https://oeis.org/A005938"}]
  def create_sequence_a005938(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a005938/2)
  end

  @doc false
  @doc offset: 1
  def seq_a005938(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 7) end, last)
  end

  @doc """
  OEIS Sequence `A005939` - Pseudoprimes to base 10.

  From [OEIS A005939](https://oeis.org/A005939):

  > Pseudoprimes to base 10.
  > (Formerly M4612)

  **Sequence IDs**: `:a005939`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a005939) |> Sequence.take!(43)
      [9,33,91,99,259,451,481,561,657,703,909,1233,1729,2409,2821,2981,3333,3367,4141,4187,4521,5461,6533,6541,6601,7107,7471,7777,8149,8401,8911,10001,11111,11169,11649,12403,12801,13833,13981,14701,14817,14911,15211]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 10.",
       references: [{:oeis, :a005939, "https://oeis.org/A005939"}]
  def create_sequence_a005939(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a005939/2)
  end

  @doc false
  @doc offset: 1
  def seq_a005939(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 10) end, last)
  end

  @doc """
  OEIS Sequence `A020136` - Fermat pseudoprimes to base 4.

  From [OEIS A020136](https://oeis.org/A020136):

  > Fermat pseudoprimes to base 4.
  > (Formerly )

  **Sequence IDs**: `:a020136`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020136) |> Sequence.take!(44)
      [15,85,91,341,435,451,561,645,703,1105,1247,1271,1387,1581,1695,1729,1891,1905,2047,2071,2465,2701,2821,3133,3277,3367,3683,4033,4369,4371,4681,4795,4859,5461,5551,6601,6643,7957,8321,8481,8695,8911,9061,9131]


  """
  @doc offset: 1,
       sequence: "Fermat pseudoprimes to base 4.",
       references: [{:oeis, :a020136, "https://oeis.org/A020136"}]
  def create_sequence_a020136(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020136/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020136(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 4) end, last)
  end

  @doc """
  OEIS Sequence `A020137` - Pseudoprimes to base 8.

  From [OEIS A020137](https://oeis.org/A020137):

  > Pseudoprimes to base 8.
  > (Formerly )

  **Sequence IDs**: `:a020137`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020137) |> Sequence.take!(47)
      [9,21,45,63,65,105,117,133,153,231,273,341,481,511,561,585,645,651,861,949,1001,1105,1281,1365,1387,1417,1541,1649,1661,1729,1785,1905,2047,2169,2465,2501,2701,2821,3145,3171,3201,3277,3605,3641,4005,4033,4097]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 8.",
       references: [{:oeis, :a020137, "https://oeis.org/A020137"}]
  def create_sequence_a020137(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020137/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020137(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 8) end, last)
  end

  @doc """
  OEIS Sequence `A020138` - Pseudoprimes to base 9.

  From [OEIS A020138](https://oeis.org/A020138):

  > Pseudoprimes to base 9.
  > (Formerly )

  **Sequence IDs**: `:a020138`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020138) |> Sequence.take!(47)
      [4,8,28,52,91,121,205,286,364,511,532,616,671,697,703,946,949,1036,1105,1288,1387,1541,1729,1891,2465,2501,2665,2701,2806,2821,2926,3052,3281,3367,3751,4376,4636,4961,5356,5551,6364,6601,6643,7081,7381,7913,8401]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 9.",
       references: [{:oeis, :a020138, "https://oeis.org/A020138"}]
  def create_sequence_a020138(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020138/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020138(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 9) end, last)
  end

  @doc """
  OEIS Sequence `A020139` - Pseudoprimes to base 11.

  From [OEIS A020139](https://oeis.org/A020139):

  > Pseudoprimes to base 11.
  > (Formerly )

  **Sequence IDs**: `:a020139`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020139) |> Sequence.take!(43)
      [10,15,70,133,190,259,305,481,645,703,793,1105,1330,1729,2047,2257,2465,2821,4577,4921,5041,5185,6601,7869,8113,8170,8695,8911,9730,10585,12403,13333,14521,14981,15841,16705,17711,18705,23377,24130,24727,26335,26467]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 11.",
       references: [{:oeis, :a020139, "https://oeis.org/A020139"}]
  def create_sequence_a020139(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020139/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020139(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 11) end, last)
  end

  @doc """
  OEIS Sequence `A020140` - Pseudoprimes to base 12.

  From [OEIS A020140](https://oeis.org/A020140):

  > Pseudoprimes to base 12.
  > (Formerly )

  **Sequence IDs**: `:a020140`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020140) |> Sequence.take!(42)
      [65,91,133,143,145,247,377,385,703,1045,1099,1105,1649,1729,1885,1891,2041,2233,2465,2701,2821,2983,3367,3553,5005,5365,5551,5785,6061,6305,6601,8911,9073,10585,11077,12403,12673,12905,13051,13333,13345,13585]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 12.",
       references: [{:oeis, :a020140, "https://oeis.org/A020140"}]
  def create_sequence_a020140(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020140/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020140(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 12) end, last)
  end

  @doc """
  OEIS Sequence `A020141` - Pseudoprimes to base 13.

  From [OEIS A020141](https://oeis.org/A020141):

  > Pseudoprimes to base 13.
  > (Formerly )

  **Sequence IDs**: `:a020141`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020141) |> Sequence.take!(43)
      [4,6,12,21,85,105,231,244,276,357,427,561,1099,1785,1891,2465,2806,3605,5028,5149,5185,5565,6601,7107,8841,8911,9577,9637,10308,10585,11305,12403,12621,13019,13345,13461,13685,14491,14981,15051,15505,15841,17803]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 13.",
       references: [{:oeis, :a020141, "https://oeis.org/A020141"}]
  def create_sequence_a020141(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020141/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020141(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 13) end, last)
  end

  @doc """
  OEIS Sequence `A020142` - Pseudoprimes to base 14.

  From [OEIS A020142](https://oeis.org/A020142):

  > Pseudoprimes to base 14.
  > (Formerly )

  **Sequence IDs**: `:a020142`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020142) |> Sequence.take!(43)
      [15,39,65,195,481,561,781,793,841,985,1105,1111,1541,1891,2257,2465,2561,2665,2743,3277,5185,5713,6501,6533,6541,7107,7171,7449,7543,7585,8321,9073,10585,12403,12505,12545,12805,12871,13429,14111,14689,15067,15457]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 14.",
       references: [{:oeis, :a020142, "https://oeis.org/A020142"}]
  def create_sequence_a020142(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020142/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020142(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 14) end, last)
  end

  @doc """
  OEIS Sequence `A020143` - Pseudoprimes to base 15.

  From [OEIS A020143](https://oeis.org/A020143):

  > Pseudoprimes to base 15.
  > (Formerly )

  **Sequence IDs**: `:a020143`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020143) |> Sequence.take!(39)
      [14,341,742,946,1477,1541,1687,1729,1891,1921,2821,3133,3277,4187,6541,6601,7471,8701,8911,9073,10279,10649,12871,14041,14701,15409,15841,16841,19201,20017,24521,25313,25546,28063,29341,30889,31021,38963,41041]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 15.",
       references: [{:oeis, :a020143, "https://oeis.org/A020143"}]
  def create_sequence_a020143(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020143/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020143(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 15) end, last)
  end

  @doc """
  OEIS Sequence `A020144` - Pseudoprimes to base 16.

  From [OEIS A020144](https://oeis.org/A020144):

  > Pseudoprimes to base 16.
  > (Formerly )

  **Sequence IDs**: `:a020144`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020144) |> Sequence.take!(45)
      [15,51,85,91,255,341,435,451,561,595,645,703,1105,1247,1261,1271,1285,1387,1581,1687,1695,1729,1891,1905,2047,2071,2091,2431,2465,2701,2821,3133,3277,3367,3655,3683,4033,4369,4371,4681,4795,4859,5083,5151,5461]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 16.",
       references: [{:oeis, :a020144, "https://oeis.org/A020144"}]
  def create_sequence_a020144(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020144/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020144(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 16) end, last)
  end

  @doc """
  OEIS Sequence `A020145` - Pseudoprimes to base 17.

  From [OEIS A020145](https://oeis.org/A020145):

  > Pseudoprimes to base 17.
  > (Formerly )

  **Sequence IDs**: `:a020145`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020145) |> Sequence.take!(43)
      [4,8,9,16,45,91,145,261,781,1111,1228,1305,1729,1885,2149,2821,3991,4005,4033,4187,4912,5365,5662,5833,6601,6697,7171,8481,8911,10585,11476,12403,12673,13333,13833,15805,15841,16705,19345,19729,20591,21781,22791]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 17.",
       references: [{:oeis, :a020145, "https://oeis.org/A020145"}]
  def create_sequence_a020145(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020145/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020145(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 17) end, last)
  end

  @doc """
  OEIS Sequence `A020146` - Pseudoprimes to base 18.

  From [OEIS A020146](https://oeis.org/A020146):

  > Pseudoprimes to base 18.
  > (Formerly )

  **Sequence IDs**: `:a020146`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020146) |> Sequence.take!(44)
      [25,49,65,85,133,221,323,325,343,425,451,637,931,1105,1225,1369,1387,1649,1729,1921,2149,2465,2701,2821,2825,2977,3325,4165,4577,4753,5525,5725,5833,5941,6305,6517,6601,7345,8911,9061,10349,10585,10961,11221]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 18.",
       references: [{:oeis, :a020146, "https://oeis.org/A020146"}]
  def create_sequence_a020146(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020146/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020146(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 18) end, last)
  end

  @doc """
  OEIS Sequence `A020147` - Pseudoprimes to base 19.

  From [OEIS A020147](https://oeis.org/A020147):

  > Pseudoprimes to base 19.
  > (Formerly )

  **Sequence IDs**: `:a020147`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020147) |> Sequence.take!(45)
      [6,9,15,18,45,49,153,169,343,561,637,889,905,906,1035,1105,1629,1661,1849,1891,2353,2465,2701,2821,2955,3201,4033,4681,5461,5466,5713,6223,6541,6601,6697,7957,8145,8281,8401,8869,9211,9997,10021,10515,10585]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 19.",
       references: [{:oeis, :a020147, "https://oeis.org/A020147"}]
  def create_sequence_a020147(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020147/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020147(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 19) end, last)
  end

  @doc """
  OEIS Sequence `A020148` - Pseudoprimes to base 20.

  From [OEIS A020148](https://oeis.org/A020148):

  > Pseudoprimes to base 20.
  > (Formerly )

  **Sequence IDs**: `:a020148`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020148) |> Sequence.take!(42)
      [21,57,133,231,399,561,671,861,889,1281,1653,1729,1891,2059,2413,2501,2761,2821,2947,3059,3201,4047,5271,5461,5473,5713,5833,6601,6817,7999,8421,8911,11229,11557,11837,12801,13051,13981,14091,15251,15311,15841]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 20.",
       references: [{:oeis, :a020148, "https://oeis.org/A020148"}]
  def create_sequence_a020148(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020148/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020148(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 20) end, last)
  end

  @doc """
  OEIS Sequence `A020149` - Pseudoprimes to base 21.

  From [OEIS A020149](https://oeis.org/A020149):

  > Pseudoprimes to base 21.
  > (Formerly )

  **Sequence IDs**: `:a020149`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020149) |> Sequence.take!(42)
      [4,10,20,55,65,85,221,703,793,1045,1105,1852,2035,2465,3781,4630,5185,5473,5995,6541,7363,8695,8965,9061,10585,10945,11647,13019,13051,13981,14491,17767,18103,18721,19345,19669,19909,21667,22681,23155,24013,25465]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 21.",
       references: [{:oeis, :a020149, "https://oeis.org/A020149"}]
  def create_sequence_a020149(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020149/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020149(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 21) end, last)
  end

  @doc """
  OEIS Sequence `A020150` - Pseudoprimes to base 22.

  From [OEIS A020150](https://oeis.org/A020150):

  > Pseudoprimes to base 22.
  > (Formerly )

  **Sequence IDs**: `:a020150`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020150) |> Sequence.take!(45)
      [21,69,91,105,161,169,345,483,485,645,805,1105,1183,1247,1261,1541,1649,1729,1891,2037,2041,2047,2413,2465,2737,2821,3241,3605,3801,5551,5565,5963,6019,6601,6693,7081,7107,7267,7665,8119,8365,8421,8911,9453,10185]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 22.",
       references: [{:oeis, :a020150, "https://oeis.org/A020150"}]
  def create_sequence_a020150(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020150/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020150(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 22) end, last)
  end

  @doc """
  OEIS Sequence `A020151` - Pseudoprimes to base 23.

  From [OEIS A020151](https://oeis.org/A020151):

  > Pseudoprimes to base 23.
  > (Formerly )

  **Sequence IDs**: `:a020151`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020151) |> Sequence.take!(46)
      [22,33,91,154,165,169,265,341,385,451,481,553,561,638,946,1027,1045,1065,1105,1183,1271,1729,1738,1749,2059,2321,2465,2501,2701,2821,2926,3097,3445,4033,4081,4345,4371,4681,5005,5149,6253,6369,6533,6541,7189,7267]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 23.",
       references: [{:oeis, :a020151, "https://oeis.org/A020151"}]
  def create_sequence_a020151(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020151/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020151(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 23) end, last)
  end

  @doc """
  OEIS Sequence `A020152` - Pseudoprimes to base 24.

  From [OEIS A020152](https://oeis.org/A020152):

  > Pseudoprimes to base 24.
  > (Formerly )

  **Sequence IDs**: `:a020152`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020152) |> Sequence.take!(43)
      [25,115,175,325,553,575,805,949,1105,1541,1729,1771,1825,1975,2413,2425,2465,2701,2737,2821,2885,3781,4207,4537,6601,6931,6943,7081,7189,7471,7501,7813,8725,8911,9085,9361,9809,10465,10585,11557,12025,13825,14425]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 24.",
       references: [{:oeis, :a020152, "https://oeis.org/A020152"}]
  def create_sequence_a020152(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020152/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020152(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 24) end, last)
  end

  @doc """
  OEIS Sequence `A020153` - Pseudoprimes to base 25.

  From [OEIS A020153](https://oeis.org/A020153):

  > Pseudoprimes to base 25.
  > (Formerly )

  **Sequence IDs**: `:a020153`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020153) |> Sequence.take!(50)
      [4,6,8,12,24,28,39,66,91,124,217,232,276,403,426,451,532,561,616,703,781,804,868,946,1128,1288,1541,1729,1891,2047,2701,2806,2821,2911,2926,3052,3126,3367,3592,3976,4069,4123,4207,4564,4636,4686,5321,5461,5551,5611]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 25.",
       references: [{:oeis, :a020153, "https://oeis.org/A020153"}]
  def create_sequence_a020153(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020153/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020153(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 25) end, last)
  end

  @doc """
  OEIS Sequence `A020154` - Pseudoprimes to base 26.

  From [OEIS A020154](https://oeis.org/A020154):

  > Pseudoprimes to base 26.
  > (Formerly )

  **Sequence IDs**: `:a020154`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020154) |> Sequence.take!(47)
      [9,15,25,27,45,75,133,135,153,175,217,225,259,425,475,561,589,675,703,775,925,1035,1065,1147,2465,3145,3325,3385,3565,3825,4123,4525,4741,4921,5041,5425,6093,6475,6525,6601,6697,8029,8695,8911,9073,10585,11005]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 26.",
       references: [{:oeis, :a020154, "https://oeis.org/A020154"}]
  def create_sequence_a020154(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020154/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020154(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 26) end, last)
  end

  @doc """
  OEIS Sequence `A020155` - Pseudoprimes to base 27.

  From [OEIS A020155](https://oeis.org/A020155):

  > Pseudoprimes to base 27.
  > (Formerly )

  **Sequence IDs**: `:a020155`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020155) |> Sequence.take!(45)
      [26,65,91,121,133,247,259,286,341,365,481,671,703,949,1001,1105,1541,1649,1729,1891,2071,2465,2665,2701,2821,2981,2993,3146,3281,3367,3605,3751,4033,4745,4921,4961,5299,5461,5551,5611,5621,6305,6533,6601,7381]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 27.",
       references: [{:oeis, :a020155, "https://oeis.org/A020155"}]
  def create_sequence_a020155(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020155/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020155(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 27) end, last)
  end

  @doc """
  OEIS Sequence `A020156` - Pseudoprimes to base 28.

  From [OEIS A020156](https://oeis.org/A020156):

  > Pseudoprimes to base 28.
  > (Formerly )

  **Sequence IDs**: `:a020156`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020156) |> Sequence.take!(43)
      [9,27,45,87,145,261,361,529,561,703,783,785,1105,1305,1413,1431,1885,2041,2413,2465,2871,3201,3277,4553,4699,5149,5181,5365,7065,8149,8321,8401,9841,10027,10585,12673,13333,13345,13357,13833,14383,14769,14981]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 28.",
       references: [{:oeis, :a020156, "https://oeis.org/A020156"}]
  def create_sequence_a020156(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020156/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020156(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 28) end, last)
  end

  @doc """
  OEIS Sequence `A020157` - Pseudoprimes to base 29.

  From [OEIS A020157](https://oeis.org/A020157):

  > Pseudoprimes to base 29.
  > (Formerly )

  **Sequence IDs**: `:a020157`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020157) |> Sequence.take!(48)
      [4,14,15,21,28,35,52,91,105,231,268,341,364,469,481,561,651,793,871,1105,1729,1876,1897,2105,2257,2821,3484,3523,4069,4371,4411,5149,5185,5356,5473,5565,5611,6097,6601,7161,7294,8321,8401,8421,8841,8911,11041,11581]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 29.",
       references: [{:oeis, :a020157, "https://oeis.org/A020157"}]
  def create_sequence_a020157(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020157/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020157(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 29) end, last)
  end

  @doc """
  OEIS Sequence `A020158` - Pseudoprimes to base 30.

  From [OEIS A020158](https://oeis.org/A020158):

  > Pseudoprimes to base 30.
  > (Formerly )

  **Sequence IDs**: `:a020158`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020158) |> Sequence.take!(46)
      [49,91,133,217,247,341,403,469,493,589,637,703,871,899,901,931,1273,1519,1537,1729,2059,2077,2821,3097,3277,3283,3367,3577,4081,4097,4123,5729,6031,6061,6097,6409,6601,6817,7657,8023,8029,8401,8911,9881,11041,11713]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 30.",
       references: [{:oeis, :a020158, "https://oeis.org/A020158"}]
  def create_sequence_a020158(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020158/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020158(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 30) end, last)
  end

  @doc """
  OEIS Sequence `A020159` - Pseudoprimes to base 31.

  From [OEIS A020159](https://oeis.org/A020159):

  > Pseudoprimes to base 31.
  > (Formerly )

  **Sequence IDs**: `:a020159`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020159) |> Sequence.take!(45)
      [6,10,15,30,49,65,66,133,185,451,481,561,637,931,946,1105,1221,1729,1813,2317,2405,2465,2553,3310,4753,4921,6241,6289,6601,7107,7421,7449,8177,8911,9073,9131,10470,10585,10963,11041,12403,14191,16219,17767,18721]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 31.",
       references: [{:oeis, :a020159, "https://oeis.org/A020159"}]
  def create_sequence_a020159(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020159/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020159(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 31) end, last)
  end

  @doc """
  OEIS Sequence `A020160` - Pseudoprimes to base 32.

  From [OEIS A020160](https://oeis.org/A020160):

  > Pseudoprimes to base 32.
  > (Formerly )

  **Sequence IDs**: `:a020160`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020160) |> Sequence.take!(46)
      [25,33,93,165,205,217,325,341,385,425,465,561,645,697,793,825,1023,1025,1045,1057,1065,1105,1353,1387,1525,1705,1729,1905,2047,2317,2325,2465,2665,2701,2761,2821,3053,3157,3277,3565,3813,4033,4123,4141,4369,4371]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 32.",
       references: [{:oeis, :a020160, "https://oeis.org/A020160"}]
  def create_sequence_a020160(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020160/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020160(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 32) end, last)
  end

  @doc """
  OEIS Sequence `A020161` - Pseudoprimes to base 33.

  From [OEIS A020161](https://oeis.org/A020161):

  > Pseudoprimes to base 33.
  > (Formerly )

  **Sequence IDs**: `:a020161`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020161) |> Sequence.take!(43)
      [4,8,16,32,85,496,545,703,1057,1105,1417,1649,1729,1853,2465,2501,2821,3368,4033,4492,4681,5461,5713,5833,6533,6601,7861,8911,9061,9073,9265,10585,11305,11359,12209,12403,13741,15841,16589,16745,17968,18103,19909]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 33.",
       references: [{:oeis, :a020161, "https://oeis.org/A020161"}]
  def create_sequence_a020161(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020161/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020161(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 33) end, last)
  end

  @doc """
  OEIS Sequence `A020162` - Pseudoprimes to base 34.

  From [OEIS A020162](https://oeis.org/A020162):

  > Pseudoprimes to base 34.
  > (Formerly )

  **Sequence IDs**: `:a020162`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020162) |> Sequence.take!(47)
      [15,21,33,35,55,65,77,105,165,231,273,385,429,435,445,671,703,1001,1045,1065,1155,1157,1281,1365,1729,1869,1891,2035,2059,2071,2145,2779,2821,2937,3201,3605,4033,4795,5005,5161,5565,5785,5995,6305,6533,6601,6853]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 34.",
       references: [{:oeis, :a020162, "https://oeis.org/A020162"}]
  def create_sequence_a020162(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020162/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020162(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 34) end, last)
  end

  @doc """
  OEIS Sequence `A020163` - Pseudoprimes to base 35.

  From [OEIS A020163](https://oeis.org/A020163):

  > Pseudoprimes to base 35.
  > (Formerly )

  **Sequence IDs**: `:a020163`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020163) |> Sequence.take!(41)
      [9,34,51,153,341,442,561,782,1247,1261,1581,1921,2278,2431,2701,2871,3298,3601,4371,5083,5161,5517,7543,7633,7969,8398,10421,11041,12403,13051,13833,14689,15051,16441,16589,17391,19006,19041,19951,20026,22681]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 35.",
       references: [{:oeis, :a020163, "https://oeis.org/A020163"}]
  def create_sequence_a020163(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020163/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020163(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 35) end, last)
  end

  @doc """
  OEIS Sequence `A020164` - Pseudoprimes to base 36.

  From [OEIS A020164](https://oeis.org/A020164):

  > Pseudoprimes to base 36.
  > (Formerly )

  **Sequence IDs**: `:a020164`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020164) |> Sequence.take!(45)
      [35,91,185,217,259,301,403,481,559,679,703,1105,1111,1147,1261,1295,1333,1387,1591,1729,1891,2465,2651,2701,2821,3007,3145,3367,3421,3565,3589,3913,4123,4141,4171,4495,5551,5611,5713,6001,6485,6533,6601,6643,7471]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 36.",
       references: [{:oeis, :a020164, "https://oeis.org/A020164"}]
  def create_sequence_a020164(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020164/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020164(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 36) end, last)
  end

  @doc """
  OEIS Sequence `A020165` - Pseudoprimes to base 37.

  From [OEIS A020165](https://oeis.org/A020165):

  > Pseudoprimes to base 37.
  > (Formerly )

  **Sequence IDs**: `:a020165`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020165) |> Sequence.take!(50)
      [4,6,9,12,18,28,36,45,57,66,133,171,217,246,268,285,301,396,451,469,561,589,685,801,817,1065,1105,1233,1273,1333,1387,1476,1653,1729,1876,1881,2044,2077,2413,2465,2501,2556,2706,2821,2881,3556,3565,3781,3913,4047]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 37.",
       references: [{:oeis, :a020165, "https://oeis.org/A020165"}]
  def create_sequence_a020165(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020165/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020165(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 37) end, last)
  end

  @doc """
  OEIS Sequence `A020166` - Pseudoprimes to base 38.

  From [OEIS A020166](https://oeis.org/A020166):

  > Pseudoprimes to base 38.
  > (Formerly )

  **Sequence IDs**: `:a020166`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020166) |> Sequence.take!(46)
      [39,65,85,91,111,185,221,259,289,469,481,561,629,697,871,1105,1221,1443,1445,2405,2465,2479,2553,2665,2701,2821,3145,3367,3585,3757,4033,4187,4681,5291,5461,6031,6097,6601,6931,7449,7585,7613,7957,8177,9073,9919]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 38.",
       references: [{:oeis, :a020166, "https://oeis.org/A020166"}]
  def create_sequence_a020166(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020166/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020166(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 38) end, last)
  end

  @doc """
  OEIS Sequence `A020167` - Pseudoprimes to base 39.

  From [OEIS A020167](https://oeis.org/A020167):

  > Pseudoprimes to base 39.
  > (Formerly )

  **Sequence IDs**: `:a020167`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020167) |> Sequence.take!(40)
      [38,95,133,341,1561,1834,1891,2047,2101,2465,3053,3439,3805,4141,4237,4411,5662,5921,6533,6601,6697,8149,8321,8911,10381,10585,12403,12431,13889,13981,15841,16297,16441,16589,17081,20567,22681,23521,26885,28153]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 39.",
       references: [{:oeis, :a020167, "https://oeis.org/A020167"}]
  def create_sequence_a020167(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020167/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020167(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 39) end, last)
  end

  @doc """
  OEIS Sequence `A020168` - Pseudoprimes to base 40.

  From [OEIS A020168](https://oeis.org/A020168):

  > Pseudoprimes to base 40.
  > (Formerly )

  **Sequence IDs**: `:a020168`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020168) |> Sequence.take!(42)
      [39,91,121,123,289,451,533,561,703,793,1541,1561,1599,1729,1921,2821,2899,3097,3367,3751,3829,4961,5461,5729,6031,6601,7111,7201,7381,8911,9073,9881,10897,11011,11041,11121,11521,12403,12801,13073,13333,13981]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 40.",
       references: [{:oeis, :a020168, "https://oeis.org/A020168"}]
  def create_sequence_a020168(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020168/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020168(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 40) end, last)
  end

  @doc """
  OEIS Sequence `A020169` - Pseudoprimes to base 41.

  From [OEIS A020169](https://oeis.org/A020169):

  > Pseudoprimes to base 41.
  > (Formerly )

  **Sequence IDs**: `:a020169`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020169) |> Sequence.take!(48)
      [4,8,10,15,20,21,35,40,105,145,231,344,561,609,645,671,703,841,1065,1105,1281,1387,1417,1729,1885,1891,2121,2465,2701,2821,3045,3053,3829,4033,4205,4521,4870,5365,5565,6161,6892,7957,8295,8321,8695,8905,8911,9253]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 41.",
       references: [{:oeis, :a020169, "https://oeis.org/A020169"}]
  def create_sequence_a020169(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020169/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020169(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 41) end, last)
  end

  @doc """
  OEIS Sequence `A020170` - Pseudoprimes to base 42.

  From [OEIS A020170](https://oeis.org/A020170):

  > Pseudoprimes to base 42.
  > (Formerly )

  **Sequence IDs**: `:a020170`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020170) |> Sequence.take!(40)
      [205,451,529,559,697,1105,1247,1441,1541,1763,1765,1807,1891,1921,1991,2465,2665,5371,5611,5977,6001,7345,7421,8041,8749,9773,10585,10621,11041,12167,12403,13333,13981,14473,14491,14981,15457,17611,18721,22399]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 42.",
       references: [{:oeis, :a020170, "https://oeis.org/A020170"}]
  def create_sequence_a020170(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020170/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020170(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 42) end, last)
  end

  @doc """
  OEIS Sequence `A020171` - Pseudoprimes to base 43.

  From [OEIS A020171](https://oeis.org/A020171):

  > Pseudoprimes to base 43.
  > (Formerly )

  **Sequence IDs**: `:a020171`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020171) |> Sequence.take!(49)
      [6,14,21,25,33,42,77,91,105,165,185,231,325,385,425,481,525,561,777,825,861,925,973,1045,1105,1221,1541,1729,1785,1807,1825,1925,2071,2425,2465,2553,2821,2849,3145,3281,3439,3781,3885,4033,4417,4825,5005,5565,6105]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 43.",
       references: [{:oeis, :a020171, "https://oeis.org/A020171"}]
  def create_sequence_a020171(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020171/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020171(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 43) end, last)
  end

  @doc """
  OEIS Sequence `A020172` - Pseudoprimes to base 44.

  From [OEIS A020172](https://oeis.org/A020172):

  > Pseudoprimes to base 44.
  > (Formerly )

  **Sequence IDs**: `:a020172`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020172) |> Sequence.take!(46)
      [9,15,45,65,117,129,215,301,369,387,585,645,703,745,1017,1035,1105,1341,1677,1729,1921,1935,1937,1981,2047,2193,2465,2665,2821,3585,3913,4005,4097,4417,4633,5289,6273,6533,6601,6705,7281,7345,8385,8695,8911,9331]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 44.",
       references: [{:oeis, :a020172, "https://oeis.org/A020172"}]
  def create_sequence_a020172(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020172/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020172(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 44) end, last)
  end

  @doc """
  OEIS Sequence `A020173` - Pseudoprimes to base 45.

  From [OEIS A020173](https://oeis.org/A020173):

  > Pseudoprimes to base 45.
  > (Formerly )

  **Sequence IDs**: `:a020173`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020173) |> Sequence.take!(45)
      [4,22,44,76,133,253,418,436,451,481,638,763,1247,1417,1541,1562,1729,1771,1891,1981,2047,2059,2071,2356,2398,2737,2821,3053,3289,3553,4033,4807,4921,5377,5963,6322,6533,6601,6817,7337,8284,8321,8911,9361,10879]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 45.",
       references: [{:oeis, :a020173, "https://oeis.org/A020173"}]
  def create_sequence_a020173(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020173/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020173(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 45) end, last)
  end

  @doc """
  OEIS Sequence `A020174` - Pseudoprimes to base 46.

  From [OEIS A020174](https://oeis.org/A020174):

  > Pseudoprimes to base 46.
  > (Formerly )

  **Sequence IDs**: `:a020174`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020174) |> Sequence.take!(47)
      [9,15,45,133,141,145,235,261,341,365,423,561,657,703,705,721,763,781,949,1105,1305,1417,1551,1645,1729,1885,1891,1957,1991,2071,2115,2117,2201,2465,2701,2821,3201,3285,4033,4089,4187,4371,4465,4681,5365,5611,5781]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 46.",
       references: [{:oeis, :a020174, "https://oeis.org/A020174"}]
  def create_sequence_a020174(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020174/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020174(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 46) end, last)
  end

  @doc """
  OEIS Sequence `A020175` - Pseudoprimes to base 47.

  From [OEIS A020175](https://oeis.org/A020175):

  > Pseudoprimes to base 47.
  > (Formerly )

  **Sequence IDs**: `:a020175`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020175) |> Sequence.take!(47)
      [46,65,69,85,221,259,341,345,427,481,506,561,645,703,721,793,805,874,897,946,1105,1173,1426,1581,1649,1702,1729,1771,1891,2257,2465,2737,2806,2821,3145,3201,3811,4301,4485,5185,5461,5865,6283,6305,6601,6943,8911]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 47.",
       references: [{:oeis, :a020175, "https://oeis.org/A020175"}]
  def create_sequence_a020175(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020175/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020175(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 47) end, last)
  end

  @doc """
  OEIS Sequence `A020176` - Pseudoprimes to base 48.

  From [OEIS A020176](https://oeis.org/A020176):

  > Pseudoprimes to base 48.
  > (Formerly )

  **Sequence IDs**: `:a020176`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020176) |> Sequence.take!(45)
      [49,91,245,259,329,427,481,637,703,793,833,1105,1267,1645,1729,1813,1891,1921,2257,2303,2305,2353,2465,2701,2821,2989,3367,3439,4465,4753,5185,5537,5551,5611,5951,6533,6601,6697,6721,7345,8869,8911,9457,9881,10021]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 48.",
       references: [{:oeis, :a020176, "https://oeis.org/A020176"}]
  def create_sequence_a020176(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020176/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020176(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 48) end, last)
  end

  @doc """
  OEIS Sequence `A020177` - Pseudoprimes to base 49.

  From [OEIS A020177](https://oeis.org/A020177):

  > Pseudoprimes to base 49.
  > (Formerly )

  **Sequence IDs**: `:a020177`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020177) |> Sequence.take!(50)
      [4,6,8,12,15,16,24,25,48,66,75,76,172,176,232,247,276,304,325,425,435,475,496,559,561,688,703,817,904,946,949,1075,1105,1128,1146,1695,1825,1891,2101,2353,2356,2465,2486,2509,2701,3056,3091,3268,3277,3439]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 49.",
       references: [{:oeis, :a020177, "https://oeis.org/A020177"}]
  def create_sequence_a020177(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020177/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020177(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 49) end, last)
  end

  @doc """
  OEIS Sequence `A020178` - Pseudoprimes to base 50.

  From [OEIS A020178](https://oeis.org/A020178):

  > Pseudoprimes to base 50.
  > (Formerly )

  **Sequence IDs**: `:a020178`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020178) |> Sequence.take!(46)
      [21,49,51,119,133,147,231,301,357,561,637,697,793,817,833,861,931,1037,1281,1649,1729,2009,2041,2047,2107,2499,2501,2701,2821,2989,3201,3281,3913,3977,4753,5461,5719,6601,7693,7701,8041,8113,8911,9061,9073,9331]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 50.",
       references: [{:oeis, :a020178, "https://oeis.org/A020178"}]
  def create_sequence_a020178(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020178/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020178(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 50) end, last)
  end

  @doc """
  OEIS Sequence `A020179` - Pseudoprimes to base 51.

  From [OEIS A020179](https://oeis.org/A020179):

  > Pseudoprimes to base 51.
  > (Formerly )

  **Sequence IDs**: `:a020179`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020179) |> Sequence.take!(43)
      [10,25,50,65,70,91,175,325,451,481,925,1247,1681,1729,1825,2059,2275,2653,2821,3053,3790,4745,4927,5461,6175,6305,6505,6601,7201,8365,8911,9031,9475,9730,9850,10585,11041,12025,12209,12403,13366,13427,13747]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 51.",
       references: [{:oeis, :a020179, "https://oeis.org/A020179"}]
  def create_sequence_a020179(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020179/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020179(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 51) end, last)
  end

  @doc """
  OEIS Sequence `A020180` - Pseudoprimes to base 52.

  From [OEIS A020180](https://oeis.org/A020180):

  > Pseudoprimes to base 52.
  > (Formerly )

  **Sequence IDs**: `:a020180`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020180) |> Sequence.take!(42)
      [51,85,159,265,561,671,901,1513,1541,1891,2413,2465,2653,2703,2705,3111,3201,3421,4081,4187,4505,5151,6307,6433,6533,6601,6943,7201,8365,8911,9197,9773,9911,10349,10585,11305,12403,13019,13333,14491,15051,15841]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 52.",
       references: [{:oeis, :a020180, "https://oeis.org/A020180"}]
  def create_sequence_a020180(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020180/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020180(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 52) end, last)
  end

  @doc """
  OEIS Sequence `A020181` - Pseudoprimes to base 53.

  From [OEIS A020181](https://oeis.org/A020181):

  > Pseudoprimes to base 53.
  > (Formerly )

  **Sequence IDs**: `:a020181`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020181) |> Sequence.take!(48)
      [4,9,26,27,28,39,45,52,65,91,117,153,286,351,364,561,585,703,946,1036,1105,1405,1441,1541,1636,1729,2209,2465,2529,2821,2863,2871,3097,3277,3367,3406,3481,3653,3861,4005,4564,4777,5317,5833,6031,6364,6433,6601]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 53.",
       references: [{:oeis, :a020181, "https://oeis.org/A020181"}]
  def create_sequence_a020181(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020181/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020181(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 53) end, last)
  end

  @doc """
  OEIS Sequence `A020182` - Pseudoprimes to base 54.

  From [OEIS A020182](https://oeis.org/A020182):

  > Pseudoprimes to base 54.
  > (Formerly )

  **Sequence IDs**: `:a020182`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020182) |> Sequence.take!(42)
      [55,265,341,361,385,583,781,1045,1105,1247,1729,1855,2201,2465,2701,2821,2863,2915,3445,4033,4069,4081,5005,5317,5461,6095,6601,7471,7957,8321,8911,9073,10585,11713,13357,14585,14701,14905,15409,15841,17755,18721]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 54.",
       references: [{:oeis, :a020182, "https://oeis.org/A020182"}]
  def create_sequence_a020182(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020182/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020182(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 54) end, last)
  end

  @doc """
  OEIS Sequence `A020183` - Pseudoprimes to base 55.

  From [OEIS A020183](https://oeis.org/A020183):

  > Pseudoprimes to base 55.
  > (Formerly )

  **Sequence IDs**: `:a020183`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020183) |> Sequence.take!(45)
      [6,9,18,21,27,54,63,91,153,189,357,369,553,697,801,1027,1266,1387,1513,1729,1869,2701,2821,3213,3649,4033,4431,6273,6533,6541,6601,6643,7189,7957,8911,9773,9937,10649,10761,13333,13617,13833,14981,15457,15841]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 55.",
       references: [{:oeis, :a020183, "https://oeis.org/A020183"}]
  def create_sequence_a020183(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020183/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020183(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 55) end, last)
  end

  @doc """
  OEIS Sequence `A020184` - Pseudoprimes to base 56.

  From [OEIS A020184](https://oeis.org/A020184):

  > Pseudoprimes to base 56.
  > (Formerly )

  **Sequence IDs**: `:a020184`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020184) |> Sequence.take!(45)
      [15,33,55,57,95,165,209,247,285,403,561,589,627,715,1027,1045,1105,1339,1501,1653,1705,1891,1957,1991,2449,2465,3135,3193,3277,3553,3565,4345,5611,5665,6441,7657,8137,8321,10585,11041,11077,12403,13585,13695,15685]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 56.",
       references: [{:oeis, :a020184, "https://oeis.org/A020184"}]
  def create_sequence_a020184(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020184/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020184(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 56) end, last)
  end

  @doc """
  OEIS Sequence `A020185` - Pseudoprimes to base 57.

  From [OEIS A020185](https://oeis.org/A020185):

  > Pseudoprimes to base 57.
  > (Formerly )

  **Sequence IDs**: `:a020185`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020185) |> Sequence.take!(47)
      [4,8,14,25,28,56,65,125,145,203,217,325,377,451,721,725,781,1001,1105,1625,1885,1891,2047,2296,2465,2701,2821,2911,3193,3277,3565,3625,3976,4141,4187,5365,5425,6461,6533,6601,7501,7613,8029,8401,9373,9425,10325]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 57.",
       references: [{:oeis, :a020185, "https://oeis.org/A020185"}]
  def create_sequence_a020185(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020185/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020185(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 57) end, last)
  end

  @doc """
  OEIS Sequence `A020186` - Pseudoprimes to base 58.

  From [OEIS A020186](https://oeis.org/A020186):

  > Pseudoprimes to base 58.
  > (Formerly )

  **Sequence IDs**: `:a020186`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020186) |> Sequence.take!(43)
      [57,133,177,285,341,561,671,703,885,1105,1121,1141,1441,1541,1729,1891,2065,2821,3009,3097,3165,3363,3365,3781,4061,4071,4371,5605,6031,6601,7363,7471,7991,8119,8321,8749,8911,9073,11441,11859,12027,12331,12403]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 58.",
       references: [{:oeis, :a020186, "https://oeis.org/A020186"}]
  def create_sequence_a020186(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020186/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020186(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 58) end, last)
  end

  @doc """
  OEIS Sequence `A020187` - Pseudoprimes to base 59.

  From [OEIS A020187](https://oeis.org/A020187):

  > Pseudoprimes to base 59.
  > (Formerly )

  **Sequence IDs**: `:a020187`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020187) |> Sequence.take!(43)
      [15,58,87,145,435,451,561,645,946,1015,1105,1141,1247,1541,1661,1729,1885,1991,2413,2465,2755,2821,3097,4215,4681,4795,5365,5611,5729,6191,6409,6533,6601,7421,8149,8321,8705,8911,9637,10081,10217,10585,11041]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 59.",
       references: [{:oeis, :a020187, "https://oeis.org/A020187"}]
  def create_sequence_a020187(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020187/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020187(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 59) end, last)
  end

  @doc """
  OEIS Sequence `A020188` - Pseudoprimes to base 60.

  From [OEIS A020188](https://oeis.org/A020188):

  > Pseudoprimes to base 60.
  > (Formerly )

  **Sequence IDs**: `:a020188`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020188) |> Sequence.take!(40)
      [341,427,481,671,793,841,1729,1891,2257,2821,3133,3277,3599,3601,3661,4577,4777,6001,6161,6533,6601,6943,8911,8917,9937,10249,11521,12331,13333,13481,14701,14981,15841,16897,18889,20591,20801,21361,22321,23479]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 60.",
       references: [{:oeis, :a020188, "https://oeis.org/A020188"}]
  def create_sequence_a020188(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020188/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020188(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 60) end, last)
  end

  @doc """
  OEIS Sequence `A020189` - Pseudoprimes to base 61.

  From [OEIS A020189](https://oeis.org/A020189):

  > Pseudoprimes to base 61.
  > (Formerly )

  **Sequence IDs**: `:a020189`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020189) |> Sequence.take!(49)
      [4,6,10,12,15,20,30,52,60,91,93,130,155,190,217,341,388,403,465,561,679,786,970,1105,1261,1441,1729,2388,2465,2701,2821,3007,3406,3565,3661,4061,4123,4371,4577,4580,5044,5356,5461,6541,6601,6697,6799,7107,7372]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 61.",
       references: [{:oeis, :a020189, "https://oeis.org/A020189"}]
  def create_sequence_a020189(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020189/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020189(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 61) end, last)
  end

  @doc """
  OEIS Sequence `A020190` - Pseudoprimes to base 62.

  From [OEIS A020190](https://oeis.org/A020190):

  > Pseudoprimes to base 62.
  > (Formerly )

  **Sequence IDs**: `:a020190`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020190) |> Sequence.take!(47)
      [9,21,45,63,91,105,183,231,305,361,427,549,561,671,679,703,793,861,1105,1261,1281,1541,1729,2121,2465,2501,2745,2871,3367,3439,3843,3845,4141,4187,4577,5185,5307,5551,5565,5901,5917,6161,6405,6533,6601,6697,6849]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 62.",
       references: [{:oeis, :a020190, "https://oeis.org/A020190"}]
  def create_sequence_a020190(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020190/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020190(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 62) end, last)
  end

  @doc """
  OEIS Sequence `A020191` - Pseudoprimes to base 63.

  From [OEIS A020191](https://oeis.org/A020191):

  > Pseudoprimes to base 63.
  > (Formerly )

  **Sequence IDs**: `:a020191`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020191) |> Sequence.take!(41)
      [62,341,481,529,703,841,1105,1147,1417,1985,2071,2465,2509,3379,3565,3683,4033,4577,5161,5461,5662,6119,6533,6943,7141,7711,9073,9265,10585,13333,13747,14089,14689,14981,15458,18721,19345,19685,19951,21037,21361]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 63.",
       references: [{:oeis, :a020191, "https://oeis.org/A020191"}]
  def create_sequence_a020191(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020191/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020191(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 63) end, last)
  end

  @doc """
  OEIS Sequence `A020192` - Pseudoprimes to base 64.

  From [OEIS A020192](https://oeis.org/A020192):

  > Pseudoprimes to base 64.
  > (Formerly )

  **Sequence IDs**: `:a020192`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020192) |> Sequence.take!(52)
      [9,15,21,35,39,45,63,65,85,91,105,117,133,153,195,221,231,247,259,273,315,341,357,435,451,455,481,511,561,585,645,651,671,703,763,765,819,861,873,949,1001,1035,1105,1205,1247,1271,1281,1365,1387,1417,1541,1581]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 64.",
       references: [{:oeis, :a020192, "https://oeis.org/A020192"}]
  def create_sequence_a020192(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020192/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020192(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 64) end, last)
  end

  @doc """
  OEIS Sequence `A020193` - Pseudoprimes to base 65.

  From [OEIS A020193](https://oeis.org/A020193):

  > Pseudoprimes to base 65.
  > (Formerly )

  **Sequence IDs**: `:a020193`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020193) |> Sequence.take!(45)
      [4,8,16,28,32,33,64,112,133,232,289,448,511,561,703,1111,1247,1387,1856,1891,1921,2452,2701,3439,3553,3729,4291,4564,5068,6533,6601,6697,8321,8911,9537,9709,9808,9809,10681,11077,11584,11647,12754,13213,14981]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 65.",
       references: [{:oeis, :a020193, "https://oeis.org/A020193"}]
  def create_sequence_a020193(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020193/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020193(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 65) end, last)
  end

  @doc """
  OEIS Sequence `A020194` - Pseudoprimes to base 66.

  From [OEIS A020194](https://oeis.org/A020194):

  > Pseudoprimes to base 66.
  > (Formerly )

  **Sequence IDs**: `:a020194`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020194) |> Sequence.take!(42)
      [65,91,335,469,481,871,1105,1271,1541,1729,1891,2071,2201,2465,2821,2911,3145,4033,4291,4355,4681,5461,5551,6097,6601,6953,7969,8911,9211,9919,10585,11305,11647,13019,13741,15211,15841,17353,19345,19757,20591,21785]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 66.",
       references: [{:oeis, :a020194, "https://oeis.org/A020194"}]
  def create_sequence_a020194(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020194/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020194(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 66) end, last)
  end

  @doc """
  OEIS Sequence `A020195` - Pseudoprimes to base 67.

  From [OEIS A020195](https://oeis.org/A020195):

  > Pseudoprimes to base 67.
  > (Formerly )

  **Sequence IDs**: `:a020195`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020195) |> Sequence.take!(47)
      [6,22,33,49,51,66,85,154,165,187,217,385,561,637,682,703,946,1045,1078,1105,1309,1519,1705,1729,2047,2209,2245,2465,2701,2805,2821,3165,3201,3565,4123,4165,4566,4631,4774,5005,5214,5611,5797,6119,6369,6601,7633]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 67.",
       references: [{:oeis, :a020195, "https://oeis.org/A020195"}]
  def create_sequence_a020195(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020195/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020195(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 67) end, last)
  end

  @doc """
  OEIS Sequence `A020196` - Pseudoprimes to base 68.

  From [OEIS A020196](https://oeis.org/A020196):

  > Pseudoprimes to base 68.
  > (Formerly )

  **Sequence IDs**: `:a020196`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020196) |> Sequence.take!(48)
      [25,49,69,91,125,133,185,201,217,247,325,345,361,403,469,481,589,637,805,871,925,931,1005,1025,1221,1225,1273,1417,1519,1541,1725,1729,1771,1813,2077,2185,2211,2413,2527,2553,2665,2725,2821,3283,3325,3565,4033,4123]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 68.",
       references: [{:oeis, :a020196, "https://oeis.org/A020196"}]
  def create_sequence_a020196(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020196/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020196(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 68) end, last)
  end

  @doc """
  OEIS Sequence `A020197` - Pseudoprimes to base 69.

  From [OEIS A020197](https://oeis.org/A020197):

  > Pseudoprimes to base 69.
  > (Formerly )

  **Sequence IDs**: `:a020197`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020197) |> Sequence.take!(44)
      [4,34,35,68,85,91,119,133,247,361,595,1105,1387,1615,1729,1921,2431,2465,2527,2701,2821,3605,3655,4187,4693,4849,5713,6161,6643,6943,7345,7735,8911,10349,10585,11191,11305,11905,13019,13357,14246,14315,15181,15841]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 69.",
       references: [{:oeis, :a020197, "https://oeis.org/A020197"}]
  def create_sequence_a020197(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020197/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020197(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 69) end, last)
  end

  @doc """
  OEIS Sequence `A020198` - Pseudoprimes to base 70.

  From [OEIS A020198](https://oeis.org/A020198):

  > Pseudoprimes to base 70.
  > (Formerly )

  **Sequence IDs**: `:a020198`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020198) |> Sequence.take!(43)
      [69,169,213,341,377,561,671,703,781,897,949,1441,1541,1633,1649,1891,2001,2201,2701,2769,2873,3053,3201,4061,4331,4371,4899,4901,6001,6177,6409,6681,7449,7991,9301,9361,11661,12121,12209,12337,12441,12673,12881]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 70.",
       references: [{:oeis, :a020198, "https://oeis.org/A020198"}]
  def create_sequence_a020198(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020198/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020198(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 70) end, last)
  end

  @doc """
  OEIS Sequence `A020199` - Pseudoprimes to base 71.

  From [OEIS A020199](https://oeis.org/A020199):

  > Pseudoprimes to base 71.
  > (Formerly )

  **Sequence IDs**: `:a020199`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020199) |> Sequence.take!(46)
      [9,10,14,15,21,35,45,63,70,105,231,315,370,435,561,703,1035,1105,1387,1729,1921,2071,2209,2321,2465,2701,2821,2871,3290,4005,4033,4431,5565,6541,6601,7345,7957,8295,8365,8695,8911,9637,9730,9809,10349,10585]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 71.",
       references: [{:oeis, :a020199, "https://oeis.org/A020199"}]
  def create_sequence_a020199(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020199/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020199(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 71) end, last)
  end

  @doc """
  OEIS Sequence `A020200` - Pseudoprimes to base 72.

  From [OEIS A020200](https://oeis.org/A020200):

  > Pseudoprimes to base 72.
  > (Formerly )

  **Sequence IDs**: `:a020200`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020200) |> Sequence.take!(42)
      [85,305,365,451,511,781,793,949,1037,1105,1241,1387,1541,1729,2465,2485,2501,2701,2821,2911,4381,4411,4453,5183,5185,5257,6205,6601,6697,8449,8911,9061,10585,11305,13213,13981,14111,15841,16441,17803,18721,19345]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 72.",
       references: [{:oeis, :a020200, "https://oeis.org/A020200"}]
  def create_sequence_a020200(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020200/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020200(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 72) end, last)
  end

  @doc """
  OEIS Sequence `A020201` - Pseudoprimes to base 73.

  From [OEIS A020201](https://oeis.org/A020201):

  > Pseudoprimes to base 73.
  > (Formerly )

  **Sequence IDs**: `:a020201`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020201) |> Sequence.take!(50)
      [4,6,8,9,12,18,24,36,45,65,72,111,117,185,205,259,276,333,369,481,533,561,585,703,1105,1221,1441,1517,1665,1729,1845,1891,1921,2047,2405,2465,2466,2553,2556,2665,2806,2821,3439,4005,4329,4636,4797,5257,5461,5662]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 73.",
       references: [{:oeis, :a020201, "https://oeis.org/A020201"}]
  def create_sequence_a020201(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020201/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020201(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 73) end, last)
  end

  @doc """
  OEIS Sequence `A020202` - Pseudoprimes to base 74.

  From [OEIS A020202](https://oeis.org/A020202):

  > Pseudoprimes to base 74.
  > (Formerly )

  **Sequence IDs**: `:a020202`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020202) |> Sequence.take!(45)
      [15,25,75,91,175,219,325,365,427,435,511,561,793,949,1095,1105,1387,1525,1729,1825,1891,2275,2465,2821,4453,4577,4795,5185,5475,5551,6175,6533,6541,6601,6643,7421,7613,8911,10585,10675,11041,12607,12775,12871,13019]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 74.",
       references: [{:oeis, :a020202, "https://oeis.org/A020202"}]
  def create_sequence_a020202(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020202/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020202(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 74) end, last)
  end

  @doc """
  OEIS Sequence `A020203` - Pseudoprimes to base 75.

  From [OEIS A020203](https://oeis.org/A020203):

  > Pseudoprimes to base 75.
  > (Formerly )

  **Sequence IDs**: `:a020203`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020203) |> Sequence.take!(44)
      [74,91,133,247,259,289,427,481,703,793,1073,1159,1261,1387,1541,1649,1729,1849,1891,2071,2257,2413,2701,2813,2821,3367,3589,4033,4681,4699,4921,5551,5917,6061,6533,6601,6643,7957,8113,8321,8614,8911,9139,9211]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 75.",
       references: [{:oeis, :a020203, "https://oeis.org/A020203"}]
  def create_sequence_a020203(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020203/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020203(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 75) end, last)
  end

  @doc """
  OEIS Sequence `A020204` - Pseudoprimes to base 76.

  From [OEIS A020204](https://oeis.org/A020204):

  > Pseudoprimes to base 76.
  > (Formerly )

  **Sequence IDs**: `:a020204`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020204) |> Sequence.take!(49)
      [15,21,25,33,35,55,75,77,105,165,175,231,265,275,325,385,425,525,545,561,781,825,949,1105,1113,1155,1325,1369,1417,1491,1541,1749,1785,1825,1891,1925,2289,2465,2701,2725,2821,3445,3597,3605,4033,4081,4097,4505,4681]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 76.",
       references: [{:oeis, :a020204, "https://oeis.org/A020204"}]
  def create_sequence_a020204(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020204/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020204(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 76) end, last)
  end

  @doc """
  OEIS Sequence `A020205` - Pseudoprimes to base 77.

  From [OEIS A020205](https://oeis.org/A020205):

  > Pseudoprimes to base 77.
  > (Formerly )

  **Sequence IDs**: `:a020205`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020205) |> Sequence.take!(44)
      [4,38,39,57,65,76,247,285,703,741,969,1105,1387,1513,1653,1891,2465,2701,2806,2965,3705,4033,4371,4636,5073,5461,5713,5785,6305,6441,6533,6541,7633,7709,7957,10081,10585,10777,11229,12871,13051,16017,16745,17081]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 77.",
       references: [{:oeis, :a020205, "https://oeis.org/A020205"}]
  def create_sequence_a020205(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020205/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020205(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 77) end, last)
  end

  @doc """
  OEIS Sequence `A020206` - Pseudoprimes to base 78.

  From [OEIS A020206](https://oeis.org/A020206):

  > Pseudoprimes to base 78.
  > (Formerly )

  **Sequence IDs**: `:a020206`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020206) |> Sequence.take!(42)
      [77,341,385,451,553,703,869,1045,1247,1271,1441,1849,1921,2047,2465,2765,3097,4061,4187,4345,4577,5371,6031,6083,6085,6545,6601,8321,8911,8965,10585,13333,13981,15211,15251,15841,17711,17767,20689,22801,23281,23617]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 78.",
       references: [{:oeis, :a020206, "https://oeis.org/A020206"}]
  def create_sequence_a020206(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020206/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020206(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 78) end, last)
  end

  @doc """
  OEIS Sequence `A020207` - Pseudoprimes to base 79.

  From [OEIS A020207](https://oeis.org/A020207):

  > Pseudoprimes to base 79.
  > (Formerly )

  **Sequence IDs**: `:a020207`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020207) |> Sequence.take!(45)
      [6,15,26,39,49,65,78,91,195,301,559,561,637,1105,1649,1729,2107,2465,2626,2665,2701,2821,3201,3913,4215,4753,5055,6305,6533,6601,7051,7107,7361,7543,8149,8321,8911,9331,9773,9881,10585,10621,12001,14491,14689]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 79.",
       references: [{:oeis, :a020207, "https://oeis.org/A020207"}]
  def create_sequence_a020207(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020207/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020207(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 79) end, last)
  end

  @doc """
  OEIS Sequence `A020208` - Pseudoprimes to base 80.

  From [OEIS A020208](https://oeis.org/A020208):

  > Pseudoprimes to base 80.
  > (Formerly )

  **Sequence IDs**: `:a020208`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020208) |> Sequence.take!(46)
      [9,27,49,81,169,237,301,333,481,553,561,637,711,891,1221,1377,1557,1729,1813,1891,2107,2133,2553,2821,2871,2997,3321,3397,3439,3537,3577,3871,3913,5461,6253,6399,6401,6533,6601,6697,7107,7189,7613,7821,8261,8281]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 80.",
       references: [{:oeis, :a020208, "https://oeis.org/A020208"}]
  def create_sequence_a020208(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020208/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020208(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 80) end, last)
  end

  @doc """
  OEIS Sequence `A020209` - Pseudoprimes to base 81.

  From [OEIS A020209](https://oeis.org/A020209):

  > Pseudoprimes to base 81.
  > (Formerly )

  **Sequence IDs**: `:a020209`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020209) |> Sequence.take!(53)
      [4,8,10,16,20,28,40,52,70,80,85,91,112,121,130,176,190,205,208,232,280,286,292,364,370,451,496,511,520,532,616,671,697,703,730,742,910,946,949,965,976,1036,1105,1168,1261,1288,1387,1435,1456,1541,1606,1729,1891]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 81.",
       references: [{:oeis, :a020209, "https://oeis.org/A020209"}]
  def create_sequence_a020209(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020209/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020209(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 81) end, last)
  end

  @doc """
  OEIS Sequence `A020210` - Pseudoprimes to base 82.

  From [OEIS A020210](https://oeis.org/A020210):

  > Pseudoprimes to base 82.
  > (Formerly )

  **Sequence IDs**: `:a020210`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020210) |> Sequence.take!(47)
      [9,25,27,45,81,91,225,249,325,405,481,511,561,645,747,793,891,925,949,1105,1245,1247,1345,1377,1387,1431,1525,1541,1729,1825,2025,2071,2101,2241,2257,2421,2465,2701,2821,2871,2905,3825,4033,4239,4453,5185,5611]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 82.",
       references: [{:oeis, :a020210, "https://oeis.org/A020210"}]
  def create_sequence_a020210(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020210/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020210(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 82) end, last)
  end

  @doc """
  OEIS Sequence `A020211` - Pseudoprimes to base 83.

  From [OEIS A020211](https://oeis.org/A020211):

  > Pseudoprimes to base 83.
  > (Formerly )

  **Sequence IDs**: `:a020211`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020211) |> Sequence.take!(46)
      [21,65,82,105,123,133,205,231,265,273,287,451,533,561,689,697,703,861,1001,1105,1113,1241,1365,1558,1729,1785,1891,2173,2465,2569,2665,2821,2993,3034,3277,3445,4081,4305,4411,4505,4641,4745,5565,5713,6541,6601]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 83.",
       references: [{:oeis, :a020211, "https://oeis.org/A020211"}]
  def create_sequence_a020211(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020211/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020211(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 83) end, last)
  end

  @doc """
  OEIS Sequence `A020212` - Pseudoprimes to base 84.

  From [OEIS A020212](https://oeis.org/A020212):

  > Pseudoprimes to base 84.
  > (Formerly )

  **Sequence IDs**: `:a020212`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020212) |> Sequence.take!(41)
      [85,415,481,703,1105,1111,1411,1615,2465,2501,2509,2981,3145,3655,3667,4141,5713,6161,6533,6973,7055,7141,7201,7885,8401,8695,9061,10585,11441,13019,13579,13981,14023,14383,14491,15181,15251,15355,15521,16405,16745]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 84.",
       references: [{:oeis, :a020212, "https://oeis.org/A020212"}]
  def create_sequence_a020212(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020212/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020212(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 84) end, last)
  end

  @doc """
  OEIS Sequence `A020213` - Pseudoprimes to base 85.

  From [OEIS A020213](https://oeis.org/A020213):

  > Pseudoprimes to base 85.
  > (Formerly )

  **Sequence IDs**: `:a020213`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020213) |> Sequence.take!(48)
      [4,6,12,14,21,28,42,84,129,231,259,276,301,341,481,532,651,703,781,903,1281,1351,1491,1591,1729,2047,2201,2509,2701,2821,3097,3201,3277,3311,3913,3972,4371,4564,4577,4681,4859,5289,5662,6031,6601,7141,7161,7543]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 85.",
       references: [{:oeis, :a020213, "https://oeis.org/A020213"}]
  def create_sequence_a020213(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020213/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020213(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 85) end, last)
  end

  @doc """
  OEIS Sequence `A020214` - Pseudoprimes to base 86.

  From [OEIS A020214](https://oeis.org/A020214):

  > Pseudoprimes to base 86.
  > (Formerly )

  **Sequence IDs**: `:a020214`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020214) |> Sequence.take!(45)
      [15,51,65,85,87,145,221,255,377,435,451,493,561,595,703,1015,1105,1479,1729,1885,1891,2091,2465,2755,2821,2845,3091,3451,4033,5365,5685,6409,6601,7395,7397,7483,7701,8695,8911,9061,9673,10585,10991,11041,11305]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 86.",
       references: [{:oeis, :a020214, "https://oeis.org/A020214"}]
  def create_sequence_a020214(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020214/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020214(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 86) end, last)
  end

  @doc """
  OEIS Sequence `A020215` - Pseudoprimes to base 87.

  From [OEIS A020215](https://oeis.org/A020215):

  > Pseudoprimes to base 87.
  > (Formerly )

  **Sequence IDs**: `:a020215`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020215) |> Sequence.take!(45)
      [86,91,133,217,247,301,385,403,473,559,589,817,1045,1105,1111,1333,1661,1705,1729,2047,2365,2626,2651,2821,3553,3565,3785,3913,4123,4141,4681,5005,5461,5719,6533,6601,7471,7483,7657,8029,8041,8401,8686,8911,9331]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 87.",
       references: [{:oeis, :a020215, "https://oeis.org/A020215"}]
  def create_sequence_a020215(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020215/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020215(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 87) end, last)
  end

  @doc """
  OEIS Sequence `A020216` - Pseudoprimes to base 88.

  From [OEIS A020216](https://oeis.org/A020216):

  > Pseudoprimes to base 88.
  > (Formerly )

  **Sequence IDs**: `:a020216`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020216) |> Sequence.take!(44)
      [87,91,133,145,217,247,267,403,445,481,589,645,1105,1247,1729,1885,1891,2047,2465,2581,2611,2821,3165,3565,4123,4331,4849,4921,5365,5551,5785,6119,6601,6697,7087,7657,7743,7745,8029,8911,9073,10585,11481,11563]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 88.",
       references: [{:oeis, :a020216, "https://oeis.org/A020216"}]
  def create_sequence_a020216(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020216/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020216(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 88) end, last)
  end

  @doc """
  OEIS Sequence `A020217` - Pseudoprimes to base 89.

  From [OEIS A020217](https://oeis.org/A020217):

  > Pseudoprimes to base 89.
  > (Formerly )

  **Sequence IDs**: `:a020217`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020217) |> Sequence.take!(49)
      [4,8,9,15,22,33,44,45,55,85,88,99,153,165,169,341,385,495,561,765,1035,1045,1105,1165,1309,1387,1441,1541,1581,1649,1729,2097,2465,2529,2611,2701,2805,2821,2977,3015,3201,3961,4015,4061,4187,4371,4777,4849,5005]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 89.",
       references: [{:oeis, :a020217, "https://oeis.org/A020217"}]
  def create_sequence_a020217(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020217/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020217(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 89) end, last)
  end

  @doc """
  OEIS Sequence `A020218` - Pseudoprimes to base 90.

  From [OEIS A020218](https://oeis.org/A020218):

  > Pseudoprimes to base 90.
  > (Formerly )

  **Sequence IDs**: `:a020218`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020218) |> Sequence.take!(39)
      [91,623,703,793,1001,1157,1729,2047,2413,2821,3091,3367,4033,4699,6281,6601,8099,8321,8401,8911,11521,11557,12403,13021,13333,13981,14701,14981,15841,17701,19307,19951,20017,20263,24641,24661,25571,29341,31021]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 90.",
       references: [{:oeis, :a020218, "https://oeis.org/A020218"}]
  def create_sequence_a020218(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020218/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020218(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 90) end, last)
  end

  @doc """
  OEIS Sequence `A020219` - Pseudoprimes to base 91.

  From [OEIS A020219](https://oeis.org/A020219):

  > Pseudoprimes to base 91.
  > (Formerly )

  **Sequence IDs**: `:a020219`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020219) |> Sequence.take!(48)
      [6,9,10,15,18,30,45,66,69,90,115,205,207,341,345,369,435,505,561,909,1035,1065,1387,1446,1541,1845,2047,2059,2465,2651,2701,2829,2871,3015,4005,4141,4187,4371,4545,5963,6273,6533,6969,7471,8646,9361,9881,10585]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 91.",
       references: [{:oeis, :a020219, "https://oeis.org/A020219"}]
  def create_sequence_a020219(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020219/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020219(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 91) end, last)
  end

  @doc """
  OEIS Sequence `A020220` - Pseudoprimes to base 92.

  From [OEIS A020220](https://oeis.org/A020220):

  > Pseudoprimes to base 92.
  > (Formerly )

  **Sequence IDs**: `:a020220`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020220) |> Sequence.take!(47)
      [21,39,65,91,93,105,217,231,273,301,341,403,451,465,559,561,651,861,1001,1085,1105,1209,1271,1333,1365,1393,1661,1729,2465,2587,2701,2821,3171,3731,3781,3913,4033,4123,4371,4641,4681,5565,6045,6169,6191,6697,7161]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 92.",
       references: [{:oeis, :a020220, "https://oeis.org/A020220"}]
  def create_sequence_a020220(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020220/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020220(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 92) end, last)
  end

  @doc """
  OEIS Sequence `A020221` - Pseudoprimes to base 93.

  From [OEIS A020221](https://oeis.org/A020221):

  > Pseudoprimes to base 93.
  > (Formerly )

  **Sequence IDs**: `:a020221`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020221) |> Sequence.take!(46)
      [4,25,28,46,92,301,322,325,425,506,532,793,805,865,874,1081,1105,1393,1525,1645,1729,1771,2047,2071,2425,2465,2737,2926,3781,3913,4033,4187,4325,4465,4945,4996,5071,5149,5185,5405,5593,5713,5833,6601,6697,6721]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 93.",
       references: [{:oeis, :a020221, "https://oeis.org/A020221"}]
  def create_sequence_a020221(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020221/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020221(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 93) end, last)
  end

  @doc """
  OEIS Sequence `A020222` - Pseudoprimes to base 94.

  From [OEIS A020222](https://oeis.org/A020222):

  > Pseudoprimes to base 94.
  > (Formerly )

  **Sequence IDs**: `:a020222`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020222) |> Sequence.take!(47)
      [15,57,91,93,95,121,133,155,217,247,285,341,403,435,465,561,589,645,969,1065,1105,1247,1541,1603,1653,1729,1767,2059,2451,2465,2821,2945,2977,3053,3565,3751,4047,4123,4351,4495,4961,5461,5685,6601,6665,7099,7107]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 94.",
       references: [{:oeis, :a020222, "https://oeis.org/A020222"}]
  def create_sequence_a020222(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020222/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020222(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 94) end, last)
  end

  @doc """
  OEIS Sequence `A020223` - Pseudoprimes to base 95.

  From [OEIS A020223](https://oeis.org/A020223):

  > Pseudoprimes to base 95.
  > (Formerly )

  **Sequence IDs**: `:a020223`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020223) |> Sequence.take!(42)
      [91,94,141,341,561,658,671,742,1111,1551,1603,1891,1921,2806,2821,2977,3131,3367,3421,3601,4089,4371,4741,5461,5551,6161,6533,6601,6721,7107,8249,8601,9121,9641,10011,11041,13361,14241,15841,16939,17907,18019]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 95.",
       references: [{:oeis, :a020223, "https://oeis.org/A020223"}]
  def create_sequence_a020223(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020223/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020223(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 95) end, last)
  end

  @doc """
  OEIS Sequence `A020224` - Pseudoprimes to base 96.

  From [OEIS A020224](https://oeis.org/A020224):

  > Pseudoprimes to base 96.
  > (Formerly )

  **Sequence IDs**: `:a020224`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020224) |> Sequence.take!(42)
      [65,95,133,469,485,679,781,973,1105,1261,1273,1649,1729,1843,2465,2641,2665,2701,2821,3545,3977,4187,4577,5617,6097,6305,6499,6601,8905,8911,9121,9215,9217,9313,10585,11155,11881,12649,12901,13289,13333,13483]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 96.",
       references: [{:oeis, :a020224, "https://oeis.org/A020224"}]
  def create_sequence_a020224(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020224/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020224(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 96) end, last)
  end

  @doc """
  OEIS Sequence `A020225` - Pseudoprimes to base 97.

  From [OEIS A020225](https://oeis.org/A020225):

  > Pseudoprimes to base 97.
  > (Formerly )

  **Sequence IDs**: `:a020225`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020225) |> Sequence.take!(50)
      [4,6,8,12,16,21,24,32,48,49,66,96,105,147,176,186,231,245,341,344,469,481,496,561,637,645,651,833,946,949,973,1056,1065,1068,1105,1128,1729,1813,1891,2046,2047,2465,2701,2821,2976,3053,3277,3283,3577,4187]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 97.",
       references: [{:oeis, :a020225, "https://oeis.org/A020225"}]
  def create_sequence_a020225(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020225/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020225(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 97) end, last)
  end

  @doc """
  OEIS Sequence `A020226` - Pseudoprimes to base 98.

  From [OEIS A020226](https://oeis.org/A020226):

  > Pseudoprimes to base 98.
  > (Formerly )

  **Sequence IDs**: `:a020226`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020226) |> Sequence.take!(46)
      [9,33,45,85,99,153,165,291,451,485,561,565,765,873,1017,1045,1067,1105,1261,1649,1705,1921,2465,2501,2651,2701,2805,3007,3201,3277,3565,3585,3609,3729,4005,4069,4365,5085,5797,6817,7345,7471,7701,8245,8321,8965]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 98.",
       references: [{:oeis, :a020226, "https://oeis.org/A020226"}]
  def create_sequence_a020226(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020226/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020226(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 98) end, last)
  end

  @doc """
  OEIS Sequence `A020227` - Pseudoprimes to base 99.

  From [OEIS A020227](https://oeis.org/A020227):

  > Pseudoprimes to base 99.
  > (Formerly )

  **Sequence IDs**: `:a020227`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020227) |> Sequence.take!(47)
      [14,25,35,49,65,98,145,169,175,217,245,325,361,377,637,703,725,742,775,833,845,1105,1225,1421,1519,1729,1834,1885,2191,2198,2413,2465,2821,3185,3277,3565,4069,4123,4225,4699,4753,4795,4901,5365,5425,5611,6601]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 99.",
       references: [{:oeis, :a020227, "https://oeis.org/A020227"}]
  def create_sequence_a020227(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020227/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020227(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 99) end, last)
  end

  @doc """
  OEIS Sequence `A020228` - Pseudoprimes to base 100.

  From [OEIS A020228](https://oeis.org/A020228):

  > Pseudoprimes to base 100.
  > (Formerly )

  **Sequence IDs**: `:a020228`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Primes, :a020228) |> Sequence.take!(46)
      [9,33,91,99,153,259,303,451,481,561,657,703,909,949,1111,1233,1241,1729,1891,2047,2329,2409,2701,2821,2871,2981,3333,3367,4141,4187,4521,5461,5551,6001,6533,6541,6601,6931,7107,7373,7471,7633,7777,8149,8401,8911]


  """
  @doc offset: 1,
       sequence: "Pseudoprimes to base 100.",
       references: [{:oeis, :a020228, "https://oeis.org/A020228"}]
  def create_sequence_a020228(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Primes.seq_a020228/2)
  end

  @doc false
  @doc offset: 1
  def seq_a020228(_idx, last) do
    Math.next_number(fn v -> Math.is_pseudo_prime?(v, 100) end, last)
  end

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

  @doc false
  @doc offset: 1
  def seq_a162511(idx) do
    -1 |> Math.pow(Math.bigomega(idx) - Math.omega(idx))
  end
end
