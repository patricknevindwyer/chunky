defmodule Chunky.Sequence.OEIS.Powers do
  @moduledoc """
  Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with powers
  and simple polynomials.

  ## Available Sequences

  ### Powers of specific integers
  
   - `create_sequence_a000351/1` - A000351 - Powers of 5: a(n) = 5^n.
   - `create_sequence_a000400/1` - A000400 - Powers of 6: a(n) = 6^n.
   - `create_sequence_a000420/1` - A000420 - Powers of 7: a(n) = 7^n.
   - `create_sequence_a001018/1` - A001018 - Powers of 8: a(n) = 8^n.
   - `create_sequence_a001019/1` - A001019 - Powers of 9: a(n) = 9^n.
   - `create_sequence_a011557/1` - A011557 - Powers of 10: a(n) = 10^n.
   - `create_sequence_a001020/1` - A001020 - Powers of 11: a(n) = 11^n.
   - `create_sequence_a001021/1` - A001021 - Powers of 12.
   - `create_sequence_a001022/1` - A001022 - Powers of 13.
   - `create_sequence_a001023/1` - A001023 - Powers of 14.
   - `create_sequence_a001024/1` - A001024 - Powers of 15.
   - `create_sequence_a001025/1` - A001025 - Powers of 16: a(n) = 16^n.
   - `create_sequence_a001026/1` - A001026 - Powers of 17.
   - `create_sequence_a001027/1` - A001027 - Powers of 18.
   - `create_sequence_a001029/1` - A001029 - Powers of 19.
   - `create_sequence_a009964/1` - A009964 - Powers of 20.
   - `create_sequence_a009965/1` - A009965 - Powers of 21.
   - `create_sequence_a009966/1` - A009966 - Powers of 22.
   - `create_sequence_a009967/1` - A009967 - Powers of 23.
   - `create_sequence_a009968/1` - A009968 - Powers of 24: a(n) = 24^n.
   - `create_sequence_a009969/1` - A009969 - Powers of 25.
   - `create_sequence_a009970/1` - A009970 - Powers of 26.
   - `create_sequence_a009971/1` - A009971 - Powers of 27.
   - `create_sequence_a009972/1` - A009972 - Powers of 28.
   - `create_sequence_a009973/1` - A009973 - Powers of 29.
   - `create_sequence_a009974/1` - A009974 - Powers of 30.
   - `create_sequence_a009975/1` - A009975 - Powers of 31.
   - `create_sequence_a009976/1` - A009976 - Powers of 32.
   - `create_sequence_a009977/1` - A009977 - Powers of 33.
   - `create_sequence_a009978/1` - A009978 - Powers of 34.
   - `create_sequence_a009979/1` - A009979 - Powers of 35.
   - `create_sequence_a009980/1` - A009980 - Powers of 36.
   - `create_sequence_a009981/1` - A009981 - Powers of 37.
   - `create_sequence_a009982/1` - A009982 - Powers of 38.
   - `create_sequence_a009983/1` - A009983 - Powers of 39.
   - `create_sequence_a009984/1` - A009984 - Powers of 40.
   - `create_sequence_a009985/1` - A009985 - Powers of 41.
   - `create_sequence_a009986/1` - A009986 - Powers of 42.
   - `create_sequence_a009987/1` - A009987 - Powers of 43.
   - `create_sequence_a009988/1` - A009988 - Powers of 44.
   - `create_sequence_a009989/1` - A009989 - Powers of 45.
   - `create_sequence_a009990/1` - A009990 - Powers of 46.
   - `create_sequence_a009991/1` - A009991 - Powers of 47.
   - `create_sequence_a009992/1` - A009992 - Powers of 48: a(n) = 48^n.
   - `create_sequence_a087752/1` - A087752 - Powers of 49.
   - `create_sequence_a159991/1` - A159991 - Powers of 60.


  ### Variations of powers of 2
  
   - `create_sequence_a000051/1` - A000051 - a(n) = 2^n + 1.
   - `create_sequence_a057716/1` - A057716 - The non-powers of 2.

  """

  import Chunky.Sequence, only: [sequence_for_function: 1]

  alias Chunky.Math
  alias Chunky.Math.Predicates

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

  @doc false
  @doc offset: 0
  def seq_a000051(idx) do
    Math.pow(2, idx) + 1
  end

  @doc """
  OEIS Sequence `A000351` - Powers of 5: a(n) = 5^n.

  From [OEIS A000351](https://oeis.org/A000351):

  > Powers of 5: a(n) = 5^n.
  > (Formerly M3937 N1620)

  **Sequence IDs**: `:a000351`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a000351) |> Sequence.take!(24)
      [1,5,25,125,625,3125,15625,78125,390625,1953125,9765625,48828125,244140625,1220703125,6103515625,30517578125,152587890625,762939453125,3814697265625,19073486328125,95367431640625,476837158203125,2384185791015625,11920928955078125]


  """
  @doc offset: 0,
       sequence: "Powers of 5: a(n) = 5^n.",
       references: [{:oeis, :a000351, "https://oeis.org/A000351"}]
  def create_sequence_a000351(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a000351/1)
  end

  @doc false
  @doc offset: 0
  def seq_a000351(idx) do
    Math.pow(5, idx)
  end

  @doc """
  OEIS Sequence `A000400` - Powers of 6: a(n) = 6^n.

  From [OEIS A000400](https://oeis.org/A000400):

  > Powers of 6: a(n) = 6^n.
  > (Formerly M4224 N1765)

  **Sequence IDs**: `:a000400`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a000400) |> Sequence.take!(23)
      [1,6,36,216,1296,7776,46656,279936,1679616,10077696,60466176,362797056,2176782336,13060694016,78364164096,470184984576,2821109907456,16926659444736,101559956668416,609359740010496,3656158440062976,21936950640377856,131621703842267136]


  """
  @doc offset: 0,
       sequence: "Powers of 6: a(n) = 6^n.",
       references: [{:oeis, :a000400, "https://oeis.org/A000400"}]
  def create_sequence_a000400(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a000400/1)
  end

  @doc false
  @doc offset: 0
  def seq_a000400(idx) do
    Math.pow(6, idx)
  end

  @doc """
  OEIS Sequence `A000420` - Powers of 7: a(n) = 7^n.

  From [OEIS A000420](https://oeis.org/A000420):

  > Powers of 7: a(n) = 7^n.
  > (Formerly M4431 N1874)

  **Sequence IDs**: `:a000420`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a000420) |> Sequence.take!(22)
      [1,7,49,343,2401,16807,117649,823543,5764801,40353607,282475249,1977326743,13841287201,96889010407,678223072849,4747561509943,33232930569601,232630513987207,1628413597910449,11398895185373143,79792266297612001,558545864083284007]


  """
  @doc offset: 0,
       sequence: "Powers of 7: a(n) = 7^n.",
       references: [{:oeis, :a000420, "https://oeis.org/A000420"}]
  def create_sequence_a000420(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a000420/1)
  end

  @doc false
  @doc offset: 0
  def seq_a000420(idx) do
    Math.pow(7, idx)
  end

  @doc """
  OEIS Sequence `A001018` - Powers of 8: a(n) = 8^n.

  From [OEIS A001018](https://oeis.org/A001018):

  > Powers of 8: a(n) = 8^n.
  > (Formerly M4555 N1937)

  **Sequence IDs**: `:a001018`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001018) |> Sequence.take!(25)
      [1,8,64,512,4096,32768,262144,2097152,16777216,134217728,1073741824,8589934592,68719476736,549755813888,4398046511104,35184372088832,281474976710656,2251799813685248,18014398509481984,144115188075855872,1152921504606846976,9223372036854775808,73786976294838206464,590295810358705651712,4722366482869645213696]


  """
  @doc offset: 0,
       sequence: "Powers of 8: a(n) = 8^n.",
       references: [{:oeis, :a001018, "https://oeis.org/A001018"}]
  def create_sequence_a001018(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001018/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001018(idx) do
    Math.pow(8, idx)
  end

  @doc """
  OEIS Sequence `A001019` - Powers of 9: a(n) = 9^n.

  From [OEIS A001019](https://oeis.org/A001019):

  > Powers of 9: a(n) = 9^n.
  > (Formerly M4653 N1992)

  **Sequence IDs**: `:a001019`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001019) |> Sequence.take!(20)
      [1,9,81,729,6561,59049,531441,4782969,43046721,387420489,3486784401,31381059609,282429536481,2541865828329,22876792454961,205891132094649,1853020188851841,16677181699666569,150094635296999121,1350851717672992089]


  """
  @doc offset: 0,
       sequence: "Powers of 9: a(n) = 9^n.",
       references: [{:oeis, :a001019, "https://oeis.org/A001019"}]
  def create_sequence_a001019(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001019/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001019(idx) do
    Math.pow(9, idx)
  end

  @doc """
  OEIS Sequence `A001020` - Powers of 11: a(n) = 11^n.

  From [OEIS A001020](https://oeis.org/A001020):

  > Powers of 11: a(n) = 11^n.
  > (Formerly M4807 N2054)

  **Sequence IDs**: `:a001020`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001020) |> Sequence.take!(20)
      [1,11,121,1331,14641,161051,1771561,19487171,214358881,2357947691,25937424601,285311670611,3138428376721,34522712143931,379749833583241,4177248169415651,45949729863572161,505447028499293771,5559917313492231481,61159090448414546291]


  """
  @doc offset: 0,
       sequence: "Powers of 11: a(n) = 11^n.",
       references: [{:oeis, :a001020, "https://oeis.org/A001020"}]
  def create_sequence_a001020(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001020/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001020(idx) do
    Math.pow(11, idx)
  end

  @doc """
  OEIS Sequence `A001021` - Powers of 12.

  From [OEIS A001021](https://oeis.org/A001021):

  > Powers of 12.
  > (Formerly M4869 N2084)

  **Sequence IDs**: `:a001021`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001021) |> Sequence.take!(18)
      [1,12,144,1728,20736,248832,2985984,35831808,429981696,5159780352,61917364224,743008370688,8916100448256,106993205379072,1283918464548864,15407021574586368,184884258895036416,2218611106740436992]


  """
  @doc offset: 0,
       sequence: "Powers of 12.",
       references: [{:oeis, :a001021, "https://oeis.org/A001021"}]
  def create_sequence_a001021(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001021/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001021(idx) do
    Math.pow(12, idx)
  end

  @doc """
  OEIS Sequence `A001022` - Powers of 13.

  From [OEIS A001022](https://oeis.org/A001022):

  > Powers of 13.
  > (Formerly M4914 N2107)

  **Sequence IDs**: `:a001022`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001022) |> Sequence.take!(21)
      [1,13,169,2197,28561,371293,4826809,62748517,815730721,10604499373,137858491849,1792160394037,23298085122481,302875106592253,3937376385699289,51185893014090757,665416609183179841,8650415919381337933,112455406951957393129,1461920290375446110677,19004963774880799438801]


  """
  @doc offset: 0,
       sequence: "Powers of 13.",
       references: [{:oeis, :a001022, "https://oeis.org/A001022"}]
  def create_sequence_a001022(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001022/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001022(idx) do
    Math.pow(13, idx)
  end

  @doc """
  OEIS Sequence `A001023` - Powers of 14.

  From [OEIS A001023](https://oeis.org/A001023):

  > Powers of 14.
  > (Formerly M4949 N2120)

  **Sequence IDs**: `:a001023`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001023) |> Sequence.take!(21)
      [1,14,196,2744,38416,537824,7529536,105413504,1475789056,20661046784,289254654976,4049565169664,56693912375296,793714773254144,11112006825558016,155568095557812224,2177953337809371136,30491346729331195904,426878854210636742656,5976303958948914397184,83668255425284801560576]


  """
  @doc offset: 0,
       sequence: "Powers of 14.",
       references: [{:oeis, :a001023, "https://oeis.org/A001023"}]
  def create_sequence_a001023(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001023/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001023(idx) do
    Math.pow(14, idx)
  end

  @doc """
  OEIS Sequence `A001024` - Powers of 15.

  From [OEIS A001024](https://oeis.org/A001024):

  > Powers of 15.
  > (Formerly M4990 N2147)

  **Sequence IDs**: `:a001024`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001024) |> Sequence.take!(21)
      [1,15,225,3375,50625,759375,11390625,170859375,2562890625,38443359375,576650390625,8649755859375,129746337890625,1946195068359375,29192926025390625,437893890380859375,6568408355712890625,98526125335693359375,1477891880035400390625,22168378200531005859375,332525673007965087890625]


  """
  @doc offset: 0,
       sequence: "Powers of 15.",
       references: [{:oeis, :a001024, "https://oeis.org/A001024"}]
  def create_sequence_a001024(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001024/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001024(idx) do
    Math.pow(15, idx)
  end

  @doc """
  OEIS Sequence `A001025` - Powers of 16: a(n) = 16^n.

  From [OEIS A001025](https://oeis.org/A001025):

  > Powers of 16: a(n) = 16^n.
  > (Formerly M5021 N2164)

  **Sequence IDs**: `:a001025`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001025) |> Sequence.take!(21)
      [1,16,256,4096,65536,1048576,16777216,268435456,4294967296,68719476736,1099511627776,17592186044416,281474976710656,4503599627370496,72057594037927936,1152921504606846976,18446744073709551616,295147905179352825856,4722366482869645213696,75557863725914323419136,1208925819614629174706176]


  """
  @doc offset: 0,
       sequence: "Powers of 16: a(n) = 16^n.",
       references: [{:oeis, :a001025, "https://oeis.org/A001025"}]
  def create_sequence_a001025(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001025/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001025(idx) do
    Math.pow(16, idx)
  end

  @doc """
  OEIS Sequence `A001026` - Powers of 17.

  From [OEIS A001026](https://oeis.org/A001026):

  > Powers of 17.
  > (Formerly M5048 N2182)

  **Sequence IDs**: `:a001026`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001026) |> Sequence.take!(21)
      [1,17,289,4913,83521,1419857,24137569,410338673,6975757441,118587876497,2015993900449,34271896307633,582622237229761,9904578032905937,168377826559400929,2862423051509815793,48661191875666868481,827240261886336764177,14063084452067724991009,239072435685151324847153,4064231406647572522401601]


  """
  @doc offset: 0,
       sequence: "Powers of 17.",
       references: [{:oeis, :a001026, "https://oeis.org/A001026"}]
  def create_sequence_a001026(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001026/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001026(idx) do
    Math.pow(17, idx)
  end

  @doc """
  OEIS Sequence `A001027` - Powers of 18.

  From [OEIS A001027](https://oeis.org/A001027):

  > Powers of 18.
  > (Formerly M5062 N2192)

  **Sequence IDs**: `:a001027`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001027) |> Sequence.take!(21)
      [1,18,324,5832,104976,1889568,34012224,612220032,11019960576,198359290368,3570467226624,64268410079232,1156831381426176,20822964865671168,374813367582081024,6746640616477458432,121439531096594251776,2185911559738696531968,39346408075296537575424,708235345355337676357632,12748236216396078174437376]


  """
  @doc offset: 0,
       sequence: "Powers of 18.",
       references: [{:oeis, :a001027, "https://oeis.org/A001027"}]
  def create_sequence_a001027(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001027/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001027(idx) do
    Math.pow(18, idx)
  end

  @doc """
  OEIS Sequence `A001029` - Powers of 19.

  From [OEIS A001029](https://oeis.org/A001029):

  > Powers of 19.
  > (Formerly M5079 N2198)

  **Sequence IDs**: `:a001029`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a001029) |> Sequence.take!(21)
      [1,19,361,6859,130321,2476099,47045881,893871739,16983563041,322687697779,6131066257801,116490258898219,2213314919066161,42052983462257059,799006685782884121,15181127029874798299,288441413567621167681,5480386857784802185939,104127350297911241532841,1978419655660313589123979,37589973457545958193355601]


  """
  @doc offset: 0,
       sequence: "Powers of 19.",
       references: [{:oeis, :a001029, "https://oeis.org/A001029"}]
  def create_sequence_a001029(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a001029/1)
  end

  @doc false
  @doc offset: 0
  def seq_a001029(idx) do
    Math.pow(19, idx)
  end

  @doc """
  OEIS Sequence `A009964` - Powers of 20.

  From [OEIS A009964](https://oeis.org/A009964):

  > Powers of 20.
  > (Formerly )

  **Sequence IDs**: `:a009964`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009964) |> Sequence.take!(16)
      [1,20,400,8000,160000,3200000,64000000,1280000000,25600000000,512000000000,10240000000000,204800000000000,4096000000000000,81920000000000000,1638400000000000000,32768000000000000000]


  """
  @doc offset: 0,
       sequence: "Powers of 20.",
       references: [{:oeis, :a009964, "https://oeis.org/A009964"}]
  def create_sequence_a009964(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009964/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009964(idx) do
    Math.pow(20, idx)
  end

  @doc """
  OEIS Sequence `A009965` - Powers of 21.

  From [OEIS A009965](https://oeis.org/A009965):

  > Powers of 21.
  > (Formerly )

  **Sequence IDs**: `:a009965`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009965) |> Sequence.take!(21)
      [1,21,441,9261,194481,4084101,85766121,1801088541,37822859361,794280046581,16679880978201,350277500542221,7355827511386641,154472377739119461,3243919932521508681,68122318582951682301,1430568690241985328321,30041942495081691894741,630880792396715529789561,13248496640331026125580781,278218429446951548637196401]


  """
  @doc offset: 0,
       sequence: "Powers of 21.",
       references: [{:oeis, :a009965, "https://oeis.org/A009965"}]
  def create_sequence_a009965(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009965/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009965(idx) do
    Math.pow(21, idx)
  end

  @doc """
  OEIS Sequence `A009966` - Powers of 22.

  From [OEIS A009966](https://oeis.org/A009966):

  > Powers of 22.
  > (Formerly )

  **Sequence IDs**: `:a009966`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009966) |> Sequence.take!(21)
      [1,22,484,10648,234256,5153632,113379904,2494357888,54875873536,1207269217792,26559922791424,584318301411328,12855002631049216,282810057883082752,6221821273427820544,136880068015412051968,3011361496339065143296,66249952919459433152512,1457498964228107529355264,32064977213018365645815808,705429498686404044207947776]


  """
  @doc offset: 0,
       sequence: "Powers of 22.",
       references: [{:oeis, :a009966, "https://oeis.org/A009966"}]
  def create_sequence_a009966(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009966/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009966(idx) do
    Math.pow(22, idx)
  end

  @doc """
  OEIS Sequence `A009967` - Powers of 23.

  From [OEIS A009967](https://oeis.org/A009967):

  > Powers of 23.
  > (Formerly )

  **Sequence IDs**: `:a009967`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009967) |> Sequence.take!(21)
      [1,23,529,12167,279841,6436343,148035889,3404825447,78310985281,1801152661463,41426511213649,952809757913927,21914624432020321,504036361936467383,11592836324538749809,266635235464391245607,6132610415680998648961,141050039560662968926103,3244150909895248285300369,74615470927590710561908487,1716155831334586342923895201]


  """
  @doc offset: 0,
       sequence: "Powers of 23.",
       references: [{:oeis, :a009967, "https://oeis.org/A009967"}]
  def create_sequence_a009967(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009967/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009967(idx) do
    Math.pow(23, idx)
  end

  @doc """
  OEIS Sequence `A009968` - Powers of 24: a(n) = 24^n.

  From [OEIS A009968](https://oeis.org/A009968):

  > Powers of 24: a(n) = 24^n.
  > (Formerly )

  **Sequence IDs**: `:a009968`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009968) |> Sequence.take!(21)
      [1,24,576,13824,331776,7962624,191102976,4586471424,110075314176,2641807540224,63403380965376,1521681143169024,36520347436056576,876488338465357824,21035720123168587776,504857282956046106624,12116574790945106558976,290797794982682557415424,6979147079584381377970176,167499529910025153071284224,4019988717840603673710821376]


  """
  @doc offset: 0,
       sequence: "Powers of 24: a(n) = 24^n.",
       references: [{:oeis, :a009968, "https://oeis.org/A009968"}]
  def create_sequence_a009968(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009968/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009968(idx) do
    Math.pow(24, idx)
  end

  @doc """
  OEIS Sequence `A009969` - Powers of 25.

  From [OEIS A009969](https://oeis.org/A009969):

  > Powers of 25.
  > (Formerly )

  **Sequence IDs**: `:a009969`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009969) |> Sequence.take!(21)
      [1,25,625,15625,390625,9765625,244140625,6103515625,152587890625,3814697265625,95367431640625,2384185791015625,59604644775390625,1490116119384765625,37252902984619140625,931322574615478515625,23283064365386962890625,582076609134674072265625,14551915228366851806640625,363797880709171295166015625,9094947017729282379150390625]


  """
  @doc offset: 0,
       sequence: "Powers of 25.",
       references: [{:oeis, :a009969, "https://oeis.org/A009969"}]
  def create_sequence_a009969(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009969/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009969(idx) do
    Math.pow(25, idx)
  end

  @doc """
  OEIS Sequence `A009970` - Powers of 26.

  From [OEIS A009970](https://oeis.org/A009970):

  > Powers of 26.
  > (Formerly )

  **Sequence IDs**: `:a009970`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009970) |> Sequence.take!(21)
      [1,26,676,17576,456976,11881376,308915776,8031810176,208827064576,5429503678976,141167095653376,3670344486987776,95428956661682176,2481152873203736576,64509974703297150976,1677259342285725925376,43608742899428874059776,1133827315385150725554176,29479510200013918864408576,766467265200361890474622976,19928148895209409152340197376]


  """
  @doc offset: 0,
       sequence: "Powers of 26.",
       references: [{:oeis, :a009970, "https://oeis.org/A009970"}]
  def create_sequence_a009970(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009970/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009970(idx) do
    Math.pow(26, idx)
  end

  @doc """
  OEIS Sequence `A009971` - Powers of 27.

  From [OEIS A009971](https://oeis.org/A009971):

  > Powers of 27.
  > (Formerly )

  **Sequence IDs**: `:a009971`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009971) |> Sequence.take!(16)
      [1,27,729,19683,531441,14348907,387420489,10460353203,282429536481,7625597484987,205891132094649,5559060566555523,150094635296999121,4052555153018976267,109418989131512359209,2954312706550833698643]


  """
  @doc offset: 0,
       sequence: "Powers of 27.",
       references: [{:oeis, :a009971, "https://oeis.org/A009971"}]
  def create_sequence_a009971(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009971/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009971(idx) do
    Math.pow(27, idx)
  end

  @doc """
  OEIS Sequence `A009972` - Powers of 28.

  From [OEIS A009972](https://oeis.org/A009972):

  > Powers of 28.
  > (Formerly )

  **Sequence IDs**: `:a009972`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009972) |> Sequence.take!(16)
      [1,28,784,21952,614656,17210368,481890304,13492928512,377801998336,10578455953408,296196766695424,8293509467471872,232218265089212416,6502111422497947648,182059119829942534144,5097655355238390956032]


  """
  @doc offset: 0,
       sequence: "Powers of 28.",
       references: [{:oeis, :a009972, "https://oeis.org/A009972"}]
  def create_sequence_a009972(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009972/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009972(idx) do
    Math.pow(28, idx)
  end

  @doc """
  OEIS Sequence `A009973` - Powers of 29.

  From [OEIS A009973](https://oeis.org/A009973):

  > Powers of 29.
  > (Formerly )

  **Sequence IDs**: `:a009973`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009973) |> Sequence.take!(16)
      [1,29,841,24389,707281,20511149,594823321,17249876309,500246412961,14507145975869,420707233300201,12200509765705829,353814783205469041,10260628712958602189,297558232675799463481,8629188747598184440949]


  """
  @doc offset: 0,
       sequence: "Powers of 29.",
       references: [{:oeis, :a009973, "https://oeis.org/A009973"}]
  def create_sequence_a009973(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009973/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009973(idx) do
    Math.pow(29, idx)
  end

  @doc """
  OEIS Sequence `A009974` - Powers of 30.

  From [OEIS A009974](https://oeis.org/A009974):

  > Powers of 30.
  > (Formerly )

  **Sequence IDs**: `:a009974`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009974) |> Sequence.take!(16)
      [1,30,900,27000,810000,24300000,729000000,21870000000,656100000000,19683000000000,590490000000000,17714700000000000,531441000000000000,15943230000000000000,478296900000000000000,14348907000000000000000]


  """
  @doc offset: 0,
       sequence: "Powers of 30.",
       references: [{:oeis, :a009974, "https://oeis.org/A009974"}]
  def create_sequence_a009974(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009974/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009974(idx) do
    Math.pow(30, idx)
  end

  @doc """
  OEIS Sequence `A009975` - Powers of 31.

  From [OEIS A009975](https://oeis.org/A009975):

  > Powers of 31.
  > (Formerly )

  **Sequence IDs**: `:a009975`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009975) |> Sequence.take!(16)
      [1,31,961,29791,923521,28629151,887503681,27512614111,852891037441,26439622160671,819628286980801,25408476896404831,787662783788549761,24417546297445042591,756943935220796320321,23465261991844685929951]


  """
  @doc offset: 0,
       sequence: "Powers of 31.",
       references: [{:oeis, :a009975, "https://oeis.org/A009975"}]
  def create_sequence_a009975(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009975/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009975(idx) do
    Math.pow(31, idx)
  end

  @doc """
  OEIS Sequence `A009976` - Powers of 32.

  From [OEIS A009976](https://oeis.org/A009976):

  > Powers of 32.
  > (Formerly )

  **Sequence IDs**: `:a009976`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009976) |> Sequence.take!(15)
      [1,32,1024,32768,1048576,33554432,1073741824,34359738368,1099511627776,35184372088832,1125899906842624,36028797018963968,1152921504606846976,36893488147419103232,1180591620717411303424]


  """
  @doc offset: 0,
       sequence: "Powers of 32.",
       references: [{:oeis, :a009976, "https://oeis.org/A009976"}]
  def create_sequence_a009976(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009976/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009976(idx) do
    Math.pow(32, idx)
  end

  @doc """
  OEIS Sequence `A009977` - Powers of 33.

  From [OEIS A009977](https://oeis.org/A009977):

  > Powers of 33.
  > (Formerly )

  **Sequence IDs**: `:a009977`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009977) |> Sequence.take!(15)
      [1,33,1089,35937,1185921,39135393,1291467969,42618442977,1406408618241,46411484401953,1531578985264449,50542106513726817,1667889514952984961,55040353993448503713,1816331681783800622529]


  """
  @doc offset: 0,
       sequence: "Powers of 33.",
       references: [{:oeis, :a009977, "https://oeis.org/A009977"}]
  def create_sequence_a009977(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009977/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009977(idx) do
    Math.pow(33, idx)
  end

  @doc """
  OEIS Sequence `A009978` - Powers of 34.

  From [OEIS A009978](https://oeis.org/A009978):

  > Powers of 34.
  > (Formerly )

  **Sequence IDs**: `:a009978`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009978) |> Sequence.take!(15)
      [1,34,1156,39304,1336336,45435424,1544804416,52523350144,1785793904896,60716992766464,2064377754059776,70188843638032384,2386420683693101056,81138303245565435904,2758702310349224820736]


  """
  @doc offset: 0,
       sequence: "Powers of 34.",
       references: [{:oeis, :a009978, "https://oeis.org/A009978"}]
  def create_sequence_a009978(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009978/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009978(idx) do
    Math.pow(34, idx)
  end

  @doc """
  OEIS Sequence `A009979` - Powers of 35.

  From [OEIS A009979](https://oeis.org/A009979):

  > Powers of 35.
  > (Formerly )

  **Sequence IDs**: `:a009979`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009979) |> Sequence.take!(15)
      [1,35,1225,42875,1500625,52521875,1838265625,64339296875,2251875390625,78815638671875,2758547353515625,96549157373046875,3379220508056640625,118272717781982421875,4139545122369384765625]


  """
  @doc offset: 0,
       sequence: "Powers of 35.",
       references: [{:oeis, :a009979, "https://oeis.org/A009979"}]
  def create_sequence_a009979(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009979/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009979(idx) do
    Math.pow(35, idx)
  end

  @doc """
  OEIS Sequence `A009980` - Powers of 36.

  From [OEIS A009980](https://oeis.org/A009980):

  > Powers of 36.
  > (Formerly )

  **Sequence IDs**: `:a009980`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009980) |> Sequence.take!(15)
      [1,36,1296,46656,1679616,60466176,2176782336,78364164096,2821109907456,101559956668416,3656158440062976,131621703842267136,4738381338321616896,170581728179578208256,6140942214464815497216]


  """
  @doc offset: 0,
       sequence: "Powers of 36.",
       references: [{:oeis, :a009980, "https://oeis.org/A009980"}]
  def create_sequence_a009980(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009980/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009980(idx) do
    Math.pow(36, idx)
  end

  @doc """
  OEIS Sequence `A009981` - Powers of 37.

  From [OEIS A009981](https://oeis.org/A009981):

  > Powers of 37.
  > (Formerly )

  **Sequence IDs**: `:a009981`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009981) |> Sequence.take!(15)
      [1,37,1369,50653,1874161,69343957,2565726409,94931877133,3512479453921,129961739795077,4808584372417849,177917621779460413,6582952005840035281,243569224216081305397,9012061295995008299689]


  """
  @doc offset: 0,
       sequence: "Powers of 37.",
       references: [{:oeis, :a009981, "https://oeis.org/A009981"}]
  def create_sequence_a009981(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009981/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009981(idx) do
    Math.pow(37, idx)
  end

  @doc """
  OEIS Sequence `A009982` - Powers of 38.

  From [OEIS A009982](https://oeis.org/A009982):

  > Powers of 38.
  > (Formerly )

  **Sequence IDs**: `:a009982`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009982) |> Sequence.take!(16)
      [1,38,1444,54872,2085136,79235168,3010936384,114415582592,4347792138496,165216101262848,6278211847988224,238572050223552512,9065737908494995456,344498040522809827328,13090925539866773438464,497455170514937390661632]


  """
  @doc offset: 0,
       sequence: "Powers of 38.",
       references: [{:oeis, :a009982, "https://oeis.org/A009982"}]
  def create_sequence_a009982(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009982/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009982(idx) do
    Math.pow(38, idx)
  end

  @doc """
  OEIS Sequence `A009983` - Powers of 39.

  From [OEIS A009983](https://oeis.org/A009983):

  > Powers of 39.
  > (Formerly )

  **Sequence IDs**: `:a009983`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009983) |> Sequence.take!(15)
      [1,39,1521,59319,2313441,90224199,3518743761,137231006679,5352009260481,208728361158759,8140406085191601,317475837322472439,12381557655576425121,482880748567480579719,18832349194131742609041]


  """
  @doc offset: 0,
       sequence: "Powers of 39.",
       references: [{:oeis, :a009983, "https://oeis.org/A009983"}]
  def create_sequence_a009983(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009983/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009983(idx) do
    Math.pow(39, idx)
  end

  @doc """
  OEIS Sequence `A009984` - Powers of 40.

  From [OEIS A009984](https://oeis.org/A009984):

  > Powers of 40.
  > (Formerly )

  **Sequence IDs**: `:a009984`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009984) |> Sequence.take!(15)
      [1,40,1600,64000,2560000,102400000,4096000000,163840000000,6553600000000,262144000000000,10485760000000000,419430400000000000,16777216000000000000,671088640000000000000,26843545600000000000000]


  """
  @doc offset: 0,
       sequence: "Powers of 40.",
       references: [{:oeis, :a009984, "https://oeis.org/A009984"}]
  def create_sequence_a009984(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009984/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009984(idx) do
    Math.pow(40, idx)
  end

  @doc """
  OEIS Sequence `A009985` - Powers of 41.

  From [OEIS A009985](https://oeis.org/A009985):

  > Powers of 41.
  > (Formerly )

  **Sequence IDs**: `:a009985`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009985) |> Sequence.take!(15)
      [1,41,1681,68921,2825761,115856201,4750104241,194754273881,7984925229121,327381934393961,13422659310152401,550329031716248441,22563490300366186081,925103102315013629321,37929227194915558802161]


  """
  @doc offset: 0,
       sequence: "Powers of 41.",
       references: [{:oeis, :a009985, "https://oeis.org/A009985"}]
  def create_sequence_a009985(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009985/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009985(idx) do
    Math.pow(41, idx)
  end

  @doc """
  OEIS Sequence `A009986` - Powers of 42.

  From [OEIS A009986](https://oeis.org/A009986):

  > Powers of 42.
  > (Formerly )

  **Sequence IDs**: `:a009986`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009986) |> Sequence.take!(15)
      [1,42,1764,74088,3111696,130691232,5489031744,230539333248,9682651996416,406671383849472,17080198121677824,717368321110468608,30129469486639681536,1265437718438866624512,53148384174432398229504]


  """
  @doc offset: 0,
       sequence: "Powers of 42.",
       references: [{:oeis, :a009986, "https://oeis.org/A009986"}]
  def create_sequence_a009986(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009986/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009986(idx) do
    Math.pow(42, idx)
  end

  @doc """
  OEIS Sequence `A009987` - Powers of 43.

  From [OEIS A009987](https://oeis.org/A009987):

  > Powers of 43.
  > (Formerly )

  **Sequence IDs**: `:a009987`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009987) |> Sequence.take!(15)
      [1,43,1849,79507,3418801,147008443,6321363049,271818611107,11688200277601,502592611936843,21611482313284249,929293739471222707,39959630797262576401,1718264124282290785243,73885357344138503765449]


  """
  @doc offset: 0,
       sequence: "Powers of 43.",
       references: [{:oeis, :a009987, "https://oeis.org/A009987"}]
  def create_sequence_a009987(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009987/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009987(idx) do
    Math.pow(43, idx)
  end

  @doc """
  OEIS Sequence `A009988` - Powers of 44.

  From [OEIS A009988](https://oeis.org/A009988):

  > Powers of 44.
  > (Formerly )

  **Sequence IDs**: `:a009988`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009988) |> Sequence.take!(15)
      [1,44,1936,85184,3748096,164916224,7256313856,319277809664,14048223625216,618121839509504,27197360938418176,1196683881290399744,52654090776777588736,2316779994178213904384,101938319743841411792896]


  """
  @doc offset: 0,
       sequence: "Powers of 44.",
       references: [{:oeis, :a009988, "https://oeis.org/A009988"}]
  def create_sequence_a009988(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009988/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009988(idx) do
    Math.pow(44, idx)
  end

  @doc """
  OEIS Sequence `A009989` - Powers of 45.

  From [OEIS A009989](https://oeis.org/A009989):

  > Powers of 45.
  > (Formerly )

  **Sequence IDs**: `:a009989`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009989) |> Sequence.take!(15)
      [1,45,2025,91125,4100625,184528125,8303765625,373669453125,16815125390625,756680642578125,34050628916015625,1532278301220703125,68952523554931640625,3102863559971923828125,139628860198736572265625]


  """
  @doc offset: 0,
       sequence: "Powers of 45.",
       references: [{:oeis, :a009989, "https://oeis.org/A009989"}]
  def create_sequence_a009989(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009989/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009989(idx) do
    Math.pow(45, idx)
  end

  @doc """
  OEIS Sequence `A009990` - Powers of 46.

  From [OEIS A009990](https://oeis.org/A009990):

  > Powers of 46.
  > (Formerly )

  **Sequence IDs**: `:a009990`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009990) |> Sequence.take!(15)
      [1,46,2116,97336,4477456,205962976,9474296896,435817657216,20047612231936,922190162669056,42420747482776576,1951354384207722496,89762301673555234816,4129065876983540801536,189937030341242876870656]


  """
  @doc offset: 0,
       sequence: "Powers of 46.",
       references: [{:oeis, :a009990, "https://oeis.org/A009990"}]
  def create_sequence_a009990(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009990/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009990(idx) do
    Math.pow(46, idx)
  end

  @doc """
  OEIS Sequence `A009991` - Powers of 47.

  From [OEIS A009991](https://oeis.org/A009991):

  > Powers of 47.
  > (Formerly )

  **Sequence IDs**: `:a009991`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009991) |> Sequence.take!(14)
      [1,47,2209,103823,4879681,229345007,10779215329,506623120463,23811286661761,1119130473102767,52599132235830049,2472159215084012303,116191483108948578241,5460999706120583177327]


  """
  @doc offset: 0,
       sequence: "Powers of 47.",
       references: [{:oeis, :a009991, "https://oeis.org/A009991"}]
  def create_sequence_a009991(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009991/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009991(idx) do
    Math.pow(47, idx)
  end

  @doc """
  OEIS Sequence `A009992` - Powers of 48: a(n) = 48^n.

  From [OEIS A009992](https://oeis.org/A009992):

  > Powers of 48: a(n) = 48^n.
  > (Formerly )

  **Sequence IDs**: `:a009992`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a009992) |> Sequence.take!(16)
      [1,48,2304,110592,5308416,254803968,12230590464,587068342272,28179280429056,1352605460594688,64925062108545024,3116402981210161152,149587343098087735296,7180192468708211294208,344649238497994142121984,16543163447903718821855232]


  """
  @doc offset: 0,
       sequence: "Powers of 48: a(n) = 48^n.",
       references: [{:oeis, :a009992, "https://oeis.org/A009992"}]
  def create_sequence_a009992(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a009992/1)
  end

  @doc false
  @doc offset: 0
  def seq_a009992(idx) do
    Math.pow(48, idx)
  end

  @doc """
  OEIS Sequence `A011557` - Powers of 10: a(n) = 10^n.

  From [OEIS A011557](https://oeis.org/A011557):

  > Powers of 10: a(n) = 10^n.
  > (Formerly )

  **Sequence IDs**: `:a011557`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a011557) |> Sequence.take!(19)
      [1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000,100000000000,1000000000000,10000000000000,100000000000000,1000000000000000,10000000000000000,100000000000000000,1000000000000000000]


  """
  @doc offset: 0,
       sequence: "Powers of 10: a(n) = 10^n.",
       references: [{:oeis, :a011557, "https://oeis.org/A011557"}]
  def create_sequence_a011557(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a011557/1)
  end

  @doc false
  @doc offset: 0
  def seq_a011557(idx) do
    Math.pow(10, idx)
  end

  @doc """
  OEIS Sequence `A087752` - Powers of 49.

  From [OEIS A087752](https://oeis.org/A087752):

  > Powers of 49.
  > (Formerly )

  **Sequence IDs**: `:a087752`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a087752) |> Sequence.take!(15)
      [1,49,2401,117649,5764801,282475249,13841287201,678223072849,33232930569601,1628413597910449,79792266297612001,3909821048582988049,191581231380566414401,9387480337647754305649,459986536544739960976801]


  """
  @doc offset: 0,
       sequence: "Powers of 49.",
       references: [{:oeis, :a087752, "https://oeis.org/A087752"}]
  def create_sequence_a087752(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a087752/1)
  end

  @doc false
  @doc offset: 0
  def seq_a087752(idx) do
    Math.pow(49, idx)
  end

  @doc """
  OEIS Sequence `A159991` - Powers of 60.

  From [OEIS A159991](https://oeis.org/A159991):

  > Powers of 60.
  > (Formerly )

  **Sequence IDs**: `:a159991`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a159991) |> Sequence.take!(14)
      [1,60,3600,216000,12960000,777600000,46656000000,2799360000000,167961600000000,10077696000000000,604661760000000000,36279705600000000000,2176782336000000000000,130606940160000000000000]


  """
  @doc offset: 0,
       sequence: "Powers of 60.",
       references: [{:oeis, :a159991, "https://oeis.org/A159991"}]
  def create_sequence_a159991(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a159991/1)
  end

  @doc false
  @doc offset: 0
  def seq_a159991(idx) do
    Math.pow(60, idx)
  end

  @doc """
  OEIS Sequence `A057716` - The non-powers of 2.

  From [OEIS A057716](https://oeis.org/A057716):

  > The non-powers of 2.

  **Sequence IDs**: `:a057716`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Powers, :a057716) |> Sequence.take!(68)
      [0,3,5,6,7,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70,71,72,73,74]


  """
  @doc offset: 0,
       sequence: "The non-powers of 2.",
       references: [{:oeis, :a057716, "https://oeis.org/A057716"}]
  def create_sequence_a057716(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Powers.seq_a057716/2)
  end

  @doc false
  @doc offset: 0
  def seq_a057716(idx, last) do
    case idx do
      0 -> 0
      _ -> Math.next_number(&Predicates.is_polite_number?/1, last)
    end
  end
end
