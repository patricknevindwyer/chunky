defmodule Chunky.Sequence.OEIS.Factors do
  @moduledoc """
  OEIS Sequences dealing with Factors, Factorization, and properties of integer factors. 

  ## Available Sequences

   - [A001597 - Perfect Powers](https://oeis.org/A001597) - `:a001597` - `create_sequence_a001597/1`
   - [A001694 - Powerful Numbers](https://oeis.org/A001694) - `:a001694` - `create_sequence_a001694/1`
   - [A002182 - Highly composite numbers: numbers with record value](https://oeis.org/A002182) - `:a002182` - `create_sequence_a002182/1`
   - [A002473 - 7-smooth Numbers](https://oeis.org/A002473) - `:a002473` - `create_sequence_a03586/1`
   - [A003586 - 3-smooth Numbers](https://oeis.org/A003586) - `:a003586` - `create_sequence_a03586/1`
   - [A005361 - Product of Expoenents of prime factors of N](https://oeis.org/A005361) - `:a005361` - `create_sequence_a005361/1`
   - [A005934 - Highly powerful numbers: numbers with record value](https://oeis.org/A005934) - `:a005934` - `create_sequence_a005934/1`
   - [A007434 - Jordan function J_2(n)](https://oeis.org/A007434) - `:a007434` - `create_sequence_a007434/1`
   - [A051037 - 5-smooth Numbers](https://oeis.org/A051037) - `:a051037` - `create_sequence_a03586/1`
   - [A051038 - 11-smooth Numbers](https://oeis.org/A051038) - `:a051038` - `create_sequence_a03586/1`
   - [A052486 - Achilles numbers - powerful but imperfect](https://oeis.org/A052486) - `:a052486` - `create_sequence_a052486/1`
   - [A059376 - Jordan function J_3(n)](https://oeis.org/A059376) - `:a059376` - `create_sequence_a059376/1`
   - [A059377 - Jordan function J_4(n)](https://oeis.org/A059377) - `:a059377` - `create_sequence_a059377/1`
   - [A059378 - Jordan function J_5(n)](https://oeis.org/A059378) - `:a059378` - `create_sequence_a059378/1`
   - [A065958 - a(n) = n^2*Product_{distinct primes p dividing n} (1+1/p^2)](https://oeis.org/A065958) - `:a065958` - `create_sequence_a065958/1`
   - [A065959 - a(n) = n^3*Product_{distinct primes p dividing n} (1+1/p^3)](https://oeis.org/A065959) - `:a065959` - `create_sequence_a065959/1`
   - [A065960 - a(n) = n^4*Product_{distinct primes p dividing n} (1+1/p^4)](https://oeis.org/A065960) - `:a065960` - `create_sequence_a065960/1`
   - [A069091 - Jordan function J_6(n)](https://oeis.org/A069091) - `:a069091` - `create_sequence_a069091/1`
   - [A069092 - Jordan function J_7(n)](https://oeis.org/A069092) - `:a069092` - `create_sequence_a069092/1`
   - [A069093 - Jordan function J_8(n)](https://oeis.org/A069093) - `:a069093` - `create_sequence_a069093/1`
   - [A069094 - Jordan function J_9(n)](https://oeis.org/A069094) - `:a069094` - `create_sequence_a069094/1`
   - [A069095 - Jordan function J_10(n)](https://oeis.org/A069095) - `:a069095` - `create_sequence_a069095/1`
   - [A080197 - 13-smooth Numbers](https://oeis.org/A080197) - `:a080197` - `create_sequence_a03586/1`
   - [A080681 - 17-smooth Numbers](https://oeis.org/A080681) - `:a080681` - `create_sequence_a03586/1`
   - [A080682 - 29-smooth Numbers](https://oeis.org/A080682) - `:a080682` - `create_sequence_a03586/1`
   - [A080683 - 23-smooth Numbers](https://oeis.org/A080683) - `:a080683` - `create_sequence_a03586/1`
   - [A160889 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 4](https://oeis.org/A160889) - `:a160889` - `create_sequence_a160889/1`
   - [A160891 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 5](https://oeis.org/A160891) - `:a160891` - `create_sequence_a160891/1`
   - [A160893 - a(n) = Sum_{d|n} Möbius(n/d)*d^5/phi(n)](https://oeis.org/A160893) - `:a160893` - `create_sequence_a160893/1`
   - [A160895 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 7](https://oeis.org/A160895) - `:a160895` - `create_sequence_a160895/1`
   - [A160897 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 8](https://oeis.org/A160897) - `:a160897` - `create_sequence_a160897/1`
   - [A160908 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 9](https://oeis.org/A160908) - `:a160908` - `create_sequence_a160908/1`
   - [A160953 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 10](https://oeis.org/A160953) - `:a160953` - `create_sequence_a160953/1`
   - [A160957 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 11](https://oeis.org/A160957) - `:a160957` - `create_sequence_a160957/1`
   - [A160960 - a(n) = Sum_{d|n} Moebius(n/d)*d^(b-1)/phi(n) for b = 12](https://oeis.org/A160960) - `:a160960` - `create_sequence_a160960/1`



  """
  import Chunky.Sequence, only: [sequence_for_function: 1]
  alias Chunky.Math

  require Integer

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
    Math.next_number(&Math.is_perfect_power?/1, last)
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
    Math.next_number(&Math.is_powerful_number?/1, last)
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
    Math.next_number(&Math.is_7_smooth?/1, last)
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
    Math.next_number(&Math.is_3_smooth?/1, last)
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
    Math.next_number(&Math.is_5_smooth?/1, last)
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
    Math.next_number(&Math.is_11_smooth?/1, last)
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
    Math.next_number(&Math.is_achilles_number?/1, last)
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
    Math.next_number(&Math.is_13_smooth?/1, last)
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
    Math.next_number(&Math.is_17_smooth?/1, last)
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
    Math.next_number(&Math.is_19_smooth?/1, last)
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
    Math.next_number(&Math.is_23_smooth?/1, last)
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
end
