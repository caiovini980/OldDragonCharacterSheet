defmodule Olddragonsheet.Repo.Migrations.CreateAttributes do
  use Ecto.Migration

  def change do
    create table :attributes do
      add :force, :integer
      add :dexterity, :integer
      add :constitution, :integer
      add :intelligence, :integer
      add :wisdom, :integer
      add :charisma, :integer
      add :character_id, references(:characters, type: :binary_id)

      timestamps()
    end

    create constraint(:attributes, :force_must_be_positive_or_zero, check: "force >= 0")
    create constraint(:attributes, :dexterity_must_be_positive_or_zero, check: "dexterity >= 0")
    create constraint(:attributes, :constitution_must_be_positive_or_zero, check: "constitution >= 0")
    create constraint(:attributes, :intelligence_must_be_positive_or_zero, check: "intelligence >= 0")
    create constraint(:attributes, :wisdom_must_be_positive_or_zero, check: "wisdom >= 0")
    create constraint(:attributes, :charisma_must_be_positive_or_zero, check: "charisma >= 0")
  end
end
