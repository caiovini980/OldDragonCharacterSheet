defmodule Olddragonsheet.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def up do
    create table :users do
      add :email, :string
      add :password_hash, :string
      add :isMaster, :boolean

      timestamps();
    end

    #can't have players with the same email
    create unique_index(:users, [:email])
  end

  def down do
    drop table :users
  end
end
