defmodule Chunky.MixProject do
  use Mix.Project

  def project do
    [
      app: :chunky,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Extended chunking and Enum manipulation",
      licenses: ["BSD-3-Clause"],
      source_url: "https://github.com/patricknevindwyer/chunky",
      homepage_url: "https://github.com/patricknevindwyer/chunky"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
