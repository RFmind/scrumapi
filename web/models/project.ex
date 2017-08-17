defmodule Scrumapi.Project do
  use Scrumapi.Web, :model

  schema "projects" do
    field :name, :string
    field :description, :string
    has_many :tasks, Scrumapi.Task

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end
