defmodule Chunky.Sequence.OEIS.Util do
  @moduledoc """
  Utilities for developing sequences.
  """
  
  def crawl_keywords(keys) when is_list(keys) do
     
     # encode the keywords
     keyword_query = keys
     |> Enum.map(fn k -> "keyword:#{k}" end)
     |> Enum.join("+")
     
     # get all pages, keeping ID, name, keywords
     get_search_result(keyword_query)
  end
  
  defp get_search_result(keyword_query, offset \\ 0) do
     
      # sleep for a little bit so we're not mean to oeis.org
      Process.sleep(250)
      
      # build the full query term
      query = "q=#{keyword_query}&fmt=json&start=#{offset}"
      
      # request
      raw = HTTPoison.get!("https://oeis.org/search?#{query}").body
      %{"results" => results, "count" => total_results} = raw |> Jason.decode!()
      
      # recurse while page count < total pages
      current_page = div(offset, 10) + 1
      total_pages = Float.ceil(total_results / 10) |> Kernel.trunc()
      
      if current_page < total_pages do
         translate_results(results) ++ get_search_result(keyword_query, offset + 10) 
      else
          translate_results(results)
      end
     
  end
  
  defp translate_results(results_list) do
      results_list |> Enum.map(&translate_result/1)
  end
  
  defp translate_result(%{}=result) do
      # number (decimal - need to pad it out)
      # id (optional)
      # data
      # name
      # offset
      
      # basic data extraction
      %{
          "number" => numb_int,
          "data" => raw_data,
          "name" => name,
          "offset" => offset_raw
      } = result
          
      # parse the offset
      [offset,_] = offset_raw |> String.split(",")
      
      # ooptional data
      id = Map.get(result, "id", "")
      
      # reformat number into something useful
      numb_str = "#{numb_int}" |> String.pad_leading(6, "0")
      
      %{
          seq_id: "A#{numb_str}",
          id: id,
          name: name,
          offset: offset,
          data: raw_data
      }
  end

  def generate_sequence_stub(seq_id, opts \\ []) do
    include_seq_func = opts |> Keyword.get(:sequence_for_function, false)
    include_list = opts |> Keyword.get(:sequence_for_list, false)
    in_module = opts |> Keyword.get(:in_module, Chunky.Sequence.OEIS.Core)

    # Build clean sequence IDs
    seq_id_lower =
      if String.starts_with?(seq_id, ":") do
        seq_id |> String.trim(":") |> String.downcase()
      else
        seq_id |> String.downcase()
      end

    seq_id_upper = seq_id_lower |> String.upcase()

    # in case we need a sequence sub-function
    seq_function_name = "seq_#{seq_id_lower}"

    # run our HTTP request and get the JSON data for the sequnece
    HTTPoison.start()
    raw = HTTPoison.get!("https://oeis.org/search?q=id:#{seq_id_upper}&fmt=json").body
    %{"results" => [result]} = raw |> Jason.decode!()

    # select out the interesting bits
    %{
      "data" => sample_data_raw,
      "name" => seq_name,
      "offset" => offset_raw
    } = result

    old_id = Map.get(result, "id", "")

    # parse the offset data
    [s_off, _] = String.split(offset_raw, ",")
    {seq_offset, _} = Integer.parse(s_off)

    # we need to parse the sample data _size_
    seq_sample_data_size = String.split(sample_data_raw, ",") |> length()

    # start with the top of file data
    #    - [A001597 - Perfect Powers](https://oeis.org/A001597) - `:a001597` - `create_sequence_a001597/1`
    IO.puts("== TOP OF FILE ==\n")

    IO.puts("""
     - [#{seq_id_upper} - #{seq_name}](https://oeis.org/#{seq_id_upper}) - `:#{seq_id_lower}` - `create_sequence_#{
      seq_id_lower
    }/1`
    """)
    
    if include_list do
        IO.puts("== SEQUENCE DATA ==\n")
        IO.puts("# raw data for #{seq_id_upper} - #{seq_name}")
        IO.puts("@data_#{seq_id_lower} [#{sample_data_raw}]\n")
    end
    
    IO.puts("== SEQUENCE FUNCTION ==\n")
    # Function top
    IO.puts(
      """
      @doc \"\"\"
      OEIS Sequence `#{seq_id_upper}` - #{seq_name}

      From [OEIS #{seq_id_upper}](https://oeis.org/#{seq_id_upper}):

      > #{seq_name}
      > (Formerly #{old_id})

      **Sequence IDs**: `:#{seq_id_lower}`

      **Finite**: False

      **Offset**: #{seq_offset}

      ## Example

          iex> Sequence.create(#{in_module}, :#{seq_id_lower}) |> Sequence.take!(#{
        seq_sample_data_size
      })
          [#{sample_data_raw}]


      \"\"\"
      @doc offset: #{seq_offset},
           sequence: "#{seq_name}",
           references: [{:oeis, :#{seq_id_lower}, "https://oeis.org/#{seq_id_upper}"}]
      def create_sequence_#{seq_id_lower}(_opts) do
      """
      |> String.trim()
    )

    # inserting data?
    if include_seq_func do
      IO.puts("\tsequence_for_function(&#{in_module}.#{seq_function_name}/1)")
    end
    
    if include_list do
       IO.puts("\tsequence_for_list(@data_#{seq_id_lower})") 
    end

    IO.puts("end\n")

    # do we need to add in the sequence function?
    if include_seq_func do
      IO.puts("""

      @doc offset: #{seq_offset}
      def seq_#{seq_id_lower}(idx) do
          
      end
      """)
    end

    # trim out 10 values from our sample data
    test_data = sample_data_raw |> String.split(",") |> Enum.take(10) |> Enum.join(", ")

    # test case data
    IO.puts("\n== TEST CASE ==")
    
    label_as_finite = if include_list do
        "true"
    else
        "false"
    end
    
    IO.puts("""
    %{
      module: #{in_module},
      sequence: :#{seq_id_lower},
      opts: [],
      values: [#{test_data}],
      finite: #{label_as_finite},
      first_index: #{seq_offset}
    },
    """)
  end
end
