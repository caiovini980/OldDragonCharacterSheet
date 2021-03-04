defmodule Olddragonsheet.Characters.Create do
  alias Olddragonsheet.{Character, Repo}

  def call(params) do
    params
    |> Character.changeset()
    |> Repo.insert()
  end
end
