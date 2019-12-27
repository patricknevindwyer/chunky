defmodule Chunky.MixProject do
  use Mix.Project

  @version "0.9.0"

  def project do
    [
      app: :chunky,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Fractions, Grids, and Combinatorics for Elixir",
      source_url: "https://github.com/patricknevindwyer/chunky",
      homepage_url: "https://github.com/patricknevindwyer/chunky",
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:httpoison, "~> 1.6", only: [:dev, :test]},
      {:jason, "~> 1.1", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      licenses: ["BSD-3-Clause"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      links: %{"GitHub" => "https://github.com/patricknevindwyer/chunky"},
      maintainers: ["Patrick Dwyer"]
    ]
  end

  defp docs do
    [
      main: "readme",
      name: "Chunky",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/chunky",
      source_url: "https://github.com/patricknevindwyer/chunky",
      extras: [
        "README.md"
      ]
    ]
  end
end
