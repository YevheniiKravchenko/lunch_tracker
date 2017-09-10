defmodule LunchTrackerWeb.OrderView do
  use LunchTrackerWeb, :view
  alias LunchTrackerWeb.OrderView
  alias LunchTrackerWeb.MenuOptionView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      date: order.date,
      pending: order.pending,
      user_id: order.user_id,
      menu_option: render_one(order.menu_option, MenuOptionView, "menu_option.json")
    }
  end
end
