defmodule Chunky.Fraction do
   @moduledoc """
   Functions for creating and manipulating fractions.
   
   """ 
   
   defstruct [:num, :den]
   
   alias Chunky.Fraction
   
   @doc """
   Create a new fraction from two integers.
   
   Integers are stored as component numerator and denominator parts, and are only 
   simplified when explicity told to. Fractions representing a negative number will
   always carry the negative sign on the numerator.
   
   While a denominator with a zero value is undefined, a `0` numerator is acceptable,
   and will be manipulated normally.
   
   ## Examples
   
       iex> Fraction.new(1, 3)
       %Fraction{num: 1, den: 3}
   
       iex> Fraction.new(22, -7)
       %Fraction{num: -22, den: 7}
   
       iex> Fraction.new(17, 0)
       {:error, :invalid_denominator}
   
       iex> Fraction.new(0, 37)
       %Fraction{num: 0, den: 37}
   """
   def new(num, den) when is_integer(num) and is_integer(den) do
       
       cond do
           den == 0 -> {:error, :invalid_denominator}
           num == 0 && den != 0 -> %Fraction{num: 0, den: abs(den)}
           num > 0 && den < 0 -> %Fraction{num: num * -1, den: abs(den)}
           num < 0 && den > 0 -> %Fraction{num: num, den: den}
           num < 0 && den < 0 -> %Fraction{num: abs(num), den: abs(den)}
           true -> %Fraction{num: num, den: den}
       end
       
   end
   
   @doc """
   Create a fraction from a tuple of a numerator and denominator.
   
   ## Examples
   
       iex> Fraction.new({4, 5})
       %Fraction{num: 4, den: 5}
   
   """
   def new({num, den}) when is_integer(num) and is_integer(den), do: new(num, den)
   
   @doc """
   Create a whole number fraction from an integer.
   
   ## Examples
   
       iex> Fraction.new(4)
       %Fraction{num: 4, den: 1}
   
       iex> Fraction.new(-22)
       %Fraction{num: -22, den: 1}
   """
   def new(int) when is_integer(int), do: new(int, 1)
   
   @doc """
   Add two fractions, or a fraction and an integer, and return the (optionally simplified) result.
   
   ## Examples
   
       iex> Fraction.add(Fraction.new(1, 2), Fraction.new(-8, 3))
       %Fraction{num: -13, den: 6}
   
       iex> Fraction.add(Fraction.new(3, 4), Fraction.new(3, 4), simplify: true)
       %Fraction{num: 3, den: 2}
   
       iex> Fraction.add(Fraction.new(1, 3), 5)
       %Fraction{num: 16, den: 3}
       
       iex> Fraction.add(2, Fraction.new(5, 4))
       %Fraction{num: 13, den: 4}
   
   """
   def add(a, b, opts \\ [])
   def add(%Fraction{}=fraction_a, %Fraction{}=fraction_b, opts) do
       
       simp = opts |> Keyword.get(:simplify, false)
       
       new_base = lcm(fraction_a.den, fraction_b.den)
       a_mult = div(new_base, fraction_a.den)
       b_mult = div(new_base, fraction_b.den)
       
       if simp do
           Fraction.new((fraction_a.num * a_mult) + (fraction_b.num * b_mult), new_base) |> simplify()
       else
           Fraction.new((fraction_a.num * a_mult) + (fraction_b.num * b_mult), new_base)
       end
   end   
   
   def add(%Fraction{}=fraction_a, int, opts) when is_integer(int), do: add(fraction_a, Fraction.new(int, 1), opts)
  
   def add(int, %Fraction{}=fraction_b, opts) when is_integer(int), do: add(Fraction.new(int, 1), fraction_b, opts)
   
   @doc """
   Subtract two fractions, or a fraction an an integer, and return the (optionally) simplified result.
   
   ## Examples

       iex> Fraction.subtract(Fraction.new(3, 5), Fraction.new(1, 5))
       %Fraction{num: 2, den: 5}
   
       iex> Fraction.subtract(2, Fraction.new(-6, 9), simplify: true)
       %Fraction{num: 8, den: 3}
   
       iex> Fraction.subtract(Fraction.new(-2, 4), -5, simplify: true)
       %Fraction{num: 9, den: 2}
   """
   def subtract(a, b, opts \\ [])
   def subtract(%Fraction{}=fraction_a, %Fraction{}=fraction_b, opts) do
       simp = opts |> Keyword.get(:simplify, false)
       
       new_base = lcm(fraction_a.den, fraction_b.den)
       a_mult = div(new_base, fraction_a.den)
       b_mult = div(new_base, fraction_b.den)
       
       if simp do
           Fraction.new( (fraction_a.num * a_mult) - (fraction_b.num * b_mult), new_base) |> simplify()
       else
           Fraction.new( (fraction_a.num * a_mult) - (fraction_b.num * b_mult), new_base)
       end
   end
   
   def subtract(%Fraction{}=fraction_a, int, opts) when is_integer(int), do: subtract(fraction_a, Fraction.new(int, 1), opts)
   def subtract(int, %Fraction{}=fraction_b, opts) when is_integer(int), do: subtract(Fraction.new(int, 1), fraction_b, opts)
   
   @doc """
   Extract the numerator and denominator of a fraction as a tuple of values.
   
   ## Examples
   
       iex> Fraction.new(1, 37) |> Fraction.components()
       {1, 37}
   
       iex> Fraction.new(0, 3) |> Fraction.components()
       {0, 3}
   
   """
   def components(%Fraction{}=fraction), do: {fraction.num, fraction.den}
   
   @doc """
   Determine if a fraction exactly represents a whole number, with no remainder.
   
   ## Examples
   
       iex> Fraction.new(5, 3) |> Fraction.is_whole?()
       false
   
       iex> Fraction.new(-22, 11) |> Fraction.is_whole?()
       true
   """
   def is_whole?(%Fraction{}=fraction), do: rem(fraction.num, fraction.den) == 0

   @doc """
   Determine if a fraction is greater than 1, and has a whole number component.
   
   ## Examples
   
       iex> Fraction.new(3, 17) |> Fraction.has_whole?()
       false
   
       iex> Fraction.new(22, 7) |> Fraction.has_whole?()
       true
   
   """
   def has_whole?(%Fraction{}=fraction), do: abs(fraction.num) >= fraction.den
   
   @doc """
   Get the whole component of a fraction.
   
   ## Examples
   
       iex> Fraction.new(3, 7) |> Fraction.get_whole()
       0
   
       iex> Fraction.new(22, 7) |> Fraction.get_whole()
       3
   
       iex> Fraction.new(-10, 2) |> Fraction.get_whole()
       -5
   """
   def get_whole(%Fraction{}=fraction), do: div(fraction.num, fraction.den)
   
   @doc """
   Get the fractional part left after removing any whole components from the
   fraction.
   
   ## Example
   
       iex> Fraction.new(3, 45) |> Fraction.get_remainder()
       %Fraction{num: 3, den: 45}
   
       iex> Fraction.new(7, 3) |> Fraction.get_remainder()
       %Fraction{num: 1, den: 3}
   
       iex> Fraction.new(-10, 4) |> Fraction.get_remainder()
       %Fraction{num: -2, den: 4}
   
   """
   def get_remainder(%Fraction{}=fraction) do
       
       rem(fraction.num, fraction.den) |> Fraction.new(fraction.den)
       
   end
   
   @doc """
   Break a fraction into whole and fractional parts, returning both.
   
   ## Examples
   
       iex> Fraction.new(6, 4) |> Fraction.split()
       {1, %Fraction{num: 2, den: 4}}
   
       iex> Fraction.new(-22, 7) |> Fraction.split()
       {-3, %Fraction{num: -1, den: 7}}
   
       iex> Fraction.new(0, 3) |> Fraction.split()
       {0, %Fraction{num: 0, den: 3}}
   """
   def split(%Fraction{}=fraction) do
       {
           get_whole(fraction),
           get_remainder(fraction)
       }
   end
   
   @doc """
   Determine if a fraction is in simplified form.
   
   ## Examples
   
       iex> Fraction.new(2, 4) |> Fraction.is_simplified?()
       false
   
       iex> Fraction.new(-10, 4) |> Fraction.is_simplified?()
       false
       
       iex> Fraction.new(0, 7) |> Fraction.is_simplified?()
       false
   
       iex> Fraction.new(22, 7) |> Fraction.is_simplified?()
       true
   """
   def is_simplified?(%Fraction{}=fraction), do: Integer.gcd(fraction.num, fraction.den) == 1
   
   @doc """
   Simplify a fraction.
   
   ## Examples
   
       iex> Fraction.new(6, 8) |> Fraction.simplify()
       %Fraction{num: 3, den: 4}
   
       iex> Fraction.new(24, 8) |> Fraction.simplify()
       %Fraction{num: 3, den: 1}
   
       iex> Fraction.new(22, 7) |> Fraction.simplify()
       %Fraction{num: 22, den: 7}
   """
   def simplify(%Fraction{}=fraction) do
       gcd = Integer.gcd(fraction.num, fraction.den)
       Fraction.new(div(fraction.num, gcd), div(fraction.den, gcd))
   end
   
   @doc """
   Does a fraction represent a zero value?
   
   ## Examples
   
       iex> Fraction.new(3, 134) |> Fraction.is_zero?()
       false
   
       iex> Fraction.new(0, 34) |> Fraction.is_zero?()
       true
   
   """
   def is_zero?(%Fraction{}=fraction), do: fraction.num == 0
   
   defp lcm(a,b) when is_integer(a) and is_integer(b), do: div(abs(a*b), Integer.gcd(a,b))
end