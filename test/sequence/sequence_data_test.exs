defmodule Chunky.SequenceDataTest do
  use ExUnit.Case

  @moduledoc """
  This set of tests verifies the data/layout of every sequence.
  """
  alias Chunky.Sequence
  doctest Chunky.Sequence.Basic
  doctest Chunky.Sequence.OEIS
  doctest Chunky.Sequence.OEIS.Core
  doctest Chunky.Sequence.OEIS.Sigma
  
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
      sequence: :a000005,
      opts: [],
      values: [1, 2, 2, 3, 2, 4, 2, 4, 3, 4],
      finite: false,
      first_index: 1
    },
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
    %{
      module: Chunky.Sequence.OEIS.Core,
      sequence: :a001157,
      opts: [],
      values: [1, 5, 10, 21, 26, 50, 50, 85, 91, 130],
      finite: false,
      first_index: 1
    },
    
    # Sequence.OEIS.Sigma
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a001158,
      opts: [],
      values: [1, 9, 28, 73, 126, 252, 344, 585, 757, 1134],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a001159,
      opts: [],
      values: [1, 17, 82, 273, 626, 1394, 2402, 4369, 6643, 10642],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a001160,
      opts: [],
      values: [1, 33, 244, 1057, 3126, 8052, 16808, 33825, 59293, 103158],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013954,
      opts: [],
      values: [1, 65, 730, 4161, 15626, 47450, 117650, 266305, 532171, 1015690],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013955,
      opts: [],
      values: [1, 129, 2188, 16513, 78126, 282252, 823544, 2113665, 4785157, 10078254],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013956,
      opts: [],
      values: [1, 257, 6562, 65793, 390626, 1686434, 5764802, 16843009, 43053283, 100390882],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013957,
      opts: [],
      values: [1, 513, 19684, 262657, 1953126, 10097892, 40353608, 134480385, 387440173, 1001953638],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013958,
      opts: [],
      values: [1, 1025, 59050, 1049601, 9765626, 60526250, 282475250, 1074791425, 3486843451, 10009766650],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013959,
      opts: [],
      values: [1, 2049, 177148, 4196353, 48828126, 362976252, 1977326744, 8594130945, 31381236757, 100048830174],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013960,
      opts: [],
      values: [1, 4097, 531442, 16781313, 244140626, 2177317874, 13841287202, 68736258049, 282430067923, 1000244144722],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013961,
      opts: [],
      values: [1, 8193, 1594324, 67117057, 1220703126, 13062296532, 96889010408, 549822930945, 2541867422653, 10001220711318],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013962,
      opts: [],
      values: [1, 16385, 4782970, 268451841, 6103515626, 78368963450, 678223072850, 4398314962945, 22876797237931, 100006103532010],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013963,
      opts: [],
      values: [1, 32769, 14348908, 1073774593, 30517578126, 470199366252, 4747561509944, 35185445863425, 205891146443557, 1000030517610894],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013964,
      opts: [],
      values: [1, 65537, 43046722, 4295032833, 152587890626, 2821153019714, 33232930569602, 281479271743489, 1853020231898563, 10000152587956162],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013965,
      opts: [],
      values: [1, 131073, 129140164, 17180000257, 762939453126, 16926788715972, 232630513987208, 2251816993685505, 16677181828806733, 100000762939584198],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013966,
      opts: [],
      values: [1, 262145, 387420490, 68719738881, 3814697265626, 101560344351050, 1628413597910450, 18014467229220865, 150094635684419611, 1000003814697527770],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013967,
      opts: [],
      values: [1, 524289, 1162261468, 274878431233, 19073486328126, 609360902796252, 11398895185373144, 144115462954287105, 1350851718835253557, 10000019073486852414],
      finite: false,
      first_index: 1
    },
    %{
      module: Chunky.Sequence.OEIS.Sigma,
      sequence: :a013968,
      opts: [],
      values: [1, 1048577, 3486784402, 1099512676353, 95367431640626, 3656161927895954, 79792266297612002, 1152922604119523329, 12157665462543713203, 100000095367432689202],
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
