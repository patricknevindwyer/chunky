defmodule Chunky.Geometry do
  @moduledoc """
  Functions for working with geometric shapes, patterns, and surfaces.

  This module contains high level operations and guards for working with geometry.

  See specific modules for more in depth functions:

   - `Chunky.Geometry.Triangle` - Manipulate and measure triangles
   - `Chunky.Geometry.Triangle.Predicates` - Assess properties of triangles

  ## Guards

   - `is_triangle?/1` - Is the given parameter a 3-tuple of positive integers greater than `0`?

  ## Shape tests
  
   - `is_valid_triangle?/1` - Is the given triangle a valid shape?
  
  """

  defguard is_triangle?(t)
           when tuple_size(t) == 3 and is_integer(elem(t, 0)) and is_integer(elem(t, 1)) and
                  is_integer(elem(t, 2)) and elem(t, 0) > 0 and elem(t, 1) > 0 and elem(t, 2) > 0 

  @doc """
  Is the shape of the given triangle valid?
  
  The `is_triangle?/1` guard can only test for a limited set of properties. This function applies
  an additional set of constraints.
  
  ## Examples
  
      iex> Geometry.is_valid_triangle?({3, 4, 5})
      true

      iex> Geometry.is_valid_triangle?({5, 5, 5})
      true

      iex> Geometry.is_valid_triangle?({3, 4, 7})
      false

      iex> Geometry.is_valid_triangle?({10, 20, 40})
      false
  
  """                  
  def is_valid_triangle?(t={a, b, c}) when is_triangle?(t) do
     hyp = Enum.max([a, b, c])
     eds = [a, b, c] -- [hyp]
     Enum.sum(eds) > hyp
  end

end
