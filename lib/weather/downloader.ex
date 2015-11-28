defmodule Weather.Downloader do
  @moduledoc """
  Fetches xml data from http://w1.weather.gov/xml/current_obs/
  """
  @weather_api_url Application.get_env(:weather, :weather_api_url)

  @doc """
  Fetch data using provided code

  ## Example
      iex> Weather.Downloader.fetch "KDTO"
  """
  def fetch(code) do
    process_response HTTPoison.get(get_weather_api_url code)
  end

  defp process_response({ :ok, %HTTPoison.Response{ status_code: 200, body: body } }), do: body
  defp process_response({ :ok, %HTTPoison.Response{ status_code: status_code } }) do
    IO.puts"Fetching data from weather.gov resulted in status code: #{status_code}"
    System.halt(1)
  end
  defp process_response({ :error, %HTTPoison.Error{ reason: reason } }) do
   IO.puts "Fetching data from wearther.gov resulted in error: #{IO.inspect reason}"
  end

  defp get_weather_api_url(code), do: "#{@weather_api_url}/#{code}.xml"
end
