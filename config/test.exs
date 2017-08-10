use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lunch_tracker, LunchTrackerWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :lunch_tracker, LunchTracker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "lunch_tracker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
