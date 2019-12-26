defmodule Chunky.Sequence.OEIS.Core do
  @moduledoc """
  OEIS [Core](http://oeis.org/search?q=keyword%3acore&sort=number) Sequences.

  ## Available Sequences

   - [A000005 - Divisors of N](https://oeis.org/A000005) - `:a000005` - `create_sequence_a000005/1`
   - [A000009 - Number of partitions of n into distinct parts](http://oeis.org/A000009) - `:a000009` - `create_sequence_a000009/1`
   - [A000041 - Partition Numbers](https://oeis.org/A000041) - `:a000041` - `create_sequence_a000041/1`
   - [A000079 - Powers of 2](https://oeis.org/A000079) - `:a000079` - `create_sequence_a000079/1`
   - [A000203 - Sum of Divisors](https://oeis.org/A000203) - `:a000203` - `create_sequence_a000203/1`
   - [A000396 - Perfect Numbers](https://oeis.org/A000396) - `:a000396` - `create_sequence_a000396/1`
   - [A000593 - Sum of Odd Divisors of N](https://oeis.org/A000593) - `:a000593` - `create_sequence_a000593/1`
   - [A001065 - Sum of proper divisors (Aliquot parts) of N.](https://oeis.org/A001065) - `:a001065` - `create_sequence_a001065/1`
   - [A001157 - Sum of squares of divisors of N](https://oeis.org/A001157) - `:a001157` - `create_sequence_a001157/1`
   - [A005100 - Deficient Numbers](https://oeis.org/A005100) - `:a005100` - `create_sequence_a005100/1`
   - [A005101 - Abundant Numbers](https://oeis.org/A005101) - `:a005101` - `create_sequence_a005101/1`
  
  """
  import Chunky.Sequence, only: [sequence_for_list: 1, sequence_for_function: 1]
  alias Chunky.Math

  require Integer

  # raw data for the A000041 - Partitions of N
  @data_a000041 [
    1,
    1,
    2,
    3,
    5,
    7,
    11,
    15,
    22,
    30,
    42,
    56,
    77,
    101,
    135,
    176,
    231,
    297,
    385,
    490,
    627,
    792,
    1002,
    1255,
    1575,
    1958,
    2436,
    3010,
    3718,
    4565,
    5604,
    6842,
    8349,
    10143,
    12310,
    14883,
    17977,
    21637,
    26015,
    31185,
    37338,
    44583,
    53174,
    63261,
    75175,
    89134,
    105_558,
    124_754,
    147_273,
    173_525,
    204_226,
    239_943,
    281_589,
    329_931,
    386_155,
    451_276,
    526_823,
    614_154,
    715_220,
    831_820,
    966_467,
    1_121_505,
    1_300_156,
    1_505_499,
    1_741_630,
    2_012_558,
    2_323_520,
    2_679_689,
    3_087_735,
    3_554_345,
    4_087_968,
    4_697_205,
    5_392_783,
    6_185_689,
    7_089_500,
    8_118_264,
    9_289_091,
    10_619_863,
    12_132_164,
    13_848_650,
    15_796_476,
    18_004_327,
    20_506_255,
    23_338_469,
    26_543_660,
    30_167_357,
    34_262_962,
    38_887_673,
    44_108_109,
    49_995_925,
    56_634_173,
    64_112_359,
    72_533_807,
    82_010_177,
    92_669_720,
    104_651_419,
    118_114_304,
    133_230_930,
    150_198_136,
    169_229_875,
    190_569_292,
    214_481_126,
    241_265_379,
    271_248_950,
    304_801_365,
    342_325_709,
    384_276_336,
    431_149_389,
    483_502_844,
    541_946_240,
    607_163_746,
    679_903_203,
    761_002_156,
    851_376_628,
    952_050_665,
    1_064_144_451,
    1_188_908_248,
    1_327_710_076,
    1_482_074_143,
    1_653_668_665,
    1_844_349_560,
    2_056_148_051,
    2_291_320_912,
    2_552_338_241,
    2_841_940_500,
    3_163_127_352,
    3_519_222_692,
    3_913_864_295,
    4_351_078_600,
    4_835_271_870,
    5_371_315_400,
    5_964_539_504,
    6_620_830_889,
    7_346_629_512,
    8_149_040_695,
    9_035_836_076,
    10_015_581_680,
    11_097_645_016,
    12_292_341_831,
    13_610_949_895,
    15_065_878_135,
    16_670_689_208,
    18_440_293_320,
    20_390_982_757,
    22_540_654_445,
    24_908_858_009,
    27_517_052_599,
    30_388_671_978,
    33_549_419_497,
    37_027_355_200,
    40_853_235_313,
    45_060_624_582,
    49_686_288_421,
    54_770_336_324,
    60_356_673_280,
    66_493_182_097,
    73_232_243_759,
    80_630_964_769,
    88_751_778_802,
    97_662_728_555,
    107_438_159_466,
    118_159_068_427,
    129_913_904_637,
    142_798_995_930,
    156_919_475_295,
    172_389_800_255,
    189_334_822_579,
    207_890_420_102,
    228_204_732_751,
    250_438_925_115,
    274_768_617_130,
    301_384_802_048,
    330_495_499_613,
    362_326_859_895,
    397_125_074_750,
    435_157_697_830,
    476_715_857_290,
    522_115_831_195,
    571_701_605_655,
    625_846_753_120,
    684_957_390_936,
    749_474_411_781,
    819_876_908_323,
    896_684_817_527,
    980_462_880_430,
    1_071_823_774_337,
    1_171_432_692_373,
    1_280_011_042_268,
    1_398_341_745_571,
    1_527_273_599_625,
    1_667_727_404_093,
    1_820_701_100_652,
    1_987_276_856_363,
    2_168_627_105_469,
    2_366_022_741_845,
    2_580_840_212_973,
    2_814_570_987_591,
    3_068_829_878_530,
    3_345_365_983_698,
    3_646_072_432_125,
    3_972_999_029_388,
    4_328_363_658_647,
    4_714_566_886_083,
    5_134_205_287_973,
    5_590_088_317_495,
    6_085_253_859_260,
    6_622_987_708_040,
    7_206_841_706_490,
    7_840_656_226_137,
    8_528_581_302_375,
    9_275_102_575_355,
    10_085_065_885_767,
    10_963_707_205_259,
    11_916_681_236_278,
    12_950_095_925_895,
    14_070_545_699_287,
    15_285_151_248_481,
    16_601_598_107_914,
    18_028_182_516_671,
    19_573_856_161_145,
    21_248_279_009_367,
    23_061_871_173_849,
    25_025_873_760_111,
    27_152_408_925_615,
    29_454_549_941_750,
    31_946_390_696_157,
    34_643_126_322_519,
    37_561_133_582_570,
    40_718_063_627_362,
    44_132_934_884_255,
    47_826_239_745_920,
    51_820_051_838_712,
    56_138_148_670_947,
    60_806_135_438_329,
    65_851_585_970_275,
    71_304_185_514_919,
    77_195_892_663_512,
    83_561_103_925_871,
    90_436_839_668_817,
    97_862_933_703_585,
    105_882_246_722_733,
    114_540_884_553_038,
    123_888_443_077_259,
    133_978_259_344_888,
    144_867_692_496_445,
    156_618_412_527_946,
    169_296_722_391_554,
    182_973_889_854_026,
    197_726_516_681_672,
    213_636_919_820_625,
    230_793_554_364_681
  ]
  
  # raw data for A000396 - Perfect Numbers
  @data_a000396 [
      6,28,496,8128,33550336,8589869056,137438691328,
      2305843008139952128,
      2658455991569831744654692615953842176,
      191561942608236107294793378084303638130997321548169216
  ]

  @doc """
  OEIS Sequence `A000005` - Number of divisors of N, simga-0(n), `𝝈0(n)`.

  From [OEIS A000005](https://oeis.org/A000005):

  > d(n) (also called tau(n) or sigma_0(n)), the number of divisors of n. 
  > (Formerly M0246 N0086)  

  **Sequence IDs**: `:a000005`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a000005) |> Sequence.take!(10)
      [1, 2, 2, 3, 2, 4, 2, 4, 3, 4]


  """
  @doc offset: 1,
       sequence: "Number of Divisors of N or 𝝈0(n)",
       references: [{:oeis, :a000005, "https://oeis.org/A000005"}]
  def create_sequence_a000005(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000005/1)
  end

  @doc offset: 1
  def seq_a000005(idx) do
    Math.sigma(idx, 0)
  end

  @doc """
  OEIS Sequence `A000009` - Number of partitions of n into distinct parts

  From [OEIS A000009](https://oeis.org/A000009):

  > Expansion of Product_{m >= 1} (1 + x^m); number of partitions of n into distinct parts; number of partitions of n into odd parts (if n > 0). 
  > (Formerly M0281 N0100)

  ## Divergence

  Calculation of this sequence is based on translation of a Maxima program by [Vladimir Kruchinin](http://oeis.org/wiki/User:Vladimir_Kruchinin),
  and diverges from canonical results for `n > 10`.

  **Sequence IDs**: `:a000009`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a000009) |> Sequence.take!(10)
      [1, 1, 1, 2, 2, 3, 4, 5, 6, 8]
  """
  @doc sequence: "Number of partitions of n into distinct parts",
       references: [{:oeis, :a000009, "http://oeis.org/A000009"}]
  def create_sequence_a000009(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000009/1)
  end

  def seq_a000009(idx) do
    seq_a000009_s(idx, 1)
  end

  defp seq_a000009_h(n) do
    if Integer.is_odd(n) do
      1
    else
      0
    end
  end

  defp seq_a000009_s(n, m) do
    if n == 0 do
      1
    else
      if n < m do
        0
      else
        if n == m do
          seq_a000009_h(n)
        else
          v =
            m..div(n, 2)
            |> Enum.map(fn k ->
              seq_a000009_h(k) * seq_a000009_s(n - k, k)
            end)
            |> Enum.sum()

          v + seq_a000009_h(n)
        end
      end
    end
  end

  @doc """
  OEIS Sequence `A000041` - Partitions of integer N

  This sequence contains the partitions of the integers from `0` to `250`.

  From [Wikipedia]():

  > In number theory, the partition function  `p(n)` represents the number of possible partitions of a non-negative integer `n`. For instance, 
  > `p(4) = 5` because the integer `4` has the five partitions: `1 + 1 + 1 + 1`, `1 + 1 + 2`, `1 + 3`, `2 + 2`, and `4`.

  From [OEIS A000041](https://oeis.org/A000041):

  > a(n) is the number of partitions of n (the partition numbers). 
  > (Formerly M0663 N0244)

  **Sequence IDs**: `:a000041`

  **Finite**: true

  ## Example
      
      iex> Sequence.create(Sequence.OEIS.Core, :a000041) |> Sequence.take!(10)
      [1, 1, 2, 3, 5, 7, 11, 15, 22, 30]

  """
  @doc sequence: "OEIS A000041 - Partitions of N [1, 1, 2, 3, 5, ...]",
       references: [
         {:oeis, :a000041, "https://oeis.org/A000041"},
         {:wikipedia, :partition_function,
          "https://en.wikipedia.org/wiki/Partition_function_(number_theory)"}
       ]
  def create_sequence_a000041(_opts) do
    sequence_for_list(@data_a000041)
  end

  @doc """
  OEIS Sequence `A000079` - Powers of 2 `a(n) = 2^n`

  From [OEIS A000009](https://oeis.org/A000009):

  > Powers of 2: a(n) = 2^n. 
  > (Formerly M1129 N0432)  
    
  **Sequence IDs**: `:a000079`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a000079) |> Sequence.take!(20)
      [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288]

  """
  @doc sequence: "Powers of 2: a(n) = 2^n",
       references: [{:oeis, :a000079, "http://oeis.org/A000079"}]
  def create_sequence_a000079(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000079/1)
  end

  def seq_a000079(idx) do
    :math.pow(2, idx) |> Kernel.trunc()
  end

  @doc """
  OEIS Sequence `A000203` - Sum of Divisors `σ1(n)`

  From [OEIS A000203](https://oeis.org/A000203):

  > (n) = sigma(n), the sum of the divisors of n. Also called sigma_1(n). 
  > (Formerly M2329 N0921)    

  **Sequence IDs**: `:a000203`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a000203) |> Sequence.take!(20)
      [1, 3, 4, 7, 6, 12, 8, 15, 13, 18, 12, 28, 14, 24, 24, 31, 18, 39, 20, 42]  
  """
  @doc offset: 1,
       sequence: "Sigma(n) - Sum of Divisors",
       references: [{:oeis, :a000203, "http://oeis.org/A000203"}]
  def create_sequence_a000203(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000203/1)
  end

  @doc offset: 1
  def seq_a000203(idx) do
    Math.sigma(idx)
  end

  @doc """
  OEIS Sequence `A000396` - Perfect Numbers

  From [OEIS A000396](https://oeis.org/A000396):

  > Perfect numbers n: n is equal to the sum of the proper divisors of n. 
  > (Formerly M4186 N1744)
  
  **Sequence IDs**: `:a000396`

  **Finite**: True

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a000396) |> Sequence.take!(5)
      [6, 28, 496, 8128, 33550336]  
  
  """
  @doc offset: 1, sequence: "Perfect Numbers", references: [{:oeis, :a000396, "http://oeis.org/A000396"}]
  def create_sequence_a000396(_opts) do
      sequence_for_list(@data_a000396)
  end
  
  @doc """

  OEIS Sequence `A000593` - Sum of Odd Divisors of N

  From [OEIS A000593](https://oeis.org/A000593):

  > Sum of odd divisors of n. 
  > (Formerly M3197 N1292)

  **Sequence IDs**: `:a000593`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a000593) |> Sequence.take!(10)
      [1, 1, 4, 1, 6, 4, 8, 1, 13, 6]

  """
  @doc offset: 1,
       sequence: "OEIS A000593 - Sum of Odd Divisors of N [1, 1, 4, 1, 6, ...]",
       references: [{:oeis, :a000593, "http://oeis.org/A000593"}]
  def create_sequence_a000593(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000593/1)
  end

  @doc offset: 1
  def seq_a000593(idx) do
    # N is idx +1, as this is an offset sequence (1, 3)

    (Chunky.Math.prime_factors(idx) ++ [idx])
    |> Enum.filter(&Integer.is_odd/1)
    |> Enum.uniq()
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A001065` - Sum of proper divisors (Aliquot parts) of N.

  From [OEIS A001065](https://oeis.org/A001065):

  > Sum of proper divisors (or aliquot parts) of n: sum of divisors of n that are less than n. 
  > (Formerly M2226 N0884)
  
  **Sequence IDs**: `:a001065`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a001065) |> Sequence.take!(20)
      [0, 1, 1, 3, 1, 6, 1, 7, 4, 8, 1, 16, 1, 10, 9, 15, 1, 21, 1, 22]

  """
  @doc offset: 1, sequence: "Aliquot parts of N", references: [{:oeis, :a001065, "https://oeis.org/A001065"}]
  def create_sequence_a001065(_opts) do
      sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a001065/1)
  end
  
  @doc offset: 1
  def seq_a001065(idx) do
      Math.factors(idx) -- [idx] |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A001157` - Sum of squares of divisors of N, simga-2(n), `𝝈2(n)`.

  From [OEIS A001157](https://oeis.org/A001157):

  > sigma_2(n): sum of squares of divisors of n. 
  > (Formerly M3799 N1551)  

  **Sequence IDs**: `:a001157`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a001157) |> Sequence.take!(10)
      [1, 5, 10, 21, 26, 50, 50, 85, 91, 130]

  """
  @doc offset: 1,
       sequence: "Sum of squares of divisors of n, 𝝈2(n)",
       references: [{:oeis, :a001157, "https://oeis.org/A001157"}]
  def create_sequence_a001157(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a001157/1)
  end

  @doc offset: 1
  def seq_a001157(idx) do
    Math.sigma(idx, 2)
  end

  @doc """
  OEIS Sequence `A005100` - Deficient Numbers

  From [OEIS A005100](https://oeis.org/A005100):

  > Deficient numbers: numbers n such that sigma(n) < 2n. 
  > (Formerly M0514)  
  
  **Sequence IDs**: `:a005100`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a005100) |> Sequence.take!(25)
      [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 29, 31, 32]
  
  """
  @doc offset: 1, sequence: "Deficient Numbers", references: [{:oeis, :a005100, "http://oeis.org/A005100"}]
  def create_sequence_a005100(_opts) do
      sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a005100/2)
  end
  
  @doc offset: 1
  def seq_a005100(_idx, last) do
      Math.next_deficient(last)
  end
    
  @doc """
  OEIS Sequence `A005101` - Abundant Numbers

  From [OEIS A005101](https://oeis.org/A005101):

  > Abundant numbers (sum of divisors of n exceeds 2n). 
  > (Formerly M4825)
  
  **Sequence IDs**: `:a005101`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a005101) |> Sequence.take!(10)
      [12, 18, 20, 24, 30, 36, 40, 42, 48, 54]
  
  """
  @doc offset: 1, sequence: "Abundant Numbers", references: [{:oeis, :a005101, "http://oeis.org/A005101"}]
  def create_sequence_a005101(_opts) do
      sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a005101/2)
  end
  
  @doc offset: 1, fill_value: 1
  def seq_a005101(_idx, last) do
      Math.next_abundant(last)
  end
  

end
