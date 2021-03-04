defmodule Olddragonsheet do
  alias Olddragonsheet.Users.Create, as: UserCreate
  alias Olddragonsheet.Characters.Create, as: CharacterCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate create_character(params), to: CharacterCreate, as: :call
end
