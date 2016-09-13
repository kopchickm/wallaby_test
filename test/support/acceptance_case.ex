defmodule WallabyTest.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import WallabyTest.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(WallabyTest.Repo)
    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(WallabyTest.Repo, {:shared, self()})
    end
    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(WallabyTest.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
