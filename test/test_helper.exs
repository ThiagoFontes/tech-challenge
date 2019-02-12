alias Ecto.Adapters.SQL.Sandbox
File.mkdir_p(Path.dirname(JUnitFormatter.get_report_file_path()))
ExUnit.configure(formatters: [JUnitFormatter, ExUnit.CLIFormatter])

ExUnit.start()

{:ok, _pid} = Test.Repo.start_link()
Sandbox.mode(Test.Repo, :manual)

defmodule PostTest do
  # Once the mode is manual, tests can also be async
  use ExUnit.Case, async: true

  setup do
    # Explicitly get a connection before each test
    :ok = Sandbox.checkout(Test.Repo)
  end

  test "create post" do
    # Use the repository as usual
    # assert %Post{} = Test.Repo.insert!(%Post{})
  end
end
