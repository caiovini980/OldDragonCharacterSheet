defmodule Olddragonsheet.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :email, :string
      add :password_hash, :string
      add :isMaster, :boolean

      timestamps();
    end

    #can't have players with the same email
    create unique_index(:users, [:email])
  end
end
