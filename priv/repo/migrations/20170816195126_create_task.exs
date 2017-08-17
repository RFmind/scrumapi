defmodule Scrumapi.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :project_id, references(:projects)
      add :sprint_id, references(:sprints)
      add :name, :string
      add :status, :string
      add :priority, :integer

      timestamps()
    end
  end

end
