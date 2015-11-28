defmodule Weather.CLI do
  @moduledoc """
  Entry point of a program, main process is going here
  """

  @doc """
  Entry function
  """
  def main (argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  Parse command line arguments passed to the application

  Supported keys:
  --help, -h Prints usage message

  Main usage:
  weather code - where code is a unique code of your location in US

  Returns errors or help or code
  """
  def parse_args(argv) do
    do_parse_args OptionParser.parse(argv, strict: [help: :boolean], aliases: [h: :help])
  end

  defp do_parse_args({[], [code], []}), do: code
  defp do_parse_args({[help: true], [], []}), do: :help
  defp do_parse_args({[], [], errors}), do: errors

  @doc """
  Do som job based on passed parameter
  :help - diplay help message
  code - get data from weather.gov and pretty print it
  errors - output all errors
  """
  def process(:help) do
    IO.puts """
    Usage: weather code
        code - unique code of your location
        you can find it on http://w1.weather.gov/xml/current_obs/
    """
    System.halt(0)
  end

  def process(errors) when is_list(errors) do
    errors 
    |> Enum.each(&IO.inspect/1)
  end

  def process(code) do
    code
    |> Weather.Downloader.fetch
    |> Weather.XMLParser.parse_xml
    |> Weather.PrettyPrinter.print
  end

end
