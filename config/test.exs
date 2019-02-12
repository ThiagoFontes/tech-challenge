use Mix.Config

# Repos known to Ecto:
config :financial_system, ecto_repos: [Test.Repo]

# Test Repo settings
config :financial_system, Test.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "myproject_test",
  hostname: "localhost",
  poolsize: 10,
  # Ensure async testing is possible:
  pool: Ecto.Adapters.SQL.Sandbox

# Formating our tests
if Mix.env == :test do
    config :junit_formatter,
     report_dir: "/tmp/repo-example-test-results/exunit"
end

