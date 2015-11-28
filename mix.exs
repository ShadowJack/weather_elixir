defmodule Weather.Mixfile do
  use Mix.Project

  def project do
    [app: :weather,
     version: "0.0.1",
     elixir: "~> 1.1",
     source_url: "https://github.com/ShadowJack/weather_elixir",
     docs: [extras: ["README.md"]],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:sweet_xml, "~> 0.5.0"},
      {:ex_doc,    "~> 0.11.1"},
      {:earmark,   "~> 0.1.19"}
    ]
  end
end
