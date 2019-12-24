defmodule Chunky.Sequence.Test do
    @moduledoc """
    Test sequences with variations on sequence constructions.
    
    # Test Conditions
    
    ## Verbose Iterators
    
     - `:whole_numbers` - infinite iterator
    
    ## Simple Functions
    
     - `:doubler` - infinite iterator, double index
     - `:last_two` - add last two values, 
     - `:last_three` - add last three values, prep with specific fill value attribute
     - `:cycle` - Cycle data from prepped data attribute
        
    ## Static Lists
    
     - `:empty` - empty list
     - `:small` - 5 values
     - `:medium` - 10 values
     - `:large` - 50 values
    
    """
    import Chunky.Sequence, only: [sequence_for_function: 1, sequence_for_list: 1]
    alias Chunky.Sequence
    
    @doc sequence: "Whole numbers: [1, 2, 3, 4, 5, ...]", references: []
    def create_sequence_whole_numbers(opts \\ []) do
        start = opts |> Keyword.get(:start, 1)
       
       %{
           next_fn: &seq_whole_number_next/3,
           data: %{
               start: start
           }
       } 
    end
      
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
    
    @doc sequence: "Doubler: [0, 2, 4, 6, 8, ...]"
    def create_sequence_doubler(_opts) do
        sequence_for_function(&seq_doubler/1)
    end
    
    defp seq_doubler(idx) do
       idx * 2 
    end
    
    @doc sequence: "Last Two: []"
    def create_sequence_last_two(_opts) do
        sequence_for_function(&seq_last_two/3)
    end
    
    defp seq_last_two(idx, a, b) do
       cond do
           idx == 0 -> 2
           idx == 1 -> 6
           true -> a + b
       end 
    end
    
    @doc sequence: "Last Three: [9, 17, 29, 55, ...]"
    def create_sequence_last_three(_opts) do
        sequence_for_function(&Sequence.Test.seq_last_three/4)
    end
    
    @doc fill_value: 3
    def seq_last_three(_idx, a, b, c) do
        a + b + c
    end
    
    @doc sequence: "Cycle: [4, -3, 0, 4, -3, ...]"
    def create_sequence_cycle(_opts) do
        sequence_for_function(&Sequence.Test.seq_cycle/2)
    end
    
    @doc data: %{cycle: [4, -3, 0]}
    def seq_cycle(data, idx) do
        d_idx = rem(idx, length(data.cycle))
        data.cycle |> Enum.at(d_idx)
    end
    
    #- `:empty` - empty list
    @doc sequence: "Empty: []"
    def create_sequence_list_empty(_opts) do
       sequence_for_list([]) 
    end
    
    #- `:small` - 5 values
    @doc sequence: "Small: [1, 8, 27, 64, 125]"
    def create_sequence_list_small(_opts) do
        sequence_for_list([1, 8, 27, 64, 125])
    end
    
    #- `:medium` - 10 values
    @doc sequence: "Medium: [1, 2, 3, 4, 5, ...]"
    def create_sequence_list_medium(_opts) do
        sequence_for_list(1..10 |> Enum.to_list())
    end
    
    #- `:large` - 50 values
    @doc sequence: "Large: [1000, 1001, 1002, 1003, 1004, ...]"
    def create_sequence_list_large(_opts) do
        sequence_for_list(1000..1049 |> Enum.to_list())
    end
    
    
end