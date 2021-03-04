defmodule Olddragonsheet.Character do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:name, :class, :race, :allignment, :idioms, :avatar, :user_id]

  schema "characters" do
    field :name, :string
    field :class, :string
    field :specialization, :string
    field :level, :integer, default: 0
    field :race, :string
    field :allignment, :string
    field :followers, :integer, default: 0
    field :idioms, :string
    field :experience_points, :integer, default: 0
    field :avatar, Olddragonsheet.Avatar.Type
    #belongs_to :user, Olddragonsheet.User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params \\ :invalid) do
    struct
    |> cast(params, @required_params)
    |> cast_attachments(params, [:avatar])
    |> validate_required(@required_params)
  end
end
