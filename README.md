# Weather

**TODO:**
  1. Receive command line args, and choose what to do
  2. Fetch data about current weather
  3. Parse xml
  4. Display in a 'nice' format

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add weather to your list of dependencies in `mix.exs`:

        def deps do
          [{:weather, "~> 0.0.1"}]
        end

  2. Ensure weather is started before your application:

        def application do
          [applications: [:weather]]
        end
