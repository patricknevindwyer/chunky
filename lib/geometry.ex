defmodule Chunky.Geometry do
   @moduledoc """
   Functions for working with geometric shapes, patterns, and surfaces.
   
   This module contains high level operations and guards for working with geometry.

   See specific modules for more in depth functions:
   
    - `Chunky.Geometry.Triangle`
   
   ## Guards
   
    - `is_triangle?/1` - Is the given parameter a 3-tuple of integers?
   
   
   """ 
   
   defguard is_triangle?(t) when tuple_size(t) == 3 and is_integer(elem(t, 0)) and is_integer(elem(t, 1)) and is_integer(elem(t, 2)) and elem(t, 0) > 0 and elem(t, 1) > 0 and elem(t, 2) > 0
   
end