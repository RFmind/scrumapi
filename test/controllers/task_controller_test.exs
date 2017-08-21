defmodule Scrumapi.TaskControllerTest do
  use Scrumapi.ConnCase

  alias Scrumapi.Task
  @valid_attrs %{name: "some content", priority: 42, status: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = get conn, task_path(conn, :show, task)
    body = json_response(conn, 200)["data"]
    assert body == %{"id" => task.id,
      "name" => task.name,
      "status" => task.status,
      "priority" => task.priority,
      "project" => nil,
      "sprint" => nil}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, task_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = delete conn, task_path(conn, :delete, task)
    assert response(conn, 204)
    refute Repo.get(Task, task.id)
  end

  test "renders tasks by given project_id", %{conn: conn} do
    project = Repo.insert! %Scrumapi.Project{}
    Repo.insert! %Task{
      name: "Somename",
      priority: 42,
      status: "not done",
      project_id: project.id}

    conn = get conn, task_path(conn, :tasks_by_project, project.id)
    resp = json_response(conn, 200)
    refute resp["data"] == []
    resp_task = List.first(resp["data"])
    assert resp_task["project"] == project.id
  end

  test "renders tasks by given sprint_id", %{conn: conn} do
    sprint = Repo.insert! %Scrumapi.Sprint{}
    Repo.insert! %Task{
      name: "Somename",
      priority: 42,
      status: "not done",
      sprint_id: sprint.id}

    conn = get conn, task_path(conn, :tasks_by_sprint, sprint.id)
    resp = json_response(conn, 200)
    refute resp["data"] == []
    assert List.first(resp["data"])["sprint"] == sprint.id
  end
end
