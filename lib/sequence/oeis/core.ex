defmodule Chunky.Sequence.OEIS.Core do
  @moduledoc """
  OEIS [Core](http://oeis.org/search?q=keyword%3acore&sort=number) Sequences.

  ## Available Sequences

   - [A000001 - Number of groups of order n](https://oeis.org/A000001) - `:a000001` - `create_sequence_a000001/1`
   - [A000002 - Kolakoski sequence](https://oeis.org/A000002) - `:a000002` - `create_sequence_a000002/1`
   - [A000004 - The zero sequence](https://oeis.org/A000004) - `:a000004` - `create_sequence_a000004/1`
   - [A000005 - Divisors of N](https://oeis.org/A000005) - `:a000005` - `create_sequence_a000005/1`
   - [A000007 - The characteristic function of {0}: a(n) = 0^n](https://oeis.org/A000007) - `:a000007` - `create_sequence_a000007/1`
   - [A000009 - Number of partitions of n into distinct parts](http://oeis.org/A000009) - `:a000009` - `create_sequence_a000009/1`
   - [A000010 - Euler's totient function](https://oeis.org/A000010) - `:a000010` - `create_sequence_a000010/1`
   - [A000012 - The simplest sequence of positive numbers: the all 1's sequence](https://oeis.org/A000012) - `:a000012` - `create_sequence_a000012/1`
   - [A000027 - The positive integers](https://oeis.org/A000027) - `:a000027` - `create_sequence_a000027/1`
   - [A000032 - Lucas numbers beginning at 2](https://oeis.org/A000032) - `:a000032` - `create_sequence_a000032/1`
   - [A000035 - Period 2: repeat [0, 1]; a(n) = n mod 2](https://oeis.org/A000035) - `:a000035` - `create_sequence_a000035/1`
   - [A000040 - The prime numbers.](https://oeis.org/A000040) - `:a000040` - `create_sequence_a000040/1`
   - [A000041 - Partition Numbers](https://oeis.org/A000041) - `:a000041` - `create_sequence_a000041/1`
   - [A000043 - Mersenne exponents: primes p such that 2^p - 1 is prime.](https://oeis.org/A000043) - `:a000043` - `create_sequence_a000043/1`
   - [A000045 - Fibonacci Numbers](https://oeis.org/A000045) - `:a000045` or `:fibonacci` - `create_sequence_a000045/1`
   - [A000069 - Odious numbers: numbers with an odd number of 1's in their binary expansion](https://oeis.org/A000069) - `:a000069` - `create_sequence_a000069/1`
   - [A000079 - Powers of 2](https://oeis.org/A000079) - `:a000079` - `create_sequence_a000079/1`
   - [A000081 - Number of unlabeled rooted trees with n nodes](https://oeis.org/A000081) - `:a000081` - `create_sequence_a000081/1`
   - [A000085 - Number of self-inverse permutations on n letters, also known as involutions](https://oeis.org/A000085) - `:a000085` - `create_sequence_a000085/1`
   - [A000105 - Number of free polyominoes (or square animals) with n cells](https://oeis.org/A000105) - `:a000105` - `create_sequence_a000105/1`
   - [A000108 - Catalan numbers: C(n), Also called Segner numbers.](https://oeis.org/A000108) - `:a000108` - `create_sequence_a000108/1`
   - [A000109 - Number of simplicial polyhedra with n nodes](https://oeis.org/A000109) - `:a000109` - `create_sequence_a000109/1`
   - [A000110 - Bell or exponential numbers: number of ways to partition a set of n labeled elements](https://oeis.org/A000110) - `:a000110` - `create_sequence_a000110/1`
   - [A000111 - Euler or up/down numbers](https://oeis.org/A000111) - `:a000111` - `create_sequence_a000111/1`
   - [A000112 - Number of partially ordered sets ("posets") with n unlabeled elements](https://oeis.org/A000112) - `:a000112` - `create_sequence_a000112/1`
   - [A000120 - 1's-counting sequence: number of 1's in binary expansion of n (or the binary weight of n)](https://oeis.org/A000120) - `:a000120` - `create_sequence_a000120/1`
   - [A000124 - Central polygonal numbers (the Lazy Caterer's sequence)](https://oeis.org/A000124) - `:a000124` - `create_sequence_a000124/1`
   - [A000129 - Pell numbers: a(n) = 2*a(n-1) + a(n-2)](https://oeis.org/A000129) - `:a000129` - `create_sequence_a000129/1`
   - [A000142 - Factorial numbers: n! = 1*2*3*4*...*n ](https://oeis.org/A000142) - `:a000142` - `create_sequence_a000142/1`
   - [A000166 - Subfactorial or rencontres numbers, or derangements of `n`](https://oeis.org/A000166) - `:a000166` - `create_sequence_a000166/1`
   - [A000169 - Number of labeled rooted trees with n nodes: n^(n-1)](https://oeis.org/A000169) - `:a000169` - `create_sequence_a000169/1`
   - [A000203 - Sum of Divisors](https://oeis.org/A000203) - `:a000203` - `create_sequence_a000203/1`
   - [A000204 - Lucas numbers (beginning with 1)](https://oeis.org/A000204) - `:a000204` - `create_sequence_a000204/1`
   - [A000217 - Triangular numbers: a(n) = binomial(n+1,2)](https://oeis.org/A000217) - `:a000217` - `create_sequence_a000217/1`
   - [A000219 - Number of planar partitions (or plane partitions) of n](https://oeis.org/A000219) - `:a000219` - `create_sequence_a000219/1`
   - [A000225 - a(n) = 2^n - 1](https://oeis.org/A000225) - `:a000225` - `create_sequence_a000225/1`
   - [A000244 - Powers of 3](https://oeis.org/A000244) - `:a000244` - `create_sequence_a000244/1`
   - [A000262 - Number of "sets of lists"](https://oeis.org/A000262) - `:a000262` - `create_sequence_a000262/1`
   - [A000272 - Number of trees on n labeled nodes](https://oeis.org/A000272) - `:a000272` - `create_sequence_a000272/1`
   - [A000290 - The squares: a(n) = n^2](https://oeis.org/A000290) - `:a000290` - `create_sequence_a000290/1`
   - [A000292 - Tetrahedral (or triangular pyramidal) numbers](https://oeis.org/A000292) - `:a000292` - `create_sequence_a000292/1`
   - [A000302 - Powers of 4: a(n) = 4^n](https://oeis.org/A000302) - `:a000302` - `create_sequence_a000302/1`
   - [A000312 - a(n) = n^n; number of labeled mappings from n points to themselves](https://oeis.org/A000312) - `:a000312` - `create_sequence_a000312/1`
   - [A000326 - Pentagonal numbers: a(n) = n*(3*n-1)/2.](https://oeis.org/A000326) - `:a000326` - `create_sequence_a000326/1`
   - [A000330 - Square pyramidal numbers](https://oeis.org/A000330) - `:a000330` - `create_sequence_a000330/1`
   - [A000364 - Euler (or secant or "Zig") numbers](https://oeis.org/A000364) - `:a000364` - `create_sequence_a000364/1`
   - [A000396 - Perfect Numbers](https://oeis.org/A000396) - `:a000396` - `create_sequence_a000396/1`
   - [A000521 - Coefficients of modular function j as power series in q = e^(2 Pi i t)](https://oeis.org/A000521) - `:a000521` - `create_sequence_a000521/1`
   - [A000578 - The cubes: a(n) = n^3.](https://oeis.org/A000578) - `:a000578` - `create_sequence_a000578/1`
   - [A000583 - Fourth powers: a(n) = n^4.](https://oeis.org/A000583) - `:a000583` - `create_sequence_a000583/1`
   - [A000593 - Sum of Odd Divisors of N](https://oeis.org/A000593) - `:a000593` - `create_sequence_a000593/1`
   - [A000594 - Ramanujan's tau function](https://oeis.org/A000594) - `:a000594` - `create_sequence_a000594/1`
   - [A000609 - Number of threshold functions of n or fewer variables](https://oeis.org/A000609) - `:a000609` - `create_sequence_a000609/1`
   - [A000670 - Fubini numbers](https://oeis.org/A000670) - `:a000670` - `create_sequence_a000670/1`
   - [A000688 - Number of Abelian groups of order n](https://oeis.org/A000688) - `:a000688` - `create_sequence_a000688/1`
   - [A000720 - pi(n), the number of primes <= n.](https://oeis.org/A000720) - `:a000720` - `create_sequence_a000720/1`
   - [A000796 - Decimal expansion of Pi](https://oeis.org/A000796) - `:a000796` - `create_sequence_a000796/1`
   - [A000798 - Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements](https://oeis.org/A000798) - `:a000798` - `create_sequence_a000798/1`
   - [A000959 - Lucky numbers](https://oeis.org/A000959) - `:a000959` - `create_sequence_a000959/1`
   - [A000961 - Powers of primes. Alternatively, 1 and the prime powers (p^k, p prime, k >= 1)](https://oeis.org/A000961) - `:a000961` - `create_sequence_a000961/1`
   - [A000984 - Central binomial coefficients: binomial(2*n,n)](https://oeis.org/A000984) - `:a000984` - `create_sequence_a000984/1`
   - [A001003 - Schroeder's second problem; also called super-Catalan numbers or little Schroeder numbers](https://oeis.org/A001003) - `:a001003` - `create_sequence_a001003/1`
   - [A001006 - Motzkin numbers: number of ways of drawing any number of nonintersecting chords joining n points on a circle](https://oeis.org/A001006) - `:a001006` - `create_sequence_a001006/1`
   - [A001045 - Jacobsthal sequence (or Jacobsthal numbers)](https://oeis.org/A001045) - `:a001045` - `create_sequence_a001045/1`
   - [A001055 - The multiplicative partition function: number of ways of factoring n with all factors greater than 1](https://oeis.org/A001055) - `:a001055` - `create_sequence_a001055/1`
   - [A001065 - Sum of proper divisors (Aliquot parts) of N.](https://oeis.org/A001065) - `:a001065` - `create_sequence_a001065/1`
   - [A001147 - Double factorial of odd numbers: a(n) = (2*n-1)!! = 1*3*5*...*(2*n-1).](https://oeis.org/A001147) - `:a001147` - `create_sequence_a001147/1`
   - [A001157 - Sum of squares of divisors of N](https://oeis.org/A001157) - `:a001157` - `create_sequence_a001157/1`
   - [A001190 - Wedderburn-Etherington numbers: unlabeled binary rooted trees](https://oeis.org/A001190) - `:a001190` - `create_sequence_a001190/1`
   - [A001221 - Number of distinct primes dividing n (also called omega(n)).](https://oeis.org/A001221) - `:a001221` - `create_sequence_a001221/1`
   - [A001222 - Number of prime divisors of n counted with multiplicity (also called bigomega(n) or Omega(n)).](https://oeis.org/A001222) - `:a001222` - `create_sequence_a001222/1`
   - [A001227 - Number of odd divisors of n.](https://oeis.org/A001227) - `:a001227` - `create_sequence_a001227/1`
   - [A001358 - Semiprimes (or biprimes): products of two primes](https://oeis.org/A001358) - `:a001358` - `create_sequence_a001358/1`
   - [A001405 - a(n) = binomial(n, floor(n/2)).](https://oeis.org/A001405) - `:a001405` - `create_sequence_a001405/1`
   - [A001477 - The nonnegative integers.](https://oeis.org/A001477) - `:a001477` - `create_sequence_a001477/1`
   - [A001489 - a(n) = -n.](https://oeis.org/A001489) - `:a001489` - `create_sequence_a001489/1`
   - [A001511 - The ruler function: 2^a(n) divides 2n](https://oeis.org/A001511) - `:a001511` - `create_sequence_a001511/1`
   - [A001519 - a(n) = 3*a(n-1) - a(n-2), with a(0) = a(1) = 1.](https://oeis.org/A001519) - `:a001519` - `create_sequence_a001519/1`
   - [A001615 - Dedekind psi function](https://oeis.org/A001615) - `:a001615` - `create_sequence_a001615/1`
   - [A001700 - a(n) = binomial(2n+1, n+1): number of ways to put n+1 indistinguishable balls into n+1 distinguishable boxes = number of (n+1)-st degree monomials in n+1 variables = number of monotone maps from 1..n+1 to 1..n+1.](https://oeis.org/A001700) - `:a001700` - `create_sequence_a001700/1`
   - [A001764 - a(n) = binomial(3n,n)/(2n+1) (enumerates ternary trees and also noncrossing trees).](https://oeis.org/A001764) - `:a001764` - `create_sequence_a001764/1`
   - [A001906 - F(2n) = bisection of Fibonacci sequence: a(n) = 3*a(n-1) - a(n-2).](https://oeis.org/A001906) - `:a001906` - `create_sequence_a001906/1`
   - [A001969 - Evil numbers: numbers with an even number of 1's in their binary expansion.](https://oeis.org/A001969) - `:a001969` - `create_sequence_a001969/1`
   - [A002106 - Number of transitive permutation groups of degree n](https://oeis.org/A002106) - `:a002106` - `create_sequence_a002106/1`
   - [A002113 - Palindromes in base 10.](https://oeis.org/A002113) - `:a002113` - `create_sequence_a002113/1`
   - [A002275 - Repunits: (10^n - 1)/9. Often denoted by R_n.](https://oeis.org/A002275) - `:a002275` - `create_sequence_a002275/1`
   - [A002378 - Oblong (or promic, pronic, or heteromecic) numbers: a(n) = n*(n+1).](https://oeis.org/A002378) - `:a002378` - `create_sequence_a002378/1`
   - [A002487 - Stern's diatomic series (or Stern-Brocot sequence): a(0) = 0, a(1) = 1; for n > 0: a(2*n) = a(n), a(2*n+1) = a(n) + a(n+1).](https://oeis.org/A002487) - `:a002487` - `create_sequence_a002487/1`
   - [A002620 - Quarter-squares: floor(n/2)*ceiling(n/2). Equivalently, floor(n^2/4).](https://oeis.org/A002620) - `:a002620` - `create_sequence_a002620/1`
   - [A002654 - Number of ways of writing n as a sum of at most two nonzero squares, where order matters](https://oeis.org/A002654) - `:a002654` - `create_sequence_a002654/1`
   - [A002808 - The composite numbers: numbers n of the form x*y for x > 1 and y > 1.](https://oeis.org/A002808) - `:a002808` - `create_sequence_a002808/1`
   - [A003094 - Number of unlabeled connected planar simple graphs with n nodes](https://oeis.org/A003094) - `:a003094` - `create_sequence_a003094/1`
   - [A003418 - Least common multiple (or LCM) of {1, 2, ..., n} for n >= 1, a(0) = 1.](https://oeis.org/A003418) - `:a003418` - `create_sequence_a003418/1`
   - [A003484 - Radon function, also called Hurwitz-Radon numbers](https://oeis.org/A003484) - `:a003484` - `create_sequence_a003484/1`
   - [A004526 - Nonnegative integers repeated, floor(n/2).](https://oeis.org/A004526) - `:a004526` - `create_sequence_a004526/1`
   - [A005100 - Deficient Numbers](https://oeis.org/A005100) - `:a005100` - `create_sequence_a005100/1`
   - [A005101 - Abundant Numbers](https://oeis.org/A005101) - `:a005101` - `create_sequence_a005101/1`
   - [A005117 - Squarefree numbers: numbers that are not divisible by a square greater than 1](https://oeis.org/A005117) - `:a005117` - `create_sequence_a005117/1`
   - [A005408 - The odd numbers: a(n) = 2*n + 1.](https://oeis.org/A005408) - `:a005408` - `create_sequence_a005408/1`
   - [A005470 - Number of unlabeled planar simple graphs with n nodes](https://oeis.org/A005470) - `:a005470` - `create_sequence_a005470/1`
   - [A005843 - The nonnegative even numbers: a(n) = 2n.](https://oeis.org/A005843) - `:a005843` - `create_sequence_a005843/1`
   - [A006530 - Gpf(n): greatest prime dividing n](https://oeis.org/A006530) - `:a006530` - `create_sequence_a006530/1`
   - [A006882 - Double factorials n!!: a(n) = n*a(n-2) for n > 1, a(0) = a(1) = 1.](https://oeis.org/A006882) - `:a006882` - `create_sequence_a006882/1`
   - [A006966 - Number of lattices on n unlabeled nodes](https://oeis.org/A006966) - `:a006966` - `create_sequence_a006966/1`
   - [A008292 - Triangle of Eulerian numbers T(n,k)](https://oeis.org/A008292) - `:a008292` - `create_sequence_a008292/1`
   - [A008683 - Möbius (or Moebius) function mu(n)](https://oeis.org/A008683) - `:a008683` - `create_sequence_a008683/1`
   - [A020639 - Lpf(n): least prime dividing n](https://oeis.org/A020639) - `:a020639` - `create_sequence_a020639/1`
   - [A055512 - Lattices with n labeled elements](https://oeis.org/A055512) - `:a055512` - `create_sequence_a055512/1`

  

  """
  import Chunky.Sequence, only: [sequence_for_list: 1, sequence_for_function: 1]
  alias Chunky.Fraction
  alias Chunky.Math

  require Integer

  # raw data for A000001 - Number of groups of order n.
  @data_a000001 [
    0,
    1,
    1,
    1,
    2,
    1,
    2,
    1,
    5,
    2,
    2,
    1,
    5,
    1,
    2,
    1,
    14,
    1,
    5,
    1,
    5,
    2,
    2,
    1,
    15,
    2,
    2,
    5,
    4,
    1,
    4,
    1,
    51,
    1,
    2,
    1,
    14,
    1,
    2,
    2,
    14,
    1,
    6,
    1,
    4,
    2,
    2,
    1,
    52,
    2,
    5,
    1,
    5,
    1,
    15,
    2,
    13,
    2,
    2,
    1,
    13,
    1,
    2,
    4,
    267,
    1,
    4,
    1,
    5,
    1,
    4,
    1,
    50,
    1,
    2,
    3,
    4,
    1,
    6,
    1,
    52,
    15,
    2,
    1,
    15,
    1,
    2,
    1,
    12,
    1,
    10,
    1,
    4,
    2
  ]

  # raw data for A000043 - Mersenne Primes Exponents
  @data_a000043 [
    2,
    3,
    5,
    7,
    13,
    17,
    19,
    31,
    61,
    89,
    107,
    127,
    521,
    607,
    1279,
    2203,
    2281,
    3217,
    4253,
    4423,
    9689,
    9941,
    11213,
    19937,
    21701,
    23209,
    44497,
    86243,
    110_503,
    132_049,
    216_091,
    756_839,
    859_433,
    1_257_787,
    1_398_269,
    2_976_221,
    3_021_377,
    6_972_593,
    13_466_917,
    20_996_011,
    24_036_583,
    25_964_951,
    30_402_457,
    32_582_657,
    37_156_667,
    42_643_801,
    43_112_609
  ]

  # raw data for A000105 - Number of free polyominoes (or square animals) with n cells.
  @data_a000105 [
    1,
    1,
    1,
    2,
    5,
    12,
    35,
    108,
    369,
    1285,
    4655,
    17073,
    63600,
    238_591,
    901_971,
    3_426_576,
    13_079_255,
    50_107_909,
    192_622_052,
    742_624_232,
    2_870_671_950,
    11_123_060_678,
    43_191_857_688,
    168_047_007_728,
    654_999_700_403,
    2_557_227_044_764,
    9_999_088_822_075,
    39_153_010_938_487,
    153_511_100_594_603
  ]

  # raw data for A000109 - Number of simplicial polyhedra with n nodes; simple planar graphs with 3n-6 edges; maximal simple planar graphs; 3-connected planar triangulations; 3-connected triangulations of the sphere; 3-connected cubic planar graphs.
  @data_a000109 [
    1,
    1,
    1,
    2,
    5,
    14,
    50,
    233,
    1249,
    7595,
    49566,
    339_722,
    2_406_841,
    17_490_241,
    129_664_753,
    977_526_957,
    7_475_907_149,
    57_896_349_553,
    453_382_272_049,
    3_585_853_662_949,
    28_615_703_421_545
  ]

  # raw data for A000112 - Number of partially ordered sets ("posets") with n unlabeled elements.
  @data_a000112 [
    1,
    1,
    2,
    5,
    16,
    63,
    318,
    2045,
    16999,
    183_231,
    2_567_284,
    46_749_427,
    1_104_891_746,
    33_823_827_452,
    1_338_193_159_771,
    68_275_077_901_156,
    4_483_130_665_195_087
  ]

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
  @data_a000609 [
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
  ]

  # raw data for A000798 - Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements.
  @data_a000798 [
    1,
    1,
    4,
    29,
    355,
    6942,
    209_527,
    9_535_241,
    642_779_354,
    63_260_289_423,
    8_977_053_873_043,
    1_816_846_038_736_192,
    519_355_571_065_774_021,
    207_881_393_656_668_953_041,
    115_617_051_977_054_267_807_460,
    88_736_269_118_586_244_492_485_121,
    93_411_113_411_710_039_565_210_494_095,
    134_137_950_093_337_880_672_321_868_725_846,
    261_492_535_743_634_374_805_066_126_901_117_203
  ]

  # raw data for A002106 - Number of transitive permutation groups of degree n.
  @data_a002106 [
    1,
    1,
    2,
    5,
    5,
    16,
    7,
    50,
    34,
    45,
    8,
    301,
    9,
    63,
    104,
    1954,
    10,
    983,
    8,
    1117,
    164,
    59,
    7,
    25000,
    211,
    96,
    2392,
    1854,
    8,
    5712,
    12,
    2_801_324,
    162,
    115,
    407,
    121_279,
    11,
    76,
    306,
    315_842,
    10,
    9491,
    10,
    2113,
    10923,
    56,
    6
  ]

  # raw data for A003094 - Number of unlabeled connected planar simple graphs with n nodes.
  @data_a003094 [1, 1, 1, 2, 6, 20, 99, 646, 5974, 71885, 1_052_805, 17_449_299, 313_372_298]

  # raw data for A005470 - Number of unlabeled planar simple graphs with n nodes.
  @data_a005470 [1, 1, 2, 4, 11, 33, 142, 822, 6966, 79853, 1_140_916, 18_681_008, 333_312_451]

  # raw data for A006966 - Number of lattices on n unlabeled nodes.
  @data_a006966 [
    1,
    1,
    1,
    1,
    2,
    5,
    15,
    53,
    222,
    1078,
    5994,
    37622,
    262_776,
    2_018_305,
    16_873_364,
    152_233_518,
    1_471_613_387,
    15_150_569_446,
    165_269_824_761,
    1_901_910_625_578,
    23_003_059_864_006
  ]

  # raw data for A055512 - Lattices with n labeled elements.
  @data_a055512 [
    1,
    1,
    2,
    6,
    36,
    380,
    6390,
    157_962,
    5_396_888,
    243_179_064,
    13_938_711_210,
    987_858_368_750,
    84_613_071_940_452,
    8_597_251_494_954_564,
    1_020_353_444_641_839_854,
    139_627_532_137_612_581_090,
    21_788_453_795_572_514_675_760,
    3_840_596_246_648_027_262_079_472,
    758_435_490_711_709_577_216_754_642
  ]

  @doc """
  OEIS Sequence `A000002` - Kolakoski sequence

  From [OEIS A000002](https://oeis.org/A000002):

  > Kolakoski sequence: a(n) is length of n-th run; a(1) = 1; sequence consists just of 1's and 2's.
  > (Formerly M0190 N0070)

  **Sequence IDs**: `:a000002`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000002) |> Sequence.take!(108)
      [1,2,2,1,1,2,1,2,2,1,2,2,1,1,2,1,1,2,2,1,2,1,1,2,1,2,2,1,1,2,1,1,2,1,2,2,1,2,2,1,1,2,1,2,2,1,2,1,1,2,1,1,2,2,1,2,2,1,1,2,1,2,2,1,2,2,1,1,2,1,1,2,1,2,2,1,2,1,1,2,2,1,2,2,1,1,2,1,2,2,1,2,2,1,1,2,1,1,2,2,1,2,1,1,2,1,2,2]


  """
  @doc offset: 1,
       sequence: "Kolakoski sequence",
       references: [{:oeis, :a000002, "https://oeis.org/A000002"}]
  def create_sequence_a000002(_opts) do
    %{
      next_fn: &seq_a000002/3,
      data: %{
        k: Math.start_kolakoski_sequence(),
        idx: -1
      }
    }
  end

  def seq_a000002(:init, data, _value) do
    %{
      data: data,
      value: 0
    }
  end

  def seq_a000002(:next, %{k: k_seq, idx: last_idx}, _val) do
    # what index are we looking for
    idx = last_idx + 1

    # make sure our sequence is long enough
    {seq, _, _} = next_k_seq = Math.extend_kolakoski_sequence_to_length(k_seq, idx + 1)

    %{
      data: %{k: next_k_seq, idx: idx},
      value: Enum.at(seq, idx)
    }
  end

  @doc """
  OEIS Sequence `A000004` - The zero sequence.

  From [OEIS A000004](https://oeis.org/A000004):

  > The zero sequence.
  > (Formerly M0000)

  **Sequence IDs**: `:a000004`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000004) |> Sequence.take!(102)
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "The zero sequence.",
       references: [{:oeis, :a000004, "https://oeis.org/A000004"}]
  def create_sequence_a000004(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000004/1)
  end

  @doc offset: 0
  def seq_a000004(_idx) do
    0
  end

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
  OEIS Sequence `A000007` - The characteristic function of {0}: a(n) = 0^n.

  From [OEIS A000007](https://oeis.org/A000007):

  > The characteristic function of {0}: a(n) = 0^n.
  > (Formerly M0002)

  **Sequence IDs**: `:a000007`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000007) |> Sequence.take!(105)
      [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "The characteristic function of {0}: a(n) = 0^n.",
       references: [{:oeis, :a000007, "https://oeis.org/A000007"}]
  def create_sequence_a000007(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000007/1)
  end

  @doc offset: 0
  def seq_a000007(idx) do
    if idx == 0 do
      1
    else
      0
    end
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
  OEIS Sequence `A000012` - The simplest sequence of positive numbers: the all 1's sequence.

  From [OEIS A000012](https://oeis.org/A000012):

  > The simplest sequence of positive numbers: the all 1's sequence.
  > (Formerly M0003)

  **Sequence IDs**: `:a000012`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000012) |> Sequence.take!(90)
      [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]


  """
  @doc offset: 0,
       sequence: "The simplest sequence of positive numbers: the all 1's sequence.",
       references: [{:oeis, :a000012, "https://oeis.org/A000012"}]
  def create_sequence_a000012(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000012/1)
  end

  @doc offset: 0
  def seq_a000012(_idx) do
    1
  end

  @doc """
  OEIS Sequence `A000027` - The positive integers

  From [OEIS A000027](https://oeis.org/A000027):

  > The positive integers. Also called the natural numbers, the whole numbers or the counting numbers, but these terms are ambiguous.
  > (Formerly M0472 N0173)

  **Sequence IDs**: `:a000027`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000027) |> Sequence.take!(77)
      [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77]


  """
  @doc offset: 1,
       sequence: "The positive integers",
       references: [{:oeis, :a000027, "https://oeis.org/A000027"}]
  def create_sequence_a000027(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000027/1)
  end

  @doc offset: 1
  def seq_a000027(idx) do
    idx
  end

  @doc """
  OEIS Sequence `A000032` - Lucas numbers beginning at 2: L(n) = L(n-1) + L(n-2), L(0) = 2, L(1) = 1.

  From [OEIS A000032](https://oeis.org/A000032):

  > Lucas numbers beginning at 2: L(n) = L(n-1) + L(n-2), L(0) = 2, L(1) = 1.
  > (Formerly M0155)

  **Sequence IDs**: `:a000032`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000032) |> Sequence.take!(39)
      [2,1,3,4,7,11,18,29,47,76,123,199,322,521,843,1364,2207,3571,5778,9349,15127,24476,39603,64079,103682,167761,271443,439204,710647,1149851,1860498,3010349,4870847,7881196,12752043,20633239,33385282,54018521,87403803]


  """
  @doc offset: 0,
       sequence: "Lucas numbers beginning at 2: L(n) = L(n-1) + L(n-2), L(0) = 2, L(1) = 1.",
       references: [{:oeis, :a000032, "https://oeis.org/A000032"}]
  def create_sequence_a000032(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000032/1)
  end

  @doc offset: 0
  def seq_a000032(idx) do
    Math.lucas_number(idx)
  end

  @doc """
  OEIS Sequence `A000035` - Period 2: repeat [0, 1]

  From [OEIS A000035](https://oeis.org/A000035):

  > Period 2: repeat [0, 1]; a(n) = n mod 2; parity of n.
  > (Formerly M0001)

  **Sequence IDs**: `:a000035`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000035) |> Sequence.take!(105)
      [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]


  """
  @doc offset: 0,
       sequence: "Period 2: repeat [0, 1]; a(n) = n mod 2",
       references: [{:oeis, :a000035, "https://oeis.org/A000035"}]
  def create_sequence_a000035(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000035/1)
  end

  @doc offset: 0
  def seq_a000035(idx) do
    rem(idx, 2)
  end

  @doc """
  OEIS Sequence `A000040` - The prime numbers.

  From [OEIS A000040](https://oeis.org/A000040):

  > The prime numbers.
  > (Formerly M0652 N0241)

  **Sequence IDs**: `:a000040`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000040) |> Sequence.take!(58)
      [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271]


  """
  @doc offset: 1,
       sequence: "The prime numbers.",
       references: [{:oeis, :a000040, "https://oeis.org/A000040"}]
  def create_sequence_a000040(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000040/2)
  end

  @doc offset: 1
  def seq_a000040(idx, last) do
    case idx do
      1 ->
        2

      2 ->
        3

      _ ->
        Math.next_number(&Math.is_prime_fast?/1, last, 2)
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
       ],
       offset: 0
  def create_sequence_a000041(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000041/1)
  end

  @doc offset: 0
  def seq_a000041(idx) do
    Math.partition_count(idx)
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
  OEIS Sequence `A000045` - Fibonacci numbers

  From [OEIS A000045](https://oeis.org/A000045)

  > Fibonacci numbers: F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1. 
  > (Formerly M0692 N0256)

  **Sequence IDs**: `:a000045`, `:fibonacci`

  **Finite**: false

  ## Example
      
      iex> Sequence.create(Sequence.OEIS.Core, :a000045) |> Sequence.take!(10)
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

  """
  @doc sequence: "OEIS A000045 - Fibonacci Numbers [0, 1, 1, 2, 3, 5, ...]",
       references: [{:oeis, :a000045, "https://oeis.org/A000045"}]
  def create_sequence_a000045(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000045/3)
  end

  @doc sequence: "OEIS A000045 - Fibonacci Numbers [0, 1, 1, 2, 3, 5, ...]",
       references: [{:oeis, :a000045, "https://oeis.org/A000045"}]
  def create_sequence_fibonacci(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Core.seq_a000045/3)
  end

  def seq_a000045(idx, a, b) do
    case idx do
      0 -> 0
      1 -> 1
      _ -> a + b
    end
  end

  @doc """
  OEIS Sequence `A000069` - Odious numbers: numbers with an odd number of 1's in their binary expansion.

  From [OEIS A000069](https://oeis.org/A000069):

  > Odious numbers: numbers with an odd number of 1's in their binary expansion.
  > (Formerly M1031 N0388)

  **Sequence IDs**: `:a000069`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000069) |> Sequence.take!(65)
      [1,2,4,7,8,11,13,14,16,19,21,22,25,26,28,31,32,35,37,38,41,42,44,47,49,50,52,55,56,59,61,62,64,67,69,70,73,74,76,79,81,82,84,87,88,91,93,94,97,98,100,103,104,107,109,110,112,115,117,118,121,122,124,127,128]


  """
  @doc offset: 1,
       sequence: "Odious numbers: numbers with an odd number of 1's in their binary expansion.",
       references: [{:oeis, :a000069, "https://oeis.org/A000069"}]
  def create_sequence_a000069(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000069/2)
  end

  @doc offset: 1
  def seq_a000069(_idx, last) do
    Math.next_number(&Math.is_odious_number?/1, last)
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
  OEIS Sequence `A000081` - Number of unlabeled rooted trees with n nodes

  From [OEIS A000081](https://oeis.org/A000081):

  > Number of unlabeled rooted trees with n nodes (or connected functions with a fixed point).
  > (Formerly M1180 N0454)

  **Sequence IDs**: `:a000081`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000081) |> Sequence.take!(31)
      [0,1,1,2,4,9,20,48,115,286,719,1842,4766,12486,32973,87811,235381,634847,1721159,4688676,12826228,35221832,97055181,268282855,743724984,2067174645,5759636510,16083734329,45007066269,126186554308,354426847597]


  """
  @doc offset: 0,
       sequence: "Number of unlabeled rooted trees with n nodes",
       references: [{:oeis, :a000081, "https://oeis.org/A000081"}]
  def create_sequence_a000081(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000081/1)
  end

  @doc offset: 0
  def seq_a000081(idx) do
    Math.rooted_tree_count(idx)
  end

  @doc """
  OEIS Sequence `A000085` - Number of self-inverse permutations on n letters, also known as involutions; number of standard Young tableaux with n cells.

  From [OEIS A000085](https://oeis.org/A000085):

  > Number of self-inverse permutations on n letters, also known as involutions; number of standard Young tableaux with n cells.
  > (Formerly M1221 N0469)

  **Sequence IDs**: `:a000085`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000085) |> Sequence.take!(28)
      [1,1,2,4,10,26,76,232,764,2620,9496,35696,140152,568504,2390480,10349536,46206736,211799312,997313824,4809701440,23758664096,119952692896,618884638912,3257843882624,17492190577600,95680443760576,532985208200576,3020676745975552]


  """
  @doc offset: 0,
       sequence:
         "Number of self-inverse permutations on n letters, also known as involutions; number of standard Young tableaux with n cells.",
       references: [{:oeis, :a000085, "https://oeis.org/A000085"}]
  def create_sequence_a000085(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000085/1)
  end

  @doc offset: 0
  def seq_a000085(idx) do
    Math.involutions_count(idx)
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
  OEIS Sequence `A000108` - Catalan numbers: C(n) = binomial(2n,n)/(n+1) = (2n)!/(n!(n+1)!). Also called Segner numbers.

  From [OEIS A000108](https://oeis.org/A000108):

  > Catalan numbers: C(n) = binomial(2n,n)/(n+1) = (2n)!/(n!(n+1)!). Also called Segner numbers.
  > (Formerly M1459 N0577)

  **Sequence IDs**: `:a000108`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000108) |> Sequence.take!(31)
      [1,1,2,5,14,42,132,429,1430,4862,16796,58786,208012,742900,2674440,9694845,35357670,129644790,477638700,1767263190,6564120420,24466267020,91482563640,343059613650,1289904147324,4861946401452,18367353072152,69533550916004,263747951750360,1002242216651368,3814986502092304]


  """
  @doc offset: 0,
       sequence:
         "Catalan numbers: C(n) = binomial(2n,n)/(n+1) = (2n)!/(n!(n+1)!). Also called Segner numbers.",
       references: [{:oeis, :a000108, "https://oeis.org/A000108"}]
  def create_sequence_a000108(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000108/1)
  end

  @doc offset: 0
  def seq_a000108(idx) do
    Math.catalan_number(idx)
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
  OEIS Sequence `A000110` - Bell or exponential numbers: number of ways to partition a set of n labeled elements.

  From [OEIS A000110](https://oeis.org/A000110):

  > Bell or exponential numbers: number of ways to partition a set of n labeled elements.
  > (Formerly M1484 N0585)

  **Sequence IDs**: `:a000110`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000110) |> Sequence.take!(27)
      [1,1,2,5,15,52,203,877,4140,21147,115975,678570,4213597,27644437,190899322,1382958545,10480142147,82864869804,682076806159,5832742205057,51724158235372,474869816156751,4506715738447323,44152005855084346,445958869294805289,4638590332229999353,49631246523618756274]


  """
  @doc offset: 0,
       sequence:
         "Bell or exponential numbers: number of ways to partition a set of n labeled elements.",
       references: [{:oeis, :a000110, "https://oeis.org/A000110"}]
  def create_sequence_a000110(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000110/1)
  end

  @doc offset: 0
  def seq_a000110(idx) do
    Math.bell_number(idx)
  end

  @doc """
  OEIS Sequence `A000111` - Euler or up/down numbers: e.g.f. sec(x) + tan(x). Also for n >= 2, half the number of alternating permutations on n letters (A001250).

  From [OEIS A000111](https://oeis.org/A000111):

  > Euler or up/down numbers: e.g.f. sec(x) + tan(x). Also for n >= 2, half the number of alternating permutations on n letters (A001250).
  > (Formerly M1492 N0587)

  **Sequence IDs**: `:a000111` 

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000111) |> Sequence.take!(27)
      [1,1,1,2,5,16,61,272,1385,7936,50521,353792,2702765,22368256,199360981,1903757312,19391512145,209865342976,2404879675441,29088885112832,370371188237525,4951498053124096,69348874393137901,1015423886506852352,15514534163557086905,246921480190207983616,4087072509293123892361]


  """
  @doc offset: 0,
       sequence:
         "Euler or up/down numbers: e.g.f. sec(x) + tan(x). Also for n >= 2, half the number of alternating permutations on n letters (A001250).",
       references: [{:oeis, :a000111, "https://oeis.org/A000111"}]
  def create_sequence_a000111(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000111/1)
  end

  @doc offset: 0
  def seq_a000111(idx) do
    Math.euler_zig_zag(idx)
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
  OEIS Sequence `A000120` - 1's-counting sequence: number of 1's in binary expansion of n (or the binary weight of n).

  From [OEIS A000120](https://oeis.org/A000120):

  > 1's-counting sequence: number of 1's in binary expansion of n (or the binary weight of n).
  > (Formerly M0105 N0041)

  **Sequence IDs**: `:a000120`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000120) |> Sequence.take!(105)
      [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3]


  """
  @doc offset: 0,
       sequence:
         "1's-counting sequence: number of 1's in binary expansion of n (or the binary weight of n).",
       references: [{:oeis, :a000120, "https://oeis.org/A000120"}]
  def create_sequence_a000120(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000120/1)
  end

  @doc offset: 0
  def seq_a000120(idx) do
    Math.hamming_weight(idx)
  end

  @doc """
  OEIS Sequence `A000124` - Central polygonal numbers (the Lazy Caterer's sequence): n(n+1)/2 + 1; or, maximal number of pieces formed when slicing a pancake with n cuts.

  From [OEIS A000124](https://oeis.org/A000124):

  > Central polygonal numbers (the Lazy Caterer's sequence): n(n+1)/2 + 1; or, maximal number of pieces formed when slicing a pancake with n cuts.
  > (Formerly M1041 N0391)

  **Sequence IDs**: `:a000124`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000124) |> Sequence.take!(53)
      [1,2,4,7,11,16,22,29,37,46,56,67,79,92,106,121,137,154,172,191,211,232,254,277,301,326,352,379,407,436,466,497,529,562,596,631,667,704,742,781,821,862,904,947,991,1036,1082,1129,1177,1226,1276,1327,1379]


  """
  @doc offset: 0,
       sequence:
         "Central polygonal numbers (the Lazy Caterer's sequence): n(n+1)/2 + 1; or, maximal number of pieces formed when slicing a pancake with n cuts.",
       references: [{:oeis, :a000124, "https://oeis.org/A000124"}]
  def create_sequence_a000124(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000124/1)
  end

  @doc offset: 0
  def seq_a000124(idx) do
    Math.pancake_cut_max(idx)
  end

  @doc """
  OEIS Sequence `A000142` - Factorial numbers: n! = 1*2*3*4*...*n

  From [OEIS A000142](https://oeis.org/A000142):

  > Factorial numbers: n! = 1*2*3*4*...*n (order of symmetric group S_n, number of permutations of n letters).
  > (Formerly M1675 N0659)

  **Sequence IDs**: `:a000142`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000142) |> Sequence.take!(23)
      [1,1,2,6,24,120,720,5040,40320,362880,3628800,39916800,479001600,6227020800,87178291200,1307674368000,20922789888000,355687428096000,6402373705728000,121645100408832000,2432902008176640000,51090942171709440000,1124000727777607680000]


  """
  @doc offset: 0,
       sequence: "Factorial numbers: n! = 1*2*3*4*...*n",
       references: [{:oeis, :a000142, "https://oeis.org/A000142"}]
  def create_sequence_a000142(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000142/1)
  end

  @doc offset: 0
  def seq_a000142(idx) do
    Math.factorial(idx)
  end

  @doc """
  OEIS Sequence `A000129` - Pell numbers: a(0) = 0, a(1) = 1; for n > 1, a(n) = 2*a(n-1) + a(n-2).

  From [OEIS A000129](https://oeis.org/A000129):

  > Pell numbers: a(0) = 0, a(1) = 1; for n > 1, a(n) = 2*a(n-1) + a(n-2).
  > (Formerly M1413 N0552)

  **Sequence IDs**: `:a000129`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000129) |> Sequence.take!(32)
      [0,1,2,5,12,29,70,169,408,985,2378,5741,13860,33461,80782,195025,470832,1136689,2744210,6625109,15994428,38613965,93222358,225058681,543339720,1311738121,3166815962,7645370045,18457556052,44560482149,107578520350,259717522849]


  """
  @doc offset: 0,
       sequence: "Pell numbers: a(0) = 0, a(1) = 1; for n > 1, a(n) = 2*a(n-1) + a(n-2).",
       references: [{:oeis, :a000129, "https://oeis.org/A000129"}]
  def create_sequence_a000129(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000129/1)
  end

  @doc offset: 0
  def seq_a000129(idx) do
    Math.pell_number(idx)
  end

  @doc """
  OEIS Sequence `A000166` - Subfactorial or rencontres numbers, or derangements: number of permutations of n elements with no fixed points.

  From [OEIS A000166](https://oeis.org/A000166):

  > Subfactorial or rencontres numbers, or derangements: number of permutations of n elements with no fixed points.
  > (Formerly M1937 N0766)

  **Sequence IDs**: `:a000166`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000166) |> Sequence.take!(24)
      [1,0,1,2,9,44,265,1854,14833,133496,1334961,14684570,176214841,2290792932,32071101049,481066515734,7697064251745,130850092279664,2355301661033953,44750731559645106,895014631192902121,18795307255050944540,413496759611120779881,9510425471055777937262]


  """
  @doc offset: 0,
       sequence:
         "Subfactorial or rencontres numbers, or derangements: number of permutations of n elements with no fixed points.",
       references: [{:oeis, :a000166, "https://oeis.org/A000166"}]
  def create_sequence_a000166(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000166/1)
  end

  @doc offset: 0
  def seq_a000166(idx) do
    Math.derangement_count(idx)
  end

  @doc """
  OEIS Sequence `A000169` - Number of labeled rooted trees with n nodes: n^(n-1).

  From [OEIS A000169](https://oeis.org/A000169):

  > Number of labeled rooted trees with n nodes: n^(n-1).
  > (Formerly M1946 N0771)

  **Sequence IDs**: `:a000169`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000169) |> Sequence.take!(20)
      [1,2,9,64,625,7776,117649,2097152,43046721,1000000000,25937424601,743008370688,23298085122481,793714773254144,29192926025390625,1152921504606846976,48661191875666868481,2185911559738696531968,104127350297911241532841,5242880000000000000000000]


  """
  @doc offset: 1,
       sequence: "Number of labeled rooted trees with n nodes: n^(n-1).",
       references: [{:oeis, :a000169, "https://oeis.org/A000169"}]
  def create_sequence_a000169(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000169/1)
  end

  @doc offset: 1
  def seq_a000169(idx) do
    Math.labeled_rooted_trees_count(idx)
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
  OEIS Sequence `A000204` - Lucas numbers (beginning with 1)

  From [OEIS A000204](https://oeis.org/A000204):

  > Lucas numbers (beginning with 1): L(n) = L(n-1) + L(n-2) with L(1) = 1, L(2) = 3.
  > (Formerly M2341 N0924)

  **Sequence IDs**: `:a000204`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000204) |> Sequence.take!(39)
      [1,3,4,7,11,18,29,47,76,123,199,322,521,843,1364,2207,3571,5778,9349,15127,24476,39603,64079,103682,167761,271443,439204,710647,1149851,1860498,3010349,4870847,7881196,12752043,20633239,33385282,54018521,87403803,141422324]


  """
  @doc offset: 1,
       sequence: "Lucas numbers (beginning with 1)",
       references: [{:oeis, :a000204, "https://oeis.org/A000204"}]
  def create_sequence_a000204(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000204/1)
  end

  @doc offset: 1
  def seq_a000204(idx) do
    Math.lucas_number(idx)
  end

  @doc """
  OEIS Sequence `A000217` - Triangular numbers: a(n) = binomial(n+1,2)

  From [OEIS A000217](https://oeis.org/A000217):

  > Triangular numbers: a(n) = binomial(n+1,2) = n(n+1)/2 = 0 + 1 + 2 + ... + n.
  > (Formerly M2535 N1002)

  **Sequence IDs**: `:a000217`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000217) |> Sequence.take!(54)
      [0,1,3,6,10,15,21,28,36,45,55,66,78,91,105,120,136,153,171,190,210,231,253,276,300,325,351,378,406,435,465,496,528,561,595,630,666,703,741,780,820,861,903,946,990,1035,1081,1128,1176,1225,1275,1326,1378,1431]


  """
  @doc offset: 0,
       sequence: "Triangular numbers: a(n) = binomial(n+1,2) = n(n+1)/2 = 0 + 1 + 2 + ... + n.",
       references: [{:oeis, :a000217, "https://oeis.org/A000217"}]
  def create_sequence_a000217(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000217/1)
  end

  @doc offset: 0
  def seq_a000217(idx) do
    Math.triangle_number(idx)
  end

  @doc """
  OEIS Sequence `A000219` - Number of planar partitions (or plane partitions) of n.

  From [OEIS A000219](https://oeis.org/A000219):

  > Number of planar partitions (or plane partitions) of n.
  > (Formerly M2566 N1016)

  **Sequence IDs**: `:a000219`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000219) |> Sequence.take!(41)
      [1,1,3,6,13,24,48,86,160,282,500,859,1479,2485,4167,6879,11297,18334,29601,47330,75278,118794,186475,290783,451194,696033,1068745,1632658,2483234,3759612,5668963,8512309,12733429,18974973,28175955,41691046,61484961,90379784,132441995,193487501,281846923]


  """
  @doc offset: 0,
       sequence: "Number of planar partitions (or plane partitions) of n.",
       references: [{:oeis, :a000219, "https://oeis.org/A000219"}]
  def create_sequence_a000219(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000219/1)
  end

  @doc offset: 0
  def seq_a000219(idx) do
    Math.plane_partition_count(idx)
  end

  @doc """
  OEIS Sequence `A000225` - a(n) = 2^n - 1. (Sometimes called Mersenne numbers, although that name is usually reserved for A001348.)

  From [OEIS A000225](https://oeis.org/A000225):

  > a(n) = 2^n - 1. (Sometimes called Mersenne numbers, although that name is usually reserved for A001348.)
  > (Formerly M2655 N1059)

  **Sequence IDs**: `:a000225`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000225) |> Sequence.take!(33)
      [0,1,3,7,15,31,63,127,255,511,1023,2047,4095,8191,16383,32767,65535,131071,262143,524287,1048575,2097151,4194303,8388607,16777215,33554431,67108863,134217727,268435455,536870911,1073741823,2147483647,4294967295]


  """
  @doc offset: 0,
       sequence:
         "a(n) = 2^n - 1. (Sometimes called Mersenne numbers, although that name is usually reserved for A001348.)",
       references: [{:oeis, :a000225, "https://oeis.org/A000225"}]
  def create_sequence_a000225(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000225/1)
  end

  @doc offset: 0
  def seq_a000225(idx) do
    Math.pow(2, idx) - 1
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
  OEIS Sequence `A000262` - Number of "sets of lists"

  From [OEIS A000262](https://oeis.org/A000262):

  > Number of "sets of lists": number of partitions of {1,...,n} into any number of lists, where a list means an ordered subset.
  > (Formerly M2950 N1190)

  **Sequence IDs**: `:a000262`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000262) |> Sequence.take!(22)
      [1,1,3,13,73,501,4051,37633,394353,4596553,58941091,824073141,12470162233,202976401213,3535017524403,65573803186921,1290434218669921,26846616451246353,588633468315403843,13564373693588558173,327697927886085654441,8281153039765859726341]


  """
  @doc offset: 0,
       sequence: "Number of 'sets of lists'",
       references: [{:oeis, :a000262, "https://oeis.org/A000262"}]
  def create_sequence_a000262(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000262/1)
  end

  @doc offset: 0
  def seq_a000262(idx) do
    Math.ordered_subsets_count(idx)
  end

  @doc """
  OEIS Sequence `A000272` - Number of trees on n labeled nodes: n^(n-2) with a(0)=1.

  From [OEIS A000272](https://oeis.org/A000272):

  > Number of trees on n labeled nodes: n^(n-2) with a(0)=1.
  > (Formerly M3027 N1227)

  **Sequence IDs**: `:a000272`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000272) |> Sequence.take!(20)
      [1,1,1,3,16,125,1296,16807,262144,4782969,100000000,2357947691,61917364224,1792160394037,56693912375296,1946195068359375,72057594037927936,2862423051509815793,121439531096594251776,5480386857784802185939]


  """
  @doc offset: 0,
       sequence: "Number of trees on n labeled nodes: n^(n-2) with a(0)=1.",
       references: [{:oeis, :a000272, "https://oeis.org/A000272"}]
  def create_sequence_a000272(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000272/1)
  end

  @doc offset: 0
  def seq_a000272(idx) do
    Math.cayley_number(idx)
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
  OEIS Sequence `A000292` - Tetrahedral (or triangular pyramidal) numbers: a(n) = C(n+2,3) = n*(n+1)*(n+2)/6.

  From [OEIS A000292](https://oeis.org/A000292):

  > Tetrahedral (or triangular pyramidal) numbers: a(n) = C(n+2,3) = n*(n+1)*(n+2)/6.
  > (Formerly M3382 N1363)

  **Sequence IDs**: `:a000292`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000292) |> Sequence.take!(45)
      [0,1,4,10,20,35,56,84,120,165,220,286,364,455,560,680,816,969,1140,1330,1540,1771,2024,2300,2600,2925,3276,3654,4060,4495,4960,5456,5984,6545,7140,7770,8436,9139,9880,10660,11480,12341,13244,14190,15180]


  """
  @doc offset: 0,
       sequence:
         "Tetrahedral (or triangular pyramidal) numbers: a(n) = C(n+2,3) = n*(n+1)*(n+2)/6.",
       references: [{:oeis, :a000292, "https://oeis.org/A000292"}]
  def create_sequence_a000292(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000292/1)
  end

  @doc offset: 0
  def seq_a000292(idx) do
    Math.tetrahedral_number(idx)
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
  OEIS Sequence `A000312` - a(n) = n^n; number of labeled mappings from n points to themselves (endofunctions).

  From [OEIS A000312](https://oeis.org/A000312):

  > a(n) = n^n; number of labeled mappings from n points to themselves (endofunctions).
  > (Formerly M3619 N1469)

  **Sequence IDs**: `:a000312`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000312) |> Sequence.take!(18)
      [1,1,4,27,256,3125,46656,823543,16777216,387420489,10000000000,285311670611,8916100448256,302875106592253,11112006825558016,437893890380859375,18446744073709551616,827240261886336764177]


  """
  @doc offset: 0,
       sequence:
         "a(n) = n^n; number of labeled mappings from n points to themselves (endofunctions).",
       references: [{:oeis, :a000312, "https://oeis.org/A000312"}]
  def create_sequence_a000312(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000312/1)
  end

  @doc offset: 0
  def seq_a000312(idx) do
    Math.endomorphism_count(idx)
  end

  @doc """
  OEIS Sequence `A000326` - Pentagonal numbers: a(n) = n*(3*n-1)/2.

  From [OEIS A000326](https://oeis.org/A000326):

  > Pentagonal numbers: a(n) = n*(3*n-1)/2.
  > (Formerly M3818 N1562)

  **Sequence IDs**: `:a000326`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000326) |> Sequence.take!(47)
      [0,1,5,12,22,35,51,70,92,117,145,176,210,247,287,330,376,425,477,532,590,651,715,782,852,925,1001,1080,1162,1247,1335,1426,1520,1617,1717,1820,1926,2035,2147,2262,2380,2501,2625,2752,2882,3015,3151]


  """
  @doc offset: 0,
       sequence: "Pentagonal numbers: a(n) = n*(3*n-1)/2.",
       references: [{:oeis, :a000326, "https://oeis.org/A000326"}]
  def create_sequence_a000326(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000326/1)
  end

  @doc offset: 0
  def seq_a000326(idx) do
    Math.pentagonal_number(idx)
  end

  @doc """
  OEIS Sequence `A000330` - Square pyramidal numbers: a(n) = 0^2 + 1^2 + 2^2 + ... + n^2 = n*(n+1)*(2*n+1)/6.

  From [OEIS A000330](https://oeis.org/A000330):

  > Square pyramidal numbers: a(n) = 0^2 + 1^2 + 2^2 + ... + n^2 = n*(n+1)*(2*n+1)/6.
  > (Formerly M3844 N1574)

  **Sequence IDs**: `:a000330`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000330) |> Sequence.take!(45)
      [0,1,5,14,30,55,91,140,204,285,385,506,650,819,1015,1240,1496,1785,2109,2470,2870,3311,3795,4324,4900,5525,6201,6930,7714,8555,9455,10416,11440,12529,13685,14910,16206,17575,19019,20540,22140,23821,25585,27434,29370]


  """
  @doc offset: 0,
       sequence:
         "Square pyramidal numbers: a(n) = 0^2 + 1^2 + 2^2 + ... + n^2 = n*(n+1)*(2*n+1)/6.",
       references: [{:oeis, :a000330, "https://oeis.org/A000330"}]
  def create_sequence_a000330(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000330/1)
  end

  @doc offset: 0
  def seq_a000330(idx) do
    Math.square_pyramidal_number(idx)
  end

  @doc """
  OEIS Sequence `A000364` - Euler (or secant or "Zig") numbers: e.g.f. (even powers only) sec(x) = 1/cos(x).

  From [OEIS A000364](https://oeis.org/A000364):

  > Euler (or secant or "Zig") numbers: e.g.f. (even powers only) sec(x) = 1/cos(x).
  > (Formerly M4019 N1667)

  **Sequence IDs**: `:a000364`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000364) |> Sequence.take!(17)
      [1,1,5,61,1385,50521,2702765,199360981,19391512145,2404879675441,370371188237525,69348874393137901,15514534163557086905,4087072509293123892361,1252259641403629865468285,441543893249023104553682821,177519391579539289436664789665]


  """
  @doc offset: 0,
       sequence: "Euler (or secant or 'Zig') numbers",
       references: [{:oeis, :a000364, "https://oeis.org/A000364"}]
  def create_sequence_a000364(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000364/1)
  end

  @doc offset: 0
  def seq_a000364(idx) do
    Math.euler_zig(idx)
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
  OEIS Sequence `A000521` - Coefficients of modular function j as power series in q = e^(2 Pi i t)

  From [OEIS A000521](https://oeis.org/A000521):

  > Coefficients of modular function j as power series in q = e^(2 Pi i t). Another name is the elliptic modular invariant J(tau).
  > (Formerly M5477 N2372)

  **Sequence IDs**: `:a000521`

  **Finite**: False

  **Offset**: -1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000521) |> Sequence.take!(17)
      [1,744,196884,21493760,864299970,20245856256,333202640600,4252023300096,44656994071935,401490886656000,3176440229784420,22567393309593600,146211911499519294,874313719685775360,4872010111798142520,25497827389410525184,126142916465781843075]


  """
  @doc offset: -1,
       sequence: "Coefficients of modular function j as power series in q = e^(2 Pi i t)",
       references: [{:oeis, :a000521, "https://oeis.org/A000521"}]
  def create_sequence_a000521(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000521/1)
  end

  @doc offset: -1
  def seq_a000521(idx) do
    Math.j_invariant_q_coefficient(idx)
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
  OEIS Sequence `A000583` - Fourth powers: a(n) = n^4

  From [OEIS A000583](https://oeis.org/A000583):

  > Fourth powers: a(n) = n^4.
  > (Formerly M5004 N2154)

  **Sequence IDs**: `:a000583`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000583) |> Sequence.take!(34)
      [0,1,16,81,256,625,1296,2401,4096,6561,10000,14641,20736,28561,38416,50625,65536,83521,104976,130321,160000,194481,234256,279841,331776,390625,456976,531441,614656,707281,810000,923521,1048576,1185921]


  """
  @doc offset: 0,
       sequence: "Fourth powers: a(n) = n^4.",
       references: [{:oeis, :a000583, "https://oeis.org/A000583"}]
  def create_sequence_a000583(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000583/1)
  end

  @doc offset: 0
  def seq_a000583(idx) do
    Math.pow(idx, 4)
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
  OEIS Sequence `A000594` - Ramanujan's tau function

  From [OEIS A000594](https://oeis.org/A000594):

  > Ramanujan's tau function (or Ramanujan numbers, or tau numbers).
  > (Formerly M5153 N2237)

  **Sequence IDs**: `:a000594`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000594) |> Sequence.take!(28)
      [1,-24,252,-1472,4830,-6048,-16744,84480,-113643,-115920,534612,-370944,-577738,401856,1217160,987136,-6905934,2727432,10661420,-7109760,-4219488,-12830688,18643272,21288960,-25499225,13865712,-73279080,24647168]


  """
  @doc offset: 1,
       sequence: "Ramanujan's tau function",
       references: [{:oeis, :a000594, "https://oeis.org/A000594"}]
  def create_sequence_a000594(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000594/1)
  end

  @doc offset: 1
  def seq_a000594(idx) do
    Math.ramanujan_tau(idx)
  end

  @doc """
  OEIS Sequence `A000959` - Lucky numbers.

  From [OEIS A000959](https://oeis.org/A000959):

  > Lucky numbers.
  > (Formerly M2616 N1035)

  **Sequence IDs**: `:a000959`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000959) |> Sequence.take!(57)
      [1,3,7,9,13,15,21,25,31,33,37,43,49,51,63,67,69,73,75,79,87,93,99,105,111,115,127,129,133,135,141,151,159,163,169,171,189,193,195,201,205,211,219,223,231,235,237,241,259,261,267,273,283,285,289,297,303]


  """
  @doc offset: 1,
       sequence: "Lucky numbers.",
       references: [{:oeis, :a000959, "https://oeis.org/A000959"}]
  def create_sequence_a000959(_opts) do
    %{
      next_fn: &Chunky.Sequence.OEIS.Core.seq_a000959/3,
      data: %{inc_by: 10, init_with: 10, idx: 0}
    }
  end

  def seq_a000959(:init, data, _v) do
    # setup our initial cache of values
    %{
      data: data |> Map.put(:numbers, Math.lucky_numbers(data.init_with)),
      value: 0
    }
  end

  def seq_a000959(:next, %{idx: idx} = data, _v) do
    # is our current index too small? 
    numbers =
      if length(data.numbers) <= idx do
        # regen with a bigger list
        Math.lucky_numbers(length(data.numbers) + data.inc_by)
      else
        # our cache is big enough
        data.numbers
      end

    # get our value
    v = numbers |> Enum.at(idx)

    # stash data, and return
    %{
      data: data |> Map.merge(%{idx: idx + 1, numbers: numbers}),
      value: v
    }
  end

  @doc """
  OEIS Sequence `A000961` - Powers of primes. Alternatively, 1 and the prime powers (p^k, p prime, k >= 1).

  From [OEIS A000961](https://oeis.org/A000961):

  > Powers of primes. Alternatively, 1 and the prime powers (p^k, p prime, k >= 1).
  > (Formerly M0517 N0185)

  **Sequence IDs**: `:a000961`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000961) |> Sequence.take!(64)
      [1,2,3,4,5,7,8,9,11,13,16,17,19,23,25,27,29,31,32,37,41,43,47,49,53,59,61,64,67,71,73,79,81,83,89,97,101,103,107,109,113,121,125,127,128,131,137,139,149,151,157,163,167,169,173,179,181,191,193,197,199,211,223,227]


  """
  @doc offset: 1,
       sequence:
         "Powers of primes. Alternatively, 1 and the prime powers (p^k, p prime, k >= 1).",
       references: [{:oeis, :a000961, "https://oeis.org/A000961"}]
  def create_sequence_a000961(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000961/2)
  end

  @doc offset: 1
  def seq_a000961(_idx, last) do
    Math.next_number(&Math.is_prime_power?/1, last)
  end

  @doc """
  OEIS Sequence `A000984` - Central binomial coefficients: binomial(2*n,n) = (2*n)!/(n!)^2.

  From [OEIS A000984](https://oeis.org/A000984):

  > Central binomial coefficients: binomial(2*n,n) = (2*n)!/(n!)^2.
  > (Formerly M1645 N0643)

  **Sequence IDs**: `:a000984`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000984) |> Sequence.take!(28)
      [1,2,6,20,70,252,924,3432,12870,48620,184756,705432,2704156,10400600,40116600,155117520,601080390,2333606220,9075135300,35345263800,137846528820,538257874440,2104098963720,8233430727600,32247603683100,126410606437752,495918532948104,1946939425648112]


  """
  @doc offset: 0,
       sequence: "Central binomial coefficients: binomial(2*n,n) = (2*n)!/(n!)^2.",
       references: [{:oeis, :a000984, "https://oeis.org/A000984"}]
  def create_sequence_a000984(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000984/1)
  end

  @doc offset: 0
  def seq_a000984(idx) do
    Math.binomial(2 * idx, idx)
  end

  @doc """
  OEIS Sequence `A001003` - Schroeder's second problem (generalized parentheses); also called super-Catalan numbers or little Schroeder numbers.

  From [OEIS A001003](https://oeis.org/A001003):

  > Schroeder's second problem (generalized parentheses); also called super-Catalan numbers or little Schroeder numbers.
  > (Formerly M2898 N1163)

  **Sequence IDs**: `:a001003`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001003) |> Sequence.take!(24)
      [1,1,3,11,45,197,903,4279,20793,103049,518859,2646723,13648869,71039373,372693519,1968801519,10463578353,55909013009,300159426963,1618362158587,8759309660445,47574827600981,259215937709463,1416461675464871]


  """
  @doc offset: 0,
       sequence:
         "Schroeder's second problem (generalized parentheses); also called super-Catalan numbers or little Schroeder numbers.",
       references: [{:oeis, :a001003, "https://oeis.org/A001003"}]
  def create_sequence_a001003(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001003/1)
  end

  @doc offset: 0
  def seq_a001003(idx) do
    Math.hipparchus_number(idx)
  end

  @doc """
  OEIS Sequence `A001006` - Motzkin numbers

  From [OEIS A001006](https://oeis.org/A001006):

  > Motzkin numbers: number of ways of drawing any number of nonintersecting chords joining n (labeled) points on a circle.
  > (Formerly M1184 N0456)

  **Sequence IDs**: `:a001006`

  **Finite**: False

  **Offset**: 0 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001006) |> Sequence.take!(30)
      [1,1,2,4,9,21,51,127,323,835,2188,5798,15511,41835,113634,310572,853467,2356779,6536382,18199284,50852019,142547559,400763223,1129760415,3192727797,9043402501,25669818476,73007772802,208023278209,593742784829]

  """
  @doc offset: 0,
       sequence:
         "Motzkin numbers: number of ways of drawing any number of nonintersecting chords joining n (labeled) points on a circle.",
       references: [{:oeis, :a001006, "https://oeis.org/A001006"}]
  def create_sequence_a001006(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001006/1)
  end

  @doc offset: 0
  def seq_a001006(idx) do
    Math.motzkin_number(idx)
  end

  @doc """
  OEIS Sequence `A001045` - Jacobsthal sequence (or Jacobsthal numbers)

  From [OEIS A001045](https://oeis.org/A001045):

  > Jacobsthal sequence (or Jacobsthal numbers): a(n) = a(n-1) + 2*a(n-2), with a(0) = 0, a(1) = 1.
  > (Formerly M2482 N0983)

  **Sequence IDs**: `:a001045`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001045) |> Sequence.take!(35)
      [0,1,1,3,5,11,21,43,85,171,341,683,1365,2731,5461,10923,21845,43691,87381,174763,349525,699051,1398101,2796203,5592405,11184811,22369621,44739243,89478485,178956971,357913941,715827883,1431655765,2863311531,5726623061]


  """
  @doc offset: 0,
       sequence: "Jacobsthal sequence (or Jacobsthal numbers)",
       references: [{:oeis, :a001045, "https://oeis.org/A001045"}]
  def create_sequence_a001045(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001045/1)
  end

  @doc offset: 0
  def seq_a001045(idx) do
    Math.jacobsthal_number(idx)
  end

  @doc """
  OEIS Sequence `A001055` - The multiplicative partition function: number of ways of factoring n with all factors greater than 1 (a(1) = 1 by convention).

  From [OEIS A001055](https://oeis.org/A001055):

  > The multiplicative partition function: number of ways of factoring n with all factors greater than 1 (a(1) = 1 by convention).
  > (Formerly M0095 N0032)

  **Sequence IDs**: `:a001055`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001055) |> Sequence.take!(103)
      [1,1,1,2,1,2,1,3,2,2,1,4,1,2,2,5,1,4,1,4,2,2,1,7,2,2,3,4,1,5,1,7,2,2,2,9,1,2,2,7,1,5,1,4,4,2,1,12,2,4,2,4,1,7,2,7,2,2,1,11,1,2,4,11,2,5,1,4,2,5,1,16,1,2,4,4,2,5,1,12,5,2,1,11,2,2,2,7,1,11,2,4,2,2,2,19,1,4,4,9,1,5,1]


  """
  @doc offset: 1,
       sequence:
         "The multiplicative partition function: number of ways of factoring n with all factors greater than 1 (a(1) = 1 by convention).",
       references: [{:oeis, :a001055, "https://oeis.org/A001055"}]
  def create_sequence_a001055(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001055/1)
  end

  @doc offset: 1
  def seq_a001055(idx) do
    Math.factorization_count(idx)
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
  OEIS Sequence `A001190` - Wedderburn-Etherington numbers: unlabeled binary rooted trees (every node has out-degree 0 or 2) with n endpoints (and 2n-1 nodes in all).

  From [OEIS A001190](https://oeis.org/A001190):

  > Wedderburn-Etherington numbers: unlabeled binary rooted trees (every node has out-degree 0 or 2) with n endpoints (and 2n-1 nodes in all).
  > (Formerly M0790 N0298)

  **Sequence IDs**: `:a001190`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001190) |> Sequence.take!(35)
      [0,1,1,1,2,3,6,11,23,46,98,207,451,983,2179,4850,10905,24631,56011,127912,293547,676157,1563372,3626149,8436379,19680277,46026618,107890609,253450711,596572387,1406818759,3323236238,7862958391,18632325319,44214569100]


  """
  @doc offset: 0,
       sequence:
         "Wedderburn-Etherington numbers: unlabeled binary rooted trees (every node has out-degree 0 or 2) with n endpoints (and 2n-1 nodes in all).",
       references: [{:oeis, :a001190, "https://oeis.org/A001190"}]
  def create_sequence_a001190(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001190/1)
  end

  @doc offset: 0
  def seq_a001190(idx) do
    Math.wedderburn_etherington_number(idx)
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
  OEIS Sequence `A001227` - Number of odd divisors of n.

  From [OEIS A001227](https://oeis.org/A001227):

  > Number of odd divisors of n.
  > (Formerly )

  **Sequence IDs**: `:a001227`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001227) |> Sequence.take!(105)
      [1,1,2,1,2,2,2,1,3,2,2,2,2,2,4,1,2,3,2,2,4,2,2,2,3,2,4,2,2,4,2,1,4,2,4,3,2,2,4,2,2,4,2,2,6,2,2,2,3,3,4,2,2,4,4,2,4,2,2,4,2,2,6,1,4,4,2,2,4,4,2,3,2,2,6,2,4,4,2,2,5,2,2,4,4,2,4,2,2,6,4,2,4,2,4,2,2,3,6,3,2,4,2,2,8]


  """
  @doc offset: 1,
       sequence: "Number of odd divisors of n.",
       references: [{:oeis, :a001227, "https://oeis.org/A001227"}]
  def create_sequence_a001227(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001227/1)
  end

  @doc offset: 1
  def seq_a001227(idx) do
    Math.factors(idx)
    |> Enum.filter(fn c -> Integer.is_odd(c) end)
    |> length()
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
  OEIS Sequence `A001477` - The nonnegative integers.

  From [OEIS A001477](https://oeis.org/A001477):

  > The nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a001477`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001477) |> Sequence.take!(78)
      [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77]

  """
  @doc offset: 0,
       sequence: "The nonnegative integers.",
       references: [{:oeis, :a001477, "https://oeis.org/A001477"}]
  def create_sequence_a001477(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001477/1)
  end

  @doc offset: 0
  def seq_a001477(idx) do
    idx
  end

  @doc """
  OEIS Sequence `A001489` - a(n) = -n.

  From [OEIS A001489](https://oeis.org/A001489):

  > a(n) = -n.
  > (Formerly )

  **Sequence IDs**: `:a001489`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001489) |> Sequence.take!(66)
      [0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-44,-45,-46,-47,-48,-49,-50,-51,-52,-53,-54,-55,-56,-57,-58,-59,-60,-61,-62,-63,-64,-65]


  """
  @doc offset: 0,
       sequence: "a(n) = -n.",
       references: [{:oeis, :a001489, "https://oeis.org/A001489"}]
  def create_sequence_a001489(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001489/1)
  end

  @doc offset: 0
  def seq_a001489(idx) do
    idx * -1
  end

  @doc """
  OEIS Sequence `A001511` - The ruler function: 2^a(n) divides 2n

  From [OEIS A001511](https://oeis.org/A001511):

  > The ruler function: 2^a(n) divides 2n. Or, a(n) = 2-adic valuation of 2n.
  > (Formerly M0127 N0051)

  **Sequence IDs**: `:a001511`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001511) |> Sequence.take!(105)
      [1,2,1,3,1,2,1,4,1,2,1,3,1,2,1,5,1,2,1,3,1,2,1,4,1,2,1,3,1,2,1,6,1,2,1,3,1,2,1,4,1,2,1,3,1,2,1,5,1,2,1,3,1,2,1,4,1,2,1,3,1,2,1,7,1,2,1,3,1,2,1,4,1,2,1,3,1,2,1,5,1,2,1,3,1,2,1,4,1,2,1,3,1,2,1,6,1,2,1,3,1,2,1,4,1]


  """
  @doc offset: 1,
       sequence: "The ruler function: 2^a(n) divides 2n",
       references: [{:oeis, :a001511, "https://oeis.org/A001511"}]
  def create_sequence_a001511(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001511/1)
  end

  @doc offset: 1
  def seq_a001511(idx) do
    Math.p_adic_valuation(2, idx * 2)
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
  OEIS Sequence `A003484` - Radon function, also called Hurwitz-Radon numbers.

  From [OEIS A003484](https://oeis.org/A003484):

  > Radon function, also called Hurwitz-Radon numbers.
  > (Formerly M0161)

  **Sequence IDs**: `:a003484`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a003484) |> Sequence.take!(102)
      [1,2,1,4,1,2,1,8,1,2,1,4,1,2,1,9,1,2,1,4,1,2,1,8,1,2,1,4,1,2,1,10,1,2,1,4,1,2,1,8,1,2,1,4,1,2,1,9,1,2,1,4,1,2,1,8,1,2,1,4,1,2,1,12,1,2,1,4,1,2,1,8,1,2,1,4,1,2,1,9,1,2,1,4,1,2,1,8,1,2,1,4,1,2,1,10,1,2,1,4,1,2]


  """
  @doc offset: 1,
       sequence: "Radon function, also called Hurwitz-Radon numbers.",
       references: [{:oeis, :a003484, "https://oeis.org/A003484"}]
  def create_sequence_a003484(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a003484/1)
  end

  @doc offset: 1
  def seq_a003484(idx) do
    Math.hurwitz_radon_number(idx)
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
  OEIS Sequence `A005843` - The nonnegative even numbers: a(n) = 2n.

  From [OEIS A005843](https://oeis.org/A005843):

  > The nonnegative even numbers: a(n) = 2n.
  > (Formerly M0985)

  **Sequence IDs**: `:a005843`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a005843) |> Sequence.take!(61)
      [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120]


  """
  @doc offset: 0,
       sequence: "The nonnegative even numbers: a(n) = 2n.",
       references: [{:oeis, :a005843, "https://oeis.org/A005843"}]
  def create_sequence_a005843(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a005843/1)
  end

  @doc offset: 0
  def seq_a005843(idx) do
    idx * 2
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
  OEIS Sequence `A008292` - Triangle of Eulerian numbers T(n,k) (n >= 1, 1 <= k <= n) read by rows.

  From [OEIS A008292](https://oeis.org/A008292):

  > Triangle of Eulerian numbers T(n,k) (n >= 1, 1 <= k <= n) read by rows.
  > (Formerly )

  **Sequence IDs**: `:a008292`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a008292) |> Sequence.take!(55)
      [1,1,1,1,4,1,1,11,11,1,1,26,66,26,1,1,57,302,302,57,1,1,120,1191,2416,1191,120,1,1,247,4293,15619,15619,4293,247,1,1,502,14608,88234,156190,88234,14608,502,1,1,1013,47840,455192,1310354,1310354,455192,47840,1013,1]


  """
  @doc offset: 1,
       sequence: "Triangle of Eulerian numbers T(n,k) (n >= 1, 1 <= k <= n) read by rows.",
       references: [{:oeis, :a008292, "https://oeis.org/A008292"}]
  def create_sequence_a008292(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a008292/1)
  end

  @doc offset: 1
  def seq_a008292(idx) do
    {n, m} = Math.triangle_position_for_element(idx - 1)
    Math.eulerian_number(n, m)
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
  OEIS Sequence `A000670` - Fubini numbers: number of preferential arrangements of n labeled elements; or number of weak orders on n labeled elements; or number of ordered partitions of [n].

  From [OEIS A000670](https://oeis.org/A000670):

  > Fubini numbers: number of preferential arrangements of n labeled elements; or number of weak orders on n labeled elements; or number of ordered partitions of [n].
  > (Formerly M2952 N1191)

  **Sequence IDs**: `:a000670`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000670) |> Sequence.take!(21)
      [1,1,3,13,75,541,4683,47293,545835,7087261,102247563,1622632573,28091567595,526858348381,10641342970443,230283190977853,5315654681981355,130370767029135901,3385534663256845323,92801587319328411133,2677687796244384203115]


  """
  @doc offset: 0,
       sequence:
         "Fubini numbers: number of preferential arrangements of n labeled elements; or number of weak orders on n labeled elements; or number of ordered partitions of [n].",
       references: [{:oeis, :a000670, "https://oeis.org/A000670"}]
  def create_sequence_a000670(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000670/1)
  end

  @doc offset: 0
  def seq_a000670(idx) do
    Math.fubini_number(idx)
  end

  @doc """
  OEIS Sequence `A000688` - Number of Abelian groups of order n

  From [OEIS A000688](https://oeis.org/A000688):

  > Number of Abelian groups of order n; number of factorizations of n into prime powers.
  > (Formerly M0064 N0020)

  **Sequence IDs**: `:a000688`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000688) |> Sequence.take!(107)
      [1,1,1,2,1,1,1,3,2,1,1,2,1,1,1,5,1,2,1,2,1,1,1,3,2,1,3,2,1,1,1,7,1,1,1,4,1,1,1,3,1,1,1,2,2,1,1,5,2,2,1,2,1,3,1,3,1,1,1,2,1,1,2,11,1,1,1,2,1,1,1,6,1,1,2,2,1,1,1,5,5,1,1,2,1,1,1,3,1,2,1,2,1,1,1,7,1,2,2,4,1,1,1,3,1,1,1]


  """
  @doc offset: 1,
       sequence:
         "Number of Abelian groups of order n; number of factorizations of n into prime powers.",
       references: [{:oeis, :a000688, "https://oeis.org/A000688"}]
  def create_sequence_a000688(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000688/1)
  end

  @doc offset: 1
  def seq_a000688(idx) do
    Math.abelian_groups_count(idx)
  end

  @doc """
  OEIS Sequence `A000720` - pi(n), the number of primes <= n

  From [OEIS A000720](https://oeis.org/A000720):

  > pi(n), the number of primes <= n. Sometimes called PrimePi(n) to distinguish it from the number 3.14159...
  > (Formerly M0256 N0090)

  **Sequence IDs**: `:a000720`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000720) |> Sequence.take!(78)
      [0,1,2,2,3,3,4,4,4,4,5,5,6,6,6,6,7,7,8,8,8,8,9,9,9,9,9,9,10,10,11,11,11,11,11,11,12,12,12,12,13,13,14,14,14,14,15,15,15,15,15,15,16,16,16,16,16,16,17,17,18,18,18,18,18,18,19,19,19,19,20,20,21,21,21,21,21,21]


  """
  @doc offset: 1,
       sequence: "pi(n), the number of primes <= n",
       references: [{:oeis, :a000720, "https://oeis.org/A000720"}]
  def create_sequence_a000720(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a000720/2)
  end

  @doc offset: 1
  def seq_a000720(idx, last) do
    if idx == 1 do
      0
    else
      last + (Fraction.new(idx + 1, Math.sigma(idx)) |> Fraction.get_whole())
    end
  end

  @doc """
  OEIS Sequence `A000796` - Decimal expansion of Pi (or digits of Pi).

  From [OEIS A000796](https://oeis.org/A000796):

  > Decimal expansion of Pi (or digits of Pi).
  > (Formerly M2218 N0880)

  **Sequence IDs**: `:a000796`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a000796) |> Sequence.take!(105)
      [3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,2,3,8,4,6,2,6,4,3,3,8,3,2,7,9,5,0,2,8,8,4,1,9,7,1,6,9,3,9,9,3,7,5,1,0,5,8,2,0,9,7,4,9,4,4,5,9,2,3,0,7,8,1,6,4,0,6,2,8,6,2,0,8,9,9,8,6,2,8,0,3,4,8,2,5,3,4,2,1,1,7,0,6,7,9,8,2,1,4]


  """
  @doc offset: 1,
       sequence: "Decimal expansion of Pi (or digits of Pi).",
       references: [{:oeis, :a000796, "https://oeis.org/A000796"}]
  def create_sequence_a000796(_opts) do
    %{
      next_fn: &Chunky.Sequence.OEIS.Core.seq_a000796/3,
      data: %{carry: {1, 0, 1, 1, 3, 3}, idx: 0}
    }
  end

  def seq_a000796(:init, data, _val) do
    %{
      data: data,
      value: 0
    }
  end

  def seq_a000796(:next, %{carry: carry, idx: idx} = data, _value) do
    {v, n_carry} =
      if idx == 0 do
        Math.next_digit_of_pi()
      else
        Math.next_digit_of_pi(carry)
      end

    %{
      data: data |> Map.merge(%{carry: n_carry, idx: idx + 1}),
      value: v
    }
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
       sequence:
         "Number of different quasi-orders (or topologies, or transitive digraphs) with n labeled elements.",
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
  OEIS Sequence `A002654` - Number of ways of writing n as a sum of at most two nonzero squares, where order matters

  From [OEIS A002654](https://oeis.org/A002654):

  > Number of ways of writing n as a sum of at most two nonzero squares, where order matters; also (number of divisors of n of form 4m+1) - (number of divisors of form 4m+3).
  > (Formerly M0012 N0001)

  **Sequence IDs**: `:a002654`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002654) |> Sequence.take!(105)
      [1,1,0,1,2,0,0,1,1,2,0,0,2,0,0,1,2,1,0,2,0,0,0,0,3,2,0,0,2,0,0,1,0,2,0,1,2,0,0,2,2,0,0,0,2,0,0,0,1,3,0,2,2,0,0,0,0,2,0,0,2,0,0,1,4,0,0,2,0,0,0,1,2,2,0,0,0,0,0,2,1,2,0,0,4,0,0,0,2,2,0,0,0,0,0,0,2,1,0,3,2,0,0,2,0]


  """
  @doc offset: 1,
       sequence:
         "Number of ways of writing n as a sum of at most two nonzero squares, where order matters",
       references: [{:oeis, :a002654, "https://oeis.org/A002654"}]
  def create_sequence_a002654(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002654/1)
  end

  @doc offset: 1
  def seq_a002654(idx) do
    length(Math.divisors_of_form_mx_plus_b(4, 1, idx)) -
      length(Math.divisors_of_form_mx_plus_b(4, 3, idx))
  end

  @doc """
  OEIS Sequence `A002808` - The composite numbers: numbers n of the form x*y for x > 1 and y > 1.

  From [OEIS A002808](https://oeis.org/A002808):

  > The composite numbers: numbers n of the form x*y for x > 1 and y > 1.
  > (Formerly M3272 N1322)

  **Sequence IDs**: `:a002808`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002808) |> Sequence.take!(64) 
      [4,6,8,9,10,12,14,15,16,18,20,21,22,24,25,26,27,28,30,32,33,34,35,36,38,39,40,42,44,45,46,48,49,50,51,52,54,55,56,57,58,60,62,63,64,65,66,68,69,70,72,74,75,76,77,78,80,81,82,84,85,86,87,88]


  """
  @doc offset: 1,
       sequence: "The composite numbers: numbers n of the form x*y for x > 1 and y > 1.",
       references: [{:oeis, :a002808, "https://oeis.org/A002808"}]
  def create_sequence_a002808(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002808/2)
  end

  @doc offset: 1, fill_value: 3
  def seq_a002808(_idx, last) do
    Math.next_number(fn v -> Math.is_prime?(v) == false end, last)
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
  
  @doc """
  OEIS Sequence `A001147` - Double factorial of odd numbers: a(n) = (2*n-1)!! = 1*3*5*...*(2*n-1).

  From [OEIS A001147](https://oeis.org/A001147):

  > Double factorial of odd numbers: a(n) = (2*n-1)!! = 1*3*5*...*(2*n-1).
  > (Formerly M3002 N1217)

  **Sequence IDs**: `:a001147`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001147) |> Sequence.take!(20)
      [1,1,3,15,105,945,10395,135135,2027025,34459425,654729075,13749310575,316234143225,7905853580625,213458046676875,6190283353629375,191898783962510625,6332659870762850625,221643095476699771875,8200794532637891559375]


  """
  @doc offset: 0,
       sequence: "Double factorial of odd numbers: a(n) = (2*n-1)!! = 1*3*5*...*(2*n-1).",
       references: [{:oeis, :a001147, "https://oeis.org/A001147"}]
  def create_sequence_a001147(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001147/1)
  end


  @doc offset: 0
  def seq_a001147(idx) do
      Math.double_factorial(2 * idx - 1)
  end

  @doc """
  OEIS Sequence `A001405` - a(n) = binomial(n, floor(n/2)).

  From [OEIS A001405](https://oeis.org/A001405):

  > a(n) = binomial(n, floor(n/2)).
  > (Formerly M0769 N0294)

  **Sequence IDs**: `:a001405`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001405) |> Sequence.take!(34)
      [1,1,2,3,6,10,20,35,70,126,252,462,924,1716,3432,6435,12870,24310,48620,92378,184756,352716,705432,1352078,2704156,5200300,10400600,20058300,40116600,77558760,155117520,300540195,601080390,1166803110]


  """
  @doc offset: 0,
       sequence: "a(n) = binomial(n, floor(n/2)).",
       references: [{:oeis, :a001405, "https://oeis.org/A001405"}]
  def create_sequence_a001405(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001405/1)
  end


  @doc offset: 0
  def seq_a001405(idx) do
      Math.binomial(idx, div(idx, 2))
  end

  @doc """
  OEIS Sequence `A001519` - a(n) = 3*a(n-1) - a(n-2), with a(0) = a(1) = 1.

  From [OEIS A001519](https://oeis.org/A001519):

  > a(n) = 3*a(n-1) - a(n-2), with a(0) = a(1) = 1.
  > (Formerly M1439 N0569)

  **Sequence IDs**: `:a001519`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001519) |> Sequence.take!(31)
      [1,1,2,5,13,34,89,233,610,1597,4181,10946,28657,75025,196418,514229,1346269,3524578,9227465,24157817,63245986,165580141,433494437,1134903170,2971215073,7778742049,20365011074,53316291173,139583862445,365435296162,956722026041]


  """
  @doc offset: 0,
       sequence: "a(n) = 3*a(n-1) - a(n-2), with a(0) = a(1) = 1.",
       references: [{:oeis, :a001519, "https://oeis.org/A001519"}]
  def create_sequence_a001519(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001519/3)
  end


  @doc offset: 0
  def seq_a001519(idx, a, b) do
      case idx do
         0 -> 1
         1 -> 1
         _ -> 3 * b - a 
      end
  end

  @doc """
  OEIS Sequence `A001700` - a(n) = binomial(2n+1, n+1): number of ways to put n+1 indistinguishable balls into n+1 distinguishable boxes = number of (n+1)-st degree monomials in n+1 variables = number of monotone maps from 1..n+1 to 1..n+1.

  From [OEIS A001700](https://oeis.org/A001700):

  > a(n) = binomial(2n+1, n+1): number of ways to put n+1 indistinguishable balls into n+1 distinguishable boxes = number of (n+1)-st degree monomials in n+1 variables = number of monotone maps from 1..n+1 to 1..n+1.
  > (Formerly M2848 N1144)

  **Sequence IDs**: `:a001700`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001700) |> Sequence.take!(26)
      [1,3,10,35,126,462,1716,6435,24310,92378,352716,1352078,5200300,20058300,77558760,300540195,1166803110,4537567650,17672631900,68923264410,269128937220,1052049481860,4116715363800,16123801841550,63205303218876,247959266474052]


  """
  @doc offset: 0,
       sequence: "a(n) = binomial(2n+1, n+1): number of ways to put n+1 indistinguishable balls into n+1 distinguishable boxes = number of (n+1)-st degree monomials in n+1 variables = number of monotone maps from 1..n+1 to 1..n+1.",
       references: [{:oeis, :a001700, "https://oeis.org/A001700"}]
  def create_sequence_a001700(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001700/1)
  end


  @doc offset: 0
  def seq_a001700(idx) do
      Math.binomial(2 * idx + 1, idx + 1)
  end

  @doc """
  OEIS Sequence `A001764` - a(n) = binomial(3n,n)/(2n+1) (enumerates ternary trees and also noncrossing trees).

  From [OEIS A001764](https://oeis.org/A001764):

  > a(n) = binomial(3n,n)/(2n+1) (enumerates ternary trees and also noncrossing trees).
  > (Formerly M2926 N1174)

  **Sequence IDs**: `:a001764`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001764) |> Sequence.take!(25)
      [1,1,3,12,55,273,1428,7752,43263,246675,1430715,8414640,50067108,300830572,1822766520,11124755664,68328754959,422030545335,2619631042665,16332922290300,102240109897695,642312451217745,4048514844039120,25594403741131680,162250238001816900]


  """
  @doc offset: 0,
       sequence: "a(n) = binomial(3n,n)/(2n+1) (enumerates ternary trees and also noncrossing trees).",
       references: [{:oeis, :a001764, "https://oeis.org/A001764"}]
  def create_sequence_a001764(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001764/1)
  end


  @doc offset: 0
  def seq_a001764(idx) do
      Math.binomial(3 * idx, idx) |> div(2 * idx + 1)
  end

  @doc """
  OEIS Sequence `A006882` - Double factorials n!!: a(n) = n*a(n-2) for n > 1, a(0) = a(1) = 1.

  From [OEIS A006882](https://oeis.org/A006882):

  > Double factorials n!!: a(n) = n*a(n-2) for n > 1, a(0) = a(1) = 1.
  > (Formerly M0876)

  **Sequence IDs**: `:a006882`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a006882) |> Sequence.take!(27)
      [1,1,2,3,8,15,48,105,384,945,3840,10395,46080,135135,645120,2027025,10321920,34459425,185794560,654729075,3715891200,13749310575,81749606400,316234143225,1961990553600,7905853580625,51011754393600]


  """
  @doc offset: 0,
       sequence: "Double factorials n!!: a(n) = n*a(n-2) for n > 1, a(0) = a(1) = 1.",
       references: [{:oeis, :a006882, "https://oeis.org/A006882"}]
  def create_sequence_a006882(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a006882/1)
  end


  @doc offset: 0
  def seq_a006882(idx) do
      Math.double_factorial(idx)
  end  
  
  @doc """
  OEIS Sequence `A001906` - F(2n) = bisection of Fibonacci sequence: a(n) = 3*a(n-1) - a(n-2).

  From [OEIS A001906](https://oeis.org/A001906):

  > F(2n) = bisection of Fibonacci sequence: a(n) = 3*a(n-1) - a(n-2).
  > (Formerly M2741 N1101)

  **Sequence IDs**: `:a001906`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001906) |> Sequence.take!(31)
      [0,1,3,8,21,55,144,377,987,2584,6765,17711,46368,121393,317811,832040,2178309,5702887,14930352,39088169,102334155,267914296,701408733,1836311903,4807526976,12586269025,32951280099,86267571272,225851433717,591286729879,1548008755920]


  """
  @doc offset: 0,
       sequence: "F(2n) = bisection of Fibonacci sequence: a(n) = 3*a(n-1) - a(n-2).",
       references: [{:oeis, :a001906, "https://oeis.org/A001906"}]
  def create_sequence_a001906(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001906/3)
  end


  @doc offset: 0
  def seq_a001906(idx, a, b) do
      case idx do
         0 -> 0
         1 -> 1
         _ -> 3 * b - a 
      end
  end

  @doc """
  OEIS Sequence `A001969` - Evil numbers: numbers with an even number of 1's in their binary expansion.

  From [OEIS A001969](https://oeis.org/A001969):

  > Evil numbers: numbers with an even number of 1's in their binary expansion.
  > (Formerly M2395 N0952)

  **Sequence IDs**: `:a001969`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a001969) |> Sequence.take!(65)
      [0,3,5,6,9,10,12,15,17,18,20,23,24,27,29,30,33,34,36,39,40,43,45,46,48,51,53,54,57,58,60,63,65,66,68,71,72,75,77,78,80,83,85,86,89,90,92,95,96,99,101,102,105,106,108,111,113,114,116,119,120,123,125,126,129]


  """
  @doc offset: 1,
       sequence: "Evil numbers: numbers with an even number of 1's in their binary expansion.",
       references: [{:oeis, :a001969, "https://oeis.org/A001969"}]
  def create_sequence_a001969(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a001969/2)
  end


  @doc offset: 1, fill_value: -1
  def seq_a001969(_idx, last) do
      Math.next_number(
          fn v -> 
              Math.digit_count(v, [1], base: 2) |> rem(2) == 0
          end, 
          last
      )
  end

  @doc """
  OEIS Sequence `A002113` - Palindromes in base 10.

  From [OEIS A002113](https://oeis.org/A002113):

  > Palindromes in base 10.
  > (Formerly M0484 N0178)

  **Sequence IDs**: `:a002113`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002113) |> Sequence.take!(61)
      [0,1,2,3,4,5,6,7,8,9,11,22,33,44,55,66,77,88,99,101,111,121,131,141,151,161,171,181,191,202,212,222,232,242,252,262,272,282,292,303,313,323,333,343,353,363,373,383,393,404,414,424,434,444,454,464,474,484,494,505,515]


  """
  @doc offset: 1,
       sequence: "Palindromes in base 10.",
       references: [{:oeis, :a002113, "https://oeis.org/A002113"}]
  def create_sequence_a002113(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002113/2)
  end


  @doc offset: 1, fill_value: -1
  def seq_a002113(_idx, last) do
      Math.next_number(fn v -> Math.is_palindromic?(v) end, last)
  end

  @doc """
  OEIS Sequence `A002275` - Repunits: (10^n - 1)/9. Often denoted by R_n.

  From [OEIS A002275](https://oeis.org/A002275):

  > Repunits: (10^n - 1)/9. Often denoted by R_n.
  > (Formerly )

  **Sequence IDs**: `:a002275`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002275) |> Sequence.take!(21)
      [0,1,11,111,1111,11111,111111,1111111,11111111,111111111,1111111111,11111111111,111111111111,1111111111111,11111111111111,111111111111111,1111111111111111,11111111111111111,111111111111111111,1111111111111111111,11111111111111111111]


  """
  @doc offset: 0,
       sequence: "Repunits: (10^n - 1)/9. Often denoted by R_n.",
       references: [{:oeis, :a002275, "https://oeis.org/A002275"}]
  def create_sequence_a002275(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002275/1)
  end


  @doc offset: 0
  def seq_a002275(idx) do
      Math.repunit(idx)
  end

  @doc """
  OEIS Sequence `A002378` - Oblong (or promic, pronic, or heteromecic) numbers: a(n) = n*(n+1).

  From [OEIS A002378](https://oeis.org/A002378):

  > Oblong (or promic, pronic, or heteromecic) numbers: a(n) = n*(n+1).
  > (Formerly M1581 N0616)

  **Sequence IDs**: `:a002378`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002378) |> Sequence.take!(51)
      [0,2,6,12,20,30,42,56,72,90,110,132,156,182,210,240,272,306,342,380,420,462,506,552,600,650,702,756,812,870,930,992,1056,1122,1190,1260,1332,1406,1482,1560,1640,1722,1806,1892,1980,2070,2162,2256,2352,2450,2550]


  """
  @doc offset: 0,
       sequence: "Oblong (or promic, pronic, or heteromecic) numbers: a(n) = n*(n+1).",
       references: [{:oeis, :a002378, "https://oeis.org/A002378"}]
  def create_sequence_a002378(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002378/1)
  end


  @doc offset: 0
  def seq_a002378(idx) do
      idx * (idx + 1)
  end

  @doc """
  OEIS Sequence `A002487` - Stern's diatomic series (or Stern-Brocot sequence): a(0) = 0, a(1) = 1; for n > 0: a(2*n) = a(n), a(2*n+1) = a(n) + a(n+1).

  From [OEIS A002487](https://oeis.org/A002487):

  > Stern's diatomic series (or Stern-Brocot sequence): a(0) = 0, a(1) = 1; for n > 0: a(2*n) = a(n), a(2*n+1) = a(n) + a(n+1).
  > (Formerly M0141 N0056)

  **Sequence IDs**: `:a002487`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002487) |> Sequence.take!(92)
      [0,1,1,2,1,3,2,3,1,4,3,5,2,5,3,4,1,5,4,7,3,8,5,7,2,7,5,8,3,7,4,5,1,6,5,9,4,11,7,10,3,11,8,13,5,12,7,9,2,9,7,12,5,13,8,11,3,10,7,11,4,9,5,6,1,7,6,11,5,14,9,13,4,15,11,18,7,17,10,13,3,14,11,19,8,21,13,18,5,17,12,19]


  """
  @doc offset: 0,
       sequence: "Stern's diatomic series (or Stern-Brocot sequence): a(0) = 0, a(1) = 1; for n > 0: a(2*n) = a(n), a(2*n+1) = a(n) + a(n+1).",
       references: [{:oeis, :a002487, "https://oeis.org/A002487"}]
  def create_sequence_a002487(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002487/1)
  end


  @doc offset: 0
  def seq_a002487(idx) do
      Math.stern_diatomic_series(idx)
  end

  @doc """
  OEIS Sequence `A002620` - Quarter-squares: floor(n/2)*ceiling(n/2). Equivalently, floor(n^2/4).

  From [OEIS A002620](https://oeis.org/A002620):

  > Quarter-squares: floor(n/2)*ceiling(n/2). Equivalently, floor(n^2/4).
  > (Formerly M0998 N0374)

  **Sequence IDs**: `:a002620`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a002620) |> Sequence.take!(58) 
      [0,0,1,2,4,6,9,12,16,20,25,30,36,42,49,56,64,72,81,90,100,110,121,132,144,156,169,182,196,210,225,240,256,272,289,306,324,342,361,380,400,420,441,462,484,506,529,552,576,600,625,650,676,702,729,756,784,812]


  """
  @doc offset: 0,
       sequence: "Quarter-squares: floor(n/2)*ceiling(n/2). Equivalently, floor(n^2/4).",
       references: [{:oeis, :a002620, "https://oeis.org/A002620"}]
  def create_sequence_a002620(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a002620/1)
  end


  @doc offset: 0
  def seq_a002620(idx) do
      b = div(idx, 2)
      r = rem(idx, 2)
      b * (b + r)
  end

  @doc """
  OEIS Sequence `A003418` - Least common multiple (or LCM) of {1, 2, ..., n} for n >= 1, a(0) = 1.

  From [OEIS A003418](https://oeis.org/A003418):

  > Least common multiple (or LCM) of {1, 2, ..., n} for n >= 1, a(0) = 1.
  > (Formerly M1590)

  **Sequence IDs**: `:a003418`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a003418) |> Sequence.take!(29)
      [1,1,2,6,12,60,60,420,840,2520,2520,27720,27720,360360,360360,360360,720720,12252240,12252240,232792560,232792560,232792560,232792560,5354228880,5354228880,26771144400,26771144400,80313433200,80313433200]


  """
  @doc offset: 0,
       sequence: "Least common multiple (or LCM) of {1, 2, ..., n} for n >= 1, a(0) = 1.",
       references: [{:oeis, :a003418, "https://oeis.org/A003418"}]
  def create_sequence_a003418(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a003418/1)
  end


  @doc offset: 0
  def seq_a003418(idx) do
      case idx do
         0 -> 1
         1 -> 1
         _ -> Math.lcm(1..idx |> Enum.to_list()) 
      end
  end

  @doc """
  OEIS Sequence `A004526` - Nonnegative integers repeated, floor(n/2).

  From [OEIS A004526](https://oeis.org/A004526):

  > Nonnegative integers repeated, floor(n/2).
  > (Formerly )

  **Sequence IDs**: `:a004526`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a004526) |> Sequence.take!(74)
      [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,24,25,25,26,26,27,27,28,28,29,29,30,30,31,31,32,32,33,33,34,34,35,35,36,36]


  """
  @doc offset: 0,
       sequence: "Nonnegative integers repeated, floor(n/2).",
       references: [{:oeis, :a004526, "https://oeis.org/A004526"}]
  def create_sequence_a004526(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a004526/1)
  end 


  @doc offset: 0
  def seq_a004526(idx) do
      div(idx, 2)
  end

  @doc """
  OEIS Sequence `A005408` - The odd numbers: a(n) = 2*n + 1.

  From [OEIS A005408](https://oeis.org/A005408):

  > The odd numbers: a(n) = 2*n + 1.
  > (Formerly M2400)

  **Sequence IDs**: `:a005408`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Core, :a005408) |> Sequence.take!(66)
      [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49,51,53,55,57,59,61,63,65,67,69,71,73,75,77,79,81,83,85,87,89,91,93,95,97,99,101,103,105,107,109,111,113,115,117,119,121,123,125,127,129,131]


  """
  @doc offset: 0,
       sequence: "The odd numbers: a(n) = 2*n + 1.",
       references: [{:oeis, :a005408, "https://oeis.org/A005408"}]
  def create_sequence_a005408(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Core.seq_a005408/1)
  end


  @doc offset: 0
  def seq_a005408(idx) do
      idx * 2 + 1
  end
  
end
