defmodule Olddragonsheet.Attribute do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:force, :dexterity, :constitution, :intelligence, :wisdom, :character_id]

  schema "attributes" do
    field :force, :integer
    field :dexterity, :integer
    field :constitution, :integer
    field :intelligence, :integer
    field :wisdom, :integer
    field :charisma, :integer
    belongs_to :character, Olddragonsheet.Character

    timestamps()
  end

  def changeset(params \\ :invalid) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:force, name: :force_must_be_positive_or_zero)
    |> check_constraint(:dexterity, name: :dexterity_must_be_positive_or_zero)
    |> check_constraint(:constitution, name: :constitution_must_be_positive_or_zero)
    |> check_constraint(:intelligence, name: :intelligence_must_be_positive_or_zero)
    |> check_constraint(:wisdom, name: :wisdom_must_be_positive_or_zero)
    |> check_constraint(:charisma, name: :charisma_must_be_positive_or_zero)
  end
end
