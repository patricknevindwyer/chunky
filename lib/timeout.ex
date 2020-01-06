defmodule Chunky.Timeout do
    @moduledoc """
    Working with sequences and recurrent/recursive mathematical functions can lead to really
    long processing times in some circumstances. The Chunky.Timeout module provides some macros
    and functions for making things a little more sane.
    """
    
    @doc """
    Wrap an expression in a timeout, returning the value as an {:ok, result} or {:timeout, nil}
    tuple.
    
    Wait time is specified in integer milliseconds.
    """
   defmacro with_timeout(wait_time, do: expression) do
       
       quote do
           pred_task =
             Task.async(fn ->
               unquote(expression)
             end)

           case Task.yield(pred_task, unquote(wait_time)) || Task.shutdown(pred_task) do
             {:ok, result} ->
               # ran to completion
               {:ok, result}

             nil ->
               # timed out
               {:timeout, nil}
           end
       end
       
   end 
   
end