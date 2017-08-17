defmodule Scrumapi.SprintView do
  use Scrumapi.Web, :view

  def render("index.json", %{sprints: sprints}) do
    %{data: render_many(sprints, Scrumapi.SprintView, "sprint.json")}
  end

  def render("show.json", %{sprint: sprint}) do
    %{data: render_one(sprint, Scrumapi.SprintView, "sprint.json")}
  end

  def render("sprint.json", %{sprint: sprint}) do
    %{id: sprint.id,
      name: sprint.name,
      description: sprint.description}
  end
end
