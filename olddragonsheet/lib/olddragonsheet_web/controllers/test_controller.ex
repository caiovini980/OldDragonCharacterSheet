defmodule OlddragonsheetWeb.TestController do
  use OlddragonsheetWeb, :controller

  def index(connection, _result) do
    connection
    |> handle_response()
  end

  defp handle_response(connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: "Fala Paulo"})
  end
end
