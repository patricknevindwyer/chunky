defmodule Chunky.OperationsTest do
  use ExUnit.Case, async: true
  require Chunky.Math.Operations
  import Chunky.Math.Operations, only: [summation: 3, product: 3]
  alias Chunky.Fraction

  describe "product" do
    test "int - literal, 1 to 10" do
      assert (product k, 1..10 do
                k
              end) == 3_628_800
    end

    test "int - equation, 1 to positive" do
      assert (product k, 1..4 do
                (k + 1) * 2
              end) == 1920
    end

    test "int - equation, neg to -1" do
      assert (product k, -5..-1 do
                k * 3 + 4
              end) == 880
    end

    test "int - equation, nested" do
      assert (product k, 1..3 do
                product j, 4..6 do
                  j + k
                end
              end) == 35_562_240
    end

    test "fraction - literal, 1 to pos" do
      assert %Fraction{num: 24, den: 256} ==
               (product num, 1..4 do
                  Fraction.new(num, 4)
                end)
    end

    test "int - product over result of function" do
      assert 1_728 ==
               (product k, Chunky.Math.factors(12) do
                  k
                end)
    end
  end

  describe "summation" do
    test "int - literal - 0 to positive" do
      assert (summation k, 0..10 do
                k
              end) == 55
    end

    test "int - equation - 0 to positive" do
      assert (summation k, 1..5 do
                k * k + 1
              end) == 60
    end

    test "int - literal - negative to 0 " do
      assert (summation k, -10..0 do
                k
              end) == -55
    end

    test "int - literal - negative to positive" do
      assert (summation k, -5..10 do
                k
              end) == 40
    end

    test "int - alt iterator" do
      assert (summation j, 1..5 do
                j
              end) == 15
    end

    test "int - nested summations" do
      assert (summation k, 0..5 do
                summation j, k..10 do
                  j
                end
              end) == 310
    end

    test "fraction - denominators" do
      assert %Fraction{num: 137, den: 60} ==
               (summation k, 1..5 do
                  Fraction.new(1, k)
                end)
    end

    test "fraction - numerators" do
      assert %Fraction{num: 15, den: 1} ==
               (summation k, 1..5 do
                  Fraction.new(k, 1)
                end)
    end

    test "fraction - iterated sum - nested" do
      assert %Fraction{num: 66, den: 6} ==
               (summation num, 1..3 do
                  summation den, 1..3 do
                    Fraction.new(num, den)
                  end
                end)
    end

    test "int - sum over list" do
      assert (summation k, [1, 3, 5, 7, 9] do
                k
              end) == 25
    end

    test "int - sum over result of function" do
      assert 28 ==
               (summation k, Chunky.Math.factors(12) do
                  k
                end)
    end
  end
end
