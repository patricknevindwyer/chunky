defmodule Chunky.Sequence.OEIS.Core do
  @moduledoc """
  OEIS [Core](http://oeis.org/search?q=keyword%3acore&sort=number) Sequences.

  ## Available Sequences

   - [A000001 - Number of groups of order n](https://oeis.org/A000001) - `:a000001` - `create_sequence_a000001/1`
   - [A000005 - Divisors of N](https://oeis.org/A000005) - `:a000005` - `create_sequence_a000005/1`
   - [A000009 - Number of partitions of n into distinct parts](http://oeis.org/A000009) - `:a000009` - `create_sequence_a000009/1`
   - [A000010 - Euler's totient function](https://oeis.org/A000010) - `:a000010` - `create_sequence_a000010/1`
   - [A000041 - Partition Numbers](https://oeis.org/A000041) - `:a000041` - `create_sequence_a000041/1`
   - [A000043 - Mersenne exponents: primes p such that 2^p - 1 is prime.](https://oeis.org/A000043) - `:a000043` - `create_sequence_a000043/1`
   - [A000079 - Powers of 2](https://oeis.org/A000079) - `:a000079` - `create_sequence_a000079/1`
   - [A000105 - Number of free polyominoes (or square animals) with n cells](https://oeis.org/A000105) - `:a000105` - `create_sequence_a000105/1`
   - [A000109 - Number of simplicial polyhedra with n nodes](https://oeis.org/A000109) - `:a000109` - `create_sequence_a000109/1`
   - [A000112 - Number of partially ordered sets ("posets") with n unlabeled elements](https://oeis.org/A000112) - `:a000112` - `create_sequence_a000112/1`
   - [A000203 - Sum of Divisors](https://oeis.org/A000203) - `:a000203` - `create_sequence_a000203/1`
   - [A000244 - Powers of 3](https://oeis.org/A000244) - `:a000244` - `create_sequence_a000244/1`
   - [A000290 - The squares: a(n) = n^2](https://oeis.org/A000290) - `:a000290` - `create_sequence_a000290/1`
   - [A000302 - Powers of 4: a(n) = 4^n](https://oeis.org/A000302) - `:a000302` - `create_sequence_a000302/1`
   - [A000396 - Perfect Numbers](https://oeis.org/A000396) - `:a000396` - `create_sequence_a000396/1`
   - [A000578 - The cubes: a(n) = n^3.](https://oeis.org/A000578) - `:a000578` - `create_sequence_a000578/1`
   - [A000593 - Sum of Odd Divisors of N](https://oeis.org/A000593) - `:a000593` - `create_sequence_a000593/1`
   - [A000609 - Number of threshold functions of n or fewer variables](https://oeis.org/A000609) - `:a000609` - `create_sequence_a000609/1`
   - [A000798 - Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements](https://oeis.org/A000798) - `:a000798` - `create_sequence_a000798/1`
   - [A001065 - Sum of proper divisors (Aliquot parts) of N.](https://oeis.org/A001065) - `:a001065` - `create_sequence_a001065/1`
   - [A001157 - Sum of squares of divisors of N](https://oeis.org/A001157) - `:a001157` - `create_sequence_a001157/1`
   - [A001221 - Number of distinct primes dividing n (also called omega(n)).](https://oeis.org/A001221) - `:a001221` - `create_sequence_a001221/1`
   - [A001222 - Number of prime divisors of n counted with multiplicity (also called bigomega(n) or Omega(n)).](https://oeis.org/A001222) - `:a001222` - `create_sequence_a001222/1`
   - [A001358 - Semiprimes (or biprimes): products of two primes](https://oeis.org/A001358) - `:a001358` - `create_sequence_a001358/1`
   - [A001615 - Dedekind psi function](https://oeis.org/A001615) - `:a001615` - `create_sequence_a001615/1`
   - [A002106 - Number of transitive permutation groups of degree n](https://oeis.org/A002106) - `:a002106` - `create_sequence_a002106/1`
   - [A003094 - Number of unlabeled connected planar simple graphs with n nodes](https://oeis.org/A003094) - `:a003094` - `create_sequence_a003094/1`
   - [A005100 - Deficient Numbers](https://oeis.org/A005100) - `:a005100` - `create_sequence_a005100/1`
   - [A005101 - Abundant Numbers](https://oeis.org/A005101) - `:a005101` - `create_sequence_a005101/1`
   - [A005117 - Squarefree numbers: numbers that are not divisible by a square greater than 1](https://oeis.org/A005117) - `:a005117` - `create_sequence_a005117/1`
   - [A005470 - Number of unlabeled planar simple graphs with n nodes](https://oeis.org/A005470) - `:a005470` - `create_sequence_a005470/1`
   - [A006530 - Gpf(n): greatest prime dividing n](https://oeis.org/A006530) - `:a006530` - `create_sequence_a006530/1`
   - [A006966 - Number of lattices on n unlabeled nodes](https://oeis.org/A006966) - `:a006966` - `create_sequence_a006966/1`
   - [A008683 - Möbius (or Moebius) function mu(n)](https://oeis.org/A008683) - `:a008683` - `create_sequence_a008683/1`
   - [A020639 - Lpf(n): least prime dividing n](https://oeis.org/A020639) - `:a020639` - `create_sequence_a020639/1`
   - [A055512 - Lattices with n labeled elements](https://oeis.org/A055512) - `:a055512` - `create_sequence_a055512/1`


  """
  import Chunky.Sequence, only: [sequence_for_list: 1, sequence_for_function: 1]
  alias Chunky.Math

  require Integer

  # raw data for A000001 - Number of groups of order n.
  @data_a000001 [0,1,1,1,2,1,2,1,5,2,2,1,5,1,2,1,14,1,5,1,5,2,2,1,15,2,2,5,4,1,4,1,51,1,2,1,14,1,2,2,14,1,6,1,4,2,2,1,52,2,5,1,5,1,15,2,13,2,2,1,13,1,2,4,267,1,4,1,5,1,4,1,50,1,2,3,4,1,6,1,52,15,2,1,15,1,2,1,12,1,10,1,4,2]

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

  # raw data for A000043 - Mersenne Primes Exponents
  @data_a000043 [2,3,5,7,13,17,19,31,61,89,107,127,521,607,1279,2203,2281,3217,4253,4423,9689,9941,11213,19937,21701,23209,44497,86243,110503,132049,216091,756839,859433,1257787,1398269,2976221,3021377,6972593,13466917,20996011,24036583,25964951,30402457,32582657,37156667,42643801,43112609]
  
  # raw data for A000105 - Number of free polyominoes (or square animals) with n cells.
  @data_a000105 [1,1,1,2,5,12,35,108,369,1285,4655,17073,63600,238591,901971,3426576,13079255,50107909,192622052,742624232,2870671950,11123060678,43191857688,168047007728,654999700403,2557227044764,9999088822075,39153010938487,153511100594603]

  # raw data for A000109 - Number of simplicial polyhedra with n nodes; simple planar graphs with 3n-6 edges; maximal simple planar graphs; 3-connected planar triangulations; 3-connected triangulations of the sphere; 3-connected cubic planar graphs.
  @data_a000109 [1,1,1,2,5,14,50,233,1249,7595,49566,339722,2406841,17490241,129664753,977526957,7475907149,57896349553,453382272049,3585853662949,28615703421545]

  # raw data for A000112 - Number of partially ordered sets ("posets") with n unlabeled elements.
  @data_a000112 [1,1,2,5,16,63,318,2045,16999,183231,2567284,46749427,1104891746,33823827452,1338193159771,68275077901156,4483130665195087]

  # raw data for A000396 - Perfect Numbers
  @data_a000396 [
    6,
    28,
    496,
    8128,
    33_550_336,
    8_589_869_056,
    137_438_691_328,
    2_305_843_008_139_952_128,
    2_658_455_991_569_831_744_654_692_615_953_842_176,
    191_561_942_608_236_107_294_793_378_084_303_638_130_997_321_548_169_216
  ]

  # raw data for A000609 - Number of threshold functions of n or fewer variables.
  @data_a000609 [2,4,14,104,1882,94572,15028134,8378070864,17561539552946,144130531453121108]

  # raw data for A000798 - Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements.
  @data_a000798 [1,1,4,29,355,6942,209527,9535241,642779354,63260289423,8977053873043,1816846038736192,519355571065774021,207881393656668953041,115617051977054267807460,88736269118586244492485121,93411113411710039565210494095,134137950093337880672321868725846,261492535743634374805066126901117203]

  # raw data for A002106 - Number of transitive permutation groups of degree n.
  @data_a002106 [1,1,2,5,5,16,7,50,34,45,8,301,9,63,104,1954,10,983,8,1117,164,59,7,25000,211,96,2392,1854,8,5712,12,2801324,162,115,407,121279,11,76,306,315842,10,9491,10,2113,10923,56,6]

  # raw data for A003094 - Number of unlabeled connected planar simple graphs with n nodes.
  @data_a003094 [1,1,1,2,6,20,99,646,5974,71885,1052805,17449299,313372298]

  # raw data for A005470 - Number of unlabeled planar simple graphs with n nodes.
  @data_a005470 [1,1,2,4,11,33,142,822,6966,79853,1140916,18681008,333312451]

  # raw data for A006966 - Number of lattices on n unlabeled nodes.
  @data_a006966 [1,1,1,1,2,5,15,53,222,1078,5994,37622,262776,2018305,16873364,152233518,1471613387,15150569446,165269824761,1901910625578,23003059864006]

  # raw data for A055512 - Lattices with n labeled elements.
  @data_a055512 [1,1,2,6,36,380,6390,157962,5396888,243179064,13938711210,987858368750,84613071940452,8597251494954564,1020353444641839854,139627532137612581090,21788453795572514675760,3840596246648027262079472,758435490711709577216754642]


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
  OEIS Sequence `A000010` - Euler's totient function `phi(n)`

  From [OEIS A000010](https://oeis.org/A000010):

  > Euler totient function phi(n): count numbers <= n and prime to n. 
  > (Formerly M0299 N0111)

  **Sequence IDs**: `:a000010`

  **Finite**: false

  ## Example
      
      iex> Sequence.create(Sequence.OEIS.Core, :a000010) |> Sequence.take!(20)
      [1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8, 8, 16, 6, 18, 8]

  """
  @doc offset: 1,
       sequence: "Euler totient function phi(n)",
       references: [
         {:oeis, :a000010, "https://oeis.org/A000010"},
         {:wikipedia, :eulers_totient_function,
          "https://en.wikipedia.org/wiki/Euler%27s_totient_function"}
       ]
  def create_sequence_a000010(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000010/1)
  end

  @doc offset: 1
  def seq_a000010(idx) do
    Math.totient(idx)
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
  OEIS Sequence `A000043` - Mersenne exponents: primes p such that 2^p - 1 is prime

  From [OEIS A000043](https://oeis.org/A000043):

  > Mersenne exponents: primes p such that 2^p - 1 is prime. Then 2^p - 1 is called a Mersenne prime.
  > (Formerly M0672 N0248)

  **Sequence IDs**: `:a000043`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000043) |> Sequence.take!(47)
      [2,3,5,7,13,17,19,31,61,89,107,127,521,607,1279,2203,2281,3217,4253,4423,9689,9941,11213,19937,21701,23209,44497,86243,110503,132049,216091,756839,859433,1257787,1398269,2976221,3021377,6972593,13466917,20996011,24036583,25964951,30402457,32582657,37156667,42643801,43112609]


  """
  @doc offset: 1,
       sequence: "Mersenne exponents: primes p such that 2^p - 1 is prime",
       references: [{:oeis, :a000043, "https://oeis.org/A000043"}]
  def create_sequence_a000043(_opts) do
          sequence_for_list(@data_a000043)
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
  OEIS Sequence `A000105` - Number of free polyominoes (or square animals) with n cells.

  From [OEIS A000105](https://oeis.org/A000105):

  > Number of free polyominoes (or square animals) with n cells.
  > (Formerly M1425 N0561)

  **Sequence IDs**: `:a000105`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000105) |> Sequence.take!(29)
      [1,1,1,2,5,12,35,108,369,1285,4655,17073,63600,238591,901971,3426576,13079255,50107909,192622052,742624232,2870671950,11123060678,43191857688,168047007728,654999700403,2557227044764,9999088822075,39153010938487,153511100594603]


  """
  @doc offset: 0,
       sequence: "Number of free polyominoes (or square animals) with n cells",
       references: [{:oeis, :a000105, "https://oeis.org/A000105"}]
  def create_sequence_a000105(_opts) do
          sequence_for_list(@data_a000105)
  end

  @doc """
  OEIS Sequence `A000109` - Number of simplicial polyhedra with n nodes

  From [OEIS A000109](https://oeis.org/A000109):

  > Number of simplicial polyhedra with n nodes; 
  > simple planar graphs with 3n-6 edges; maximal simple planar graphs; 
  > 3-connected planar triangulations; 3-connected triangulations of the sphere; 
  > 3-connected cubic planar graphs.
  > (Formerly M1469 N0580)

  **Sequence IDs**: `:a000109`

  **Finite**: False

  **Offset**: 3

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000109) |> Sequence.take!(21)
      [1,1,1,2,5,14,50,233,1249,7595,49566,339722,2406841,17490241,129664753,977526957,7475907149,57896349553,453382272049,3585853662949,28615703421545]

  """
  @doc offset: 3,
       sequence: "Number of simplicial polyhedra with n nodes",
       references: [{:oeis, :a000109, "https://oeis.org/A000109"}]
  def create_sequence_a000109(_opts) do
          sequence_for_list(@data_a000109)
  end

  @doc """
  OEIS Sequence `A000112` - Number of partially ordered sets ("posets") with n unlabeled elements.

  From [OEIS A000112](https://oeis.org/A000112):

  > Number of partially ordered sets ("posets") with n unlabeled elements.
  > (Formerly M1495 N0588)

  **Sequence IDs**: `:a000112`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000112) |> Sequence.take!(17)
      [1,1,2,5,16,63,318,2045,16999,183231,2567284,46749427,1104891746,33823827452,1338193159771,68275077901156,4483130665195087]


  """
  @doc offset: 0,
       sequence: "Number of partially ordered sets ('posets') with n unlabeled elements.",
       references: [{:oeis, :a000112, "https://oeis.org/A000112"}]
  def create_sequence_a000112(_opts) do
          sequence_for_list(@data_a000112)
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
  OEIS Sequence `A000244` - Powers of 3.

  From [OEIS A000244](https://oeis.org/A000244):

  > Powers of 3.
  > (Formerly M2807 N1129)

  **Sequence IDs**: `:a000244`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000244) |> Sequence.take!(28)
      [1,3,9,27,81,243,729,2187,6561,19683,59049,177147,531441,1594323,4782969,14348907,43046721,129140163,387420489,1162261467,3486784401,10460353203,31381059609,94143178827,282429536481,847288609443,2541865828329,7625597484987]


  """
  @doc offset: 0,
       sequence: "Powers of 3.",
       references: [{:oeis, :a000244, "https://oeis.org/A000244"}]
  def create_sequence_a000244(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000244/1)
  end

  @doc offset: 0
  def seq_a000244(idx) do
    Math.pow(3, idx)
  end

  @doc """
  OEIS Sequence `A000290` - The squares: a(n) = n^2.

  From [OEIS A000290](https://oeis.org/A000290):

  > The squares: a(n) = n^2.
  > (Formerly M3356 N1350)

  **Sequence IDs**: `:a000290`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000290) |> Sequence.take!(51)
      [0,1,4,9,16,25,36,49,64,81,100,121,144,169,196,225,256,289,324,361,400,441,484,529,576,625,676,729,784,841,900,961,1024,1089,1156,1225,1296,1369,1444,1521,1600,1681,1764,1849,1936,2025,2116,2209,2304,2401,2500]

  """
  @doc offset: 0,
       sequence: "The squares: a(n) = n^2.",
       references: [{:oeis, :a000290, "https://oeis.org/A000290"}]
  def create_sequence_a000290(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000290/1)
  end

  @doc offset: 0
  def seq_a000290(idx) do
    Math.pow(idx, 2)
  end

  @doc """
  OEIS Sequence `A000302` - Powers of 4: a(n) = 4^n.

  From [OEIS A000302](https://oeis.org/A000302):

  > Powers of 4: a(n) = 4^n.
  > (Formerly M3518 N1428)

  **Sequence IDs**: `:a000302`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000302) |> Sequence.take!(25)
      [1,4,16,64,256,1024,4096,16384,65536,262144,1048576,4194304,16777216,67108864,268435456,1073741824,4294967296,17179869184,68719476736,274877906944,1099511627776,4398046511104,17592186044416,70368744177664,281474976710656]


  """
  @doc offset: 0,
       sequence: "Powers of 4: a(n) = 4^n.",
       references: [{:oeis, :a000302, "https://oeis.org/A000302"}]
  def create_sequence_a000302(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000302/1)
  end

  @doc offset: 0
  def seq_a000302(idx) do
    Math.pow(4, idx)
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
  @doc offset: 1,
       sequence: "Perfect Numbers",
       references: [{:oeis, :a000396, "http://oeis.org/A000396"}]
  def create_sequence_a000396(_opts) do
    sequence_for_list(@data_a000396)
  end

  @doc """
  OEIS Sequence `A000578` - The cubes: a(n) = n^3.

  From [OEIS A000578](https://oeis.org/A000578):

  > The cubes: a(n) = n^3.
  > (Formerly M4499 N1905)

  **Sequence IDs**: `:a000578`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000578) |> Sequence.take!(41)
      [0,1,8,27,64,125,216,343,512,729,1000,1331,1728,2197,2744,3375,4096,4913,5832,6859,8000,9261,10648,12167,13824,15625,17576,19683,21952,24389,27000,29791,32768,35937,39304,42875,46656,50653,54872,59319,64000]


  """
  @doc offset: 0,
       sequence: "The cubes: a(n) = n^3.",
       references: [{:oeis, :a000578, "https://oeis.org/A000578"}]
  def create_sequence_a000578(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000578/1)
  end

  @doc offset: 0
  def seq_a000578(idx) do
    Math.pow(idx, 3)
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
  @doc offset: 1,
       sequence: "Aliquot parts of N",
       references: [{:oeis, :a001065, "https://oeis.org/A001065"}]
  def create_sequence_a001065(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a001065/1)
  end

  @doc offset: 1
  def seq_a001065(idx) do
    Math.aliquot_sum(idx)
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
  OEIS Sequence `A001221` - Number of distinct primes dividing n (also called omega(n)).

  From [OEIS A001221](https://oeis.org/A001221):

  > Number of distinct primes dividing n (also called omega(n)).
  > (Formerly M0056 N0019)

  **Sequence IDs**: `:a001221`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001221) |> Sequence.take!(111)
      [0,1,1,1,1,2,1,1,1,2,1,2,1,2,2,1,1,2,1,2,2,2,1,2,1,2,1,2,1,3,1,1,2,2,2,2,1,2,2,2,1,3,1,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2,1,3,1,2,2,1,2,3,1,2,2,3,1,2,1,2,2,2,2,3,1,2,1,2,1,3,2,2,2,2,1,3,2,2,2,2,2,2,1,2,2,2,1,3,1,2,3,2,1,2,1,3,2]

  """
  @doc offset: 1,
       sequence: "Number of distinct primes dividing n (also called omega(n)).",
       references: [{:oeis, :a001221, "https://oeis.org/A001221"}]
  def create_sequence_a001221(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001221/1)
  end

  @doc offset: 1
  def seq_a001221(idx) do
    Math.omega(idx)
  end

  @doc """
  OEIS Sequence `A001222` - Number of prime divisors of n counted with multiplicity (also called bigomega(n) or Omega(n)).

  From [OEIS A001222](https://oeis.org/A001222):

  > Number of prime divisors of n counted with multiplicity (also called bigomega(n) or Omega(n)).
  > (Formerly M0094 N0031)

  **Sequence IDs**: `:a001222`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001222) |> Sequence.take!(111)
      [0,1,1,2,1,2,1,3,2,2,1,3,1,2,2,4,1,3,1,3,2,2,1,4,2,2,3,3,1,3,1,5,2,2,2,4,1,2,2,4,1,3,1,3,3,2,1,5,2,3,2,3,1,4,2,4,2,2,1,4,1,2,3,6,2,3,1,3,2,3,1,5,1,2,3,3,2,3,1,5,4,2,1,4,2,2,2,4,1,4,2,3,2,2,2,6,1,3,3,4,1,3,1,4,3,2,1,5,1,3,2]

  """
  @doc offset: 1,
       sequence:
         "Number of prime divisors of n counted with multiplicity (also called bigomega(n) or Omega(n)).",
       references: [{:oeis, :a001222, "https://oeis.org/A001222"}]
  def create_sequence_a001222(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001222/1)
  end

  @doc offset: 1
  def seq_a001222(idx) do
    Math.bigomega(idx)
  end

  @doc """
  OEIS Sequence `A001358` - Semiprimes (or biprimes): products of two primes.

  From [OEIS A001358](https://oeis.org/A001358):

  > Semiprimes (or biprimes): products of two primes.
  > (Formerly M3274 N1323)

  **Sequence IDs**: `:a001358`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001358) |> Sequence.take!(61)
      [4,6,9,10,14,15,21,22,25,26,33,34,35,38,39,46,49,51,55,57,58,62,65,69,74,77,82,85,86,87,91,93,94,95,106,111,115,118,119,121,122,123,129,133,134,141,142,143,145,146,155,158,159,161,166,169,177,178,183,185,187]


  """
  @doc offset: 1,
       sequence: "Semiprimes (or biprimes): products of two primes.",
       references: [{:oeis, :a001358, "https://oeis.org/A001358"}]
  def create_sequence_a001358(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001358/2)
  end

  @doc offset: 1
  def seq_a001358(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 2 end, last)
  end

  @doc """
  OEIS Sequence `A001615` - Dedekind psi function: n * Product_{p|n, p prime} (1 + 1/p).

  From [OEIS A001615](https://oeis.org/A001615):

  > Dedekind psi function: n * Product_{p|n, p prime} (1 + 1/p).
  > (Formerly M2315 N0915)

  **Sequence IDs**: `:a001615`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Core, :a001615) |> Sequence.take!(69)
      [1,3,4,6,6,12,8,12,12,18,12,24,14,24,24,24,18,36,20,36,32,36,24,48,30,42,36,48,30,72,32,48,48,54,48,72,38,60,56,72,42,96,44,72,72,72,48,96,56,90,72,84,54,108,72,96,80,90,60,144,62,96,96,96,84,144,68,108,96]


  """
  @doc offset: 1,
       sequence: "Dedekind psi function: n * Product_{p|n, p prime} (1 + 1/p).",
       references: [{:oeis, :a001615, "https://oeis.org/A001615"}]
  def create_sequence_a001615(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001615/1)
  end

  @doc offset: 1
  def seq_a001615(idx) do
    div(Math.jordan_totient(idx, 2), Math.jordan_totient(idx, 1))
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
  @doc offset: 1,
       sequence: "Deficient Numbers",
       references: [{:oeis, :a005100, "http://oeis.org/A005100"}]
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
  @doc offset: 1,
       sequence: "Abundant Numbers",
       references: [{:oeis, :a005101, "http://oeis.org/A005101"}]
  def create_sequence_a005101(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a005101/2)
  end

  @doc offset: 1, fill_value: 1
  def seq_a005101(_idx, last) do
    Math.next_abundant(last)
  end

  @doc """
  OEIS Sequence `A005117` - Squarefree numbers: numbers that are not divisible by a square greater than 1.

  From [OEIS A005117](https://oeis.org/A005117):

  > Squarefree numbers: numbers that are not divisible by a square greater than 1.
  > (Formerly M0617)

  **Sequence IDs**: `:a005117`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a005117) |> Sequence.take!(71)
      [1,2,3,5,6,7,10,11,13,14,15,17,19,21,22,23,26,29,30,31,33,34,35,37,38,39,41,42,43,46,47,51,53,55,57,58,59,61,62,65,66,67,69,70,71,73,74,77,78,79,82,83,85,86,87,89,91,93,94,95,97,101,102,103,105,106,107,109,110,111,113]

  """
  @doc offset: 1,
       sequence: "Squarefree numbers: numbers that are not divisible by a square greater than 1.",
       references: [{:oeis, :a005117, "https://oeis.org/A005117"}]
  def create_sequence_a005117(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a005117/2)
  end

  @doc offset: 1
  def seq_a005117(_idx, last) do
    Math.next_number(&Math.is_squarefree?/1, last)
  end

  @doc """
  OEIS Sequence `A006530` - Gpf(n): greatest prime dividing n

  From [OEIS A006530](https://oeis.org/A006530):

  > Gpf(n): greatest prime dividing n, for n >= 2; a(1)=1.
  > (Formerly M0428)

  **Sequence IDs**: `:a006530`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a006530) |> Sequence.take!(86)
      [1,2,3,2,5,3,7,2,3,5,11,3,13,7,5,2,17,3,19,5,7,11,23,3,5,13,3,7,29,5,31,2,11,17,7,3,37,19,13,5,41,7,43,11,5,23,47,3,7,5,17,13,53,3,11,7,19,29,59,5,61,31,7,2,13,11,67,17,23,7,71,3,73,37,5,19,11,13,79,5,3,41,83,7,17,43]

  """
  @doc offset: 1,
       sequence: "Gpf(n): greatest prime dividing n",
       references: [{:oeis, :a006530, "https://oeis.org/A006530"}]
  def create_sequence_a006530(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a006530/1)
  end

  @doc offset: 1
  def seq_a006530(idx) do
    Math.greatest_prime_factor(idx)
  end

  @doc """
  OEIS Sequence `A008683` - Möbius (or Moebius) function mu(n)

  From [OEIS A008683](https://oeis.org/A008683):

  > Möbius (or Moebius) function mu(n). mu(1) = 1; mu(n) = (-1)^k if n is the product of k different primes; otherwise mu(n) = 0.

  **Sequence IDs**: `:a008683`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a008683) |> Sequence.take!(78)
      [1,-1,-1,0,-1,1,-1,0,0,1,-1,0,-1,1,1,0,-1,0,-1,0,1,1,-1,0,0,1,0,0,-1,-1,-1,0,1,1,1,0,-1,1,1,0,-1,-1,-1,0,0,1,-1,0,0,0,1,0,-1,0,1,0,1,1,-1,0,-1,1,0,0,1,-1,-1,0,1,-1,-1,0,-1,1,0,0,1,-1]

  """
  @doc offset: 1,
       sequence:
         "Möbius (or Moebius) function mu(n). mu(1) = 1; mu(n) = (-1)^k if n is the product of k different primes; otherwise mu(n) = 0.",
       references: [{:oeis, :a008683, "https://oeis.org/A008683"}]
  def create_sequence_a008683(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a008683/1)
  end

  @doc offset: 1
  def seq_a008683(idx) do
    Math.mobius_function(idx)
  end

  @doc """
  OEIS Sequence `A020639` - Lpf(n): least prime dividing

  From [OEIS A020639](https://oeis.org/A020639):

  > Lpf(n): least prime dividing n (when n > 1); a(1) = 1.

  **Sequence IDs**: `:a020639`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a020639) |> Sequence.take!(97)
      [1,2,3,2,5,2,7,2,3,2,11,2,13,2,3,2,17,2,19,2,3,2,23,2,5,2,3,2,29,2,31,2,3,2,5,2,37,2,3,2,41,2,43,2,3,2,47,2,7,2,3,2,53,2,5,2,3,2,59,2,61,2,3,2,5,2,67,2,3,2,71,2,73,2,3,2,7,2,79,2,3,2,83,2,5,2,3,2,89,2,7,2,3,2,5,2,97]

  """
  @doc offset: 1,
       sequence: "Lpf(n): least prime dividing n",
       references: [{:oeis, :a020639, "https://oeis.org/A020639"}]
  def create_sequence_a020639(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a020639/1)
  end

  @doc offset: 1
  def seq_a020639(idx) do
    Math.least_prime_factor(idx)
  end
  
  @doc """
  OEIS Sequence `A000001` - Number of groups of order n.

  From [OEIS A000001](https://oeis.org/A000001):

  > Number of groups of order n.
  > (Formerly M0098 N0035)

  **Sequence IDs**: `:a000001`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000001) |> Sequence.take!(94)
      [0,1,1,1,2,1,2,1,5,2,2,1,5,1,2,1,14,1,5,1,5,2,2,1,15,2,2,5,4,1,4,1,51,1,2,1,14,1,2,2,14,1,6,1,4,2,2,1,52,2,5,1,5,1,15,2,13,2,2,1,13,1,2,4,267,1,4,1,5,1,4,1,50,1,2,3,4,1,6,1,52,15,2,1,15,1,2,1,12,1,10,1,4,2]


  """
  @doc offset: 0,
       sequence: "Number of groups of order n.",
       references: [{:oeis, :a000001, "https://oeis.org/A000001"}]
  def create_sequence_a000001(_opts) do
          sequence_for_list(@data_a000001)
  end

  @doc """
  OEIS Sequence `A000609` - Number of threshold functions of n or fewer variables.

  From [OEIS A000609](https://oeis.org/A000609):

  > Number of threshold functions of n or fewer variables.
  > (Formerly M1285 N0492)

  **Sequence IDs**: `:a000609`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000609) |> Sequence.take!(10)
      [2,4,14,104,1882,94572,15028134,8378070864,17561539552946,144130531453121108]


  """
  @doc offset: 0,
       sequence: "Number of threshold functions of n or fewer variables.",
       references: [{:oeis, :a000609, "https://oeis.org/A000609"}]
  def create_sequence_a000609(_opts) do
          sequence_for_list(@data_a000609)
  end

  @doc """
  OEIS Sequence `A000798` - Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements.

  From [OEIS A000798](https://oeis.org/A000798):

  > Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements.
  > (Formerly M3631 N1476)

  **Sequence IDs**: `:a000798`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000798) |> Sequence.take!(19)
      [1,1,4,29,355,6942,209527,9535241,642779354,63260289423,8977053873043,1816846038736192,519355571065774021,207881393656668953041,115617051977054267807460,88736269118586244492485121,93411113411710039565210494095,134137950093337880672321868725846,261492535743634374805066126901117203]


  """
  @doc offset: 0,
       sequence: "Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements.",
       references: [{:oeis, :a000798, "https://oeis.org/A000798"}]
  def create_sequence_a000798(_opts) do
          sequence_for_list(@data_a000798)
  end

  @doc """
  OEIS Sequence `A002106` - Number of transitive permutation groups of degree n.

  From [OEIS A002106](https://oeis.org/A002106):

  > Number of transitive permutation groups of degree n.
  > (Formerly M1316 N0504)

  **Sequence IDs**: `:a002106`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002106) |> Sequence.take!(47)
      [1,1,2,5,5,16,7,50,34,45,8,301,9,63,104,1954,10,983,8,1117,164,59,7,25000,211,96,2392,1854,8,5712,12,2801324,162,115,407,121279,11,76,306,315842,10,9491,10,2113,10923,56,6]


  """
  @doc offset: 1,
       sequence: "Number of transitive permutation groups of degree n.",
       references: [{:oeis, :a002106, "https://oeis.org/A002106"}]
  def create_sequence_a002106(_opts) do
          sequence_for_list(@data_a002106)
  end

  @doc """
  OEIS Sequence `A003094` - Number of unlabeled connected planar simple graphs with n nodes.

  From [OEIS A003094](https://oeis.org/A003094):

  > Number of unlabeled connected planar simple graphs with n nodes.
  > (Formerly M1652)

  **Sequence IDs**: `:a003094`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a003094) |> Sequence.take!(13)
      [1,1,1,2,6,20,99,646,5974,71885,1052805,17449299,313372298]


  """
  @doc offset: 0,
       sequence: "Number of unlabeled connected planar simple graphs with n nodes.",
       references: [{:oeis, :a003094, "https://oeis.org/A003094"}]
  def create_sequence_a003094(_opts) do
          sequence_for_list(@data_a003094)
  end

  @doc """
  OEIS Sequence `A005470` - Number of unlabeled planar simple graphs with n nodes.

  From [OEIS A005470](https://oeis.org/A005470):

  > Number of unlabeled planar simple graphs with n nodes.
  > (Formerly M1252)

  **Sequence IDs**: `:a005470`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a005470) |> Sequence.take!(13)
      [1,1,2,4,11,33,142,822,6966,79853,1140916,18681008,333312451]


  """
  @doc offset: 0,
       sequence: "Number of unlabeled planar simple graphs with n nodes.",
       references: [{:oeis, :a005470, "https://oeis.org/A005470"}]
  def create_sequence_a005470(_opts) do
          sequence_for_list(@data_a005470)
  end

  @doc """
  OEIS Sequence `A006966` - Number of lattices on n unlabeled nodes.

  From [OEIS A006966](https://oeis.org/A006966):

  > Number of lattices on n unlabeled nodes.
  > (Formerly M1486)

  **Sequence IDs**: `:a006966`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a006966) |> Sequence.take!(21)
      [1,1,1,1,2,5,15,53,222,1078,5994,37622,262776,2018305,16873364,152233518,1471613387,15150569446,165269824761,1901910625578,23003059864006]


  """
  @doc offset: 0,
       sequence: "Number of lattices on n unlabeled nodes.",
       references: [{:oeis, :a006966, "https://oeis.org/A006966"}]
  def create_sequence_a006966(_opts) do
          sequence_for_list(@data_a006966)
  end

  @doc """
  OEIS Sequence `A055512` - Lattices with n labeled elements.

  From [OEIS A055512](https://oeis.org/A055512):

  > Lattices with n labeled elements.
  > (Formerly )

  **Sequence IDs**: `:a055512`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a055512) |> Sequence.take!(19)
      [1,1,2,6,36,380,6390,157962,5396888,243179064,13938711210,987858368750,84613071940452,8597251494954564,1020353444641839854,139627532137612581090,21788453795572514675760,3840596246648027262079472,758435490711709577216754642]


  """
  @doc offset: 0,
       sequence: "Lattices with n labeled elements.",
       references: [{:oeis, :a055512, "https://oeis.org/A055512"}]
  def create_sequence_a055512(_opts) do
          sequence_for_list(@data_a055512)
  end
end
