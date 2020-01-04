defmodule Chunky.SequenceTest do
  use ExUnit.Case, async: true

  alias Chunky.Sequence
  doctest Chunky.Sequence

  @sequences [
    %{
      module: Chunky.Sequence.Basic,
      sequence: :whole_numbers,
      opts: [],
      values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      finite: false
    }
  ]

  describe "create/3" do
    test "valid sequence" do
      @sequences
      |> Enum.each(fn seq ->
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence)
        assert sequence.index == -1
        assert sequence.value == 0
      end)
    end

    test "has instance attributes" do
      @sequences
      |> Enum.each(fn seq ->
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence)
        assert sequence.instance == {seq.module, seq.sequence}
      end)
    end

    test "invalid module - invalid sequence" do
      assert Sequence.create(Chunky.Sequence.Zzzz, :does_not_exist) == :no_such_module
    end

    test "valid module - invalid sequence" do
      assert Sequence.create(Chunky.Sequence.Basic, :does_not_exist) == :no_such_sequence
    end

    test "valid sequence - with options" do
      @sequences
      |> Enum.each(fn seq ->
        assert %Sequence{} = Sequence.create(seq.module, seq.sequence, seq.opts)
      end)
    end
  end

  describe "drop/2" do
    test "empty" do
      assert %Sequence{} = seq = Sequence.create(Sequence.Test, :list_empty)
      p_seq = seq |> Sequence.drop(10)
      assert p_seq |> Sequence.take!(10) == []
    end

    test "short - drop to end" do
      assert %Sequence{} = seq = Sequence.create(Sequence.Test, :list_small)
      p_seq = seq |> Sequence.drop(10)
      assert p_seq |> Sequence.take!(10) == []
    end

    test "drop 0" do
      assert %Sequence{} = seq = Sequence.create(Sequence.Basic, :whole_numbers)
      assert seq |> Sequence.drop(0) |> Sequence.take!(10) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    end

    test "drop N" do
      assert %Sequence{} = seq = Sequence.create(Sequence.Basic, :whole_numbers)
      assert seq |> Sequence.drop(3) |> Sequence.take!(10) == [4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    end
  end

  describe "is_instance?/2" do
    test "is_instance?/2" do
      @sequences
      |> Enum.each(fn seq ->
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence)
        assert Sequence.is_instance?(sequence, {seq.module, seq.sequence})
      end)
    end
  end

  describe "is_instance?/3" do
    test "is_instance?/3" do
      @sequences
      |> Enum.each(fn seq ->
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence)
        assert Sequence.is_instance?(sequence, seq.module, seq.sequence)
      end)
    end
  end

  describe "readable_name/1" do
    test "basic::whole numbers" do
      assert %Sequence{} = seq = Sequence.create(Sequence.Basic, :whole_numbers)
      assert Sequence.readable_name(seq) == "Whole numbers: [1, 2, 3, 4, 5, ...]"
    end
  end

  describe "get_references/1" do
    test "oeis refs" do
      assert %Sequence{} = seq = Sequence.create(Sequence.OEIS.Core, :fibonacci)
      assert Sequence.get_references(seq) == [{:oeis, :a000045, "https://oeis.org/A000045"}]
    end
  end

  describe "has_reference?/2" do
    test "oeis refs" do
      assert %Sequence{} = seq = Sequence.create(Sequence.OEIS.Core, :fibonacci)
      assert Sequence.has_reference?(seq, :oeis)
    end

    test "multi-ref" do
      assert %Sequence{} = seq = Sequence.create(Sequence.Basic, :whole_numbers)
      assert Sequence.has_reference?(seq, :wolfram)
      assert Sequence.has_reference?(seq, :wikipedia)
    end
  end

  describe "available/0" do
    test "available returns list" do
      assert is_list(Sequence.available())
    end

    test "available returns large enough list" do
      assert length(Sequence.available()) > 10
    end

    test "available returns proper docs" do
      Sequence.available()
      |> Enum.each(fn seq ->
        assert Map.has_key?(seq, :sequence)
        assert Map.has_key?(seq, :name)
        assert Map.has_key?(seq, :description)
        assert Map.has_key?(seq, :module)
      end)
    end
  end

  describe "map/2" do
    test "empty sequence" do
      assert Sequence.create(Sequence.Test, :list_empty) |> Sequence.map(fn v -> v end) == []
    end

    test "finite sequence" do
      assert Sequence.create(Sequence.Test, :list_medium) |> Sequence.map(fn v -> v * 2 end) == [
               2,
               4,
               6,
               8,
               10,
               12,
               14,
               16,
               18,
               20
             ]
    end
  end

  describe "available/1" do
    test "available returns list" do
      assert is_list(Sequence.available(Chunky.Sequence.Basic))
    end

    test "available returns proper docs" do
      Sequence.available(Chunky.Sequence.Basic)
      |> Enum.each(fn seq ->
        assert Map.has_key?(seq, :sequence)
        assert Map.has_key?(seq, :name)
        assert Map.has_key?(seq, :description)
        assert Map.has_key?(seq, :module)
      end)
    end
  end

  describe "is_available?/2" do
    test "true" do
      assert Sequence.is_available?(Chunky.Sequence.Basic, :whole_numbers)
    end

    test "false" do
      assert Sequence.is_available?(Chunky.Sequence.Basic, :does_not_exist) == false
    end

    test "sequences test" do
      @sequences
      |> Enum.each(fn seq ->
        assert Sequence.is_available?(seq.module, seq.sequence)
      end)
    end
  end

  describe "has_next/1" do
    test "infinite sequence" do
      @sequences
      |> Enum.filter(fn seq -> !seq.finite end)
      |> Enum.each(fn seq ->
        sequence = Sequence.create(seq.module, seq.sequence, seq.opts)
        assert Sequence.has_next?(sequence)
      end)
    end
  end

  describe "next/1" do
    test "value is stored/iterates" do
      @sequences
      |> Enum.each(fn seq ->
        sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # first step
        {va, n_seq} = Sequence.next(sequence)
        assert n_seq.value == va
        assert n_seq.value == Enum.at(seq.values, 0)

        # second step
        {vb, o_seq} = Sequence.next(n_seq)
        assert o_seq.value == vb
        assert o_seq.value == Enum.at(seq.values, 1)
      end)
    end

    test "index iterates" do
      @sequences
      |> Enum.each(fn seq ->
        sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # first step
        {_, n_seq} = Sequence.next(sequence)
        assert n_seq.index == 0

        # second step
        {_, o_seq} = Sequence.next(n_seq)
        assert o_seq.index == 1
      end)
    end
  end

  describe "next!/1" do
    test "value is stored" do
      @sequences
      |> Enum.each(fn seq ->
        sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # first step
        %Sequence{} = n_seq = Sequence.next!(sequence)
        assert n_seq.value == Enum.at(seq.values, 0)

        # second step
        %Sequence{} = o_seq = Sequence.next!(n_seq)
        assert o_seq.value == Enum.at(seq.values, 1)
      end)
    end

    test "index iterates" do
      @sequences
      |> Enum.each(fn seq ->
        sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # first step
        %Sequence{} = n_seq = Sequence.next!(sequence)
        assert n_seq.index == 0

        # second step
        %Sequence{} = o_seq = Sequence.next!(n_seq)
        assert o_seq.index == 1
      end)
    end
  end

  describe "take!/2" do
    test "0" do
      @sequences
      |> Enum.each(fn seq ->
        # create the sequence
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # taking nothing should return nothing and iterate nothing
        assert [] = Sequence.take!(sequence, 0)
        assert sequence.index == -1
      end)
    end

    test "many" do
      @sequences
      |> Enum.each(fn seq ->
        # create the sequence
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # taking nothing should return nothing and iterate nothing
        assert values = Sequence.take!(sequence, length(seq.values))
        assert sequence.index == -1
        assert values == seq.values
      end)
    end

    test "negative" do
      assert %Sequence{} = sequence = Sequence.create(Chunky.Sequence.Basic, :whole_numbers)
      assert [] = Sequence.take!(sequence, -3)
      assert sequence.index == -1
      assert sequence.value == 0
    end
  end

  describe "take/2" do
    test "0" do
      @sequences
      |> Enum.each(fn seq ->
        # create the sequence
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # taking nothing should return nothing and iterate nothing
        assert {[], %Sequence{} = post} = Sequence.take(sequence, 0)
        assert post.index == -1
      end)
    end

    test "many" do
      @sequences
      |> Enum.each(fn seq ->
        # create the sequence
        assert %Sequence{} = sequence = Sequence.create(seq.module, seq.sequence, seq.opts)

        # taking nothing should return nothing and iterate nothing
        {values, %Sequence{} = post} = Sequence.take(sequence, length(seq.values))
        assert post.index == length(seq.values) - 1
        assert values == seq.values
        assert post.value == seq.values |> List.last()
      end)
    end

    test "negative" do
      assert %Sequence{} = sequence = Sequence.create(Chunky.Sequence.Basic, :whole_numbers)
      assert {[], %Sequence{} = post} = Sequence.take(sequence, -3)
      assert post.index == -1
      assert post.value == 0
    end
  end
end
