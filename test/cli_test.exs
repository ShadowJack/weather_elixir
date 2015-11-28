defmodule WeatherCLITest do
  use ExUnit.Case

  doctest Weather

  import Weather.CLI
  import ExUnit.CaptureIO

  test "It catches --help and -h keys" do
    assert parse_args(["--help"]) == :help
    assert parse_args(["-h"]) == :help
  end

  test "It catches localion code" do
    assert parse_args(["KBDT"]) == "KBDT"
  end

  test "It displays a help message" do
    assert capture_io(process(:help)) == "mamam"
  end

end
