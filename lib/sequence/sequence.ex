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
    
    ## Creating Sequences
    
     - `create/3` - Create a new sequence instance
    
    ## Finding and Inspecting Sequences
    
     - `available/1` - List available sequences from a module
     - `has_next?/1` - Check that a sequence has at least one more available value
     - `is_available?/2` - Check if a specific sequence is available
    
    ## Manipulating Sequences
    
     - `next/1` - Retrieve the next sequence value and updated sequence struct as a tuple
     - `next!/1` - Retrieve the next sequence as just an updated sequence struct
     - `take/2` - Like `Enum.take/2` - retrieve a list of values from a sequence
    
    """
       
   defstruct [:info_fn, :next_fn, :data, :index, :value, :finished]
   
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
   def take(%Sequence{}=sequence, count) when is_integer(count) and count < 1, do: {[], sequence}      
   
   def take(%Sequence{}=sequence, 1) do
       {v, u_seq} = next(sequence)
       {[v], u_seq}
   end
   
   def take(%Sequence{}=sequence, count) do
       {n, u_seq} = next(sequence)
       {rest, l_seq} = take(u_seq, count - 1)
       
       {[n] ++ rest, l_seq}
   end
    
   @doc """
   Create a new sequence from a simple function and an information function. 
   
   The simple sequence function should take one or more parameters, 
   corresponding to the last `N` values of the sequence. The info function 
   should be an arity/1 function that takes an instance of a Sequence struct.
   
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
   @doc sequence: "Add last three values"
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
   
   ## Info Function
   
   The information function with arity 1 will recieve all the values in the `data` attribute of
   the sequence, including any data registered as a `data` doc attribute. The return value of the
   information function should be a Map.
   ```
   
   """
   def sequence_for_function(seq_function, info_function) when is_function(seq_function) and is_function(info_function) do
       
       # setup the attribute data
       sf_meta = Function.info(seq_function) |> Map.new()
       attrs = attributes_for_function(sf_meta.module, sf_meta.name, sf_meta.arity)
       
       fill_value = Map.get(attrs, :fill_value, 0)
       sequence_summary = Map.get(attrs, :sequence)
       data = Map.get(attrs, :data, %{})
       
       # setup our tracking data for value mapping
       data = data |> Map.put(:last_n, 1..sf_meta.arity - 1 |> Enum.map(fn _ -> fill_value end))
       data = data |> Map.put(:index, 0)
       
       # setup the sequence function wrapper
       sff_next = fn mode, n_data, _value -> 
           case mode do
              :init -> 
                  %{data: data, value: fill_value} 
              :next -> 
                  
                  # call function on last N values
                  apply_values = [n_data.index] ++ n_data.last_n
                  new_value = apply(seq_function, apply_values)
                  new_last_n = Enum.drop(n_data.last_n, 1) ++ [new_value]
                  %{data: %{n_data | last_n: new_last_n, index: n_data.index + 1}, value: new_value}
           end
       end
       
       # build a struct
       %{
           info_fn: info_function,
           next_fn: sff_next,
           data: data |> Map.merge(%{name: sequence_summary})
       } 
       
   end
   
   @doc """
   Create a sequence from a function - short version of `Sequence.sequence_for_function/1`
   
   This version uses a default information function that returns the `data` map exactly as is.
   """
   def sequence_for_function(seq_function) when is_function(seq_function) do
       sequence_for_function(seq_function, &default_info_function/1)
   end
   
   def sequence_for_list(list_data, attrs, info_function) when is_list(list_data) and is_map(attrs) and is_function(info_function) do

       # setup the attribute data
       data = %{
           list: list_data,
           index: 0
           } |> Map.merge(attrs)
       
       # setup the sequence function wrapper
       sff_next = fn mode, n_data, _value -> 
           case mode do
              :init -> 
                  %{data: data, value: 0} 
              :next -> 
                  
                  # do we have any more values?
                  cond do
                     length(n_data.list) -> 
                         {:last, %{data: n_data, value: 0}} 
                         
                     (n_data.index + 1) == length(n_data.list) ->
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
           info_fn: info_function,
           next_fn: sff_next,
           data: data 
       } 
       
   end
   
   def sequence_for_list(list_data, attrs) when is_list(list_data) and is_map(attrs) do
       sequence_for_list(list_data, attrs, &default_info_function/1)
   end
   
   # the default information function - just mirror our data attribute
   defp default_info_function(data), do: data
   
   
   @doc """
   Check that a sequence has more values.
   
   Some sequences are finite, and have distinct end points. For finite sequences
   it can make sense to check for additional values before trying to access more
   data:
   
   
   """
   def has_next?(%Sequence{finished: false}), do: true
   def has_next?(%Sequence{}), do: false
   
   def next!(%Sequence{}=sequence) do
       {_v, n_seq} = next(sequence)
       n_seq
   end
   
   def next(%Sequence{}=sequence) do
       
       # call next function with (:next)
       case sequence.next_fn.(:next, sequence.data, sequence.value) do
           %{value: value, data: data}  ->
       
               # store (value, data), and return
               {value, %{sequence | data: data, value: value, index: sequence.index + 1}}
               
           {:continue, %{value: value, data: data}} -> 
               
               # store (value, data), and return
               {value, %{sequence | data: data, value: value, index: sequence.index + 1}}
               
           {:last, %{value: value, data: data}} ->

               # store (value, data), and return
               {value, %{ sequence | data: data, value: value, finished: true, index: sequence.index + 1}}
               
       end
       
   end
   
   defp init(%Sequence{}=sequence) do
      
       # call next function with (:init)
       %{value: value, data: data} = sequence.next_fn.(:init, sequence.data, sequence.value)
       
       # store (value, data)
       %{sequence | data: data, value: value}
   end
   
   def create(module, seq_name, opts \\ []) when is_atom(seq_name) do
      
       case Code.ensure_loaded?(module) do
           true -> 
               # convert the sequence name to a :create_sequence_* name 
               create_fn = "create_sequence_#{seq_name}" |> String.to_atom()
               
               if is_available?(module, seq_name) do
                   # run create, capture the output
                   %{info_fn: info_fn, next_fn: next_fn, data: data} = apply(module, create_fn, [opts])
               
                   %Sequence{
                       info_fn: info_fn,
                       next_fn: next_fn,
                       data: data,
                       value: 0,
                       index: -1,
                       finished: false
                   } |> init()
               else
                   :no_such_sequence
               end
                
           false -> :no_such_module
        end
   end
   
   def is_available?(module, seq_name) when is_atom(seq_name) do
       
       create_fn = "create_sequence_#{seq_name}" |> String.to_atom()
       
       module.__info__(:functions)
       |> Enum.filter(
           fn {func, arity} -> 
              
               # take apart the functions
               (func == create_fn) && (arity == 1)
           end
       )
       |> length() == 1
       
   end
   
   def available(module) do
       
       mod_docs = Code.fetch_docs(module)
       
      module.__info__(:functions)
      |> Enum.filter(
          fn {func, arity} -> 
              
              # take apart the functions
              (func |> Atom.to_string() |> String.starts_with?("create_sequence") ) && (arity == 1)
          end
      )
      |> Enum.map(
          fn {func, arity} -> 
              
              # generate the function name atom
              base = func |> Atom.to_string() |> String.trim("create_sequence_")
              
              # nice function naming
              nice_name = base 
              |> String.replace("_", " ") 
              |> String.split(" ") 
              |> Enum.map(&String.capitalize/1)
              |> Enum.join(" ")
              
              %{seq_id: base |> String.to_atom(), name: nice_name, description: sequence_summary(mod_docs, func, arity)}
          end
      )
           
   end
   
   defp attributes_for_function(module, function, arity) do
       {:docs_v1, _, :elixir, _, _, _, f_docs} = Code.fetch_docs(module)
       case f_docs
       |> Enum.filter(
           fn {{:function, fn_name, fn_arity}, _, _, _, _} -> 
               (fn_name == function) && (fn_arity == arity)
           end
       )
       |> Enum.map(
           fn {_, _, _, _, attr_map} -> 
               attr_map
           end
       ) do
          [] -> %{}
          [attrs] -> attrs 
       end
       
   end
   
   defp sequence_summary({:docs_v1, _, :elixir, _, _, _, f_docs}, function, arity) do
       
       case f_docs
       |> Enum.filter(
           fn {{:function, fn_name, fn_arity}, _, _, _, _} -> 
               (fn_name == function) && (fn_arity == arity)
           end
       )
       |> Enum.map(
           fn {_, _, _, _, attr_map} -> 
               case attr_map do
                   %{sequence: seq_desc} -> seq_desc
                   _ -> ""
               end
           end
       ) do
           [] -> "no description"
           [desc | _] -> desc
       end
   end
end