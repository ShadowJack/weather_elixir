defmodule WeatherCLITest do
  use ExUnit.Case

  doctest Weather

  import Weather.CLI

  test "It catches --help and -h keys" do
    assert parse_args(["--help"]) == :help
    assert parse_args(["-h"]) == :help
  end

  test "It catches localion code" do
    assert parse_args(["KBDT"]) == "KBDT"
  end
end
