defmodule OlddragonsheetWeb.FallbackController do
  use OlddragonsheetWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(OlddragonsheetWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
