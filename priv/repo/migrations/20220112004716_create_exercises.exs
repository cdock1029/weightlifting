defmodule Weightlifting.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:exercises) do
      add :name, :citext, null: false
      add :description, :text

      timestamps()
    end

    create unique_index(:exercises, [:name])
  end
end
