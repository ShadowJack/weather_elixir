defmodule Weather.XMLParser do
  import SweetXml

  @moduledoc """
  This module parses raw string data into Elixir map
  """

  @doc """
  Parses incoming string into map,
  if input string is incorrect - program crashes with error
  """
  def parse_xml(data) do
    data
    |> xmap(get_xpaths [
      :credit, :location, :station_id, :latitude, :longitude,
      :observation_time, :weather, :temperature_string,
      :relative_humidity, :wind_string, :pressure_string,
      :dewpoint_string, :windchill_string, :visibility_mi
    ])
  end

  def get_xpaths(list) do
    list
    |> Enum.map(&make_xpath/1)
  end

  defp make_xpath(atom) when is_atom(atom) do
    path = %SweetXpath{
      path: to_char_list("//#{to_string(atom)}/text()"),
      cast_to: :string
    }
    { atom, path }
  end
end
