defmodule Chunky.Sequence.OEIS do
  @moduledoc """
  Online Encyclopedia of Integer Sequences (OEIS) sequence iterators.

  Supported sequences are broken down into modules based on OEIS Keyword, subject matter, or 
  related methods.

  ## Available Modules

   - `Chunky.Sequence.OEIS.Core` - OEIS `core` Keyword sequences
   - `Chunky.Sequence.OEIS.Sigma` - Sequenecs related to the Sigma (𝝈) function

  ## Available Sequences

   - [A000045 - Fibonacci Numbers](https://oeis.org/A000045) - `:a000045` or `:fibonacci`

  """
  import Chunky.Sequence, only: [sequence_for_function: 1, sequence_for_list: 1]
  alias Chunky.Sequence

  @data_keyword_core_hard [
    :a000001,
    :a000043,
    :a000105,
    :a000109,
    :a000112,
    :a000609,
    :a000798,
    :a002106,
    :a003094,
    :a005470,
    :a006966,
    :a055512
  ]
  @data_keyword_core_easy [
    :a000040,
    :a000045,
    :a000217,
    :a000203,
    :a000108,
    :a000005,
    :a000010,
    :a000041,
    :a000079,
    :a000290,
    :a000142,
    :a000012,
    :a007318,
    :a000027,
    :a001222,
    :a001358,
    :a001221,
    :a000720,
    :a002110,
    :a000120,
    :a000032,
    :a005117,
    :a008683,
    :a000225,
    :a000110,
    :a002275,
    :a005408,
    :a000009,
    :a002808,
    :a000007,
    :a000984,
    :a000796,
    :a006530,
    :a000578,
    :a020639,
    :a000961,
    :a001477,
    :a000292,
    :a000244,
    :a005843,
    :a002378,
    :a000129,
    :a001045,
    :a000081,
    :a008277,
    :a002113,
    :a010060,
    :a001147,
    :a000035,
    :a000326,
    :a000312,
    :a001006,
    :a049310,
    :a000166,
    :a000330,
    :a001065,
    :a000302,
    :a001055,
    :a025487,
    :a000085,
    :a002620,
    :a001405,
    :a000124,
    :a001906,
    :a004526,
    :a001764,
    :a070939,
    :a001333,
    :a001511,
    :a000521,
    :a000670,
    :a001157,
    :a001519,
    :a002487,
    :a003418,
    :a001700,
    :a001227,
    :a000204,
    :a027642,
    :a000169,
    :a000959,
    :a018252,
    :a000583,
    :a000069,
    :a000004,
    :a000002,
    :a002426,
    :a000111,
    :a001969,
    :a000219,
    :a002322,
    :a006882,
    :a000364,
    :a005101,
    :a006318,
    :a000272,
    :a000262,
    :a000593,
    :a001003,
    :a001615,
    :a000594,
    :a000055,
    :a001037,
    :a001481,
    :a002033,
    :a005100,
    :a000182,
    :a000031,
    :a001462,
    :a246655,
    :a008279,
    :a001190,
    :a005811,
    :a004018,
    :a001057,
    :a000123,
    :a003136,
    :a000311,
    :a000688,
    :a000602,
    :a000793,
    :a074206,
    :a000048,
    :a002530,
    :a001285,
    :a000161,
    :a002654,
    :a005130,
    :a002572,
    :a000029,
    :a038567,
    :a002531,
    :a000014,
    :a002083,
    :a004011,
    :a001699,
    :a001489,
    :a006894,
    :a000140,
    :a003484,
    :a002658,
    :a005230,
    :a035099,
    :a038568,
    :a001478,
    :a005588
  ]
  @data_keyword_core_mult [
    :a000004,
    :a000005,
    :a000007,
    :a000010,
    :a000012,
    :a000027,
    :a000035,
    :a000203,
    :a000290,
    :a000578,
    :a000583,
    :a000593,
    :a000594,
    :a000688,
    :a001157,
    :a001227,
    :a001477,
    :a001511,
    :a001615,
    :a002654,
    :a003484,
    :a008683
  ]
  @data_keyword_core_eigen [:a000081, :a000108, :a000111, :a001190, :a008292]

  @doc sequence: "OEIS Core::Hard Sequences"
  def create_sequence_keyword_core_hard(_opts) do
    sequence_for_list(@data_keyword_core_hard)
  end

  @doc sequence: "OEIS Core::Easy Sequences"
  def create_sequence_keyword_core_easy(_opts) do
    sequence_for_list(@data_keyword_core_easy)
  end

  @doc sequence: "OEIS Core::Multiplicative Sequences"
  def create_sequence_keyword_core_mult(_opts) do
    sequence_for_list(@data_keyword_core_mult)
  end

  @doc sequence: "OEIS Core::Eigen Sequences"
  def create_sequence_keyword_core_eigen(_opts) do
    sequence_for_list(@data_keyword_core_eigen)
  end

  @doc """
  The Online Encyclopedia of Integer Sequences list of Core Sequences. 

  This list is primarily for reference lookup and Sequence introspection, in particular
  calculating the coverage of Core sequences in Chunky.Sequences.
  """
  @doc sequence: "OEIS Core Sequences",
       references: [{:oeis, :core_sequences, "http://oeis.org/search?q=keyword%3Acore"}]
  def create_sequence_keyword_core(_opts) do
    sequence_for_list([
      :a000001,
      :a000002,
      :a000004,
      :a000005,
      :a000007,
      :a000009,
      :a000010,
      :a000012,
      :a000014,
      :a000019,
      :a000027,
      :a000029,
      :a000031,
      :a000032,
      :a000035,
      :a000040,
      :a000041,
      :a000043,
      :a000045,
      :a000048,
      :a000055,
      :a000058,
      :a000069,
      :a000079,
      :a000081,
      :a000085,
      :a000088,
      :a000105,
      :a000108,
      :a000109,
      :a000110,
      :a000111,
      :a000112,
      :a000120,
      :a000123,
      :a000124,
      :a000129,
      :a000140,
      :a000142,
      :a000161,
      :a000166,
      :a000169,
      :a000182,
      :a000203,
      :a000204,
      :a000217,
      :a000219,
      :a000225,
      :a000244,
      :a000262,
      :a000272,
      :a000273,
      :a000290,
      :a000292,
      :a000302,
      :a000311,
      :a000312,
      :a000326,
      :a000330,
      :a000364,
      :a000396,
      :a000521,
      :a000578,
      :a000583,
      :a000593,
      :a000594,
      :a000602,
      :a000609,
      :a000670,
      :a000688,
      :a000720,
      :a000793,
      :a000796,
      :a000798,
      :a000959,
      :a000961,
      :a000984,
      :a001003,
      :a001006,
      :a001034,
      :a001037,
      :a001045,
      :a001055,
      :a001065,
      :a001057,
      :a001097,
      :a001113,
      :a001147,
      :a001157,
      :a001190,
      :a001221,
      :a001222,
      :a001227,
      :a001285,
      :a001333,
      :a001349,
      :a001358,
      :a001405,
      :a001462,
      :a001477,
      :a001478,
      :a001481,
      :a001489,
      :a001511,
      :a001615,
      :a001699,
      :a001700,
      :a001519,
      :a001764,
      :a001906,
      :a001969,
      :a002033,
      :a002083,
      :a002106,
      :a002110,
      :a002113,
      :a002275,
      :a002322,
      :a002378,
      :a002426,
      :a002487,
      :a002530,
      :a002531,
      :a002572,
      :a002620,
      :a002654,
      :a002658,
      :a002808,
      :a003094,
      :a003136,
      :a003418,
      :a003484,
      :a004011,
      :a004018,
      :a004526,
      :a005036,
      :a005100,
      :a005101,
      :a005117,
      :a005130,
      :a005230,
      :a005408,
      :a005470,
      :a005588,
      :a005811,
      :a005843,
      :a006318,
      :a006530,
      :a006882,
      :a006894,
      :a006966,
      :a007318,
      :a008275,
      :a008277,
      :a008279,
      :a008292,
      :a008683,
      :a010060,
      :a018252,
      :a020639,
      :a020652,
      :a020653,
      :a025487,
      :a027641,
      :a027642,
      :a035099,
      :a038566,
      :a038567,
      :a038568,
      :a038569,
      :a049310,
      :a055512,
      :a070939,
      :a074206,
      :a104725,
      :a226898,
      :a246655
    ])
  end

  @doc """
  Calculate the OEIS Sequence coverage for a particular sequence group.

  This is primarily for reference and testing, and is used to determine the
  completeness of sequence coverage in the Chunky.Sequence.OEIS modules.

  ## Example

      iex> (Sequence.create(Sequence.OEIS, :keyword_core) |> Sequence.OEIS.coverage()).percent < 1.0
      true

      iex> (Sequence.create(Sequence.OEIS, :keyword_core) |> Sequence.OEIS.coverage()).percent > 0.0
      true

  """
  def coverage(%Sequence{} = sequence_list) do
    # get full coverage list
    all_sequences =
      Sequence.available()
      |> Enum.map(fn seq_map -> seq_map.sequence end)

    # list of true/false
    mapped_seq =
      sequence_list
      |> Sequence.map(fn sequence ->
        Enum.member?(all_sequences, sequence)
      end)

    covered =
      mapped_seq
      |> Enum.filter(fn cov -> cov end)

    # build the list of atoms of uncovered/missing sequences
    missing_seqs =
      sequence_list
      |> Sequence.take!(100)
      |> Enum.filter(fn sequence -> !Enum.member?(all_sequences, sequence) end)

    %{
      covered: length(covered),
      total: length(mapped_seq),
      percent: length(covered) / length(mapped_seq),
      missing_sequences: missing_seqs
    }
  end

  @doc """
  Find the next 100 missing sequences from a coverage set
  """
  def missing_sequences(mod, seq) do
    Sequence.create(mod, seq) |> missing_sequences()
  end

  def missing_sequences(%Sequence{} = sequence_list) do
    (sequence_list |> coverage()).missing_sequences
  end

  @doc """
  Print out a coverage report for named sequence groups (like CORE) in the OEIS
  sequence support modules.
  """
  def coverage() do
    # total OEIS sequences
    oeis_sequences = Sequence.available() |> Enum.filter(&has_oeis_reference?/1)

    # total report
    IO.puts("OEIS Coverage")
    IO.puts("\t#{length(oeis_sequences)} total sequences")

    IO.puts("By Module")

    # group by module
    oeis_sequences
    |> Enum.group_by(fn %{module: mod} -> mod end)
    |> Enum.each(fn {mod, seqs} ->
      IO.puts("\t#{mod} - #{length(seqs)} sequences")
    end)

    IO.puts("Sequence Groups")

    # build and report specific sequence group coverage
    [
      {Sequence.OEIS, :keyword_core},
      {Sequence.OEIS, :keyword_core_easy},
      {Sequence.OEIS, :keyword_core_hard},
      {Sequence.OEIS, :keyword_core_mult},
      {Sequence.OEIS, :keyword_core_eigen}
    ]
    |> Enum.map(fn {s_mod, s_key} ->
      # get coverage
      seq = Sequence.create(s_mod, s_key)
      cov = seq |> coverage()

      # get name
      nom = seq |> Sequence.readable_name()

      {nom, cov}
    end)
    |> Enum.each(fn {nom, cov} ->
      IO.puts(
        "\t#{nom} - #{cov.covered} / #{cov.total} (#{(cov.percent * 100.0) |> Float.round(2)}%)"
      )
    end)

    IO.puts("Sequences")
    # sequence, ordered list
    oeis_sequences
    |> Enum.map(fn %{sequence: sequence} -> sequence end)
    |> Enum.filter(fn seq -> Atom.to_string(seq) |> String.starts_with?("a") end)
    |> Enum.sort()
    |> Enum.map(fn s -> Atom.to_string(s) |> String.upcase() end)
    |> Enum.chunk_every(10)
    |> Enum.map(fn seq_row -> "\t#{seq_row |> Enum.join(" ")}" end)
    |> Enum.join("\n")
    |> IO.puts()
  end

  defp has_oeis_reference?(seq_def) do
    seq_def
    |> Sequence.get_references()
    |> Enum.filter(fn {src, _, _} -> src == :oeis end)
    |> length() > 0
  end

  @doc """
  OEIS Sequence `A000045` - Fibonacci numbers

  From [OEIS A000045](https://oeis.org/A000045)

  > Fibonacci numbers: F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1. 
  > (Formerly M0692 N0256)

  **Sequence IDs**: `:a000045`, `:fibonacci`

  **Finite**: false

  ## Example
      
      iex> Sequence.create(Sequence.OEIS, :a000045) |> Sequence.take!(10)
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

  """
  @doc sequence: "OEIS A000045 - Fibonacci Numbers [0, 1, 1, 2, 3, 5, ...]",
       references: [{:oeis, :a000045, "https://oeis.org/A000045"}]
  def create_sequence_a000045(_opts) do
    sequence_for_function(&seq_a000045/3)
  end

  @doc sequence: "OEIS A000045 - Fibonacci Numbers [0, 1, 1, 2, 3, 5, ...]",
       references: [{:oeis, :a000045, "https://oeis.org/A000045"}]
  def create_sequence_fibonacci(_opts) do
    sequence_for_function(&seq_a000045/3)
  end

  def seq_a000045(idx, a, b) do
    case idx do
      0 -> 0
      1 -> 1
      _ -> a + b
    end
  end
end
