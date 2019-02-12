File.mkdir_p(Path.dirname(JUnitFormatter.get_report_file_path()))
ExUnit.configure(formatters: [JUnitFormatter, ExUnit.CLIFormatter])

Ecto.Adapters.SQL.Sandbox.mode(FinancialSystem.Repo, :manual)

ExUnit.start()

# Extending ExUnit to test PSQL
defmodule FinancialSystem.RepoCase do
    use ExUnit.CaseTemplate
  
    using do
      quote do
        alias MyApp.Repo
  
        import Ecto
        import Ecto.Query
        import FinancialSystem.RepoCase
        
        # and any other stuff
      end
    end
  
    setup tags do
      :ok = Ecto.Adapters.SQL.Sandbox.checkout(FinancialSystem.Repo)
      
      unless tags[:async] do
        Ecto.Adapters.SQL.Sandbox.mode(FinancialSystem.Repo, {:shared, self()})
      end
      
      :ok
    end
  end