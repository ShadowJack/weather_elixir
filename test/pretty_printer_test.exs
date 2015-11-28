defmodule WeatherPrettyPrinterTest do
  use ExUnit.Case
  doctest Weather.PrettyPrinter, except: [print_row: 2]
end
