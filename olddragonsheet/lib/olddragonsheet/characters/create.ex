defmodule Olddragonsheet.Characters.Create do
  alias Ecto.Multi
  alias Olddragonsheet.{Character, Repo, Attribute}

  def call(params) do
    Multi.new()
    |> Multi.insert(:create_character, Character.changeset(params))
    |> Multi.run(:create_attributes, fn repo, %{create_character: character} ->
      insert_attributes(repo, character)
    end)
    |> run_transaction()

    #params
    #|> Character.changeset()
    #|> Repo.insert()
  end

  defp insert_attributes(repo, character) do
    character.id
    |> attributes_changeset()
    |> repo.insert()
  end

  defp attributes_changeset(character_id) do
    params = %{
      force: 0,
      dexterity: 0,
      constitution: 0,
      intelligence: 0,
      wisdom: 0,
      charisma: 0,
      character_id: character_id
    }

    Attribute.changeset(params)
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{create_attributes: attributes}} -> IO.inspect(attributes)
    end
  end
end
