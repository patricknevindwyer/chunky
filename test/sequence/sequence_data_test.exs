defmodule Chunky.SequenceDataTest do
  use ExUnit.Case, async: true

  @moduledoc """
  This set of tests verifies the data/layout of every sequence.
  """
  alias Chunky.Sequence
  doctest Chunky.Sequence.Basic
  doctest Chunky.Sequence.OEIS
  doctest Chunky.Sequence.OEIS.Combinatorics
  doctest Chunky.Sequence.OEIS.Constants
  doctest Chunky.Sequence.OEIS.Core
  doctest Chunky.Sequence.OEIS.Sigma
  doctest Chunky.Sequence.OEIS.Factors
  doctest Chunky.Sequence.OEIS.Multiples
  doctest Chunky.Sequence.OEIS.Primes
  doctest Chunky.Sequence.OEIS.Powers
  doctest Chunky.Sequence.OEIS.Repr

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
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000045,
      opts: [],
      values: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
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
      values: [1, 1, 2, 4, 10, 26, 76, 232, 764, 2_620],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000105,
      opts: [],
      values: [1, 1, 1, 2, 5, 12, 35, 108, 369, 1_285],
      finite: true,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000108,
      opts: [],
      values: [1, 1, 2, 5, 14, 42, 132, 429, 1_430, 4_862],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000109,
      opts: [],
      values: [1, 1, 1, 2, 5, 14, 50, 233, 1_249, 7_595],
      finite: true,
      first_index: 3
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000110,
      opts: [],
      values: [1, 1, 2, 5, 15, 52, 203, 877, 4_140, 21_147],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000111,
      opts: [],
      values: [1, 1, 1, 2, 5, 16, 61, 272, 1_385, 7_936],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000112,
      opts: [],
      values: [1, 1, 2, 5, 16, 63, 318, 2_045, 16_999, 183_231],
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
      values: [1, 1, 2, 6, 24, 120, 720, 5_040, 40_320, 362_880],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000166,
      opts: [],
      values: [1, 0, 1, 2, 9, 44, 265, 1_854, 14_833, 133_496],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000169,
      opts: [],
      values: [1, 2, 9, 64, 625, 7_776, 117_649, 2_097_152, 43_046_721, 1_000_000_000],
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
      sequence: :a002808,
      opts: [],
      values: [4, 6, 8, 9, 10, 12, 14, 15, 16, 18],
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
      sequence: :a005843,
      opts: [],
      values: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18],
      finite: false,
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
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001489,
      opts: [],
      values: [0, -1, -2, -3, -4, -5, -6, -7, -8, -9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001147,
      opts: [],
      values: [1, 1, 3, 15, 105, 945, 10395, 135_135, 2_027_025, 34_459_425],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001405,
      opts: [],
      values: [1, 1, 2, 3, 6, 10, 20, 35, 70, 126],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001519,
      opts: [],
      values: [1, 1, 2, 5, 13, 34, 89, 233, 610, 1597],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001700,
      opts: [],
      values: [1, 3, 10, 35, 126, 462, 1716, 6435, 24310, 92378],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001764,
      opts: [],
      values: [1, 1, 3, 12, 55, 273, 1428, 7752, 43263, 246_675],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a006882,
      opts: [],
      values: [1, 1, 2, 3, 8, 15, 48, 105, 384, 945],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001906,
      opts: [],
      values: [0, 1, 3, 8, 21, 55, 144, 377, 987, 2584],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001969,
      opts: [],
      values: [0, 3, 5, 6, 9, 10, 12, 15, 17, 18],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002113,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002275,
      opts: [],
      values: [0, 1, 11, 111, 1111, 11111, 111_111, 1_111_111, 11_111_111, 111_111_111],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002378,
      opts: [],
      values: [0, 2, 6, 12, 20, 30, 42, 56, 72, 90],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002487,
      opts: [],
      values: [0, 1, 1, 2, 1, 3, 2, 3, 1, 4],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002620,
      opts: [],
      values: [0, 0, 1, 2, 4, 6, 9, 12, 16, 20],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a003418,
      opts: [],
      values: [1, 1, 2, 6, 12, 60, 60, 420, 840, 2520],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a004526,
      opts: [],
      values: [0, 0, 1, 1, 2, 2, 3, 3, 4, 4],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a005408,
      opts: [],
      values: [1, 3, 5, 7, 9, 11, 13, 15, 17, 19],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a006318,
      opts: [],
      values: [1, 2, 6, 22, 90, 394, 1806, 8558, 41586, 206_098],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a007318,
      opts: [],
      values: [1, 1, 1, 1, 2, 1, 1, 3, 3, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a008277,
      opts: [],
      values: [1, 1, 1, 1, 3, 1, 1, 7, 6, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a018252,
      opts: [],
      values: [1, 4, 6, 8, 9, 10, 12, 14, 15, 16],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a027642,
      opts: [],
      values: [1, 2, 6, 1, 30, 1, 42, 1, 30, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a049310,
      opts: [],
      values: [1, 0, 1, -1, 0, 1, 0, -2, 0, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a070939,
      opts: [],
      values: [1, 1, 2, 2, 3, 3, 3, 3, 4, 4],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000029,
      opts: [],
      values: [1, 2, 3, 4, 6, 8, 13, 18, 30, 46],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000031,
      opts: [],
      values: [1, 2, 3, 4, 6, 8, 14, 20, 36, 60],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000048,
      opts: [],
      values: [1, 1, 1, 1, 2, 3, 5, 9, 16, 28],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000123,
      opts: [],
      values: [1, 2, 4, 6, 10, 14, 20, 26, 36, 46],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000161,
      opts: [],
      values: [1, 1, 1, 0, 1, 1, 0, 0, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a000311,
      opts: [],
      values: [0, 1, 1, 4, 26, 236, 2752, 39208, 660_032, 12_818_912],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001478,
      opts: [],
      values: [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002531,
      opts: [],
      values: [1, 1, 2, 5, 7, 19, 26, 71, 97, 265],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a074206,
      opts: [],
      values: [0, 1, 1, 1, 2, 1, 3, 1, 4, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001057,
      opts: [],
      values: [0, 1, -1, 2, -2, 3, -3, 4, -4, 5],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001333,
      opts: [],
      values: [1, 1, 3, 7, 17, 41, 99, 239, 577, 1393],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001481,
      opts: [],
      values: [0, 1, 2, 4, 5, 8, 9, 10, 13, 16],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a001699,
      opts: [],
      values: [
        1,
        1,
        3,
        21,
        651,
        457_653,
        210_065_930_571,
        44_127_887_745_696_109_598_901,
        1_947_270_476_915_296_449_559_659_317_606_103_024_276_803_403,
        3_791_862_310_265_926_082_868_235_028_027_893_277_370_233_150_300_118_107_846_437_701_158_064_808_916_492_244_872_560_821
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002033,
      opts: [],
      values: [1, 1, 1, 2, 1, 3, 1, 4, 2, 3],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002110,
      opts: [],
      values: [1, 2, 6, 30, 210, 2310, 30030, 510_510, 9_699_690, 223_092_870],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a002530,
      opts: [],
      values: [0, 1, 1, 3, 4, 11, 15, 41, 56, 153],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a005588,
      opts: [],
      values: [
        2,
        7,
        52,
        2133,
        2_590_407,
        3_374_951_541_062,
        5_695_183_504_479_116_640_376_509,
        16_217_557_574_922_386_301_420_514_191_523_784_895_639_577_710_480,
        131_504_586_847_961_235_687_181_874_578_063_117_114_329_409_897_550_318_273_792_033_024_340_388_219_235_081_096_658_023_517_076_950
      ],
      take_values: 9,
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a005811,
      opts: [],
      values: [0, 1, 2, 1, 2, 3, 2, 1, 2, 3],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a006894,
      opts: [],
      values: [
        1,
        2,
        4,
        11,
        67,
        2279,
        2_598_061,
        3_374_961_778_892,
        5_695_183_504_492_614_029_263_279,
        16_217_557_574_922_386_301_420_536_972_254_869_595_782_763_547_561
      ],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Core,
      sequence: :a008279,
      opts: [],
      values: [1, 1, 1, 1, 2, 2, 1, 3, 6, 6],
      finite: false,
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
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a001567,
      opts: [],
      values: [341, 561, 645, 1105, 1387, 1729, 1905, 2047, 2465, 2701],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a005935,
      opts: [],
      values: [91, 121, 286, 671, 703, 949, 1105, 1541, 1729, 1891],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a005936,
      opts: [],
      values: [4, 124, 217, 561, 781, 1541, 1729, 1891, 2821, 4123],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a005937,
      opts: [],
      values: [35, 185, 217, 301, 481, 1105, 1111, 1261, 1333, 1729],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a005938,
      opts: [],
      values: [6, 25, 325, 561, 703, 817, 1105, 1825, 2101, 2353],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a005939,
      opts: [],
      values: [9, 33, 91, 99, 259, 451, 481, 561, 657, 703],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020136,
      opts: [],
      values: [15, 85, 91, 341, 435, 451, 561, 645, 703, 1105],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020137,
      opts: [],
      values: [9, 21, 45, 63, 65, 105, 117, 133, 153, 231],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020138,
      opts: [],
      values: [4, 8, 28, 52, 91, 121, 205, 286, 364, 511],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020139,
      opts: [],
      values: [10, 15, 70, 133, 190, 259, 305, 481, 645, 703],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020140,
      opts: [],
      values: [65, 91, 133, 143, 145, 247, 377, 385, 703, 1045],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020141,
      opts: [],
      values: [4, 6, 12, 21, 85, 105, 231, 244, 276, 357],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020142,
      opts: [],
      values: [15, 39, 65, 195, 481, 561, 781, 793, 841, 985],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020143,
      opts: [],
      values: [14, 341, 742, 946, 1477, 1541, 1687, 1729, 1891, 1921],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020144,
      opts: [],
      values: [15, 51, 85, 91, 255, 341, 435, 451, 561, 595],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020145,
      opts: [],
      values: [4, 8, 9, 16, 45, 91, 145, 261, 781, 1111],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020146,
      opts: [],
      values: [25, 49, 65, 85, 133, 221, 323, 325, 343, 425],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020147,
      opts: [],
      values: [6, 9, 15, 18, 45, 49, 153, 169, 343, 561],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020148,
      opts: [],
      values: [21, 57, 133, 231, 399, 561, 671, 861, 889, 1281],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020149,
      opts: [],
      values: [4, 10, 20, 55, 65, 85, 221, 703, 793, 1045],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020150,
      opts: [],
      values: [21, 69, 91, 105, 161, 169, 345, 483, 485, 645],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020151,
      opts: [],
      values: [22, 33, 91, 154, 165, 169, 265, 341, 385, 451],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020152,
      opts: [],
      values: [25, 115, 175, 325, 553, 575, 805, 949, 1105, 1541],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020153,
      opts: [],
      values: [4, 6, 8, 12, 24, 28, 39, 66, 91, 124],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020154,
      opts: [],
      values: [9, 15, 25, 27, 45, 75, 133, 135, 153, 175],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020155,
      opts: [],
      values: [26, 65, 91, 121, 133, 247, 259, 286, 341, 365],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020156,
      opts: [],
      values: [9, 27, 45, 87, 145, 261, 361, 529, 561, 703],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020157,
      opts: [],
      values: [4, 14, 15, 21, 28, 35, 52, 91, 105, 231],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020158,
      opts: [],
      values: [49, 91, 133, 217, 247, 341, 403, 469, 493, 589],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020159,
      opts: [],
      values: [6, 10, 15, 30, 49, 65, 66, 133, 185, 451],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020160,
      opts: [],
      values: [25, 33, 93, 165, 205, 217, 325, 341, 385, 425],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020161,
      opts: [],
      values: [4, 8, 16, 32, 85, 496, 545, 703, 1057, 1105],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020162,
      opts: [],
      values: [15, 21, 33, 35, 55, 65, 77, 105, 165, 231],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020163,
      opts: [],
      values: [9, 34, 51, 153, 341, 442, 561, 782, 1247, 1261],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020164,
      opts: [],
      values: [35, 91, 185, 217, 259, 301, 403, 481, 559, 679],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020165,
      opts: [],
      values: [4, 6, 9, 12, 18, 28, 36, 45, 57, 66],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020166,
      opts: [],
      values: [39, 65, 85, 91, 111, 185, 221, 259, 289, 469],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020167,
      opts: [],
      values: [38, 95, 133, 341, 1561, 1834, 1891, 2047, 2101, 2465],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020168,
      opts: [],
      values: [39, 91, 121, 123, 289, 451, 533, 561, 703, 793],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020169,
      opts: [],
      values: [4, 8, 10, 15, 20, 21, 35, 40, 105, 145],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020170,
      opts: [],
      values: [205, 451, 529, 559, 697, 1105, 1247, 1441, 1541, 1763],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020171,
      opts: [],
      values: [6, 14, 21, 25, 33, 42, 77, 91, 105, 165],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020172,
      opts: [],
      values: [9, 15, 45, 65, 117, 129, 215, 301, 369, 387],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020173,
      opts: [],
      values: [4, 22, 44, 76, 133, 253, 418, 436, 451, 481],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020174,
      opts: [],
      values: [9, 15, 45, 133, 141, 145, 235, 261, 341, 365],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020175,
      opts: [],
      values: [46, 65, 69, 85, 221, 259, 341, 345, 427, 481],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020176,
      opts: [],
      values: [49, 91, 245, 259, 329, 427, 481, 637, 703, 793],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020177,
      opts: [],
      values: [4, 6, 8, 12, 15, 16, 24, 25, 48, 66],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020178,
      opts: [],
      values: [21, 49, 51, 119, 133, 147, 231, 301, 357, 561],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020179,
      opts: [],
      values: [10, 25, 50, 65, 70, 91, 175, 325, 451, 481],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020180,
      opts: [],
      values: [51, 85, 159, 265, 561, 671, 901, 1513, 1541, 1891],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020181,
      opts: [],
      values: [4, 9, 26, 27, 28, 39, 45, 52, 65, 91],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020182,
      opts: [],
      values: [55, 265, 341, 361, 385, 583, 781, 1045, 1105, 1247],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020183,
      opts: [],
      values: [6, 9, 18, 21, 27, 54, 63, 91, 153, 189],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020184,
      opts: [],
      values: [15, 33, 55, 57, 95, 165, 209, 247, 285, 403],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020185,
      opts: [],
      values: [4, 8, 14, 25, 28, 56, 65, 125, 145, 203],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020186,
      opts: [],
      values: [57, 133, 177, 285, 341, 561, 671, 703, 885, 1105],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020187,
      opts: [],
      values: [15, 58, 87, 145, 435, 451, 561, 645, 946, 1015],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020188,
      opts: [],
      values: [341, 427, 481, 671, 793, 841, 1729, 1891, 2257, 2821],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020189,
      opts: [],
      values: [4, 6, 10, 12, 15, 20, 30, 52, 60, 91],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020190,
      opts: [],
      values: [9, 21, 45, 63, 91, 105, 183, 231, 305, 361],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020191,
      opts: [],
      values: [62, 341, 481, 529, 703, 841, 1105, 1147, 1417, 1985],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020192,
      opts: [],
      values: [9, 15, 21, 35, 39, 45, 63, 65, 85, 91],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020193,
      opts: [],
      values: [4, 8, 16, 28, 32, 33, 64, 112, 133, 232],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020194,
      opts: [],
      values: [65, 91, 335, 469, 481, 871, 1105, 1271, 1541, 1729],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020195,
      opts: [],
      values: [6, 22, 33, 49, 51, 66, 85, 154, 165, 187],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020196,
      opts: [],
      values: [25, 49, 69, 91, 125, 133, 185, 201, 217, 247],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020197,
      opts: [],
      values: [4, 34, 35, 68, 85, 91, 119, 133, 247, 361],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020198,
      opts: [],
      values: [69, 169, 213, 341, 377, 561, 671, 703, 781, 897],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020199,
      opts: [],
      values: [9, 10, 14, 15, 21, 35, 45, 63, 70, 105],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020200,
      opts: [],
      values: [85, 305, 365, 451, 511, 781, 793, 949, 1037, 1105],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020201,
      opts: [],
      values: [4, 6, 8, 9, 12, 18, 24, 36, 45, 65],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020202,
      opts: [],
      values: [15, 25, 75, 91, 175, 219, 325, 365, 427, 435],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020203,
      opts: [],
      values: [74, 91, 133, 247, 259, 289, 427, 481, 703, 793],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020204,
      opts: [],
      values: [15, 21, 25, 33, 35, 55, 75, 77, 105, 165],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020205,
      opts: [],
      values: [4, 38, 39, 57, 65, 76, 247, 285, 703, 741],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020206,
      opts: [],
      values: [77, 341, 385, 451, 553, 703, 869, 1045, 1247, 1271],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020207,
      opts: [],
      values: [6, 15, 26, 39, 49, 65, 78, 91, 195, 301],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020208,
      opts: [],
      values: [9, 27, 49, 81, 169, 237, 301, 333, 481, 553],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020209,
      opts: [],
      values: [4, 8, 10, 16, 20, 28, 40, 52, 70, 80],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020210,
      opts: [],
      values: [9, 25, 27, 45, 81, 91, 225, 249, 325, 405],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020211,
      opts: [],
      values: [21, 65, 82, 105, 123, 133, 205, 231, 265, 273],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020212,
      opts: [],
      values: [85, 415, 481, 703, 1105, 1111, 1411, 1615, 2465, 2501],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020213,
      opts: [],
      values: [4, 6, 12, 14, 21, 28, 42, 84, 129, 231],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020214,
      opts: [],
      values: [15, 51, 65, 85, 87, 145, 221, 255, 377, 435],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020215,
      opts: [],
      values: [86, 91, 133, 217, 247, 301, 385, 403, 473, 559],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020216,
      opts: [],
      values: [87, 91, 133, 145, 217, 247, 267, 403, 445, 481],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020217,
      opts: [],
      values: [4, 8, 9, 15, 22, 33, 44, 45, 55, 85],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020218,
      opts: [],
      values: [91, 623, 703, 793, 1001, 1157, 1729, 2047, 2413, 2821],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020219,
      opts: [],
      values: [6, 9, 10, 15, 18, 30, 45, 66, 69, 90],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020220,
      opts: [],
      values: [21, 39, 65, 91, 93, 105, 217, 231, 273, 301],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020221,
      opts: [],
      values: [4, 25, 28, 46, 92, 301, 322, 325, 425, 506],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020222,
      opts: [],
      values: [15, 57, 91, 93, 95, 121, 133, 155, 217, 247],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020223,
      opts: [],
      values: [91, 94, 141, 341, 561, 658, 671, 742, 1111, 1551],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020224,
      opts: [],
      values: [65, 95, 133, 469, 485, 679, 781, 973, 1105, 1261],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020225,
      opts: [],
      values: [4, 6, 8, 12, 16, 21, 24, 32, 48, 49],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020226,
      opts: [],
      values: [9, 33, 45, 85, 99, 153, 165, 291, 451, 485],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020227,
      opts: [],
      values: [14, 25, 35, 49, 65, 98, 145, 169, 175, 217],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Primes,
      sequence: :a020228,
      opts: [],
      values: [9, 33, 91, 99, 153, 259, 303, 451, 481, 561],
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
      sequence: :a018253,
      opts: [],
      values: [1, 2, 3, 4, 6, 8, 12, 24],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018256,
      opts: [],
      values: [1, 2, 3, 4, 6, 9, 12, 18, 36],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018261,
      opts: [],
      values: [1, 2, 3, 4, 6, 8, 12, 16, 24, 48],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018266,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 10, 12, 15, 20],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018293,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 8, 10, 12, 15],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018321,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 9, 10, 12, 15],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018350,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 8, 10, 12, 15],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018412,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018609,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a018676,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 10, 12],
      finite: true,
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
      sequence: :a165412,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178858,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178859,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178860,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178861,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178862,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178863,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178864,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178877,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 9, 10, 12],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a178878,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 10, 12],
      finite: true,
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
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a001414,
      opts: [],
      values: [0, 2, 3, 4, 5, 5, 7, 6, 6, 7],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046759,
      opts: [],
      values: [125, 128, 243, 256, 343, 512, 625, 729, 1024, 1029],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046760,
      opts: [],
      values: [4, 6, 8, 9, 12, 18, 20, 22, 24, 26],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Factors,
      sequence: :a046758,
      opts: [],
      values: [1, 2, 3, 5, 7, 10, 11, 13, 14, 15],
      finite: false,
      first_index: 1
    },

    # Sequence.OEIS.Powers
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a000051,
      opts: [],
      values: [2, 3, 5, 9, 17, 33, 65, 129, 257, 513],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a000351,
      opts: [],
      values: [1, 5, 25, 125, 625, 3125, 15625, 78125, 390_625, 1_953_125],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a000400,
      opts: [],
      values: [1, 6, 36, 216, 1296, 7776, 46656, 279_936, 1_679_616, 10_077_696],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a000420,
      opts: [],
      values: [1, 7, 49, 343, 2401, 16807, 117_649, 823_543, 5_764_801, 40_353_607],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001018,
      opts: [],
      values: [1, 8, 64, 512, 4096, 32768, 262_144, 2_097_152, 16_777_216, 134_217_728],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001019,
      opts: [],
      values: [1, 9, 81, 729, 6561, 59049, 531_441, 4_782_969, 43_046_721, 387_420_489],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001020,
      opts: [],
      values: [
        1,
        11,
        121,
        1331,
        14641,
        161_051,
        1_771_561,
        19_487_171,
        214_358_881,
        2_357_947_691
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001021,
      opts: [],
      values: [
        1,
        12,
        144,
        1728,
        20736,
        248_832,
        2_985_984,
        35_831_808,
        429_981_696,
        5_159_780_352
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001022,
      opts: [],
      values: [
        1,
        13,
        169,
        2197,
        28561,
        371_293,
        4_826_809,
        62_748_517,
        815_730_721,
        10_604_499_373
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001023,
      opts: [],
      values: [
        1,
        14,
        196,
        2744,
        38416,
        537_824,
        7_529_536,
        105_413_504,
        1_475_789_056,
        20_661_046_784
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001024,
      opts: [],
      values: [
        1,
        15,
        225,
        3375,
        50625,
        759_375,
        11_390_625,
        170_859_375,
        2_562_890_625,
        38_443_359_375
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001025,
      opts: [],
      values: [
        1,
        16,
        256,
        4096,
        65536,
        1_048_576,
        16_777_216,
        268_435_456,
        4_294_967_296,
        68_719_476_736
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001026,
      opts: [],
      values: [
        1,
        17,
        289,
        4913,
        83521,
        1_419_857,
        24_137_569,
        410_338_673,
        6_975_757_441,
        118_587_876_497
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001027,
      opts: [],
      values: [
        1,
        18,
        324,
        5832,
        104_976,
        1_889_568,
        34_012_224,
        612_220_032,
        11_019_960_576,
        198_359_290_368
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a001029,
      opts: [],
      values: [
        1,
        19,
        361,
        6859,
        130_321,
        2_476_099,
        47_045_881,
        893_871_739,
        16_983_563_041,
        322_687_697_779
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009964,
      opts: [],
      values: [
        1,
        20,
        400,
        8000,
        160_000,
        3_200_000,
        64_000_000,
        1_280_000_000,
        25_600_000_000,
        512_000_000_000
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009965,
      opts: [],
      values: [
        1,
        21,
        441,
        9261,
        194_481,
        4_084_101,
        85_766_121,
        1_801_088_541,
        37_822_859_361,
        794_280_046_581
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009966,
      opts: [],
      values: [
        1,
        22,
        484,
        10648,
        234_256,
        5_153_632,
        113_379_904,
        2_494_357_888,
        54_875_873_536,
        1_207_269_217_792
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009967,
      opts: [],
      values: [
        1,
        23,
        529,
        12167,
        279_841,
        6_436_343,
        148_035_889,
        3_404_825_447,
        78_310_985_281,
        1_801_152_661_463
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009968,
      opts: [],
      values: [
        1,
        24,
        576,
        13824,
        331_776,
        7_962_624,
        191_102_976,
        4_586_471_424,
        110_075_314_176,
        2_641_807_540_224
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009969,
      opts: [],
      values: [
        1,
        25,
        625,
        15625,
        390_625,
        9_765_625,
        244_140_625,
        6_103_515_625,
        152_587_890_625,
        3_814_697_265_625
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009970,
      opts: [],
      values: [
        1,
        26,
        676,
        17576,
        456_976,
        11_881_376,
        308_915_776,
        8_031_810_176,
        208_827_064_576,
        5_429_503_678_976
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009971,
      opts: [],
      values: [
        1,
        27,
        729,
        19683,
        531_441,
        14_348_907,
        387_420_489,
        10_460_353_203,
        282_429_536_481,
        7_625_597_484_987
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009972,
      opts: [],
      values: [
        1,
        28,
        784,
        21952,
        614_656,
        17_210_368,
        481_890_304,
        13_492_928_512,
        377_801_998_336,
        10_578_455_953_408
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009973,
      opts: [],
      values: [
        1,
        29,
        841,
        24389,
        707_281,
        20_511_149,
        594_823_321,
        17_249_876_309,
        500_246_412_961,
        14_507_145_975_869
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009974,
      opts: [],
      values: [
        1,
        30,
        900,
        27000,
        810_000,
        24_300_000,
        729_000_000,
        21_870_000_000,
        656_100_000_000,
        19_683_000_000_000
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009975,
      opts: [],
      values: [
        1,
        31,
        961,
        29791,
        923_521,
        28_629_151,
        887_503_681,
        27_512_614_111,
        852_891_037_441,
        26_439_622_160_671
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009976,
      opts: [],
      values: [
        1,
        32,
        1024,
        32768,
        1_048_576,
        33_554_432,
        1_073_741_824,
        34_359_738_368,
        1_099_511_627_776,
        35_184_372_088_832
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009977,
      opts: [],
      values: [
        1,
        33,
        1089,
        35937,
        1_185_921,
        39_135_393,
        1_291_467_969,
        42_618_442_977,
        1_406_408_618_241,
        46_411_484_401_953
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009978,
      opts: [],
      values: [
        1,
        34,
        1156,
        39304,
        1_336_336,
        45_435_424,
        1_544_804_416,
        52_523_350_144,
        1_785_793_904_896,
        60_716_992_766_464
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009979,
      opts: [],
      values: [
        1,
        35,
        1225,
        42875,
        1_500_625,
        52_521_875,
        1_838_265_625,
        64_339_296_875,
        2_251_875_390_625,
        78_815_638_671_875
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009980,
      opts: [],
      values: [
        1,
        36,
        1296,
        46656,
        1_679_616,
        60_466_176,
        2_176_782_336,
        78_364_164_096,
        2_821_109_907_456,
        101_559_956_668_416
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009981,
      opts: [],
      values: [
        1,
        37,
        1369,
        50653,
        1_874_161,
        69_343_957,
        2_565_726_409,
        94_931_877_133,
        3_512_479_453_921,
        129_961_739_795_077
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009982,
      opts: [],
      values: [
        1,
        38,
        1444,
        54872,
        2_085_136,
        79_235_168,
        3_010_936_384,
        114_415_582_592,
        4_347_792_138_496,
        165_216_101_262_848
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009983,
      opts: [],
      values: [
        1,
        39,
        1521,
        59319,
        2_313_441,
        90_224_199,
        3_518_743_761,
        137_231_006_679,
        5_352_009_260_481,
        208_728_361_158_759
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009984,
      opts: [],
      values: [
        1,
        40,
        1600,
        64000,
        2_560_000,
        102_400_000,
        4_096_000_000,
        163_840_000_000,
        6_553_600_000_000,
        262_144_000_000_000
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009985,
      opts: [],
      values: [
        1,
        41,
        1681,
        68921,
        2_825_761,
        115_856_201,
        4_750_104_241,
        194_754_273_881,
        7_984_925_229_121,
        327_381_934_393_961
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009986,
      opts: [],
      values: [
        1,
        42,
        1764,
        74088,
        3_111_696,
        130_691_232,
        5_489_031_744,
        230_539_333_248,
        9_682_651_996_416,
        406_671_383_849_472
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009987,
      opts: [],
      values: [
        1,
        43,
        1849,
        79507,
        3_418_801,
        147_008_443,
        6_321_363_049,
        271_818_611_107,
        11_688_200_277_601,
        502_592_611_936_843
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009988,
      opts: [],
      values: [
        1,
        44,
        1936,
        85184,
        3_748_096,
        164_916_224,
        7_256_313_856,
        319_277_809_664,
        14_048_223_625_216,
        618_121_839_509_504
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009989,
      opts: [],
      values: [
        1,
        45,
        2025,
        91125,
        4_100_625,
        184_528_125,
        8_303_765_625,
        373_669_453_125,
        16_815_125_390_625,
        756_680_642_578_125
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009990,
      opts: [],
      values: [
        1,
        46,
        2116,
        97336,
        4_477_456,
        205_962_976,
        9_474_296_896,
        435_817_657_216,
        20_047_612_231_936,
        922_190_162_669_056
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009991,
      opts: [],
      values: [
        1,
        47,
        2209,
        103_823,
        4_879_681,
        229_345_007,
        10_779_215_329,
        506_623_120_463,
        23_811_286_661_761,
        1_119_130_473_102_767
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a009992,
      opts: [],
      values: [
        1,
        48,
        2304,
        110_592,
        5_308_416,
        254_803_968,
        12_230_590_464,
        587_068_342_272,
        28_179_280_429_056,
        1_352_605_460_594_688
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a011557,
      opts: [],
      values: [
        1,
        10,
        100,
        1000,
        10000,
        100_000,
        1_000_000,
        10_000_000,
        100_000_000,
        1_000_000_000
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a087752,
      opts: [],
      values: [
        1,
        49,
        2401,
        117_649,
        5_764_801,
        282_475_249,
        13_841_287_201,
        678_223_072_849,
        33_232_930_569_601,
        1_628_413_597_910_449
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a159991,
      opts: [],
      values: [
        1,
        60,
        3600,
        216_000,
        12_960_000,
        777_600_000,
        46_656_000_000,
        2_799_360_000_000,
        167_961_600_000_000,
        10_077_696_000_000_000
      ],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Powers,
      sequence: :a057716,
      opts: [],
      values: [0, 3, 5, 6, 7, 9, 10, 11, 12, 13],
      finite: false,
      first_index: 0
    },

    ## Sequence.OEIS.Multiples
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008585,
      opts: [],
      values: [0, 3, 6, 9, 12, 15, 18, 21, 24, 27],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008586,
      opts: [],
      values: [0, 4, 8, 12, 16, 20, 24, 28, 32, 36],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008587,
      opts: [],
      values: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008588,
      opts: [],
      values: [0, 6, 12, 18, 24, 30, 36, 42, 48, 54],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008589,
      opts: [],
      values: [0, 7, 14, 21, 28, 35, 42, 49, 56, 63],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008590,
      opts: [],
      values: [0, 8, 16, 24, 32, 40, 48, 56, 64, 72],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008591,
      opts: [],
      values: [0, 9, 18, 27, 36, 45, 54, 63, 72, 81],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008592,
      opts: [],
      values: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008593,
      opts: [],
      values: [0, 11, 22, 33, 44, 55, 66, 77, 88, 99],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008594,
      opts: [],
      values: [0, 12, 24, 36, 48, 60, 72, 84, 96, 108],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008595,
      opts: [],
      values: [0, 13, 26, 39, 52, 65, 78, 91, 104, 117],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008596,
      opts: [],
      values: [0, 14, 28, 42, 56, 70, 84, 98, 112, 126],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008597,
      opts: [],
      values: [0, 15, 30, 45, 60, 75, 90, 105, 120, 135],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008598,
      opts: [],
      values: [0, 16, 32, 48, 64, 80, 96, 112, 128, 144],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008599,
      opts: [],
      values: [0, 17, 34, 51, 68, 85, 102, 119, 136, 153],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008600,
      opts: [],
      values: [0, 18, 36, 54, 72, 90, 108, 126, 144, 162],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008601,
      opts: [],
      values: [0, 19, 38, 57, 76, 95, 114, 133, 152, 171],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008602,
      opts: [],
      values: [0, 20, 40, 60, 80, 100, 120, 140, 160, 180],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008603,
      opts: [],
      values: [0, 21, 42, 63, 84, 105, 126, 147, 168, 189],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008604,
      opts: [],
      values: [0, 22, 44, 66, 88, 110, 132, 154, 176, 198],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008605,
      opts: [],
      values: [0, 23, 46, 69, 92, 115, 138, 161, 184, 207],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008606,
      opts: [],
      values: [0, 24, 48, 72, 96, 120, 144, 168, 192, 216],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a008607,
      opts: [],
      values: [0, 25, 50, 75, 100, 125, 150, 175, 200, 225],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a044102,
      opts: [],
      values: [0, 36, 72, 108, 144, 180, 216, 252, 288, 324],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a085959,
      opts: [],
      values: [0, 37, 74, 111, 148, 185, 222, 259, 296, 333],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121023,
      opts: [],
      values: [3, 30, 33, 36, 39, 63, 93, 123, 132, 135],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121024,
      opts: [],
      values: [4, 24, 40, 44, 48, 64, 84, 104, 124, 140],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121025,
      opts: [],
      values: [5, 15, 25, 35, 45, 50, 55, 65, 75, 85],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121026,
      opts: [],
      values: [6, 36, 60, 66, 96, 126, 156, 162, 168, 186],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121027,
      opts: [],
      values: [7, 70, 77, 147, 175, 217, 273, 287, 357, 371],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121028,
      opts: [],
      values: [8, 48, 80, 88, 128, 168, 184, 208, 248, 280],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121029,
      opts: [],
      values: [9, 90, 99, 189, 198, 279, 297, 369, 396, 459],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121030,
      opts: [],
      values: [10, 100, 110, 210, 310, 410, 510, 610, 710, 810],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121031,
      opts: [],
      values: [11, 110, 1100, 1111, 1122, 1133, 1144, 1155, 1166, 1177],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121032,
      opts: [],
      values: [12, 120, 312, 612, 912, 1128, 1200, 1212, 1224, 1236],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121033,
      opts: [],
      values: [13, 130, 1131, 1300, 1313, 1326, 1339, 1352, 1365, 1378],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121034,
      opts: [],
      values: [14, 140, 714, 1148, 1400, 1414, 1428, 1442, 1456, 1470],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121035,
      opts: [],
      values: [15, 150, 315, 615, 915, 1155, 1215, 1500, 1515, 1530],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121036,
      opts: [],
      values: [16, 160, 416, 816, 1168, 1216, 1600, 1616, 1632, 1648],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121037,
      opts: [],
      values: [17, 170, 1173, 1700, 1717, 1734, 1751, 1768, 1785, 2176],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121038,
      opts: [],
      values: [18, 180, 918, 1188, 1800, 1818, 1836, 1854, 1872, 1890],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121039,
      opts: [],
      values: [19, 190, 1197, 1900, 1919, 1938, 1957, 1976, 1995, 3192],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a121040,
      opts: [],
      values: [20, 120, 200, 220, 320, 420, 520, 620, 720, 820],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a135628,
      opts: [],
      values: [0, 28, 56, 84, 112, 140, 168, 196, 224, 252],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a135631,
      opts: [],
      values: [0, 31, 62, 93, 124, 155, 186, 217, 248, 279],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a152691,
      opts: [],
      values: [0, 64, 128, 192, 256, 320, 384, 448, 512, 576],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a169823,
      opts: [],
      values: [0, 60, 120, 180, 240, 300, 360, 420, 480, 540],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a169825,
      opts: [],
      values: [0, 420, 840, 1260, 1680, 2100, 2520, 2940, 3360, 3780],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a169827,
      opts: [],
      values: [0, 840, 1680, 2520, 3360, 4200, 5040, 5880, 6720, 7560],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a174312,
      opts: [],
      values: [0, 32, 64, 96, 128, 160, 192, 224, 256, 288],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a195819,
      opts: [],
      values: [0, 29, 58, 87, 116, 145, 174, 203, 232, 261],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a249674,
      opts: [],
      values: [0, 30, 60, 90, 120, 150, 180, 210, 240, 270],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a252994,
      opts: [],
      values: [0, 26, 52, 78, 104, 130, 156, 182, 208, 234],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a305548,
      opts: [],
      values: [0, 27, 54, 81, 108, 135, 162, 189, 216, 243],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a062768,
      opts: [],
      values: [6, 24, 42, 60, 114, 132, 150, 204, 222, 240],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a063416,
      opts: [],
      values: [7, 70, 133, 322, 511, 700, 1015, 1141, 1204, 1330],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a063997,
      opts: [],
      values: [4, 40, 112, 220, 400, 1012, 1120, 1300, 2020, 2200],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a069537,
      opts: [],
      values: [2, 20, 110, 200, 1010, 1100, 2000, 10010, 10100, 11000],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a069540,
      opts: [],
      values: [5, 50, 140, 230, 320, 410, 500, 1040, 1130, 1220],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a069543,
      opts: [],
      values: [8, 80, 152, 224, 440, 512, 800, 1016, 1160, 1232],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a016825,
      opts: [],
      values: [2, 6, 10, 14, 18, 22, 26, 30, 34, 38],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a007770,
      opts: [],
      values: [1, 7, 10, 13, 19, 23, 28, 31, 32, 44],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a031177,
      opts: [],
      values: [2, 3, 4, 5, 6, 8, 9, 11, 12, 14],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a138591,
      opts: [],
      values: [1, 3, 5, 6, 7, 9, 10, 11, 12, 13],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a006753,
      opts: [],
      values: [4, 22, 27, 58, 85, 94, 121, 166, 202, 265],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a019506,
      opts: [],
      values: [22, 58, 84, 85, 94, 136, 160, 166, 202, 234],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a004144,
      opts: [],
      values: [1, 2, 3, 4, 6, 7, 8, 9, 11, 12],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a009003,
      opts: [],
      values: [5, 10, 13, 15, 17, 20, 25, 26, 29, 30],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a005153,
      opts: [],
      values: [1, 2, 4, 6, 8, 12, 16, 18, 20, 24],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a054377,
      opts: [],
      values: [2, 6, 42, 1806, 47058, 2214502422, 52495396602, 8490421583559688410706771261086],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a005835,
      opts: [],
      values: [6, 12, 18, 20, 24, 28, 30, 36, 40, 42],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a194472,
      opts: [],
      values: [24, 2016, 8190],
      finite: false,
      first_index: 1,
      take_values: 3
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a006037,
      opts: [],
      values: [70, 836, 4030],
      finite: false,
      first_index: 1,
      take_values: 3
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a006036,
      opts: [],
      values: [6, 20, 28, 88, 104, 272, 304, 350, 368, 464],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Multiples,
      sequence: :a002975,
      opts: [],
      values: [70, 836, 4030, 5830],
      finite: false,
      first_index: 1,
      take_values: 4
    },

    # OEIS.Repr
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004176,
      opts: [],
      values: [0, 0, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004177,
      opts: [],
      values: [0, 1, 0, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004178,
      opts: [],
      values: [0, 1, 2, 0, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004179,
      opts: [],
      values: [0, 1, 2, 3, 0, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004180,
      opts: [],
      values: [0, 1, 2, 3, 4, 0, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004181,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 0, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004182,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 0, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004183,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 0, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004184,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004719,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004720,
      opts: [],
      values: [0, 2, 3, 4, 5, 6, 7, 8, 9, 0],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004721,
      opts: [],
      values: [0, 1, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004722,
      opts: [],
      values: [0, 1, 2, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004723,
      opts: [],
      values: [0, 1, 2, 3, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004724,
      opts: [],
      values: [0, 1, 2, 3, 4, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004725,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 7, 8, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004726,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 8, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004727,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 9, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a004728,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007088,
      opts: [],
      values: [0, 1, 10, 11, 100, 101, 110, 111, 1000, 1001],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007089,
      opts: [],
      values: [0, 1, 2, 10, 11, 12, 20, 21, 22, 100],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007090,
      opts: [],
      values: [0, 1, 2, 3, 10, 11, 12, 13, 20, 21],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007091,
      opts: [],
      values: [0, 1, 2, 3, 4, 10, 11, 12, 13, 14],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007092,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 10, 11, 12, 13],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007093,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 10, 11, 12],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007094,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 10, 11],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007095,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011531,
      opts: [],
      values: [1, 10, 11, 12, 13, 14, 15, 16, 17, 18],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011532,
      opts: [],
      values: [2, 12, 20, 21, 22, 23, 24, 25, 26, 27],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011533,
      opts: [],
      values: [3, 13, 23, 30, 31, 32, 33, 34, 35, 36],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011534,
      opts: [],
      values: [4, 14, 24, 34, 40, 41, 42, 43, 44, 45],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011535,
      opts: [],
      values: [5, 15, 25, 35, 45, 50, 51, 52, 53, 54],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011536,
      opts: [],
      values: [6, 16, 26, 36, 46, 56, 60, 61, 62, 63],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011537,
      opts: [],
      values: [7, 17, 27, 37, 47, 57, 67, 70, 71, 72],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011538,
      opts: [],
      values: [8, 18, 28, 38, 48, 58, 68, 78, 80, 81],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011539,
      opts: [],
      values: [9, 19, 29, 39, 49, 59, 69, 79, 89, 90],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a011540,
      opts: [],
      values: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052382,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052383,
      opts: [],
      values: [0, 2, 3, 4, 5, 6, 7, 8, 9, 20],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052404,
      opts: [],
      values: [0, 1, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052405,
      opts: [],
      values: [0, 1, 2, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052406,
      opts: [],
      values: [0, 1, 2, 3, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052413,
      opts: [],
      values: [0, 1, 2, 3, 4, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052414,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052419,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052421,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a121022,
      opts: [],
      values: [2, 12, 20, 22, 24, 26, 28, 32, 42, 52],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100968,
      opts: [],
      values: [10206, 11935, 12150, 16031, 45030, 94185, 113_022, 114_415, 191_149, 244_713],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100969,
      opts: [],
      values: [855, 1029, 3813, 5577, 7040, 7304, 15104, 19136, 35350, 36992],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100970,
      opts: [],
      values: [1836, 6318, 6622, 10530, 14500, 14739, 17655, 18550, 25398, 25956],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100973,
      opts: [],
      values: [15540, 21054, 25331, 44360, 44660, 44733, 47652, 50560, 54944, 76857],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a099542,
      opts: [],
      values: [1568, 2835, 4752, 5265, 5439, 5664, 5824, 5832, 8526, 12985],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100971,
      opts: [],
      values: [560, 800, 3993, 4425, 4602, 4888, 7315, 8296, 9315, 11849],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100972,
      opts: [],
      values: [11475, 18655, 20565, 29631, 31725, 45387, 58404, 58667, 59950, 63945],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100974,
      opts: [],
      values: [2392, 2472, 11468, 15873, 17424, 18126, 19152, 20079, 24388, 30758],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100975,
      opts: [],
      values: [1000, 1134, 6776, 15912, 19624, 20043, 20355, 23946, 26296, 29070],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a255732,
      opts: [],
      values: [1815, 11050, 15295, 21165, 22165, 30702, 34510, 34645, 42292, 44165],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a255736,
      opts: [],
      values: [3024, 3168, 5115, 5346, 5950, 6762, 7750, 7956, 8470, 9476],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a255731,
      opts: [],
      values: [3348, 3510, 6750, 17430, 18750, 18876, 18944, 19475, 20564, 21312],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100988,
      opts: [],
      values: [1000, 2940, 4200, 4212, 4725, 5670, 5824, 5832, 6776, 6864],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a100987,
      opts: [],
      values: [560, 756, 800, 855, 1000, 1029, 1134, 1470, 1568, 1632],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a255735,
      opts: [],
      values: [1470, 3000, 8918, 17025, 19402, 20650, 21120, 22156, 26522, 36549],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a000788,
      opts: [],
      values: [0, 1, 2, 4, 5, 7, 9, 12, 13, 15],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a005823,
      opts: [],
      values: [0, 2, 6, 8, 18, 20, 24, 26, 54, 56],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a005836,
      opts: [],
      values: [0, 1, 3, 4, 9, 10, 12, 13, 27, 28],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007954,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010872,
      opts: [],
      values: [0, 1, 2, 0, 1, 2, 0, 1, 2, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023416,
      opts: [],
      values: [1, 0, 1, 0, 2, 1, 1, 0, 3, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023705,
      opts: [],
      values: [1, 2, 3, 5, 6, 7, 9, 10, 11, 13],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a032924,
      opts: [],
      values: [1, 2, 4, 5, 7, 8, 13, 14, 16, 17],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a052040,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a055640,
      opts: [],
      values: [0, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a055641,
      opts: [],
      values: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a055642,
      opts: [],
      values: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a067251,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a071858,
      opts: [],
      values: [0, 1, 1, 2, 1, 2, 2, 0, 1, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a122840,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a160093,
      opts: [],
      values: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a179868,
      opts: [],
      values: [0, 1, 1, 2, 1, 2, 2, 3, 1, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a193238,
      opts: [],
      values: [0, 0, 1, 1, 0, 1, 0, 1, 0, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a196563,
      opts: [],
      values: [1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a248910,
      opts: [],
      values: [1, 2, 3, 4, 5, 7, 8, 9, 10, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a255805,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 9, 10, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a255808,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 10, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007953,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a014263,
      opts: [],
      values: [0, 2, 4, 6, 8, 20, 22, 24, 26, 28],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023692,
      opts: [],
      values: [1, 3, 5, 7, 9, 11, 15, 17, 19, 21],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023693,
      opts: [],
      values: [4, 10, 12, 14, 16, 22, 28, 30, 32, 34],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023694,
      opts: [],
      values: [13, 31, 37, 39, 41, 43, 49, 67, 85, 91],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023695,
      opts: [],
      values: [40, 94, 112, 118, 120, 122, 124, 130, 148, 202],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023696,
      opts: [],
      values: [121, 283, 337, 355, 361, 363, 365, 367, 373, 391],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023697,
      opts: [],
      values: [364, 850, 1012, 1066, 1084, 1090, 1092, 1094, 1096, 1102],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a043321,
      opts: [],
      values: [3, 6, 10, 11, 12, 15, 19, 20, 21, 24],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a059015,
      opts: [],
      values: [1, 1, 2, 2, 4, 5, 6, 6, 9, 11],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a062756,
      opts: [],
      values: [0, 1, 0, 1, 2, 1, 0, 1, 0, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a074940,
      opts: [],
      values: [2, 5, 6, 7, 8, 11, 14, 15, 16, 17],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a077267,
      opts: [],
      values: [1, 0, 0, 1, 0, 0, 1, 0, 0, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a081603,
      opts: [],
      values: [0, 0, 1, 0, 0, 1, 1, 1, 2, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a081605,
      opts: [],
      values: [0, 3, 6, 9, 10, 11, 12, 15, 18, 19],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a081606,
      opts: [],
      values: [1, 3, 4, 5, 7, 9, 10, 11, 12, 13],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097251,
      opts: [],
      values: [0, 4, 20, 24, 100, 104, 120, 124, 500, 504],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097252,
      opts: [],
      values: [0, 5, 30, 35, 180, 185, 210, 215, 1080, 1085],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097253,
      opts: [],
      values: [0, 6, 42, 48, 294, 300, 336, 342, 2058, 2064],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097254,
      opts: [],
      values: [0, 7, 56, 63, 448, 455, 504, 511, 3584, 3591],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097255,
      opts: [],
      values: [0, 8, 72, 80, 648, 656, 720, 728, 5832, 5840],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097256,
      opts: [],
      values: [0, 9, 90, 99, 900, 909, 990, 999, 9000, 9009],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097257,
      opts: [],
      values: [0, 10, 110, 120, 1210, 1220, 1320, 1330, 13310, 13320],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097258,
      opts: [],
      values: [0, 11, 132, 143, 1584, 1595, 1716, 1727, 19008, 19019],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097259,
      opts: [],
      values: [0, 12, 156, 168, 2028, 2040, 2184, 2196, 26364, 26376],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097260,
      opts: [],
      values: [0, 13, 182, 195, 2548, 2561, 2730, 2743, 35672, 35685],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097261,
      opts: [],
      values: [0, 14, 210, 224, 3150, 3164, 3360, 3374, 47250, 47264],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a097262,
      opts: [],
      values: [0, 15, 240, 255, 3840, 3855, 4080, 4095, 61440, 61455],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102669,
      opts: [],
      values: [0, 0, 1, 1, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102670,
      opts: [],
      values: [0, 0, 1, 2, 3, 4, 5, 6, 7, 8],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102671,
      opts: [],
      values: [0, 0, 0, 1, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102672,
      opts: [],
      values: [0, 0, 0, 1, 2, 3, 4, 5, 6, 7],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102673,
      opts: [],
      values: [0, 0, 0, 0, 1, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102674,
      opts: [],
      values: [0, 0, 0, 0, 1, 2, 3, 4, 5, 6],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102675,
      opts: [],
      values: [0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102676,
      opts: [],
      values: [0, 0, 0, 0, 0, 1, 2, 3, 4, 5],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102677,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102678,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 1, 2, 3, 4],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102679,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102680,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 1, 2, 3],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102681,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102682,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 0, 1, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102683,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a102684,
      opts: [],
      values: [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023698,
      opts: [],
      values: [1093, 2551, 3037, 3199, 3253, 3271, 3277, 3279, 3281, 3283],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023699,
      opts: [],
      values: [2, 5, 6, 7, 11, 14, 15, 16, 18, 19],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023700,
      opts: [],
      values: [8, 17, 20, 23, 24, 25, 35, 44, 47, 50],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023701,
      opts: [],
      values: [26, 53, 62, 71, 74, 77, 78, 79, 107, 134],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023702,
      opts: [],
      values: [80, 161, 188, 215, 224, 233, 236, 239, 240, 241],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023703,
      opts: [],
      values: [242, 485, 566, 647, 674, 701, 710, 719, 722, 725],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023704,
      opts: [],
      values: [728, 1457, 1700, 1943, 2024, 2105, 2132, 2159, 2168, 2177],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023706,
      opts: [],
      values: [0, 4, 8, 12, 17, 18, 19, 20, 24, 28],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023707,
      opts: [],
      values: [16, 32, 48, 65, 66, 67, 68, 72, 76, 80],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023708,
      opts: [],
      values: [64, 128, 192, 257, 258, 259, 260, 264, 268, 272],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023709,
      opts: [],
      values: [0, 2, 3, 8, 10, 11, 12, 14, 15, 32],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023710,
      opts: [],
      values: [1, 4, 6, 7, 9, 13, 16, 18, 19, 24],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023711,
      opts: [],
      values: [5, 17, 20, 22, 23, 25, 29, 37, 53, 65],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023712,
      opts: [],
      values: [21, 69, 81, 84, 86, 87, 89, 93, 101, 117],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023713,
      opts: [],
      values: [0, 1, 3, 4, 5, 7, 12, 13, 15, 16],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023714,
      opts: [],
      values: [2, 6, 8, 9, 11, 14, 18, 22, 24, 25],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023715,
      opts: [],
      values: [10, 26, 34, 38, 40, 41, 43, 46, 58, 74],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023716,
      opts: [],
      values: [42, 106, 138, 154, 162, 166, 168, 169, 171, 174],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023717,
      opts: [],
      values: [0, 1, 2, 4, 5, 6, 8, 9, 10, 16],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023718,
      opts: [],
      values: [3, 7, 11, 12, 13, 14, 19, 23, 27, 28],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023719,
      opts: [],
      values: [15, 31, 47, 51, 55, 59, 60, 61, 62, 79],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023720,
      opts: [],
      values: [63, 127, 191, 207, 223, 239, 243, 247, 251, 252],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023721,
      opts: [],
      values: [1, 2, 3, 4, 6, 7, 8, 9, 11, 12],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023722,
      opts: [],
      values: [0, 5, 10, 15, 20, 26, 27, 28, 29, 30],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023723,
      opts: [],
      values: [25, 50, 75, 100, 126, 127, 128, 129, 130, 135],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023724,
      opts: [],
      values: [125, 250, 375, 500, 626, 627, 628, 629, 630, 635],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023725,
      opts: [],
      values: [0, 2, 3, 4, 10, 12, 13, 14, 15, 17],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023726,
      opts: [],
      values: [1, 5, 7, 8, 9, 11, 16, 21, 25, 27],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023727,
      opts: [],
      values: [6, 26, 30, 32, 33, 34, 36, 41, 46, 56],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023728,
      opts: [],
      values: [31, 131, 151, 155, 157, 158, 159, 161, 166, 171],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023729,
      opts: [],
      values: [0, 1, 3, 4, 5, 6, 8, 9, 15, 16],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023730,
      opts: [],
      values: [2, 7, 10, 11, 13, 14, 17, 22, 27, 32],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023731,
      opts: [],
      values: [12, 37, 52, 57, 60, 61, 63, 64, 67, 72],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023732,
      opts: [],
      values: [62, 187, 262, 287, 302, 307, 310, 311, 313, 314],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023733,
      opts: [],
      values: [0, 1, 2, 4, 5, 6, 7, 9, 10, 11],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023734,
      opts: [],
      values: [3, 8, 13, 15, 16, 17, 19, 23, 28, 33],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023735,
      opts: [],
      values: [18, 43, 68, 78, 83, 88, 90, 91, 92, 94],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023736,
      opts: [],
      values: [93, 218, 343, 393, 418, 443, 453, 458, 463, 465],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023738,
      opts: [],
      values: [4, 9, 14, 19, 20, 21, 22, 23, 29, 34],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023739,
      opts: [],
      values: [24, 49, 74, 99, 104, 109, 114, 119, 120, 121],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023740,
      opts: [],
      values: [124, 249, 374, 499, 524, 549, 574, 599, 604, 609],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023745,
      opts: [],
      values: [0, 1, 2, 4, 5, 8, 13, 14, 17, 26],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023746,
      opts: [],
      values: [0, 1, 2, 3, 5, 6, 7, 10, 11, 15],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023747,
      opts: [],
      values: [0, 1, 2, 3, 4, 6, 7, 8, 9, 12],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023748,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023749,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023750,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023751,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023752,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023753,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023754,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023755,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023756,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a023757,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a006886,
      opts: [],
      values: [1, 9, 45, 55, 99, 297, 703, 999, 2223, 2728],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a053816,
      opts: [],
      values: [1, 9, 45, 55, 99, 297, 703, 999, 2223, 2728],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a005188,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 153],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010353,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 41, 50],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010354,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 20, 52, 92],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010350,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 10, 25, 32, 45],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010348,
      opts: [],
      values: [1, 2, 3, 4, 5, 99, 190, 2292, 2293, 2324],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010346,
      opts: [],
      values: [1, 2, 3, 4, 13, 18, 28, 118, 289, 353],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a010344,
      opts: [],
      values: [1, 2, 3, 28, 29, 35, 43, 55, 62, 83],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a161948,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a161949,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a161950,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a161951,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a161952,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a161953,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a114904,
      opts: [],
      values: [1, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a014576,
      opts: [],
      values: [1, 0, 153, 1634, 54748, 548834, 1741725, 24678050, 146511208, 4679307774],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a046253,
      opts: [],
      values: [0, 1, 3435, 438579088],
      finite: true,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a001101,
      opts: [],
      values: [18, 21, 27, 42, 45, 63, 84, 111, 114, 117],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a005349,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Repr,
      sequence: :a007602,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11],
      finite: false,
      first_index: 1
    },
    
    
    

    # OEIS.Constants
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a007395,
      opts: [],
      values: [2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
      finite: false,
      first_index: 1
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010701,
      opts: [],
      values: [3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010709,
      opts: [],
      values: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010716,
      opts: [],
      values: [5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010722,
      opts: [],
      values: [6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010727,
      opts: [],
      values: [7, 7, 7, 7, 7, 7, 7, 7, 7, 7],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010731,
      opts: [],
      values: [8, 8, 8, 8, 8, 8, 8, 8, 8, 8],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010734,
      opts: [],
      values: [9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010692,
      opts: [],
      values: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010850,
      opts: [],
      values: [11, 11, 11, 11, 11, 11, 11, 11, 11, 11],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010851,
      opts: [],
      values: [12, 12, 12, 12, 12, 12, 12, 12, 12, 12],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010852,
      opts: [],
      values: [13, 13, 13, 13, 13, 13, 13, 13, 13, 13],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010853,
      opts: [],
      values: [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010854,
      opts: [],
      values: [15, 15, 15, 15, 15, 15, 15, 15, 15, 15],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010855,
      opts: [],
      values: [16, 16, 16, 16, 16, 16, 16, 16, 16, 16],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010856,
      opts: [],
      values: [17, 17, 17, 17, 17, 17, 17, 17, 17, 17],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010857,
      opts: [],
      values: [18, 18, 18, 18, 18, 18, 18, 18, 18, 18],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010858,
      opts: [],
      values: [19, 19, 19, 19, 19, 19, 19, 19, 19, 19],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010859,
      opts: [],
      values: [20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010860,
      opts: [],
      values: [21, 21, 21, 21, 21, 21, 21, 21, 21, 21],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010861,
      opts: [],
      values: [22, 22, 22, 22, 22, 22, 22, 22, 22, 22],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010862,
      opts: [],
      values: [23, 23, 23, 23, 23, 23, 23, 23, 23, 23],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010863,
      opts: [],
      values: [24, 24, 24, 24, 24, 24, 24, 24, 24, 24],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010864,
      opts: [],
      values: [25, 25, 25, 25, 25, 25, 25, 25, 25, 25],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010865,
      opts: [],
      values: [26, 26, 26, 26, 26, 26, 26, 26, 26, 26],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010866,
      opts: [],
      values: [27, 27, 27, 27, 27, 27, 27, 27, 27, 27],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010867,
      opts: [],
      values: [28, 28, 28, 28, 28, 28, 28, 28, 28, 28],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010868,
      opts: [],
      values: [29, 29, 29, 29, 29, 29, 29, 29, 29, 29],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010869,
      opts: [],
      values: [30, 30, 30, 30, 30, 30, 30, 30, 30, 30],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010870,
      opts: [],
      values: [31, 31, 31, 31, 31, 31, 31, 31, 31, 31],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Constants,
      sequence: :a010871,
      opts: [],
      values: [32, 32, 32, 32, 32, 32, 32, 32, 32, 32],
      finite: false,
      first_index: 0
    },

    ## OEIS.Combinatorics
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a159981,
      opts: [],
      values: [1, 1, 2, 1, 2, 2, 0, 1, 2, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a159984,
      opts: [],
      values: [1, 1, 2, 0, 4, 2, 2, 4, 0, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a159986,
      opts: [],
      values: [1, 1, 2, 5, 0, 0, 6, 2, 2, 4],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a159987,
      opts: [],
      values: [1, 1, 2, 5, 6, 2, 4, 5, 6, 6],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a159988,
      opts: [],
      values: [1, 1, 2, 5, 3, 9, 0, 0, 0, 0],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a159989,
      opts: [],
      values: [1, 1, 2, 5, 2, 6, 0, 9, 2, 2],
      finite: false,
      first_index: 0
    },
    %{
      module: Elixir.Chunky.Sequence.OEIS.Combinatorics,
      sequence: :a289682,
      opts: [],
      values: [1, 1, 2, 5, 14, 10, 4, 13, 6, 14],
      finite: false,
      first_index: 0
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
