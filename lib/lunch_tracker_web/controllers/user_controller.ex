defmodule LunchTrackerWeb.UserController do
  use LunchTrackerWeb, :controller
  
  alias LunchTracker.Accounts.User
  alias LunchTracker.Accounts
  alias LunchTrackerWeb.AuthController

  action_fallback LunchTrackerWeb.FallbackController

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__ 


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

    # with %User{} = user <- Orders.create_order(params_with_user) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", order_path(conn, :show, order))
    #   |> render("show.json", order: order)
    # end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> json(%{error: "Unauthorized"})
  end
end
