defmodule Chunky.CacheAgent do
    @moduledoc """
    The CacheAgent is a dead simple wrapper of an atom named Agent around a Map.
    
    Start an agent for a particular function cache within the current BEAM instance with:
    
    ```elixir
    iex> CacheAgent.start_link(:function_name)
    ```
    
    Check for values with `has?/2`:
    
    ```elixir
    iex> CacheAgent.has?(:function_name, 3)
    ```
    
    Get and set values with `get/2` and `set/3`:
    
    ```elixir
    iex> CacheAgent.set(:function_name, 3, 3235)
    iex> CacheAgent.get(:function_name, 3)
    3235
    ```
    
    See `Math.partition_count/1` as an example.
    
    """
   use Agent
   
   @doc """
   Start a cache for a particular atom. Calling multiple times with the same atom will
   return the original named cache, and isn't harmful.
   
   """
   def start_link(cache_name) do
      Agent.start_link(fn -> %{} end, name: cache_name ) 
   end 
   
   @doc """
   Store a key/value pair in the cache.
   """
   def put(cache, key, value) do
      Agent.update(
          cache,
          fn state ->
             state |> Map.put(key, value) 
          end
      ) 
   end
   
   @doc """
   Retrieve a value from the cache by key.
   """
   def get(cache, key) do
      Agent.get(cache, fn state -> state |> Map.get(key) end) 
   end
   
   @doc """
   Check if the cache has a key
   """
   def has?(cache, key) do
      Agent.get(cache, fn state -> state |> Map.has_key?(key) end) 
   end
end