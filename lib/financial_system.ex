defmodule FinancialSystem.Application do
  @moduledoc """
  Documentation for FinancialSystem.
  """
  use Application
  
  # Database supervisor 
  def start(_type, _args) do
    children = [
      FinancialSystem.Repo
    ]

    opts = [strategy: :one_for_one, name: ExampleApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
