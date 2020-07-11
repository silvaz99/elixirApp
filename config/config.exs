# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :help_proj,
  ecto_repos: [HelpProj.Repo]

# Configures the endpoint
config :help_proj, HelpProjWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "F1fp0wSm+X04TXFQuA8d8GEng8lyNcat6NiVcNK+plmOyCQ0yZyKrj3pm9DcoMak",
  render_errors: [view: HelpProjWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelpProj.PubSub,
  live_view: [signing_salt: "PjrQWtii"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
