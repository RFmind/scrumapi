defmodule Scrumapi.Repo.Migrations.CreateSprint do
  use Ecto.Migration

  def change do
    create table(:sprints) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
