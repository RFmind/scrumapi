defmodule Scrumapi.Router do
  use Scrumapi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Scrumapi do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/tasks", TaskController, except: [:new, :edit]
    resources "/projects", ProjectController, except: [:new, :edit]
    resources "/sprints", SprintController, except: [:new, :edit]
  end
end
