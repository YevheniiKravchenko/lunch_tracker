defmodule LunchTrackerWeb.AuthView do
	use LunchTrackerWeb, :view

	alias LunchTrackerWeb.AuthView
  alias LunchTracker.Accounts.User

	def render("login.json", %{user: user}) do
    %{data: %{
      user: %{
        id: user.id,
        email: user.email
      }
    }}
  end

  def render("error.json", _anything) do
    %{errors: "failed to authenticate"}
  end

  def render("logout.json", _anything) do
    %{status: "Unauthorized"}
  end
end