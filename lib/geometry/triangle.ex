defmodule Chunky.Geometry.Triangle do
   @moduledoc """
   Functions for working with geometric shapes.
      
   ## Integer Triangles
   
    - `area/1` - Find the area of any triangle
    - `is_equilateral?/1` - Is a triangle an equilateral triangle?
    - `is_isoceles?/1` - Is a triangle an isoceles triangle?
    - `is_pythagorean_triangle?/1` - Is the given triangle a right triangle with integer sides?
    - `is_scalene?/1` - Is a triangle a scalene triangle?
   
   """
   import Chunky.Geometry

   alias Chunky.Fraction
   
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
       
   
   """
   def area(t={a, b, c}) when is_triangle?(t) do
       
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
    
   
end