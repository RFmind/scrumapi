defmodule Scrumapi.SprintTest do
  use Scrumapi.ModelCase

  alias Scrumapi.Sprint

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sprint.changeset(%Sprint{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sprint.changeset(%Sprint{}, @invalid_attrs)
    refute changeset.valid?
  end
end
