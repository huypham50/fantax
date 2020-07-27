defmodule Fantax.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc "OTP Application for Fantax"

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Fantax.Worker.start_link(arg)
      # {Fantax.Worker, arg}
      # Use Plug.Cowboy.child_spec/3 to register our endpoint as a plug
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Fantax.Endpoint,
        # Set the port per environment, see ./config/MIX_ENV.exs
        options: [port: Application.get_env(:fantax, :port)]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fantax.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
