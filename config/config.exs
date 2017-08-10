# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lunch_tracker,
  ecto_repos: [LunchTracker.Repo]

# Configures the endpoint
config :lunch_tracker, LunchTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XfaK83oQFegafoMq8o8Hw/tgPpQc+tRZ8eoaCXU3eGNWgsbZjShvrXVgxrSxkWXP",
  render_errors: [view: LunchTrackerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: LunchTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
