use Mix.Config

config :my_app, MyApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "myapp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox # Enabling sandbox mode

config :financial_system, ecto_repos: [FinancialSystem.Repo]

# Formating our tests
if Mix.env == :test do
    config :junit_formatter,
     report_dir: "/tmp/repo-example-test-results/exunit"
end