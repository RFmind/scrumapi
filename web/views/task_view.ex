defmodule Scrumapi.TaskView do
  use Scrumapi.Web, :view

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, Scrumapi.TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, Scrumapi.TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      name: task.name,
      status: task.status,
      priority: task.priority,
      project: task.project_id,
      sprint: task.sprint_id}
  end
end
