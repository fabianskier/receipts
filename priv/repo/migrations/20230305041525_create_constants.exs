defmodule Receipts.Repo.Migrations.CreateConstants do
  use Ecto.Migration

  def change do
    create table(:constants) do
      add :key, :text
      add :value, :text

      timestamps()
    end
  end
end
