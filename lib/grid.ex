defmodule Chunky.Grid do
  @moduledoc """
  Functions for creating and manipulating a two dimenesional grid.

  Internally the grid is ordered as lists of lists, rather than a single list.
  """

  defstruct [:data, :width, :height]

  alias Chunky.Grid

  def new(width, height, fun)
      when is_integer(width) and is_integer(height) and is_function(fun, 1) do
    if valid_dimensions?(width, height) do
      %Grid{
        data: gen_data(width, height, fun),
        width: width,
        height: height
      }
    else
      {:error, :invalid_grid_dimensions}
    end
  end

  def new(width, height, val) when is_integer(width) and is_integer(height) do
    if valid_dimensions?(width, height) do
      %Grid{
        data: gen_data(width, height, val),
        width: width,
        height: height
      }
    else
      {:error, :invalid_grid_dimensions}
    end
  end

  def get_at(%Grid{} = grid, {x, y}) when is_integer(x) and is_integer(y), do: get_at(grid, x, y)

  def get_at(%Grid{} = grid, x, y) when is_integer(x) and is_integer(y) do
    case valid_coordinate(grid, x, y) do
      {false, reason} -> {:error, reason}
      true -> grid.data |> Kernel.get_in([Access.at(y), Access.at(x)])
    end
  end

  def put_at(%Grid{} = grid, {x, y}, v), do: put_at(grid, x, y, v)

  def put_at(%Grid{} = grid, x, y, v) do
    case valid_coordinate(grid, x, y) do
      {false, reason} ->
        {:error, reason}

      true ->
        n_data = grid.data |> put_in([Access.at(y), Access.at(x)], v)
        %{grid | data: n_data}
    end
  end

  def valid_coordinate?(%Grid{} = grid, {x, y}) when is_integer(x) and is_integer(y),
    do: valid_coordinate?(grid, x, y)

  def valid_coordinate?(%Grid{} = grid, x, y) when is_integer(x) and is_integer(y) do
    case valid_coordinate(grid, x, y) do
      {false, _} -> false
      true -> true
    end
  end

  def valid_coordinate(%Grid{} = grid, {x, y}) when is_integer(x) and is_integer(y),
    do: valid_coordinate(grid, x, y)

  def valid_coordinate(%Grid{} = grid, x, y) when is_integer(x) and is_integer(y) do
    cond do
      x < 0 -> {false, :invalid_x_coordinate}
      x >= grid.width -> {false, :invalid_x_coordinate}
      y < 0 -> {false, :invalid_y_coordinate}
      y >= grid.height -> {false, :invalid_y_coordinate}
      true -> true
    end
  end

  defp valid_dimensions?(width, height) when is_integer(width) and is_integer(height) do
    width > 0 && height > 0
  end

  # generate the raw lists for a grid
  defp gen_data(width, height, fun) when is_function(fun, 1) do
    0..(height - 1)
    |> Enum.map(fn y ->
      0..(width - 1)
      |> Enum.map(fn x ->
        fun.({x, y})
      end)
    end)
  end

  defp gen_data(width, height, val) do
    gen_data(width, height, fn _ -> val end)
  end
end
