defmodule Chunky.Sequence.Basic do
   
   @moduledoc """
   Working with basic sequences.
   """ 
   import Chunky.Sequence, only: [sequence_for_list: 2]
   
   @doc """
   Generate the sequence of whole numbers, [1, 2, 3, 4, ...]
   """
   @doc sequence: "Whole numbers: [1, 2, 3, 4, 5, ...]"
   def create_sequence_whole_numbers(opts \\ []) do
       start = opts |> Keyword.get(:start, 1)
       
      %{
          info_fn: seq_whole_number_info(start),
          next_fn: &seq_whole_number_next/3,
          data: %{
              start: start
          }
      } 
   end
   
   defp seq_whole_number_info(st) do
       
       fn ->
           %{
               name: "Whole numbers starting at #{st}",
               oeis: false
           } 
       end
       
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

   @doc sequence: "Empty sequence: []"
   def create_sequence_empty(_opts) do
       sequence_for_list([], %{name: "Empty Sequence"})
   end
   
end