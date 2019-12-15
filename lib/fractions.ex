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
   
   defimpl String.Chars do
       def to_string(%Fraction{num: num, den: den}) do
          "#{num}/#{den}" 
       end
   end
   
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
   Multiply two fractions, or a fraction and an integer and return the (optionally simplified) result.
   
   ## Examples
   
        iex> Fraction.multiply(Fraction.new(3, 7), Fraction.new(22, 7))
        %Fraction{num: 66, den: 49}

        iex> Fraction.multiply(Fraction.new(2, 9), 33, simplify: true)
        %Fraction{num: 22, den: 3}
   
        iex> Fraction.multiply(4, Fraction.new(12, 5))
        %Fraction{num: 48, den: 5}
   """
   def multiply(a, b, opts \\ [])
   def multiply(%Fraction{}=fraction_a, %Fraction{}=fraction_b, opts) do
       simp = opts |> Keyword.get(:simplify, false)
       
       if simp do
           Fraction.new( (fraction_a.num * fraction_b.num), (fraction_a.den * fraction_b.den)) |> simplify()
       else
           Fraction.new( (fraction_a.num * fraction_b.num), (fraction_a.den * fraction_b.den))
       end
       
   end
   
   def multiply(%Fraction{}=fraction_a, int, opts) when is_integer(int), do: multiply(fraction_a, Fraction.new(int), opts)
   def multiply(int, %Fraction{}=fraction_b, opts) when is_integer(int), do: multiply(Fraction.new(int), fraction_b, opts)

   @doc """
   Divide two fractions, or a fraction and an integer and return the (optionally simplified) result.
   
   ## Examples
   
       iex> Fraction.divide(Fraction.new(3, 4), Fraction.new(-7, 2))
       %Fraction{num: -6, den: 28}
   
       iex> Fraction.divide(Fraction.new(28, 4), 4, simplify: true)
       %Fraction{num: 7, den: 4}
   
       iex> Fraction.divide(60, Fraction.new(7, 12))
       %Fraction{num: 720, den: 7}
   
   """   
   def divide(a, b, opts \\ [])
   def divide(%Fraction{}=fraction_a, %Fraction{}=fraction_b, opts) do
       
       case reciprocal(fraction_b) do

          {:error, reason} -> 
              {:error, reason} 

          r_frac -> 
              # multiply out
              multiply(fraction_a, r_frac, opts)
              
       end
   end
   
   def divide(%Fraction{}=fraction_a, int, opts) when is_integer(int), do: divide(fraction_a, Fraction.new(int), opts)
   def divide(int, %Fraction{}=fraction_b, opts) when is_integer(int), do: divide(Fraction.new(int), fraction_b, opts)
   
   @doc """
   Create the reciprocal of a fraction, optionally simplifying the result. 
   
   Negative fractions will switch the sign to carry on the new numerator. Trying to take the reciprocal
   of a zero fraction will result in an error.
   
   ## Examples
   
       iex> Fraction.new(3, 4) |> Fraction.reciprocal()
       %Fraction{num: 4, den: 3}
   
       iex> Fraction.new(-4, 40) |> Fraction.reciprocal(simplify: true)
       %Fraction{num: -10, den: 1}
   
       iex> Fraction.new(0, 3) |> Fraction.reciprocal()
       {:error, :invalid_denominator}
   """
   def reciprocal(%Fraction{}=fraction, opts \\ []) do
       simp = opts |> Keyword.get(:simplify, false)
       
       cond do
          fraction.num == 0 -> {:error, :invalid_denominator} 
          fraction.num < 0 -> 
              
              if simp do
                  Fraction.new(fraction.den * -1, abs(fraction.num)) |> simplify()
              else
                  Fraction.new(fraction.den * -1, abs(fraction.num))                  
              end
              
          true -> 

              if simp do
                  Fraction.new(fraction.den, fraction.num) |> simplify()
              else
                  Fraction.new(fraction.den, fraction.num)
              end
       end
   end
   
   @doc """
   Use fractions in power/exponent calculations.
   
   The base or the power (or both) can be fractions. 
   
   Fractions taken to an integer power will behave as expected:
   
   ```elixir
   iex> Fraction.power(Fraction.new(3, 4), 7)
   %Chunky.Fraction{den: 16384, num: 2187}
   ```
   
   Fractions or integers taken to a fractional power will not always return expected values,
   as most fractional powers do not have a result that can be represented as a fraction. By 
   default the power functions will return an error value in these cases:
   
   ```elixir
   iex> Fraction.power(9, Fraction.new(7, 13))
   {:error, :no_fractional_power}
   ```
   
   If you want the floating point fractional result, you can use the `allow_irrational`
   flag:
   
   ```elixir
   iex> Fraction.power(9, Fraction.new(7, 13), allow_irrational: true)
   3.26454673038995
   ```
   
   When calculating the fractional power of a value, an `epsilon` value is used as part
   of the n-th root finding and resulting analysis The epsilon determines how close to
   a whole number different components of the resulting fractions need to be, to be treated
   as whole numbers.
   
   ## Options
   
    - `simplify` - Boolean. Optionally simplify the return fraction
    - `epsilon` - Float. Small number used to compare how close two values are
    - `allow_irrational` - Boolean. Allow a non-fractional (irrational) result to be returned
   
   ## Examples
   
       iex> Fraction.power(Fraction.new(7, 32), Fraction.new(30, 5))
       %Fraction{num: 117649, den: 1073741824}
   
       iex> Fraction.power(Fraction.new(3, 5), 3)
       %Fraction{num: 27, den: 125}
   
       iex> Fraction.power(4, Fraction.new(-4, 8))
       %Fraction{num: 1, den: 2}
   
       iex> Fraction.power(9, Fraction.new(7, 13), allow_irrational: true)
       3.26454673038995
   
   """
   def power(a, b, opts \\ [])
   
   # fractional base, negative integer power
   def power(%Fraction{}=fraction, int, opts) when is_integer(int) and int < 0 do
       case reciprocal(fraction) do
          {:error, reason} -> {:error, reason}
          r_frac -> power(r_frac, abs(int), opts) 
       end
   end
   
   # fractional base, positive integer power
   def power(%Fraction{}=fraction, int, opts) when is_integer(int) and int >= 0 do
       simp = opts |> Keyword.get(:simplify, false)
       
       p_num = :math.pow(fraction.num, int) |> Kernel.trunc()
       p_den = :math.pow(fraction.den, int) |> Kernel.trunc()
       
       p_frac = Fraction.new(p_num, p_den)
       
       if simp do
           p_frac |> simplify()
       else
           p_frac
       end
   end
   
   # integer base, fractional power
   def power(int, %Fraction{}=fraction_b, opts) when is_integer(int) do
       
       # conver the base to a fraction, and continue
       power(Fraction.new(int), fraction_b, opts) 
       
   end
   
   # fractional base, negative fractional power
   def power(%Fraction{}=fraction_a, %Fraction{num: num}=fraction_b, opts) when num < 0 do
       
       # we have a special case we need to catch - the power fraction is negative. Reciprocal
       # base to a positive power to the rescue
       case reciprocal(fraction_a) do
          {:error, reason} -> {:error, reason}
          r_frac -> power(r_frac, multiply(fraction_b, -1), opts) 
       end
   end
   
   # fractional base, positive fractional power
   def power(%Fraction{}=fraction_a, %Fraction{}=fraction_b, opts) do

       simp = opts |> Keyword.get(:simplify, false)
       allow_irs = opts |> Keyword.get(:allow_irrational, false)
       epsilon = opts |> Keyword.get(:epsilon, 1.0e-7)
       
       # break our fractional power into the power and root segments
       f_pow = fraction_b.num
       f_root = fraction_b.den
       
       # we use the equivalence of (x/y) ^ (m/n) of
       #
       #    (x^(m/n)) / (y^(m/n))
       #
       # and further that x^(m/n) is equivalent to
       #
       #    (x^m)^(1/n)
       
       # we can run this for both the top and bottom of the fraction, but we
       # need to check a few things. The powers will always work, but the
       # n-th root may not converge to an integer. If that's the case, we
       # may want to bail on the calculation. We do have an option `allow_irrationals`
       # that will build the final result as an irration number.
       
       # first we try and run the numbers through in fractional mode
       num_powed = :math.pow(fraction_a.num, f_pow) |> Kernel.trunc()
       den_powed = :math.pow(fraction_a.den, f_pow) |> Kernel.trunc()
       
       case {
               integer_nth_root?(num_powed, f_root, epsilon), 
               integer_nth_root?(den_powed, f_root, epsilon)
           } do
           
           { {true, num_i_root}, {true, den_i_root}} -> 
               
               if simp do
                   Fraction.new(num_i_root, den_i_root) |> simplify()
               else
                   Fraction.new(num_i_root, den_i_root)
               end
               
           { {true, num_i_root}, {false, _, den_irr}} ->
               
               if allow_irs do
                  num_i_root / den_irr
               else
                  {:error, :no_fractional_power} 
               end
               
           { {false, _, num_irr}, {true, den_i_root}} ->

               if allow_irs do
                  num_irr / den_i_root
               else
                  {:error, :no_fractional_power} 
               end
               
           { {false, _, num_irr}, {false, _, den_irr}} ->
               
               if allow_irs do
                  num_irr / den_irr
               else
                  {:error, :no_fractional_power} 
               end
               
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
   
   @doc """
   Determine if the n-th root of a number is a whole integer.
   
   If the result n-th root is within `epsilon` of a whole
   integer, we consider the result an integer n-th root. 
   This calcualtion runs the fast converging n-th root at a higher
   epsilon than it's configured to use for comparison and testing of the
   result value. 
   
   ## Examples
   
       iex> Fraction.integer_nth_root?(27, 3)
       {true, 3}
   
       iex> Fraction.integer_nth_root?(1234, 6)
       {false, :no_integer_nth_root, 3.2750594908836885}
   """
   def integer_nth_root?(x, n, epsilon \\ 1.0e-6) do
   
       root = nth_root(x, n, epsilon * 0.001)
       i_root = Float.round(root)
       
       if abs(root - i_root) < epsilon do
           {true, Kernel.trunc(i_root)}
       else
           {false, :no_integer_nth_root, root}
       end
   end
   
   @doc """
   Generalized integer nth root, from:
   
       https://github.com/acmeism/RosettaCodeData/blob/master/Task/Nth-root/Elixir/nth-root.elixir
   
   based on a fast converging Newton's Method process.
   
   ## Examples
   
       iex> nth_root(8, 3)
       2.0
   
       iex> nth_root(27, 3)
       3.0
   
       iex> nth_root(78125, 7)
       5.0
   """
   def nth_root(x, n, precision \\ 1.0e-7) do
         
       f = fn(prev) -> 
           ( (n - 1) * prev + x / :math.pow(prev, (n-1) ) ) / n 
       end
       
       fixed_point(f, x, precision, f.(x))
   end

   defp fixed_point(_, guess, tolerance, next) when abs(guess - next) < tolerance, do: next
   defp fixed_point(f, _, tolerance, next), do: fixed_point(f, next, tolerance, f.(next))

end