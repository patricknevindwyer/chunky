defmodule Chunky.SequenceDataTest do
  use ExUnit.Case

  @moduledoc """
  This set of tests verifies the data/layout of every sequence.
  """
  alias Chunky.Sequence
  doctest Chunky.Sequence.Basic
  doctest Chunky.Sequence.OEIS
  doctest Chunky.Sequence.OEIS.Core
  doctest Chunky.Sequence.OEIS.Sigma
  doctest Chunky.Sequence.OEIS.Factors

  @sequences [
    # Sequence.Basic
    %{
      module: Chunky.Sequence.Basic,
      sequence: :whole_numbers,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false
    },
    %{
      module: Chunky.Sequence.Basic,
      sequence: :whole_numbers,
      opts: [start: 100],
      values: [100, 101, 102, 103, 104, 105, 106, 107, 108, 109],
      finite: false
    },
    %{
      module: Chunky.Sequence.Basic,
      sequence: :empty,
      opts: [],
      values: [],
      finite: true
    },
    %{
      module: Chunky.Sequence.Basic,
      sequence: :decimal_digits,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: true
    },

    # Sequence.OEIS
    %{
      module: Chunky.Sequence.OEIS,
      sequence: :a000045,
      opts: [],
      values: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS,
      sequence: :fibonacci,
      opts: [],
      values: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      finite: false
    },

    # Sequence.OEIS.Core
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000005,
      opts: [],
      values: [1, 2, 2, 3, 2, 4, 2, 4, 3, 4],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000009,
      opts: [],
      values: [1, 1, 1, 2, 2, 3, 4, 5, 6, 8],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000010,
      opts: [],
      values: [1, 1, 2, 2, 4, 2, 6, 4, 6, 4],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000041,
      opts: [],
      values: [1, 1, 2, 3, 5, 7, 11, 15, 22, 30],
      finite: true
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000079,
      opts: [],
      values: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000203,
      opts: [],
      values: [1, 3, 4, 7, 6, 12, 8, 15, 13, 18],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000396,
      opts: [],
      values: [
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
      ],
      finite: true,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000593,
      opts: [],
      values: [1, 1, 4, 1, 6, 4, 8, 1, 13, 6],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a001065,
      opts: [],
      values: [0, 1, 1, 3, 1, 6, 1, 7, 4, 8],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a001157,
      opts: [],
      values: [1, 5, 10, 21, 26, 50, 50, 85, 91, 130],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001615,
      opts: [],
      values: [1, 3, 4, 6, 6, 12, 8, 12, 12, 18],
      finite: false,
      first_index: 1
    },    
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a005100,
      opts: [],
      values: [1, 2, 3, 4, 5, 7, 8, 9, 10, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a005101,
      opts: [],
      values: [12, 18, 20, 24, 30, 36, 40, 42, 48, 54],
      finite: false,
      first_index: 1
    },

    # Sequence.OEIS.Sigma
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a001158,
      opts: [],
      values: [1, 9, 28, 73, 126, 252, 344, 585, 757, 1134],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a001159,
      opts: [],
      values: [1, 17, 82, 273, 626, 1394, 2402, 4369, 6643, 10642],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a001160,
      opts: [],
      values: [1, 33, 244, 1057, 3126, 8052, 16808, 33825, 59293, 103_158],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a002093,
      opts: [],
      values: [1, 2, 3, 4, 6, 8, 10, 12, 16, 18],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a003601,
      opts: [],
      values: [1, 3, 5, 6, 7, 11, 13, 14, 15, 17],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013954,
      opts: [],
      values: [1, 65, 730, 4161, 15626, 47450, 117_650, 266_305, 532_171, 1_015_690],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013955,
      opts: [],
      values: [1, 129, 2188, 16513, 78126, 282_252, 823_544, 2_113_665, 4_785_157, 10_078_254],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013956,
      opts: [],
      values: [
        1,
        257,
        6562,
        65793,
        390_626,
        1_686_434,
        5_764_802,
        16_843_009,
        43_053_283,
        100_390_882
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013957,
      opts: [],
      values: [
        1,
        513,
        19684,
        262_657,
        1_953_126,
        10_097_892,
        40_353_608,
        134_480_385,
        387_440_173,
        1_001_953_638
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013958,
      opts: [],
      values: [
        1,
        1025,
        59050,
        1_049_601,
        9_765_626,
        60_526_250,
        282_475_250,
        1_074_791_425,
        3_486_843_451,
        10_009_766_650
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013959,
      opts: [],
      values: [
        1,
        2049,
        177_148,
        4_196_353,
        48_828_126,
        362_976_252,
        1_977_326_744,
        8_594_130_945,
        31_381_236_757,
        100_048_830_174
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013960,
      opts: [],
      values: [
        1,
        4097,
        531_442,
        16_781_313,
        244_140_626,
        2_177_317_874,
        13_841_287_202,
        68_736_258_049,
        282_430_067_923,
        1_000_244_144_722
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013961,
      opts: [],
      values: [
        1,
        8193,
        1_594_324,
        67_117_057,
        1_220_703_126,
        13_062_296_532,
        96_889_010_408,
        549_822_930_945,
        2_541_867_422_653,
        10_001_220_711_318
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013962,
      opts: [],
      values: [
        1,
        16385,
        4_782_970,
        268_451_841,
        6_103_515_626,
        78_368_963_450,
        678_223_072_850,
        4_398_314_962_945,
        22_876_797_237_931,
        100_006_103_532_010
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013963,
      opts: [],
      values: [
        1,
        32769,
        14_348_908,
        1_073_774_593,
        30_517_578_126,
        470_199_366_252,
        4_747_561_509_944,
        35_185_445_863_425,
        205_891_146_443_557,
        1_000_030_517_610_894
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013964,
      opts: [],
      values: [
        1,
        65537,
        43_046_722,
        4_295_032_833,
        152_587_890_626,
        2_821_153_019_714,
        33_232_930_569_602,
        281_479_271_743_489,
        1_853_020_231_898_563,
        10_000_152_587_956_162
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013965,
      opts: [],
      values: [
        1,
        131_073,
        129_140_164,
        17_180_000_257,
        762_939_453_126,
        16_926_788_715_972,
        232_630_513_987_208,
        2_251_816_993_685_505,
        16_677_181_828_806_733,
        100_000_762_939_584_198
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013966,
      opts: [],
      values: [
        1,
        262_145,
        387_420_490,
        68_719_738_881,
        3_814_697_265_626,
        101_560_344_351_050,
        1_628_413_597_910_450,
        18_014_467_229_220_865,
        150_094_635_684_419_611,
        1_000_003_814_697_527_770
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013967,
      opts: [],
      values: [
        1,
        524_289,
        1_162_261_468,
        274_878_431_233,
        19_073_486_328_126,
        609_360_902_796_252,
        11_398_895_185_373_144,
        144_115_462_954_287_105,
        1_350_851_718_835_253_557,
        10_000_019_073_486_852_414
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013968,
      opts: [],
      values: [
        1,
        1_048_577,
        3_486_784_402,
        1_099_512_676_353,
        95_367_431_640_626,
        3_656_161_927_895_954,
        79_792_266_297_612_002,
        1_152_922_604_119_523_329,
        12_157_665_462_543_713_203,
        100_000_095_367_432_689_202
      ],
      finite: false,
      first_index: 1
    },

    # Sequence.OEIS.Factors
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a001597,
      opts: [],
      values: [1, 4, 8, 9, 16, 25, 27, 32, 36, 49],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a001694,
      opts: [],
      values: [1, 4, 8, 9, 16, 25, 27, 32, 36, 49],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a002182,
      opts: [],
      values: [1, 2, 4, 6, 12, 24, 36, 48, 60, 120],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a002473,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a003586,
      opts: [],
      values: [1, 2, 3, 4, 6, 8, 9, 12, 16, 18],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a005361,
      opts: [],
      values: [1, 1, 1, 2, 1, 1, 1, 3, 2, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a005934,
      opts: [],
      values: [1, 4, 8, 16, 32, 64, 128, 144, 216, 288],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a007434,
      opts: [],
      values: [1, 3, 8, 12, 24, 24, 48, 48, 72, 72],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a051037,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a051038,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a052486,
      opts: [],
      values: [72, 108, 200, 288, 392, 432, 500, 648, 675, 800],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a059376,
      opts: [],
      values: [1, 7, 26, 56, 124, 182, 342, 448, 702, 868],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a059377,
      opts: [],
      values: [1, 15, 80, 240, 624, 1200, 2400, 3840, 6480, 9360],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a059378,
      opts: [],
      values: [1, 31, 242, 992, 3124, 7502, 16806, 31744, 58806, 96844],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a065958,
      opts: [],
      values: [1, 5, 10, 20, 26, 50, 50, 80, 90, 130],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a065959,
      opts: [],
      values: [1, 9, 28, 72, 126, 252, 344, 576, 756, 1134],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a065960,
      opts: [],
      values: [1, 17, 82, 272, 626, 1394, 2402, 4352, 6642, 10642],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069091,
      opts: [],
      values: [1, 63, 728, 4032, 15624, 45864, 117648, 258048, 530712, 984312],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069092,
      opts: [],
      values: [1, 127, 2186, 16256, 78124, 277622, 823542, 2080768, 4780782, 9921748],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069093,
      opts: [],
      values: [1, 255, 6560, 65280, 390624, 1672800, 5764800, 16711680, 43040160, 99609120],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069094,
      opts: [],
      values: [1, 511, 19682, 261632, 1953124, 10057502, 40353606, 133955584, 387400806, 998046364],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069095,
      opts: [],
      values: [1, 1023, 59048, 1047552, 9765624, 60406104, 282475248, 1072693248, 3486725352, 9990233352],
      finite: false,
      first_index: 1
    },        
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a080197,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a080681,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a080682,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Factors,
      sequence: :a080683,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160889,
      opts: [],
      values: [1, 7, 13, 28, 31, 91, 57, 112, 117, 217],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160891,
      opts: [],
      values: [1, 15, 40, 120, 156, 600, 400, 960, 1080, 2340],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160893,
      opts: [],
      values: [1, 31, 121, 496, 781, 3751, 2801, 7936, 9801, 24211],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160895,
      opts: [],
      values: [1, 63, 364, 2016, 3906, 22932, 19608, 64512, 88452, 246078],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160897,
      opts: [],
      values: [1, 127, 1093, 8128, 19531, 138811, 137257, 520192, 796797, 2480437],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160908,
      opts: [],
      values: [1, 255, 3280, 32640, 97656, 836400, 960800, 4177920, 7173360, 24902280],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160953,
      opts: [],
      values: [1, 511, 9841, 130816, 488281, 5028751, 6725601, 33488896, 64566801, 249511591],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160957,
      opts: [],
      values: [1, 1023, 29524, 523776, 2441406, 30203052, 47079208, 268173312, 581120892, 2497558338],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160960,
      opts: [],
      values: [1, 2047, 88573, 2096128, 12207031, 181308931, 329554457, 2146435072, 5230147077, 24987792457],
      finite: false, 
      first_index: 1
    },

    # Sequence.Test
    %{
      module: Chunky.Sequence.Test,
      sequence: :whole_numbers,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :doubler,
      opts: [],
      values: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :last_two,
      opts: [],
      values: [2, 6, 8, 14, 22, 36, 58, 94, 152, 246],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :last_three,
      opts: [],
      values: [9, 15, 27, 51, 93, 171, 315, 579, 1065, 1959],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :cycle,
      opts: [],
      values: [4, -3, 0, 4, -3, 0, 4, -3, 0, 4],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_empty,
      opts: [],
      values: [],
      finite: true
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_small,
      opts: [],
      values: [1, 8, 27, 64, 125],
      finite: true
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_medium,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_large,
      opts: [],
      values: [1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009],
      finite: true
    }
  ]

  describe "sequence value tests" do
    test "take!/10" do
      @sequences
      |> Enum.each(fn seq_def ->
        # instantiate
        seq =
          case Sequence.create(seq_def.module, seq_def.sequence, seq_def.opts) do
            :no_such_sequence ->
              IO.puts("\n\nfailed sequence lookup #{seq_def.module}::#{seq_def.sequence}\n")
              :no_such_sequence

            %Sequence{} = s ->
              s
          end

        assert %Sequence{} = seq

        # take values
        values = seq |> Sequence.take!(10)

        # check values
        assert values == seq_def.values
        # assert(values == seq_def.values, Sequence.readable_name(seq))

        # check finite/infinite
        assert Sequence.is_finite?(seq) == seq_def.finite

        # let's check our first index
        first_index = Map.get(seq_def, :first_index, 0)

        assert (seq |> Sequence.next!()).index == first_index
      end)
    end
  end
end
