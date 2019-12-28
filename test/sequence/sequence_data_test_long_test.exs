defmodule Chunky.SequenceDataTestLong do
  use ExUnit.Case, async: true

  @moduledoc """
  These are the particularly long running tests that would normally be in SequenceDataTest, but
  are here instead to take advantage of async testing.
  """
  alias Chunky.Sequence

  @sequences [
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069272,
        opts: [],
        values: [2048, 3072, 4608, 5120, 6912, 7168, 7680, 10368, 10752, 11264],
        finite: false,
        first_index: 1
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069273,
        opts: [],
        values: [4096, 6144, 9216, 10240, 13824, 14336, 15360, 20736, 21504, 22528],
        finite: false,
        first_index: 1
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069274,
        opts: [],
        values: [8192, 12288, 18432, 20480, 27648, 28672, 30720, 41472, 43008, 45056],
        finite: false,
        first_index: 1
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069275,
        opts: [],
        values: [16384, 24576, 36864, 40960, 55296, 57344, 61440, 82944, 86016, 90112],
        finite: false,
        first_index: 1
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069276,
        opts: [],
        values: [32768, 49152, 73728, 81920, 110592, 114688, 122880, 165888, 172032, 180224],
        finite: false,
        first_index: 1
      }, 
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069277,
        opts: [],
        values: [65536, 98304, 147456, 163840, 221184],
        finite: false,
        first_index: 1,
        take_values: 5
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069278,
        opts: [],
        values: [131072, 196608, 294912, 327680],
        finite: false,
        first_index: 1,
        take_values: 4
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069279,
        opts: [],
        values: [262144, 393216, 589824],
        finite: false,
        first_index: 1,
        take_values: 3
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069280,
        opts: [],
        values: [524288, 786432],
        finite: false,
        first_index: 1,
        take_values: 2
      },
      %{
        module: Elixir.Chunky.Sequence.OEIS.Factors,
        sequence: :a069281,
        opts: [],
        values: [1048576, 1572864],
        finite: false,
        first_index: 1,
        take_values: 2
      },
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
        take_size = Map.get(seq_def, :take_values, 10)
        values = seq |> Sequence.take!(take_size)

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