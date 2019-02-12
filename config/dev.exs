use Mix.Config

config :financial_system, FinancialSystem.Repo,
  database: "financial_system_repo",
  username: "user_post",
  password: "pass",
  hostname: "localhost"

config :financial_system, ecto_repos: [FinancialSystem.Repo]
