defmodule LunchTrackerWeb.MenuOptionController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Menu
  alias LunchTracker.Menu.MenuOption

  action_fallback LunchTrackerWeb.FallbackController

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__


  def index(conn, params) do
    menu_options = Menu.list_menu_options(params["date"])
    render(conn, "index.json", menu_options: menu_options)
  end

  def create(conn, %{"menu_option" => menu_option_params}) do
    with {:ok, %MenuOption{} = menu_option} <- Menu.create_menu_option(menu_option_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", menu_option_path(conn, :show, menu_option))
      |> render("show.json", menu_option: menu_option)
    end
  end

  def show(conn, %{"id" => id}) do
    menu_option = Menu.get_menu_option!(id)
    render(conn, "show.json", menu_option: menu_option)
  end

  def update(conn, %{"id" => id, "menu_option" => menu_option_params}) do
    menu_option = Menu.get_menu_option!(id)

    with {:ok, %MenuOption{} = menu_option} <- Menu.update_menu_option(menu_option, menu_option_params) do
      render(conn, "show.json", menu_option: menu_option)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu_option = Menu.get_menu_option!(id)
    with {:ok, %MenuOption{}} <- Menu.delete_menu_option(menu_option) do
      send_resp(conn, :no_content, "")
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> json(%{error: "Unauthorized"})
  end
end
