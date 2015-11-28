defmodule WeatherXMLParserTest do
  use ExUnit.Case
  doctest Weather.XMLParser
  import Weather.XMLParser
  import SweetXml

  test "It prepares a valid argument for xmap" do
    assert get_xpaths([:one, :two, :three]) == [
      one: ~x"//one/text()"s,
      two: ~x"//two/text()"s,
      three: ~x"//three/text()"s
    ]
  end

end
