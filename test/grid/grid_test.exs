defmodule Chunky.GridTest do
  use ExUnit.Case, async: true
  doctest Chunky.Grid

  alias Chunky.Grid

  describe "Grid.new/3" do
    test "values - 3x3" do
      g = Grid.new(3, 3, 27)
      assert g.width == 3
      assert g.height == 3
      assert g |> Grid.get_at(2, 2) == 27
    end

    test "values - 1x1" do
      g = Grid.new(1, 1, 13)
      assert g.width == 1
      assert g.height == 1
      assert g |> Grid.get_at(0, 0) == 13
    end

    test "values - 0x3" do
      g = Grid.new(0, 3, 27)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "values - 3x0" do
      g = Grid.new(3, 0, 27)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "values - -3x3" do
      g = Grid.new(-3, 3, 27)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "values - 3x-3" do
      g = Grid.new(3, -3, 27)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "values - 20x10" do
      g = Grid.new(20, 10, 314)
      assert g.width == 20
      assert g.height == 10
      assert g |> Grid.get_at(15, 5) == 314
    end

    test "function - 3x3" do
      g = Grid.new(3, 3, fn {x, y} -> x * y end)
      assert g.width == 3
      assert g.height == 3
      assert g |> Grid.get_at(2, 2) == 4
    end

    test "function - 1x1" do
      g = Grid.new(1, 1, fn {x, y} -> x + 3 + (y + 4) * 100 end)
      assert g.width == 1
      assert g.height == 1
      assert g |> Grid.get_at(0, 0) == 403
    end

    test "function - 0x3" do
      g = Grid.new(0, 3, fn {x, y} -> x * y end)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "function - 3x0" do
      g = Grid.new(3, 0, fn {x, y} -> x * y end)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "function - -3x3" do
      g = Grid.new(-3, 3, fn {x, y} -> x * y end)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "function - 3x-3" do
      g = Grid.new(3, -3, fn {x, y} -> x * y end)
      assert g == {:error, :invalid_grid_dimensions}
    end

    test "function - 20x10" do
      g = Grid.new(20, 10, fn {x, y} -> x + y * 100 end)
      assert g.width == 20
      assert g.height == 10
      assert g |> Grid.get_at(15, 9) == 915
    end

    test "values - tuples" do
      g = Grid.new(5, 5, {:foo, 66})
      assert g.width == 5
      assert g.height == 5
      assert g |> Grid.get_at(3, 3) == {:foo, 66}
    end

    test "values - strings" do
      g = Grid.new(5, 5, "floop")
      assert g.width == 5
      assert g.height == 5
      assert g |> Grid.get_at(3, 3) == "floop"
    end

    test "function - tuples" do
      g = Grid.new(5, 5, fn {x, y} -> {:foo, x, y} end)
      assert g.width == 5
      assert g.height == 5
      assert g |> Grid.get_at(3, 3) == {:foo, 3, 3}
    end

    test "function - keyword list" do
      g = Grid.new(5, 5, fn {x, y} -> [x: x, y: y] end)
      assert g.width == 5
      assert g.height == 5
      assert g |> Grid.get_at(3, 3) == [x: 3, y: 3]
    end

    test "function - strings" do
      g = Grid.new(5, 5, fn {x, y} -> "#{x}.#{y}" end)
      assert g.width == 5
      assert g.height == 5
      assert g |> Grid.get_at(3, 3) == "3.3"
    end
  end

  describe "valid_*" do
    test "valid_coordinate/* - valid" do
      g = Grid.new(10, 10, 34)

      assert g |> Grid.valid_coordinate(5, 5) == true
      assert g |> Grid.valid_coordinate({5, 5}) == true

      assert g |> Grid.valid_coordinate(0, 0) == true
      assert g |> Grid.valid_coordinate({9, 9}) == true
    end

    test "valid_coordinate/* - invalid x" do
      g = Grid.new(10, 10, 34)

      assert g |> Grid.valid_coordinate(-1, 0) == {false, :invalid_x_coordinate}
      assert g |> Grid.valid_coordinate(20, 4) == {false, :invalid_x_coordinate}

      assert g |> Grid.valid_coordinate({-3, 3}) == {false, :invalid_x_coordinate}
      assert g |> Grid.valid_coordinate({100, 4}) == {false, :invalid_x_coordinate}
    end

    test "valid_coordinate/* - invalid y" do
      g = Grid.new(10, 10, 32)

      assert g |> Grid.valid_coordinate(3, -5) == {false, :invalid_y_coordinate}
      assert g |> Grid.valid_coordinate({5, -7}) == {false, :invalid_y_coordinate}

      assert g |> Grid.valid_coordinate(3, 54) == {false, :invalid_y_coordinate}
      assert g |> Grid.valid_coordinate({5, 34}) == {false, :invalid_y_coordinate}
    end

    test "valid_coordinate?/*" do
      g = Grid.new(10, 10, 32)

      assert g |> Grid.valid_coordinate?(3, 3)

      assert g |> Grid.valid_coordinate?(-3, 3) == false
      assert g |> Grid.valid_coordinate?({-3, 3}) == false
      assert g |> Grid.valid_coordinate?(3, -3) == false
      assert g |> Grid.valid_coordinate?({3, -3}) == false

      assert g |> Grid.valid_coordinate?(30, 3) == false
      assert g |> Grid.valid_coordinate?({30, 3}) == false
      assert g |> Grid.valid_coordinate?(3, 30) == false
      assert g |> Grid.valid_coordinate?({3, 30}) == false
    end
  end

  describe "put_*" do
    test "put_at/* - valid" do
      g = Grid.new(10, 10, -1)

      gp = g |> Grid.put_at(2, 2, 35)
      assert gp |> Grid.get_at(2, 2) == 35

      gp = gp |> Grid.put_at(0, 0, 4)
      assert gp |> Grid.get_at(0, 0) == 4

      gp = gp |> Grid.put_at({9, 0}, 17)
      assert gp |> Grid.get_at(9, 0) == 17
    end

    test "put_at/* - invalid x lower bound" do
      g = Grid.new(10, 10, -1)
      assert g |> Grid.put_at(-1, 2, 35) == {:error, :invalid_x_coordinate}
    end

    test "put_at/* - invalid x upper bound" do
      g = Grid.new(10, 10, -1)
      assert g |> Grid.put_at(10, 2, 35) == {:error, :invalid_x_coordinate}
    end

    test "put_at/* - invalid y lower bound" do
      g = Grid.new(10, 10, -1)
      assert g |> Grid.put_at(3, -3, 35) == {:error, :invalid_y_coordinate}
    end

    test "put_at/* - invalid y upper bound" do
      g = Grid.new(10, 10, -1)
      assert g |> Grid.put_at(3, 30, 35) == {:error, :invalid_y_coordinate}
    end
  end

  describe "get_*" do
    test "get_at/* - valid" do
      g = Grid.new(10, 10, fn {x, y} -> x * y end)

      assert g |> Grid.get_at(5, 6) == 30
      assert g |> Grid.get_at({6, 7}) == 42
    end

    test "get_at/* - invalid x lower bound" do
      g = Grid.new(10, 10, fn {x, y} -> x * y end)

      assert g |> Grid.get_at(-3, 6) == {:error, :invalid_x_coordinate}
      assert g |> Grid.get_at({-10, 7}) == {:error, :invalid_x_coordinate}
    end

    test "get_at/* - invalid x upper bound" do
      g = Grid.new(10, 10, fn {x, y} -> x * y end)

      assert g |> Grid.get_at(30, 6) == {:error, :invalid_x_coordinate}
      assert g |> Grid.get_at({10, 7}) == {:error, :invalid_x_coordinate}
    end

    test "get_at/* - invalid y lower bound" do
      g = Grid.new(10, 10, fn {x, y} -> x * y end)

      assert g |> Grid.get_at(3, -6) == {:error, :invalid_y_coordinate}
      assert g |> Grid.get_at({1, -7}) == {:error, :invalid_y_coordinate}
    end

    test "get_at/* - invalid y upper bound" do
      g = Grid.new(10, 10, fn {x, y} -> x * y end)

      assert g |> Grid.get_at(3, 60) == {:error, :invalid_y_coordinate}
      assert g |> Grid.get_at({0, 70}) == {:error, :invalid_y_coordinate}
    end
  end
end
