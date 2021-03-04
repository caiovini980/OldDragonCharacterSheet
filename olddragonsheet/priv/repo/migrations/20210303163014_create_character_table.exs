defmodule Olddragonsheet.Repo.Migrations.CreateCharacterTable do
  use Ecto.Migration

  def up do
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
    end
  end

  def down do
    drop table :characters
  end
end
