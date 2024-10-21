
defmodule Takso.Repo.Migrations.InsertAgeColumnToUsers do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add :age, :integer
    end
  end

  def down do
    alter table(:users) do
      remove :age
    end
  end
end
