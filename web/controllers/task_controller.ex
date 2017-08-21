defmodule Scrumapi.TaskController do
  use Scrumapi.Web, :controller

  alias Scrumapi.Task

  def index(conn, _params) do
    tasks = Repo.all(Task)
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    changeset = Task.changeset(%Task{}, task_params)

    case Repo.insert(changeset) do
      {:ok, task} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", task_path(conn, :show, task))
        |> render("show.json", task: task)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Scrumapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Repo.get!(Task, id)
    render(conn, "show.json", task: task)
  end

  def tasks_by_project(conn, %{"project_id" => project_id}) do
    tasks = Repo.all(
      from t in Scrumapi.Task,
      join: p in assoc(t, :project),
      where: p.id == ^project_id,
      select: t)

    render(conn, "index.json", %{tasks: tasks})
  end

  def tasks_by_sprint(conn, %{"sprint_id" => sprint_id}) do
    tasks = Repo.all(
      from t in Scrumapi.Task,
      join: s in assoc(t, :sprint),
      where: s.id == ^sprint_id,
      select: t)

    render(conn, "index.json", %{tasks: tasks})
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Repo.get!(Task, id)
    changeset = Task.changeset(task, task_params)

    case Repo.update(changeset) do
      {:ok, task} ->
        render(conn, "show.json", task: task)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Scrumapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Repo.get!(Task, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(task)

    send_resp(conn, :no_content, "")
  end
end
