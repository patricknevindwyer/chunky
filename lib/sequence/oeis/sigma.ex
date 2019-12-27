defmodule Chunky.Sequence.OEIS.Sigma do
  @moduledoc """
  OEIS Sequences for Sigma values. 

  Some sigma sequences are in the `Sequence.OEIS.Core` module.

  ## Available Sequences

   - [A001158 - Sum of cubes of divisors of N, simga-3(n)](https://oeis.org/A001158) - `:a001158` - `create_sequence_a001158/1`
   - [A001159 - sum of 4th powers of divisors of n, simga-4(n)](https://oeis.org/A001159) - `a001159` - `create_sequence_a001159/1`
   - [A001160 - sum of 5th powers of divisors of n, simga-5(n)](https://oeis.org/A001160) - `a001160` - `create_sequence_a001160/1`
   - [A002093 - Highly Abundant Numbers](https://oeis.org/A002093) - `a002093` - `create_sequence_a002093/1`
   - [A003601 - Arithmetic Numbers](https://oeis.org/A003601) - `a003601` - `create_sequence_a003601/1`
   - [A013954 - sum of 6th powers of divisors of n, simga-6(n)](https://oeis.org/A013954) - `a013954` - `create_sequence_a013954/1`
   - [A013955 - sum of 7th powers of divisors of n, simga-7(n)](https://oeis.org/A013955) - `a013955` - `create_sequence_a013955/1`
   - [A013956 - sum of 8th powers of divisors of n, simga-8(n)](https://oeis.org/A013956) - `a013956` - `create_sequence_a013956/1`
   - [A013957 - sum of 9th powers of divisors of n, simga-9(n)](https://oeis.org/A013957) - `a013957` - `create_sequence_a013957/1`
   - [A013958 - sum of 10th powers of divisors of n, simga-10(n)](https://oeis.org/A013958) - `a013958` - `create_sequence_a013958/1`
   - [A013959 - sum of 11th powers of divisors of n, simga-11(n)](https://oeis.org/A013959) - `a013959` - `create_sequence_a013959/1`
   - [A013960 - sum of 12th powers of divisors of n, simga-12(n)](https://oeis.org/A013960) - `a013960` - `create_sequence_a013960/1`
   - [A013961 - sum of 13th powers of divisors of n, simga-13(n)](https://oeis.org/A013961) - `a013961` - `create_sequence_a013961/1`
   - [A013962 - sum of 14th powers of divisors of n, simga-14(n)](https://oeis.org/A013962) - `a013962` - `create_sequence_a013962/1`
   - [A013963 - sum of 15th powers of divisors of n, simga-15(n)](https://oeis.org/A013963) - `a013963` - `create_sequence_a013963/1`
   - [A013964 - sum of 16th powers of divisors of n, simga-16(n)](https://oeis.org/A013964) - `a013964` - `create_sequence_a013964/1`
   - [A013965 - sum of 17th powers of divisors of n, simga-17(n)](https://oeis.org/A013965) - `a013965` - `create_sequence_a013965/1`
   - [A013966 - sum of 18th powers of divisors of n, simga-18(n)](https://oeis.org/A013966) - `a013966` - `create_sequence_a013966/1`
   - [A013967 - sum of 19th powers of divisors of n, simga-19(n)](https://oeis.org/A013967) - `a013967` - `create_sequence_a013967/1`
   - [A013968 - sum of 20th powers of divisors of n, simga-20(n)](https://oeis.org/A013968) - `a013968` - `create_sequence_a013968/1`

  """
  import Chunky.Sequence, only: [sequence_for_function: 1]
  alias Chunky.Math

  @doc """
  OEIS Sequence `A001158` - Sum of cubes of divisors of N, simga-3(n), `𝝈3(n)`.

  From [OEIS A001158](https://oeis.org/A001158):

  > sigma_3(n): sum of cubes of divisors of n. 
  > (Formerly M4605 N1964)  

  **Sequence IDs**: `:a001158`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a001158) |> Sequence.take!(10)
      [1, 9, 28, 73, 126, 252, 344, 585, 757, 1134]

  """
  @doc offset: 1,
       sequence: "Sum of Cubes of Divisors of N",
       references: [{:oeis, :a001158, "https://oeis.org/A001158"}]
  def create_sequence_a001158(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a001158/1)
  end

  @doc offset: 1
  def seq_a001158(idx) do
    Math.sigma(idx, 3)
  end

  @doc """
  OEIS Sequence `A001159` - sum of 4th powers of divisors of n, simga-4(n), `𝝈4(n)`.

  From [OEIS A001159](https://oeis.org/A001159):

  > sigma_4(n): sum of 4th powers of divisors of n. 
  > (Formerly M5041 N2177)

  **Sequence IDs**: `:a001159`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a001159) |> Sequence.take!(10)
      [1, 17, 82, 273, 626, 1394, 2402, 4369, 6643, 10642]

  """
  @doc offset: 1,
       sequence: "Sum of 4th powers of Divisors of N",
       references: [{:oeis, :a001159, "https://oeis.org/A001159"}]
  def create_sequence_a001159(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a001159/1)
  end

  @doc offset: 1
  def seq_a001159(idx) do
    Math.sigma(idx, 4)
  end

  @doc """
  OEIS Sequence `A001160` - sum of 5th powers of divisors of n, simga-5(n), `𝝈5(n)`.

  From [OEIS A001160](https://oeis.org/A001160):

  > sigma_5(n): sum of 5th powers of divisors of n. 
  > (Formerly M5240 N2279)

  **Sequence IDs**: `:a001160`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a001160) |> Sequence.take!(10)
      [1, 33, 244, 1057, 3126, 8052, 16808, 33825, 59293, 103158]

  """
  @doc offset: 1,
       sequence: "Sum of 5th powers of Divisors of N",
       references: [{:oeis, :a001160, "https://oeis.org/A001160"}]
  def create_sequence_a001160(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a001160/1)
  end

  @doc offset: 1
  def seq_a001160(idx) do
    Math.sigma(idx, 5)
  end

  @doc """
  OEIS Sequence `A002093` - Highly Abundant Numbers

  From [OEIS A002093](https://oeis.org/A002093):

  > Highly abundant numbers: numbers n such that sigma(n) > sigma(m) for all m < n. 
  > (Formerly M0553 N0200)

  **Sequence IDs**: `:a002093`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a002093) |> Sequence.take!(25)
      [1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30, 36, 42, 48, 60, 72, 84, 90, 96, 108, 120, 144, 168]

  """
  @doc offset: 1,
       sequence: "Highly abundant numbers",
       references: [
         {:oeis, :a002093, "https://oeis.org/A002093"},
         {:wikipedia, :highly_abundant_number,
          "https://en.wikipedia.org/wiki/Highly_abundant_number"}
       ]
  def create_sequence_a002093(_opts) do
    %{
      next_fn: &seq_a002093/3,
      data: %{
        sigma_max: 0
      }
    }
  end

  def seq_a002093(:init, data, _value) do
    %{
      data: data,
      value: 0
    }
  end

  def seq_a002093(:next, data, value) do
    # find the next number after value that has a sigma greater than sigma max
    s_m = data.sigma_max
    s_n = seq_a002093_greater_sigma(s_m, value + 1)
    next_sigma_max = Math.sigma(s_n)

    {
      :continue,
      %{
        data: data |> Map.put(:sigma_max, next_sigma_max),
        value: s_n
      }
    }
  end

  defp seq_a002093_greater_sigma(sig_max, val) do
    if Math.sigma(val) > sig_max do
      val
    else
      seq_a002093_greater_sigma(sig_max, val + 1)
    end
  end

  @doc """
  OEIS Sequence `A003601` - Arithmetic Numbers

  From [OEIS A003601](https://oeis.org/A003601):

  > Numbers n such that the average of the divisors of n is an integer: sigma_0(n) divides sigma_1(n). Alternatively, tau(n) (A000005(n)) divides sigma(n) (A000203(n)). 
  > (Formerly M2389)

  **Sequence IDs**: `:a003601`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a003601) |> Sequence.take!(10)
      [1, 3, 5, 6, 7, 11, 13, 14, 15, 17]

  """
  @doc offset: 1,
       sequence: "Numbers n such that the average of the divisors of n is an integer",
       references: [{:oeis, :a003601, "https://oeis.org/A003601"}]
  def create_sequence_a003601(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a003601/2)
  end

  @doc offset: 1
  def seq_a003601(_idx, last) do
    next_seq_a003601(last)
  end

  defp next_seq_a003601(last) do
    if Math.is_arithmetic_number?(last + 1) do
      last + 1
    else
      next_seq_a003601(last + 1)
    end
  end

  @doc """
  OEIS Sequence `A013954` - sum of 6th powers of divisors of n, simga-6(n), `𝝈6(n)`.

  From [OEIS A013954](https://oeis.org/A013954):

  > sigma_6(n): sum of 6th powers of divisors of n. 

  **Sequence IDs**: `:a013954`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013954) |> Sequence.take!(10)
      [1, 65, 730, 4161, 15626, 47450, 117650, 266305, 532171, 1015690]

  """
  @doc offset: 1,
       sequence: "Sum of 6th powers of Divisors of N",
       references: [{:oeis, :a013954, "https://oeis.org/A013954"}]
  def create_sequence_a013954(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013954/1)
  end

  @doc offset: 1
  def seq_a013954(idx) do
    Math.sigma(idx, 6)
  end

  @doc """
  OEIS Sequence `A013955` - sum of 7th powers of divisors of n, simga-7(n), `𝝈7(n)`.

  From [OEIS A013955](https://oeis.org/A013955):

  > sigma_7(n): sum of 7th powers of divisors of n. 

  **Sequence IDs**: `:a013955`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013955) |> Sequence.take!(10)
      [1, 129, 2188, 16513, 78126, 282252, 823544, 2113665, 4785157, 10078254]

  """
  @doc offset: 1,
       sequence: "Sum of 7th powers of Divisors of N",
       references: [{:oeis, :a013955, "https://oeis.org/A013955"}]
  def create_sequence_a013955(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013955/1)
  end

  @doc offset: 1
  def seq_a013955(idx) do
    Math.sigma(idx, 7)
  end

  @doc """
  OEIS Sequence `A013956` - sum of 8th powers of divisors of n, simga-8(n), `𝝈8(n)`.

  From [OEIS A013956](https://oeis.org/A013956):

  > sigma_8(n): sum of 8th powers of divisors of n. 

  **Sequence IDs**: `:a013956`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013956) |> Sequence.take!(10)
      [1, 257, 6562, 65793, 390626, 1686434, 5764802, 16843009, 43053283, 100390882]

  """
  @doc offset: 1,
       sequence: "Sum of 8th powers of Divisors of N",
       references: [{:oeis, :a013956, "https://oeis.org/A013956"}]
  def create_sequence_a013956(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013956/1)
  end

  @doc offset: 1
  def seq_a013956(idx) do
    Math.sigma(idx, 8)
  end

  @doc """
  OEIS Sequence `A013957` - sum of 9th powers of divisors of n, simga-9(n), `𝝈9(n)`.

  From [OEIS A013957](https://oeis.org/A013957):

  > sigma_9(n): sum of 9th powers of divisors of n. 

  **Sequence IDs**: `:a013957`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013957) |> Sequence.take!(10)
      [1, 513, 19684, 262657, 1953126, 10097892, 40353608, 134480385, 387440173, 1001953638]

  """
  @doc offset: 1,
       sequence: "Sum of 9th powers of Divisors of N",
       references: [{:oeis, :a013957, "https://oeis.org/A013957"}]
  def create_sequence_a013957(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013957/1)
  end

  @doc offset: 1
  def seq_a013957(idx) do
    Math.sigma(idx, 9)
  end

  @doc """
  OEIS Sequence `A013958` - sum of 10th powers of divisors of n, simga-10(n), `𝝈10(n)`.

  From [OEIS A013958](https://oeis.org/A013958):

  > sigma_10(n): sum of 10th powers of divisors of n. 

  **Sequence IDs**: `:a013958`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013958) |> Sequence.take!(10)
      [1, 1025, 59050, 1049601, 9765626, 60526250, 282475250, 1074791425, 3486843451, 10009766650]

  """
  @doc offset: 1,
       sequence: "Sum of 10th powers of Divisors of N",
       references: [{:oeis, :a013958, "https://oeis.org/A013958"}]
  def create_sequence_a013958(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013958/1)
  end

  @doc offset: 1
  def seq_a013958(idx) do
    Math.sigma(idx, 10)
  end

  @doc """
  OEIS Sequence `A013959` - sum of 11th powers of divisors of n, simga-11(n), `𝝈11(n)`.

  From [OEIS A013959](https://oeis.org/A013959):

  > sigma_11(n): sum of 11th powers of divisors of n. 

  **Sequence IDs**: `:a013959`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013959) |> Sequence.take!(10)
      [1, 2049, 177148, 4196353, 48828126, 362976252, 1977326744, 8594130945, 31381236757, 100048830174]

  """
  @doc offset: 1,
       sequence: "Sum of 11th powers of Divisors of N",
       references: [{:oeis, :a013959, "https://oeis.org/A013959"}]
  def create_sequence_a013959(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013959/1)
  end

  @doc offset: 1
  def seq_a013959(idx) do
    Math.sigma(idx, 11)
  end

  @doc """
  OEIS Sequence `A013960` - sum of 12th powers of divisors of n, simga-12(n), `𝝈12(n)`.

  From [OEIS A013960](https://oeis.org/A013960):

  > sigma_12(n): sum of 12th powers of divisors of n. 

  **Sequence IDs**: `:a013960`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013960) |> Sequence.take!(10)
      [1, 4097, 531442, 16781313, 244140626, 2177317874, 13841287202, 68736258049, 282430067923, 1000244144722]

  """
  @doc offset: 1,
       sequence: "Sum of 12th powers of Divisors of N",
       references: [{:oeis, :a013960, "https://oeis.org/A013960"}]
  def create_sequence_a013960(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013960/1)
  end

  @doc offset: 1
  def seq_a013960(idx) do
    Math.sigma(idx, 12)
  end

  @doc """
  OEIS Sequence `A013961` - sum of 13th powers of divisors of n, simga-13(n), `𝝈13(n)`.

  From [OEIS A013961](https://oeis.org/A013961):

  > sigma_13(n): sum of 13th powers of divisors of n. 

  **Sequence IDs**: `:a013961`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013961) |> Sequence.take!(10)
      [1, 8193, 1594324, 67117057, 1220703126, 13062296532, 96889010408, 549822930945, 2541867422653, 10001220711318]

  """
  @doc offset: 1,
       sequence: "Sum of 13th powers of Divisors of N",
       references: [{:oeis, :a013961, "https://oeis.org/A013961"}]
  def create_sequence_a013961(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013961/1)
  end

  @doc offset: 1
  def seq_a013961(idx) do
    Math.sigma(idx, 13)
  end

  @doc """
  OEIS Sequence `A013962` - sum of 14th powers of divisors of n, simga-14(n), `𝝈14(n)`.

  From [OEIS A013962](https://oeis.org/A013962):

  > sigma_14(n): sum of 14th powers of divisors of n. 

  **Sequence IDs**: `:a013962`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013962) |> Sequence.take!(10)
      [1, 16385, 4782970, 268451841, 6103515626, 78368963450, 678223072850, 4398314962945, 22876797237931, 100006103532010]

  """
  @doc offset: 1,
       sequence: "Sum of 14th powers of Divisors of N",
       references: [{:oeis, :a013962, "https://oeis.org/A013962"}]
  def create_sequence_a013962(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013962/1)
  end

  @doc offset: 1
  def seq_a013962(idx) do
    Math.sigma(idx, 14)
  end

  @doc """
  OEIS Sequence `A013963` - sum of 15th powers of divisors of n, simga-15(n), `𝝈15(n)`.

  From [OEIS A013963](https://oeis.org/A013963):

  > sigma_15(n): sum of 15th powers of divisors of n. 

  **Sequence IDs**: `:a013963`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013963) |> Sequence.take!(10)
      [1, 32769, 14348908, 1073774593, 30517578126, 470199366252, 4747561509944, 35185445863425, 205891146443557, 1000030517610894]

  """
  @doc offset: 1,
       sequence: "Sum of 15th powers of Divisors of N",
       references: [{:oeis, :a013963, "https://oeis.org/A013963"}]
  def create_sequence_a013963(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013963/1)
  end

  @doc offset: 1
  def seq_a013963(idx) do
    Math.sigma(idx, 15)
  end

  @doc """
  OEIS Sequence `A013964` - sum of 16th powers of divisors of n, simga-16(n), `𝝈16(n)`.

  From [OEIS A013964](https://oeis.org/A013964):

  > sigma_16(n): sum of 16th powers of divisors of n. 

  **Sequence IDs**: `:a013964`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013964) |> Sequence.take!(10)
      [1, 65537, 43046722, 4295032833, 152587890626, 2821153019714, 33232930569602, 281479271743489, 1853020231898563, 10000152587956162]

  """
  @doc offset: 1,
       sequence: "Sum of 16th powers of Divisors of N",
       references: [{:oeis, :a013964, "https://oeis.org/A013964"}]
  def create_sequence_a013964(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013964/1)
  end

  @doc offset: 1
  def seq_a013964(idx) do
    Math.sigma(idx, 16)
  end

  @doc """
  OEIS Sequence `A013965` - sum of 17th powers of divisors of n, simga-17(n), `𝝈17(n)`.

  From [OEIS A013965](https://oeis.org/A013965):

  > sigma_17(n): sum of 17th powers of divisors of n. 

  **Sequence IDs**: `:a013965`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013965) |> Sequence.take!(10)
      [1, 131073, 129140164, 17180000257, 762939453126, 16926788715972, 232630513987208, 2251816993685505, 16677181828806733, 100000762939584198]

  """
  @doc offset: 1,
       sequence: "Sum of 17th powers of Divisors of N",
       references: [{:oeis, :a013965, "https://oeis.org/A013965"}]
  def create_sequence_a013965(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013965/1)
  end

  @doc offset: 1
  def seq_a013965(idx) do
    Math.sigma(idx, 17)
  end

  @doc """
  OEIS Sequence `A013966` - sum of 18th powers of divisors of n, simga-18(n), `𝝈18(n)`.

  From [OEIS A013966](https://oeis.org/A013966):

  > sigma_18(n): sum of 18th powers of divisors of n. 

  **Sequence IDs**: `:a013966`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013966) |> Sequence.take!(10)
      [1, 262145, 387420490, 68719738881, 3814697265626, 101560344351050, 1628413597910450, 18014467229220865, 150094635684419611, 1000003814697527770]

  """
  @doc offset: 1,
       sequence: "Sum of 18th powers of Divisors of N",
       references: [{:oeis, :a013966, "https://oeis.org/A013966"}]
  def create_sequence_a013966(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013966/1)
  end

  @doc offset: 1
  def seq_a013966(idx) do
    Math.sigma(idx, 18)
  end

  @doc """
  OEIS Sequence `A013967` - sum of 19th powers of divisors of n, simga-19(n), `𝝈19(n)`.

  From [OEIS A013967](https://oeis.org/A013967):

  > sigma_19(n): sum of 19th powers of divisors of n. 

  **Sequence IDs**: `:a013967`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013967) |> Sequence.take!(10)
      [1, 524289, 1162261468, 274878431233, 19073486328126, 609360902796252, 11398895185373144, 144115462954287105, 1350851718835253557, 10000019073486852414]

  """
  @doc offset: 1,
       sequence: "Sum of 19th powers of Divisors of N",
       references: [{:oeis, :a013967, "https://oeis.org/A013967"}]
  def create_sequence_a013967(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013967/1)
  end

  @doc offset: 1
  def seq_a013967(idx) do
    Math.sigma(idx, 19)
  end

  @doc """
  OEIS Sequence `A013968` - sum of 20th powers of divisors of n, simga-20(n), `𝝈20(n)`.

  From [OEIS A013968](https://oeis.org/A013968):

  > sigma_20(n): sum of 20th powers of divisors of n. 

  **Sequence IDs**: `:a013968`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Sequence.OEIS.Sigma, :a013968) |> Sequence.take!(10)
      [1, 1048577, 3486784402, 1099512676353, 95367431640626, 3656161927895954, 79792266297612002, 1152922604119523329, 12157665462543713203, 100000095367432689202]

  """
  @doc offset: 1,
       sequence: "Sum of 20th powers of Divisors of N",
       references: [{:oeis, :a013968, "https://oeis.org/A013968"}]
  def create_sequence_a013968(_opts) do
    sequence_for_function(&Chunky.Sequence.OEIS.Sigma.seq_a013968/1)
  end

  @doc offset: 1
  def seq_a013968(idx) do
    Math.sigma(idx, 20)
  end
end
