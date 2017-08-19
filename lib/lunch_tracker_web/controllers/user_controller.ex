defmodule LunchTrackerWeb.UserController do
  use LunchTrackerWeb, :controller
  
  alias LunchTracker.Accounts.User
  alias LunchTracker.Accounts

  action_fallback LunchTrackerWeb.FallbackController

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do 
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LunchTrackerWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
