defmodule Olddragonsheet.Repo.Migrations.CreateCharacterTable do
  use Ecto.Migration

  def change do
    create table :characters do
      add :name, :string
      add :class, :string
      add :specialization, :string
      add :level, :integer, default: 0
      add :race, :string
      add :allignment, :string
      add :followers, :integer, default: 0
      add :idioms, :string
      add :experience_points, :integer, default: 0
      add :avatar, :string
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    create constraint(:characters, :experience_must_be_positive_or_zero, check: "experience_points >= 0")
    create constraint(:characters, :followers_must_be_positive_or_zero, check: "followers >= 0")
  end
end
