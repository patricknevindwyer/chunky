defmodule Chunky.MathTest do
  use ExUnit.Case, async: true

  alias Chunky.Fraction
  alias Chunky.Math
  doctest Chunky.Math

  describe "reduced_prime_factors/1" do
      test "value tests" do
         [
             # 1
             {1, [{1, 1}]},
             
             # single low digit
             {2, [{2, 1}]},
             
             # two digit prime
             {17, [{17, 1}]},
             
             # power of 2
             {64, [{2, 6}]},
             
             # larger composite
             {12209276310, [{2, 1}, {3, 1}, {5, 1}, {7, 1}, {11, 5}, {19, 2}]},
             
             # skipped primes
             {7569, [{3, 2}, {29, 2}]},
             
             # large power of 2
             {9223372036854775808, [{2, 63}]},
                          
         ] 
         |> Enum.each(fn {n, red} -> 
             assert Math.reduced_prime_factors(n) == red
         end)
      end
  end
  
  describe "is_euler_pseudo_prime?/2" do
    test "value tests - true" do
      ns = [
        {561, 2},
        {1105, 2},
        {1729, 2},
        {1905, 2},
        {121, 3},
        {703, 3},
        {1541, 3},
        {1729, 3},
        {341, 4},
        {561, 4},
        {645, 4},
        {1105, 4},
        {217, 5},
        {781, 5},
        {1541, 5},
        {1729, 5},
        {185, 6},
        {217, 6},
        {301, 6},
        {481, 6},
        {25, 7},
        {325, 7},
        {703, 7},
        {817, 7},
        {9, 8},
        {21, 8},
        {65, 8},
        {105, 8},
        {91, 9},
        {121, 9},
        {671, 9},
        {703, 9},
        {9, 10},
        {33, 10},
        {91, 10},
        {481, 10}
      ]

      ns
      |> Enum.each(fn {n, k} ->
        assert Math.is_euler_pseudo_prime?(n, k)
      end)
    end

    test "value tests - false" do
      ns = [
        {559, 2},
        {1107, 2},
        {1723, 2},
        {1901, 2},
        {127, 3},
        {705, 3},
        {1549, 3},
        {1723, 3},
        {345, 4},
        {567, 4},
        {641, 4},
        {1101, 4},
        {213, 5},
        {789, 5},
        {1545, 5},
        {1727, 5},
        {187, 6},
        {213, 6},
        {307, 6},
        {485, 6},
        {27, 7},
        {321, 7},
        {701, 7},
        {815, 7},
        {11, 8},
        {25, 8},
        {67, 8},
        {101, 8},
        {95, 9},
        {127, 9},
        {679, 9},
        {701, 9},
        {19, 10},
        {35, 10},
        {95, 10},
        {487, 10}
      ]

      ns
      |> Enum.each(fn {n, k} ->
        assert Math.is_euler_pseudo_prime?(n, k) == false
      end)
    end
  end

  describe "is_euler_jacobi_pseudo_prime?/2" do
    test "value tests" do
      ns = [
        {561, 2},
        {1105, 2},
        {1729, 2},
        {1905, 2},
        {121, 3},
        {703, 3},
        {1729, 3},
        {1891, 3},
        {341, 4},
        {561, 4},
        {645, 4},
        {1105, 4},
        {781, 5},
        {1541, 5},
        {1729, 5},
        {5461, 5},
        {217, 6},
        {481, 6},
        {1111, 6},
        {1261, 6},
        {25, 7},
        {325, 7},
        {703, 7},
        {2101, 7},
        {9, 8},
        {65, 8},
        {105, 8},
        {273, 8},
        {91, 9},
        {121, 9},
        {671, 9},
        {703, 9},
        {9, 10},
        {91, 10},
        {481, 10},
        {1729, 10},
        {133, 11},
        {793, 11},
        {2047, 11},
        {2465, 11},
        {91, 12},
        {133, 12},
        {145, 12},
        {247, 12},
        {85, 13},
        {105, 13},
        {1099, 13},
        {1785, 13},
        {15, 14},
        {65, 14},
        {793, 14},
        {841, 14},
        {1687, 15},
        {1729, 15},
        {1921, 15},
        {3277, 15},
        {15, 16},
        {85, 16},
        {91, 16},
        {341, 16}
      ]

      ns
      |> Enum.each(fn {n, k} ->
        assert Math.is_euler_jacobi_pseudo_prime?(n, k)
        assert Math.is_euler_jacobi_pseudo_prime?(n + 2, k) == false
      end)
    end
  end

  describe "legendre_symbol/2" do
    test "value tests" do
      ns = [{2, 7}, {2, 3}, {2, 5}, {8, 11}, {8, 13}, {8, 17}, {23, 23}, {23, 29}, {23, 41}]
      os = [1, -1, -1, -1, -1, 1, 0, 1, 1]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, k}, o} ->
        assert Math.legendre_symbol(n, k) == o
      end)
    end
  end

  describe "jacobi_symbol/2" do
    test "value tests" do
      ns = [{2, 1}, {2, 3}, {2, 5}, {8, 11}, {8, 13}, {8, 15}, {23, 23}, {23, 29}, {23, 41}]
      os = [1, -1, -1, -1, -1, 1, 0, 1, 1]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, k}, o} ->
        assert Math.jacobi_symbol(n, k) == o
      end)
    end
  end

  describe "get_rhonda_to/2" do
    test "default" do
      ns = [1000, 2940, 5670, 3348]
      os = [[16, 36], [56, 76], [36, 106, 108, 196], [60]]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.get_rhonda_to(n) == o
      end)
    end

    test "alternate bases" do
      ns = [1000, 2940, 5670, 3348]
      os = [[36], [56, 76], [36], [60]]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.get_rhonda_to(n, bases: 25..100 |> Enum.to_list()) == o
      end)
    end
  end

  describe "is_rhonda_to_base?/2" do
    test "value tests" do
      ns = [
        {10206, 4},
        {11935, 4},
        {10200, 4},
        {855, 6},
        {1029, 6},
        {900, 6},
        {1836, 8},
        {6318, 8},
        {5000, 8},
        {15540, 9},
        {21054, 9},
        {16000, 9},
        {1568, 10},
        {2835, 10},
        {2000, 10},
        {560, 12},
        {800, 12},
        {700, 12},
        {11475, 14},
        {18655, 14},
        {12345, 14},
        {2392, 15},
        {2472, 15},
        {1450, 15},
        {1000, 16},
        {1134, 16},
        {1111, 16},
        {1815, 20},
        {11050, 20},
        {9000, 20},
        {3024, 30},
        {3168, 30},
        {3100, 30},
        {3348, 60},
        {3510, 60},
        {3400, 60}
      ]

      os = [
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, b}, o} ->
        assert Math.is_rhonda_to_base?(n, b) == o
      end)
    end
  end

  describe "nth_root/3" do
    test "value tests" do
      ns = [{8, 3}, {8, 5}, {104_976, 4}]
      os = [2.0, 1.5157165665103982, 18.0]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.nth_root(n, m) == o
      end)
    end

    test "edge tests" do
      ns = [{-8, 3}, {0, 5}, {137, 0}]
      os = [-2.0, 0, :zero_root_undefined]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.nth_root(n, m) == o
      end)
    end
  end

  describe "integer_nth_root?/3" do
    test "value tests" do
      ns = [{8, 3}, {8, 5}, {104_976, 4}, {-8, 3}, {0, 5}, {137, 0}]
      os = [true, false, true, true, true, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.integer_nth_root?(n, m) == o
      end)
    end
  end

  describe "integer_nth_root/3" do
    test "value tests" do
      ns = [{8, 3}, {8, 5}, {104_976, 4}, {-8, 3}, {0, 5}, {137, 0}]

      os = [
        {true, 2},
        {false, :no_integer_nth_root, 1.5157165665103982},
        {true, 18},
        {true, -2},
        {true, 0},
        {false, :zero_root_undefined}
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.integer_nth_root(n, m) == o
      end)
    end
  end

  describe "floats_equal?/3" do
    test "value tests" do
      ns = [{3.0, 3.0}, {3.1, 3.0}, {3.000000001, 3.0}, {-3.0, 3.0}, {2.999999999, 3.0}]
      os = [true, false, true, false, true]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.floats_equal?(n, m) == o
      end)
    end
  end

  describe "lcm/2" do
    test "value tests" do
      ns = [{1, 1}, {1, 10}, {2, 10}, {3, 5}, {1_299_379, 1_299_437}]
      os = [1, 10, 10, 15, 1_688_461_149_623]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.lcm(n, m) == o
      end)
    end

    test "negatives" do
      ns = [{-1, 1}, {-2, -5}, {-2, 5}, {-2, 2}, {1_299_379, -1_299_437}]
      os = [1, 10, 10, 2, 1_688_461_149_623]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.lcm(n, m) == o
      end)
    end

    test "zero" do
      ns = [{-1, 0}, {0, -5}, {0, 5}, {0, 0}, {1_299_379, 0}]
      os = [1, 10, 10, 2, 1_688_461_149_623]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, _o} ->
        assert Math.lcm(n, m) == 0
      end)
    end
  end

  describe "factorization_count/1" do
    test "value tests" do
      ns = [1, 2, 3, 5, 7, 32, 370, 4100, 6444]
      os = [1, 1, 1, 1, 1, 7, 5, 26, 26]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.factorization_count(n) == o
      end)
    end
  end

  describe "jacobsthal_number/1" do
    test "value tests" do
      ns = [0, 1, 2, 3, 5, 7, 32, 37, 41, 64]

      os = [
        0,
        1,
        1,
        3,
        11,
        43,
        1_431_655_765,
        45_812_984_491,
        733_007_751_851,
        6_148_914_691_236_517_205
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jacobsthal_number(n) == o
      end)
    end
  end

  describe "motzkin_number/1" do
    test "value tests" do
      ns = [0, 1, 2, 3, 5, 7, 32, 37, 41, 64]

      os = [
        1,
        1,
        2,
        4,
        21,
        127,
        13_933_569_346_707,
        2_750_016_719_520_991,
        192_137_918_101_841_817,
        9_468_017_265_749_942_384_739_441_267
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.motzkin_number(n) == o
      end)
    end
  end

  describe "hipparchus_number/1" do
    test "value tests" do
      ns = [0, 1, 2, 3, 5, 7, 32, 37, 41, 64]

      os = [
        1,
        1,
        3,
        11,
        197,
        4279,
        6_791_142_807_106_951_594_977,
        36_912_754_633_401_605_027_088_357,
        36_626_471_726_431_599_611_696_929_449,
        7_685_617_405_888_261_934_325_439_002_849_455_215_101_480_897
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.hipparchus_number(n) == o
      end)
    end
  end

  describe "lucky_numbers/1" do
    test "value tests" do
      ns = [1, 3, 7, 10, 25, 40]

      os = [
        [1],
        [1, 3, 7],
        [1, 3, 7, 9, 13, 15, 21],
        [1, 3, 7, 9, 13, 15, 21, 25, 31, 33],
        [
          1,
          3,
          7,
          9,
          13,
          15,
          21,
          25,
          31,
          33,
          37,
          43,
          49,
          51,
          63,
          67,
          69,
          73,
          75,
          79,
          87,
          93,
          99,
          105,
          111
        ],
        [
          1,
          3,
          7,
          9,
          13,
          15,
          21,
          25,
          31,
          33,
          37,
          43,
          49,
          51,
          63,
          67,
          69,
          73,
          75,
          79,
          87,
          93,
          99,
          105,
          111,
          115,
          127,
          129,
          133,
          135,
          141,
          151,
          159,
          163,
          169,
          171,
          189,
          193,
          195,
          201
        ]
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.lucky_numbers(n) == o
      end)
    end
  end

  describe "digits_of_pi/1" do
    test "value tests" do
      ns = [1, 3, 10, 50]

      os = [
        3,
        314,
        3_141_592_653,
        31_415_926_535_897_932_384_626_433_832_795_028_841_971_693_993_751
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.digits_of_pi(n) == o
      end)
    end
  end

  describe "prime_pi/1" do
    test "value tests" do
      ns = [1, 10, 100, 1000]
      os = [0, 4, 25, 168]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.prime_pi(n) == o
      end)
    end
  end

  describe "fubini_number/1" do
    test "value tests" do
      ns = [0, 4, 18, 41]

      os = [
        1,
        75,
        3_385_534_663_256_845_323,
        81_045_623_051_154_285_047_127_402_304_207_782_853_156_976_521_592_907_421
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.fubini_number(n) == o
      end)
    end
  end

  describe "j_invariant_q_coefficient/1" do
    test "value tests" do
      ns = [0, 4, 18, 41]

      os = [
        744,
        20_245_856_256,
        11_459_912_788_444_786_513_920,
        3_827_767_751_739_363_485_065_598_331_130_120
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.j_invariant_q_coefficient(n) == o
      end)
    end
  end

  describe "euler_zig/1" do
    test "value tests" do
      ns = [0, 4, 18, 41]

      os = [
        1,
        1385,
        41_222_060_339_517_702_122_347_079_671_259_045,
        50_131_049_408_109_796_612_908_693_678_881_009_420_083_336_722_220_539_765_973_596_236_561_571_401_154_699_761_552_253_189_084_809_951_554_801
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.euler_zig(n) == o
      end)
    end
  end

  describe "euler_number/1" do
    test "value tests" do
      ns = [0, 4, 18, 41]
      os = [1, 5, -2_404_879_675_441, 0]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.euler_number(n) == o
      end)
    end
  end

  describe "euler_polynomial/2" do
    test "value tests" do
      ns = [{1, 4}, {8, Fraction.new(1, 2)}, {3, 1}]

      os = [
        %Fraction{num: 7, den: 2},
        %Fraction{den: 65536, num: 354_560},
        %Fraction{num: -2, den: 8}
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.euler_polynomial(n, m) == o
      end)
    end
  end

  describe "square_pyramidal_number/1" do
    test "value tests" do
      ns = [3, 13, 33, 73, 777]
      os = [14, 819, 12529, 132_349, 156_667_805]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.square_pyramidal_number(n) == o
      end)
    end
  end

  describe "pentagonal_number/1" do
    test "value tests" do
      ns = [3, 13, 33, 73, 777]
      os = [12, 247, 1617, 7957, 905_205]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.pentagonal_number(n) == o
      end)
    end
  end

  describe "endomorphism_count/1" do
    test "value tests" do
      ns = [3, 13, 33, 73]

      os = [
        27,
        302_875_106_592_253,
        129_110_040_087_761_027_839_616_029_934_664_535_539_337_183_380_513,
        10_533_405_146_807_286_720_373_659_460_502_060_785_759_379_112_212_598_116_064_998_418_834_781_689_316_645_387_966_435_364_502_141_349_866_164_216_580_595_609_788_325_190_062_013_833
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.endomorphism_count(n) == o
      end)
    end
  end

  describe "tetrahedral_number/1" do
    test "value tests" do
      ns = [1, 3, 30, 300, 3000]
      os = [1, 10, 4960, 4_545_100, 4_504_501_000]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.tetrahedral_number(n) == o
      end)
    end
  end

  describe "rising_factorial/2" do
    test "value tests" do
      ns = [{3, 4}, {5, 7}, {9, 13}, {21, 30}]

      os = [
        360,
        1_663_200,
        1_267_136_462_592_000,
        12_501_158_328_406_120_266_757_143_916_231_576_780_800_000_000
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.rising_factorial(n, m) == o
      end)
    end
  end

  describe "falling_factorial/2" do
    ns = [{4, 3}, {7, 5}, {13, 9}, {30, 21}]
    os = [24, 2520, 259_459_200, 730_965_773_291_972_714_496_000_000]

    Enum.zip(ns, os)
    |> Enum.each(fn {{n, m}, o} ->
      assert Math.falling_factorial(n, m) == o
    end)
  end

  describe "cayley_number/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 29, 45]

      os = [
        1,
        1,
        16,
        2_357_947_691,
        3_053_134_545_970_524_535_745_336_759_489_912_159_909,
        122_500_565_161_156_121_231_925_522_170_574_167_775_076_830_366_742_797_195_911_407_470_703_125
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.cayley_number(n) == o
      end)
    end
  end

  describe "ordered_subsets_count/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 29, 45]

      os = [
        1,
        3,
        73,
        824_073_141,
        5_628_563_759_710_900_871_382_077_742_916_173,
        776_245_524_984_802_767_383_175_984_672_148_286_143_987_976_321_467_492_834_141
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.ordered_subsets_count(n) == o
      end)
    end
  end

  describe "plane_partition_count/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 29, 100]
      os = [1, 3, 13, 859, 3_759_612, 59_206_066_030_052_023]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.plane_partition_count(n) == o
      end)
    end
  end

  describe "labeled_rooted_trees_count/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 34, 100]

      os = [
        1,
        2,
        64,
        25_937_424_601,
        345_783_497_216_724_000_335_707_367_685_598_692_782_880_644_399_104,
        1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.labeled_rooted_trees_count(n) == o
      end)
    end
  end

  describe "labeled_rooted_forests_count/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 34, 100]

      os = [
        1,
        3,
        125,
        61_917_364_224,
        900_006_121_921_754_037_511_662_394_623_272_120_952_606_201_171_875,
        2_678_033_494_476_758_508_185_341_297_829_238_449_186_077_606_713_864_135_534_852_523_878_318_330_996_771_563_801_441_598_363_113_456_409_263_875_004_787_765_032_797_220_611_552_796_316_638_577_448_808_416_388_296_810_715_999_386_219_563_695_959_264_034_497_519_901
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.labeled_rooted_forests_count(n) == o
      end)
    end
  end

  describe "derangement_count/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 34, 100, 147]

      os = [
        0,
        1,
        9,
        14_684_570,
        108_610_077_126_170_304_674_801_654_684_367_969_729,
        34_332_795_984_163_804_765_195_977_526_776_142_032_365_783_805_375_784_983_543_400_282_685_180_793_327_632_432_791_396_429_850_988_990_237_345_920_155_783_984_828_001_486_412_574_060_553_756_854_137_069_878_601,
        6_354_182_529_461_228_439_362_627_488_637_815_690_308_570_187_502_862_289_893_858_427_824_542_236_490_821_946_255_866_597_772_954_422_697_421_757_080_919_849_848_382_395_878_829_003_118_855_732_545_163_300_007_535_700_030_711_152_156_622_841_482_633_473_711_406_810_220_556_925_471_380_221_976_041_654_127_479_763_464_570_970_969_891_058_994
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.derangement_count(n) == o
      end)
    end
  end

  describe "pell_number/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 34, 100, 147]

      os = [
        1,
        2,
        12,
        5741,
        3_654_502_875_938,
        66_992_092_050_551_637_663_438_906_713_182_313_772,
        65_536_123_822_357_661_887_786_970_118_390_510_778_951_948_386_497_100_245
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.pell_number(n) == o
      end)
    end
  end

  describe "pancake_cut_max/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 34, 100, 147]
      os = [2, 4, 11, 67, 596, 5051, 10879]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.pancake_cut_max(n) == o
      end)
    end
  end

  describe "hamming_weight/1" do
    test "value tests" do
      ns = [{10, 2}, {10, 10}, {9999, 2}, {1_234_567_890, 2}, {1_234_567_890, 10}]
      os = [2, 1, 8, 12, 9]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, b}, o} ->
        assert Math.hamming_weight(n, b) == o
      end)
    end
  end

  describe "bell_number/1" do
    test "value tests" do
      ns = [1, 2, 4, 11, 34, 100, 147]

      os = [
        1,
        2,
        15,
        678_570,
        21_195_039_388_640_360_462_388_656_799,
        47_585_391_276_764_833_658_790_768_841_387_207_826_363_669_686_825_611_466_616_334_637_559_114_497_892_442_622_672_724_044_217_756_306_953_557_882_560_751,
        105_156_800_343_983_010_552_547_656_344_945_491_574_041_280_244_184_432_430_133_843_554_686_245_715_459_827_371_093_731_289_128_542_228_165_675_393_103_402_951_288_190_918_619_357_951_493_545_423_343_641_404_314_554_745_774_904_879_716_269_578_343_285
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.bell_number(n) == o
      end)
    end
  end

  describe "involutions_count/1" do
    test "value tests" do
      ns = [1, 2, 4, 10, 34, 100, 147]

      os = [
        1,
        2,
        10,
        9496,
        881_687_990_282_453_393_920,
        24_053_347_438_333_478_953_622_433_243_028_232_812_964_119_825_419_485_684_849_162_710_512_551_427_284_402_176,
        2_475_448_358_774_062_960_868_863_450_602_202_717_975_845_052_092_209_591_546_502_999_631_342_824_778_997_697_905_916_546_469_257_102_103_646_243_105_102_706_951_299_019_046_912
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.involutions_count(n) == o
      end)
    end
  end

  describe "lucas_number/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 200, 2000]

      os = [
        1,
        3,
        76,
        9349,
        627_376_215_338_105_766_356_982_006_981_782_561_278_127,
        9_446_708_185_759_308_415_384_067_495_999_677_431_530_963_218_480_368_032_804_826_598_281_856_324_445_977_322_684_945_038_267_086_094_364_761_366_000_137_291_348_836_189_673_785_457_326_607_903_364_013_465_483_957_273_836_804_336_595_888_397_782_139_002_535_468_799_414_419_546_535_346_394_066_447_256_463_745_311_310_661_259_359_973_909_189_379_826_722_425_332_112_242_554_370_313_063_917_929_424_669_185_186_291_673_823_764_654_829_513_873_821_477_637_371_237_697_744_102_254_002_802_127_905_427_315_493_403_711_022_179_894_479_121_632_130_910_668_828_127
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.lucas_number(n) == o
      end)
    end
  end

  describe "kolakoski sequences" do
    test "start_kolakoski_sequence/1" do
      assert Math.start_kolakoski_sequence() == {[], 0, {1, 2}}
    end

    test "extend_kolakoski_sequence/1" do
      assert Math.start_kolakoski_sequence()
             |> Math.extend_kolakoski_sequence() == {[1], 1, {1, 2}}

      assert Math.start_kolakoski_sequence()
             |> Math.extend_kolakoski_sequence()
             |> Math.extend_kolakoski_sequence() == {[1, 2, 2], 2, {1, 2}}

      assert Math.start_kolakoski_sequence()
             |> Math.extend_kolakoski_sequence()
             |> Math.extend_kolakoski_sequence()
             |> Math.extend_kolakoski_sequence() == {[1, 2, 2, 1, 1], 3, {1, 2}}
    end

    test "extend_kolakoski_sequence_to_length/2" do
      assert Math.start_kolakoski_sequence() |> Math.extend_kolakoski_sequence_to_length(30) ==
               {[
                  1,
                  2,
                  2,
                  1,
                  1,
                  2,
                  1,
                  2,
                  2,
                  1,
                  2,
                  2,
                  1,
                  1,
                  2,
                  1,
                  1,
                  2,
                  2,
                  1,
                  2,
                  1,
                  1,
                  2,
                  1,
                  2,
                  2,
                  1,
                  1,
                  2
                ], 20, {1, 2}}
    end
  end

  describe "triangle_position_for_element/1" do
    test "test values" do
      ns = [1, 2, 9, 19]
      os = [{2, 0}, {2, 1}, {4, 3}, {6, 4}]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.triangle_position_for_element(n) == o
      end)
    end
  end

  describe "triangle_row_for_element/1" do
    test "test values" do
      ns = [1, 2, 9, 19]
      os = [2, 2, 4, 6]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.triangle_row_for_element(n) == o
      end)
    end
  end

  describe "eulerian_number/2" do
    test "test values" do
      ns = [{1, 0}, {4, 2}, {6, 3}, {6, 7}, {9, 4}]
      os = [1, 11, 302, 0, 156_190]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, m}, o} ->
        assert Math.eulerian_number(n, m) == o
      end)
    end
  end

  describe "triangle_number/1" do
    test "test values" do
      ns = [1, 2, 9, 19, 43, 100, 200, 300, 754, 9000]
      os = [1, 3, 45, 190, 946, 5050, 20100, 45150, 284_635, 40_504_500]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.triangle_number(n) == o
      end)
    end
  end

  describe "wedderburn_etherington_number/1" do
    test "test values" do
      ns = [1, 2, 9, 19, 43, 100, 200, 300]

      os = [
        1,
        1,
        46,
        127_912,
        111_146_809_165_122,
        1_019_560_119_620_720_464_013_531_852_138_491_082,
        1_141_702_678_822_176_831_157_009_785_526_651_690_179_398_155_888_199_965_734_911_032_502_338_584_734,
        1_972_666_500_548_256_069_567_265_504_055_115_733_765_719_122_240_464_770_401_890_754_621_349_706_143_463_425_967_160_618_093_669_965_967_626_678_829_167
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.wedderburn_etherington_number(n) == o
      end)
    end
  end

  describe "binomial/2" do
    test "test values" do
      ns = [{5, 3}, {10, 5}, {15, 13}, {20, 8}, {34, 17}]
      os = [10, 252, 105, 125_970, 2_333_606_220]

      Enum.zip(ns, os)
      |> Enum.each(fn {{n, k}, o} ->
        assert Math.binomial(n, k) == o
      end)
    end
  end

  describe "euler_zig_zag/1" do
    test "test values" do
      ns = [1, 2, 9, 19, 43]

      os = [
        1,
        1,
        7936,
        29_088_885_112_832,
        283_727_921_907_431_909_304_183_316_295_787_837_183_229_952
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.euler_zig_zag(n) == o
      end)
    end
  end

  describe "factorial/1" do
    test "test values" do
      ns = [1, 2, 9, 19, 43]

      os = [
        1,
        2,
        362_880,
        121_645_100_408_832_000,
        60_415_263_063_373_835_637_355_132_068_513_997_507_264_512_000_000_000
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.factorial(n) == o
      end)
    end
  end

  describe "catalan_number/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 43, 100, 220]

      os = [
        1,
        2,
        4862,
        1_767_263_190,
        150_853_479_205_085_351_660_700,
        896_519_947_090_131_496_687_170_070_074_100_632_420_837_521_538_745_909_320,
        488_396_770_681_524_153_646_181_537_427_091_091_406_855_932_349_115_171_518_830_851_118_786_972_757_066_959_025_507_879_092_427_258_325_815_216_144_577_359_863_995_360_800
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.catalan_number(n) == o
      end)
    end
  end

  describe "rooted_tree_count/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 43, 100, 220]

      os = [
        1,
        1,
        286,
        4_688_676,
        271_097_737_169_671_824,
        51_384_328_351_659_326_880_337_136_395_054_298_255_277_970,
        4_757_010_736_205_951_296_379_181_392_778_931_809_047_934_415_149_223_874_825_669_806_143_414_483_354_636_665_310_702_400_385_569_088
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.rooted_tree_count(n) == o
      end)
    end
  end

  describe "hurwitz_radon_number/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 100, 220, 4444, 10000]
      os = [1, 2, 1, 1, 4, 4, 4, 9]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.hurwitz_radon_number(n) == o
      end)
    end
  end

  describe "divisors_of_form_mx_plus_b/3" do
    test "value tests" do
      # m, b, n
      ns = [{2, 1, 1}, {2, 1, 21}, {2, 9, 8}, {5, 7, 7}, {5, 7, 57}]
      os = [[1], [1, 3, 7, 21], [], [7], [57]]

      Enum.zip(ns, os)
      |> Enum.each(fn {{m, b, n}, o} ->
        assert Math.divisors_of_form_mx_plus_b(m, b, n) == o
      end)
    end
  end

  describe "is_of_mx_plus_b/3" do
    test "value tests" do
      # m, b, n
      ns = [{4, 3, 1}, {4, 3, 7}, {4, 3, 321}, {13, 5, 44}, {13, 5, 45}]
      os = [false, true, false, true, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {{m, b, n}, o} ->
        assert Math.is_of_mx_plus_b?(m, b, n) == o
      end)
    end
  end

  describe "p_adic_valuation/2" do
    test "value tests" do
      ns = [{2, 2}, {3, 0}, {3, 33}, {5, 31250}, {7, 49}, {11, 7_073_843_073}]
      os = [1, :infinity, 1, 6, 2, 9]

      Enum.zip(ns, os)
      |> Enum.each(fn {{p, n}, o} ->
        assert Math.p_adic_valuation(p, n) == o
      end)
    end

    test "must be prime" do
      assert_raise ArgumentError, fn -> Math.p_adic_valuation(4, 37) end
    end
  end

  describe "abelian_groups_count/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 100, 220, 4444, 10000]
      os = [1, 1, 2, 1, 4, 2, 2, 25]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.abelian_groups_count(n) == o
      end)
    end
  end

  describe "partition_count/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 100, 220]
      os = [1, 2, 30, 490, 190_569_292, 21_248_279_009_367]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.partition_count(n) == o
      end)
    end
  end

  describe "ramanujan_tau/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 700, 4545, 16001]

      os = [
        1,
        -24,
        -113_643,
        10_661_420,
        -628_483_682_444_800,
        -44_868_357_938_934_070_380,
        -115_858_115_573_561_490_511_998
      ]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.ramanujan_tau(n) == o
      end)
    end
  end

  describe "tau/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 700, 4545, 88688]
      os = [1, 2, 3, 2, 18, 12, 20]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.tau(n) == o
      end)
    end
  end

  describe "prime_factor_exponents/1" do
    test "value tests" do
      ns = [49, 8, 33_480_062_757]
      os = [%{7 => 2}, %{2 => 3}, %{3 => 2, 37 => 3, 271 => 2}]

      Enum.zip(ns, os)
      |> Enum.each(fn {c, o} ->
        assert Math.prime_factor_exponents(c) == o
      end)
    end
  end

  describe "is_power_of?/2" do
    test "value tests" do
      ns = [{8, 2}, {2401, 7}, {144, 12}, {867, 17}]
      os = [true, true, true, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {{c, b}, o} ->
        assert Math.is_power_of?(c, b) == o
      end)
    end
  end

  describe "radical/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 700, 4545, 88688]
      os = [1, 2, 3, 19, 70, 1515, 11086]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.radical(n) == o
      end)
    end
  end

  describe "least_prime_factor/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 999, 9999, 99999]
      os = [1, 2, 3, 19, 3, 3, 3]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.least_prime_factor(n) == o
      end)
    end
  end

  describe "greatest_prime_factor/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 999, 9999, 99999]
      os = [1, 2, 3, 19, 37, 101, 271]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.greatest_prime_factor(n) == o
      end)
    end
  end

  describe "omega/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 999, 9999, 99999]
      os = [0, 1, 1, 1, 2, 3, 3]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.omega(n) == o
      end)
    end
  end

  describe "bigomega/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 999, 9999, 99999]
      os = [0, 1, 2, 1, 4, 4, 4]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.bigomega(n) == o
      end)
    end
  end

  describe "mobius_function/1" do
    test "1" do
      assert Math.mobius_function(1) == 1
    end

    test "5" do
      assert Math.mobius_function(5) == -1
    end

    test "27" do
      assert Math.mobius_function(27) == 0
    end
  end

  describe "jordan_totient/2" do
    test "j_2" do
      k = 2
      ns = [1, 2, 10, 30, 999]
      os = [1, 3, 72, 576, 886_464]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_3" do
      k = 3
      ns = [1, 2, 10, 30, 999]
      os = [1, 7, 868, 22568, 960_058_008]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_4" do
      k = 4
      ns = [1, 2, 10, 30, 999]
      os = [1, 15, 9360, 748_800, 983_709_100_800]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_5" do
      k = 5
      ns = [1, 2, 10, 30, 999]
      os = [1, 31, 96844, 23_436_248, 990_915_284_398_248]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_6" do
      k = 6
      ns = [1, 2, 10, 30, 999]
      os = [1, 63, 984_312, 716_579_136, 992_651_447_419_579_584]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_7" do
      k = 7
      ns = [1, 2, 10, 30, 999]
      os = [1, 127, 9_921_748, 21_688_941_128, 992_566_908_799_084_488_888]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_8" do
      k = 8
      ns = [1, 2, 10, 30, 999]
      os = [1, 255, 99_609_120, 653_435_827_200, 991_876_743_346_590_471_859_200]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_9" do
      k = 9
      ns = [1, 2, 10, 30, 999]
      os = [1, 511, 998_046_364, 19_643_548_536_248, 990_985_566_285_083_759_262_811_848]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end

    test "j_10" do
      k = 10
      ns = [1, 2, 10, 30, 999]
      os = [1, 1023, 9_990_233_352, 589_903_298_968_896, 990_028_113_712_767_365_061_852_506_304]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.jordan_totient(n, k) == o
      end)
    end
  end

  describe "is_coprime?/2" do
    test "any 1" do
      assert Math.is_coprime?(1, 24)
      assert Math.is_coprime?(13, 1)
    end

    test "14/15" do
      assert Math.is_coprime?(14, 15)
    end

    test "2/2048" do
      assert Math.is_coprime?(2, 2048) == false
    end

    test "17/2048" do
      assert Math.is_coprime?(17, 2048)
    end
  end

  describe "totient/1" do
    test "1" do
      assert Math.totient(1) == 1
    end

    test "36" do
      assert Math.totient(36) == 12
    end

    test "141" do
      assert Math.totient(141) == 92
    end

    test "80000" do
      assert Math.totient(80000) == 32000
    end

    test "100000" do
      assert Math.totient(100_000) == 40000
    end
  end

  describe "is_b_smooth?/2" do
    test "not prime" do
      assert_raise ArgumentError, fn ->
        Math.is_b_smooth?(4, 20)
      end
    end
  end

  describe "is_root_of?/2" do
    test "2, 8" do
      assert Math.is_root_of?(2, 8)
    end

    test "4, 64" do
      assert Math.is_root_of?(4, 64)
    end

    test "7, 16807" do
      assert Math.is_root_of?(7, 16807)
    end

    test "9, 282429536481" do
      assert Math.is_root_of?(9, 282_429_536_481)
    end
  end

  describe "product_of_prime_factor_exponents/1" do
    test "1" do
      assert Math.product_of_prime_factor_exponents(1) == 1
    end

    test "8" do
      assert Math.product_of_prime_factor_exponents(8) == 3
    end

    test "134" do
      assert Math.product_of_prime_factor_exponents(135) == 3
    end

    test "100000" do
      assert Math.product_of_prime_factor_exponents(100_000) == 25
    end
  end

  describe "aliquot_sum/1" do
    test "1" do
      assert Math.aliquot_sum(1) == 0
    end

    test "10" do
      assert Math.aliquot_sum(10) == 8
    end

    test "100" do
      assert Math.aliquot_sum(100) == 117
    end
  end

  describe "pow/2" do
    test "-2^3" do
      assert Math.pow(-2, 3) == -8
    end

    test "2^10" do
      assert Math.pow(2, 10) == 1024
    end

    test "17^14" do
      assert Math.pow(17, 14) == 168_377_826_559_400_929
    end

    test "210^0" do
      assert Math.pow(210, 0) == 1
    end
  end

  describe "sigma/2" do
    @doc """
    Test values derived from OEIS Sequence data for out of band validation
    """
    test "sigma-0" do
      nums = [3, 5, 8, 16, 24, 30, 104]
      sigs = [2, 2, 4, 5, 8, 8, 8]
      sigma_sub = 0

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-1" do
      nums = [3, 5, 8, 16, 24, 30, 70]
      sigs = [4, 6, 15, 31, 60, 72, 144]
      sigma_sub = 1

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-2" do
      nums = [3, 5, 8, 16, 24, 30, 50]
      sigs = [10, 26, 85, 341, 850, 1300, 3255]
      sigma_sub = 2

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-3" do
      nums = [3, 5, 8, 16, 24, 42]
      sigs = [28, 126, 585, 4681, 16380, 86688]
      sigma_sub = 3

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-4" do
      nums = [3, 5, 8, 16, 24, 33]
      sigs = [82, 626, 4369, 69905, 358_258, 1_200_644]
      sigma_sub = 4

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-5" do
      nums = [3, 5, 8, 16, 24, 29]
      sigs = [244, 3126, 33825, 1_082_401, 8_253_300, 20_511_150]
      sigma_sub = 5

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-6" do
      nums = [3, 5, 8, 16, 18, 23]
      sigs = [730, 15626, 266_305, 17_043_521, 34_591_115, 148_035_890]
      sigma_sub = 6

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-7" do
      nums = [3, 5, 8, 16, 18, 22]
      sigs = [2188, 78126, 2_113_665, 270_549_121, 617_285_253, 2_513_845_188]
      sigma_sub = 7

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-8" do
      nums = [3, 5, 8, 16, 18, 20]
      sigs = [6562, 390_626, 16_843_009, 4_311_810_305, 11_064_693_731, 25_700_456_418]
      sigma_sub = 8

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-9" do
      nums = [3, 5, 8, 16, 18, 20]
      sigs = [19684, 1_953_126, 134_480_385, 68_853_957_121, 198_756_808_749, 513_002_215_782]
      sigma_sub = 9

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-10" do
      nums = [3, 5, 8, 16, 17]
      sigs = [59050, 9_765_626, 1_074_791_425, 1_100_586_419_201, 2_015_993_900_450]
      sigma_sub = 10

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-11" do
      nums = [3, 5, 8, 16, 18, 20]

      sigs = [
        177_148,
        48_828_126,
        8_594_130_945,
        17_600_780_175_361,
        64_300_154_115_093,
        204_900_053_024_478
      ]

      sigma_sub = 11

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-12" do
      nums = [3, 5, 8, 16, 18]
      sigs = [531_442, 244_140_626, 68_736_258_049, 281_543_712_968_705, 1_157_115_988_280_531]
      sigma_sub = 12

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-13" do
      nums = [3, 5, 8, 16, 18]

      sigs = [
        1_594_324,
        1_220_703_126,
        549_822_930_945,
        4_504_149_450_301_441,
        20_825_519_793_796_029
      ]

      sigma_sub = 13

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-14" do
      nums = [3, 5, 8, 16, 17]

      sigs = [
        4_782_970,
        6_103_515_626,
        4_398_314_962_945,
        72_061_992_352_890_881,
        168_377_826_559_400_930
      ]

      sigma_sub = 14

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-15" do
      nums = [3, 5, 8, 16]
      sigs = [14_348_908, 30_517_578_126, 35_185_445_863_425, 1_152_956_690_052_710_401]
      sigma_sub = 15

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-16" do
      nums = [3, 5, 8, 15]
      sigs = [43_046_722, 152_587_890_626, 281_479_271_743_489, 6_568_408_508_343_827_972]
      sigma_sub = 16

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-17" do
      nums = [3, 5, 8, 15]
      sigs = [129_140_164, 762_939_453_126, 2_251_816_993_685_505, 98_526_126_098_761_952_664]
      sigma_sub = 17

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-18" do
      nums = [3, 5, 8, 12]
      sigs = [387_420_490, 3_814_697_265_626, 18_014_467_229_220_865, 26_623_434_909_949_071_690]
      sigma_sub = 18

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-19" do
      nums = [3, 5, 8, 12]

      sigs = [
        1_162_261_468,
        19_073_486_328_126,
        144_115_462_954_287_105,
        319_480_609_006_403_630_044
      ]

      sigma_sub = 19

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end

    test "sigma-20" do
      nums = [3, 5, 8, 12]

      sigs = [
        3_486_784_402,
        95_367_431_640_626,
        1_152_922_604_119_523_329,
        3_833_763_649_708_914_645_906
      ]

      sigma_sub = 20

      Enum.zip(nums, sigs)
      |> Enum.each(fn {n, s} ->
        assert Math.sigma(n, sigma_sub) == s
      end)
    end
  end

  describe "factors/1" do
    test "1" do
      assert Math.factors(1) == [1]
    end

    test "small prime" do
      assert Math.factors(17) == [1, 17]
    end

    test "small composite" do
      assert Math.factors(24) == [1, 2, 3, 4, 6, 8, 12, 24]
    end

    test "large prime" do
      assert Math.factors(5_915_587_277) == [1, 5_915_587_277]
    end

    test "large composite" do
      assert Math.factors(12_345_678) == [
               1,
               2,
               3,
               6,
               9,
               18,
               47,
               94,
               141,
               282,
               423,
               846,
               14593,
               29186,
               43779,
               87558,
               131_337,
               262_674,
               685_871,
               1_371_742,
               2_057_613,
               4_115_226,
               6_172_839,
               12_345_678
             ]
    end
  end

  describe "sigma/1" do
    test "1" do
      assert Math.sigma(1) == 1
    end

    test "8" do
      assert Math.sigma(8) == 15
    end

    test "70" do
      assert Math.sigma(70) == 144
    end

    test "100_000" do
      assert Math.sigma(100_000) == 246_078
    end
  end

  describe "prime_factors/1" do
    test "1" do
      assert Math.prime_factors(1) == [1]
    end

    test "small composite" do
      assert Math.prime_factors(210) == [1, 2, 3, 5, 7]
    end

    test "small prime" do
      assert Math.prime_factors(101) == [1, 101]
    end

    test "large composite" do
      assert Math.prime_factors(3_217_644_767_340_672_907_899_084_554_130) == [
               1,
               2,
               3,
               5,
               7,
               11,
               13,
               17,
               19,
               23,
               29,
               31,
               37,
               41,
               43,
               47,
               53,
               59,
               61,
               67,
               71,
               73,
               79
             ]
    end

    test "large prime" do
      assert Math.prime_factors(5_754_853_343) == [1, 5_754_853_343]
    end
  end
  
end
