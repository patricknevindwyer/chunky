defmodule Chunky.Sequence.OEIS do
  @moduledoc """
  Online Encyclopedia of Integer Sequences (OEIS) sequence iterators.

  Supported sequences are broken down into modules based on OEIS Keyword, subject matter, or 
  related methods.

  ## Available Modules

   - `Chunky.Sequence.OEIS.Combinatorics` - Permutations, Combinations, and general Combinatorics sequences
   - `Chunky.Sequence.OEIS.Constants` - Constant values, digit expansions, and constant cycles
   - `Chunky.Sequence.OEIS.Core` - OEIS `core` Keyword sequences
   - `Chunky.Sequence.OEIS.Factors` - Factorizations and divisors
   - `Chunky.Sequence.OEIS.Multiples` - Multiples and addition sequences
   - `Chunky.Sequence.OEIS.Powers` - Powers and simple polynomials
   - `Chunky.Sequence.OEIS.Primes` - Primes and related sequences
   - `Chunky.Sequence.OEIS.Repr` - Number representations, digit contents, and digit patterns
   - `Chunky.Sequence.OEIS.Sigma` - Sequenecs related to the Sigma (𝝈) function

  ## Utility Functions

   - `coverage/0` - Show report of OEIS coverage of select sequence groups, and overall tallying of supported sequences
   - `coverage/1` - Calculate coverage of sequences from a Sequence of OEIS identifiers
   - `find_sequence/1` - Find an OEIS sequence by identifier
   - `find_sequence!/1` - Find an OEIS sequence by identifier, or raise an error
   - `has_sequence?/1` - Check if an OEIS sequence is supported, by atom or string

  ## Coverage

  The Chunky sequence library will never have 100% coverage of OEIS sequences; there are just too many already
  listed, and too many added every year. The goal of the sequence library is to cover the OEIS Core
  set, as well as selected subsets of other keywords or topics.

  Current coverage stats:

  ```
    OEIS Coverage
            745 total sequences
    By Module
            Elixir.Chunky.Sequence.OEIS - 1 sequences
            Elixir.Chunky.Sequence.OEIS.Combinatorics - 7 sequences
            Elixir.Chunky.Sequence.OEIS.Constants - 31 sequences
            Elixir.Chunky.Sequence.OEIS.Core - 136 sequences
            Elixir.Chunky.Sequence.OEIS.Factors - 122 sequences
            Elixir.Chunky.Sequence.OEIS.Multiples - 75 sequences
            Elixir.Chunky.Sequence.OEIS.Powers - 48 sequences
            Elixir.Chunky.Sequence.OEIS.Primes - 100 sequences
            Elixir.Chunky.Sequence.OEIS.Repr - 205 sequences
            Elixir.Chunky.Sequence.OEIS.Sigma - 20 sequences
    Sequence Groups
            OEIS Core Sequences - 135 / 177 (76.27%)
            OEIS Core::Easy Sequences - 121 / 146 (82.88%)
            OEIS Core::Hard Sequences - 12 / 12 (100.0%)
            OEIS Core::Multiplicative Sequences - 22 / 22 (100.0%)
            OEIS Core::Eigen Sequences - 5 / 5 (100.0%)
  ```

  Available/covered sequences, by OEIS ID:

  ```
        A000001 A000002 A000004 A000005 A000007 A000009 A000010 A000012 A000027 A000029
        A000031 A000032 A000035 A000037 A000040 A000041 A000043 A000045 A000048 A000051
        A000069 A000079 A000081 A000085 A000105 A000108 A000109 A000110 A000111 A000112
        A000120 A000123 A000124 A000129 A000142 A000161 A000166 A000169 A000203 A000204
        A000217 A000219 A000225 A000244 A000262 A000272 A000290 A000292 A000302 A000311
        A000312 A000326 A000330 A000351 A000364 A000396 A000400 A000420 A000521 A000578
        A000583 A000593 A000594 A000609 A000670 A000688 A000720 A000788 A000796 A000798
        A000959 A000961 A000977 A000984 A001003 A001006 A001018 A001019 A001020 A001021
        A001022 A001023 A001024 A001025 A001026 A001027 A001029 A001045 A001055 A001057
        A001065 A001101 A001147 A001157 A001158 A001159 A001160 A001190 A001221 A001222
        A001227 A001333 A001358 A001405 A001414 A001477 A001478 A001481 A001489 A001511
        A001519 A001567 A001597 A001615 A001694 A001699 A001700 A001764 A001826 A001842
        A001906 A001969 A002033 A002093 A002106 A002110 A002113 A002182 A002275 A002378
        A002473 A002487 A002530 A002531 A002620 A002654 A002808 A002975 A003094 A003418
        A003484 A003586 A003601 A004144 A004176 A004177 A004178 A004179 A004180 A004181
        A004182 A004183 A004184 A004526 A004709 A004719 A004720 A004721 A004722 A004723
        A004724 A004725 A004726 A004727 A004728 A005100 A005101 A005117 A005153 A005188
        A005349 A005361 A005408 A005470 A005588 A005811 A005823 A005835 A005836 A005843
        A005934 A005935 A005936 A005937 A005938 A005939 A006036 A006037 A006318 A006530
        A006753 A006881 A006882 A006886 A006894 A006966 A007018 A007088 A007089 A007090
        A007091 A007092 A007093 A007094 A007095 A007304 A007318 A007395 A007412 A007434
        A007602 A007770 A007774 A007947 A007953 A007954 A008277 A008279 A008292 A008585
        A008586 A008587 A008588 A008589 A008590 A008591 A008592 A008593 A008594 A008595
        A008596 A008597 A008598 A008599 A008600 A008601 A008602 A008603 A008604 A008605
        A008606 A008607 A008683 A008966 A009003 A009964 A009965 A009966 A009967 A009968
        A009969 A009970 A009971 A009972 A009973 A009974 A009975 A009976 A009977 A009978
        A009979 A009980 A009981 A009982 A009983 A009984 A009985 A009986 A009987 A009988
        A009989 A009990 A009991 A009992 A010344 A010346 A010348 A010350 A010353 A010354
        A010692 A010701 A010709 A010716 A010722 A010727 A010731 A010734 A010850 A010851
        A010852 A010853 A010854 A010855 A010856 A010857 A010858 A010859 A010860 A010861
        A010862 A010863 A010864 A010865 A010866 A010867 A010868 A010869 A010870 A010871
        A010872 A011531 A011532 A011533 A011534 A011535 A011536 A011537 A011538 A011539
        A011540 A011557 A013929 A013954 A013955 A013956 A013957 A013958 A013959 A013960
        A013961 A013962 A013963 A013964 A013965 A013966 A013967 A013968 A014263 A014576
        A014612 A014613 A014614 A016825 A018252 A018253 A018256 A018261 A018266 A018293
        A018321 A018350 A018412 A018609 A018676 A019506 A020136 A020137 A020138 A020139
        A020140 A020141 A020142 A020143 A020144 A020145 A020146 A020147 A020148 A020149
        A020150 A020151 A020152 A020153 A020154 A020155 A020156 A020157 A020158 A020159
        A020160 A020161 A020162 A020163 A020164 A020165 A020166 A020167 A020168 A020169
        A020170 A020171 A020172 A020173 A020174 A020175 A020176 A020177 A020178 A020179
        A020180 A020181 A020182 A020183 A020184 A020185 A020186 A020187 A020188 A020189
        A020190 A020191 A020192 A020193 A020194 A020195 A020196 A020197 A020198 A020199
        A020200 A020201 A020202 A020203 A020204 A020205 A020206 A020207 A020208 A020209
        A020210 A020211 A020212 A020213 A020214 A020215 A020216 A020217 A020218 A020219
        A020220 A020221 A020222 A020223 A020224 A020225 A020226 A020227 A020228 A020639
        A023416 A023692 A023693 A023694 A023695 A023696 A023697 A023698 A023699 A023700
        A023701 A023702 A023703 A023704 A023705 A023706 A023707 A023708 A023709 A023710
        A023711 A023712 A023713 A023714 A023715 A023716 A023717 A023718 A023719 A023720
        A023721 A023722 A023723 A023724 A023725 A023726 A023727 A023728 A023729 A023730
        A023731 A023732 A023733 A023734 A023735 A023736 A023738 A023739 A023740 A023745
        A023746 A023747 A023748 A023749 A023750 A023751 A023752 A023753 A023754 A023755
        A023756 A023757 A027642 A030513 A030515 A031177 A032924 A033273 A033942 A033987
        A033992 A033993 A036537 A037143 A038109 A039956 A043321 A044102 A046099 A046253
        A046306 A046308 A046310 A046312 A046314 A046321 A046386 A046387 A046660 A046758
        A046759 A046760 A048272 A049310 A051003 A051037 A051038 A051270 A052040 A052382
        A052383 A052404 A052405 A052406 A052413 A052414 A052419 A052421 A052486 A053816
        A054377 A055512 A055640 A055641 A055642 A056911 A057716 A059015 A059269 A059376
        A059377 A059378 A062756 A062768 A063416 A063997 A065958 A065959 A065960 A067251
        A067259 A067885 A069091 A069092 A069093 A069094 A069095 A069272 A069273 A069274
        A069275 A069276 A069277 A069278 A069279 A069280 A069281 A069537 A069540 A069543
        A070939 A071858 A074206 A074940 A074969 A076479 A077267 A080197 A080681 A080682
        A080683 A081603 A081605 A081606 A085959 A087752 A097251 A097252 A097253 A097254
        A097255 A097256 A097257 A097258 A097259 A097260 A097261 A097262 A099542 A100968
        A100969 A100970 A100971 A100972 A100973 A100974 A100975 A100987 A100988 A102669
        A102670 A102671 A102672 A102673 A102674 A102675 A102676 A102677 A102678 A102679
        A102680 A102681 A102682 A102683 A102684 A114904 A115983 A117805 A121022 A121023
        A121024 A121025 A121026 A121027 A121028 A121029 A121030 A121031 A121032 A121033 
        A121034 A121035 A121036 A121037 A121038 A121039 A121040 A122840 A123321 A123322
        A130897 A135628 A135631 A138591 A152691 A159981 A159984 A159986 A159987 A159988
        A159989 A159991 A160093 A160889 A160891 A160893 A160895 A160897 A160908 A160953
        A160957 A160960 A161948 A161949 A161950 A161951 A161952 A161953 A162511 A162643
        A165412 A169823 A169825 A169827 A174312 A178858 A178859 A178860 A178861 A178862
        A178863 A178864 A178877 A178878 A179868 A193238 A194472 A195819 A196563 A209061
        A211337 A211338 A248910 A249674 A252994 A255731 A255732 A255735 A255736 A255805
        A255808 A289682 A305548
  ```

  """
  import Chunky.Sequence, only: [sequence_for_list: 1]
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
      |> Sequence.take!(1000)
      |> Enum.filter(fn sequence -> !Enum.member?(all_sequences, sequence) end)

    %{
      covered: length(covered),
      total: length(mapped_seq),
      percent: length(covered) / length(mapped_seq),
      missing_sequences: missing_seqs
    }
  end

  @doc """
  Find a sequence definition by sequence identifier.

  ## Example

      iex> Sequence.OEIS.find_sequence("A159986")
      {:ok, %{description: "Catalan numbers read modulo 7 .", module: Chunky.Sequence.OEIS.Combinatorics, name: "A159986", sequence: :a159986}}

      iex> Sequence.OEIS.find_sequence("A999999999")
      {:error, :not_found}

      iex> Sequence.OEIS.find_sequence(:a010853)
      {:ok, %{description: "Constant sequence: a(n) = 14.", module: Chunky.Sequence.OEIS.Constants, name: "A010853", sequence: :a010853}}
  """
  def find_sequence(name) when is_binary(name) do
    case Sequence.available()
         |> Enum.filter(fn %{name: seq_name} ->
           String.downcase(name) == String.downcase(seq_name)
         end) do
      [] -> {:error, :not_found}
      [seq] -> {:ok, seq}
      _seqs -> {:error, :duplicate_sequences}
    end
  end

  def find_sequence(name) when is_atom(name), do: find_sequence(name |> Atom.to_string())

  @doc """
  Like `find_sequence/1`, but directly return the sequence bundle, or raise an error.

  The sequece bundle can be handed directly to `Chunky.Sequence.create/1`.

  ## Example

      iex> seq = Sequence.OEIS.find_sequence!(:a159986) |> Sequence.create() |> Sequence.start()
      iex> seq.value
      1
  """
  def find_sequence!(name) when is_binary(name) do
    case find_sequence(name) do
      {:ok, seq} -> seq
      _ -> raise ArgumentError, message: "no such sequence"
    end
  end

  def find_sequence!(name) when is_atom(name), do: find_sequence!(name |> Atom.to_string())

  @doc """
  Determine if a specific OEIS sequence is available.

  ## Examples

      iex> Sequence.OEIS.has_sequence?(:a159986)
      true

      iex> Sequence.OEIS.has_sequence?("A008598")
      true

      iex> Sequence.OEIS.has_sequence?("A99999999")
      false
  """
  def has_sequence?(name) when is_binary(name) do
    case find_sequence(name) do
      {:ok, _} -> true
      _ -> false
    end
  end

  def has_sequence?(name) when is_atom(name), do: has_sequence?(name |> Atom.to_string())

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
end
