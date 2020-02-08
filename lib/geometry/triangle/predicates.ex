defmodule Chunky.Geometry.Triangle.Predicates do
  @moduledoc """
  Predicate functions take a single triangle as an argument, and return a boolean, an assessment of some
  characteristic of the triangle. Predicate functions will, in almost every possible case, return a boolean,
  even in situations that would normally throw an error (like invalid triangles).

  ## Analyzing Triangles

  Most often using individual predicates is the right approach. Sometimes, though, it can be useful to inspect
  a wider set of properties about a triangle. The `analyze/2` function applies all of the predicate functions
  for triangles against the provided triangle.

   - `analyze/2` - Assess properties of a triangle


  ## Shape

  Properties of the edges of a triangle:

   - `is_equilateral?/1` - Is a triangle an equilateral triangle?
   - `is_isoceles?/1` - Is a triangle an isoceles triangle?
   - `is_pythagorean_triangle?/1` - Is the given triangle a right triangle with integer sides?
   - `is_scalene?/1` - Is a triangle a scalene triangle?

  Properties of the angles of a triangle:

   - `is_acute?/1` - Are all of the interior angles equal or less than 90 degrees?
   - `is_obtuse?/1` - Are any of the interior angles greater than 90 degrees?

  ## Heronian Properties
     
  Basic heronian triangles:

   - `is_almost_equilateral_heronian_triangle?/1` - Heronian triangle with sides `n - 1`, `n`, `n + 1`
   - `is_heronian_triangle?/1` - Is a triangle a _heronian_ triangle, with integer sides and integer area?
   - `is_super_heronian_triangle?/1` - Does a triangle have integer sides, integer area, and a perimeter equal to area?

  An extension of _super_ heronian triangles, heronian triangles with areas that are a specific multiple of the
  perimeter:

   - `is_2_heronian_triangle?/1` - Is a triangle heronian, with area 2 times perimeter?
   - `is_3_heronian_triangle?/1` - Is a triangle heronian, with area 3 times perimeter?
   - `is_4_heronian_triangle?/1` - Is a triangle heronian, with area 4 times perimeter?
   - `is_5_heronian_triangle?/1` - Is a triangle heronian, with area 5 times perimeter?
   - `is_6_heronian_triangle?/1` - Is a triangle heronian, with area 6 times perimeter?
   - `is_7_heronian_triangle?/1` - Is a triangle heronian, with area 7 times perimeter?
   - `is_8_heronian_triangle?/1` - Is a triangle heronian, with area 8 times perimeter?
   - `is_9_heronian_triangle?/1` - Is a triangle heronian, with area 9 times perimeter?
   - `is_10_heronian_triangle?/1` - Is a triangle heronian, with area 10 times perimeter?
   - `is_20_heronian_triangle?/1` - Is a triangle heronian, with area 20 times perimeter?
   - `is_30_heronian_triangle?/1` - Is a triangle heronian, with area 30 times perimeter?
   - `is_40_heronian_triangle?/1` - Is a triangle heronian, with area 40 times perimeter?
   - `is_50_heronian_triangle?/1` - Is a triangle heronian, with area 50 times perimeter?
   - `is_60_heronian_triangle?/1` - Is a triangle heronian, with area 60 times perimeter?
   - `is_70_heronian_triangle?/1` - Is a triangle heronian, with area 70 times perimeter?
   - `is_80_heronian_triangle?/1` - Is a triangle heronian, with area 80 times perimeter?
   - `is_90_heronian_triangle?/1` - Is a triangle heronian, with area 90 times perimeter?
   - `is_100_heronian_triangle?/1` - Is a triangle heronian, with area 100 times perimeter?

  ## Composability

   - `is_decomposable?/1` - Can a triangle be decomposed into two, smaller, right triangles?
   - `is_indecomposable?/1` - Can a triangle _not_ be decomposed into two, smaller, right triangles?

  """

  import Chunky.Geometry

  import Chunky.Geometry.Triangle,
    only: [
      angles: 1,
      area: 1,
      decompose: 1,
      is_multiple_heronian_triangle?: 2,
      normalize: 1
    ]

  @doc """
  Apply all of the Triangle predicte functions to the triangel `t`, and collect the
  passing, or true, predicates.

  This function uses the names of all of the predicate functions as sources for labels, and collects
  the resulting labels from a triangle being analyzed.

  Some predicate functions can take a long time to run depending on the shape or properties of the triangle `t`, so the `analyze/2` function
  uses a timeout for each predicate. See the `predicate_wait_time` option for more details. 

  ## Options 

   - `predicate_wait_time` - Integer, default `100`. Maximum number of milliseconds to wait for an answer from each predicate function

  ## Examples

      iex> Triangle.Predicates.analyze({3, 4, 5})
      [:acute, :almost_equilateral_heronian_triangle, :heronian_triangle, :indecomposable, :pythagorean_triangle, :scalene]

      iex> Triangle.Predicates.analyze({4, 5, 10})
      [:invalid_triangle]

      iex> Triangle.Predicates.analyze({5, 5, 5})
      [:acute, :equilateral, :indecomposable]

      iex> Triangle.Predicates.analyze({53, 54, 55})
      [:acute, :indecomposable, :scalene]

      iex> Triangle.Predicates.analyze({10, 13, 13})
      [:acute, :decomposable, :heronian_triangle, :isoceles]

      iex> Triangle.Predicates.analyze({477, 477, 504})
      [:"70_heronian_triangle", :acute, :decomposable, :heronian_triangle, :isoceles]

  """
  def analyze(t, opts \\ []) when is_triangle?(t) do
    # how long are we waiting for each predicate
    wait_time = opts |> Keyword.get(:predicate_wait_time, 100)

    # what functions are we skipping?
    skip_list = []
    skip_set = MapSet.new(skip_list)

    if is_valid_triangle?(t) do
      # find all predicates
      Chunky.Geometry.Triangle.Predicates.__info__(:functions)
      |> Enum.filter(fn {func, arity} ->
        # take these apart and find is_*?/1 functions
        f_name = func |> Atom.to_string()

        String.starts_with?(f_name, "is_") && String.ends_with?(f_name, "?") && arity == 1
      end)

      # reject anything in our skip set
      |> Enum.reject(fn {func, _arity} -> skip_set |> MapSet.member?(func) end)
      # map to funct/name pairs
      |> Enum.map(fn {func, _arity} ->
        f_atom = func |> Atom.to_string() |> String.slice(3..-2) |> String.to_atom()
        {func, f_atom}
      end)

      # apply and filter
      |> Enum.filter(fn {func, _name} ->
        pred_task =
          Task.async(fn ->
            apply(Chunky.Geometry.Triangle.Predicates, func, [t])
          end)

        case Task.yield(pred_task, wait_time) || Task.shutdown(pred_task) do
          {:ok, result} ->
            # ran to completion
            result

          nil ->
            # timed out
            false
        end
      end)

      # map to names
      |> Enum.map(fn {_func, name} -> name end)
      |> Enum.sort()
    else
      [:invalid_triangle]
    end
  end

  @doc """
  Is a triangle `2-heronian`, a triangle with an area 2 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_2_heronian_triangle?({13, 14, 15})
      true

      iex> Triangle.Predicates.is_2_heronian_triangle?({11, 25, 30})
      true

  """
  def is_2_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 2)
  end

  @doc """
  Is a triangle `3-heronian`, a triangle with an area 3 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_3_heronian_triangle?({25, 26, 17})
      true

      iex> Triangle.Predicates.is_3_heronian_triangle?({25, 28, 17})
      true

  """
  def is_3_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 3)
  end

  @doc """
  Is a triangle `4-heronian`, a triangle with an area 4 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_4_heronian_triangle?({30, 30, 48})
      true

      iex> Triangle.Predicates.is_4_heronian_triangle?({18, 80, 82})
      true

  """
  def is_4_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 4)
  end

  @doc """
  Is a triangle `5-heronian`, a triangle with an area 5 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_5_heronian_triangle?({30, 40, 50})
      true

      iex> Triangle.Predicates.is_5_heronian_triangle?({45, 50, 85})
      true

  """
  def is_5_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 5)
  end

  @doc """
  Is a triangle `6-heronian`, a triangle with an area 6 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_6_heronian_triangle?({33, 56, 65})
      true

      iex> Triangle.Predicates.is_6_heronian_triangle?({34, 61, 75})
      true

  """
  def is_6_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 6)
  end

  @doc """
  Is a triangle `7-heronian`, a triangle with an area 7 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_7_heronian_triangle?({42, 56, 70})
      true

      iex> Triangle.Predicates.is_7_heronian_triangle?({35, 84, 91})
      true

  """
  def is_7_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 7)
  end

  @doc """
  Is a triangle `8-heronian`, a triangle with an area 8 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_8_heronian_triangle?({52, 56, 60})
      true

      iex> Triangle.Predicates.is_8_heronian_triangle?({41, 84, 85})
      true

  """
  def is_8_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 8)
  end

  @doc """
  Is a triangle `9-heronian`, a triangle with an area 9 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_9_heronian_triangle?({52, 73, 75})
      true

      iex> Triangle.Predicates.is_9_heronian_triangle?({54, 72, 90})
      true

  """
  def is_9_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 9)
  end

  @doc """
  Is a triangle `10-heronian`, a triangle with an area 10 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_10_heronian_triangle?({65, 70, 75})
      true

      iex> Triangle.Predicates.is_10_heronian_triangle?({65, 72, 97})
      true

  """
  def is_10_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 10)
  end

  @doc """
  Is a triangle `20-heronian`, a triangle with an area 20 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_20_heronian_triangle?({130, 140, 150})
      true

      iex> Triangle.Predicates.is_20_heronian_triangle?({125, 145, 180})
      true

  """
  def is_20_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 20)
  end

  @doc """
  Is a triangle `30-heronian`, a triangle with an area 30 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_30_heronian_triangle?({195, 210, 225})
      true

      iex> Triangle.Predicates.is_30_heronian_triangle?({200, 200, 240})
      true

  """
  def is_30_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 30)
  end

  @doc """
  Is a triangle `40-heronian`, a triangle with an area 40 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_40_heronian_triangle?({267, 278, 289})
      true

      iex> Triangle.Predicates.is_40_heronian_triangle?({260, 280, 300})
      true

  """
  def is_40_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 40)
  end

  @doc """
  Is a triangle `50-heronian`, a triangle with an area 50 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_50_heronian_triangle?({325, 350, 375})
      true

      iex> Triangle.Predicates.is_50_heronian_triangle?({300, 390, 390})
      true

  """
  def is_50_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 50)
  end

  @doc """
  Is a triangle `60-heronian`, a triangle with an area 60 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_60_heronian_triangle?({408, 416, 424})
      true

      iex> Triangle.Predicates.is_60_heronian_triangle?({389, 425, 444})
      true

  """
  def is_60_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 60)
  end

  @doc """
  Is a triangle `70-heronian`, a triangle with an area 70 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_70_heronian_triangle?({477, 477, 504})
      true

      iex> Triangle.Predicates.is_70_heronian_triangle?({456, 481, 545})
      true

  """
  def is_70_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 70)
  end

  @doc """
  Is a triangle `80-heronian`, a triangle with an area 80 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_80_heronian_triangle?({534, 556, 578})
      true

      iex> Triangle.Predicates.is_80_heronian_triangle?({520, 560, 600})
      true

  """
  def is_80_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 80)
  end

  @doc """
  Is a triangle `90-heronian`, a triangle with an area 90 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_90_heronian_triangle?({612, 624, 636})
      true

      iex> Triangle.Predicates.is_90_heronian_triangle?({546, 690, 696})
      true

  """
  def is_90_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 90)
  end

  @doc """
  Is a triangle `100-heronian`, a triangle with an area 100 times it's perimeter?

  See also:

   - `Chunky.Geometry.Triangle.is_multiple_heronian?/2`

  ## Examples

      iex> Triangle.Predicates.is_100_heronian_triangle?({650, 700, 750})
      true

      iex> Triangle.Predicates.is_100_heronian_triangle?({663, 678, 765})
      true

  """
  def is_100_heronian_triangle?(t) when is_triangle?(t) do
    is_multiple_heronian_triangle?(t, 100)
  end

  @doc """
  Are all of the interior angles of a triangle equal to or smaller than 90 degrees?

  ## Examples

      iex> Triangle.Predicates.is_acute?({5, 5, 5})
      true

      iex> Triangle.Predicates.is_acute?({35, 5, 35})
      true

      iex> Triangle.Predicates.is_acute?({35, 19, 19})
      false

      iex> Triangle.Predicates.is_acute?({15, 16, 17})
      true

  """
  def is_acute?(t) when is_triangle?(t) do
    angles(t)
    |> Tuple.to_list()
    |> Enum.all?(fn a -> a <= 90.0 end)
  end

  @doc """
  An _almost_ equilateral heronian triangle has sequentially sized integer sides and an integer area.

  Sometimes called _super heronian_ (which is a different contruction in this library), parker triangles,
  or almost equilaterals, these are integer triangles with sequential increasing sides, like `{3, 4, 5}`.

  ## Examples

      iex> Triangle.Predicates.is_almost_equilateral_heronian_triangle?({3, 4, 5})
      true

      iex> Triangle.Predicates.is_almost_equilateral_heronian_triangle?({51, 52, 53})
      true

      iex> Triangle.Predicates.is_almost_equilateral_heronian_triangle?({53, 54, 55})
      false

      iex> Triangle.Predicates.is_almost_equilateral_heronian_triangle?({3, 7, 9})
      false

  """
  def is_almost_equilateral_heronian_triangle?(t) when is_triangle?(t) do
    {a, b, c} = normalize(t)
    a == b - 1 && b == c - 1 && is_heronian_triangle?(t)
  end

  @doc """
  Is a triangle decomposable into two smaller right triangles?

  See also: 

   - `Chunky.Geometry.Triangle.decompose/1`
   - `is_indecomposable?/1`

  ## Examples

      iex> Triangle.Predicates.is_decomposable?({6, 6, 6})
      false

      iex> Triangle.Predicates.is_decomposable?({10, 13, 13})
      true

      iex> Triangle.Predicates.is_decomposable?({13, 14, 15})
      true

  """
  def is_decomposable?(t) when is_triangle?(t) do
    case decompose(t) do
      {:ok, _, _} -> true
      _ -> false
    end
  end

  @doc """
  Is the provided triangle an equilateral triangle?

  ## Examples

      iex> Triangle.Predicates.is_equilateral?({5, 5, 5})
      true

      iex> Triangle.Predicates.is_equilateral?({3, 4, 5})
      false

      iex> Triangle.Predicates.is_equilateral?({15, 5, 15})
      false

      iex> Triangle.Predicates.is_equilateral?({0, 0, 0})
      ** (FunctionClauseError) no function clause matching in Chunky.Geometry.Triangle.Predicates.is_equilateral?/1

      iex> Triangle.Predicates.is_equilateral?({-5, 5, 5})
      ** (FunctionClauseError) no function clause matching in Chunky.Geometry.Triangle.Predicates.is_equilateral?/1

  """
  def is_equilateral?(t = {a, b, c}) when is_triangle?(t) do
    a == b && b == c
  end

  @doc """
  Is a triangle a _heronian_ triangle, one with integer sides and integer area?

  ## Examples

      iex> Triangle.Predicates.is_heronian_triangle?({3, 4, 5})
      true

      iex> Triangle.Predicates.is_heronian_triangle?({5, 6, 7})
      false

      iex> Triangle.Predicates.is_heronian_triangle?({17, 16, 17})
      true

      iex> Triangle.Predicates.is_heronian_triangle?({41, 41, 80})
      true

      iex> Triangle.Predicates.is_heronian_triangle?({30, 5, 29})
      true

  """
  def is_heronian_triangle?(t) when is_triangle?(t) do
    is_valid_triangle?(t) &&
      case area(t) do
        {:integer, _} -> true
        _ -> false
      end
  end

  @doc """
  Is a triangle decomposable into two smaller right triangles?

  See also: 

   - `Chunky.Geometry.Triangle.decompose/1`
   - `is_decomposable?/1`

  ## Examples

      iex> Triangle.Predicates.is_indecomposable?({6, 6, 6})
      true

      iex> Triangle.Predicates.is_indecomposable?({10, 13, 13})
      false

      iex> Triangle.Predicates.is_indecomposable?({13, 14, 15})
      false

  """
  def is_indecomposable?(t) when is_triangle?(t) do
    case decompose(t) do
      {:ok, _, _} -> false
      _ -> true
    end
  end

  @doc """
  Is the triangle an isoceles triangle, a triangle with two equal sides?

  ## Examples

      iex> Triangle.Predicates.is_isoceles?({5, 5, 5})
      false

      iex> Triangle.Predicates.is_isoceles?({15, 5, 15})
      true

      iex> Triangle.Predicates.is_isoceles?({5, 15, 25})
      false

      iex> Triangle.Predicates.is_isoceles?({5, 25, 25})
      true
      
  """
  def is_isoceles?(t = {a, b, c}) when is_triangle?(t) do
    is_equilateral?(t) == false && (a == b || b == c || a == c)
  end

  @doc """
  Are any of the interior angles of a triangle greater than 90 degrees?

  ## Examples

      iex> Triangle.Predicates.is_obtuse?({5, 5, 5})
      false

      iex> Triangle.Predicates.is_obtuse?({35, 5, 35})
      false

      iex> Triangle.Predicates.is_obtuse?({35, 19, 19})
      true

      iex> Triangle.Predicates.is_obtuse?({15, 16, 17})
      false

  """
  def is_obtuse?(t) when is_triangle?(t) do
    angles(t)
    |> Tuple.to_list()
    |> Enum.any?(fn a -> a > 90.0 end)
  end

  @doc """
  Is the given triangle a _right triangle_ with integer sides?

  ## Examples

      iex> Triangle.Predicates.is_pythagorean_triangle?({5, 5, 5})
      false

      iex> Triangle.Predicates.is_pythagorean_triangle?({10, 24, 26})
      true

      iex> Triangle.Predicates.is_pythagorean_triangle?({24, 10, 26})
      true

      iex> Triangle.Predicates.is_pythagorean_triangle?({3, 4, 5})
      true

      iex> Triangle.Predicates.is_pythagorean_triangle?({4, 5, 3})
      true

      iex> Triangle.Predicates.is_pythagorean_triangle?({4, 5, 6})
      false

  """
  def is_pythagorean_triangle?(t = {a, b, c}) when is_triangle?(t) do
    hyp = Enum.max([a, b, c])

    edges =
      ([a, b, c] -- [hyp])
      |> Enum.map(fn v -> v * v end)
      |> Enum.sum()

    edges == hyp * hyp
  end

  @doc """
  Is the triangle a scalene triangle, a triangle with three different length sides?

  ## Examples

      iex> Triangle.Predicates.is_scalene?({5, 5, 5})
      false

      iex> Triangle.Predicates.is_scalene?({15, 15, 5})
      false

      iex> Triangle.Predicates.is_scalene?({5, 15, 25})
      true

      iex> Triangle.Predicates.is_scalene?({15, 5, 35})
      true

  """
  def is_scalene?(t = {a, b, c}) when is_triangle?(t) do
    a != b && b != c && a != c
  end

  @doc """
  Is a triangle _super heronian_, a triangle with integer area and perimeter that are equal?

  Not to be confused with _almost equilateral heronians_, which are also sometimes called super
  heronian triangles. In our definition, the super heronian triangles have an integer area and
  perimeter that are equal. This is a finite set:

   - `{5, 12, 13}`
   - `{6, 8, 10}`
   - `{6, 25, 29}`
   - `{7, 15, 20}`
   - `{9, 10, 17}`

  ## Examples

      iex> Triangle.Predicates.is_super_heronian_triangle?({5, 12, 13})
      true

      iex> Triangle.Predicates.is_super_heronian_triangle?({5, 12, 15})
      false

      iex> Triangle.Predicates.is_super_heronian_triangle?({3, 4, 5})
      false

      iex> Triangle.Predicates.is_super_heronian_triangle?({6, 29, 25})
      true

  """
  def is_super_heronian_triangle?(t = {a, b, c}) when is_triangle?(t) do
    case area(t) do
      {:integer, ta} -> ta == a + b + c
      _ -> false
    end
  end
end
