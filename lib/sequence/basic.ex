defmodule Chunky.Sequence.Basic do
   
   @moduledoc """
   Working with basic sequences.
   """ 
   import Chunky.Sequence, only: [sequence_for_list: 1]
   
   @doc """
   Generate the sequence of whole numbers, [1, 2, 3, 4, ...]
   """
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

   @doc sequence: "Empty sequence: []", references: [{:wolfram, :empty_set, "http://mathworld.wolfram.com/EmptySet.html"}]
   def create_sequence_empty(_opts) do
       sequence_for_list([])
   end
   
   @doc sequence: "Decimal digits: [0, 1, 2, 3, 4, ...]", references: [{:wikipedia, :decimal_digit, "https://en.wikipedia.org/wiki/Numerical_digit"}]
   def create_sequence_decimal_digits(_opts) do
       sequence_for_list([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
   end
   
end