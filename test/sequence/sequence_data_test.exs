defmodule Chunky.SequenceDataTest do
  use ExUnit.Case, async: true

  @moduledoc """
  This set of tests verifies the data/layout of every sequence.
  """
  alias Chunky.Sequence
  doctest Chunky.Sequence.Basic
  doctest Chunky.Sequence.OEIS
  doctest Chunky.Sequence.OEIS.Core
  doctest Chunky.Sequence.OEIS.Sigma
  doctest Chunky.Sequence.OEIS.Factors
  doctest Chunky.Sequence.OEIS.Primes

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
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000001,
      opts: [],
      values: [0, 1, 1, 1, 2, 1, 2, 1, 5, 2],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000002,
      opts: [],
      values: [1, 2, 2, 1, 1, 2, 1, 2, 2, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000004,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000005,
      opts: [],
      values: [1, 2, 2, 3, 2, 4, 2, 4, 3, 4],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000007,
      opts: [],
      values: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      finite: false,
      first_index: 0
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
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000012,
      opts: [],
      values: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000027,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000032,
      opts: [],
      values: [2, 1, 3, 4, 7, 11, 18, 29, 47, 76],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000035,
      opts: [],
      values: [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000040,
      opts: [],
      values: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000041,
      opts: [],
      values: [1, 1, 2, 3, 5, 7, 11, 15, 22, 30],
      finite: false
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000043,
      opts: [],
      values: [2, 3, 5, 7, 13, 17, 19, 31, 61, 89],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000069,
      opts: [],
      values: [1, 2, 4, 7, 8, 11, 13, 14, 16, 19],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000079,
      opts: [],
      values: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512],
      finite: false
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000081,
      opts: [],
      values: [0, 1, 1, 2, 4, 9, 20, 48, 115, 286],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000085,
      opts: [],
      values: [1, 1, 2, 4, 10, 26, 76, 232, 764, 2620],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000105,
      opts: [],
      values: [1, 1, 1, 2, 5, 12, 35, 108, 369, 1285],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000108,
      opts: [],
      values: [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000109,
      opts: [],
      values: [1, 1, 1, 2, 5, 14, 50, 233, 1249, 7595],
      finite: true,
      first_index: 3
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000110,
      opts: [],
      values: [1, 1, 2, 5, 15, 52, 203, 877, 4140, 21147],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000111,
      opts: [],
      values: [1, 1, 1, 2, 5, 16, 61, 272, 1385, 7936],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000112,
      opts: [],
      values: [1, 1, 2, 5, 16, 63, 318, 2045, 16999, 183_231],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000120,
      opts: [],
      values: [0, 1, 1, 2, 1, 2, 2, 3, 1, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000124,
      opts: [],
      values: [1, 2, 4, 7, 11, 16, 22, 29, 37, 46],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000129,
      opts: [],
      values: [0, 1, 2, 5, 12, 29, 70, 169, 408, 985],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000142,
      opts: [],
      values: [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362_880],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000166,
      opts: [],
      values: [1, 0, 1, 2, 9, 44, 265, 1854, 14833, 133_496],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000169,
      opts: [],
      values: [1, 2, 9, 64, 625, 7776, 117_649, 2_097_152, 43_046_721, 1_000_000_000],
      finite: false,
      first_index: 1
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
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000204,
      opts: [],
      values: [1, 3, 4, 7, 11, 18, 29, 47, 76, 123],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000217,
      opts: [],
      values: [0, 1, 3, 6, 10, 15, 21, 28, 36, 45],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000219,
      opts: [],
      values: [1, 1, 3, 6, 13, 24, 48, 86, 160, 282],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000225,
      opts: [],
      values: [0, 1, 3, 7, 15, 31, 63, 127, 255, 511],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000244,
      opts: [],
      values: [1, 3, 9, 27, 81, 243, 729, 2187, 6561, 19683],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000262,
      opts: [],
      values: [1, 1, 3, 13, 73, 501, 4051, 37633, 394_353, 4_596_553],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000272,
      opts: [],
      values: [1, 1, 1, 3, 16, 125, 1296, 16807, 262_144, 4_782_969],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000290,
      opts: [],
      values: [0, 1, 4, 9, 16, 25, 36, 49, 64, 81],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000292,
      opts: [],
      values: [0, 1, 4, 10, 20, 35, 56, 84, 120, 165],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000302,
      opts: [],
      values: [1, 4, 16, 64, 256, 1024, 4096, 16384, 65536, 262_144],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000312,
      opts: [],
      values: [1, 1, 4, 27, 256, 3125, 46656, 823_543, 16_777_216, 387_420_489],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000326,
      opts: [],
      values: [0, 1, 5, 12, 22, 35, 51, 70, 92, 117],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000330,
      opts: [],
      values: [0, 1, 5, 14, 30, 55, 91, 140, 204, 285],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000364,
      opts: [],
      values: [
        1,
        1,
        5,
        61,
        1385,
        50521,
        2_702_765,
        199_360_981,
        19_391_512_145,
        2_404_879_675_441
      ],
      finite: false,
      first_index: 0
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
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000521,
      opts: [],
      values: [
        1,
        744,
        196_884,
        21_493_760,
        864_299_970,
        20_245_856_256,
        333_202_640_600,
        4_252_023_300_096,
        44_656_994_071_935,
        401_490_886_656_000
      ],
      finite: false,
      first_index: -1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000578,
      opts: [],
      values: [0, 1, 8, 27, 64, 125, 216, 343, 512, 729],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000583,
      opts: [],
      values: [0, 1, 16, 81, 256, 625, 1296, 2401, 4096, 6561],
      finite: false,
      first_index: 0
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
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000594,
      opts: [],
      values: [1, -24, 252, -1472, 4830, -6048, -16744, 84480, -113_643, -115_920],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000609,
      opts: [],
      values: [
        2,
        4,
        14,
        104,
        1882,
        94572,
        15_028_134,
        8_378_070_864,
        17_561_539_552_946,
        144_130_531_453_121_108
      ],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000670,
      opts: [],
      values: [1, 1, 3, 13, 75, 541, 4683, 47293, 545_835, 7_087_261],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000688,
      opts: [],
      values: [1, 1, 1, 2, 1, 1, 1, 3, 2, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000720,
      opts: [],
      values: [0, 1, 2, 2, 3, 3, 4, 4, 4, 4],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000796,
      opts: [],
      values: [3, 1, 4, 1, 5, 9, 2, 6, 5, 3],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000798,
      opts: [],
      values: [1, 1, 4, 29, 355, 6942, 209_527, 9_535_241, 642_779_354, 63_260_289_423],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000959,
      opts: [],
      values: [1, 3, 7, 9, 13, 15, 21, 25, 31, 33],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000961,
      opts: [],
      values: [1, 2, 3, 4, 5, 7, 8, 9, 11, 13],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000984,
      opts: [],
      values: [1, 2, 6, 20, 70, 252, 924, 3432, 12870, 48620],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001003,
      opts: [],
      values: [1, 1, 3, 11, 45, 197, 903, 4279, 20793, 103_049],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001006,
      opts: [],
      values: [1, 1, 2, 4, 9, 21, 51, 127, 323, 835],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001045,
      opts: [],
      values: [0, 1, 1, 3, 5, 11, 21, 43, 85, 171],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001055,
      opts: [],
      values: [1, 1, 1, 2, 1, 2, 1, 3, 2, 2],
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
      sequence: :a001190,
      opts: [],
      values: [0, 1, 1, 1, 2, 3, 6, 11, 23, 46],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001221,
      opts: [],
      values: [0, 1, 1, 1, 1, 2, 1, 1, 1, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001222,
      opts: [],
      values: [0, 1, 1, 2, 1, 2, 1, 3, 2, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001227,
      opts: [],
      values: [1, 1, 2, 1, 2, 2, 2, 1, 3, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001358,
      opts: [],
      values: [4, 6, 9, 10, 14, 15, 21, 22, 25, 26],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001477,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001511,
      opts: [],
      values: [1, 2, 1, 3, 1, 2, 1, 4, 1, 2],
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
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002106,
      opts: [],
      values: [1, 1, 2, 5, 5, 16, 7, 50, 34, 45],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002654,
      opts: [],
      values: [1, 1, 0, 1, 2, 0, 0, 1, 1, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a003094,
      opts: [],
      values: [1, 1, 1, 2, 6, 20, 99, 646, 5974, 71885],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a003484,
      opts: [],
      values: [1, 2, 1, 4, 1, 2, 1, 8, 1, 2],
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
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a005117,
      opts: [],
      values: [1, 2, 3, 5, 6, 7, 10, 11, 13, 14],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a005470,
      opts: [],
      values: [1, 1, 2, 4, 11, 33, 142, 822, 6966, 79853],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a006530,
      opts: [],
      values: [1, 2, 3, 2, 5, 3, 7, 2, 3, 5],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a006966,
      opts: [],
      values: [1, 1, 1, 1, 2, 5, 15, 53, 222, 1078],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a008292,
      opts: [],
      values: [1, 1, 1, 1, 4, 1, 1, 11, 11, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a008683,
      opts: [],
      values: [1, -1, -1, 0, -1, 1, -1, 0, 0, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a020639,
      opts: [],
      values: [1, 2, 3, 2, 5, 2, 7, 2, 3, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a055512,
      opts: [],
      values: [1, 1, 2, 6, 36, 380, 6390, 157_962, 5_396_888, 243_179_064],
      finite: true,
      first_index: 0
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

    # Sequence.OEIS.Primes
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a162511,
      opts: [],
      values: [1, 1, 1, -1, 1, 1, 1, 1, -1, 1],
      finite: false,
      first_index: 1
    },

    # Sequence.OEIS.Factors
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a000037,
      opts: [],
      values: [2, 3, 5, 6, 7, 8, 10, 11, 12, 13],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a000977,
      opts: [],
      values: [30, 42, 60, 66, 70, 78, 84, 90, 102, 105],
      finite: false,
      first_index: 1
    },
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
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a001826,
      opts: [],
      values: [1, 1, 1, 1, 2, 1, 1, 1, 2, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a001842,
      opts: [],
      values: [0, 0, 0, 1, 0, 0, 1, 1, 0, 1],
      finite: false,
      first_index: 0
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
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a004709,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 9, 10, 11],
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
      sequence: :a006881,
      opts: [],
      values: [6, 10, 14, 15, 21, 22, 26, 33, 34, 35],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a007018,
      opts: [],
      values: [
        1,
        2,
        6,
        42,
        1806,
        3_263_442,
        10_650_056_950_806,
        113_423_713_055_421_844_361_000_442,
        12_864_938_683_278_671_740_537_145_998_360_961_546_653_259_485_195_806,
        165_506_647_324_519_964_198_468_195_444_439_180_017_513_152_706_377_497_841_851_388_766_535_868_639_572_406_808_911_988_131_737_645_185_442
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a007304,
      opts: [],
      values: [30, 42, 66, 70, 78, 102, 105, 110, 114, 130],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a007412,
      opts: [],
      values: [2, 3, 4, 5, 6, 7, 9, 10, 11, 12],
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
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a007774,
      opts: [],
      values: [6, 10, 12, 14, 15, 18, 20, 21, 22, 24],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a007947,
      opts: [],
      values: [1, 2, 3, 2, 5, 6, 7, 2, 3, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a008966,
      opts: [],
      values: [1, 1, 1, 0, 1, 1, 1, 0, 0, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a013929,
      opts: [],
      values: [4, 8, 9, 12, 16, 18, 20, 24, 25, 27],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a014612,
      opts: [],
      values: [8, 12, 18, 20, 27, 28, 30, 42, 44, 45],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a014613,
      opts: [],
      values: [16, 24, 36, 40, 54, 56, 60, 81, 84, 88],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a014614,
      opts: [],
      values: [32, 48, 72, 80, 108, 112, 120, 162, 168, 176],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a030513,
      opts: [],
      values: [6, 8, 10, 14, 15, 21, 22, 26, 27, 33],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a030515,
      opts: [],
      values: [12, 18, 20, 28, 32, 44, 45, 50, 52, 63],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a033273,
      opts: [],
      values: [1, 1, 1, 2, 1, 2, 1, 3, 2, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a033942,
      opts: [],
      values: [8, 12, 16, 18, 20, 24, 27, 28, 30, 32],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a033987,
      opts: [],
      values: [16, 24, 32, 36, 40, 48, 54, 56, 60, 64],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a033992,
      opts: [],
      values: [30, 42, 60, 66, 70, 78, 84, 90, 102, 105],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a033993,
      opts: [],
      values: [210, 330, 390, 420, 462, 510, 546, 570, 630, 660],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a036537,
      opts: [],
      values: [1, 2, 3, 5, 6, 7, 8, 10, 11, 13],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a037143,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 9, 10, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a038109,
      opts: [],
      values: [4, 9, 12, 18, 20, 25, 28, 36, 44, 45],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a039956,
      opts: [],
      values: [2, 6, 10, 14, 22, 26, 30, 34, 38, 42],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046099,
      opts: [],
      values: [8, 16, 24, 27, 32, 40, 48, 54, 56, 64],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046306,
      opts: [],
      values: [64, 96, 144, 160, 216, 224, 240, 324, 336, 352],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046308,
      opts: [],
      values: [128, 192, 288, 320, 432, 448, 480, 648, 672, 704],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046310,
      opts: [],
      values: [256, 384, 576, 640, 864, 896, 960, 1296, 1344, 1408],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046312,
      opts: [],
      values: [512, 768, 1152, 1280, 1728, 1792, 1920, 2592, 2688, 2816],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046314,
      opts: [],
      values: [1024, 1536, 2304, 2560, 3456, 3584, 3840, 5184, 5376, 5632],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046321,
      opts: [],
      values: [6561, 10935, 15309, 18225, 24057, 25515, 28431, 30375, 35721, 37179],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046386,
      opts: [],
      values: [210, 330, 390, 462, 510, 546, 570, 690, 714, 770],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046387,
      opts: [],
      values: [2310, 2730, 3570, 3990, 4290, 4830, 5610, 6006, 6090, 6270],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046660,
      opts: [],
      values: [0, 0, 0, 1, 0, 0, 0, 2, 1, 0],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a048272,
      opts: [],
      values: [1, 0, 2, -1, 2, 0, 2, -2, 3, 0],
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
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a051270,
      opts: [],
      values: [2310, 2730, 3570, 3990, 4290, 4620, 4830, 5460, 5610, 6006],
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
      sequence: :a056911,
      opts: [],
      values: [1, 3, 5, 7, 11, 13, 15, 17, 19, 21],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a059269,
      opts: [],
      values: [4, 9, 12, 18, 20, 25, 28, 32, 36, 44],
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
      sequence: :a067259,
      opts: [],
      values: [4, 9, 12, 18, 20, 25, 28, 36, 44, 45],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a067885,
      opts: [],
      values: [30030, 39270, 43890, 46410, 51870, 53130, 62790, 66990, 67830, 71610],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069091,
      opts: [],
      values: [1, 63, 728, 4032, 15624, 45864, 117_648, 258_048, 530_712, 984_312],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069092,
      opts: [],
      values: [1, 127, 2186, 16256, 78124, 277_622, 823_542, 2_080_768, 4_780_782, 9_921_748],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069093,
      opts: [],
      values: [
        1,
        255,
        6560,
        65280,
        390_624,
        1_672_800,
        5_764_800,
        16_711_680,
        43_040_160,
        99_609_120
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069094,
      opts: [],
      values: [
        1,
        511,
        19682,
        261_632,
        1_953_124,
        10_057_502,
        40_353_606,
        133_955_584,
        387_400_806,
        998_046_364
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a069095,
      opts: [],
      values: [
        1,
        1023,
        59048,
        1_047_552,
        9_765_624,
        60_406_104,
        282_475_248,
        1_072_693_248,
        3_486_725_352,
        9_990_233_352
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a074969,
      opts: [],
      values: [30030, 39270, 43890, 46410, 51870, 53130, 60060, 62790, 66990, 67830],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a076479,
      opts: [],
      values: [1, -1, -1, -1, -1, 1, -1, -1, -1, 1],
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
      sequence: :a117805,
      opts: [],
      values: [
        3,
        6,
        30,
        870,
        756_030,
        571_580_604_870,
        326_704_387_862_983_487_112_030,
        106_735_757_048_926_752_040_856_495_274_871_386_126_283_608_870,
        11_392_521_832_807_516_835_658_052_968_328_096_177_131_218_666_695_418_950_023_483_907_701_862_019_030_266_123_104_859_068_030,
        129_789_553_710_995_942_584_535_932_496_451_675_399_852_648_220_377_603_870_312_675_341_032_212_198_287_113_245_560_612_086_017_910_022_423_113_676_287_523_392_956_911_461_849_060_436_665_838_686_793_696_809_116_084_927_033_287_853_405_015_309_012_870
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a123321,
      opts: [],
      values: [510_510, 570_570, 690_690],
      finite: false,
      first_index: 1,
      take_values: 3
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a123322,
      opts: [],
      values: [9_699_690],
      finite: false,
      first_index: 1,
      take_values: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a130897,
      opts: [],
      values: [16, 48, 80, 81, 112, 144, 162, 176, 208, 240],
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
      values: [1, 63, 364, 2016, 3906, 22932, 19608, 64512, 88452, 246_078],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160897,
      opts: [],
      values: [1, 127, 1093, 8128, 19531, 138_811, 137_257, 520_192, 796_797, 2_480_437],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160908,
      opts: [],
      values: [1, 255, 3280, 32640, 97656, 836_400, 960_800, 4_177_920, 7_173_360, 24_902_280],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160953,
      opts: [],
      values: [
        1,
        511,
        9841,
        130_816,
        488_281,
        5_028_751,
        6_725_601,
        33_488_896,
        64_566_801,
        249_511_591
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160957,
      opts: [],
      values: [
        1,
        1023,
        29524,
        523_776,
        2_441_406,
        30_203_052,
        47_079_208,
        268_173_312,
        581_120_892,
        2_497_558_338
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a160960,
      opts: [],
      values: [
        1,
        2047,
        88573,
        2_096_128,
        12_207_031,
        181_308_931,
        329_554_457,
        2_146_435_072,
        5_230_147_077,
        24_987_792_457
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a162643,
      opts: [],
      values: [4, 9, 12, 16, 18, 20, 25, 28, 32, 36],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a209061,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a211337,
      opts: [],
      values: [1, 6, 8, 10, 14, 15, 21, 22, 26, 27],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a211338,
      opts: [],
      values: [2, 3, 5, 7, 11, 13, 16, 17, 19, 23],
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
        take_size = Map.get(seq_def, :take_values, 10)
        values = seq |> Sequence.take!(take_size)

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
