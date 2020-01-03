defmodule Chunky.MathTest do
  use ExUnit.Case, async: true

  alias Chunky.Math
  alias Chunky.Fraction
  doctest Chunky.Math

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

  describe "is_prime_power?/1" do
    test "value tests" do
      ns = [1, 2, 3, 5, 7, 32, 37, 41, 64]
      os = [true, true, true, true, true, true, true, true]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.is_prime_power?(n) == o
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

  describe "is_odious_number?/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 12345, 987_654_321, 987_654_323]
      os = [true, true, false, true, false, true, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.is_odious_number?(n) == o
      end)
    end
  end

  describe "is_prime_fast?/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 123_456_789, 987_654_321, 987_654_323]
      os = [false, true, false, true, false, false, true]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.is_prime_fast?(n) == o
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

  describe "is_sphenic_number?/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 700, 4543, 28438, 51322, 51334]
      os = [false, false, false, false, false, true, true, true, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.is_sphenic_number?(n) == o
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

  describe "is_cubefree?" do
    test "value tests" do
      ns = [1, 2, 9, 19, 64, 700, 2400, 4545, 88688]
      os = [true, true, true, true, false, true, false, true, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.is_cubefree?(n) == o
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

  describe "is_squarefree?/1" do
    test "value tests" do
      ns = [1, 2, 9, 19, 700, 2400, 4545, 88688]
      os = [true, true, false, true, false, false, false, false]

      Enum.zip(ns, os)
      |> Enum.each(fn {n, o} ->
        assert Math.is_squarefree?(n) == o
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

  describe "is_3_smooth?/1" do
    test "yes" do
      [1, 2, 3, 4, 6, 8, 144]
      |> Enum.each(fn n -> assert Math.is_3_smooth?(n) end)
    end

    test "no" do
      [5, 7, 10, 65, 513]
      |> Enum.each(fn n -> assert !Math.is_3_smooth?(n) end)
    end
  end

  describe "is_5_smooth?/1" do
    test "yes" do
      [1, 3, 5, 9, 128, 375]
      |> Enum.each(fn n -> assert Math.is_5_smooth?(n) end)
    end

    test "no" do
      [13, 14, 124, 280]
      |> Enum.each(fn n -> assert !Math.is_5_smooth?(n) end)
    end
  end

  describe "is_7_smooth?/1" do
    test "yes" do
      [4, 7, 16, 24, 49, 150, 180]
      |> Enum.each(fn n -> assert Math.is_7_smooth?(n) end)
    end

    test "no" do
      [19, 31, 130, 155, 190]
      |> Enum.each(fn n -> assert !Math.is_7_smooth?(n) end)
    end
  end

  describe "is_11_smooth?/1" do
    test "yes" do
      [5, 12, 56, 60, 121]
      |> Enum.each(fn n -> assert Math.is_11_smooth?(n) end)
    end

    test "no" do
      [13, 58, 102, 124, 138]
      |> Enum.each(fn n -> assert !Math.is_11_smooth?(n) end)
    end
  end

  describe "is_13_smooth?/1" do
    test "yes" do
      [6, 14, 24, 28, 44, 98]
      |> Enum.each(fn n -> assert Math.is_13_smooth?(n) end)
    end

    test "no" do
      [19, 38, 51, 94, 106]
      |> Enum.each(fn n -> assert !Math.is_13_smooth?(n) end)
    end
  end

  describe "is_17_smooth?/1" do
    test "yes" do
      [9, 17, 21, 54, 63, 80, 105]
      |> Enum.each(fn n -> assert Math.is_17_smooth?(n) end)
    end

    test "no" do
      [19, 29, 43, 92, 103]
      |> Enum.each(fn n -> assert !Math.is_17_smooth?(n) end)
    end
  end

  describe "is_19_smooth?/1" do
    test "yes" do
      [8, 20, 36, 52, 68, 91, 100]
      |> Enum.each(fn n -> assert Math.is_19_smooth?(n) end)
    end

    test "no" do
      [23, 47, 67, 79, 92, 97]
      |> Enum.each(fn n -> assert !Math.is_19_smooth?(n) end)
    end
  end

  describe "is_23_smooth?/1" do
    test "yes" do
      [8, 33, 50, 65, 77, 90, 95]
      |> Enum.each(fn n -> assert Math.is_23_smooth?(n) end)
    end

    test "no" do
      [29, 37, 47, 53, 67, 83]
      |> Enum.each(fn n -> assert !Math.is_23_smooth?(n) end)
    end
  end

  describe "is_achilles_number?/1" do
    test "1" do
      assert Math.is_achilles_number?(1) == false
    end

    test "70" do
      assert Math.is_achilles_number?(70) == false
    end

    test "72" do
      assert Math.is_achilles_number?(72)
    end

    test "5000" do
      assert Math.is_achilles_number?(5000)
    end

    test "5425069447" do
      assert Math.is_achilles_number?(5_425_069_447)
    end
  end

  describe "is_perfect_power?/1" do
    test "1" do
      assert Math.is_perfect_power?(1) == true
    end

    test "8" do
      assert Math.is_perfect_power?(8)
    end

    test "18" do
      assert Math.is_perfect_power?(18) == false
    end

    test "676" do
      assert Math.is_perfect_power?(676)
    end

    test "1010" do
      assert Math.is_perfect_power?(1010) == false
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

  describe "is_perfect_square?/1" do
    test "3" do
      assert Math.is_perfect_square?(3) == false
    end

    test "12" do
      assert Math.is_perfect_square?(12) == false
    end

    test "49" do
      assert Math.is_perfect_square?(49)
    end

    test "29241" do
      assert Math.is_perfect_square?(29241)
    end
  end

  describe "is_perfect_cube?/1" do
    test "27" do
      assert Math.is_perfect_cube?(27)
    end

    test "400" do
      assert Math.is_perfect_cube?(400) == false
    end

    test "405224" do
      assert Math.is_perfect_cube?(405_224)
    end
  end

  describe "is_highly_powerful_number?/1" do
    test "1" do
      assert Math.is_highly_powerful_number?(1)
    end

    test "2" do
      assert Math.is_highly_powerful_number?(2) == false
    end

    test "64" do
      assert Math.is_highly_powerful_number?(64)
    end

    test "65" do
      assert Math.is_highly_powerful_number?(65) == false
    end

    test "41472" do
      assert Math.is_highly_powerful_number?(41472)
    end

    test "41474" do
      assert Math.is_highly_powerful_number?(41474) == false
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

  describe "is_powerful_number?/1" do
    test "1" do
      assert Math.is_powerful_number?(1)
    end

    test "48" do
      assert Math.is_powerful_number?(48) == false
    end

    test "49" do
      assert Math.is_powerful_number?(49)
    end

    test "972" do
      assert Math.is_powerful_number?(972)
    end
  end

  describe "is_highly_abundant?/1" do
    test "1" do
      assert Math.is_highly_abundant?(1)
    end

    test "10" do
      assert Math.is_highly_abundant?(10)
    end

    test "11" do
      assert Math.is_highly_abundant?(11) == false
    end

    test "59" do
      assert Math.is_highly_abundant?(59) == false
    end

    test "60" do
      assert Math.is_highly_abundant?(60)
    end

    test "1980" do
      assert Math.is_highly_abundant?(1980)
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

  describe "is_arithmetic_number?/1" do
    test "1" do
      assert Math.is_arithmetic_number?(1)
    end

    test "12910" do
      assert Math.is_arithmetic_number?(12910)
    end

    test "12916" do
      assert Math.is_arithmetic_number?(12916) == false
    end
  end

  describe "is_perfect?/1" do
    test "1" do
      assert Math.is_perfect?(1) == false
    end

    test "6" do
      assert Math.is_perfect?(6)
    end

    test "20" do
      assert Math.is_perfect?(20) == false
    end

    test "496" do
      assert Math.is_perfect?(496)
    end

    test "1024" do
      assert Math.is_perfect?(1024) == false
    end

    test "137438691328" do
      assert Math.is_perfect?(137_438_691_328)
    end
  end

  describe "is_deficient?/1" do
    test "1" do
      assert Math.is_deficient?(1)
    end

    test "6" do
      assert Math.is_deficient?(6) == false
    end

    test "60" do
      assert Math.is_deficient?(60) == false
    end

    test "265" do
      assert Math.is_deficient?(265)
    end
  end

  describe "next_deficient/1" do
    test "1" do
      assert Math.next_deficient(1) == 2
    end

    test "5" do
      assert Math.next_deficient(5) == 7
    end

    test "100" do
      assert Math.next_deficient(100) == 101
    end
  end

  describe "is_abundant?/1" do
    test "1" do
      assert Math.is_abundant?(1) == false
    end

    test "12" do
      assert Math.is_abundant?(12)
    end

    test "60" do
      assert Math.is_abundant?(60)
    end

    test "252" do
      assert Math.is_abundant?(252)
    end

    test "945" do
      assert Math.is_abundant?(945)
    end
  end

  describe "next_abundant/1" do
    test "1" do
      assert Math.next_abundant(1) == 12
    end

    test "12" do
      assert Math.next_abundant(12) == 18
    end

    test "144" do
      assert Math.next_abundant(144) == 150
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

  describe "is_prime?/1" do
    test "first 100 primes" do
      [
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
        79,
        83,
        89,
        97,
        101,
        103,
        107,
        109,
        113,
        127,
        131,
        137,
        139,
        149,
        151,
        157,
        163,
        167,
        173,
        179,
        181,
        191,
        193,
        197,
        199,
        211,
        223,
        227,
        229,
        233,
        239,
        241,
        251,
        257,
        263,
        269,
        271,
        277,
        281,
        283,
        293,
        307,
        311,
        313,
        317,
        331,
        337,
        347,
        349,
        353,
        359,
        367,
        373,
        379,
        383,
        389,
        397,
        401,
        409,
        419,
        421,
        431,
        433,
        439,
        443,
        449,
        457,
        461,
        463,
        467,
        479,
        487,
        491,
        499,
        503,
        509,
        521,
        523,
        541
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "0" do
      assert Math.is_prime?(0) == false
    end

    test "1" do
      assert Math.is_prime?(1) == false
    end

    test "first 100 evens" do
      2..101
      |> Enum.map(fn i -> i * 2 end)
      |> Enum.each(fn e ->
        assert Math.is_prime?(e) == false
      end)
    end

    test "large even" do
      assert 234_567_887_654_323_456_789_876_543_212_345_678_765_432_345_678_765_432_345_678_765_434
             |> Math.is_prime?() == false
    end

    test "large prime" do
      assert 94_366_396_730_334_173_383_107_353_049_414_959_521_528_815_310_548_187_030_165_936_229_578_960_209_523_421_808_912_459_795_329_035_203_510_284_576_187_160_076_386_643_700_441_216_547_732_914_250_578_934_261_891_510_827_140_267_043_592_007_225_160_798_348_913_639_472_564_715_055_445_201_512_461_359_359_488_795_427_875_530_231_001_298_552_452_230_535_485_049_737_222_714_000_227_878_890_892_901_228_389_026_881
             |> Math.is_prime?()
    end

    test "small semi-prime" do
      assert (104_723 * 104_729) |> Math.is_prime?() == false
    end

    test "large semi-prime" do
      p_a =
        94_366_396_730_334_173_383_107_353_049_414_959_521_528_815_310_548_187_030_165_936_229_578_960_209_523_421_808_912_459_795_329_035_203_510_284_576_187_160_076_386_643_700_441_216_547_732_914_250_578_934_261_891_510_827_140_267_043_592_007_225_160_798_348_913_639_472_564_715_055_445_201_512_461_359_359_488_795_427_875_530_231_001_298_552_452_230_535_485_049_737_222_714_000_227_878_890_892_901_228_389_026_881

      p_b =
        138_028_649_176_899_647_846_076_023_812_164_793_645_371_887_571_371_559_091_892_986_639_999_096_471_811_910_222_267_538_577_825_033_963_552_683_101_137_782_650_479_906_670_021_895_135_954_212_738_694_784_814_783_986_671_046_107_023_185_842_481_502_719_762_055_887_490_765_764_329_237_651_328_922_972_514_308_635_045_190_654_896_041_748_716_218_441_926_626_988_737_664_133_219_271_115_413_563_418_353_821_396_401

      is_p = (p_a * p_b) |> Math.is_prime?()
      assert p_a * p_b > p_a
      assert is_p == false
    end

    test "10 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        5_915_587_277,
        1_500_450_271,
        3_267_000_013,
        5_754_853_343,
        4_093_082_899,
        9_576_890_767,
        3_628_273_133,
        2_860_486_313,
        5_463_458_053,
        3_367_900_313
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "20 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        48_112_959_837_082_048_697,
        54_673_257_461_630_679_457,
        29_497_513_910_652_490_397,
        40_206_835_204_840_513_073,
        12_764_787_846_358_441_471,
        71_755_440_315_342_536_873,
        45_095_080_578_985_454_453,
        27_542_476_619_900_900_873,
        66_405_897_020_462_343_733,
        36_413_321_723_440_003_717
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "30 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        671_998_030_559_713_968_361_666_935_769,
        282_174_488_599_599_500_573_849_980_909,
        521_419_622_856_657_689_423_872_613_771,
        362_736_035_870_515_331_128_527_330_659,
        115_756_986_668_303_657_898_962_467_957,
        590_872_612_825_179_551_336_102_196_593,
        564_819_669_946_735_512_444_543_556_507,
        513_821_217_024_129_243_948_411_056_803,
        416_064_700_201_658_306_196_320_137_931,
        280_829_369_862_134_719_390_036_617_067
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "40 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        2_425_967_623_052_370_772_757_633_156_976_982_469_681,
        1_451_730_470_513_778_492_236_629_598_992_166_035_067,
        6_075_380_529_345_458_860_144_577_398_704_761_614_649,
        3_615_415_881_585_117_908_550_243_505_309_785_526_231,
        5_992_830_235_524_142_758_386_850_633_773_258_681_119,
        4_384_165_182_867_240_584_805_930_970_951_575_013_697,
        5_991_810_554_633_396_517_767_024_967_580_894_321_153,
        6_847_944_682_037_444_681_162_770_672_798_288_913_849,
        4_146_162_919_458_530_168_953_357_282_201_621_124_057,
        5_570_373_270_183_181_665_098_052_481_109_678_989_411
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "50 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        22_953_686_867_719_691_230_002_707_821_868_552_601_124_472_329_079,
        30_762_542_250_301_270_692_051_460_539_586_166_927_291_732_754_961,
        29_927_402_397_991_286_489_627_837_734_179_186_385_188_296_382_227,
        46_484_729_803_540_183_101_830_167_875_623_788_794_533_441_216_779,
        95_647_806_479_275_528_135_733_781_266_203_904_794_419_563_064_407,
        64_495_327_731_887_693_539_738_558_691_066_839_103_388_567_300_449,
        58_645_563_317_564_309_847_334_478_714_939_069_495_243_200_674_793,
        48_705_091_355_238_882_778_842_909_230_056_712_140_813_460_157_899,
        15_452_417_011_775_787_851_951_047_309_563_159_388_840_946_309_807,
        53_542_885_039_615_245_271_174_355_315_623_704_334_284_773_568_199
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "60 digit primes " do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        622_288_097_498_926_496_141_095_869_268_883_999_563_096_063_592_498_055_290_461,
        610_692_533_270_508_750_441_931_226_384_209_856_405_876_657_993_997_547_171_387,
        668_486_051_696_691_190_102_895_306_426_999_370_394_054_817_506_916_629_001_851,
        313_539_589_974_026_666_385_010_319_707_341_761_012_894_704_055_733_952_484_113,
        470_287_785_858_076_441_566_723_507_866_751_092_927_015_824_834_881_906_763_507,
        361_720_912_810_755_408_215_708_460_645_842_859_722_715_865_206_816_237_944_587,
        378_348_910_233_465_647_859_184_421_334_615_532_543_749_747_185_321_634_086_219,
        669_483_106_578_092_405_936_560_831_017_556_154_622_901_950_048_903_016_651_289,
        351_300_033_958_683_656_629_281_197_430_236_951_045_077_917_074_227_778_834_807,
        511_704_374_946_917_490_638_851_104_912_462_284_144_240_813_125_071_454_126_151
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "70 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        4_669_523_849_932_130_508_876_392_554_713_407_521_319_117_239_637_943_224_980_015_676_156_491,
        4_906_275_427_767_802_358_357_703_730_938_087_362_176_142_642_699_093_827_933_107_888_253_709,
        2_409_130_781_894_986_571_956_777_721_649_968_801_511_465_915_451_196_376_269_177_305_066_867,
        7_595_009_151_080_016_652_449_223_792_726_748_985_452_052_945_413_160_073_645_842_090_827_711,
        3_822_535_632_033_509_464_266_159_811_805_197_854_872_067_042_990_716_005_808_372_194_664_933,
        5_885_903_965_180_586_669_073_549_360_644_800_583_458_138_238_012_033_647_539_649_735_017_287,
        5_850_725_702_766_829_291_491_370_712_136_286_009_948_642_125_131_436_113_342_815_786_444_567,
        4_237_080_979_868_607_742_750_808_600_846_638_318_022_863_593_147_774_739_556_427_943_294_937,
        3_773_180_816_219_384_606_784_189_538_899_553_110_499_442_295_782_576_702_222_280_384_917_551,
        9_547_848_065_153_773_335_707_495_885_453_566_120_069_130_270_246_768_806_790_708_393_909_999
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "80 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        18_532_395_500_947_174_450_709_383_384_936_679_868_383_424_444_311_405_679_463_280_782_405_796_233_163_977,
        39_688_644_836_832_882_526_173_831_577_536_117_815_818_454_437_810_437_210_221_644_553_381_995_813_014_959,
        44_822_481_511_601_066_098_713_481_453_161_748_979_849_764_719_554_039_096_395_688_045_048_053_310_178_487,
        54_875_133_386_847_519_273_109_693_154_204_970_395_475_080_920_935_355_580_245_252_923_343_305_939_004_903,
        40_979_218_404_449_071_854_385_509_743_772_465_043_384_063_785_613_460_568_705_289_173_181_846_900_181_503,
        56_181_069_873_486_948_735_852_120_493_417_527_485_226_565_150_317_825_065_106_074_926_567_306_630_125_961,
        19_469_495_355_310_348_270_990_592_580_191_998_639_221_450_743_640_952_620_236_903_851_789_700_309_402_857,
        34_263_233_064_835_421_125_264_776_608_163_440_537_925_705_997_962_346_596_977_803_462_033_841_059_628_723,
        14_759_984_361_802_021_245_410_475_928_101_669_395_348_791_811_705_709_117_374_129_427_051_861_355_011_151,
        67_120_333_368_520_272_532_940_669_112_228_025_474_970_578_938_046_280_618_394_371_551_488_988_323_794_243
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "90 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        282_755_483_533_707_287_054_752_184_321_121_345_766_861_480_697_448_703_443_857_012_153_264_407_439_766_013_042_402_571,
        370_332_600_450_952_648_802_345_609_908_335_058_273_399_487_356_359_263_038_584_017_827_194_636_172_568_988_257_769_601,
        463_199_005_416_013_829_210_323_411_514_132_845_972_525_641_604_435_693_287_586_851_332_821_637_442_813_833_942_427_923,
        374_413_471_625_854_958_269_706_803_072_259_202_131_399_386_829_497_836_277_471_117_216_044_734_280_924_224_462_969_371,
        664_869_143_773_196_608_462_001_772_779_382_650_311_673_568_542_237_852_546_715_913_135_688_434_614_731_717_844_868_261,
        309_133_826_845_331_278_722_882_330_592_890_120_369_379_620_942_948_199_356_542_318_795_450_228_858_357_445_635_314_757,
        976_522_637_021_306_403_150_551_933_319_006_137_720_124_048_624_544_172_072_735_055_780_411_834_104_862_667_155_922_841,
        635_752_334_942_676_003_169_313_626_814_655_695_963_315_290_125_751_655_287_486_460_091_602_385_142_405_742_365_191_277,
        625_161_793_954_624_746_211_679_299_331_621_567_931_369_768_944_205_635_791_355_694_727_774_487_677_706_013_842_058_779,
        204_005_728_266_090_048_777_253_207_241_416_669_051_476_369_216_501_266_754_813_821_619_984_472_224_780_876_488_344_279
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end

    test "100 digit primes" do
      # primes from https://primes.utm.edu/lists/small/small.html
      [
        2_074_722_246_773_485_207_821_695_222_107_608_587_480_996_474_721_117_292_752_992_589_912_196_684_750_549_658_310_084_416_732_550_077,
        2_367_495_770_217_142_995_264_827_948_666_809_233_066_409_497_699_870_112_003_149_352_380_375_124_855_230_068_487_109_373_226_251_983,
        1_814_159_566_819_970_307_982_681_716_822_107_016_038_920_170_504_391_457_462_563_485_198_126_916_735_167_260_215_619_523_429_714_031,
        5_371_393_606_024_775_251_256_550_436_773_565_977_406_724_269_152_942_136_415_762_782_810_562_554_131_599_074_907_426_010_737_503_501,
        6_513_516_734_600_035_718_300_327_211_250_928_237_178_281_758_494_417_357_560_086_828_416_863_929_270_451_437_126_021_949_850_746_381,
        5_628_290_459_057_877_291_809_182_450_381_238_927_697_314_822_133_923_421_169_378_062_922_140_081_498_734_424_133_112_032_854_812_293,
        2_908_511_952_812_557_872_434_704_820_397_229_928_450_530_253_990_158_990_550_731_991_011_846_571_635_621_025_786_879_881_561_814_989,
        2_193_992_993_218_604_310_884_461_864_618_001_945_131_790_925_282_531_768_679_169_054_389_241_527_895_222_169_476_723_691_605_898_517,
        5_202_642_720_986_189_087_034_837_832_337_828_472_969_800_910_926_501_361_967_872_059_486_045_713_145_450_116_712_488_685_004_691_423,
        7_212_610_147_295_474_909_544_523_785_043_492_409_969_382_148_186_765_460_082_500_085_393_519_556_525_921_455_588_705_423_020_751_421
      ]
      |> Enum.each(fn prime ->
        assert Math.is_prime?(prime)
      end)
    end
  end
end
