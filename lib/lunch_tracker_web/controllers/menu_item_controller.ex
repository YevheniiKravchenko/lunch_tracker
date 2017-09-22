defmodule LunchTrackerWeb.MenuItemController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Menu
  alias LunchTracker.Menu.MenuItem

  action_fallback LunchTrackerWeb.FallbackController

  def index(conn, params) do
    menu_items = Menu.list_menu_items(params["date"])
    render(conn, "index.json", menu_items: menu_items)
  end

  def create(conn, %{"menu_item" => menu_item_params}) do
    with {:ok, %MenuItem{} = menu_item} <- Menu.create_menu_item(menu_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", menu_item_path(conn, :show, menu_item))
      |> render("show.json", menu_item: menu_item)
    end
  end

  def show(conn, %{"id" => id}) do
    menu_item = Menu.get_menu_item!(id)
    render(conn, "show.json", menu_item: menu_item)
  end

  def update(conn, %{"id" => id, "menu_item" => menu_item_params}) do
    menu_item = Menu.get_menu_item!(id)

    with {:ok, %MenuItem{} = menu_item} <- Menu.update_menu_item(menu_item, menu_item_params) do
      render(conn, "show.json", menu_item: menu_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu_item = Menu.get_menu_item!(id)
    with {:ok, %MenuItem{}} <- Menu.delete_menu_item(menu_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
