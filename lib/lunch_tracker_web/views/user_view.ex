defmodule LunchTrackerWeb.UserView do 
	use LunchTrackerWeb, :view

	alias LunchTrackerWeb.UserView

	def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
    	id: user.id,
      email: user.email,
      name: user.name
    }
  end

  def render("error.json", _t) do
    %{
      error: true
    }
  end
  # def render("login.json", %{user: user}) do
  #   %{data: %{
  #     user: %{
  #       id: user.id,
  #       email: user.email
  #     }
  #   }}
  # end
end