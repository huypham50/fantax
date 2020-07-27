defmodule Fantax.MixProject do
  use Mix.Project

  def project do
    [
      app: :fantax,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # Add :plug_cowboy to extra_applications
      extra_applications: [:logger, :plug_cowboy],
      mod: {Fantax.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
