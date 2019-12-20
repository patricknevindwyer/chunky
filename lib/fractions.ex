defmodule Chunky.Fraction do
  @moduledoc """
  Functions for creating and manipulating fractions. 

  Most functions will work with combinations of _Fractions_ and _Integers_. All of
  the fraction functions work with explicit integer numerators and denominators, falling
  back to returning floating point number only when configured to in special circumstances.

  ## Value Coercion

  A subset of functions for working with fractions will automatically coerce things that
  _look_ like fractions - any value that can be parsed by some version of `new/1`. This
  includes:

   - Existing fractions `%Fraction{num: 22, den:7}`
   - Integers `14`
   - Floats `1.75`
   - 2-tuples `{3, 91}`
   - Integer as String `"4"`
   - Float as String `"1.35"`
   - Fraction as String `"2/9"`

  See `new/1` for more information about how values are converted to fractions.

  The following functions support mixed types as parameters, either positionally (like
  the basic math functions) or as part of a list (aggregate functions):

   - `add/3`
   - `divide/3`
   - `multiply/3`
   - `subtract/3`
   - `gt?/2`
   - `gte?/2`
   - `lt?/2`
   - `lte?/2`
   - `eq?/2`
   - `fractionalize/1`
   - `max_of/1`
   - `max_of/2`
   - `min_of/1`
   - `min_of/2`
   - `min_max_of/1`
   - `normalize_all/1`
   - `sum/1`

  ## Creating Fractions

  Construct fractions from a single integer, tuple of integers, or a pair of integer
  parameters.

    - `new/1` - Create a Fraction from an integer or tuple of integers
    - `new/2` - Create a Fraction from a numerator and denominator

  ```elixir
  iex> Fraction.new(3)
  %Fraction{num: 3, den: 1}

  iex> Fraction.new({22, 7})
  %Fraction{num: 22, den: 7}
  ```

  ## Basic Math

  Standard math functions that work with two fractions, or a fraction and an integer. Options
  allow for automatic simplification and control over how certain operations work.

    - `add/3` - Add two fractions, or a fraction and a value compatible with `new/1`
    - `subtract/3` - Subtract two fractions, or a fraction and a value compatible with `new/1`
    - `max_of/2` - Find the larger of two fractions, or a fraction and a value compatible with `new/1`
    - `min_of/2` - Find the smaller of two fractions, or a fraction and value compatible with `new/1`
    - `multiply/3` - Multiply two fractions, or a fraction and a value compatible with `new/1`
    - `divide/3` - Divide two fractions, or a fraction and a value compatible with `new/1`
    - `power/3` - Take a fraction or an integer to the power of a fraction or an integer

  ```elixir
  iex> Fraction.new(4, 3) |> Fraction.add(Fraction.new({1, 6})) |> Fraction.power(2)
  %Fraction{num: 81, den: 36}

  iex> Fraction.power(8, Fraction.new(1, 3))
  %Fraction{num: 2, den: 1}
  ```

  ## Comparisons

  Binary comparisons between two fractions or a fraction and an integer.

    - `eq?/2` - Equality (`==`) comparison between two fractions, or a fraction and an integer
    - `gt?/2` - Greater than (`>`) comparison between two fractions, or a fraction and an integer
    - `gte?/2` - Greater than or equal (`>=`) comparison between two fractions, or a fraction and an integer
    - `lt?/2` - Less than (`<`) comparison between two fractions, or a fraction and an integer
    - `lte?/2` - Less than or equal (`<=`) comparison between two fractions, or a fraction and an integer

  ```elixir
  iex> Fraction.gt?(Fraction.new(7, 8), Fraction.new(8, 9))
  false

  iex> Fraction.eq?(3, Fraction.new(27, 9))
  true
  ```

  ## Fraction Manipulation

  Manipulate the components of individual fractions.
      
    - `components/1` - Get the numerator and denominator of a fraction as a tuple of integers
    - `get_remainder/1` - Get fractional remainder after removing all whole values of a fraction
    - `get_whole/1` - Get whole value portion of a fraction
    - `reciprocal/2` - Inverse or reciprocal of a fraction
    - `simplify/1` - Simplify a fraction to it's reduced form
    - `split/1` - Extract the whole value portion and the remainer portion of a fraction as a tuple
    - `to_float/2` - Convert a fraction to a floating point value

  ```elixir
  iex> Fraction.new(88, 28) |> Fraction.simplify() |> Fraction.split()
  {3, %Fraction{num: 1, den: 7}}

  iex> Fraction.new(22, 7) |> Fraction.to_float(precision: 2)
  3.14
  ```

  ## Aggregate Functions

  Work with multiple fractions in aggregate. Most aggregate functions will work with Fractions, or any
  value that can be converted to a fraction with `new/1`.

    - `fractionalize/1` - Convert a list of fraction representations (anything that works with `new/1`) into Fraction structs
    - `max_of/1` - Find the largest value in a list of fractions, or literals compatible with `new/1`
    - `min_of/1` - Find the smallest value in a list of fractions, or literals compatible with `new/1`
    - `min_max_of/1` - Find the smallest and largest values in a list of fractions or literals compatible with `new/1`
    - `normalize/2` - Convert two fractions to a common denominator
    - `normalize_all/1` - Convert a list of two or more fractions to a common denominator
    - `sum/2` - Find the sum of a list of fractions

  ```elixir
  iex> Fraction.normalize(Fraction.new(22, 7), Fraction.new(4, 3))
  { %Fraction{num: 66, den: 21}, %Fraction{num: 28, den: 21} }

  iex> Fraction.max_of(["3/4", {4, 5}, 1.5])
  %Fraction{num: 15, den: 10}
  ```
    
  ## Inspection

  Inspect the properties of individual fractions.

    - `has_whole?/1` - Does a fraction have a whole value component? (i.e. has a total value greater than `1`)
    - `is_negative?/1` - Is a fraction negative?
    - `is_positive?/1` - Is a fraction positive?
    - `is_simplified?/1` - Is a fraction in it's simplified form?
    - `is_whole?/1` - Is the fraction an _exact_ whole number?
    - `is_zero?/1` - Is the fraction zero?

  ```elixir
  iex> Fraction.new(3, 18) |> is_simplified?()
  false
  ```

  ## Integer Math

  Integer math functions that support fraction functions and manipulations.

    - `integer_nth_root?/3` - Determine if an integer has a specific `n-th` root
    - `lcm/1` - Least common multiple of a list of integers
    - `lcm/2` - Least common multiple of two integers
    - `nth_root/3` - Floating point `n-th` root of an integer

  ```elixir
  iex> 64 |> Fraction.integer_nth_root?(3)
  {true, 4}

  iex> Fraction.lcm([3, 4, 5])
  60
  ```

  ## Float Math

    - `floats_equal/3` - Determine if two floats are equal, within an error bound


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
  Convert a floating point value to a fraction.

  There are two modes for converting values:

   - Using precision approximation (via `Float.ratio/1`)
   - Using natural conversion

  Natural conversion tries to find a fraction that represents the intended value of
  a float, while precision approximation tries to find a fractional representation of
  the encoded floating point value. Use the `conversion` flag to toggle between
  the two modes. 

  ## Flags

   - `conversion` - Atom. One of `:natural` or `:precision`

  ## Example

      iex> Fraction.new(0.9, conversion: :natural) |> to_string()
      "9/10"
      
      iex> Fraction.new(0.9, conversion: :precision) |> to_string()
      "8106479329266893/9007199254740992"

      iex> Fraction.new(3.14, conversion: :natural) |> to_string()
      "314/100"
      
      iex> Fraction.new(3.14, conversion: :precision) |> to_string()
      "7070651414971679/2251799813685248"
  """
  def new(fl, opts) when is_float(fl) and is_list(opts) do
    mode = opts |> Keyword.get(:conversion, :natural)

    case mode do
      :precision ->
        Float.ratio(fl) |> new()

      :natural ->
        [hi, lo] =
          fl
          |> Float.to_string()
          |> String.split(".")

        # how many digits in denominator?
        den = Kernel.trunc(:math.pow(10, String.length(lo)))

        # now build the numerator
        {hi_v, _} = Integer.parse(hi)
        {lo_v, _} = Integer.parse(lo)
        new(hi_v * den + lo_v, den)
    end
  end

  @doc """
  Convert a float to a fraction.

  This is a short hand call to `new/2` for converting a float to
  a fraction using natural conversion, so `new(0.9)` is equivalent
  to calling `new(0.9, conversion: :natural)`.

  ## Example

      iex> new(0.9)
      %Fraction{num: 9, den: 10}
      
  """
  def new(fl) when is_float(fl), do: new(fl, conversion: :natural)

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
  Create a fraction from a fraction. 

  This is an identity function, and the original fraction is returned. This is primarily
  used for aggregate functions and multi-type parsing.

  ## Example

      iex> Fraction.new(22, 7) |> Fraction.new()
      %Fraction{num: 22, den: 7}

  """
  def new(%Fraction{} = fraction), do: fraction

  @doc """
  Convert a string encoding of an integer, float, or fraction into a fraction.

  ## Example

      iex> Fraction.new("3")
      %Fraction{num: 3, den: 1}

      iex> Fraction.new("12/7")
      %Fraction{num: 12, den: 7}

      iex> Fraction.new("13 / 5")
      %Fraction{num: 13, den: 5}

      iex> Fraction.new("foo/bar")
      {:error, :no_parsable_fraction}

      iex> Fraction.new("3.14")
      %Fraction{num: 314, den: 100}
  """
  def new(string) when is_binary(string) do
    case String.split(string, "/") do
      [single] ->
        case float_or_integer(single) do
          :none -> {:error, :no_parseable_fraction}
          {:integer, i} -> new(i)
          {:float, f} -> new(f)
        end

      [num, den] ->
        p_num = num |> String.trim() |> Integer.parse()
        p_den = den |> String.trim() |> Integer.parse()

        case {p_num, p_den} do
          {:error, :error} -> {:error, :no_parsable_fraction}
          {_, :error} -> {:error, :no_parsable_fraction}
          {:error, _} -> {:error, :no_parsable_fraction}
          {{v_num, _}, {v_den, _}} -> new(v_num, v_den)
        end

      _o ->
        {:error, :no_parsable_fraction}
    end
  end

  # support method - a string may contain a float, integer, or nothing useful,
  # determine the best one to use.
  defp float_or_integer(s) do
    str = s |> String.trim()
    # does it even have a decimal?
    if String.contains?(str, ".") do
      # does float parse it?
      case Float.parse(str) do
        :error -> :none
        {v, _} -> {:float, v}
      end
    else
      case Integer.parse(str) do
        :error -> :none
        {v, _} -> {:integer, v}
      end
    end
  end

  # Support stringification
  defimpl String.Chars do
    def to_string(%Fraction{num: num, den: den}) do
      "#{num}/#{den}"
    end
  end

  @doc """
  Add two fractions, or a fraction and a value, and return the (optionally simplified) result.

  **Supports Type Coercion?**: ✅

  ## Options

   - `simplify` - **Boolean** - default `false`. Return result as a simplified fraction.

  ## Examples

      iex> Fraction.add(Fraction.new(1, 2), Fraction.new(-8, 3))
      %Fraction{num: -13, den: 6}

      iex> Fraction.add(Fraction.new(3, 4), Fraction.new(3, 4), simplify: true)
      %Fraction{num: 3, den: 2}

      iex> Fraction.add(Fraction.new(1, 3), 5)
      %Fraction{num: 16, den: 3}
      
      iex> Fraction.add(2, Fraction.new(5, 4))
      %Fraction{num: 13, den: 4}

      iex> Fraction.add("2/3", Fraction.new(5, 3))
      %Fraction{num: 7, den: 3}

  """
  def add(value_a, value_b, opts \\ [])

  def add(%Fraction{} = fraction_a, %Fraction{} = fraction_b, opts) do
    simp = opts |> Keyword.get(:simplify, false)

    new_base = lcm(fraction_a.den, fraction_b.den)
    a_mult = div(new_base, fraction_a.den)
    b_mult = div(new_base, fraction_b.den)

    if simp do
      Fraction.new(fraction_a.num * a_mult + fraction_b.num * b_mult, new_base) |> simplify()
    else
      Fraction.new(fraction_a.num * a_mult + fraction_b.num * b_mult, new_base)
    end
  end

  def add(%Fraction{} = fraction_a, int, opts) when is_integer(int),
    do: add(fraction_a, Fraction.new(int, 1), opts)

  def add(int, %Fraction{} = fraction_b, opts) when is_integer(int),
    do: add(Fraction.new(int, 1), fraction_b, opts)

  def add(%Fraction{} = fraction_a, str, opts) when is_binary(str),
    do: add(fraction_a, new(str), opts)

  def add(str, %Fraction{} = fraction_b, opts) when is_binary(str),
    do: add(new(str), fraction_b, opts)

  def add(%Fraction{} = fraction_a, f, opts) when is_float(f), do: add(fraction_a, new(f), opts)
  def add(f, %Fraction{} = fraction_b, opts) when is_float(f), do: add(new(f), fraction_b, opts)

  def add(%Fraction{} = fraction_a, tup, opts) when is_tuple(tup),
    do: add(fraction_a, new(tup), opts)

  def add(tup, %Fraction{} = fraction_b, opts) when is_tuple(tup),
    do: add(new(tup), fraction_b, opts)

  @doc """
  Subtract two fractions, or a fraction an a value, and return the (optionally) simplified result.

  **Supports Type Coercion?**: ✅

  ## Options

   - `simplify` - **Boolean** - default `false`. Return result as a simplified fraction.

  ## Examples

      iex> Fraction.subtract(Fraction.new(3, 5), Fraction.new(1, 5))
      %Fraction{num: 2, den: 5}

      iex> Fraction.subtract(2, Fraction.new(-6, 9), simplify: true)
      %Fraction{num: 8, den: 3}

      iex> Fraction.subtract(Fraction.new(-2, 4), -5, simplify: true)
      %Fraction{num: 9, den: 2}

      iex> Fraction.subtract(Fraction.new(8, 10), 0.5)
      %Fraction{num: 3, den: 10}
  """
  def subtract(value_a, value_b, opts \\ [])

  def subtract(%Fraction{} = fraction_a, %Fraction{} = fraction_b, opts) do
    simp = opts |> Keyword.get(:simplify, false)

    new_base = lcm(fraction_a.den, fraction_b.den)
    a_mult = div(new_base, fraction_a.den)
    b_mult = div(new_base, fraction_b.den)

    if simp do
      Fraction.new(fraction_a.num * a_mult - fraction_b.num * b_mult, new_base) |> simplify()
    else
      Fraction.new(fraction_a.num * a_mult - fraction_b.num * b_mult, new_base)
    end
  end

  def subtract(%Fraction{} = fraction_a, int, opts) when is_integer(int),
    do: subtract(fraction_a, Fraction.new(int, 1), opts)

  def subtract(int, %Fraction{} = fraction_b, opts) when is_integer(int),
    do: subtract(Fraction.new(int, 1), fraction_b, opts)

  def subtract(%Fraction{} = fraction_a, str, opts) when is_binary(str),
    do: subtract(fraction_a, new(str), opts)

  def subtract(str, %Fraction{} = fraction_b, opts) when is_binary(str),
    do: subtract(new(str), fraction_b, opts)

  def subtract(%Fraction{} = fraction_a, f, opts) when is_float(f),
    do: subtract(fraction_a, new(f), opts)

  def subtract(f, %Fraction{} = fraction_b, opts) when is_float(f),
    do: subtract(new(f), fraction_b, opts)

  def subtract(%Fraction{} = fraction_a, tup, opts) when is_tuple(tup),
    do: subtract(fraction_a, new(tup), opts)

  def subtract(tup, %Fraction{} = fraction_b, opts) when is_tuple(tup),
    do: subtract(new(tup), fraction_b, opts)

  @doc """
  Multiply two fractions, or a fraction and a value and return the (optionally simplified) result.

  **Supports Type Coercion?**: ✅

  ## Options

   - `simplify` - **Boolean** - default `false`. Return result as a simplified fraction.

  ## Examples

       iex> Fraction.multiply(Fraction.new(3, 7), Fraction.new(22, 7))
       %Fraction{num: 66, den: 49}

       iex> Fraction.multiply(Fraction.new(2, 9), 33, simplify: true)
       %Fraction{num: 22, den: 3}

       iex> Fraction.multiply(4, Fraction.new(12, 5))
       %Fraction{num: 48, den: 5}
        
       iex> Fraction.multiply("4", Fraction.new(22, 7))
       %Fraction{num: 88, den: 7}
  """
  def multiply(value_a, value_b, opts \\ [])

  def multiply(%Fraction{} = fraction_a, %Fraction{} = fraction_b, opts) do
    simp = opts |> Keyword.get(:simplify, false)

    if simp do
      Fraction.new(fraction_a.num * fraction_b.num, fraction_a.den * fraction_b.den) |> simplify()
    else
      Fraction.new(fraction_a.num * fraction_b.num, fraction_a.den * fraction_b.den)
    end
  end

  def multiply(%Fraction{} = fraction_a, int, opts) when is_integer(int),
    do: multiply(fraction_a, Fraction.new(int), opts)

  def multiply(int, %Fraction{} = fraction_b, opts) when is_integer(int),
    do: multiply(Fraction.new(int), fraction_b, opts)

  def multiply(%Fraction{} = fraction_a, str, opts) when is_binary(str),
    do: multiply(fraction_a, new(str), opts)

  def multiply(str, %Fraction{} = fraction_b, opts) when is_binary(str),
    do: multiply(new(str), fraction_b, opts)

  def multiply(%Fraction{} = fraction_a, f, opts) when is_float(f),
    do: multiply(fraction_a, new(f), opts)

  def multiply(f, %Fraction{} = fraction_b, opts) when is_float(f),
    do: multiply(new(f), fraction_b, opts)

  def multiply(%Fraction{} = fraction_a, tup, opts) when is_tuple(tup),
    do: multiply(fraction_a, new(tup), opts)

  def multiply(tup, %Fraction{} = fraction_b, opts) when is_tuple(tup),
    do: multiply(new(tup), fraction_b, opts)

  @doc """
  Divide two fractions, or a fraction and a value and return the (optionally simplified) result.

  **Supports Type Coercion?**: ✅

  ## Options

   - `simplify` - **Boolean** - default `false`. Return result as a simplified fraction.

  ## Examples

      iex> Fraction.divide(Fraction.new(3, 4), Fraction.new(-7, 2))
      %Fraction{num: -6, den: 28}

      iex> Fraction.divide(Fraction.new(28, 4), 4, simplify: true)
      %Fraction{num: 7, den: 4}

      iex> Fraction.divide(60, Fraction.new(7, 12))
      %Fraction{num: 720, den: 7}

      iex> Fraction.divide(Fraction.new(11, 17), "3")
      %Fraction{num: 11, den: 51}

  """
  def divide(value_a, value_b, opts \\ [])

  def divide(%Fraction{} = fraction_a, %Fraction{} = fraction_b, opts) do
    case reciprocal(fraction_b) do
      {:error, reason} ->
        {:error, reason}

      r_frac ->
        # multiply out
        multiply(fraction_a, r_frac, opts)
    end
  end

  def divide(%Fraction{} = fraction_a, int, opts) when is_integer(int),
    do: divide(fraction_a, Fraction.new(int), opts)

  def divide(int, %Fraction{} = fraction_b, opts) when is_integer(int),
    do: divide(Fraction.new(int), fraction_b, opts)

  def divide(%Fraction{} = fraction_a, str, opts) when is_binary(str),
    do: divide(fraction_a, new(str), opts)

  def divide(str, %Fraction{} = fraction_b, opts) when is_binary(str),
    do: divide(new(str), fraction_b, opts)

  def divide(%Fraction{} = fraction_a, f, opts) when is_float(f),
    do: divide(fraction_a, new(f), opts)

  def divide(f, %Fraction{} = fraction_b, opts) when is_float(f),
    do: divide(new(f), fraction_b, opts)

  def divide(%Fraction{} = fraction_a, tup, opts) when is_tuple(tup),
    do: multiply(fraction_a, new(tup), opts)

  def divide(tup, %Fraction{} = fraction_b, opts) when is_tuple(tup),
    do: multiply(new(tup), fraction_b, opts)

  @doc """
  Create the reciprocal of a fraction, optionally simplifying the result. 

  Negative fractions will switch the sign to carry on the new numerator. Trying to take the reciprocal
  of a zero fraction will result in an error.

  ## Options

   - `simplify` - **Boolean** - default `false`. Return result as a simplified fraction.

  ## Examples

      iex> Fraction.new(3, 4) |> Fraction.reciprocal()
      %Fraction{num: 4, den: 3}

      iex> Fraction.new(-4, 40) |> Fraction.reciprocal(simplify: true)
      %Fraction{num: -10, den: 1}

      iex> Fraction.new(0, 3) |> Fraction.reciprocal()
      {:error, :invalid_denominator}
  """
  def reciprocal(%Fraction{} = fraction, opts \\ []) do
    simp = opts |> Keyword.get(:simplify, false)

    cond do
      fraction.num == 0 ->
        {:error, :invalid_denominator}

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

   - `simplify` - **Boolean**. Default `false`. Optionally simplify the return fraction
   - `epsilon` - Float. Small number used to compare how close two values are
   - `allow_irrational` - Boolean. eDefault `false`. Allow a non-fractional (irrational) result to be returned

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
  def power(%Fraction{} = fraction, int, opts) when is_integer(int) and int < 0 do
    case reciprocal(fraction) do
      {:error, reason} -> {:error, reason}
      r_frac -> power(r_frac, abs(int), opts)
    end
  end

  # fractional base, positive integer power
  def power(%Fraction{} = fraction, int, opts) when is_integer(int) and int >= 0 do
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
  def power(int, %Fraction{} = fraction_b, opts) when is_integer(int) do
    # conver the base to a fraction, and continue
    power(Fraction.new(int), fraction_b, opts)
  end

  # fractional base, negative fractional power
  def power(%Fraction{} = fraction_a, %Fraction{num: num} = fraction_b, opts) when num < 0 do
    # we have a special case we need to catch - the power fraction is negative. Reciprocal
    # base to a positive power to the rescue
    case reciprocal(fraction_a) do
      {:error, reason} -> {:error, reason}
      r_frac -> power(r_frac, multiply(fraction_b, -1), opts)
    end
  end

  # fractional base, positive fractional power
  def power(%Fraction{} = fraction_a, %Fraction{} = fraction_b, opts) do
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
      {{true, num_i_root}, {true, den_i_root}} ->
        if simp do
          Fraction.new(num_i_root, den_i_root) |> simplify()
        else
          Fraction.new(num_i_root, den_i_root)
        end

      {{true, num_i_root}, {false, _, den_irr}} ->
        if allow_irs do
          num_i_root / den_irr
        else
          {:error, :no_fractional_power}
        end

      {{false, _, num_irr}, {true, den_i_root}} ->
        if allow_irs do
          num_irr / den_i_root
        else
          {:error, :no_fractional_power}
        end

      {{false, _, num_irr}, {false, _, den_irr}} ->
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
  def components(%Fraction{} = fraction), do: {fraction.num, fraction.den}

  @doc """
  Convert a fraction to a float, optionally rounding to a specific precision.

  ## Options

   - `precision` - Integer. Default `15`. Number of digits of precision in float. From `0` to `15`.

  ## Examples

      iex> Fraction.new(22, 7) |> to_float()
      3.142857142857143

      iex> Fraction.new(22, 7) |> to_float(precision: 2)
      3.14
  """
  def to_float(%Fraction{} = fraction, opts \\ []) do
    precision = opts |> Keyword.get(:precision, 15)

    Float.round(fraction.num / fraction.den, precision)
  end

  @doc """
  Determine if a fraction exactly represents a whole number, with no remainder.

  ## Examples

      iex> Fraction.new(5, 3) |> Fraction.is_whole?()
      false

      iex> Fraction.new(-22, 11) |> Fraction.is_whole?()
      true
  """
  def is_whole?(%Fraction{} = fraction), do: rem(fraction.num, fraction.den) == 0

  @doc """
  Determine if a fraction is greater than 1, and has a whole number component.

  ## Examples

      iex> Fraction.new(3, 17) |> Fraction.has_whole?()
      false

      iex> Fraction.new(22, 7) |> Fraction.has_whole?()
      true

  """
  def has_whole?(%Fraction{} = fraction), do: abs(fraction.num) >= fraction.den

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
  def get_whole(%Fraction{} = fraction), do: div(fraction.num, fraction.den)

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
  def get_remainder(%Fraction{} = fraction) do
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
  def split(%Fraction{} = fraction) do
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
  def is_simplified?(%Fraction{} = fraction), do: Integer.gcd(fraction.num, fraction.den) == 1

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
  def simplify(%Fraction{} = fraction) do
    gcd = Integer.gcd(fraction.num, fraction.den)
    Fraction.new(div(fraction.num, gcd), div(fraction.den, gcd))
  end

  @doc """
  Change a combination of fractions, or fractions and integers, into the
  same denominator.

  ## Example

      iex> Fraction.normalize(Fraction.new(3, 4), Fraction.new(1, 7))
      { %Fraction{num: 21, den: 28}, %Fraction{num: 4, den: 28} }

      iex> Fraction.normalize(3, Fraction.new(2, 5))
      { %Fraction{num: 15, den: 5}, %Fraction{num: 2, den: 5} }
      
      iex> Fraction.normalize(Fraction.new(6, 4), 2)
      { %Fraction{num: 6, den: 4}, %Fraction{num: 8, den: 4} }
  """
  def normalize(%Fraction{} = fraction_a, int) when is_integer(int) do
    normalize(fraction_a, Fraction.new(int))
  end

  def normalize(int, %Fraction{} = fraction_b) when is_integer(int) do
    normalize(Fraction.new(int), fraction_b)
  end

  def normalize(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    if fraction_a.den == fraction_b.den do
      {fraction_a, fraction_b}
    else
      new_base = lcm(fraction_a.den, fraction_b.den)
      a_mult = new_base / fraction_a.den
      b_mult = new_base / fraction_b.den

      {
        Fraction.new(Kernel.trunc(fraction_a.num * a_mult), new_base),
        Fraction.new(Kernel.trunc(fraction_b.num * b_mult), new_base)
      }
    end
  end

  @doc """
  Normalize (move to the same denominator) all of the fractions and integers in a
  list.

  **Supports Type Coercion?**: ✅

  ## Examples

       iex> Fraction.normalize_all([Fraction.new(1, 2), Fraction.new(2, 3), Fraction.new(3, 4), 7])
       [
           %Fraction{den: 12, num: 6},
           %Fraction{den: 12, num: 8},
           %Fraction{den: 12, num: 9},
           %Fraction{den: 12, num: 84}
       ]

       iex> Fraction.normalize_all(["3/4", {7, 8}, Fraction.new(8, 16)])
       [
            %Fraction{num: 12, den: 16},
            %Fraction{num: 14, den: 16},
            %Fraction{num: 8, den: 16}
       ]

  """
  def normalize_all(list) when is_list(list) do
    # convert everything to fractions, if they aren't already
    fracs = list |> fractionalize()

    # extract denominators
    denoms =
      fracs
      |> Enum.map(fn f -> f.den end)

    # find our new base
    new_base = lcm(denoms)

    # iterate and normalize everything
    fracs
    |> Enum.map(fn frac ->
      f_mult = new_base / frac.den
      Fraction.new(Kernel.trunc(frac.num * f_mult), new_base)
    end)
  end

  @doc """
  Add a series of fractions and integers.

  **Supports Type Coercion?**: ✅

  ## Options

   - `simplify` - **Boolean** - default `false`. Return result as a simplified fraction.

  ## Example

      iex> Fraction.sum([Fraction.new(3, 4), Fraction.new(5, 7), Fraction.new(8, 11), 1, Fraction.new(249, 308)])
      %Fraction{num: 1232, den: 308}

      iex> Fraction.sum([Fraction.new(3, 4), Fraction.new(5, 7), Fraction.new(8, 11), 1, Fraction.new(249, 308)], simplify: true)
      %Fraction{num: 4, den: 1}

  """
  def sum(list, opts \\ []) when is_list(list) do
    simp = opts |> Keyword.get(:simplify, false)

    # normalize the fractions, hold one aside so we can reference the new denominator later
    [head_frac | _] = n_fracs = normalize_all(list)

    # gather the full sum of new numerators
    n_num = Enum.sum(n_fracs |> Enum.map(fn f -> f.num end))

    if simp do
      Fraction.new(n_num, head_frac.den) |> simplify()
    else
      Fraction.new(n_num, head_frac.den)
    end
  end

  @doc """
  Find the minimum value in a list of fractions or vaules. Relative comparisons are calculated based on float
  conversion of fractions.  

  **Supports Type Coercion?**: ✅

  ## Example

      iex> Fraction.min_of([ Fraction.new(3, 7), Fraction.new(5, 11), Fraction.new(11, 23)])
      %Fraction{num: 3, den: 7}

  """
  def min_of([]), do: nil

  def min_of(list) do
    list |> fractionalize() |> Enum.min_by(&to_float/1)
  end

  @doc """
  Return the smaller of two fractions, or a fraction and an alternate
  encoding (like float, string, or integer).

  **Supports Type Coercion?**: ✅

  ## Example

      iex> Fraction.min_of( Fraction.new(3, 7), Fraction.new(11, 28) )
      %Fraction{num: 11, den: 28}

      iex> Fraction.min_of( Fraction.new(22, 7), "3/7")
      %Fraction{num: 3, den: 7}

      iex> Fraction.min_of(0.5, Fraction.new(-3, 5))
      %Fraction{num: -3, den: 5}
      
      iex> Fraction.min_of(Fraction.new(3), "22/7")
      %Fraction{num: 3, den: 1}

  """
  def min_of(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    if Fraction.lte?(fraction_a, fraction_b) do
      fraction_a
    else
      fraction_b
    end
  end

  def min_of(%Fraction{} = fraction_a, int) when is_integer(int), do: min_of(fraction_a, new(int))
  def min_of(int, %Fraction{} = fraction_b) when is_integer(int), do: min_of(new(int), fraction_b)

  def min_of(%Fraction{} = fraction_a, str) when is_binary(str), do: min_of(fraction_a, new(str))
  def min_of(str, %Fraction{} = fraction_b) when is_binary(str), do: min_of(new(str), fraction_b)

  def min_of(%Fraction{} = fraction_a, f) when is_float(f), do: min_of(fraction_a, new(f))
  def min_of(f, %Fraction{} = fraction_b) when is_float(f), do: min_of(new(f), fraction_b)

  @doc """
  Return the maximum value in a list of fractions or values. Relative comparisons are calculated based on float
  converion of fractions.

  **Supports Type Coercion?**: ✅

  ## Example

      iex> Fraction.max_of([ Fraction.new(3, 7), Fraction.new(5, 11), Fraction.new(11, 23)])
      %Fraction{num: 11, den: 23}

  """
  def max_of([]), do: nil

  def max_of(list) do
    list |> fractionalize() |> Enum.max_by(&to_float/1)
  end

  @doc """
  Return the larger of two fractions or values.

  **Supports Type Coercion?**: ✅

  ## Example

      iex> Fraction.max_of( Fraction.new(3, 7), Fraction.new(11, 28) )
      %Fraction{num: 3, den: 7}
      
      iex> Fraction.max_of(Fraction.new(4, 3), 8.3)
      %Fraction{num: 83, den: 10}

  """
  def max_of(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    if Fraction.gte?(fraction_a, fraction_b) do
      fraction_a
    else
      fraction_b
    end
  end

  def max_of(%Fraction{} = fraction_a, int) when is_integer(int), do: max_of(fraction_a, new(int))
  def max_of(int, %Fraction{} = fraction_b) when is_integer(int), do: max_of(new(int), fraction_b)

  def max_of(%Fraction{} = fraction_a, str) when is_binary(str), do: max_of(fraction_a, new(str))
  def max_of(str, %Fraction{} = fraction_b) when is_binary(str), do: max_of(new(str), fraction_b)

  def max_of(%Fraction{} = fraction_a, f) when is_float(f), do: max_of(fraction_a, new(f))
  def max_of(f, %Fraction{} = fraction_b) when is_float(f), do: max_of(new(f), fraction_b)

  @doc """
  Return a tuple with the smallest and largest fractions from a list.

  **Supports Type Coercion?**: ✅

  ## Example

      iex> Fraction.min_max_of([ Fraction.new(3, 7), Fraction.new(5, 11), Fraction.new(11, 23)])
      { %Fraction{num: 3, den: 7}, %Fraction{num: 11, den: 23} }

  """
  def min_max_of([]), do: {nil, nil}

  def min_max_of(list) do
    list |> fractionalize() |> Enum.min_max_by(&to_float/1)
  end

  @doc """
  Take a mixed list of fraction representations %Fraction{}, integer, float,
  string, etc), and convert all to fractions. This is _not_ a normalization
  process - the resulting fractions are not guaranteed to share a denominator.

  **Supports Type Coercion?**: ✅

  ## Example

      iex> fractionalize([%Fraction{num: 3, den: 4}, 12, 0.25, "22/7", "4"])
      [%Fraction{num: 3, den: 4}, %Fraction{num: 12, den: 1}, %Fraction{num: 25, den: 100}, %Fraction{num: 22, den: 7}, %Fraction{num: 4, den: 1}]

  """
  def fractionalize(candidates) when is_list(candidates) do
    candidates
    |> Enum.map(&new/1)
  end

  @doc """
  Compare a fraction with a value or fraction using _greater than_ comparison.

  **Supports Type Coercion?**: ✅

  ## Examples

      iex> Fraction.gt?(Fraction.new(7, 9), Fraction.new(3, 5))
      true

      iex> Fraction.gt?(3, Fraction.new(15, 4))
      false

      iex> Fraction.gt?(Fraction.new(-3, 12), -2)
      true
  """

  def gt?(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    {norm_a, norm_b} = normalize(fraction_a, fraction_b)
    norm_a.num > norm_b.num
  end

  def gt?(%Fraction{} = fraction_a, int) when is_integer(int),
    do: gt?(fraction_a, Fraction.new(int))

  def gt?(int, %Fraction{} = fraction_b) when is_integer(int),
    do: gt?(Fraction.new(int), fraction_b)

  def gt?(%Fraction{} = fraction_a, str) when is_binary(str), do: gt?(fraction_a, new(str))
  def gt?(str, %Fraction{} = fraction_b) when is_binary(str), do: gt?(new(str), fraction_b)

  def gt?(%Fraction{} = fraction_a, f) when is_float(f), do: gt?(fraction_a, new(f))
  def gt?(f, %Fraction{} = fraction_b) when is_float(f), do: gt?(new(f), fraction_b)

  def gt?(%Fraction{} = fraction_a, tup) when is_tuple(tup), do: gt?(fraction_a, new(tup))
  def gt?(tup, %Fraction{} = fraction_b) when is_tuple(tup), do: gt?(new(tup), fraction_b)

  @doc """
  Compare a fraction with a value or fraction using _greater than or equal_ comparison.

  **Supports Type Coercion?**: ✅

  ## Examples

      iex> Fraction.gte?(Fraction.new(3, 9), Fraction.new(1, 3))
      true

      iex> Fraction.gte?(3, Fraction.new(15, 4))
      false

      iex> Fraction.gte?(Fraction.new(-3, 12), -2)
      true
  """
  def gte?(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    {norm_a, norm_b} = normalize(fraction_a, fraction_b)
    norm_a.num >= norm_b.num
  end

  def gte?(%Fraction{} = fraction_a, int) when is_integer(int),
    do: gte?(fraction_a, Fraction.new(int))

  def gte?(int, %Fraction{} = fraction_b) when is_integer(int),
    do: gte?(Fraction.new(int), fraction_b)

  def gte?(%Fraction{} = fraction_a, str) when is_binary(str), do: gte?(fraction_a, new(str))
  def gte?(str, %Fraction{} = fraction_b) when is_binary(str), do: gte?(new(str), fraction_b)

  def gte?(%Fraction{} = fraction_a, f) when is_float(f), do: gte?(fraction_a, new(f))
  def gte?(f, %Fraction{} = fraction_b) when is_float(f), do: gte?(new(f), fraction_b)

  def gte?(%Fraction{} = fraction_a, tup) when is_tuple(tup), do: gte?(fraction_a, new(tup))
  def gte?(tup, %Fraction{} = fraction_b) when is_tuple(tup), do: gte?(new(tup), fraction_b)

  @doc """
  Compare a fraction with a value or fraction using _less than_ comparison.

  **Supports Type Coercion?**: ✅

  ## Examples

      iex> Fraction.lt?(Fraction.new(7, 9), Fraction.new(3, 5))
      false

      iex> Fraction.lt?(3, Fraction.new(15, 4))
      true

      iex> Fraction.lt?(Fraction.new(-3, 12), -2)
      false
  """
  def lt?(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    {norm_a, norm_b} = normalize(fraction_a, fraction_b)
    norm_a.num < norm_b.num
  end

  def lt?(%Fraction{} = fraction_a, int) when is_integer(int),
    do: lt?(fraction_a, Fraction.new(int))

  def lt?(int, %Fraction{} = fraction_b) when is_integer(int),
    do: lt?(Fraction.new(int), fraction_b)

  def lt?(%Fraction{} = fraction_a, str) when is_binary(str), do: lt?(fraction_a, new(str))
  def lt?(str, %Fraction{} = fraction_b) when is_binary(str), do: lt?(new(str), fraction_b)

  def lt?(%Fraction{} = fraction_a, f) when is_float(f), do: lt?(fraction_a, new(f))
  def lt?(f, %Fraction{} = fraction_b) when is_float(f), do: lt?(new(f), fraction_b)

  def lt?(%Fraction{} = fraction_a, tup) when is_tuple(tup), do: lt?(fraction_a, new(tup))
  def lt?(tup, %Fraction{} = fraction_b) when is_tuple(tup), do: lt?(new(tup), fraction_b)

  @doc """
  Compare a fraction with a value or fraction using _less than or equal_ comparison.

  **Supports Type Coercion?**: ✅

  ## Examples

      iex> Fraction.lte?(Fraction.new(7, 9), Fraction.new(3, 5))
      false

      iex> Fraction.lte?(3, Fraction.new(15, 4))
      true

      iex> Fraction.lte?(Fraction.new(-24, 12), -2)
      true
  """
  def lte?(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    {norm_a, norm_b} = normalize(fraction_a, fraction_b)
    norm_a.num <= norm_b.num
  end

  def lte?(%Fraction{} = fraction_a, int) when is_integer(int),
    do: lte?(fraction_a, Fraction.new(int))

  def lte?(int, %Fraction{} = fraction_b) when is_integer(int),
    do: lte?(Fraction.new(int), fraction_b)

  def lte?(%Fraction{} = fraction_a, str) when is_binary(str), do: lte?(fraction_a, new(str))
  def lte?(str, %Fraction{} = fraction_b) when is_binary(str), do: lte?(new(str), fraction_b)

  def lte?(%Fraction{} = fraction_a, f) when is_float(f), do: lte?(fraction_a, new(f))
  def lte?(f, %Fraction{} = fraction_b) when is_float(f), do: lte?(new(f), fraction_b)

  def lte?(%Fraction{} = fraction_a, tup) when is_tuple(tup), do: lte?(fraction_a, new(tup))
  def lte?(tup, %Fraction{} = fraction_b) when is_tuple(tup), do: lte?(new(tup), fraction_b)

  @doc """
  Compare a fraction with a value or fraction using _equals_ comparison.

  **Supports Type Coercion?**: ✅

  ## Examples

      iex> Fraction.eq?(Fraction.new(7, 9), Fraction.new(3, 5))
      false

      iex> Fraction.eq?(3, Fraction.new(12, 4))
      true

      iex> Fraction.eq?(Fraction.new(-3, 12), -2)
      false
  """
  def eq?(%Fraction{} = fraction_a, %Fraction{} = fraction_b) do
    {norm_a, norm_b} = normalize(fraction_a, fraction_b)
    norm_a.num == norm_b.num
  end

  def eq?(%Fraction{} = fraction_a, int) when is_integer(int),
    do: eq?(fraction_a, Fraction.new(int))

  def eq?(int, %Fraction{} = fraction_b) when is_integer(int),
    do: eq?(Fraction.new(int), fraction_b)

  def eq?(%Fraction{} = fraction_a, str) when is_binary(str), do: eq?(fraction_a, new(str))
  def eq?(str, %Fraction{} = fraction_b) when is_binary(str), do: eq?(new(str), fraction_b)

  def eq?(%Fraction{} = fraction_a, f) when is_float(f), do: eq?(fraction_a, new(f))
  def eq?(f, %Fraction{} = fraction_b) when is_float(f), do: eq?(new(f), fraction_b)

  def eq?(%Fraction{} = fraction_a, tup) when is_tuple(tup), do: eq?(fraction_a, new(tup))
  def eq?(tup, %Fraction{} = fraction_b) when is_tuple(tup), do: eq?(new(tup), fraction_b)

  @doc """
  Determine if a fraction is negative.

  ## Examples

      iex> Fraction.new(-3, 4) |> Fraction.is_negative?()
      true
  """
  def is_negative?(%Fraction{num: num}) when num < 0, do: true
  def is_negative?(_), do: false

  @doc """
  Determine if a fraction is positive.

  ## Examples

      iex> Fraction.new(-3, 4) |> Fraction.is_positive?()
      false
  """
  def is_positive?(%Fraction{num: num}) when num >= 0, do: true
  def is_positive?(_), do: false

  @doc """
  Does a fraction represent a zero value?

  ## Examples

      iex> Fraction.new(3, 134) |> Fraction.is_zero?()
      false

      iex> Fraction.new(0, 34) |> Fraction.is_zero?()
      true

  """
  def is_zero?(%Fraction{} = fraction), do: fraction.num == 0

  @doc """
  Determine if the n-th root of a number is a whole integer.

  If the result n-th root is within `epsilon` of a whole
  integer, we consider the result an integer n-th root. 
  This calcualtion runs the fast converging n-th root at a higher
  epsilon than it's configured to use for comparison and testing of the
  result value. 

  ## Options

   - `epsilon` - **Float**. Default `1.0e-6`. Error bounds for calculating float equality.

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
  Compare two floating points number using an epsilon error boundary.

  ## Example

      iex> floats_equal?(3.11, 3.1)
      false

      iex> floats_equal?(3.11, 3.1, 0.05)
      true
  """
  def floats_equal?(a, b, epsilon \\ 1.0e-6) do
    abs(a - b) < epsilon
  end

  @doc """
  Generalized integer nth root, from:

      https://github.com/acmeism/RosettaCodeData/blob/master/Task/Nth-root/Elixir/nth-root.elixir

  based on a fast converging Newton's Method process.

  ## Options

   - `precision` - **Float**. Default `1.0e-7`. Precision to which root is calculated.

  ## Examples

      iex> nth_root(8, 3)
      2.0

      iex> nth_root(27, 3)
      3.0

      iex> nth_root(78125, 7)
      5.0
  """
  def nth_root(x, n, precision \\ 1.0e-7) do
    f = fn prev ->
      ((n - 1) * prev + x / :math.pow(prev, n - 1)) / n
    end

    fixed_point(f, x, precision, f.(x))
  end

  defp fixed_point(_, guess, tolerance, next) when abs(guess - next) < tolerance, do: next
  defp fixed_point(f, _, tolerance, next), do: fixed_point(f, next, tolerance, f.(next))

  @doc """
  Find the **least common multiple** of two integers or a list of integers.

  ## Example

      iex> lcm(5, 7)
      35
      
      iex> lcm([3, 5, 7, 11, 13, 17])
      255255
  """
  def lcm([a, b]), do: lcm(a, b)
  def lcm([a | rest]), do: lcm(a, lcm(rest))
  def lcm(a, b) when is_integer(a) and is_integer(b), do: div(abs(a * b), Integer.gcd(a, b))
end
