defmodule Chunky.Math do
    @moduledoc """
    Extended integer and float mathematical functions and operations.
    
    ## Modular Arithmetic
    
     - `pow/3` - Integer power in modular exponentiation
    
    ## Integer Arithmetic
    
     - `is_prime?/1` - Test if an integer is prime
     - `prime_factors/1` - Factorize an integer into prime factors
    
    """
    
    require Integer
    alias Chunky.Math
    
    @rand_max Kernel.trunc(:math.pow(2, 63))
    
    @doc """
    Decompose an integer to prime factors.
    
    This is not an exhaustive factorization, but a reduction to all
    prime factors for an integer. 
    
    ## Examples
    
        iex> Math.prime_factors(12)
        [1, 2, 2, 3]
    
        iex> Math.prime_factors(101)
        [1, 101]
        
        iex> Math.prime_factors(79170)
        [1, 2, 3, 5, 7, 13, 29]
    
        iex> Math.prime_factors(233*444*727*456)
        [1, 2, 2, 2, 2, 2, 3, 3, 19, 37, 233, 727]
    

    """
    def prime_factors(1), do: [1]
    def prime_factors(n) when is_integer(n) and n > 1, do: decomposition(n, 2, [1])
    
    #
    # prime decomposition via trial division Adapted from Rosetta Code
    #   http://rosettacode.org/wiki/Prime_decomposition#Elixir
    #
    defp decomposition(n, k, acc) when n < k*k, do: Enum.reverse(acc, [n])
    defp decomposition(n, k, acc) when rem(n, k) == 0, do: decomposition(div(n, k), k, [k | acc])
    defp decomposition(n, k, acc), do: decomposition(n, k+1, acc)
    
    @doc """
    Determine if a positive integer is prime.
    
    This function uses a [Miller-Rabin](https://en.wikipedia.org/wiki/Miller–Rabin_primality_test) primality 
    test, with 40 iterations.
    
    ## Examples
    
        iex> Math.is_prime?(13)
        true
        
        iex> Math.is_prime?(233*444*727*456)
        false
    
        iex> Math.is_prime?(30762542250301270692051460539586166927291732754961)
        true
    """
    def is_prime?(i) when is_integer(i) and i < 2, do: false
    def is_prime?(i) when is_integer(i) and i > 2 and Integer.is_even(i), do: false
    def is_prime?(i) when is_integer(i) do
        case i do
            2 -> true
            3 -> true
            _ ->  miller_rabin?(i, 40)
        end
    end
    
    @doc """
    Integer power/exponentiation in Modular Arithmetic.
    
    ## Examples
    
        iex> Math.pow(5, 3, 13)
        8
        
        iex> Math.pow(67930, 32319, 103969)
        6582
    
    """
    def pow(x, y, mod) when is_integer(x) and is_integer(y) and is_integer(mod) do
       :crypto.mod_pow(x, y, mod) |> :binary.decode_unsigned()
    end
    
    #
    # Miller-Rabin primality test adapted from Rosetta Code:
    #   https://rosettacode.org/wiki/Miller–Rabin_primality_test#Elixir
    #
    defp miller_rabin?( n, g ) do
         { s, d } = miller_rabin( n - 1, 0 )
         miller_rabin( n, g, s, d )
    end
 
    defp miller_rabin( d, s ) when rem( d, 2 ) == 0, do: { s, d }
    defp miller_rabin( d, s ), do: miller_rabin( div( d, 2 ), s + 1 )
  
    defp miller_rabin( _n, 0, _, _ ), do: true
    defp miller_rabin( n, g, s, d ) do
        a = if n > @rand_max do
            1 + :rand.uniform(@rand_max - 3)
        else
            1 + :rand.uniform( n - 3 )
        end
      x = Math.pow( a, d, n )
      if x == 1 or x == n - 1 do
        miller_rabin( n, g - 1, s, d )
      else
        if miller_rabin( n, x, s - 1) == true, do: miller_rabin( n, g - 1, s, d ), else: false
      end
    end
 
    defp miller_rabin( _n, _x, r ) when r <= 0, do: false
    defp miller_rabin( n, x, r ) do
      x = Math.pow( x, 2, n )
      unless x == 1 do
        unless x == n - 1, do: miller_rabin( n, x, r - 1 ), else: true
      else
        false
      end
    end
end