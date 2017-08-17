defmodule Scrumapi.TaskTest do
  use Scrumapi.ModelCase

  alias Scrumapi.Task

  @valid_attrs %{name: "some content", priority: 42, status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
