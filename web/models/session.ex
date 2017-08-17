defmodule Scrumapi.Session do
  use Scrumapi.Web, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, Scrumapi.User

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end

  def create_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
