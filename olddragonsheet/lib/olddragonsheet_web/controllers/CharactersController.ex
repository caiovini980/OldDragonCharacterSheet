defmodule OlddragonsheetWeb.CharactersController do
  use OlddragonsheetWeb, :controller
"""
  alias Olddragonsheet.{Character, User}

  def create(conn, params) do
    with {:ok, %User{%Characters{}} = character} <- Olddragonsheet.create_character(params) do
      conn
      |> put_status(:created)
      |> render("create.json", character: character)
    end
  end
end
"""
end
