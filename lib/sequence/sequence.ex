defmodule Chunky.Sequence do
  @moduledoc """
  Create and manipulate mathematical sequences.

  New values in the sequences are created only when requested, allowing iteration
  of finite and infinite data in a lazy fashion:

  ```elixir
  iex> data = Sequence.create(Sequence.Basic, :whole_numbers) |> Sequence.take(6)
  iex> data |> Tuple.to_list() |> List.first()
  [1, 2, 3, 4, 5, 6]
  ```

  # Available Sequences

  The Chunky.Sequence modules have sequences available in:

   - `Chunky.Sequence.Basic` - Simple integer sequences, and defined sequence progressions
   - `Chunky.Sequence.OEIS` - Integer Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org)
   - `Chunky.Sequence.Test` - Sequences for test purposes

  # About Sequences

  Sequences are stateful - sequence manipulations will always return a `%Sequence{}`
  object along with any other requested data. Repeated calls to the same instance
  of a Sequence struct will always yield the same result:

  ```elixir
  iex> seq = Sequence.create(Sequence.Basic, :whole_numbers, [start: 100])
  iex> (seq |> Sequence.next!()).value
  100
  iex> (seq |> Sequence.next!()).value
  100
  ```

  The updated Sequence struct needs to be maintained, and passed along to other
  functions, to create new sequence values:

  ```elixir
  iex> seq_a = Sequence.create(Sequence.Basic, :whole_numbers, [start: 100])
  iex> seq_b = seq_a |> Sequence.next!()
  iex> seq_b.value
  100
  iex> seq_c = seq_b |> Sequence.next!()
  iex> seq_c.value
  101
  ```

  or

  ```elixir
  iex> seq_a = Sequence.create(Sequence.Basic, :whole_numbers, [start: 100])
  iex> seq_n = seq_a |> Sequence.next!() |> Sequence.next!() |> Sequence.next!()
  iex> seq_n.value
  102
  ```

  Sequences count indices as they go - the first value will always be at index `0`:

  ```elixir
  iex> {_v, seq} = Sequence.create(Sequence.Basic, :whole_numbers) |> Sequence.next()
  iex> seq.value
  1
  iex> seq.index
  0
  ```

  Some sequences start at an index _other than_ 0, like the Sum of Odd Divisors (A000593):

  ```elixir
  iex> seq = Sequence.create(Sequence.OEIS.Core, :a000593) |> Sequence.next!()
  iex> seq.index
  1
  ```

  # Working with Sequences

  ## Creating Sequences

   - `create/3` - Create a new sequence instance

  ## Finding and Inspecting Sequences

   - `available/0` - List all loaded sequences from all loaded applications and modules
   - `available/1` - List available sequences from a specific module
   - `has_next?/1` - Check that a sequence has at least one more available value
   - `is_available?/2` - Check if a specific sequence is available
   - `is_finite?/1` - Check of a sequence is finite or infinite in the Sequence library implementation
   - `is_instance?/2` - Check if a sequence is an instance of a specific sequence identifier
   - `is_instance?/3` - Check if a sequence is an instance of a specific sequence identifier
   - `get_references/1` - Retrieve reference sources and links for a sequence
   - `has_reference?/2` - Check if a sequence has a specific reference source
   - `readable_name/1` - Find the human readable name of a sequence

  ## Manipulating Sequences

   - `drop/2` - Drop N values from the front of the sequence
   - `map/2` - Apply a function to values in a sequence, and collect the result
   - `next/1` - Retrieve the next sequence value and updated sequence struct as a tuple
   - `next!/1` - Retrieve the next sequence as just an updated sequence struct
   - `take/2` - Like `Enum.take/2` - retrieve a list of values from a sequence
   - `take!/2` - Like `take/2`, but only return the updated sequence struct

  ## Developing Sequences

   - `sequence_for_function/1` - Wrap a function as a sequence - see Developing New Sequences
   - `sequence_for_list/1` - Wrap a list as a sequence - see Developing New Sequences

  # Developing New Sequences

  Sequences can be built in three different ways:

   - Verbose Iterators (See `Sequence.Basic.create_sequence_whole_numbers/1`)
   - Simple Functions (See `sequence_for_function/1` and `Sequence.OEIS.create_sequence_a000045/1`)
   - Static Lists (See `sequence_for_list/1` and `Sequence.Basic.create_sequence_empty/1`)

  All three ways of developing sequences have things in common:

   - All will have a `create_sequence_*/1` function - this is how the Sequence package finds and instantiates sequences
   - All will have common function attributes (via data `@doc` attributes) for the `create_sequence_*/1` function

  ## Sequence Attributes

  Top level `create_sequence_*` functions should have the following attributes:

   - `sequence` - Readable name of the sequence
   - `references` - List of tuples of the form `{:source, :short_name, "URI"}`

  along with the required attributes, the following optional attributes can be used:

   - `offset` - Integer. Default `0`. Start a sequence at an index other than `0`.

  ## Verbose Iterators

  The most expressive way to write sequences is using the Verbose Iterators technique. In this style, the `create_sequence_*/1`
  function returns a map that is used to build out the `%Sequence{}` struct. Let's take apart the `:whole_numbers` sequence
  in the `Sequence.Basic` module.

  The create function looks like:

  ```elixir
  @doc sequence: "Whole numbers: [1, 2, 3, 4, 5, ...]", references: [{:wolfram, :positive_integer, "http://mathworld.wolfram.com/PositiveInteger.html"}, {:wikipedia, :natural_number, "https://en.wikipedia.org/wiki/Natural_number"}]
  def create_sequence_whole_numbers(opts \\ []) do
      start = opts |> Keyword.get(:start, 1)
      
     %{
         next_fn: &seq_whole_number_next/3,
         data: %{
             start: start
         }
     } 
  end   
  ```

  Starting with the `@doc` attributes, and working through the whole function:

   1. The `@doc` attribute defines the sequence readable name with the `sequence:` attribute
   2. The `@doc` attribute defines _references_ for the sequence with the `references:` attribute (See `get_references/1`)
   3. The function signature `create_sequence_whole_numbers/1` defines the sequence identifier `whole_numbers` - this is automatically translated by the Sequence module functions
   4. For this sequence, we check for a `start` option - what value our sequence should start at
   5. We return a Map with two keys, the `next_fn` which is a function with arity 3, and a `data` attribute, which we can use to store any data we like

  Every `next_fn` (or _iterator_ function) for a sequence can be called in two ways; `:init` mode and `:next` mode. The
  `:init` mode is used to prime the value and our state, the `data` attribute we set in our create function. In `:next`
  mode we generate the next value in our sequence. Both modes can update the `data` state map, which is maintained by
  the sequence functions. This allows more complex information needed to generate values to be stored.

  Let's take a look at how the `seq_whole_number_next/3` function we referenced handles the two modes for the `:whole_numbers` sequence:

  ```elixir
  defp seq_whole_number_next(:init, data, _value) do
      %{
          data: data,
          value: data.start - 1
      }
  end

  defp seq_whole_number_next(:next, data, value) do
     {
         :continue,
         %{data: data, value: value + 1}
     } 
  end   
  ```

  In this case we use two different functions to handle the `:init` and `:next` states. In the `:init` we update our value,
  and return our state (the `data` attribute) as is. When generating the next iteration value in `:next` mode, we refernce
  the `value` parameter, which was the last calculated value for the sequence. In this case we return a slightly different
  structure: we explicitly let the iterator know that our sequence can continue further - we have more values.

  The return value of the `next_fn` iterator can be of three forms. Map form:

  ```elixir
  %{data: %{}, value: _}
  ```

  _Continue_ tuple form:

  ```elixir
  {
      :continue,
      %{data: %{}, value: _}
  }
  ```

  or _Last_ tuple form:

  ```elixir
  {
      :last,
      %{data: %{}, value: _}
  }
  ```

  If the `:last` tuple form is returned, the sequence is marked as finished, and no further values will be
  generated.

  ## Simple Functions

  Some sequences can be generated from a single function, like many mathematical progressions. The Verbose Iterator
  way of writing a sequence would be overkill - we can use the `sequence_for_function/1` utility for wrapping a
  single function in a sequence. See `sequence_for_function/1` for more details.

  As a simple example we can look at how the OEIS Fibonacci sequence is implemented:

  ```elixir
  @doc sequence: "OEIS A000045 - Fibonacci Numbers [0, 1, 1, 2, 3, 5, ...]", references: [{:oeis, :a000045, "https://oeis.org/A000045"}]
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
  ```

  Like when writing a sequence as a Verbose Iterator, we have a `create_sequence_*/1` function with
  `@doc` attributes that define the sequence name and references. Then we provide the `sequence_for_function/1`
  function with a reference to the function that generates values - in this case a fibonacci function that
  uses the index and last two calculated values to determine the next value in the sequence. 

  ## Static Lists

  For sufficiently small finite lists, we can use the `sequence_for_list/1` utility function to wrap
  a list of static values as a sequence. See `sequence_for_list/1` for more details.

  We can take apart the `:decimal_digits` sequence:

  ```elixir
  @doc sequence: "Decimal digits: [0, 1, 2, 3, 4, ...]", references: [{:wikipedia, :decimal_digit, "https://en.wikipedia.org/wiki/Numerical_digit"}]
  def create_sequence_decimal_digits(_opts) do
      sequence_for_list([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end   
  ```

  This sequence has the expected `sequence:` and `references:` doc attributes, and then a call to the
  `sequence_for_list/1` function with a list of data.

  """

  defstruct [:next_fn, :data, :index, :value, :finished, :instance, :finite]

  alias Chunky.Sequence

  @doc """
  Retrieve the first `N` values from a sequence, like `Enum.take/2`.

  This version of the **take** function returns a separate list of values and
  the sequence state. See also `Sequence.take!/2`.

  ## Examples

      iex> seq = Sequence.create(Sequence.Basic, :whole_numbers)
      iex> {values, _n_seq} = seq |> Sequence.take(10)
      iex> values
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

      iex> seq = Sequence.create(Sequence.OEIS, :fibonacci)
      iex> {values, _n_seq} = seq |> Sequence.take(10)
      iex> values
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

  """
  # this is a hack, but it works for now - covers Empty Sets
  def take(%Sequence{data: %{list: []}} = sequence, _count), do: {[], sequence}
  # cover finished sequences
  def take(%Sequence{finished: true} = sequence, _count), do: {[], sequence}
  def take(%Sequence{} = sequence, count) when is_integer(count) and count < 1, do: {[], sequence}

  def take(%Sequence{} = sequence, 1) do
    {v, u_seq} = next(sequence)
    {[v], u_seq}
  end

  def take(%Sequence{} = sequence, count) do
    {n, u_seq} = next(sequence)
    {rest, l_seq} = take(u_seq, count - 1)

    {[n] ++ rest, l_seq}
  end

  @doc """
  Drop values from the front of the sequence, returning the updated
  sequence struct. Like `Enum.drop/2`.

  ## Examples

      iex> seq = Sequence.create(Sequence.Basic, :whole_numbers)
      iex> seq |> Sequence.drop(10) |> Sequence.take!(10)
      [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  """
  def drop(%Sequence{} = sequence, 0), do: sequence

  def drop(%Sequence{} = sequence, count) when is_integer(count) and count > 1 do
    {_v, u_seq} = take(sequence, count)
    u_seq
  end

  @doc """
  Apply a function to every value in a Sequence. Like `Enum.map/2`.

  For infinite sequences, this will never complete. Use `Sequence.take/2` and apply
  a normal map.

  ## Examples

      iex> Sequence.create(Sequence.Test, :list_medium) |> Sequence.map(fn v -> v * 3 end)
      [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]

  """
  def map(%Sequence{data: %{list: []}}, map_func) when is_function(map_func, 1), do: []

  def map(%Sequence{} = sequence, map_func) when is_function(map_func, 1) do
    if sequence.finished do
      []
    else
      {v, u_seq} = sequence |> next()
      [map_func.(v)] ++ map(u_seq, map_func)
    end
  end

  @doc """
  Retrieve the next `count` values from a sequence, without retaining sequence state.

  This function behaves similarly to the `take/2` function, but the state of the 
  sequence isn't maintained, so any subsequent calls to the same sequence will still
  contain the values retrieved with `take!`.

  ## Examples

      iex> seq = Sequence.create(Sequence.Basic, :whole_numbers)
      iex> seq |> Sequence.take!(5)
      [1, 2, 3, 4, 5]
      iex> seq |> Sequence.take!(10)
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  """
  def take!(%Sequence{} = seq, count) when is_integer(count) do
    {res, _seq} = take(seq, count)
    res
  end

  @doc """
  Create a new sequence from a simple function and an information function. 

  The simple sequence function should take one or more parameters, 
  corresponding to the last `N` values of the sequence. 

  ## Configuration

  Configuration values for the `sequence function` can be provided as `@doc`
  string attributes on the function. Supported attributes are:

   - `fill_value` - Integer. Optional. Default `0`. Filler value used as parameters to sequence function when existing values haven't yet been calculated
   - `sequence` - String. Required. Short sequence summary.
   - `data` - Map. Optional. Static information to add to sequence `data` attribute
   
  ## Sequence Function

  The sequence function will be called with the **index** of the current value to calculate, and
  the last `N` values of the function, where `N` is the function arity minus one. For example,
  to setup a function that adds the last three values in the sequence, with the first three values
  being `1, 1, 1`, we could write the function:

  ```elixir
  def add_last_three(_idx, a, b, c) do
      case {a, b, c} do
          {0, 0, 0} -> 1
          {0, 0, _} -> 2
          {0, _, _} -> 3
          {va, vb, vc} -> va+vb+vc
      end
  end
  ```

  In this case we don't use the index of the function at all. Using the `sequence_for_function/1`
  call we could register this sequence inside a create function (so that it can be properly instantiated):

  ```elixir
  def create_sequence_add_last_three(_opts) do
      sequence_for_function(&add_last_three/4)
  end
  ```

  Note that the `create_sequence_add_last_three/1` function should have proper `sequence` and 
  `references` attributes. See the Developing Sequences section for more details.

  ## Attributes

  For the `@doc` attributes of the sequence function to readable, the function reference passed
  to the `sequence_for_function/1` function must be scoped to a module or module alias, not a bare
  referene. This means that this will work:

  ```
  sequence_for_function(&Sequence.Test.seq_last_three/4)
  ```

  but the following will not:

  ```
  sequence_for_function(&seq_last_three/4)
  ```

  ### Offset Attribute

  Some sequences don't start counting at index 0. When a different offset is required than the default `0`,
  the `offset` attribute can be used. This attribute needs to be set on the `create_sequence_*` function
  as well as the simple sequence function:

  ```elixir
  @doc offset: 2
  def create_sequence_count_from_two(_opts) do

  end

  @doc offset: 2
  def seq_count_from_two(idx) do
      # first _idx_ received will be 2
  end
  ```

  ### Data attribute

  If the sequence function uses a _data_ attribute, the call signature of the sequence function
  changes. For example, a simple function using the last two values, with _no data_ attribute, will
  have a function signature like:

  ```elixir
  def seq_no_data_last_two(idx, a, b) do
      ...
  end
  ```

  While a sequence function that _has_ a data attribute will look like:

  ```elixir
  @doc data: %{start_values: [1, 2, 3]}
  def seq_with_data_last_two(data, idx, a, b) do
      ...
  end
  ```

  ### Fill Value attribute

  Sequence functions that reference past values are normally called with `0` if some of the
  past values haven't yet been created. The `fill_value` doc attribute can be used to change
  the default value.

  For instance, on the first call to iterate the sequence:

  ```elixir
  def seq_defaults_last_two(idx, a, b) do
      # a == 0
      # b == 0
  end
  ```

  but when we change the `fill_value`:

  ```elixir
  @doc fill_value: 17
  def seq_fill_last_two(idx, a, b) do
      # a == 17
      # b == 17
  end
  ```

  """
  def sequence_for_function(seq_function) when is_function(seq_function) do
    # setup the attribute data
    sf_meta = Function.info(seq_function) |> Map.new()
    attrs = attributes_for_function(sf_meta.module, sf_meta.name, sf_meta.arity)

    # select out the function attributes we want to track
    fill_value = Map.get(attrs, :fill_value, 0)
    data = Map.get(attrs, :data, %{})
    index_offset = Map.get(attrs, :offset, 0)

    # does this function have a data attribute?
    has_data_attr = Map.has_key?(attrs, :data)

    # setup our tracking data for value mapping
    last_n_size =
      if has_data_attr do
        sf_meta.arity - 2
      else
        sf_meta.arity - 1
      end

    data =
      if last_n_size == 0 do
        data |> Map.put(:last_n, [])
      else
        data |> Map.put(:last_n, 1..last_n_size |> Enum.map(fn _ -> fill_value end))
      end

    data = data |> Map.put(:index, index_offset)

    # setup the sequence function wrapper
    sff_next = fn mode, n_data, _value ->
      case mode do
        :init ->
          %{data: data, value: fill_value}

        :next ->
          # if our function has a data attribute, it's the first value in the call
          # list, otherwise the index is first
          apply_values =
            if has_data_attr do
              [data, n_data.index] ++ n_data.last_n
            else
              [n_data.index] ++ n_data.last_n
            end

          # call function on last N values
          new_value = apply(seq_function, apply_values)
          new_last_n = Enum.drop(n_data.last_n ++ [new_value], 1)
          %{data: %{n_data | last_n: new_last_n, index: n_data.index + 1}, value: new_value}
      end
    end

    # build a struct
    %{
      next_fn: sff_next,
      data: data,
      source: :sequence_for_function
    }
  end

  @doc """
  Create a sequence that references a static list of data.

  In the case of suitable small finite sequences, it is significantly easier to
  use a static list of data as a sequence. The `sequence_for_list/1` function provides
  a simple way to do this. For example, to create a sequence for a short list of 5
  numbers:

  ```elixir
  def create_sequence_my_short_list(_opts) do
      sequence_for_list([3, 7, 11, 27, 47])
  end
  ```

  Like with the `sequence_for_function/1` example, the above example `create_sequence_*` function
  should include full `sequence` and `references` doc attributes. See the Developing Sequences
  section for more details.

  Sequences generated from a list behave just like any other sequence.

  ## Attributes of List Sequences

  ## Finite Sequence

  A sequence created from a list is automatically marked as _finite_. See `is_finite?/1`.

  ## Offset Attribute

  Some sequences don't start counting at index 0. When a different offset is required than the default `0`,
  the `offset` attribute can be used. This attribute needs to be set on the `create_sequence_*` function.

  ```elixir
  @doc offset: 2
  def create_sequence_count_from_two(_opts) do
      sequence_from_list([0, 0, 200, 201, 203, 204])
  end
  ```

  """
  def sequence_for_list(list_data) when is_list(list_data) do
    # setup the attribute data
    data = %{
      list: list_data,
      index: 0
    }

    # setup the sequence function wrapper
    sff_next = fn mode, n_data, _value ->
      case mode do
        :init ->
          %{data: data, value: 0}

        :next ->
          # do we have any more values?
          cond do
            length(n_data.list) == 0 ->
              {:last, %{data: n_data, value: 0}}

            n_data.index + 1 == length(n_data.list) ->
              {
                :last,
                %{
                  data: %{n_data | index: n_data.index + 1},
                  value: n_data.list |> List.last()
                }
              }

            true ->
              {
                :continue,
                %{
                  data: %{n_data | index: n_data.index + 1},
                  value: n_data.list |> Enum.at(n_data.index)
                }
              }
          end
      end
    end

    # build a struct
    %{
      next_fn: sff_next,
      data: data,
      source: :sequence_for_list
    }
  end

  @doc """
  Check that a sequence has more values.

  Some sequences are finite, and have distinct end points. For finite sequences
  it can make sense to check for additional values before trying to access more
  data:

      iex> seq = Sequence.create(Sequence.Basic, :empty) |> Sequence.next!()
      iex> seq |> Sequence.has_next?()
      false

      iex> seq = Sequence.create(Sequence.Basic, :whole_numbers) |> Sequence.next!()
      iex> seq |> Sequence.has_next?()
      true

  """
  def has_next?(%Sequence{finished: false}), do: true
  def has_next?(%Sequence{}), do: false

  @doc """
  Determine if a sequence is finite or infinite.

  A sequence being finite or infinite is not a reflection of the absolute computability or
  theoretical limits of a sequence, but is determined by the quantity of values
  available in the Sequence library implementation.

  ## Examples

      iex> Sequence.create(Sequence.OEIS, :fibonacci) |> Sequence.is_finite?()
      false

      iex> Sequence.create(Sequence.OEIS.Core, :a000041) |> Sequence.is_finite?()
      true

  """
  def is_finite?(%Sequence{finite: f}) when is_boolean(f), do: f

  @doc """
  Iterate a sequence, returning only the updated Sequence structure.

  The Sequence structure maintains the last index and value seen in a sequence, so
  is a useful shorthand when explictly returning the sequence value isn't necessary.
  This also makes it possible to chain together calls to `next!/1` and other sequence
  methods.

  ## Examples

      iex> seq = Sequence.create(Sequence.Basic, :whole_numbers)
      iex> updated_seq = seq |> Sequence.next!()
      iex> updated_seq.value
      1

  """
  def next!(%Sequence{} = sequence) do
    {_v, n_seq} = next(sequence)
    n_seq
  end

  @doc """
  Iterate a sequence, returning the sequence value and updated sequence struct.

  The sequence struct needs to be maintained in order to iterate a sequence; with the
  `next/1` function, you can access the iterated value _and_ the updated struct with
  the same call.

  ## Example

      iex> seq = Sequence.create(Sequence.Basic, :whole_numbers)
      iex> {val, _updated_seq} = seq |> Sequence.next()
      iex> val
      1
  """
  def next(%Sequence{} = sequence) do
    # call next function with (:next)
    case sequence.next_fn.(:next, sequence.data, sequence.value) do
      %{value: value, data: data} ->
        # store (value, data), and return
        {value, %{sequence | data: data, value: value, index: sequence.index + 1}}

      {:continue, %{value: value, data: data}} ->
        # store (value, data), and return
        {value, %{sequence | data: data, value: value, index: sequence.index + 1}}

      {:last, %{value: value, data: data}} ->
        # store (value, data), and return
        {value, %{sequence | data: data, value: value, finished: true, index: sequence.index + 1}}
    end
  end

  # initialize a sequence, setting up the "pre" state of the full sequence
  defp init(%Sequence{} = sequence) do
    # call next function with (:init)
    %{value: value, data: data} = sequence.next_fn.(:init, sequence.data, sequence.value)

    # store (value, data)
    %{sequence | data: data, value: value}
  end

  @doc """
  Instantiate an instance of a sequence.

      iex> seq = Sequence.create(Sequence.Basic, :empty)
      iex> seq |> Sequence.readable_name()
      "Empty sequence: []"

      iex> seq = Sequence.create(Sequence.OEIS, :fibonacci)
      iex> seq |> Sequence.take!(10)
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

  Some sequences accept options, which change the progression or shape of the generated
  sequence data:

      iex> Sequence.create(Sequence.Basic, :whole_numbers) |> Sequence.take!(5)
      [1, 2, 3, 4, 5]

      iex> Sequence.create(Sequence.Basic, :whole_numbers, [start: 13]) |> Sequence.take!(5)
      [13, 14, 15, 16, 17]

  ## Finding Available Sequences

  Sequences are referenced by Module name and a sequence identifier. 

  The documentation for the Sequence sub-modules contains reference data for all available
  sequences. See:

   - `Chunky.Sequence.Basic`
   - `Chunky.Sequence.OEIS`

  Available sequences can be found with `available/1`:

      iex> Sequence.available(Sequence.Basic) |> List.first()
      %{description: "Decimal digits: [0, 1, 2, 3, 4, ...]", name: "Decimal Digits", sequence: :decimal_digits, module: Sequence.Basic}
      
  The function name within a module can also be used to identify a sequence, as all 
  sequence generation functions follow the format `create_sequence_*`. The OEIS `fibonacci`
  sequence is indirectly created via the function `Chunky.Sequence.OEIS.create_sequence_fibonacci/1`.
  """
  def create(module, seq_name, opts \\ []) when is_atom(seq_name) do
    case Code.ensure_loaded?(module) do
      true ->
        # convert the sequence name to a :create_sequence_* name 
        create_fn = "create_sequence_#{seq_name}" |> String.to_atom()

        if is_available?(module, seq_name) do
          # run create, capture the output
          %{next_fn: next_fn, data: data} = creation_data = apply(module, create_fn, [opts])

          # check for finite/infinite based on how the sequence was created
          seq_finite =
            case Map.get(creation_data, :source, :direct) do
              :sequence_for_list -> true
              _ -> false
            end

          # check the creation function for an `offset` attribute, which can shift the
          # starting point of our index. The offste is added to our default offset.
          create_fn_attrs = attributes_for_function(module, create_fn, 1)

          offset_adjustment =
            case create_fn_attrs do
              %{offset: v} when is_integer(v) -> v
              _ -> 0
            end

          %Sequence{
            next_fn: next_fn,
            data: data,
            value: 0,
            index: -1 + offset_adjustment,
            finished: false,
            instance: {module, seq_name},
            finite: seq_finite
          }
          |> init()
        else
          :no_such_sequence
        end

      false ->
        :no_such_module
    end
  end

  @doc """
  Check if a sequence struct is an instance of a specific sequence.

  See also `is_instance?/3`.

  ## Example

      iex> seq = Sequence.create(Sequence.OEIS, :a000045)
      iex> seq |> Sequence.is_instance?({Sequence.OEIS, :a000066})
      false
      iex> seq |> Sequence.is_instance?({Sequence.OEIS, :a000045})
      true
      
  """
  def is_instance?(%Sequence{} = sequence, {module, seq_name}) when is_atom(seq_name) do
    sequence.instance == {module, seq_name}
  end

  @doc """
  Check if a sequence struct is an instance of a specific sequence.

  See also `is_instance?/2`.

  ## Example

      iex> seq = Sequence.create(Sequence.OEIS, :a000045)
      iex> seq |> Sequence.is_instance?(Sequence.OEIS, :a000066)
      false
      iex> seq |> Sequence.is_instance?(Sequence.OEIS, :a000045)
      true
      
  """
  def is_instance?(%Sequence{} = sequence, module, seq_name) when is_atom(seq_name) do
    is_instance?(sequence, {module, seq_name})
  end

  @doc """
  Determine if a specific sequence is available.

  ## Example

      iex> Sequence.is_available?(Sequence.OEIS, :fibonacci)
      true

      iex> Sequence.is_available?(Sequence.OEIS, :quadronacci)
      false

  """
  def is_available?(module, seq_name) when is_atom(seq_name) do
    create_fn = "create_sequence_#{seq_name}" |> String.to_atom()

    module.__info__(:functions)
    |> Enum.filter(fn {func, arity} ->
      # take apart the functions
      func == create_fn && arity == 1
    end)
    |> length() == 1
  end

  @doc """
  Retrieve sequence reference data for a sequence instance.

  Every sequence can have zero or more references to online sources, documentation,
  or sequence metadata. Common references are [OEIS](https://oeis.org), 
  [Wikipedia](https://en.wikipedia.org/wiki/Main_Page), and [Wolfram MathWorld](http://mathworld.wolfram.com).

  Each reference is of the form `{:source, :identifier, "URI"}`. 

  You can also check for specific references with `has_reference/2`.

  ## Examples

      iex> Sequence.create(Sequence.Basic, :whole_numbers) |> Sequence.get_references()
      [{:wolfram, :positive_integer, "http://mathworld.wolfram.com/PositiveInteger.html"}, {:wikipedia, :natural_number, "https://en.wikipedia.org/wiki/Natural_number"}]

  """
  def get_references(%Sequence{} = sequence) do
    {mod, fun} = sequence.instance
    full_fun = "create_sequence_#{fun}" |> String.to_atom()

    attrs = attributes_for_function(mod, full_fun, 1)

    attrs |> Map.get(:references, [])
  end

  @doc """
  Retrieve sequence reference data from a sequence description dictionary, like those returned
  by `available/1` and `available/0`.

  ## Examples

      iex> %{module: Chunky.Sequence.OEIS.Factors, sequence: :a052486} |> Sequence.get_references()
      [{:oeis, :a052486, "https://oeis.org/A052486"}, {:wikipedia, :achilles_number, "https://en.wikipedia.org/wiki/Achilles_number"}]
  """
  def get_references(%{sequence: seq_atom, module: mod_atom})
      when is_atom(seq_atom) and is_atom(mod_atom) do
    full_fun = "create_sequence_#{seq_atom}" |> String.to_atom()

    attrs = attributes_for_function(mod_atom, full_fun, 1)

    attrs |> Map.get(:references, [])
  end

  @doc """
  Check if a sequence instance has a reference to a specific source.

  See also `get_references/1`.

  ## Examples

      iex> Sequence.create(Sequence.Basic, :whole_numbers) |> Sequence.has_reference?(:wolfram)
      true

      iex> Sequence.create(Sequence.OEIS, :a000045) |> Sequence.has_reference?(:oeis)
      true

      iex> Sequence.create(Sequence.OEIS, :a000045) |> Sequence.has_reference?(:wolfram)
      false

  """
  def has_reference?(%Sequence{} = sequence, seq_type) when is_atom(seq_type) do
    get_references(sequence)
    |> Enum.filter(fn {st, _, _} -> st == seq_type end)
    |> length() > 0
  end

  @doc """
  Get a human readable name for a sequence.

  ## Example

      iex> Sequence.create(Sequence.OEIS, :a000045) |> Sequence.readable_name()
      "OEIS A000045 - Fibonacci Numbers [0, 1, 1, 2, 3, 5, ...]"

  """
  def readable_name(%Sequence{} = sequence) do
    {mod, fun} = sequence.instance
    full_fun = "create_sequence_#{fun}" |> String.to_atom()

    attrs = attributes_for_function(mod, full_fun, 1)

    attrs |> Map.get(:sequence, "")
  end

  @doc """
  Scan all loaded applications and modules for sequences.

  This is almost identical to the `available/1` function, but it scans a selection of loaded applications
  and modules, excluding the core libraries, for sequences. The return values are the same as for `available/1`.

  """
  def available do
    skip_list = [
      :logger,
      :public_key,
      :crypto,
      :compiler,
      :ssl,
      :asn1,
      :kernel,
      :iex,
      :inets,
      :hex,
      :elixir,
      :mix,
      :stdlib,
      :ssl_verify_fun,
      :hackney,
      :httpoison,
      :jason,
      :unicode_util_compat,
      :metrics,
      :idna,
      :mimerl,
      :certifi
    ]

    # find loading applications
    Application.loaded_applications()
    |> Enum.map(fn {lib, _, _} -> lib end)

    # skip things that we know we don't need to check
    |> Enum.reject(fn app -> Enum.member?(skip_list, app) end)

    # turn the applications into modules
    |> Enum.map(fn app ->
      {:ok, mod_list} = :application.get_key(app, :modules)
      mod_list
    end)
    |> List.flatten()

    # check for available sequences
    |> Enum.map(&available/1)
    |> List.flatten()
  end

  @doc """
  List available sequence in a specific module.

  Sequences are organized into modules, with sequences of different sources or shapes
  in different modules. Sequences built or included via alternate packages can also
  be queried this way.

  ## Example

       iex> Sequence.available(Sequence.Basic) |> length()
       3
       
       iex> Sequence.available(Sequence.Basic) |> List.last()
       %{description: "Whole numbers: [1, 2, 3, 4, 5, ...]", name: "Whole Numbers", sequence: :whole_numbers, module: Sequence.Basic}

  """
  def available(module) do
    mod_docs = Code.fetch_docs(module)

    module.__info__(:functions)
    |> Enum.filter(fn {func, arity} ->
      # take apart the functions
      func |> Atom.to_string() |> String.starts_with?("create_sequence") && arity == 1
    end)
    |> Enum.map(fn {func, arity} ->
      # generate the function name atom
      base = func |> Atom.to_string() |> String.trim("create_sequence_")

      # nice function naming
      nice_name =
        base
        |> String.replace("_", " ")
        |> String.split(" ")
        |> Enum.map(&String.capitalize/1)
        |> Enum.join(" ")

      %{
        module: module,
        sequence: base |> String.to_atom(),
        name: nice_name,
        description: sequence_summary(mod_docs, func, arity)
      }
    end)
  end

  defp attributes_for_function(module, function, arity)
       when is_atom(function) and is_integer(arity) do
    {:docs_v1, _, :elixir, _, _, _, f_docs} = Code.fetch_docs(module)

    case f_docs
         |> Enum.filter(fn {{:function, fn_name, fn_arity}, _, _, _, _} ->
           fn_name == function && fn_arity == arity
         end)
         |> Enum.map(fn {_, _, _, _, attr_map} ->
           attr_map
         end) do
      [] -> %{}
      [attrs] -> attrs
    end
  end

  defp sequence_summary({:docs_v1, _, :elixir, _, _, _, f_docs}, function, arity) do
    case f_docs
         |> Enum.filter(fn {{:function, fn_name, fn_arity}, _, _, _, _} ->
           fn_name == function && fn_arity == arity
         end)
         |> Enum.map(fn {_, _, _, _, attr_map} ->
           case attr_map do
             %{sequence: seq_desc} -> seq_desc
             _ -> ""
           end
         end) do
      [] -> "no description"
      [desc | _] -> desc
    end
  end
end
