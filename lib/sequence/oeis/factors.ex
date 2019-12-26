defmodule Chunky.Sequence.OEIS.Factors do
  @moduledoc """
  OEIS Sequences dealing with Factors, Factorization, and properties of integer factors. 

  ## Available Sequences

   - [A001597 - Perfect Powers](https://oeis.org/A001597) - `:a001597` - `create_sequence_a001597/1`
   - [A001694 - Powerful Numbers](https://oeis.org/A001694) - `:a001694` - `create_sequence_a001694/1`
   - [A005361 - Product of Expoenents of prime factors of N](https://oeis.org/A005361) - `:a005361` - `create_sequence_a005361/1`
   - [A005934 - Highly powerful numbers: numbers with record value](https://oeis.org/A005934) - `:a005934` - `create_sequence_a005934/1`
   - [A052486 - Achilles numbers - powerful but imperfect](https://oeis.org/A052486) - `:a052486` - `create_sequence_a052486/1`
  
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
  @doc offset: 1, sequence: "Perfect Powers", references: [{:oeis, :a001597, "https://oeis.org/A001597"}]
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
  @doc offset: 1, sequence: "Powerful numbers", references: [{:oeis, :a001694, "https://oeis.org/A001694"}]
  def create_sequence_a001694(_opts) do
      sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a001694/2)
  end
  
  @doc offset: 1
  def seq_a001694(_idx, last) do
      Math.next_number(&Math.is_powerful_number?/1, last)
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
  @doc offset: 1, sequence: "Product of exponents of prime factorization of N", references: [{:oeis, :a005361, "https://oeis.org/A005361"}]
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
  @doc offset: 1, sequence: "Highly powerful numbers: numbers with record value", references: [{:oeis, :a005934, "https://oeis.org/A005934"}, {:wikipedia, :highly_powerful_number, "https://en.wikipedia.org/wiki/Highly_powerful_number"}]
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
  @doc offset: 1, sequence: "Achilles numbers - powerful but imperfect", references: [{:oeis, :a052486, "https://oeis.org/A052486"}, {:wikipedia, :achilles_number, "https://en.wikipedia.org/wiki/Achilles_number"}]
  def create_sequence_a052486(_opts) do
      sequence_for_function(&Chunky.Sequence.OEIS.Factors.seq_a052486/2)
  end
  
  def seq_a052486(_idx, last) do
      Math.next_number(&Math.is_achilles_number?/1, last)
  end
end