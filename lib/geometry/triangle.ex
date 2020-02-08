defmodule Chunky.Geometry.Triangle do
   @moduledoc """
   Functions for working with **triangles**. For _predicate functions_ related to Triangles, see `Chunky.Geometry.Triangle.Predicates`.
   
   Triangles in Chunky are represented as a tuple of three positive integers, with each integer greater than or equal to `1`. So `{3, 4, 5}`
   is a triangle, as is `{145, 7, 139}`. Not every 3-tuple of integers is a _valid_ triangle - `{3, 5, 10}` doesn't describe a realizable
   triangle. You can test for a _valid_ triangle with `Chunky.Geometry.is_valid_triangle?/1`.
   
   Some functions will raise argument errors for invalid triangles, while others will return an error tuple, where possible.
   
   # Triangle Functions
         
   ## Measurements
   
   These functions provide measurements of triangles, their angles, or their shape.
   
    - `angles/1` - Find the interior angles of a triangle
    - `area/1` - Find the area of any triangle
    - `height/2` - Find the bisecting height of a triangle
    - `is_multiple_heronian_triangle?/2` - Is a triangle a heronian triange with an area that is a specific multiple of the perimeter?
   
   
   ## Construction and Deconstructing Triangles
   
   Create new triangles, break existing triangles into smaller triangles, or recombine smaller triangles:

    - `compose/2` - Create a new triangle from two compatible right triangles
    - `decompose/1` - Break a triangle into two smaller right triangles
    - `normalize/1` - Normalize the ordering of sides of a triangle
    - `triangles_from_hypotenuse/2` - Generate integer triangles given a hypotenuse and optional filter


   ## Meta-inspection of triangles
   
   Metadata about triangles:
   
    - `type/1` - Determine the basic type, or form, of a triangle
   
   
   # Finding Triangles
   
   Finding specific _shapes_ of triangles (like Heronian, m-heronian, scalenes, etc) can be useful. For instance, finding triangles
   that are _decomposable_ or _19-heronian_ triangles. Constructing these by hand can be tedious - instead we can combine a series
   of functions from the Triangle and Predicates modules to help find what we're looking for.
   
   The heart of searching for triangles is the `triangles_from_hypotenuse/2` function, which generates the set of all valid triangles
   for a given hypotenuse edge:
   
       iex> Triangle.triangles_from_hypotenuse(3)
       [{1, 3, 3}, {2, 2, 3}, {2, 3, 3}, {3, 3, 3}]
   
   All of the valid triangles for the given hypotenuse are generated, without duplicates, edge order independent (so `{3, 2, 3}` and `{2, 3, 3}`
   would be the same, and only one included in the output). For a small hypotenuse this output by itself can be useful
   for visual inspection, but the number of valid triangles grows fairly quickly. For a hypotenuse of `15`, there
   are `64` valid triangles. For a hypotenuse of `100`, there are `2550` triangles. On to the next step: filter functions.
   
   The second parameter of `triangles_from_hypotenuse/2` is a predicate function - any function that takes a triangle
   as it's only parameter, and returns a boolean. The output of `triangles_from_hypotenuse/2` will be filtered to contain only
   those triangles that pass the filter. For instance, we can filter our list of triangles with a hypotenuse of `3` to
   only the equilateral triangles:
   
       iex> Triangle.triangles_from_hypotenuse(3, filter: &Triangle.Predicates.is_equilateral?/1)
       [{3, 3, 3}]
   
   Let's look at the first example we cited, finding decomposable triangles. Constructing these by hand can be tedious. But using
   the above technique, we can quickly find what we're looking for. How about triangles with a hypotenuse of `30` that are
   decomposable:
   
       iex> Triangle.triangles_from_hypotenuse(30, filter: &Triangle.Predicates.is_decomposable?/1)
       [{8, 26, 30}, {11, 25, 30}, {17, 17, 30}, {25, 25, 30}, {26, 28, 30}]
   
   If we want to tackle the second example we cited, finding _19-heronian_ triangles (these are triangles whose area is exactly 19 times
   their perimeter), we'll need to expand our search: we don't know _exactly_ what the hypotenuse will be, so we check multiple:
   
   ```elixir
   150..250 
   |> Enum.map(
       fn h -> 
           Triangle.triangles_from_hypotenuse(
               h, 
               filter: fn t -> 
                   Triangle.is_multiple_heronian_triangle?(t, 19) 
               end) 
       end
   ) 
   |> List.flatten()
   ```
   
   Here we've take the range of `150` to `250`, and used each of those in order as the hypotenuse of `triangles_from_hypotenuse/2`. The
   filter function is an anonymous function, where we use the `is_multiple_heronian?/2` function to filter down to only those triangles
   that are an exact multiple of perimeter and area.
   
   """
   import Chunky.Geometry

   alias Chunky.Fraction
   alias Chunky.Math
   alias Chunky.Geometry.Triangle.Predicates
   
   @doc """
   Find the angles of a triangle.
   
   The resulting 3-tuple will be floats, in order such that each angle is opposite
   it's edge. So for a triangle with sides `{a, b, c}`, the resulting angles `{θa, θb, θc}`
   are such that `θa` is opposite edge `a`, `θb` opposite edge `b`, and `θc` opposite edge
   `c`:
   
    ![Triangle](https://upload.wikimedia.org/wikipedia/commons/4/49/Triangle_with_notations_2.svg)
   
   ## Examples
   
       iex> Triangle.angles({3, 4, 5})
       {36.86989764584401, 53.13010235415599, 90.0}

       iex> Triangle.angles({13, 13, 13})
       {59.99999999999999, 59.99999999999999, 59.99999999999999}
   
       iex> Triangle.angles({10, 5, 10})
       {75.52248781407008, 28.95502437185985, 75.52248781407008}

       iex> Triangle.angles({30, 16, 17})
       {130.73591716163173, 23.83600707762401, 25.428075760744253}
   
   
   """
   def angles(t={a, b, c}) when is_triangle?(t) do
       if is_valid_triangle?(t) == false do
           raise ArgumentError, message: "Shape of triangle is invalid"
       else
           {
               solve_for_angle(a, b, c),
               solve_for_angle(b, a, c),
               solve_for_angle(c, b, a)
           }
       end
   end
   
   defp solve_for_angle(c, a, b) do
       :math.acos(((c * c) - ( ( a * a) + (b * b))) / (-2.0 * a * b)) |> rad_to_deg()
      # :math.acos((c * c) / ((a * a) + (b * b) - (2 * a * b)))
   end
   
   defp rad_to_deg(v), do: v * (180.0 / 3.141592653589793)
   
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
   Compose two pythagorean (right) triangles into a larger triangle, if possible.
   
   This is the inverse of `decompose/1` - two compatible right triangles can be joined on 
   an equal, non-hypotenuse edge to form a new triangle. 
   
   The results of this function will either be a tuple of `{:ok, _}` with a one or two new triangles,
   or `{:error, reason}` for not being composable.
   
   ## Examples
   
       iex> Triangle.compose({12, 5, 13}, {5, 13, 12})
       {:ok, {10, 13, 13}, {13, 13, 24}}

       iex> Triangle.compose({12, 5, 13}, {9, 15, 12})
       {:ok, {13, 14, 15}}

       iex> Triangle.compose({12, 5, 13}, {3, 4, 5})
       {:error, :not_composable}
   
       iex> Triangle.compose({12, 5, 13}, {5, 7, 24})
       {:error, :not_pythagorean_triangles}
   
   """
   def compose(v, w) when is_triangle?(v) and is_triangle?(w) do
       case {Predicates.is_pythagorean_triangle?(v), Predicates.is_pythagorean_triangle?(w)} do
           
           {true, true} ->
               {v_a, v_b, v_c} = normalize(v)
               {w_a, w_b, w_c} = normalize(w)
               
               cond do
                   v_a == w_a && v_b == w_b -> 
                       
                       # build the result triangles
                       comp_a = {v_c, w_c, v_b + w_b} |> normalize()
                       comp_b = {v_c, w_c, v_a + w_a} |> normalize()
                       
                       # sort by the smallest edge
                       [res_a, res_b] = [comp_a, comp_b] |> Enum.sort(fn {side_a, _, _}, {side_b, _, _} -> side_a <= side_b end)
                       
                       # results!
                       {:ok, res_a, res_b}
                       
                   v_a == w_a -> {:ok, {v_c, w_c, v_b + w_b} |> normalize()} 
                   v_a == w_b -> {:ok, {v_c, w_c, v_b + w_a} |> normalize()}
                   v_b == w_a -> {:ok, {v_c, w_c, v_a + w_b} |> normalize()}
                   v_b == w_b -> {:ok, {v_c, w_c, v_a + w_a} |> normalize()}
                   true -> {:error, :not_composable}
               end
               
           _ -> 
               {:error, :not_pythagorean_triangles}
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

       iex> Triangle.decompose({13, 13, 24})
       {:ok, {5, 12, 13}, {5, 12, 13}}
   
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
                       
                       if a == b do
                           
                           # the equal sides are shorter than the inequal side
                           if rem(c, 2) == 0 do
                               {:ok, {div(c, 2), h, a} |> normalize(), {div(c, 2), h, a} |> normalize()}
                           else
                               {:error, :indecomposable}
                           end
                       else
                           # the equal sides are longer than the inequal side
                           if rem(a, 2) == 0 do
                               {:ok, {div(a, 2), h, c} |> normalize(), {div(a, 2), h, c} |> normalize()}
                           else
                               {:error, :indecomposable}
                           end                           
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
       Predicates.is_heronian_triangle?(t) && (ta == (tp * m))
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

       iex> Triangle.triangles_from_hypotenuse(5, filter: &Triangle.Predicates.is_scalene?/1)
       [{2, 4, 5}, {3, 4, 5}]
   
       iex> Triangle.triangles_from_hypotenuse(5, filter: &Triangle.Predicates.is_pythagorean_triangle?/1)
       [{3, 4, 5}]

       iex> Triangle.triangles_from_hypotenuse(125, filter: &Triangle.Predicates.is_pythagorean_triangle?/1)
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
           Predicates.is_pythagorean_triangle?(t) -> :right
           Predicates.is_equilateral?(t) -> :equilateral
           Predicates.is_isoceles?(t) -> :isoceles
           true -> :scalene
       end
   end
end