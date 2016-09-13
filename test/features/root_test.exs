defmodule WallabyTest.RootTest do
  use WallabyTest.AcceptanceCase, async: true

  test "root", %{session: session} do
    pt = 
      session
      |> visit("/")
      |> text
    assert pt == "Hello"
  end
end
