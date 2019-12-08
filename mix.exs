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
      source_url: "https://github.com/patricknevindwyer/chunky",
      homepage_url: "https://github.com/patricknevindwyer/chunky",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
  
  defp package do
     [
         licenses: ["BSD-3-Clause"],
         files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
         links: %{"GitHub" => "https://github.com/patricknevindwyer/chunky"}
     ] 
  end
end
