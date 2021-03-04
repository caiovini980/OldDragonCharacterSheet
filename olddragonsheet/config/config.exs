# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :olddragonsheet,
  ecto_repos: [Olddragonsheet.Repo]

# Configures the endpoint
config :olddragonsheet, OlddragonsheetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J5WBqi7dyRRNQ6I7elqa57rjhRQZhjigJS3Ekljr+h30tDpLw1TOoezxLPX1pqfm",
  render_errors: [view: OlddragonsheetWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Olddragonsheet.PubSub,
  live_view: [signing_salt: "wD+7jM+E"]

config :olddragonsheet, Olddragonsheet.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Guardian Config
config :olddragonsheet, Olddragonsheet.Guardian,
  issuer: "olddragonsheet",
  secret_key: "/WnRU5SpDM7znsDDyFygv6cD/5/aWaVxuRB1k2ojZXaIt/nGy+xukN3ITrgn5tnp"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
