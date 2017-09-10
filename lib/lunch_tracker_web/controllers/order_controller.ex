defmodule LunchTrackerWeb.OrderController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Orders
  alias LunchTracker.Orders.Order

  action_fallback LunchTrackerWeb.FallbackController

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

  def index(conn, params) do
    orders = Orders.list_orders(params["date"])
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    user = Guardian.Plug.current_resource(conn)
    params_with_user = Map.put(order_params, "user_id", user.id)

    with %Order{} = order <- Orders.create_order(params_with_user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{} = order} <- Orders.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    with {:ok, %Order{}} <- Orders.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> json(%{error: "Unauthorized"})
  end
end
