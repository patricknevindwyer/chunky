defmodule Chunky.Fraction do
   @moduledoc """
   Functions for creating and manipulating fractions.
   
   """ 
   
   defstruct [:num, :dem]
   
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
       %Fraction{num: 1, dem: 3}
   
       iex> Fraction.new(22, -7)
       %Fraction{num: -22, dem: 7}
   
       iex> Fraction.new(17, 0)
       {:error, :invalid_denominator}
   
       iex> Fraction.new(0, 37)
       %Fraction{num: 0, dem: 37}
   """
   def new(num, dem) when is_integer(num) and is_integer(dem) do
       
       cond do
           dem == 0 -> {:error, :invalid_denominator}
           num == 0 && dem != 0 -> %Fraction{num: 0, dem: abs(dem)}
           num > 0 && dem < 0 -> %Fraction{num: num * -1, dem: abs(dem)}
           num < 0 && dem > 0 -> %Fraction{num: num, dem: dem}
           num < 0 && dem < 0 -> %Fraction{num: abs(num), dem: abs(dem)}
           true -> %Fraction{num: num, dem: dem}
       end
       
   end
   
   @doc """
   Extract the numerator and denominator of a fraction as a tuple of values.
   
   ## Examples
   
       iex> Fraction.new(1, 37) |> Fraction.components()
       {1, 37}
   
       iex> Fraction.new(0, 3) |> Fraction.components()
       {0, 3}
   
   """
   def components(%Fraction{}=fraction), do: {fraction.num, fraction.dem}
   
   @doc """
   Determine if a fraction exactly represents a whole number, with no remainder.
   
   ## Examples
   
       iex> Fraction.new(5, 3) |> Fraction.is_whole?()
       false
   
       iex> Fraction.new(-22, 11) |> Fraction.is_whole?()
       true
   """
   def is_whole?(%Fraction{}=fraction), do: rem(fraction.num, fraction.dem) == 0

   @doc """
   Determine if a fraction is greater than 1, and has a whole number component.
   
   ## Examples
   
       iex> Fraction.new(3, 17) |> Fraction.has_whole?()
       false
   
       iex> Fraction.new(22, 7) |> Fraction.has_whole?()
       true
   
   """
   def has_whole?(%Fraction{}=fraction), do: abs(fraction.num) >= fraction.dem
   
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
   def get_whole(%Fraction{}=fraction), do: div(fraction.num, fraction.dem)
   
   @doc """
   Get the fractional part left after removing any whole components from the
   fraction.
   
   ## Example
   
       iex> Fraction.new(3, 45) |> Fraction.get_remainder()
       %Fraction{num: 3, dem: 45}
   
       iex> Fraction.new(7, 3) |> Fraction.get_remainder()
       %Fraction{num: 1, dem: 3}
   
       iex> Fraction.new(-10, 4) |> Fraction.get_remainder()
       %Fraction{num: -2, dem: 4}
   
   """
   def get_remainder(%Fraction{}=fraction) do
       
       rem(fraction.num, fraction.dem) |> Fraction.new(fraction.dem)
       
   end
   
   @doc """
   Break a fraction into whole and fractional parts, returning both.
   
   ## Examples
   
       iex> Fraction.new(6, 4) |> Fraction.split()
       {1, %Fraction{num: 2, dem: 4}}
   
       iex> Fraction.new(-22, 7) |> Fraction.split()
       {-3, %Fraction{num: -1, dem: 7}}
   
       iex> Fraction.new(0, 3) |> Fraction.split()
       {0, %Fraction{num: 0, dem: 3}}
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
   def is_simplified?(%Fraction{}=fraction), do: Integer.gcd(fraction.num, fraction.dem) == 1
   
   @doc """
   Simplify a fraction.
   
   ## Examples
   
       iex> Fraction.new(6, 8) |> Fraction.simplify()
       %Fraction{num: 3, dem: 4}
   
       iex> Fraction.new(24, 8) |> Fraction.simplify()
       %Fraction{num: 3, dem: 1}
   
       iex> Fraction.new(22, 7) |> Fraction.simplify()
       %Fraction{num: 22, dem: 7}
   """
   def simplify(%Fraction{}=fraction) do
       gcd = Integer.gcd(fraction.num, fraction.dem)
       Fraction.new(div(fraction.num, gcd), div(fraction.dem, gcd))
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
   
end