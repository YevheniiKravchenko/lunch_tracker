defmodule LunchTrackerWeb.AuthController do
	use LunchTrackerWeb, :controller

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias LunchTrackerWeb.AuthController
	alias LunchTracker.{Auth,Accounts}

  plug :scrub_params, "user" when action in [:login, :register]

  def login(conn, %{"user" => user_params}) do 

    case Auth.authenticate(%{email: user_params["email"], password: user_params["password"]}) do
      {:ok, user} -> 
        new_conn = Guardian.Plug.api_sign_in(conn, user)
        token = Guardian.Plug.current_token(new_conn)
        {:ok, claims} = Guardian.Plug.claims(new_conn)

        new_conn
        |> put_status(:ok)
        |> put_resp_header("authorization", "Bearer #{token}")
        |> put_resp_header("Access-Control-Expose-Headers", "authorization")
        |> render("login.json", user: user)
      :unauthorized -> 
        conn
        |> put_status(:unauthorized)
        |> render("error.json", user_params)
    end
  end

  def register(conn, user_with_credentials) do 
    %{"user" => credentials} = user_with_credentials
    case Accounts.create_user(credentials) do
      {:ok, _user} ->
        conn
        |> AuthController.login(user_with_credentials)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LunchTrackerWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def logout(conn, _params) do
    token = Guardian.Plug.current_token(conn)
    {:ok, claims} = Guardian.Plug.claims(conn)

    Guardian.revoke!(token, claims)
    
    conn
    |> render("logout.json")
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> json(%{error: "Unauthorized"})
  end
end