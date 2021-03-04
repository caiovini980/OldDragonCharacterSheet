defmodule OlddragonsheetWeb.UsersView do
  alias Olddragonsheet.User

  def render("create.json", %{
    user: %User{
      id: id,
      email: email,
      isMaster: isMaster
    }
  }) do
    %{
      message: "User created!",
      user: %{
        id: id,
        email: email,
        isMaster: isMaster
      }
    }
  end
end
