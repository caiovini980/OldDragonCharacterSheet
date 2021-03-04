defmodule OlddragonsheetWeb.UsersController do
  use OlddragonsheetWeb, :controller

  alias Olddragonsheet.User

  action_fallback OlddragonsheetWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Olddragonsheet.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
