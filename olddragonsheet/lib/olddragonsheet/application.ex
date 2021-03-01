defmodule Olddragonsheet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Olddragonsheet.Repo,
      # Start the Telemetry supervisor
      OlddragonsheetWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Olddragonsheet.PubSub},
      # Start the Endpoint (http/https)
      OlddragonsheetWeb.Endpoint
      # Start a worker by calling: Olddragonsheet.Worker.start_link(arg)
      # {Olddragonsheet.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Olddragonsheet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OlddragonsheetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
