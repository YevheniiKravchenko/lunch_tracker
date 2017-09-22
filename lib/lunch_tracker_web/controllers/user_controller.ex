defmodule LunchTrackerWeb.UserController do
  use LunchTrackerWeb, :controller
  
  alias LunchTracker.Accounts
  alias LunchTrackerWeb.AuthController

  action_fallback LunchTrackerWeb.FallbackController

  plug Guardian.Plug.EnsureAuthenticated, handler: AuthController


  def get_profile(conn, _params) do
    user = Guardian.Plug.current_resource(conn)

    conn
    |> put_status(:ok)
    |> render("show.json", user: user)
  end

  def update_profile(conn, %{ "user" => user_params }) do
    current_user = Guardian.Plug.current_resource(conn)

    case Accounts.update_user(current_user, user_params) do 
      { :ok, user } -> 
        conn
        |> put_status(:ok)
        |> render("show.json", user: user)
      { :error, _ } -> 
        conn
        |> put_status(422)
        |> render("error.json", %{})
    end 
  end
end
