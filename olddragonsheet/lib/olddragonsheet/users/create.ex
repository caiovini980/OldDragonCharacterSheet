defmodule Olddragonsheet.Users.Create do
  alias Olddragonsheet.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
