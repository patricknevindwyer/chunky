defmodule Chunky.Geometry.Triangle do
   @moduledoc """
   Functions for working with geometric shapes.
      
   ## Integer Triangles
   
    - `area/1` - Find the area of any triangle
    - `decompose/1` - Break a triangle into two smaller right triangles
    - `height/2` - Find the bisecting height of a triangle
    - `is_almost_equilateral_heronian_triangle?/1` - Heronian triangle with sides `n - 1`, `n`, `n + 1`
    - `is_equilateral?/1` - Is a triangle an equilateral triangle?
    - `is_heronian_triangle?/1` - Is a triangle a _heronian_ triangle, with integer sides and integer area?
    - `is_isoceles?/1` - Is a triangle an isoceles triangle?
    - `is_multiple_heronian_triangle?/2` - Is a triangle a heronian triange with an area that is a specific multiple of the perimeter?
    - `is_pythagorean_triangle?/1` - Is the given triangle a right triangle with integer sides?
    - `is_scalene?/1` - Is a triangle a scalene triangle?
    - `is_super_heronian_triangle?/1` - Does a triangle have integer sides, integer area, and a perimeter equal to area?
    - `normalize/1` - Normalize the ordering of sides of a triangle
    - `triangles_from_hypotenuse/2` - Generate integer triangles given a hypotenuse and optional filter
    - `type/1` - Determine the basic type, or form, of a triangle
   
   """
   import Chunky.Geometry

   alias Chunky.Fraction
   alias Chunky.Math
   
   @doc """
   Find the area of a triangle, returning either an integer, float, or fraction value.
   
   This function uses the heronian formula for calculating the area of any triangle.
   
   ## Examples
   
       iex> Triangle.area({3, 4, 5})
       {:integer, 6}
   
       iex> Triangle.area({5, 15, 15})
       {:float, 36.9754986443726}

       iex> Triangle.area({5, 5, 5})
       {:float, 10.825317547305483}

       iex> Triangle.area({7, 11, 13})
       {:float, 38.499188303131795}
   
       iex> Triangle.area({5, 12, 13})
       {:integer, 30}
   
       iex> Triangle.area({5, 10, 20})
       ** (ArgumentError) Shape of the triangle is invalid
       
   
   """
   def area(t={a, b, c}) when is_triangle?(t) do
       
       if is_valid_triangle?(t) == false do
           raise ArgumentError, message: "Shape of the triangle is invalid"
       end
       
       # find the semi-perimeter
       semi_p = Fraction.new("1/2") |> Fraction.multiply(a + b + c)
       
       # build the inner values
       sub_a = semi_p |> Fraction.subtract(a)
       sub_b = semi_p |> Fraction.subtract(b)
       sub_c = semi_p |> Fraction.subtract(c)
       
       # before our square root
       pre_root = semi_p |> Fraction.multiply(sub_a) |> Fraction.multiply(sub_b) |> Fraction.multiply(sub_c)
       
       # now find our root
       case pre_root |> Fraction.power(Fraction.new("1/2"), allow_irrational: true) do
          %Fraction{}=res ->  
              if Fraction.is_whole?(res) do
                  {:integer, Fraction.get_whole(res)}
              else
                  {:fractional, res |> Fraction.simplify()}
              end       
              
          v when is_float(v) -> {:float, v}
       end
       
   end
   
   @doc """
   Decompose an integer triangle into two smaller integer right triangles.
   
   ## Examples
   
       iex> Triangle.decompose({3, 4, 5})
       {:error, :indecomposable}

       iex> Triangle.decompose({6, 6, 6})
       {:error, :indecomposable}

       iex> Triangle.decompose({10, 13, 13})
       {:ok, {5, 12, 13}, {5, 12, 13}}

       iex> Triangle.decompose({13, 14, 15})
       {:ok, {5, 12, 13}, {9, 12, 15}}
   
   """
   def decompose(t) when is_triangle?(t) do
       
       {a, b, c} = normalize(t)
       
       case type(t) do
           
           # most of our cases are indecomposable
           :invalid -> {:error, :indecomposable}
           :right -> {:error, :indecomposable}
           :equilateral -> {:error, :indecomposable}
           
           # isoceles triangles can be decomposed if the height
           # and base/2 are both integers
           :isoceles ->
               case height(t) do
                   
                   {:integer, h} -> 
                       if rem(a, 2) == 0 do
                           {:ok, {div(a, 2), h, c} |> normalize(), {div(a, 2), h, c} |> normalize()}
                       else
                           {:error, :indecomposable}
                       end
                       
                   _ -> 
                       {:error, :indecomposable}
                       
               end
               
           # scalenes can be decomposed if we have an integer height, and can find
           # appropriate bases for each right triangle. A scalene may have an integer
           # height (and decomposability) from a base other than the hypotenuse
           :scalene ->
               
               # find which side of the scalene has an integer base
               case scalene_base(t) do
                   
                   :none ->
                       {:error, :indecomposable}
                   
                   {base, h} ->
                       
                       # determine which side are our decomposed hypotenuses
                       {a_h, b_h} = case base do
                          :small -> {b, c} 
                          :medium -> {a, c}
                          :large -> {a, b}
                       end
                       
                       # now try and form the right triangles
                       case {right_triangle_from(a_h, h), right_triangle_from(b_h, h)} do
                          {nil, _} -> {:error, :indecomposable}
                          {_, nil} -> {:error, :indecomposable}
                          {nil, nil} -> {:error, :indecomposable}
                          {a_base, b_base} -> 
                              {:ok, {a_base, h, a_h}, {b_base, h, b_h}}
                       end
                       
               end
               
       end
   end
   
   # form a right triangle from a hypotenuse and an edge
   defp right_triangle_from(hyp, edge) do
      case Math.nth_integer_root((hyp * hyp) - (edge * edge), 2) do
         {:exact, v} -> v
         _ -> nil 
      end
   end
   
   # find which base of a scalene triangle provides an integer height
   defp scalene_base(t) do
       bases = [:small, :medium, :large]
       |> Enum.map(
           fn side -> 
               {side, height(t, base: side)}
           end
       )
       |> Enum.filter(fn {_, {v, _}} -> v == :integer end)
       
       case bases do
          [] -> :none
          [{base, {_, h}}] -> {base, h}
          [{base, {_, h}} | _] -> {base, h}
       end
   end
   
   @doc """
   Find the height of a triangle from the hypotenuse.
   
   This function will return an integer, fraction, or float.
   
   ## Options
   
    - `base` - Atom. Default `:large`. One of `:small`, `:medium`, or `:large`. Side to use when calculating height for a scalene triangle
   
   ## Examples
   
       iex> Triangle.height({5, 5, 5})
       {:float, 4.330127018922193}

       iex> Triangle.height({3, 4, 5})
       {:fractional, %Fraction{num: 12, den: 5}}

       iex> Triangle.height({5, 5, 8})
       {:integer, 3}
   
       iex> Triangle.height({10, 13, 13})
       {:integer, 12}
   
       iex> Triangle.height({13, 14, 15})
       {:fractional, %Fraction{num: 56, den: 5}}
   
       iex> Triangle.height({13, 14, 15}, base: :medium)
       {:integer, 12}
   
       iex> Triangle.height({3, 4, 9})
       ** (ArgumentError) Shape of the triangle is invalid
   
   """
   def height(t, opts \\ []) when is_triangle?(t) do
       
       # normalize edge ordering
       {a, b, c} = normalize(t)
       
       # which side is our base length?
       base = case type(t) do
           :isoceles -> t |> Tuple.to_list() |> Enum.uniq() |> Enum.reject(fn v -> v == b end) |> List.first()
           :scalene ->
               
               # our options may have a base selection, small, medium, large
               s_base = opts |> Keyword.get(:base, :large)
               
               case s_base do
                  :small -> a
                  :medium -> b
                  :large -> c 
               end
               
           _ -> c
       end
       
       case area(t) do
           {:integer, ta} ->
               
               
               h = Fraction.new(1, base) |> Fraction.multiply(ta * 2)
               if Fraction.is_whole?(h) do
                   {:integer, h |> Fraction.get_whole()}
               else
                   {:fractional, h |> Fraction.simplify()}
               end
           {:float, ta} ->
               {:float, 2 * ta / base}
       end
   end
   
   @doc """
   An _almost_ equilateral heronian triangle has sequentially sized integer sides and an integer area.
   
   Sometimes called _super heronian_ (which is a different contruction in this library), parker triangles,
   or almost equilaterals, these are integer triangles with sequential increasing sides, like `{3, 4, 5}`.
   
   ## Examples
   
       iex> Triangle.is_almost_equilateral_heronian_triangle?({3, 4, 5})
       true

       iex> Triangle.is_almost_equilateral_heronian_triangle?({51, 52, 53})
       true

       iex> Triangle.is_almost_equilateral_heronian_triangle?({53, 54, 55})
       false
   
       iex> Triangle.is_almost_equilateral_heronian_triangle?({3, 7, 9})
       false
   
   """
   def is_almost_equilateral_heronian_triangle?(t) when is_triangle?(t) do
       {a, b, c} = normalize(t)
       (a == (b - 1)) && (b == (c - 1)) && is_heronian_triangle?(t)
   end
   
   @doc """
   Is the provided triangle an equilateral triangle?
   
   ## Examples
   
       iex> Triangle.is_equilateral?({5, 5, 5})
       true

       iex> Triangle.is_equilateral?({3, 4, 5})
       false

       iex> Triangle.is_equilateral?({15, 5, 15})
       false

       iex> Triangle.is_equilateral?({0, 0, 0})
       ** (FunctionClauseError) no function clause matching in Chunky.Geometry.Triangle.is_equilateral?/1
   
       iex> Triangle.is_equilateral?({-5, 5, 5})
       ** (FunctionClauseError) no function clause matching in Chunky.Geometry.Triangle.is_equilateral?/1
   
   """
   def is_equilateral?(t={a, b, c}) when is_triangle?(t) do
       (a == b) && (b == c)
   end
   
   @doc """
   Is a triangle a _heronian_ triangle, one with integer sides and integer area?
   
   ## Examples
   
       iex> Triangle.is_heronian_triangle?({3, 4, 5})
       true

       iex> Triangle.is_heronian_triangle?({5, 6, 7})
       false

       iex> Triangle.is_heronian_triangle?({17, 16, 17})
       true
   
       iex> Triangle.is_heronian_triangle?({41, 41, 80})
       true
   
       iex> Triangle.is_heronian_triangle?({30, 5, 29})
       true
   
   """
   def is_heronian_triangle?(t) when is_triangle?(t) do

       
       is_valid_triangle?(t) && case area(t) do
          {:integer, _} -> true
          _ -> false 
       end

   end
   
   @doc """
   Is the triangle an isoceles triangle, a triangle with two equal sides?
   
   ## Examples
   
       iex> Triangle.is_isoceles?({5, 5, 5})
       false

       iex> Triangle.is_isoceles?({15, 5, 15})
       true

       iex> Triangle.is_isoceles?({5, 15, 25})
       false

       iex> Triangle.is_isoceles?({5, 25, 25})
       true
       
   """
   def is_isoceles?(t={a, b, c}) when is_triangle?(t) do
       is_equilateral?(t) == false && ( (a ==b) || (b == c) || (a == c))
   end
   
   @doc """
   Is a triangle a heronian triangle where the area is a specific multiple of the perimeter?
   
   A `2-heronian` triangle would have an area that is `2*perimeter` of the triangle, while a
   `3-heronian` would have an area that is `3*perimeter`. For each multiple size `m`, there 
   are a finite number of multiple heronians triangles that are `m-heronian`.
   
   ## Examples
   
       iex> Triangle.is_multiple_heronian_triangle?({13, 14, 15}, 2)
       true

       iex> Triangle.is_multiple_heronian_triangle?({11, 25, 30}, 2)
       true

       iex> Triangle.is_multiple_heronian_triangle?({25, 26, 17}, 3)
       true

       iex> Triangle.is_multiple_heronian_triangle?({25, 28, 17}, 3)
       true

       iex> Triangle.is_multiple_heronian_triangle?({25, 36, 29}, 4)
       true
   
   """
   def is_multiple_heronian_triangle?(t={a, b, c}, m) when is_triangle?(t) and is_integer(m) do
       
       {_, ta} = area(t)
       tp = a + b + c
       is_heronian_triangle?(t) && (ta == (tp * m))
   end
   
   @doc """
   Is the given triangle a _right triangle_ with integer sides?
   
   ## Examples
   
       iex> Triangle.is_pythagorean_triangle?({5, 5, 5})
       false

       iex> Triangle.is_pythagorean_triangle?({10, 24, 26})
       true
   
       iex> Triangle.is_pythagorean_triangle?({24, 10, 26})
       true

       iex> Triangle.is_pythagorean_triangle?({3, 4, 5})
       true

       iex> Triangle.is_pythagorean_triangle?({4, 5, 3})
       true
   
       iex> Triangle.is_pythagorean_triangle?({4, 5, 6})
       false
   
   """
   def is_pythagorean_triangle?(t={a, b, c}) when is_triangle?(t) do
       hyp = Enum.max([a, b, c])
       
       edges = [a, b, c] -- [hyp]
       |> Enum.map(fn v -> v * v end)
       |> Enum.sum()
       
       edges == (hyp * hyp)
   end
   
   @doc """
   Is the triangle a scalene triangle, a triangle with three different length sides?
   
   ## Examples
   
       iex> Triangle.is_scalene?({5, 5, 5})
       false

       iex> Triangle.is_scalene?({15, 15, 5})
       false

       iex> Triangle.is_scalene?({5, 15, 25})
       true
   
       iex> Triangle.is_scalene?({15, 5, 35})
       true
   
   """
   def is_scalene?(t={a, b, c}) when is_triangle?(t) do
       (a != b) && (b != c) && (a != c)
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
   
       iex> Triangle.is_super_heronian_triangle?({5, 12, 13})
       true

       iex> Triangle.is_super_heronian_triangle?({5, 12, 15})
       false

       iex> Triangle.is_super_heronian_triangle?({3, 4, 5})
       false
   
       iex> Triangle.is_super_heronian_triangle?({6, 29, 25})
       true
   
   """     
   def is_super_heronian_triangle?(t={a, b, c}) when is_triangle?(t) do
   
       case area(t) do
           {:integer, ta} -> ta == (a + b + c)
           _ -> false
       end
       
   end
   
   @doc """
   Normalize the order of edges of a triangle.
   
   ## Examples
   
       iex> Triangle.normalize({5, 13, 7})
       {5, 7, 13}

       iex> Triangle.normalize({12, 8, 5})
       {5, 8, 12}

       iex> Triangle.normalize({55, 13, 47})
       {13, 47, 55}
   
       iex> Triangle.normalize({3, 4, 5})
       {3, 4, 5}
   
   """
   def normalize(t={a, b, c}) when is_triangle?(t) do
      Enum.sort([a, b, c]) |> List.to_tuple()
   end
   
   @doc """
   Generate all of the integer triangles from a given hypotenuse `h`.
   
   This will create a list of triangles with integer sides and hypotenuse `h`, with
   no duplicates, with order independent sides. So the triangle `{3, 4, 5}` and `{4, 3, 5}`
   would be considered the same, and only one of them would be included in the output.
   
   An optional `filter` function can be provided which will be used to pre
   filter the result list during computation, which can significantly reduce
   memory consumption.
   
   ## Options
   
    - `filter` - Predicate function of arity 1, which returns a boolean
   
   ## Examples
   
       iex> Triangle.triangles_from_hypotenuse(5)
       [{1, 5, 5}, {2, 4, 5}, {2, 5, 5}, {3, 3, 5}, {3, 4, 5}, {3, 5, 5}, {4, 4, 5}, {4, 5, 5}, {5, 5, 5}]

       iex> Triangle.triangles_from_hypotenuse(5, filter: &Triangle.is_scalene?/1)
       [{2, 4, 5}, {3, 4, 5}]
   
       iex> Triangle.triangles_from_hypotenuse(5, filter: &Triangle.is_pythagorean_triangle?/1)
       [{3, 4, 5}]

       iex> Triangle.triangles_from_hypotenuse(125, filter: &Triangle.is_pythagorean_triangle?/1)
       [{35, 120, 125}, {44, 117, 125}, {75, 100, 125}]
   
   """
   def triangles_from_hypotenuse(h, opts \\ []) when is_integer(h) and h > 0 do
       
       filter = opts |> Keyword.get(:filter, fn _ -> true end)
       
       # build our nested iteration of sides. our A side will go from
       # 1 to the length of the hypotenuse, while B will go from (h - a + 1) to
       # h
       1..h
       |> Enum.map(
           fn a -> 
               max((h - a + 1), a)..h
               |> Enum.map(
                   fn b -> 
                       {a, b, h}
                   end
               )
               |> Enum.filter(fn v -> filter.(v) end)
           end
       )
       |> List.flatten()
   end
   
   @doc """
   Determine the characteristic _type_ of a triangle, like _right_, _scalene_, or _isoceles_.
   
   The possible types returned by this function are:
   
    - `:invalid`
    - `:right`
    - `:equilateral`
    - `:isoceles`
    - `:scalene`
   
   ## Examples
   
       iex> Triangle.type({3, 4, 5})
       :right

       iex> Triangle.type({3, 4, 9})
       :invalid

       iex> Triangle.type({3, 4, 4})
       :isoceles
   
       iex> Triangle.type({13, 13, 13})
       :equilateral

       iex> Triangle.type({7, 13, 19})
       :scalene
   
   """
   def type(t) when is_triangle?(t) do
       
       cond do
           
           is_valid_triangle?(t) == false -> :invalid
           is_pythagorean_triangle?(t) -> :right
           is_equilateral?(t) -> :equilateral
           is_isoceles?(t) -> :isoceles
           true -> :scalene
       end
   end
end