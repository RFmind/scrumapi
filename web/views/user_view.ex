defmodule Scrumapi.UserView do
  use Scrumapi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Scrumapi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Scrumapi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password_hash: user.password_hash}
  end
end
