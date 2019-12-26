defmodule Chunky.SequenceDataTest do
  use ExUnit.Case

  @moduledoc """
  This set of tests verifies the data/layout of every sequence.
  """
  alias Chunky.Sequence
  doctest Chunky.Sequence.Basic
  doctest Chunky.Sequence.OEIS
  doctest Chunky.Sequence.OEIS.Core

  @sequences [
    # Sequence.Basic
    %{
      module: Chunky.Sequence.Basic,
      sequence: :whole_numbers,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false
    },
    %{
      module: Chunky.Sequence.Basic,
      sequence: :whole_numbers,
      opts: [start: 100],
      values: [100, 101, 102, 103, 104, 105, 106, 107, 108, 109],
      finite: false
    },
    %{
      module: Chunky.Sequence.Basic,
      sequence: :empty,
      opts: [],
      values: [],
      finite: true
    },
    %{
      module: Chunky.Sequence.Basic,
      sequence: :decimal_digits,
      opts: [],
      values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      finite: true
    },

    # Sequence.OEIS
    %{
      module: Chunky.Sequence.OEIS,
      sequence: :a000045,
      opts: [],
      values: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS,
      sequence: :fibonacci,
      opts: [],
      values: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34],
      finite: false
    },
    
    # Sequence.OEIS.Core
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000009,
      opts: [],
      values: [1, 1, 1, 2, 2, 3, 4, 5, 6, 8],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000041,
      opts: [],
      values: [1,1,2,3,5,7,11,15,22,30],
      finite: true
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000079,
      opts: [],
      values: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512],
      finite: false
    },
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000203,
      opts: [],
      values: [1, 3, 4, 7, 6, 12, 8, 15, 13, 18],
      finite: false,
      first_index: 1
    },
    
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a000593,
      opts: [],
      values: [1, 1, 4, 1, 6, 4, 8, 1, 13, 6],
      finite: false,
      first_index: 1
    },
    

    # Sequence.Test
    %{
      module: Chunky.Sequence.Test,
      sequence: :whole_numbers,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :doubler,
      opts: [],
      values: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :last_two,
      opts: [],
      values: [2, 6, 8, 14, 22, 36, 58, 94, 152, 246],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :last_three,
      opts: [],
      values: [9, 15, 27, 51, 93, 171, 315, 579, 1065, 1959],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :cycle,
      opts: [],
      values: [4, -3, 0, 4, -3, 0, 4, -3, 0, 4],
      finite: false
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_empty,
      opts: [],
      values: [],
      finite: true
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_small,
      opts: [],
      values: [1, 8, 27, 64, 125],
      finite: true
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_medium,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: true
    },
    %{
      module: Chunky.Sequence.Test,
      sequence: :list_large,
      opts: [],
      values: [1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009],
      finite: true
    }
  ]

  describe "sequence value tests" do
    test "take!/10" do
      @sequences
      |> Enum.each(fn seq_def ->
        # instantiate
        seq =
          case Sequence.create(seq_def.module, seq_def.sequence, seq_def.opts) do
            :no_such_sequence ->
              IO.puts("\n\nfailed sequence lookup #{seq_def.module}::#{seq_def.sequence}\n")
              :no_such_sequence

            %Sequence{} = s ->
              s
          end

        assert %Sequence{} = seq

        # take values
        values = seq |> Sequence.take!(10)

        # check values
        assert values == seq_def.values
        # assert(values == seq_def.values, Sequence.readable_name(seq))
        
        # check finite/infinite
        assert Sequence.is_finite?(seq) == seq_def.finite
        
        # let's check our first index
        first_index = Map.get(seq_def, :first_index, 0)
        
        assert (seq |> Sequence.next!()).index == first_index
      end)
    end
  end
end
