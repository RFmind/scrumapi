defmodule Scrumapi.Task do
  use Scrumapi.Web, :model

  schema "tasks" do
    field :name, :string
    field :status, :string
    field :priority, :integer
    belongs_to :project, Scrumapi.Project
    belongs_to :sprint, Scrumapi.Sprint
    #belongs_to :user, Scrumapi.User
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :status, :priority])
    |> validate_required([:name, :status, :priority])
  end
end
