defmodule Chunky.Sequence.OEIS.Factors do
  @moduledoc """
  OEIS Sequences dealing with Factors, Factorization, and properties of integer factors. 

  ## Available Sequences

   - [A000037 - Numbers that are not squares](https://oeis.org/A000037) - `:a000037` - `create_sequence_a000037/1`
   - [A000977 - Numbers that are divisible by at least three different primes](https://oeis.org/A000977) - `:a000977` - `create_sequence_a000977/1`
   - [A001414 - Integer log of n: sum of primes dividing n (with repetition). Also called sopfr(n).](https://oeis.org/A001414) - `:a001414` - `create_sequence_a001414/1`
   - [A001597 - Perfect Powers](https://oeis.org/A001597) - `:a001597` - `create_sequence_a001597/1`
   - [A001694 - Powerful Numbers](https://oeis.org/A001694) - `:a001694` - `create_sequence_a001694/1`
   - [A002182 - Highly composite numbers: numbers with record value](https://oeis.org/A002182) - `:a002182` - `create_sequence_a002182/1`
   - [A002473 - 7-smooth Numbers](https://oeis.org/A002473) - `:a002473` - `create_sequence_a03586/1`
   - [A003586 - 3-smooth Numbers](https://oeis.org/A003586) - `:a003586` - `create_sequence_a03586/1`
   - [A004709 - Cubefree numbers: numbers that are not divisible by any cube > 1](https://oeis.org/A004709) - `:a004709` - `create_sequence_a004709/1`
   - [A005361 - Product of Expoenents of prime factors of N](https://oeis.org/A005361) - `:a005361` - `create_sequence_a005361/1`
   - [A005934 - Highly powerful numbers: numbers with record value](https://oeis.org/A005934) - `:a005934` - `create_sequence_a005934/1`
   - [A006881 - Squarefree semiprimes: Numbers that are the product of two distinct primes](https://oeis.org/A006881) - `:a006881` - `create_sequence_a006881/1`
   - [A007018 - a(n) = a(n-1)^2 + a(n-1), a(0)=1](https://oeis.org/A007018) - `:a007018` - `create_sequence_a007018/1`
   - [A007304 - Sphenic numbers: products of 3 distinct primes](https://oeis.org/A007304) - `:a007304` - `create_sequence_a007304/1`
   - [A007412 - The noncubes: n + [ (n + [ n^{1/3} ])^{1/3} ]](https://oeis.org/A007412) - `:a007412` - `create_sequence_a007412/1`
   - [A007434 - Jordan function J_2(n)](https://oeis.org/A007434) - `:a007434` - `create_sequence_a007434/1`
   - [A007774 - Numbers that are divisible by exactly 2 different primes](https://oeis.org/A007774) - `:a007774` - `create_sequence_a007774/1`
   - [A007947 - Largest squarefree number dividing n](https://oeis.org/A007947) - `:a007947` - `create_sequence_a007947/1`
   - [A008966 - 1 if n is squarefree, else 0.](https://oeis.org/A008966) - `:a008966` - `create_sequence_a008966/1`
   - [A013929 - Numbers that are not squarefree.](https://oeis.org/A013929) - `:a013929` - `create_sequence_a013929/1`
   - [A014612 - Numbers that are the product of exactly three primes, including multiplicity.](https://oeis.org/A014612) - `:a014612` - `create_sequence_a014612/1`
   - [A014613 - Numbers that are products of 4 primes](https://oeis.org/A014613) - `:a014613` - `create_sequence_a014613/1`
   - [A014614 - Numbers that are products of 5 primes](https://oeis.org/A014614) - `:a014614` - `create_sequence_a014614/1`
   - [A001826 - Number of divisors of n of form 4k+1](https://oeis.org/A001826) - `:a001826` - `create_sequence_a001826/1`
   - [A001842 - Expansion of Sum_{n>=0} x^(4*n+3)/(1 - x^(4*n+3))](https://oeis.org/A001842) - `:a001842` - `create_sequence_a001842/1`
   - [A018253 - Divisors of 24.](https://oeis.org/A018253) - `:a018253` - `create_sequence_a018253/1`
   - [A018256 - Divisors of 36.](https://oeis.org/A018256) - `:a018256` - `create_sequence_a018256/1`
   - [A018261 - Divisors of 48.](https://oeis.org/A018261) - `:a018261` - `create_sequence_a018261/1`
   - [A018266 - Divisors of 60.](https://oeis.org/A018266) - `:a018266` - `create_sequence_a018266/1`
   - [A018293 - Divisors of 120.](https://oeis.org/A018293) - `:a018293` - `create_sequence_a018293/1`
   - [A018321 - Divisors of 180.](https://oeis.org/A018321) - `:a018321` - `create_sequence_a018321/1`
   - [A018350 - Divisors of 240.](https://oeis.org/A018350) - `:a018350` - `create_sequence_a018350/1`
   - [A018412 - Divisors of 360.](https://oeis.org/A018412) - `:a018412` - `create_sequence_a018412/1`
   - [A018609 - Divisors of 720.](https://oeis.org/A018609) - `:a018609` - `create_sequence_a018609/1`
   - [A018676 - Divisors of 840.](https://oeis.org/A018676) - `:a018676` - `create_sequence_a018676/1`
   - [A030513 - Numbers with 4 divisors](https://oeis.org/A030513) - `:a030513` - `create_sequence_a030513/1`
   - [A030515 - Numbers with exactly 6 divisors](https://oeis.org/A030515) - `:a030515` - `create_sequence_a030515/1`
   - [A033273 - Number of nonprime divisors of n](https://oeis.org/A033273) - `:a033273` - `create_sequence_a033273/1`
   - [A033942 - At least 3 prime factors (counted with multiplicity).](https://oeis.org/A033942) - `:a033942` - `create_sequence_a033942/1`
   - [A033987 - Numbers that are divisible by at least 4 primes (counted with multiplicity)](https://oeis.org/A033987) - `:a033987` - `create_sequence_a033987/1`
   - [A033992 - Numbers that are divisible by exactly three different primes](https://oeis.org/A033992) - `:a033992` - `create_sequence_a033992/1`
   - [A033993 - Numbers that are divisible by exactly four different primes](https://oeis.org/A033993) - `:a033993` - `create_sequence_a033993/1`
   - [A036537 - Numbers whose number of divisors is a power of 2.](https://oeis.org/A036537) - `:a036537` - `create_sequence_a036537/1`
   - [A037143 - Numbers with at most 2 prime factors (counted with multiplicity).](https://oeis.org/A037143) - `:a037143` - `create_sequence_a037143/1`
   - [A038109 - Divisible exactly by the square of a prime.](https://oeis.org/A038109) - `:a038109` - `create_sequence_a038109/1`
   - [A039956 - Even squarefree numbers.](https://oeis.org/A039956) - `:a039956` - `create_sequence_a039956/1`
   - [A046099 - Numbers that are not cubefree. Numbers divisible by a cube greater than 1. ](https://oeis.org/A046099) - `:a046099` - `create_sequence_a046099/1`
   - [A046306 - Numbers that are divisible by exactly 6 primes with multiplicity.](https://oeis.org/A046306) - `:a046306` - `create_sequence_a046306/1`
   - [A046308 - Numbers that are divisible by exactly 7 primes counting multiplicity.](https://oeis.org/A046308) - `:a046308` - `create_sequence_a046308/1`
   - [A046310 - Numbers that are divisible by exactly 8 primes counting multiplicity](https://oeis.org/A046310) - `:a046310` - `create_sequence_a046310/1`
   - [A046312 - Numbers that are divisible by exactly 9 primes with multiplicity](https://oeis.org/A046312) - `:a046312` - `create_sequence_a046312/1`
   - [A046314 - Numbers that are divisible by exactly 10 primes with multiplicity](https://oeis.org/A046314) - `:a046314` - `create_sequence_a046314/1`
   - [A046321 - Odd numbers divisible by exactly 8 primes (counted with multiplicity)](https://oeis.org/A046321) - `:a046321` - `create_sequence_a046321/1`
   - [A046386 - Products of four distinct primes](https://oeis.org/A046386) - `:a046386` - `create_sequence_a046386/1`
   - [A046387 - Products of 5 distinct primes](https://oeis.org/A046387) - `:a046387` - `create_sequence_a046387/1`
   - [A046660 - Excess of n = Ω(n) - ω(n)](https://oeis.org/A046660) - `:a046660` - `create_sequence_a046660/1`
   - [A046758 - Equidigital numbers.](https://oeis.org/A046758) - `:a046758` - `create_sequence_a046758/1`
   - [A046759 - Economical numbers: write n as a product of primes raised to powers, let D(n) = number of digits in product, l(n) = number of digits in n; sequence gives n such that D(n) < l(n).](https://oeis.org/A046759) - `:a046759` - `create_sequence_a046759/1`
   - [A046760 - Wasteful numbers.](https://oeis.org/A046760) - `:a046760` - `create_sequence_a046760/1`
   - [A048272 - Number of odd divisors of n minus number of even divisors of n](https://oeis.org/A048272) - `:a048272` - `create_sequence_a048272/1`
   - [A051037 - 5-smooth Numbers](https://oeis.org/A051037) - `:a051037` - `create_sequence_a03586/1`
   - [A051038 - 11-smooth Numbers](https://oeis.org/A051038) - `:a051038` - `create_sequence_a03586/1`
   - [A051270 - Numbers that are divisible by exactly 5 different primes](https://oeis.org/A051270) - `:a051270` - `create_sequence_a051270/1`
   - [A052486 - Achilles numbers - powerful but imperfect](https://oeis.org/A052486) - `:a052486` - `create_sequence_a052486/1`
   - [A056911 - Odd squarefree numbers.](https://oeis.org/A056911) - `:a056911` - `create_sequence_a056911/1`
   - [A059269 - Numbers n for which tau(n) is divisible by 3.](https://oeis.org/A059269) - `:a059269` - `create_sequence_a059269/1`
   - [A059376 - Jordan function J_3(n)](https://oeis.org/A059376) - `:a059376` - `create_sequence_a059376/1`
   - [A059377 - Jordan function J_4(n)](https://oeis.org/A059377) - `:a059377` - `create_sequence_a059377/1`
   - [A059378 - Jordan function J_5(n)](https://oeis.org/A059378) - `:a059378` - `create_sequence_a059378/1`
   - [A065958 - a(n) = n^2*Product_{distinct primes p dividing n} (1+1/p^2)](https://oeis.org/A065958) - `:a065958` - `create_sequence_a065958/1`
   - [A065959 - a(n) = n^3*Product_{distinct primes p dividing n} (1+1/p^3)](https://oeis.org/A065959) - `:a065959` - `create_sequence_a065959/1`
   - [A065960 - a(n) = n^4*Product_{distinct primes p dividing n} (1+1/p^4)](https://oeis.org/A065960) - `:a065960` - `create_sequence_a065960/1`
   - [A067259 - Cubefree numbers which are not squarefree](https://oeis.org/A067259) - `:a067259` - `create_sequence_a067259/1`
   - [A067885 - Product of 6 distinct primes](https://oeis.org/A067885) - `:a067885` - `create_sequence_a067885/1`
   - [A069091 - Jordan function J_6(n)](https://oeis.org/A069091) - `:a069091` - `create_sequence_a069091/1`
   - [A069092 - Jordan function J_7(n)](https://oeis.org/A069092) - `:a069092` - `create_sequence_a069092/1`
   - [A069093 - Jordan function J_8(n)](https://oeis.org/A069093) - `:a069093` - `create_sequence_a069093/1`
   - [A069094 - Jordan function J_9(n)](https://oeis.org/A069094) - `:a069094` - `create_sequence_a069094/1`
   - [A069095 - Jordan function J_10(n)](https://oeis.org/A069095) - `:a069095` - `create_sequence_a069095/1`
   - [A069272 - 11-almost primes (generalization of semiprimes)](https://oeis.org/A069272) - `:a069272` - `create_sequence_a069272/1`
   - [A069273 - 12-almost primes (generalization of semiprimes)](https://oeis.org/A069273) - `:a069273` - `create_sequence_a069273/1`
   - [A069274 - 13-almost primes (generalization of semiprimes)](https://oeis.org/A069274) - `:a069274` - `create_sequence_a069274/1`
   - [A069275 - 14-almost primes (generalization of semiprimes)](https://oeis.org/A069275) - `:a069275` - `create_sequence_a069275/1`
   - [A069276 - 15-almost primes (generalization of semiprimes)](https://oeis.org/A069276) - `:a069276` - `create_sequence_a069276/1`
   - [A069277 - 16-almost primes (generalization of semiprimes)](https://oeis.org/A069277) - `:a069277` - `create_sequence_a069277/1`
   - [A069278 - 17-almost primes (generalization of semiprimes)](https://oeis.org/A069278) - `:a069278` - `create_sequence_a069278/1`
   - [A069279 - Products of exactly 18 primes (generalization of semiprimes)](https://oeis.org/A069279) - `:a069279` - `create_sequence_a069279/1`
   - [A069280 - 19-almost primes (generalization of semiprimes)](https://oeis.org/A069280) - `:a069280` - `create_sequence_a069280/1`
   - [A069281 - 20-almost primes (generalization of semiprimes)](https://oeis.org/A069281) - `:a069281` - `create_sequence_a069281/1`
   - [A074969 - Numbers with six distinct prime divisors](https://oeis.org/A074969) - `:a074969` - `create_sequence_a074969/1`
   - [A076479 - a(n) = mu(rad(n)), where mu is the Moebius-function](https://oeis.org/A076479) - `:a076479` - `create_sequence_a076479/1`
   - [A080197 - 13-smooth Numbers](https://oeis.org/A080197) - `:a080197` - `create_sequence_a03586/1`
   - [A080681 - 17-smooth Numbers](https://oeis.org/A080681) - `:a080681` - `create_sequence_a03586/1`
   - [A080682 - 29-smooth Numbers](https://oeis.org/A080682) - `:a080682` - `create_sequence_a03586/1`
   - [A080683 - 23-smooth Numbers](https://oeis.org/A080683) - `:a080683` - `create_sequence_a03586/1`
   - [A117805 - Start with 3. Square the previous term and subtract it.](https://oeis.org/A117805) - `:a117805` - `create_sequence_a117805/1`
   - [A123321 - Products of 7 distinct primes](https://oeis.org/A123321) - `:a123321` - `create_sequence_a123321/1`
   - [A123322 - Products of 8 distinct primes](https://oeis.org/A123322) - `:a123322` - `create_sequence_a123322/1`
   - [A130897 - Numbers that are not exponentially squarefree.](https://oeis.org/A130897) - `:a130897` - `create_sequence_a130897/1`
   - [A160889 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 4](https://oeis.org/A160889) - `:a160889` - `create_sequence_a160889/1`
   - [A160891 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 5](https://oeis.org/A160891) - `:a160891` - `create_sequence_a160891/1`
   - [A160893 - a(n) = Sum_{d|n} Möbius(n/d)*d^5/phi(n)](https://oeis.org/A160893) - `:a160893` - `create_sequence_a160893/1`
   - [A160895 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 7](https://oeis.org/A160895) - `:a160895` - `create_sequence_a160895/1`
   - [A160897 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 8](https://oeis.org/A160897) - `:a160897` - `create_sequence_a160897/1`
   - [A160908 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 9](https://oeis.org/A160908) - `:a160908` - `create_sequence_a160908/1`
   - [A160953 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 10](https://oeis.org/A160953) - `:a160953` - `create_sequence_a160953/1`
   - [A160957 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 11](https://oeis.org/A160957) - `:a160957` - `create_sequence_a160957/1`
   - [A160960 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 12](https://oeis.org/A160960) - `:a160960` - `create_sequence_a160960/1`
   - [A162643 - Numbers such that their number of divisors is not a power of 2.](https://oeis.org/A162643) - `:a162643` - `create_sequence_a162643/1`
   - [A165412 - Divisors of 2520.](https://oeis.org/A165412) - `:a165412` - `create_sequence_a165412/1`
   - [A178858 - Divisors of 5040.](https://oeis.org/A178858) - `:a178858` - `create_sequence_a178858/1`
   - [A178859 - Divisors of 7560.](https://oeis.org/A178859) - `:a178859` - `create_sequence_a178859/1`
   - [A178860 - Divisors of 10080.](https://oeis.org/A178860) - `:a178860` - `create_sequence_a178860/1`
   - [A178861 - Divisors of 15120.](https://oeis.org/A178861) - `:a178861` - `create_sequence_a178861/1`
   - [A178862 - Divisors of 20160.](https://oeis.org/A178862) - `:a178862` - `create_sequence_a178862/1`
   - [A178863 - Divisors of 25200.](https://oeis.org/A178863) - `:a178863` - `create_sequence_a178863/1`
   - [A178864 - Divisors of 27720.](https://oeis.org/A178864) - `:a178864` - `create_sequence_a178864/1`
   - [A178877 - Divisors of 1260.](https://oeis.org/A178877) - `:a178877` - `create_sequence_a178877/1`
   - [A178878 - Divisors of 1680.](https://oeis.org/A178878) - `:a178878` - `create_sequence_a178878/1`
   - [A209061 - Exponentially squarefree numbers](https://oeis.org/A209061) - `:a209061` - `create_sequence_a209061/1`
   - [A211337 - Numbers n for which the number of divisors, tau(n), is congruent to 1 modulo 3](https://oeis.org/A211337) - `:a211337` - `create_sequence_a211337/1`
   - [A211338 - Numbers n for which the number of divisors, tau(n), is congruent to 2 modulo 3](https://oeis.org/A211338) - `:a211338` - `create_sequence_a211338/1`






  """
  import Chunky.Sequence, only: [sequence_for_function: 1, sequence_for_list: 1]
  alias Chunky.Math
  alias Chunky.Math.Predicates

  require Integer

  # raw data for A018253 - Divisors of 24.
  @data_a018253 [1, 2, 3, 4, 6, 8, 12, 24]

  # raw data for A018256 - Divisors of 36.
  @data_a018256 [1, 2, 3, 4, 6, 9, 12, 18, 36]

  # raw data for A018261 - Divisors of 48.
  @data_a018261 [1, 2, 3, 4, 6, 8, 12, 16, 24, 48]

  # raw data for A018266 - Divisors of 60.
  @data_a018266 [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60]

  # raw data for A018293 - Divisors of 120.
  @data_a018293 [1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30, 40, 60, 120]

  # raw data for A018321 - Divisors of 180.
  @data_a018321 [1, 2, 3, 4, 5, 6, 9, 10, 12, 15, 18, 20, 30, 36, 45, 60, 90, 180]

  # raw data for A018350 - Divisors of 240.
  @data_a018350 [1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 16, 20, 24, 30, 40, 48, 60, 80, 120, 240]

  # raw data for A018412 - Divisors of 360.
  @data_a018412 [
    1,
    2,
    3,
    4,
    5,
    6,
    8,
    9,
    10,
    12,
    15,
    18,
    20,
    24,
    30,
    36,
    40,
    45,
    60,
    72,
    90,
    120,
    180,
    360
  ]

  # raw data for A018609 - Divisors of 720.
  @data_a018609 [
    1,
    2,
    3,
    4,
    5,
    6,
    8,
    9,
    10,
    12,
    15,
    16,
    18,
    20,
    24,
    30,
    36,
    40,
    45,
    48,
    60,
    72,
    80,
    90,
    120,
    144,
    180,
    240,
    360,
    720
  ]

  # raw data for A018676 - Divisors of 840.
  @data_a018676 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    10,
    12,
    14,
    15,
    20,
    21,
    24,
    28,
    30,
    35,
    40,
    42,
    56,
    60,
    70,
    84,
    105,
    120,
    140,
    168,
    210,
    280,
    420,
    840
  ]

  # raw data for A165412 - Divisors of 2520.
  @data_a165412 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    18,
    20,
    21,
    24,
    28,
    30,
    35,
    36,
    40,
    42,
    45,
    56,
    60,
    63,
    70,
    72,
    84,
    90,
    105,
    120,
    126,
    140,
    168,
    180,
    210,
    252,
    280,
    315,
    360,
    420,
    504,
    630,
    840,
    1260,
    2520
  ]

  # raw data for A178858 - Divisors of 5040.
  @data_a178858 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    16,
    18,
    20,
    21,
    24,
    28,
    30,
    35,
    36,
    40,
    42,
    45,
    48,
    56,
    60,
    63,
    70,
    72,
    80,
    84,
    90,
    105,
    112,
    120,
    126,
    140,
    144,
    168,
    180,
    210,
    240,
    252,
    280,
    315,
    336,
    360,
    420,
    504,
    560,
    630,
    720,
    840,
    1008,
    1260,
    1680,
    2520,
    5040
  ]

  # raw data for A178859 - Divisors of 7560.
  @data_a178859 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    18,
    20,
    21,
    24,
    27,
    28,
    30,
    35,
    36,
    40,
    42,
    45,
    54,
    56,
    60,
    63,
    70,
    72,
    84,
    90,
    105,
    108,
    120,
    126,
    135,
    140,
    168,
    180,
    189,
    210,
    216,
    252,
    270,
    280,
    315,
    360,
    378,
    420,
    504,
    540,
    630,
    756,
    840,
    945,
    1080,
    1260,
    1512,
    1890
  ]

  # raw data for A178860 - Divisors of 10080.
  @data_a178860 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    16,
    18,
    20,
    21,
    24,
    28,
    30,
    32,
    35,
    36,
    40,
    42,
    45,
    48,
    56,
    60,
    63,
    70,
    72,
    80,
    84,
    90,
    96,
    105,
    112,
    120,
    126,
    140,
    144,
    160,
    168,
    180,
    210,
    224,
    240,
    252,
    280,
    288,
    315,
    336,
    360,
    420,
    480,
    504,
    560,
    630,
    672,
    720,
    840,
    1008
  ]

  # raw data for A178861 - Divisors of 15120.
  @data_a178861 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    16,
    18,
    20,
    21,
    24,
    27,
    28,
    30,
    35,
    36,
    40,
    42,
    45,
    48,
    54,
    56,
    60,
    63,
    70,
    72,
    80,
    84,
    90,
    105,
    108,
    112,
    120,
    126,
    135,
    140,
    144,
    168,
    180,
    189,
    210,
    216,
    240,
    252,
    270,
    280,
    315,
    336,
    360,
    378,
    420,
    432,
    504,
    540,
    560,
    630
  ]

  # raw data for A178862 - Divisors of 20160.
  @data_a178862 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    16,
    18,
    20,
    21,
    24,
    28,
    30,
    32,
    35,
    36,
    40,
    42,
    45,
    48,
    56,
    60,
    63,
    64,
    70,
    72,
    80,
    84,
    90,
    96,
    105,
    112,
    120,
    126,
    140,
    144,
    160,
    168,
    180,
    192,
    210,
    224,
    240,
    252,
    280,
    288,
    315,
    320,
    336,
    360,
    420,
    448,
    480,
    504,
    560,
    576
  ]

  # raw data for A178863 - Divisors of 25200.
  @data_a178863 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    14,
    15,
    16,
    18,
    20,
    21,
    24,
    25,
    28,
    30,
    35,
    36,
    40,
    42,
    45,
    48,
    50,
    56,
    60,
    63,
    70,
    72,
    75,
    80,
    84,
    90,
    100,
    105,
    112,
    120,
    126,
    140,
    144,
    150,
    168,
    175,
    180,
    200,
    210,
    225,
    240,
    252,
    280,
    300,
    315,
    336,
    350,
    360,
    400,
    420,
    450,
    504
  ]

  # raw data for A178864 - Divisors of 27720.
  @data_a178864 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    14,
    15,
    18,
    20,
    21,
    22,
    24,
    28,
    30,
    33,
    35,
    36,
    40,
    42,
    44,
    45,
    55,
    56,
    60,
    63,
    66,
    70,
    72,
    77,
    84,
    88,
    90,
    99,
    105,
    110,
    120,
    126,
    132,
    140,
    154,
    165,
    168,
    180,
    198,
    210,
    220,
    231,
    252,
    264,
    280,
    308,
    315,
    330,
    360,
    385,
    396,
    420
  ]

  # raw data for A178877 - Divisors of 1260.
  @data_a178877 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    9,
    10,
    12,
    14,
    15,
    18,
    20,
    21,
    28,
    30,
    35,
    36,
    42,
    45,
    60,
    63,
    70,
    84,
    90,
    105,
    126,
    140,
    180,
    210,
    252,
    315,
    420,
    630,
    1260
  ]

  # raw data for A178878 - Divisors of 1680.
  @data_a178878 [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    10,
    12,
    14,
    15,
    16,
    20,
    21,
    24,
    28,
    30,
    35,
    40,
    42,
    48,
    56,
    60,
    70,
    80,
    84,
    105,
    112,
    120,
    140,
    168,
    210,
    240,
    280,
    336,
    420,
    560,
    840,
    1680
  ]

  @doc """
  OEIS Sequence `A000037` - Numbers that are not squares (or, the nonsquares).

  From [OEIS A000037](https://oeis.org/A000037):

  > Numbers that are not squares (or, the nonsquares).
  > (Formerly M0613 N0223)

  **Sequence IDs**: `:a000037`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a000037) |> Sequence.take!(90)
      [2,3,5,6,7,8,10,11,12,13,14,15,17,18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,35,37,38,39,40,41,42,43,44,45,46,47,48,50,51,52,53,54,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99]

  """
  @doc offset: 1,
       sequence: "Numbers that are not squares (or, the nonsquares).",
       references: [{:oeis, :a000037, "https://oeis.org/A000037"}]
  def create_sequence_a000037(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a000037/2)
  end

  @doc offset: 1
  def seq_a000037(_idx, last) do
    Math.next_number(
      fn candidate ->
        if candidate == 1 do
          false
        else
          !Predicates.is_perfect_square?(candidate)
        end
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A000977` - Numbers that are divisible by at least three different primes.

  From [OEIS A000977](https://oeis.org/A000977):

  > Numbers that are divisible by at least three different primes.

  **Sequence IDs**: `:a000977`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a000977) |> Sequence.take!(50)
      [30,42,60,66,70,78,84,90,102,105,110,114,120,126,130,132,138,140,150,154,156,165,168,170,174,180,182,186,190,195,198,204,210,220,222,228,230,231,234,238,240,246,252,255,258,260,264,266,270,273]


  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by at least three different primes.",
       references: [{:oeis, :a000977, "https://oeis.org/A000977"}]
  def create_sequence_a000977(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a000977/2)
  end

  @doc offset: 1
  def seq_a000977(_idx, last) do
    Math.next_number(
      fn candidate ->
        (Math.prime_factors(candidate) -- [1])
        |> Enum.uniq()
        |> length() >= 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A001414` - Integer log of n: sum of primes dividing n (with repetition). Also called sopfr(n).

  From [OEIS A001414](https://oeis.org/A001414):

  > Integer log of n: sum of primes dividing n (with repetition). Also called sopfr(n).
  > (Formerly M0461 N0168)

  **Sequence IDs**: `:a001414`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a001414) |> Sequence.take!(78)
      [0,2,3,4,5,5,7,6,6,7,11,7,13,9,8,8,17,8,19,9,10,13,23,9,10,15,9,11,29,10,31,10,14,19,12,10,37,21,16,11,41,12,43,15,11,25,47,11,14,12,20,17,53,11,16,13,22,31,59,12,61,33,13,12,18,16,67,21,26,14,71,12,73,39,13,23,18,18]


  """
  @doc offset: 1,
       sequence:
         "Integer log of n: sum of primes dividing n (with repetition). Also called sopfr(n).",
       references: [{:oeis, :a001414, "https://oeis.org/A001414"}]
  def create_sequence_a001414(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a001414/1)
  end

  @doc offset: 1
  def seq_a001414(idx) do
    (Math.prime_factors(idx) -- [1])
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A001597` - Perfect Powers

  From [OEIS A001597](https://oeis.org/A001597):

  > Perfect powers: m^k where m > 0 and k >= 2. 
  > (Formerly M3326 N1336)

  **Sequence IDs**: `:a001597`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a001597) |> Sequence.take!(20)
      [1, 4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 81, 100, 121, 125, 128, 144, 169, 196, 216]


  """
  @doc offset: 1,
       sequence: "Perfect Powers",
       references: [{:oeis, :a001597, "https://oeis.org/A001597"}]
  def create_sequence_a001597(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a001597/2)
  end

  @doc offset: 1
  def seq_a001597(_idx, last) do
    Math.next_number(&Predicates.is_perfect_power?/1, last)
  end

  @doc """
  OEIS Sequence `A001694` - Powerful Numbers

  From [OEIS A001694](https://oeis.org/A001694):

  > Powerful numbers, definition (1): if a prime p divides n then p^2 must also divide n (also called squareful, square full, square-full or 2-powerful numbers). 
  > (Formerly M3325 N1335)

  **Sequence IDs**: `:a001694`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a001694) |> Sequence.take!(20)
      [1, 4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 72, 81, 100, 108, 121, 125, 128, 144, 169]

  """
  @doc offset: 1,
       sequence: "Powerful numbers",
       references: [{:oeis, :a001694, "https://oeis.org/A001694"}]
  def create_sequence_a001694(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a001694/2)
  end

  @doc offset: 1
  def seq_a001694(_idx, last) do
    Math.next_number(&Predicates.is_powerful_number?/1, last)
  end

  @doc """
  OEIS Sequence `A002182` - Highly composite numbers: numbers with record value

  From [OEIS A002182](https://oeis.org/A002182):

  > Highly composite numbers, definition (1): where d(n), the number of divisors of n (A000005), increases to a record. 
  > (Formerly M1025 N0385)
      
  **Sequence IDs**: `:a002182`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a002182) |> Sequence.take!(20)
      [1, 2, 4, 6, 12, 24, 36, 48, 60, 120, 180, 240, 360, 720, 840, 1260, 1680, 2520, 5040, 7560]
  """
  @doc offset: 1,
       sequence: "Highly composite numbers, record value of sigma0(n)",
       references: [{:oeis, :a002182, "https://oeis.org/A002182"}]
  def create_sequence_a002182(_opts) do
    %{
      next_fn: &seq_a002182/3,
      data: %{
        sig_0_max: 0
      }
    }
  end

  defp seq_a002182(:init, data, _value), do: %{data: data, value: 0}

  defp seq_a002182(:next, data, value) do
    sig_0_max = data.sig_0_max
    next_han = seq_a002182_greater_sig_0(sig_0_max, value + 1)
    next_sig_0_max = Math.sigma(next_han, 0)

    {
      :continue,
      %{
        data: data |> Map.put(:sig_0_max, next_sig_0_max),
        value: next_han
      }
    }
  end

  defp seq_a002182_greater_sig_0(last_sig_max, val) do
    if Math.sigma(val, 0) > last_sig_max do
      val
    else
      seq_a002182_greater_sig_0(last_sig_max, val + 1)
    end
  end

  @doc """
  OEIS Sequence `A002473` - 7-smooth Numbers

  From [OEIS A002473](https://oeis.org/A002473):

  > 7-smooth numbers: positive numbers whose prime divisors are all <= 7. 
  > (Formerly M0477 N0177)
    
  **Sequence IDs**: `:a002473`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a002473) |> Sequence.drop(20) |> Sequence.take!(20)
      [28, 30, 32, 35, 36, 40, 42, 45, 48, 49, 50, 54, 56, 60, 63, 64, 70, 72, 75, 80]

  """
  @doc offset: 1,
       sequence: "7-smooth numbers",
       references: [{:oeis, :a002473, "https://oeis.org/A002473"}]
  def create_sequence_a002473(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a002473/2)
  end

  @doc offset: 1
  def seq_a002473(_idx, last) do
    Math.next_number(&Predicates.is_7_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A003586` - 3-smooth Numbers

  From [OEIS A003586](https://oeis.org/A003586):

  > 3-smooth numbers: numbers of the form 2^i*3^j with i, j >= 0.  

  **Sequence IDs**: `:a003586`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a003586) |> Sequence.drop(20) |> Sequence.take!(20)
      [108, 128, 144, 162, 192, 216, 243, 256, 288, 324, 384, 432, 486, 512, 576, 648, 729, 768, 864, 972]

  """
  @doc offset: 1,
       sequence: "3-smooth numbers",
       references: [{:oeis, :a003586, "https://oeis.org/A003586"}]
  def create_sequence_a003586(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a003586/2)
  end

  @doc offset: 1
  def seq_a003586(_idx, last) do
    Math.next_number(&Predicates.is_3_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A004709` - Cubefree numbers: numbers that are not divisible by any cube > 1.

  From [OEIS A004709](https://oeis.org/A004709):

  > Cubefree numbers: numbers that are not divisible by any cube > 1.
  > (Formerly )

  **Sequence IDs**: `:a004709`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a004709) |> Sequence.take!(72)
      [1,2,3,4,5,6,7,9,10,11,12,13,14,15,17,18,19,20,21,22,23,25,26,28,29,30,31,33,34,35,36,37,38,39,41,42,43,44,45,46,47,49,50,51,52,53,55,57,58,59,60,61,62,63,65,66,67,68,69,70,71,73,74,75,76,77,78,79,82,83,84,85]


  """
  @doc offset: 1,
       sequence: "Cubefree numbers: numbers that are not divisible by any cube > 1.",
       references: [{:oeis, :a004709, "https://oeis.org/A004709"}]
  def create_sequence_a004709(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a004709/2)
  end

  @doc offset: 1
  def seq_a004709(_idx, last) do
    Math.next_number(&Predicates.is_cubefree?/1, last)
  end

  @doc """
  OEIS Sequence `A005361` - Product of Expoenents of prime factors of N

  From [OEIS A005361](https://oeis.org/A005361):

  > Product of exponents of prime factorization of n. 
  > (Formerly M0063)  

  **Sequence IDs**: `:a005361`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a005361) |> Sequence.take!(20)
      [1, 1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 2, 1, 1, 1, 4, 1, 2, 1, 2]

  """
  @doc offset: 1,
       sequence: "Product of exponents of prime factorization of N",
       references: [{:oeis, :a005361, "https://oeis.org/A005361"}]
  def create_sequence_a005361(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a005361/1)
  end

  @doc offset: 1
  def seq_a005361(idx) do
    Math.product_of_prime_factor_exponents(idx)
  end

  @doc """
  OEIS Sequence `A005934` - Highly powerful numbers: numbers with record value

  From [OEIS A005934](https://oeis.org/A005934):

  > Highly powerful numbers: numbers with record value of the product of the exponents in prime factorization (A005361). 
  > (Formerly M3333)
    
  **Sequence IDs**: `:a005934`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a005934) |> Sequence.take!(20)
      [1, 4, 8, 16, 32, 64, 128, 144, 216, 288, 432, 864, 1296, 1728, 2592, 3456, 5184, 7776, 10368, 15552]
  """
  @doc offset: 1,
       sequence: "Highly powerful numbers: numbers with record value",
       references: [
         {:oeis, :a005934, "https://oeis.org/A005934"},
         {:wikipedia, :highly_powerful_number,
          "https://en.wikipedia.org/wiki/Highly_powerful_number"}
       ]
  def create_sequence_a005934(_opts) do
    %{
      next_fn: &seq_a005934/3,
      data: %{
        ppfe_max: 0
      }
    }
  end

  defp seq_a005934(:init, data, _value) do
    %{
      data: data,
      value: 0
    }
  end

  defp seq_a005934(:next, data, value) do
    # find the next number after value that has a sigma greater than sigma max
    s_m = data.ppfe_max
    s_n = seq_a005934_greater_ppfe(s_m, value + 1)
    next_ppfe_max = Math.product_of_prime_factor_exponents(s_n)

    {
      :continue,
      %{
        data: data |> Map.put(:ppfe_max, next_ppfe_max),
        value: s_n
      }
    }
  end

  defp seq_a005934_greater_ppfe(ppfe_max, val) do
    if Math.product_of_prime_factor_exponents(val) > ppfe_max do
      val
    else
      seq_a005934_greater_ppfe(ppfe_max, val + 1)
    end
  end

  @doc """
  OEIS Sequence `A006881` - Squarefree semiprimes: Numbers that are the product of two distinct primes.

  From [OEIS A006881](https://oeis.org/A006881):

  > Squarefree semiprimes: Numbers that are the product of two distinct primes.
  > (Formerly M4082)

  **Sequence IDs**: `:a006881`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a006881) |> Sequence.take!(60)
      [6,10,14,15,21,22,26,33,34,35,38,39,46,51,55,57,58,62,65,69,74,77,82,85,86,87,91,93,94,95,106,111,115,118,119,122,123,129,133,134,141,142,143,145,146,155,158,159,161,166,177,178,183,185,187,194,201,202,203,205]

  """
  @doc offset: 1,
       sequence: "Squarefree semiprimes: Numbers that are the product of two distinct primes.",
       references: [{:oeis, :a006881, "https://oeis.org/A006881"}]
  def create_sequence_a006881(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a006881/2)
  end

  @doc offset: 1
  def seq_a006881(_idx, last) do
    Math.next_number(
      fn candidate ->
        facs = Math.prime_factors(candidate) -- [1]
        length(facs) == 2 && length(Enum.uniq(facs)) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A007018` - a(n) = a(n-1)^2 + a(n-1), a(0)=1.

  From [OEIS A007018](https://oeis.org/A007018):

  > a(n) = a(n-1)^2 + a(n-1), a(0)=1.
  > (Formerly M1713)

  **Sequence IDs**: `:a007018`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a007018) |> Sequence.take!(9)
      [1,2,6,42,1806,3263442,10650056950806,113423713055421844361000442,12864938683278671740537145998360961546653259485195806]


  """
  @doc offset: 0,
       sequence: "a(n) = a(n-1)^2 + a(n-1), a(0)=1.",
       references: [{:oeis, :a007018, "https://oeis.org/A007018"}]
  def create_sequence_a007018(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a007018/2)
  end

  @doc offset: 0
  def seq_a007018(idx, last) do
    if idx == 0 do
      1
    else
      last * last + last
    end
  end

  @doc """
  OEIS Sequence `A007304` - Sphenic numbers: products of 3 distinct primes.

  From [OEIS A007304](https://oeis.org/A007304):

  > Sphenic numbers: products of 3 distinct primes.
  > (Formerly M5207)

  **Sequence IDs**: `:a007304`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a007304) |> Sequence.take!(53)
      [30,42,66,70,78,102,105,110,114,130,138,154,165,170,174,182,186,190,195,222,230,231,238,246,255,258,266,273,282,285,286,290,310,318,322,345,354,357,366,370,374,385,399,402,406,410,418,426,429,430,434,435,438]


  """
  @doc offset: 1,
       sequence: "Sphenic numbers: products of 3 distinct primes.",
       references: [{:oeis, :a007304, "https://oeis.org/A007304"}]
  def create_sequence_a007304(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a007304/2)
  end

  @doc offset: 1
  def seq_a007304(_idx, last) do
    Math.next_number(&Predicates.is_sphenic_number?/1, last)
  end

  @doc """
  OEIS Sequence `A007412` - The noncubes: n + [ (n + [ n^{1/3} ])^{1/3} ].

  From [OEIS A007412](https://oeis.org/A007412):

  > The noncubes: n + [ (n + [ n^{1/3} ])^{1/3} ].
  > (Formerly M0493)

  **Sequence IDs**: `:a007412`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a007412) |> Sequence.take!(54)
      [2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57]


  """
  @doc offset: 1,
       sequence: "The noncubes: n + [ (n + [ n^{1/3} ])^{1/3} ].",
       references: [{:oeis, :a007412, "https://oeis.org/A007412"}]
  def create_sequence_a007412(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a007412/2)
  end

  @doc offset: 1
  def seq_a007412(_idx, last) do
    Math.next_number(
      fn candidate ->
        if candidate == 1 do
          false
        else
          !Predicates.is_perfect_cube?(candidate)
        end
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A007434` - Jordan function J_2(n)

  From [OEIS A007434](https://oeis.org/A007434):

  > Jordan function J_2(n) (a generalization of phi(n)).
  > (Formerly M2717)

  **Sequence IDs**: `:a007434`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a007434) |> Sequence.take!(48)
      [1,3,8,12,24,24,48,48,72,72,120,96,168,144,192,192,288,216,360,288,384,360,528,384,600,504,648,576,840,576,960,768,960,864,1152,864,1368,1080,1344,1152,1680,1152,1848,1440,1728,1584,2208,1536]

  """
  @doc offset: 1,
       sequence: "Jordan function J_2(n)",
       references: [{:oeis, :a007434, "https://oeis.org/A007434"}]
  def create_sequence_a007434(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a007434/1)
  end

  @doc offset: 1
  def seq_a007434(idx) do
    Math.jordan_totient(idx, 2)
  end

  @doc """
  OEIS Sequence `A007774` - Numbers that are divisible by exactly 2 different primes.

  From [OEIS A007774](https://oeis.org/A007774):

  > Numbers that are divisible by exactly 2 different primes.

  **Sequence IDs**: `:a007774`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a007774) |> Sequence.take!(65)
      [6,10,12,14,15,18,20,21,22,24,26,28,33,34,35,36,38,39,40,44,45,46,48,50,51,52,54,55,56,57,58,62,63,65,68,69,72,74,75,76,77,80,82,85,86,87,88,91,92,93,94,95,96,98,99,100,104,106,108,111,112,115,116,117,118]


  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 2 different primes.",
       references: [{:oeis, :a007774, "https://oeis.org/A007774"}]
  def create_sequence_a007774(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a007774/2)
  end

  @doc offset: 1
  def seq_a007774(_idx, last) do
    Math.next_number(
      fn candidate ->
        (Math.prime_factors(candidate) -- [1])
        |> Enum.uniq()
        |> length() == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A007947` - Largest squarefree number dividing n: the squarefree kernel of n, rad(n), radical of n.

  From [OEIS A007947](https://oeis.org/A007947):

  > Largest squarefree number dividing n: the squarefree kernel of n, rad(n), radical of n.

  **Sequence IDs**: `:a007947`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a007947) |> Sequence.take!(78)
      [1,2,3,2,5,6,7,2,3,10,11,6,13,14,15,2,17,6,19,10,21,22,23,6,5,26,3,14,29,30,31,2,33,34,35,6,37,38,39,10,41,42,43,22,15,46,47,6,7,10,51,26,53,6,55,14,57,58,59,30,61,62,21,2,65,66,67,34,69,70,71,6,73,74,15,38,77,78]

  """
  @doc offset: 1,
       sequence:
         "Largest squarefree number dividing n: the squarefree kernel of n, rad(n), radical of n.",
       references: [{:oeis, :a007947, "https://oeis.org/A007947"}]
  def create_sequence_a007947(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a007947/1)
  end

  @doc offset: 1
  def seq_a007947(idx) do
    Math.radical(idx)
  end

  @doc """
  OEIS Sequence `A008966` - 1 if n is squarefree, else 0.

  From [OEIS A008966](https://oeis.org/A008966):

  > 1 if n is squarefree, else 0.
  > (Formerly )

  **Sequence IDs**: `:a008966`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a008966) |> Sequence.take!(100)
      [1,1,1,0,1,1,1,0,0,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0,0,1,0,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,0,1,1,0,0,0,1,0,1,0,1,0,1,1,1,0,1,1,0,0,1,1,1,0,1,1,1,0,1,1,0,0,1,1,1,0,0,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,0,0]


  """
  @doc offset: 1,
       sequence: "1 if n is squarefree, else 0.",
       references: [{:oeis, :a008966, "https://oeis.org/A008966"}]
  def create_sequence_a008966(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a008966/1)
  end

  @doc offset: 1
  def seq_a008966(idx) do
    if Predicates.is_squarefree?(idx) do
      1
    else
      0
    end
  end

  @doc """
  OEIS Sequence `A013929` - Numbers that are not squarefree. Numbers that are divisible by a square greater than 1. The complement of A005117.

  From [OEIS A013929](https://oeis.org/A013929):

  > Numbers that are not squarefree. Numbers that are divisible by a square greater than 1. The complement of A005117.

  **Sequence IDs**: `:a013929`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a013929) |> Sequence.take!(62)
      [4,8,9,12,16,18,20,24,25,27,28,32,36,40,44,45,48,49,50,52,54,56,60,63,64,68,72,75,76,80,81,84,88,90,92,96,98,99,100,104,108,112,116,117,120,121,124,125,126,128,132,135,136,140,144,147,148,150,152,153,156,160]


  """
  @doc offset: 1,
       sequence:
         "Numbers that are not squarefree. Numbers that are divisible by a square greater than 1. The complement of A005117.",
       references: [{:oeis, :a013929, "https://oeis.org/A013929"}]
  def create_sequence_a013929(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a013929/2)
  end

  @doc offset: 1
  def seq_a013929(_idx, last) do
    Math.next_number(
      fn candidate ->
        !Predicates.is_squarefree?(candidate)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A014612` - Numbers that are the product of exactly three primes.

  From [OEIS A014612](https://oeis.org/A014612):

  > Numbers that are the product of exactly three (not necessarily distinct) primes.
  > (Formerly )

  **Sequence IDs**: `:a014612`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a014612) |> Sequence.take!(57)
      [8,12,18,20,27,28,30,42,44,45,50,52,63,66,68,70,75,76,78,92,98,99,102,105,110,114,116,117,124,125,130,138,147,148,153,154,164,165,170,171,172,174,175,182,186,188,190,195,207,212,222,230,231,236,238,242,244]


  """
  @doc offset: 1,
       sequence: "Numbers that are the product of exactly three primes.",
       references: [{:oeis, :a014612, "https://oeis.org/A014612"}]
  def create_sequence_a014612(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a014612/2)
  end

  @doc offset: 1
  def seq_a014612(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 3 end, last)
  end

  @doc """
  OEIS Sequence `A014613` - Numbers that are products of 4 primes

  From [OEIS A014613](https://oeis.org/A014613):

  > Numbers that are products of 4 primes (these numbers are sometimes called "4-almost primes", a generalization of semiprimes).

  **Sequence IDs**: `:a014613`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a014613) |> Sequence.take!(54)
      [16,24,36,40,54,56,60,81,84,88,90,100,104,126,132,135,136,140,150,152,156,184,189,196,198,204,210,220,225,228,232,234,248,250,260,276,294,296,297,306,308,315,328,330,340,342,344,348,350,351,364,372,375,376]


  """
  @doc offset: 1,
       sequence: "Numbers that are products of 4 primes",
       references: [{:oeis, :a014613, "https://oeis.org/A014613"}]
  def create_sequence_a014613(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a014613/2)
  end

  @doc offset: 1
  def seq_a014613(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 4 end, last)
  end

  @doc """
  OEIS Sequence `A014614` - Numbers that are products of 5 primes

  From [OEIS A014614](https://oeis.org/A014614):

  > Numbers that are products of 5 primes (or 5-almost primes, a generalization of semiprimes).

  **Sequence IDs**: `:a014614`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a014614) |> Sequence.take!(52)
      [32,48,72,80,108,112,120,162,168,176,180,200,208,243,252,264,270,272,280,300,304,312,368,378,392,396,405,408,420,440,450,456,464,468,496,500,520,552,567,588,592,594,612,616,630,656,660,675,680,684,688,696]

  """
  @doc offset: 1,
       sequence:
         "Numbers that are products of 5 primes (or 5-almost primes, a generalization of semiprimes).",
       references: [{:oeis, :a014614, "https://oeis.org/A014614"}]
  def create_sequence_a014614(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a014614/2)
  end

  @doc offset: 1
  def seq_a014614(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 5 end, last)
  end

  @doc """
  OEIS Sequence `A001826` - Number of divisors of n of form 4k+1.

  From [OEIS A001826](https://oeis.org/A001826):

  > Number of divisors of n of form 4k+1.
  > (Formerly )

  **Sequence IDs**: `:a001826`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a001826) |> Sequence.take!(105)
      [1,1,1,1,2,1,1,1,2,2,1,1,2,1,2,1,2,2,1,2,2,1,1,1,3,2,2,1,2,2,1,1,2,2,2,2,2,1,2,2,2,2,1,1,4,1,1,1,2,3,2,2,2,2,2,1,2,2,1,2,2,1,3,1,4,2,1,2,2,2,1,2,2,2,3,1,2,2,1,2,3,2,1,2,4,1,2,1,2,4,2,1,2,1,2,1,2,2,3,3,2,2,1,2,4]


  """
  @doc offset: 1,
       sequence: "Number of divisors of n of form 4k+1",
       references: [{:oeis, :a001826, "https://oeis.org/A001826"}]
  def create_sequence_a001826(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a001826/1)
  end

  @doc offset: 1
  def seq_a001826(idx) do
    Math.divisors_of_form_mx_plus_b(4, 1, idx) |> length()
  end

  @doc """
  OEIS Sequence `A001842` - Expansion of Sum_{n>=0} x^(4*n+3)/(1 - x^(4*n+3)).

  From [OEIS A001842](https://oeis.org/A001842):

  > Expansion of Sum_{n>=0} x^(4*n+3)/(1 - x^(4*n+3)).
  > (Formerly )

  **Sequence IDs**: `:a001842`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a001842) |> Sequence.take!(87)
      [0,0,0,1,0,0,1,1,0,1,0,1,1,0,1,2,0,0,1,1,0,2,1,1,1,0,0,2,1,0,2,1,0,2,0,2,1,0,1,2,0,0,2,1,1,2,1,1,1,1,0,2,0,0,2,2,1,2,0,1,2,0,1,3,0,0,2,1,0,2,2,1,1,0,0,3,1,2,2,1,0,2,0,1,2,0,1]


  """
  @doc offset: 0,
       sequence: "Expansion of Sum_{n>=0} x^(4*n+3)/(1 - x^(4*n+3)).",
       references: [{:oeis, :a001842, "https://oeis.org/A001842"}]
  def create_sequence_a001842(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a001842/1)
  end

  @doc offset: 0
  def seq_a001842(idx) do
    if idx == 0 do
      0
    else
      Math.divisors_of_form_mx_plus_b(4, 3, idx) |> length()
    end
  end

  @doc """
  OEIS Sequence `A018253` - Divisors of 24.

  From [OEIS A018253](https://oeis.org/A018253):

  > Divisors of 24.
  > (Formerly )

  **Sequence IDs**: `:a018253`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018253) |> Sequence.take!(8)
      [1,2,3,4,6,8,12,24]


  """
  @doc offset: 1,
       sequence: "Divisors of 24.",
       references: [{:oeis, :a018253, "https://oeis.org/A018253"}]
  def create_sequence_a018253(_opts) do
    sequence_for_list(@data_a018253)
  end

  @doc """
  OEIS Sequence `A018256` - Divisors of 36.

  From [OEIS A018256](https://oeis.org/A018256):

  > Divisors of 36.
  > (Formerly )

  **Sequence IDs**: `:a018256`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018256) |> Sequence.take!(9)
      [1,2,3,4,6,9,12,18,36]


  """
  @doc offset: 1,
       sequence: "Divisors of 36.",
       references: [{:oeis, :a018256, "https://oeis.org/A018256"}]
  def create_sequence_a018256(_opts) do
    sequence_for_list(@data_a018256)
  end

  @doc """
  OEIS Sequence `A018261` - Divisors of 48.

  From [OEIS A018261](https://oeis.org/A018261):

  > Divisors of 48.
  > (Formerly )

  **Sequence IDs**: `:a018261`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018261) |> Sequence.take!(10)
      [1,2,3,4,6,8,12,16,24,48]


  """
  @doc offset: 1,
       sequence: "Divisors of 48.",
       references: [{:oeis, :a018261, "https://oeis.org/A018261"}]
  def create_sequence_a018261(_opts) do
    sequence_for_list(@data_a018261)
  end

  @doc """
  OEIS Sequence `A018266` - Divisors of 60.

  From [OEIS A018266](https://oeis.org/A018266):

  > Divisors of 60.
  > (Formerly )

  **Sequence IDs**: `:a018266`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018266) |> Sequence.take!(12)
      [1,2,3,4,5,6,10,12,15,20,30,60]


  """
  @doc offset: 1,
       sequence: "Divisors of 60.",
       references: [{:oeis, :a018266, "https://oeis.org/A018266"}]
  def create_sequence_a018266(_opts) do
    sequence_for_list(@data_a018266)
  end

  @doc """
  OEIS Sequence `A018293` - Divisors of 120.

  From [OEIS A018293](https://oeis.org/A018293):

  > Divisors of 120.
  > (Formerly )

  **Sequence IDs**: `:a018293`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018293) |> Sequence.take!(16)
      [1,2,3,4,5,6,8,10,12,15,20,24,30,40,60,120]


  """
  @doc offset: 1,
       sequence: "Divisors of 120.",
       references: [{:oeis, :a018293, "https://oeis.org/A018293"}]
  def create_sequence_a018293(_opts) do
    sequence_for_list(@data_a018293)
  end

  @doc """
  OEIS Sequence `A018321` - Divisors of 180.

  From [OEIS A018321](https://oeis.org/A018321):

  > Divisors of 180.
  > (Formerly )

  **Sequence IDs**: `:a018321`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018321) |> Sequence.take!(18)
      [1,2,3,4,5,6,9,10,12,15,18,20,30,36,45,60,90,180]


  """
  @doc offset: 1,
       sequence: "Divisors of 180.",
       references: [{:oeis, :a018321, "https://oeis.org/A018321"}]
  def create_sequence_a018321(_opts) do
    sequence_for_list(@data_a018321)
  end

  @doc """
  OEIS Sequence `A018350` - Divisors of 240.

  From [OEIS A018350](https://oeis.org/A018350):

  > Divisors of 240.
  > (Formerly )

  **Sequence IDs**: `:a018350`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018350) |> Sequence.take!(20)
      [1,2,3,4,5,6,8,10,12,15,16,20,24,30,40,48,60,80,120,240]


  """
  @doc offset: 1,
       sequence: "Divisors of 240.",
       references: [{:oeis, :a018350, "https://oeis.org/A018350"}]
  def create_sequence_a018350(_opts) do
    sequence_for_list(@data_a018350)
  end

  @doc """
  OEIS Sequence `A018412` - Divisors of 360.

  From [OEIS A018412](https://oeis.org/A018412):

  > Divisors of 360.
  > (Formerly )

  **Sequence IDs**: `:a018412`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018412) |> Sequence.take!(24)
      [1,2,3,4,5,6,8,9,10,12,15,18,20,24,30,36,40,45,60,72,90,120,180,360]


  """
  @doc offset: 1,
       sequence: "Divisors of 360.",
       references: [{:oeis, :a018412, "https://oeis.org/A018412"}]
  def create_sequence_a018412(_opts) do
    sequence_for_list(@data_a018412)
  end

  @doc """
  OEIS Sequence `A018609` - Divisors of 720.

  From [OEIS A018609](https://oeis.org/A018609):

  > Divisors of 720.
  > (Formerly )

  **Sequence IDs**: `:a018609`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018609) |> Sequence.take!(30)
      [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,30,36,40,45,48,60,72,80,90,120,144,180,240,360,720]


  """
  @doc offset: 1,
       sequence: "Divisors of 720.",
       references: [{:oeis, :a018609, "https://oeis.org/A018609"}]
  def create_sequence_a018609(_opts) do
    sequence_for_list(@data_a018609)
  end

  @doc """
  OEIS Sequence `A018676` - Divisors of 840.

  From [OEIS A018676](https://oeis.org/A018676):

  > Divisors of 840.
  > (Formerly )

  **Sequence IDs**: `:a018676`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a018676) |> Sequence.take!(32)
      [1,2,3,4,5,6,7,8,10,12,14,15,20,21,24,28,30,35,40,42,56,60,70,84,105,120,140,168,210,280,420,840]


  """
  @doc offset: 1,
       sequence: "Divisors of 840.",
       references: [{:oeis, :a018676, "https://oeis.org/A018676"}]
  def create_sequence_a018676(_opts) do
    sequence_for_list(@data_a018676)
  end

  @doc """
  OEIS Sequence `A030513` - Numbers with 4 divisors.

  From [OEIS A030513](https://oeis.org/A030513):

  > Numbers with 4 divisors.
  > (Formerly )

  **Sequence IDs**: `:a030513`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a030513) |> Sequence.take!(58)
      [6,8,10,14,15,21,22,26,27,33,34,35,38,39,46,51,55,57,58,62,65,69,74,77,82,85,86,87,91,93,94,95,106,111,115,118,119,122,123,125,129,133,134,141,142,143,145,146,155,158,159,161,166,177,178,183,185,187]


  """
  @doc offset: 1,
       sequence: "Numbers with 4 divisors.",
       references: [{:oeis, :a030513, "https://oeis.org/A030513"}]
  def create_sequence_a030513(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a030513/2)
  end

  @doc offset: 1
  def seq_a030513(_idx, last) do
    Math.next_number(fn candidate -> Math.factors(candidate) |> length() == 4 end, last)
  end

  @doc """
  OEIS Sequence `A030515` - Numbers with exactly 6 divisors.

  From [OEIS A030515](https://oeis.org/A030515):

  > Numbers with exactly 6 divisors.

  **Sequence IDs**: `:a030515`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a030515) |> Sequence.take!(52)
      [12,18,20,28,32,44,45,50,52,63,68,75,76,92,98,99,116,117,124,147,148,153,164,171,172,175,188,207,212,236,242,243,244,245,261,268,275,279,284,292,316,325,332,333,338,356,363,369,387,388,404,412]

  """
  @doc offset: 1,
       sequence: "Numbers with exactly 6 divisors",
       references: [{:oeis, :a030515, "https://oeis.org/A030515"}]
  def create_sequence_a030515(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a030515/2)
  end

  @doc offset: 1
  def seq_a030515(_idx, last) do
    Math.next_number(fn candidate -> Math.factors(candidate) |> length() == 6 end, last)
  end

  @doc """
  OEIS Sequence `A033273` - Number of nonprime divisors of n.

  From [OEIS A033273](https://oeis.org/A033273):

  > Number of nonprime divisors of n.

  **Sequence IDs**: `:a033273`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a033273) |> Sequence.take!(104)
      [1,1,1,2,1,2,1,3,2,2,1,4,1,2,2,4,1,4,1,4,2,2,1,6,2,2,3,4,1,5,1,5,2,2,2,7,1,2,2,6,1,5,1,4,4,2,1,8,2,4,2,4,1,6,2,6,2,2,1,9,1,2,4,6,2,5,1,4,2,5,1,10,1,2,4,4,2,5,1,8,4,2,1,9,2,2,2,6,1,9,2,4,2,2,2,10,1,4,4,7,1,5,1,6]

  """
  @doc offset: 1,
       sequence: "Number of nonprime divisors of n",
       references: [{:oeis, :a033273, "https://oeis.org/A033273"}]
  def create_sequence_a033273(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a033273/1)
  end

  @doc offset: 1
  def seq_a033273(idx) do
    length(Math.factors(idx)) - Math.omega(idx)
  end

  @doc """
  OEIS Sequence `A033942` - At least 3 prime factors (counted with multiplicity).

  From [OEIS A033942](https://oeis.org/A033942):

  > At least 3 prime factors (counted with multiplicity).

  **Sequence IDs**: `:a033942`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a033942) |> Sequence.take!(61)
      [8,12,16,18,20,24,27,28,30,32,36,40,42,44,45,48,50,52,54,56,60,63,64,66,68,70,72,75,76,78,80,81,84,88,90,92,96,98,99,100,102,104,105,108,110,112,114,116,117,120,124,125,126,128,130,132,135,136,138,140,144]


  """
  @doc offset: 1,
       sequence: "At least 3 prime factors (counted with multiplicity)",
       references: [{:oeis, :a033942, "https://oeis.org/A033942"}]
  def create_sequence_a033942(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a033942/2)
  end

  @doc offset: 1
  def seq_a033942(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) >= 3 end, last)
  end

  @doc """
  OEIS Sequence `A033987` - Numbers that are divisible by at least 4 primes (counted with multiplicity).

  From [OEIS A033987](https://oeis.org/A033987):

  > Numbers that are divisible by at least 4 primes (counted with multiplicity).

  **Sequence IDs**: `:a033987`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a033987) |> Sequence.take!(55)
      [16,24,32,36,40,48,54,56,60,64,72,80,81,84,88,90,96,100,104,108,112,120,126,128,132,135,136,140,144,150,152,156,160,162,168,176,180,184,189,192,196,198,200,204,208,210,216,220,224,225,228,232,234,240,243]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by at least 4 primes (counted with multiplicity)",
       references: [{:oeis, :a033987, "https://oeis.org/A033987"}]
  def create_sequence_a033987(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a033987/2)
  end

  @doc offset: 1
  def seq_a033987(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) >= 4 end, last)
  end

  @doc """
  OEIS Sequence `A033992` - Numbers that are divisible by exactly three different primes.

  From [OEIS A033992](https://oeis.org/A033992):

  > Numbers that are divisible by exactly three different primes.

  **Sequence IDs**: `:a033992`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a033992) |> Sequence.take!(53)
      [30,42,60,66,70,78,84,90,102,105,110,114,120,126,130,132,138,140,150,154,156,165,168,170,174,180,182,186,190,195,198,204,220,222,228,230,231,234,238,240,246,252,255,258,260,264,266,270,273,276,280,282,285]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly three different primes",
       references: [{:oeis, :a033992, "https://oeis.org/A033992"}]
  def create_sequence_a033992(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a033992/2)
  end

  @doc offset: 1
  def seq_a033992(_idx, last) do
    Math.next_number(
      fn candidate ->
        (Math.prime_factors(candidate) -- [1])
        |> Enum.uniq()
        |> length() == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A033993` - Numbers that are divisible by exactly four different primes.

  From [OEIS A033993](https://oeis.org/A033993):

  > Numbers that are divisible by exactly four different primes.
  > (Formerly )

  **Sequence IDs**: `:a033993`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a033993) |> Sequence.take!(46)
      [210,330,390,420,462,510,546,570,630,660,690,714,770,780,798,840,858,870,910,924,930,966,990,1020,1050,1092,1110,1122,1140,1155,1170,1190,1218,1230,1254,1260,1290,1302,1320,1326,1330,1365,1380,1386,1410,1428]


  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly four different primes.",
       references: [{:oeis, :a033993, "https://oeis.org/A033993"}]
  def create_sequence_a033993(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a033993/2)
  end

  @doc offset: 1
  def seq_a033993(_idx, last) do
    Math.next_number(
      fn candidate ->
        (Math.prime_factors(candidate) -- [1])
        |> Enum.uniq()
        |> length() == 4
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A036537` - Numbers whose number of divisors is a power of 2.

  From [OEIS A036537](https://oeis.org/A036537):

  > Numbers whose number of divisors is a power of 2.
  > (Formerly )

  **Sequence IDs**: `:a036537`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a036537) |> Sequence.take!(70)
      [1,2,3,5,6,7,8,10,11,13,14,15,17,19,21,22,23,24,26,27,29,30,31,33,34,35,37,38,39,40,41,42,43,46,47,51,53,54,55,56,57,58,59,61,62,65,66,67,69,70,71,73,74,77,78,79,82,83,85,86,87,88,89,91,93,94,95,97,101,102]


  """
  @doc offset: 1,
       sequence: "Numbers whose number of divisors is a power of 2.",
       references: [{:oeis, :a036537, "https://oeis.org/A036537"}]
  def create_sequence_a036537(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a036537/2)
  end

  @doc offset: 1
  def seq_a036537(_idx, last) do
    Math.next_number(
      fn candidate ->
        Math.factors(candidate)
        |> length()
        |> Math.is_power_of?(2)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A037143` - Numbers with at most 2 prime factors (counted with multiplicity).

  From [OEIS A037143](https://oeis.org/A037143):

  > Numbers with at most 2 prime factors (counted with multiplicity).

  **Sequence IDs**: `:a037143`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a037143) |> Sequence.take!(69)
      [1,2,3,4,5,6,7,9,10,11,13,14,15,17,19,21,22,23,25,26,29,31,33,34,35,37,38,39,41,43,46,47,49,51,53,55,57,58,59,61,62,65,67,69,71,73,74,77,79,82,83,85,86,87,89,91,93,94,95,97,101,103,106,107,109,111,113,115,118]

  """
  @doc offset: 1,
       sequence: "Numbers with at most 2 prime factors (counted with multiplicity)",
       references: [{:oeis, :a037143, "https://oeis.org/A037143"}]
  def create_sequence_a037143(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a037143/2)
  end

  @doc offset: 1
  def seq_a037143(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) <= 2 end, last)
  end

  @doc """
  OEIS Sequence `A038109` - Divisible exactly by the square of a prime.

  From [OEIS A038109](https://oeis.org/A038109):

  > Divisible exactly by the square of a prime.

  **Sequence IDs**: `:a038109`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a038109) |> Sequence.take!(58)
      [4,9,12,18,20,25,28,36,44,45,49,50,52,60,63,68,72,75,76,84,90,92,98,99,100,108,116,117,121,124,126,132,140,144,147,148,150,153,156,164,169,171,172,175,180,188,196,198,200,204,207,212,220,225,228,234,236,242]


  """
  @doc offset: 1,
       sequence: "Divisible exactly by the square of a prime.",
       references: [{:oeis, :a038109, "https://oeis.org/A038109"}]
  def create_sequence_a038109(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a038109/2)
  end

  @doc offset: 1
  def seq_a038109(_idx, last) do
    Math.next_number(
      fn candidate ->
        Math.prime_factor_exponents(candidate)
        |> Enum.filter(fn {_base, exp} -> exp == 2 end)
        |> length() > 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A039956` - Even squarefree numbers.

  From [OEIS A039956](https://oeis.org/A039956):

  > Even squarefree numbers.
  > (Formerly )

  **Sequence IDs**: `:a039956`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a039956) |> Sequence.take!(54)
      [2,6,10,14,22,26,30,34,38,42,46,58,62,66,70,74,78,82,86,94,102,106,110,114,118,122,130,134,138,142,146,154,158,166,170,174,178,182,186,190,194,202,206,210,214,218,222,226,230,238,246,254,258,262]

  """
  @doc offset: 1,
       sequence: "Even squarefree numbers.",
       references: [{:oeis, :a039956, "https://oeis.org/A039956"}]
  def create_sequence_a039956(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a039956/2)
  end

  @doc offset: 1
  def seq_a039956(_idx, last) do
    Math.next_number(
      fn c ->
        Predicates.is_squarefree?(c) && Integer.is_even(c)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A046099` - Numbers that are not cubefree. Numbers divisible by a cube greater than 1. Complement of A004709.

  From [OEIS A046099](https://oeis.org/A046099):

  > Numbers that are not cubefree. Numbers divisible by a cube greater than 1. Complement of A004709.
  > (Formerly )

  **Sequence IDs**: `:a046099`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046099) |> Sequence.take!(55)
      [8,16,24,27,32,40,48,54,56,64,72,80,81,88,96,104,108,112,120,125,128,135,136,144,152,160,162,168,176,184,189,192,200,208,216,224,232,240,243,248,250,256,264,270,272,280,288,296,297,304,312,320,324,328,336]


  """
  @doc offset: 1,
       sequence:
         "Numbers that are not cubefree. Numbers divisible by a cube greater than 1. Complement of A004709.",
       references: [{:oeis, :a046099, "https://oeis.org/A046099"}]
  def create_sequence_a046099(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046099/2)
  end

  @doc offset: 1
  def seq_a046099(_idx, last) do
    Math.next_number(
      fn candidate ->
        !Predicates.is_cubefree?(candidate)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A046306` - Numbers that are divisible by exactly 6 primes with multiplicity.

  From [OEIS A046306](https://oeis.org/A046306):

  > Numbers that are divisible by exactly 6 primes with multiplicity.

  **Sequence IDs**: `:a046306`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046306) |> Sequence.take!(49)
      [64,96,144,160,216,224,240,324,336,352,360,400,416,486,504,528,540,544,560,600,608,624,729,736,756,784,792,810,816,840,880,900,912,928,936,992,1000,1040,1104,1134,1176,1184,1188,1215,1224,1232,1260,1312,1320]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 6 primes with multiplicity.",
       references: [{:oeis, :a046306, "https://oeis.org/A046306"}]
  def create_sequence_a046306(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046306/2)
  end

  @doc offset: 1
  def seq_a046306(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 6 end, last)
  end

  @doc """
  OEIS Sequence `A046308` - Numbers that are divisible by exactly 7 primes counting multiplicity.

  From [OEIS A046308](https://oeis.org/A046308):

  > Numbers that are divisible by exactly 7 primes counting multiplicity.
  > (Formerly )

  **Sequence IDs**: `:a046308`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046308) |> Sequence.take!(44)
      [128,192,288,320,432,448,480,648,672,704,720,800,832,972,1008,1056,1080,1088,1120,1200,1216,1248,1458,1472,1512,1568,1584,1620,1632,1680,1760,1800,1824,1856,1872,1984,2000,2080,2187,2208,2268,2352,2368,2376]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 7 primes counting multiplicity.",
       references: [{:oeis, :a046308, "https://oeis.org/A046308"}]
  def create_sequence_a046308(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046308/2)
  end

  @doc offset: 1
  def seq_a046308(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 7 end, last)
  end

  @doc """
  OEIS Sequence `A046310` - Numbers that are divisible by exactly 8 primes counting multiplicity.

  From [OEIS A046310](https://oeis.org/A046310):

  > Numbers that are divisible by exactly 8 primes counting multiplicity.

  **Sequence IDs**: `:a046310`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046310) |> Sequence.take!(43)
      [256,384,576,640,864,896,960,1296,1344,1408,1440,1600,1664,1944,2016,2112,2160,2176,2240,2400,2432,2496,2916,2944,3024,3136,3168,3240,3264,3360,3520,3600,3648,3712,3744,3968,4000,4160,4374,4416,4536,4704,4736]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 8 primes counting multiplicity.",
       references: [{:oeis, :a046310, "https://oeis.org/A046310"}]
  def create_sequence_a046310(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046310/2)
  end

  @doc offset: 1, fill_value: 250
  def seq_a046310(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 8 end, last)
  end

  @doc """
  OEIS Sequence `A046312` - Numbers that are divisible by exactly 9 primes with multiplicity.

  From [OEIS A046312](https://oeis.org/A046312):

  > Numbers that are divisible by exactly 9 primes with multiplicity.

  **Sequence IDs**: `:a046312`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046312) |> Sequence.take!(42)
      [512,768,1152,1280,1728,1792,1920,2592,2688,2816,2880,3200,3328,3888,4032,4224,4320,4352,4480,4800,4864,4992,5832,5888,6048,6272,6336,6480,6528,6720,7040,7200,7296,7424,7488,7936,8000,8320,8748,8832,9072,9408]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 9 primes with multiplicity.",
       references: [{:oeis, :a046312, "https://oeis.org/A046312"}]
  def create_sequence_a046312(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046312/2)
  end

  @doc offset: 1
  def seq_a046312(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 9 end, last)
  end

  @doc """
  OEIS Sequence `A046314` - Numbers that are divisible by exactly 10 primes with multiplicity.

  From [OEIS A046314](https://oeis.org/A046314):

  > Numbers that are divisible by exactly 10 primes with multiplicity.

  **Sequence IDs**: `:a046314`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046314) |> Sequence.take!(38)
      [1024,1536,2304,2560,3456,3584,3840,5184,5376,5632,5760,6400,6656,7776,8064,8448,8640,8704,8960,9600,9728,9984,11664,11776,12096,12544,12672,12960,13056,13440,14080,14400,14592,14848,14976,15872,16000,16640]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 10 primes with multiplicity",
       references: [{:oeis, :a046314, "https://oeis.org/A046314"}]
  def create_sequence_a046314(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046314/2)
  end

  @doc offset: 1, fill_value: 1000
  def seq_a046314(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 10 end, last)
  end

  @doc """
  OEIS Sequence `A046321` - Odd numbers divisible by exactly 8 primes (counted with multiplicity).

  From [OEIS A046321](https://oeis.org/A046321):

  > Odd numbers divisible by exactly 8 primes (counted with multiplicity).

  **Sequence IDs**: `:a046321`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046321) |> Sequence.take!(33)
      [6561,10935,15309,18225,24057,25515,28431,30375,35721,37179,40095,41553,42525,47385,50301,50625,56133,59535,61965,63423,66339,66825,67797,69255,70875,78975,80919,83349,83835,84375,86751,88209,89667]


  """
  @doc offset: 1,
       sequence: "Odd numbers divisible by exactly 8 primes (counted with multiplicity).",
       references: [{:oeis, :a046321, "https://oeis.org/A046321"}]
  def create_sequence_a046321(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046321/2)
  end

  @doc offset: 1, fill_value: 6500
  def seq_a046321(_idx, last) do
    Math.next_number(
      fn candidate ->
        Math.bigomega(candidate) == 8 && Integer.is_odd(candidate)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A046386` - Products of four distinct primes.

  From [OEIS A046386](https://oeis.org/A046386):

  > Products of four distinct primes.
  > (Formerly )

  **Sequence IDs**: `:a046386`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046386) |> Sequence.take!(45)
      [210,330,390,462,510,546,570,690,714,770,798,858,870,910,930,966,1110,1122,1155,1190,1218,1230,1254,1290,1302,1326,1330,1365,1410,1430,1482,1518,1554,1590,1610,1722,1770,1785,1794,1806,1830,1870,1914,1938,1974]


  """
  @doc offset: 1,
       sequence: "Products of four distinct primes.",
       references: [{:oeis, :a046386, "https://oeis.org/A046386"}]
  def create_sequence_a046386(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046386/2)
  end

  @doc offset: 1
  def seq_a046386(_idx, last) do
    Math.next_number(
      fn candidate ->
        facs = Math.prime_factors(candidate) -- [1]
        length(facs) == 4 && length(Enum.uniq(facs)) == 4
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A046387` - Products of 5 distinct primes.

  From [OEIS A046387](https://oeis.org/A046387):

  > Products of 5 distinct primes.
  > (Formerly )

  **Sequence IDs**: `:a046387`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046387) |> Sequence.take!(38)
      [2310,2730,3570,3990,4290,4830,5610,6006,6090,6270,6510,6630,7410,7590,7770,7854,8610,8778,8970,9030,9282,9570,9690,9870,10010,10230,10374,10626,11130,11310,11730,12090,12210,12390,12558,12810,13090,13110]

  """
  @doc offset: 1,
       sequence: "Products of 5 distinct primes.",
       references: [{:oeis, :a046387, "https://oeis.org/A046387"}]
  def create_sequence_a046387(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046387/2)
  end

  @doc offset: 1
  def seq_a046387(_idx, last) do
    Math.next_number(
      fn candidate ->
        facs = Math.prime_factors(candidate) -- [1]
        length(facs) == 5 && length(Enum.uniq(facs)) == 5
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A046660` - Excess of n = number of prime divisors (with multiplicity) - number of prime divisors (without multiplicity).

  From [OEIS A046660](https://oeis.org/A046660):

  > Excess of n = number of prime divisors (with multiplicity) - number of prime divisors (without multiplicity).

  **Sequence IDs**: `:a046660`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046660) |> Sequence.take!(111)
      [0,0,0,1,0,0,0,2,1,0,0,1,0,0,0,3,0,1,0,1,0,0,0,2,1,0,2,1,0,0,0,4,0,0,0,2,0,0,0,2,0,0,0,1,1,0,0,3,1,1,0,1,0,2,0,2,0,0,0,1,0,0,1,5,0,0,0,1,0,0,0,3,0,0,1,1,0,0,0,3,3,0,0,1,0,0,0,2,0,1,0,1,0,0,0,4,0,1,1,2,0,0,0,2,0,0,0,3,0,0,0]

  """
  @doc offset: 1,
       sequence:
         "Excess of n = number of prime divisors (with multiplicity) - number of prime divisors (without multiplicity).",
       references: [{:oeis, :a046660, "https://oeis.org/A046660"}]
  def create_sequence_a046660(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046660/1)
  end

  @doc offset: 1
  def seq_a046660(idx) do
    Math.bigomega(idx) - Math.omega(idx)
  end

  @doc """
  OEIS Sequence `A048272` - Number of odd divisors of n minus number of even divisors of n.

  From [OEIS A048272](https://oeis.org/A048272):

  > Number of odd divisors of n minus number of even divisors of n.

  **Sequence IDs**: `:a048272`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a048272) |> Sequence.take!(93)
      [1,0,2,-1,2,0,2,-2,3,0,2,-2,2,0,4,-3,2,0,2,-2,4,0,2,-4,3,0,4,-2,2,0,2,-4,4,0,4,-3,2,0,4,-4,2,0,2,-2,6,0,2,-6,3,0,4,-2,2,0,4,-4,4,0,2,-4,2,0,6,-5,4,0,2,-2,4,0,2,-6,2,0,6,-2,4,0,2,-6,5,0,2,-4,4,0,4,-4,2,0,4,-2,4]

  """
  @doc offset: 1,
       sequence: "Number of odd divisors of n minus number of even divisors of n.",
       references: [{:oeis, :a048272, "https://oeis.org/A048272"}]
  def create_sequence_a048272(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a048272/1)
  end

  @doc offset: 1
  def seq_a048272(idx) do
    groups =
      Math.factors(idx)
      |> Enum.group_by(&Integer.is_even/1)

    evens = Map.get(groups, true, [])
    odds = Map.get(groups, false, [])
    length(odds) - length(evens)
  end

  @doc """
  OEIS Sequence `A051037` - 5-smooth Numbers

  From [OEIS A051037](https://oeis.org/A051037):

  > 5-smooth numbers, i.e., numbers whose prime divisors are all <= 5

  **Sequence IDs**: `:a051037`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a051037) |> Sequence.drop(20) |> Sequence.take!(20)
      [40, 45, 48, 50, 54, 60, 64, 72, 75, 80, 81, 90, 96, 100, 108, 120, 125, 128, 135, 144]

  """
  @doc offset: 1,
       sequence: "5-smooth numbers",
       references: [{:oeis, :a051037, "https://oeis.org/A051037"}]
  def create_sequence_a051037(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a051037/2)
  end

  @doc offset: 1
  def seq_a051037(_idx, last) do
    Math.next_number(&Predicates.is_5_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A051038` - 11-smooth Numbers

  From [OEIS A051038](https://oeis.org/A051038):

  > 11-smooth numbers: numbers whose prime divisors are all <= 11.
      
  **Sequence IDs**: `:a051038`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a051038) |> Sequence.drop(20) |> Sequence.take!(20)
      [25, 27, 28, 30, 32, 33, 35, 36, 40, 42, 44, 45, 48, 49, 50, 54, 55, 56, 60, 63]

  """
  @doc offset: 1,
       sequence: "11-smooth numbers",
       references: [{:oeis, :a051038, "https://oeis.org/A051038"}]
  def create_sequence_a051038(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a051038/2)
  end

  @doc offset: 1
  def seq_a051038(_idx, last) do
    Math.next_number(&Predicates.is_11_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A051270` - Numbers that are divisible by exactly 5 different primes.

  From [OEIS A051270](https://oeis.org/A051270):

  > Numbers that are divisible by exactly 5 different primes.

  **Sequence IDs**: `:a051270`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a051270) |> Sequence.take!(40)
      [2310,2730,3570,3990,4290,4620,4830,5460,5610,6006,6090,6270,6510,6630,6930,7140,7410,7590,7770,7854,7980,8190,8580,8610,8778,8970,9030,9240,9282,9570,9660,9690,9870,10010,10230,10374,10626,10710,10920,11130]

  """
  @doc offset: 1,
       sequence: "Numbers that are divisible by exactly 5 different primes",
       references: [{:oeis, :a051270, "https://oeis.org/A051270"}]
  def create_sequence_a051270(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a051270/2)
  end

  @doc offset: 1, fill_value: 2300
  def seq_a051270(_idx, last) do
    Math.next_number(
      fn candidate ->
        (Math.prime_factors(candidate) -- [1])
        |> Enum.uniq()
        |> length() == 5
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A052486` - Achilles numbers - powerful but imperfect

  From [OEIS A052486](https://oeis.org/A052486):

  > Achilles numbers - powerful but imperfect: if n = Product(p_i^e_i) then all e_i > 1 (i.e., powerful), but the highest common factor of the e_i is 1, i.e., not a perfect power.
      
  **Sequence IDs**: `:a052486`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a052486) |> Sequence.take!(20)
      [72, 108, 200, 288, 392, 432, 500, 648, 675, 800, 864, 968, 972, 1125, 1152, 1323, 1352, 1372, 1568, 1800]
  """
  @doc offset: 1,
       sequence: "Achilles numbers - powerful but imperfect",
       references: [
         {:oeis, :a052486, "https://oeis.org/A052486"},
         {:wikipedia, :achilles_number, "https://en.wikipedia.org/wiki/Achilles_number"}
       ]
  def create_sequence_a052486(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a052486/2)
  end

  def seq_a052486(_idx, last) do
    Math.next_number(&Predicates.is_achilles_number?/1, last)
  end

  @doc """
  OEIS Sequence `A056911` - Odd squarefree numbers.

  From [OEIS A056911](https://oeis.org/A056911):

  > Odd squarefree numbers.
  > (Formerly )

  **Sequence IDs**: `:a056911`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a056911) |> Sequence.take!(62)
      [1,3,5,7,11,13,15,17,19,21,23,29,31,33,35,37,39,41,43,47,51,53,55,57,59,61,65,67,69,71,73,77,79,83,85,87,89,91,93,95,97,101,103,105,107,109,111,113,115,119,123,127,129,131,133,137,139,141,143,145,149,151]


  """
  @doc offset: 1,
       sequence: "Odd squarefree numbers.",
       references: [{:oeis, :a056911, "https://oeis.org/A056911"}]
  def create_sequence_a056911(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a056911/2)
  end

  @doc offset: 1
  def seq_a056911(_idx, last) do
    Math.next_number(
      fn c ->
        Predicates.is_squarefree?(c) && Integer.is_odd(c)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A059269` - Numbers n for which the number of divisors, tau(n), is divisible by 3.

  From [OEIS A059269](https://oeis.org/A059269):

  > Numbers n for which the number of divisors, tau(n), is divisible by 3.
  > (Formerly )

  **Sequence IDs**: `:a059269`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a059269) |> Sequence.take!(59)
      [4,9,12,18,20,25,28,32,36,44,45,49,50,52,60,63,68,72,75,76,84,90,92,96,98,99,100,108,116,117,121,124,126,132,140,144,147,148,150,153,156,160,164,169,171,172,175,180,188,196,198,200,204,207,212,220,224,225,228]


  """
  @doc offset: 1,
       sequence: "Numbers n for which the number of divisors, tau(n), is divisible by 3.",
       references: [{:oeis, :a059269, "https://oeis.org/A059269"}]
  def create_sequence_a059269(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a059269/2)
  end

  @doc offset: 1
  def seq_a059269(_idx, last) do
    Math.next_number(
      fn candidate ->
        rem(Math.tau(candidate), 3) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A059376` - Jordan function J_3(n).

  From [OEIS A059376](https://oeis.org/A059376):

  > Jordan function J_3(n).
  > (Formerly )

  **Sequence IDs**: `:a059376`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a059376) |> Sequence.take!(39)
      [1,7,26,56,124,182,342,448,702,868,1330,1456,2196,2394,3224,3584,4912,4914,6858,6944,8892,9310,12166,11648,15500,15372,18954,19152,24388,22568,29790,28672,34580,34384,42408,39312,50652,48006,57096]


  """
  @doc offset: 1,
       sequence: "Jordan function J_3(n).",
       references: [{:oeis, :a059376, "https://oeis.org/A059376"}]
  def create_sequence_a059376(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a059376/1)
  end

  @doc offset: 1
  def seq_a059376(idx) do
    Math.jordan_totient(idx, 3)
  end

  @doc """
  OEIS Sequence `A059377` - Jordan function J_4(n).

  From [OEIS A059377](https://oeis.org/A059377):

  > Jordan function J_4(n).
  > (Formerly )

  **Sequence IDs**: `:a059377`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a059377) |> Sequence.take!(33)
      [1,15,80,240,624,1200,2400,3840,6480,9360,14640,19200,28560,36000,49920,61440,83520,97200,130320,149760,192000,219600,279840,307200,390000,428400,524880,576000,707280,748800,923520,983040,1171200]


  """
  @doc offset: 1,
       sequence: "Jordan function J_4(n).",
       references: [{:oeis, :a059377, "https://oeis.org/A059377"}]
  def create_sequence_a059377(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a059377/1)
  end

  @doc offset: 1
  def seq_a059377(idx) do
    Math.jordan_totient(idx, 4)
  end

  @doc """
  OEIS Sequence `A059378` - Jordan function J_5(n).

  From [OEIS A059378](https://oeis.org/A059378):

  > Jordan function J_5(n).
  > (Formerly )

  **Sequence IDs**: `:a059378`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a059378) |> Sequence.take!(29)
      [1,31,242,992,3124,7502,16806,31744,58806,96844,161050,240064,371292,520986,756008,1015808,1419856,1822986,2476098,3099008,4067052,4992550,6436342,7682048,9762500,11510052,14289858,16671552,20511148]


  """
  @doc offset: 1,
       sequence: "Jordan function J_5(n).",
       references: [{:oeis, :a059378, "https://oeis.org/A059378"}]
  def create_sequence_a059378(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a059378/1)
  end

  @doc offset: 1
  def seq_a059378(idx) do
    Math.jordan_totient(idx, 5)
  end

  @doc """
  OEIS Sequence `A065958` - a(n) = n^2*Product_{distinct primes p dividing n} (1+1/p^2).

  From [OEIS A065958](https://oeis.org/A065958):

  > a(n) = n^2*Product_{distinct primes p dividing n} (1+1/p^2).

  **Sequence IDs**: `:a065958`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a065958) |> Sequence.take!(47)
      [1,5,10,20,26,50,50,80,90,130,122,200,170,250,260,320,290,450,362,520,500,610,530,800,650,850,810,1000,842,1300,962,1280,1220,1450,1300,1800,1370,1810,1700,2080,1682,2500,1850,2440,2340,2650,2210]

  """
  @doc offset: 1,
       sequence: "a(n) = n^2*Product_{distinct primes p dividing n} (1+1/p^2).",
       references: [{:oeis, :a065958, "https://oeis.org/A065958"}]
  def create_sequence_a065958(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a065958/1)
  end

  @doc offset: 1
  def seq_a065958(idx) do
    div(Math.jordan_totient(idx, 4), Math.jordan_totient(idx, 2))
  end

  @doc """
  OEIS Sequence `A065959` - a(n) = n^3*Product_{distinct primes p dividing n} (1+1/p^3).

  From [OEIS A065959](https://oeis.org/A065959):

  > a(n) = n^3*Product_{distinct primes p dividing n} (1+1/p^3).
  > (Formerly )

  **Sequence IDs**: `:a065959`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a065959) |> Sequence.take!(39)
      [1,9,28,72,126,252,344,576,756,1134,1332,2016,2198,3096,3528,4608,4914,6804,6860,9072,9632,11988,12168,16128,15750,19782,20412,24768,24390,31752,29792,36864,37296,44226,43344,54432,50654,61740,61544]


  """
  @doc offset: 1,
       sequence: "a(n) = n^3*Product_{distinct primes p dividing n} (1+1/p^3).",
       references: [{:oeis, :a065959, "https://oeis.org/A065959"}]
  def create_sequence_a065959(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a065959/1)
  end

  @doc offset: 1
  def seq_a065959(idx) do
    div(Math.jordan_totient(idx, 6), Math.jordan_totient(idx, 3))
  end

  @doc """
  OEIS Sequence `A065960` - a(n) = n^4*Product_{distinct primes p dividing n} (1+1/p^4).

  From [OEIS A065960](https://oeis.org/A065960):

  > a(n) = n^4*Product_{distinct primes p dividing n} (1+1/p^4).

  **Sequence IDs**: `:a065960`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a065960) |> Sequence.take!(33)
      [1,17,82,272,626,1394,2402,4352,6642,10642,14642,22304,28562,40834,51332,69632,83522,112914,130322,170272,196964,248914,279842,356864,391250,485554,538002,653344,707282,872644,923522,1114112,1200644]

  """
  @doc offset: 1,
       sequence: "a(n) = n^4*Product_{distinct primes p dividing n} (1+1/p^4).",
       references: [{:oeis, :a065960, "https://oeis.org/A065960"}]
  def create_sequence_a065960(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a065960/1)
  end

  @doc offset: 1
  def seq_a065960(idx) do
    div(Math.jordan_totient(idx, 8), Math.jordan_totient(idx, 4))
  end

  @doc """
  OEIS Sequence `A067259` - Cubefree numbers which are not squarefree.

  From [OEIS A067259](https://oeis.org/A067259):

  > Cubefree numbers which are not squarefree.

  **Sequence IDs**: `:a067259`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a067259) |> Sequence.take!(51)
      [4,9,12,18,20,25,28,36,44,45,49,50,52,60,63,68,75,76,84,90,92,98,99,100,116,117,121,124,126,132,140,147,148,150,153,156,164,169,171,172,175,180,188,196,198,204,207,212,220,225,228]

  """
  @doc offset: 1,
       sequence: "Cubefree numbers which are not squarefree.",
       references: [{:oeis, :a067259, "https://oeis.org/A067259"}]
  def create_sequence_a067259(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a067259/2)
  end

  @doc offset: 1
  def seq_a067259(_idx, last) do
    Math.next_number(
      fn candidate ->
        Predicates.is_cubefree?(candidate) && !Predicates.is_squarefree?(candidate)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A067885` - Product of 6 distinct primes.

  From [OEIS A067885](https://oeis.org/A067885):

  > Product of 6 distinct primes.
  > (Formerly )

  **Sequence IDs**: `:a067885`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a067885) |> Sequence.take!(32)
      [30030,39270,43890,46410,51870,53130,62790,66990,67830,71610,72930,79170,81510,82110,84630,85470,91770,94710,98670,99330,101010,102102,103530,106590,108570,110670,111930,114114,115710,117390,122430,123690]


  """
  @doc offset: 1,
       sequence: "Product of 6 distinct primes.",
       references: [{:oeis, :a067885, "https://oeis.org/A067885"}]
  def create_sequence_a067885(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a067885/2)
  end

  @doc offset: 1, fill_value: 30_000
  def seq_a067885(_idx, last) do
    Math.next_number(
      fn candidate ->
        facs = Math.prime_factors(candidate) -- [1]
        length(facs) == 6 && length(Enum.uniq(facs)) == 6
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A069091` - Jordan function J_6(n).

  From [OEIS A069091](https://oeis.org/A069091):

  > Jordan function J_6(n).

  **Sequence IDs**: `:a069091`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a069091) |> Sequence.take!(27)
      [1,63,728,4032,15624,45864,117648,258048,530712,984312,1771560,2935296,4826808,7411824,11374272,16515072,24137568,33434856,47045880,62995968,85647744,111608280,148035888,187858944,244125000,304088904,386889048]

  """
  @doc offset: 1,
       sequence: "Jordan function J_6(n).",
       references: [{:oeis, :a069091, "https://oeis.org/A069091"}]
  def create_sequence_a069091(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069091/1)
  end

  @doc offset: 1
  def seq_a069091(idx) do
    Math.jordan_totient(idx, 6)
  end

  @doc """
  OEIS Sequence `A069092` - Jordan function J_7(n).

  From [OEIS A069092](https://oeis.org/A069092):

  > Jordan function J_7(n).

  **Sequence IDs**: `:a069092`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a069092) |> Sequence.take!(24)
      [1,127,2186,16256,78124,277622,823542,2080768,4780782,9921748,19487170,35535616,62748516,104589834,170779064,266338304,410338672,607159314,893871738,1269983744,1800262812,2474870590,3404825446,4548558848]

  """
  @doc offset: 1,
       sequence: "Jordan function J_7(n).",
       references: [{:oeis, :a069092, "https://oeis.org/A069092"}]
  def create_sequence_a069092(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069092/1)
  end

  @doc offset: 1
  def seq_a069092(idx) do
    Math.jordan_totient(idx, 7)
  end

  @doc """
  OEIS Sequence `A069093` - Jordan function J_8(n).

  From [OEIS A069093](https://oeis.org/A069093):

  > Jordan function J_8(n).

  **Sequence IDs**: `:a069093`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a069093) |> Sequence.take!(21)
      [1,255,6560,65280,390624,1672800,5764800,16711680,43040160,99609120,214358880,428236800,815730720,1470024000,2562493440,4278190080,6975757440,10975240800,16983563040,25499934720,37817088000]

  """
  @doc offset: 1,
       sequence: "Jordan function J_8(n).",
       references: [{:oeis, :a069093, "https://oeis.org/A069093"}]
  def create_sequence_a069093(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069093/1)
  end

  @doc offset: 1
  def seq_a069093(idx) do
    Math.jordan_totient(idx, 8)
  end

  @doc """
  OEIS Sequence `A069094` - Jordan function J_9(n).

  From [OEIS A069094](https://oeis.org/A069094):

  > Jordan function J_9(n).

  **Sequence IDs**: `:a069094`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a069094) |> Sequence.take!(20)
      [1,511,19682,261632,1953124,10057502,40353606,133955584,387400806,998046364,2357947690,5149441024,10604499372,20620692666,38441386568,68585259008,118587876496,197961811866,322687697778,510999738368]

  """
  @doc offset: 1,
       sequence: "Jordan function J_9(n).",
       references: [{:oeis, :a069094, "https://oeis.org/A069094"}]
  def create_sequence_a069094(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069094/1)
  end

  @doc offset: 1
  def seq_a069094(idx) do
    Math.jordan_totient(idx, 9)
  end

  @doc """
  OEIS Sequence `A069095` - Jordan function J_10(n).

  From [OEIS A069095](https://oeis.org/A069095):

  > Jordan function J_10(n).

  **Sequence IDs**: `:a069095`

  **Finite**: False

  **Offset**: 1 

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a069095) |> Sequence.take!(19)
      [1,1023,59048,1047552,9765624,60406104,282475248,1072693248,3486725352,9990233352,25937424600,61855850496,137858491848,288972178704,576640565952,1098437885952,2015993900448,3566920035096,6131066257800]


  """
  @doc offset: 1,
       sequence: "Jordan function J_10(n).",
       references: [{:oeis, :a069095, "https://oeis.org/A069095"}]
  def create_sequence_a069095(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069095/1)
  end

  @doc offset: 1
  def seq_a069095(idx) do
    Math.jordan_totient(idx, 10)
  end

  @doc """
  OEIS Sequence `A069272` - 11-almost primes (generalization of semiprimes).

  From [OEIS A069272](https://oeis.org/A069272):

  > 11-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069272`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069272) |> Sequence.take!(34)
      [2048,3072,4608,5120,6912,7168,7680,10368,10752,11264,11520,12800,13312,15552,16128,16896,17280,17408,17920,19200,19456,19968,23328,23552,24192,25088,25344,25920,26112,26880,28160,28800,29184,29696]

  """
  @doc offset: 1,
       sequence: "11-almost primes (generalization of semiprimes)",
       references: [{:oeis, :a069272, "https://oeis.org/A069272"}]
  def create_sequence_a069272(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069272/2)
  end

  @doc offset: 1, fill_value: 2000
  def seq_a069272(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 11 end, last)
  end

  @doc """
  OEIS Sequence `A069273` - 12-almost primes (generalization of semiprimes).

  From [OEIS A069273](https://oeis.org/A069273):

  > 12-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069273`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069273) |> Sequence.take!(34)
      [4096,6144,9216,10240,13824,14336,15360,20736,21504,22528,23040,25600,26624,31104,32256,33792,34560,34816,35840,38400,38912,39936,46656,47104,48384,50176,50688,51840,52224,53760,56320,57600,58368,59392]

  """
  @doc offset: 1,
       sequence: "12-almost primes (generalization of semiprimes).",
       references: [{:oeis, :a069273, "https://oeis.org/A069273"}]
  def create_sequence_a069273(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069273/2)
  end

  @doc offset: 1
  def seq_a069273(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 12 end, last)
  end

  @doc """
  OEIS Sequence `A069274` - 13-almost primes (generalization of semiprimes).

  From [OEIS A069274](https://oeis.org/A069274):

  > 13-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069274`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069274) |> Sequence.take!(32)
      [8192,12288,18432,20480,27648,28672,30720,41472,43008,45056,46080,51200,53248,62208,64512,67584,69120,69632,71680,76800,77824,79872,93312,94208,96768,100352,101376,103680,104448,107520,112640,115200]

  """
  @doc offset: 1,
       sequence: "13-almost primes (generalization of semiprimes).",
       references: [{:oeis, :a069274, "https://oeis.org/A069274"}]
  def create_sequence_a069274(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069274/2)
  end

  @doc offset: 1, fill_value: 8000
  def seq_a069274(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 13 end, last)
  end

  @doc """
  OEIS Sequence `A069275` - 14-almost primes (generalization of semiprimes).

  From [OEIS A069275](https://oeis.org/A069275):

  > 14-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069275`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069275) |> Sequence.take!(5)
      [16384,24576,36864,40960,55296]

  """
  @doc offset: 1,
       sequence: "14-almost primes (generalization of semiprimes)",
       references: [{:oeis, :a069275, "https://oeis.org/A069275"}]
  def create_sequence_a069275(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069275/2)
  end

  @doc offset: 1, fill_value: 16_000
  def seq_a069275(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 14 end, last)
  end

  @doc """
  OEIS Sequence `A069276` - 15-almost primes (generalization of semiprimes).

  From [OEIS A069276](https://oeis.org/A069276):

  > 15-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069276`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069276) |> Sequence.take!(5)
      [32768,49152,73728,81920,110592]

  """
  @doc offset: 1,
       sequence: "15-almost primes (generalization of semiprimes)",
       references: [{:oeis, :a069276, "https://oeis.org/A069276"}]
  def create_sequence_a069276(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069276/2)
  end

  @doc offset: 1, fill_value: 32_000
  def seq_a069276(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 15 end, last)
  end

  @doc """
  OEIS Sequence `A069277` - 16-almost primes (generalization of semiprimes).

  From [OEIS A069277](https://oeis.org/A069277):

  > 16-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069277`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069277) |> Sequence.take!(5)
      [65536,98304,147456,163840,221184]

  """
  @doc offset: 1,
       sequence: "16-almost primes (generalization of semiprimes)",
       references: [{:oeis, :a069277, "https://oeis.org/A069277"}]
  def create_sequence_a069277(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069277/2)
  end

  @doc offset: 1, fill_value: 65_000
  def seq_a069277(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 16 end, last)
  end

  @doc """
  OEIS Sequence `A069278` - 17-almost primes (generalization of semiprimes).

  From [OEIS A069278](https://oeis.org/A069278):

  > 17-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069278`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069278) |> Sequence.take!(3)
      [131072,196608,294912]


  """
  @doc offset: 1,
       sequence: "17-almost primes (generalization of semiprimes).",
       references: [{:oeis, :a069278, "https://oeis.org/A069278"}]
  def create_sequence_a069278(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069278/2)
  end

  @doc offset: 1, fill_value: 131_000
  def seq_a069278(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 17 end, last)
  end

  @doc """
  OEIS Sequence `A069279` - Products of exactly 18 primes (generalization of semiprimes).

  From [OEIS A069279](https://oeis.org/A069279):

  > Products of exactly 18 primes (generalization of semiprimes).

  **Sequence IDs**: `:a069279`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069279) |> Sequence.take!(2)
      [262144,393216]

  """
  @doc offset: 1,
       sequence: "Products of exactly 18 primes (generalization of semiprimes).",
       references: [{:oeis, :a069279, "https://oeis.org/A069279"}]
  def create_sequence_a069279(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069279/2)
  end

  @doc offset: 1, fill_value: 262_100
  def seq_a069279(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 18 end, last)
  end

  @doc """
  OEIS Sequence `A069280` - 19-almost primes (generalization of semiprimes).

  From [OEIS A069280](https://oeis.org/A069280):

  > 19-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069280`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069280) |> Sequence.take!(1)
      [524288]

  """
  @doc offset: 1,
       sequence: "19-almost primes (generalization of semiprimes).",
       references: [{:oeis, :a069280, "https://oeis.org/A069280"}]
  def create_sequence_a069280(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069280/2)
  end

  @doc offset: 1, fill_value: 524_000
  def seq_a069280(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 19 end, last)
  end

  @doc """
  OEIS Sequence `A069281` - 20-almost primes (generalization of semiprimes).

  From [OEIS A069281](https://oeis.org/A069281):

  > 20-almost primes (generalization of semiprimes).

  **Sequence IDs**: `:a069281`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a069281) |> Sequence.take!(1)
      [1048576]

  """
  @doc offset: 1,
       sequence: "20-almost primes (generalization of semiprimes).",
       references: [{:oeis, :a069281, "https://oeis.org/A069281"}]
  def create_sequence_a069281(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a069281/2)
  end

  @doc offset: 1
  def seq_a069281(_idx, last) do
    Math.next_number(fn candidate -> Math.bigomega(candidate) == 20 end, last)
  end

  @doc """
  OEIS Sequence `A074969` - Numbers with six distinct prime divisors.

  From [OEIS A074969](https://oeis.org/A074969):

  > Numbers with six distinct prime divisors.

  **Sequence IDs**: `:a074969`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a074969) |> Sequence.take!(32)
      [30030,39270,43890,46410,51870,53130,60060,62790,66990,67830,71610,72930,78540,79170,81510,82110,84630,85470,87780,90090,91770,92820,94710,98670,99330,101010,102102,103530,103740,106260,106590,108570]

  """
  @doc offset: 1,
       sequence: "Numbers with six distinct prime divisors.",
       references: [{:oeis, :a074969, "https://oeis.org/A074969"}]
  def create_sequence_a074969(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a074969/2)
  end

  @doc offset: 1, fill_value: 30_000
  def seq_a074969(_idx, last) do
    Math.next_number(
      fn candidate ->
        (Math.prime_factors(candidate) -- [1])
        |> Enum.uniq()
        |> length() == 6
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A076479` - a(n) = mu(rad(n)), where mu is the Moebius-function

  From [OEIS A076479](https://oeis.org/A076479):

  > a(n) = mu(rad(n)), where mu is the Moebius-function (A008683) and rad is the radical or squarefree kernel (A007947).

  **Sequence IDs**: `:a076479`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a076479) |> Sequence.take!(87)
      [1,-1,-1,-1,-1,1,-1,-1,-1,1,-1,1,-1,1,1,-1,-1,1,-1,1,1,1,-1,1,-1,1,-1,1,-1,-1,-1,-1,1,1,1,1,-1,1,1,1,-1,-1,-1,1,1,1,-1,1,-1,1,1,1,-1,1,1,1,1,1,-1,-1,-1,1,1,-1,1,-1,-1,1,1,-1,-1,1,-1,1,1,1,1,-1,-1,1,-1,1,-1,-1,1,1,1]

  """
  @doc offset: 1,
       sequence: "a(n) = mu(rad(n))",
       references: [{:oeis, :a076479, "https://oeis.org/A076479"}]
  def create_sequence_a076479(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a076479/1)
  end

  @doc offset: 1
  def seq_a076479(idx) do
    Math.mobius_function(Math.radical(idx))
  end

  @doc """
  OEIS Sequence `A080197` - 13-smooth Numbers

  From [OEIS A080197](https://oeis.org/A080197):

  > 13-smooth numbers: numbers whose prime divisors are all <= 13.
      
  **Sequence IDs**: `:a080197`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a080197) |> Sequence.drop(20) |> Sequence.take!(20)
      [24, 25, 26, 27, 28, 30, 32, 33, 35, 36, 39, 40, 42, 44, 45, 48, 49, 50, 52, 54]

  """
  @doc offset: 1,
       sequence: "13-smooth numbers",
       references: [{:oeis, :a080197, "https://oeis.org/A080197"}]
  def create_sequence_a080197(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a080197/2)
  end

  @doc offset: 1
  def seq_a080197(_idx, last) do
    Math.next_number(&Predicates.is_13_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A080681` - 17-smooth Numbers

  From [OEIS A080681](https://oeis.org/A080681):

  > 17-smooth numbers: numbers whose prime divisors are all <= 17.
      
  **Sequence IDs**: `:a080681`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a080681) |> Sequence.drop(20) |> Sequence.take!(20)
      [22, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 36, 39, 40, 42, 44, 45, 48, 49, 50]

  """
  @doc offset: 1,
       sequence: "17-smooth numbers",
       references: [{:oeis, :a080681, "https://oeis.org/A080681"}]
  def create_sequence_a080681(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a080681/2)
  end

  @doc offset: 1
  def seq_a080681(_idx, last) do
    Math.next_number(&Predicates.is_17_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A080682` - 19-smooth Numbers

  From [OEIS A080682](https://oeis.org/A080682):

  > 19-smooth numbers: numbers whose prime divisors are all <= 19.
      
  **Sequence IDs**: `:a080682`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a080682) |> Sequence.drop(20) |> Sequence.take!(20)
      [21, 22, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 36, 38, 39, 40, 42, 44, 45, 48]

  """
  @doc offset: 1,
       sequence: "19-smooth numbers",
       references: [{:oeis, :a080682, "https://oeis.org/A080682"}]
  def create_sequence_a080682(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a080682/2)
  end

  @doc offset: 1
  def seq_a080682(_idx, last) do
    Math.next_number(&Predicates.is_19_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A080683` - 23-smooth Numbers

  From [OEIS A080683](https://oeis.org/A080683):

  > 23-smooth numbers: numbers whose prime divisors are all <= 23.
      
  **Sequence IDs**: `:a080683`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Factors, :a080683) |> Sequence.drop(20) |> Sequence.take!(20)
      [21, 22, 23, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 36, 38, 39, 40, 42, 44, 45]

  """
  @doc offset: 1,
       sequence: "23-smooth numbers",
       references: [{:oeis, :a080683, "https://oeis.org/A080683"}]
  def create_sequence_a080683(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a080683/2)
  end

  @doc offset: 1
  def seq_a080683(_idx, last) do
    Math.next_number(&Predicates.is_23_smooth?/1, last)
  end

  @doc """
  OEIS Sequence `A117805` - Start with 3. Square the previous term and subtract it.

  From [OEIS A117805](https://oeis.org/A117805):

  > Start with 3. Square the previous term and subtract it.

  **Sequence IDs**: `:a117805`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a117805) |> Sequence.take!(9)
      [3,6,30,870,756030,571580604870,326704387862983487112030,106735757048926752040856495274871386126283608870,11392521832807516835658052968328096177131218666695418950023483907701862019030266123104859068030]


  """
  @doc offset: 0,
       sequence: "Start with 3. Square the previous term and subtract it.",
       references: [{:oeis, :a117805, "https://oeis.org/A117805"}]
  def create_sequence_a117805(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a117805/2)
  end

  @doc offset: 0
  def seq_a117805(idx, last) do
    if idx == 0 do
      3
    else
      last * last - last
    end
  end

  @doc """
  OEIS Sequence `A123321` - Products of 7 distinct primes (squarefree 7-almost primes).

  From [OEIS A123321](https://oeis.org/A123321):

  > Products of 7 distinct primes (squarefree 7-almost primes).

  **Sequence IDs**: `:a123321`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a123321) |> Sequence.take!(2)
      [510510,570570]

  """
  @doc offset: 1,
       sequence: "Products of 7 distinct primes (squarefree 7-almost primes)",
       references: [{:oeis, :a123321, "https://oeis.org/A123321"}]
  def create_sequence_a123321(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a123321/2)
  end

  @doc offset: 1, fill_value: 500_000
  def seq_a123321(_idx, last) do
    Math.next_number(
      fn candidate ->
        facs = Math.prime_factors(candidate) -- [1]
        length(facs) == 7 && length(Enum.uniq(facs)) == 7
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A123322` - Products of 8 distinct primes (squarefree 8-almost primes).

  From [OEIS A123322](https://oeis.org/A123322):

  > Products of 8 distinct primes (squarefree 8-almost primes).

  **Sequence IDs**: `:a123322`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a123322) |> Sequence.take!(1)
      [9699690]


  """
  @doc offset: 1,
       sequence: "Products of 8 distinct primes",
       references: [{:oeis, :a123322, "https://oeis.org/A123322"}]
  def create_sequence_a123322(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a123322/2)
  end

  @doc offset: 1, fill_value: 9_699_600
  def seq_a123322(_idx, last) do
    Math.next_number(
      fn candidate ->
        facs = Math.prime_factors(candidate) -- [1]
        length(facs) == 8 && length(Enum.uniq(facs)) == 8
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A130897` - Numbers that are not exponentially squarefree.

  From [OEIS A130897](https://oeis.org/A130897):

  > Numbers that are not exponentially squarefree.

  **Sequence IDs**: `:a130897`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a130897) |> Sequence.take!(43)
      [16,48,80,81,112,144,162,176,208,240,256,272,304,324,336,368,400,405,432,464,496,512,528,560,567,592,624,625,648,656,688,720,752,768,784,810,816,848,880,891,912,944,976]


  """
  @doc offset: 1,
       sequence: "Numbers that are not exponentially squarefree.",
       references: [{:oeis, :a130897, "https://oeis.org/A130897"}]
  def create_sequence_a130897(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a130897/2)
  end

  @doc offset: 1
  def seq_a130897(_idx, last) do
    Math.next_number(
      fn candidate ->
        # map out the exponents of prime factors
        Math.prime_factor_exponents(candidate)

        # filter to those that _are not_ square free
        |> Enum.filter(fn {_base, exp} -> !Predicates.is_squarefree?(exp) end)

        # if we have anything left, this number is not exponentially square free
        |> length() > 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A160889` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 4.

  From [OEIS A160889](https://oeis.org/A160889):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 4.

  **Sequence IDs**: `:a160889`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160889) |> Sequence.take!(49)
      [1,7,13,28,31,91,57,112,117,217,133,364,183,399,403,448,307,819,381,868,741,931,553,1456,775,1281,1053,1596,871,2821,993,1792,1729,2149,1767,3276,1407,2667,2379,3472,1723,5187,1893,3724,3627,3871,2257,5824,2793]

  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 4.",
       references: [{:oeis, :a160889, "https://oeis.org/A160889"}]
  def create_sequence_a160889(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160889/1)
  end

  @doc offset: 1
  def seq_a160889(idx) do
    div(Math.jordan_totient(idx, 3), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160891` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 5.

  From [OEIS A160891](https://oeis.org/A160891):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 5.

  **Sequence IDs**: `:a160891`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160891) |> Sequence.take!(39)
      [1,15,40,120,156,600,400,960,1080,2340,1464,4800,2380,6000,6240,7680,5220,16200,7240,18720,16000,21960,12720,38400,19500,35700,29160,48000,25260,93600,30784,61440,58560,78300,62400,129600,52060,108600,95200]


  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 5.",
       references: [{:oeis, :a160891, "https://oeis.org/A160891"}]
  def create_sequence_a160891(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160891/1)
  end

  @doc offset: 1
  def seq_a160891(idx) do
    div(Math.jordan_totient(idx, 4), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160893` - a(n) = Sum_{d|n} Möbius(n/d)*d^5/phi(n).

  From [OEIS A160893](https://oeis.org/A160893):

  > a(n) = Sum_{d|n} Möbius(n/d)*d^5/phi(n).

  **Sequence IDs**: `:a160893`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160893) |> Sequence.take!(33)
      [1,31,121,496,781,3751,2801,7936,9801,24211,16105,60016,30941,86831,94501,126976,88741,303831,137561,387376,338921,499255,292561,960256,488125,959171,793881,1389296,732541,2929531,954305,2031616,1948705]


  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Möbius(n/d)*d^5/phi(n)",
       references: [{:oeis, :a160893, "https://oeis.org/A160893"}]
  def create_sequence_a160893(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160893/1)
  end

  @doc offset: 1
  def seq_a160893(idx) do
    div(Math.jordan_totient(idx, 5), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160895` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 7.

  From [OEIS A160895](https://oeis.org/A160895):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 7.
  > (Formerly )

  **Sequence IDs**: `:a160895`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160895) |> Sequence.take!(30)
      [1,63,364,2016,3906,22932,19608,64512,88452,246078,177156,733824,402234,1235304,1421784,2064384,1508598,5572476,2613660,7874496,7137312,11160828,6728904,23482368,12206250,25340742,21493836,39529728,21243690,89572392]


  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 7.",
       references: [{:oeis, :a160895, "https://oeis.org/A160895"}]
  def create_sequence_a160895(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160895/1)
  end

  @doc offset: 1
  def seq_a160895(idx) do
    div(Math.jordan_totient(idx, 6), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160897` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 8.

  From [OEIS A160897](https://oeis.org/A160897):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 8.

  **Sequence IDs**: `:a160897`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160897) |> Sequence.take!(26)
      [1,127,1093,8128,19531,138811,137257,520192,796797,2480437,1948717,8883904,5229043,17431639,21347383,33292288,25646167,101193219,49659541,158747968,150021901,247487059,154764793,568569856,305171875,664088461]

  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 8.",
       references: [{:oeis, :a160897, "https://oeis.org/A160897"}]
  def create_sequence_a160897(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160897/1)
  end

  @doc offset: 1
  def seq_a160897(idx) do
    div(Math.jordan_totient(idx, 7), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160908` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 9.

  From [OEIS A160908](https://oeis.org/A160908):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 9.

  **Sequence IDs**: `:a160908`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160908) |> Sequence.take!(24)
      [1,255,3280,32640,97656,836400,960800,4177920,7173360,24902280,21435888,107059200,67977560,245004000,320311680,534773760,435984840,1829206800,943531280,3187491840,3151424000,5466151440,3559590240,13703577600]

  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 9.",
       references: [{:oeis, :a160908, "https://oeis.org/A160908"}]
  def create_sequence_a160908(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160908/1)
  end

  @doc offset: 1
  def seq_a160908(idx) do
    div(Math.jordan_totient(idx, 8), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160953` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 10.

  From [OEIS A160953](https://oeis.org/A160953):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 10.

  **Sequence IDs**: `:a160953`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160953) |> Sequence.take!(21)
      [1,511,9841,130816,488281,5028751,6725601,33488896,64566801,249511591,235794769,1287360256,883708281,3436782111,4805173321,8573157376,7411742281,32993635311,17927094321,63874967296,66186639441]

  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 10.",
       references: [{:oeis, :a160953, "https://oeis.org/A160953"}]
  def create_sequence_a160953(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160953/1)
  end

  @doc offset: 1
  def seq_a160953(idx) do
    div(Math.jordan_totient(idx, 9), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160957` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 11.

  From [OEIS A160957](https://oeis.org/A160957):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 11.

  **Sequence IDs**: `:a160957`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160957) |> Sequence.take!(20)
      [1,1023,29524,523776,2441406,30203052,47079208,268173312,581120892,2497558338,2593742460,15463962624,11488207654,48162029784,72080070744,137304735744,125999618778,594486672516,340614792100,1278749869056]

  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 11.",
       references: [{:oeis, :a160957, "https://oeis.org/A160957"}]
  def create_sequence_a160957(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160957/1)
  end

  @doc offset: 1
  def seq_a160957(idx) do
    div(Math.jordan_totient(idx, 10), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A160960` - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 12.

  From [OEIS A160960](https://oeis.org/A160960):

  > a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 12.

  **Sequence IDs**: `:a160960`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a160960) |> Sequence.take!(18)
      [1,2047,88573,2096128,12207031,181308931,329554457,2146435072,5230147077,24987792457,28531167061,185660345344,149346699503,674597973479,1081213356763,2197949513728,2141993519227,10706111066619]

  """
  @doc offset: 1,
       sequence: "a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 12.",
       references: [{:oeis, :a160960, "https://oeis.org/A160960"}]
  def create_sequence_a160960(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a160960/1)
  end

  @doc offset: 1
  def seq_a160960(idx) do
    div(Math.jordan_totient(idx, 11), Math.jordan_totient(idx, 1))
  end

  @doc """
  OEIS Sequence `A162643` - Numbers such that their number of divisors is not a power of 2.

  From [OEIS A162643](https://oeis.org/A162643):

  > Numbers such that their number of divisors is not a power of 2.

  **Sequence IDs**: `:a162643`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a162643) |> Sequence.take!(60)
      [4,9,12,16,18,20,25,28,32,36,44,45,48,49,50,52,60,63,64,68,72,75,76,80,81,84,90,92,96,98,99,100,108,112,116,117,121,124,126,132,140,144,147,148,150,153,156,160,162,164,169,171,172,175,176,180,188,192,196,198]

  """
  @doc offset: 1,
       sequence: "Numbers such that their number of divisors is not a power of 2.",
       references: [{:oeis, :a162643, "https://oeis.org/A162643"}]
  def create_sequence_a162643(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a162643/2)
  end

  @doc offset: 1
  def seq_a162643(_idx, last) do
    Math.next_number(
      fn candidate ->
        Math.factors(candidate)
        |> length()
        |> Math.is_power_of?(2) == false
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A165412` - Divisors of 2520.

  From [OEIS A165412](https://oeis.org/A165412):

  > Divisors of 2520.
  > (Formerly )

  **Sequence IDs**: `:a165412`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a165412) |> Sequence.take!(48)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,18,20,21,24,28,30,35,36,40,42,45,56,60,63,70,72,84,90,105,120,126,140,168,180,210,252,280,315,360,420,504,630,840,1260,2520]


  """
  @doc offset: 1,
       sequence: "Divisors of 2520.",
       references: [{:oeis, :a165412, "https://oeis.org/A165412"}]
  def create_sequence_a165412(_opts) do
    sequence_for_list(@data_a165412)
  end

  @doc """
  OEIS Sequence `A178858` - Divisors of 5040.

  From [OEIS A178858](https://oeis.org/A178858):

  > Divisors of 5040.
  > (Formerly )

  **Sequence IDs**: `:a178858`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178858) |> Sequence.take!(60)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,16,18,20,21,24,28,30,35,36,40,42,45,48,56,60,63,70,72,80,84,90,105,112,120,126,140,144,168,180,210,240,252,280,315,336,360,420,504,560,630,720,840,1008,1260,1680,2520,5040]


  """
  @doc offset: 1,
       sequence: "Divisors of 5040.",
       references: [{:oeis, :a178858, "https://oeis.org/A178858"}]
  def create_sequence_a178858(_opts) do
    sequence_for_list(@data_a178858)
  end

  @doc """
  OEIS Sequence `A178859` - Divisors of 7560.

  From [OEIS A178859](https://oeis.org/A178859):

  > Divisors of 7560.
  > (Formerly )

  **Sequence IDs**: `:a178859`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178859) |> Sequence.take!(61)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,18,20,21,24,27,28,30,35,36,40,42,45,54,56,60,63,70,72,84,90,105,108,120,126,135,140,168,180,189,210,216,252,270,280,315,360,378,420,504,540,630,756,840,945,1080,1260,1512,1890]


  """
  @doc offset: 1,
       sequence: "Divisors of 7560.",
       references: [{:oeis, :a178859, "https://oeis.org/A178859"}]
  def create_sequence_a178859(_opts) do
    sequence_for_list(@data_a178859)
  end

  @doc """
  OEIS Sequence `A178860` - Divisors of 10080.

  From [OEIS A178860](https://oeis.org/A178860):

  > Divisors of 10080.
  > (Formerly )

  **Sequence IDs**: `:a178860`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178860) |> Sequence.take!(63)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,16,18,20,21,24,28,30,32,35,36,40,42,45,48,56,60,63,70,72,80,84,90,96,105,112,120,126,140,144,160,168,180,210,224,240,252,280,288,315,336,360,420,480,504,560,630,672,720,840,1008]


  """
  @doc offset: 1,
       sequence: "Divisors of 10080.",
       references: [{:oeis, :a178860, "https://oeis.org/A178860"}]
  def create_sequence_a178860(_opts) do
    sequence_for_list(@data_a178860)
  end

  @doc """
  OEIS Sequence `A178861` - Divisors of 15120.

  From [OEIS A178861](https://oeis.org/A178861):

  > Divisors of 15120.
  > (Formerly )

  **Sequence IDs**: `:a178861`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178861) |> Sequence.take!(63)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,16,18,20,21,24,27,28,30,35,36,40,42,45,48,54,56,60,63,70,72,80,84,90,105,108,112,120,126,135,140,144,168,180,189,210,216,240,252,270,280,315,336,360,378,420,432,504,540,560,630]


  """
  @doc offset: 1,
       sequence: "Divisors of 15120.",
       references: [{:oeis, :a178861, "https://oeis.org/A178861"}]
  def create_sequence_a178861(_opts) do
    sequence_for_list(@data_a178861)
  end

  @doc """
  OEIS Sequence `A178862` - Divisors of 20160.

  From [OEIS A178862](https://oeis.org/A178862):

  > Divisors of 20160.
  > (Formerly )

  **Sequence IDs**: `:a178862`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178862) |> Sequence.take!(63)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,16,18,20,21,24,28,30,32,35,36,40,42,45,48,56,60,63,64,70,72,80,84,90,96,105,112,120,126,140,144,160,168,180,192,210,224,240,252,280,288,315,320,336,360,420,448,480,504,560,576]


  """
  @doc offset: 1,
       sequence: "Divisors of 20160.",
       references: [{:oeis, :a178862, "https://oeis.org/A178862"}]
  def create_sequence_a178862(_opts) do
    sequence_for_list(@data_a178862)
  end

  @doc """
  OEIS Sequence `A178863` - Divisors of 25200.

  From [OEIS A178863](https://oeis.org/A178863):

  > Divisors of 25200.
  > (Formerly )

  **Sequence IDs**: `:a178863`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178863) |> Sequence.take!(63)
      [1,2,3,4,5,6,7,8,9,10,12,14,15,16,18,20,21,24,25,28,30,35,36,40,42,45,48,50,56,60,63,70,72,75,80,84,90,100,105,112,120,126,140,144,150,168,175,180,200,210,225,240,252,280,300,315,336,350,360,400,420,450,504]


  """
  @doc offset: 1,
       sequence: "Divisors of 25200.",
       references: [{:oeis, :a178863, "https://oeis.org/A178863"}]
  def create_sequence_a178863(_opts) do
    sequence_for_list(@data_a178863)
  end

  @doc """
  OEIS Sequence `A178864` - Divisors of 27720.

  From [OEIS A178864](https://oeis.org/A178864):

  > Divisors of 27720.
  > (Formerly )

  **Sequence IDs**: `:a178864`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178864) |> Sequence.take!(64)
      [1,2,3,4,5,6,7,8,9,10,11,12,14,15,18,20,21,22,24,28,30,33,35,36,40,42,44,45,55,56,60,63,66,70,72,77,84,88,90,99,105,110,120,126,132,140,154,165,168,180,198,210,220,231,252,264,280,308,315,330,360,385,396,420]


  """
  @doc offset: 1,
       sequence: "Divisors of 27720.",
       references: [{:oeis, :a178864, "https://oeis.org/A178864"}]
  def create_sequence_a178864(_opts) do
    sequence_for_list(@data_a178864)
  end

  @doc """
  OEIS Sequence `A178877` - Divisors of 1260.

  From [OEIS A178877](https://oeis.org/A178877):

  > Divisors of 1260.
  > (Formerly )

  **Sequence IDs**: `:a178877`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178877) |> Sequence.take!(36)
      [1,2,3,4,5,6,7,9,10,12,14,15,18,20,21,28,30,35,36,42,45,60,63,70,84,90,105,126,140,180,210,252,315,420,630,1260]


  """
  @doc offset: 1,
       sequence: "Divisors of 1260.",
       references: [{:oeis, :a178877, "https://oeis.org/A178877"}]
  def create_sequence_a178877(_opts) do
    sequence_for_list(@data_a178877)
  end

  @doc """
  OEIS Sequence `A178878` - Divisors of 1680.

  From [OEIS A178878](https://oeis.org/A178878):

  > Divisors of 1680.
  > (Formerly )

  **Sequence IDs**: `:a178878`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a178878) |> Sequence.take!(40)
      [1,2,3,4,5,6,7,8,10,12,14,15,16,20,21,24,28,30,35,40,42,48,56,60,70,80,84,105,112,120,140,168,210,240,280,336,420,560,840,1680]


  """
  @doc offset: 1,
       sequence: "Divisors of 1680.",
       references: [{:oeis, :a178878, "https://oeis.org/A178878"}]
  def create_sequence_a178878(_opts) do
    sequence_for_list(@data_a178878)
  end

  @doc """
  OEIS Sequence `A209061` - Exponentially squarefree numbers.

  From [OEIS A209061](https://oeis.org/A209061):

  > Exponentially squarefree numbers.

  **Sequence IDs**: `:a209061`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a209061) |> Sequence.take!(67)
      [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69]


  """
  @doc offset: 1,
       sequence: "Exponentially squarefree numbers.",
       references: [{:oeis, :a209061, "https://oeis.org/A209061"}]
  def create_sequence_a209061(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a209061/2)
  end

  @doc offset: 1
  def seq_a209061(_idx, last) do
    Math.next_number(
      fn candidate ->
        # map out the exponents of prime factors
        Math.prime_factor_exponents(candidate)

        # filter to those that _are not_ square free
        |> Enum.filter(fn {_base, exp} -> !Predicates.is_squarefree?(exp) end)

        # if we have anything left, this number is not exponentially square free
        |> length() == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A211337` - Numbers n for which the number of divisors, tau(n), is congruent to 1 modulo 3.

  From [OEIS A211337](https://oeis.org/A211337):

  > Numbers n for which the number of divisors, tau(n), is congruent to 1 modulo 3.

  **Sequence IDs**: `:a211337`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a211337) |> Sequence.take!(59)
      [1,6,8,10,14,15,21,22,26,27,33,34,35,38,39,46,48,51,55,57,58,62,64,65,69,74,77,80,82,85,86,87,91,93,94,95,106,111,112,115,118,119,120,122,123,125,129,133,134,141,142,143,145,146,155,158,159,161,162]

  """
  @doc offset: 1,
       sequence:
         "Numbers n for which the number of divisors, tau(n), is congruent to 1 modulo 3.",
       references: [{:oeis, :a211337, "https://oeis.org/A211337"}]
  def create_sequence_a211337(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a211337/2)
  end

  @doc offset: 1
  def seq_a211337(_idx, last) do
    Math.next_number(fn candidate -> rem(Math.tau(candidate), 3) == 1 end, last)
  end

  @doc """
  OEIS Sequence `A211338` - Numbers n for which the number of divisors, tau(n), is congruent to 2 modulo 3.

  From [OEIS A211338](https://oeis.org/A211338):

  > Numbers n for which the number of divisors, tau(n), is congruent to 2 modulo 3.

  **Sequence IDs**: `:a211338`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a211338) |> Sequence.take!(60)
      [2,3,5,7,11,13,16,17,19,23,24,29,30,31,37,40,41,42,43,47,53,54,56,59,61,66,67,70,71,73,78,79,81,83,88,89,97,101,102,103,104,105,107,109,110,113,114,127,128,130,131,135,136,137,138,139,149,151,152,154]

  """
  @doc offset: 1,
       sequence:
         "Numbers n for which the number of divisors, tau(n), is congruent to 2 modulo 3.",
       references: [{:oeis, :a211338, "https://oeis.org/A211338"}]
  def create_sequence_a211338(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a211338/2)
  end

  @doc offset: 1
  def seq_a211338(_idx, last) do
    Math.next_number(fn candidate -> rem(Math.tau(candidate), 3) == 2 end, last)
  end
  
  @doc """
  OEIS Sequence `A046759` - Economical numbers: write n as a product of primes raised to powers, let D(n) = number of digits in product, l(n) = number of digits in n; sequence gives n such that D(n) < l(n).

  From [OEIS A046759](https://oeis.org/A046759):

  > Economical numbers: write n as a product of primes raised to powers, let D(n) = number of digits in product, l(n) = number of digits in n; sequence gives n such that D(n) < l(n).
  > (Formerly )

  **Sequence IDs**: `:a046759`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046759) |> Sequence.take!(41)
      [125,128,243,256,343,512,625,729,1024,1029,1215,1250,1280,1331,1369,1458,1536,1681,1701,1715,1792,1849,1875,2048,2187,2197,2209,2401,2560,2809,3125,3481,3584,3645,3721,4096,4374,4375,4489,4802,4913]


  """
  @doc offset: 1,
       sequence: "Economical numbers: write n as a product of primes raised to powers, let D(n) = number of digits in product, l(n) = number of digits in n; sequence gives n such that D(n) < l(n).",
       references: [{:oeis, :a046759, "https://oeis.org/A046759"}]
  def create_sequence_a046759(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046759/2)
  end


  @doc offset: 1
  def seq_a046759(_idx, last) do
      Math.next_number(&Predicates.is_economical_number?/1, last)
  end
  
  @doc """
  OEIS Sequence `A046760` - Wasteful numbers.

  From [OEIS A046760](https://oeis.org/A046760):

  > Wasteful numbers.
  > (Formerly )

  **Sequence IDs**: `:a046760`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046760) |> Sequence.take!(67)
      [4,6,8,9,12,18,20,22,24,26,28,30,33,34,36,38,39,40,42,44,45,46,48,50,51,52,54,55,56,57,58,60,62,63,65,66,68,69,70,72,74,75,76,77,78,80,82,84,85,86,87,88,90,91,92,93,94,95,96,98,99,100,102,104,108,110,114]


  """
  @doc offset: 1,
       sequence: "Wasteful numbers.",
       references: [{:oeis, :a046760, "https://oeis.org/A046760"}]
  def create_sequence_a046760(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046760/2)
  end


  @doc offset: 1
  def seq_a046760(_idx, last) do
      Math.next_number(&Predicates.is_wasteful_number?/1, last)
  end
  
  @doc """
  OEIS Sequence `A046758` - Equidigital numbers.

  From [OEIS A046758](https://oeis.org/A046758):

  > Equidigital numbers.
  > (Formerly )

  **Sequence IDs**: `:a046758`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Factors, :a046758) |> Sequence.take!(61)
      [1,2,3,5,7,10,11,13,14,15,16,17,19,21,23,25,27,29,31,32,35,37,41,43,47,49,53,59,61,64,67,71,73,79,81,83,89,97,101,103,105,106,107,109,111,112,113,115,118,119,121,122,123,127,129,131,133,134,135,137,139]


  """
  @doc offset: 1,
       sequence: "Equidigital numbers.",
       references: [{:oeis, :a046758, "https://oeis.org/A046758"}]
  def create_sequence_a046758(_opts) do
          sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Factors.seq_a046758/2)
  end


  @doc offset: 1, fill_value: 0
  def seq_a046758(_idx, last) do
      Math.next_number(&Predicates.is_equidigital_number?/1, last)
  end
end
