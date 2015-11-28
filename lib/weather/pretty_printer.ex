defmodule Weather.PrettyPrinter do
  @moduledoc """
  This module is used to prettyprint data parsed from xml
  """

  @doc """
  Takes map with data to be printed and outputs a table
  """
  def print(map) do
    row_format = 
    [Dict.keys(map) |> Enum.map(&to_printable/1), Dict.values(map)]
    |> Enum.map(&get_width/1)
    |> get_row_format

    Dict.to_list(map)
    |> Enum.each(&print_row(&1, row_format))
  end

  defp to_printable(value) when is_binary(value), do: value
  defp to_printable(value), do: to_string(value)

  @doc """
  Takes a list of columns(each represented as a list of string values) and
  returns width of columns that should be enough to fit all contents.

  ## Example
      iex> col = ["kitt", "glad", "butterfly"]
      iex> Weather.PrettyPrinter.get_width col
      9
  """
  def get_width(values) when is_list(values) do
    values |> Enum.map(&String.length/1) |> Enum.max
  end

  @doc """
  Gets a list of widths and returns a string that can be used to format a row

  ## Example
      iex> widths = [8, 9]
      iex> Weather.PrettyPrinter.get_row_format widths
      "~-8s | ~-9s~n"
  """
  def get_row_format(column_widths) when is_list(column_widths) do
    Enum.map_join(column_widths, " | ", fn width -> "~-#{width}s" end) <> "~n"
  end

  @doc """
  Takes a twodimensional tuple and prints its content using provided format

  ## Example
      iex> Weather.PrettyPrinter.print_row {:who_is_cool?, "me"}, "~-12s | ~-2s"
      who_is_cool? | me
  """
  def print_row({ name, value }, format) do
    :io.format(format, [name, value])
  end

end
