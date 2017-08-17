defmodule Scrumapi.ProjectView do
  use Scrumapi.Web, :view

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, Scrumapi.ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, Scrumapi.ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      name: project.name,
      description: project.description}
  end
end
