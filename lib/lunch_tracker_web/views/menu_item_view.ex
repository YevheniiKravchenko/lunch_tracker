defmodule LunchTrackerWeb.MenuItemView do
  use LunchTrackerWeb, :view
  alias LunchTrackerWeb.MenuItemView

  def render("index.json", %{menu_items: menu_items}) do
    %{data: render_many(menu_items, MenuItemView, "menu_item.json")}
  end

  def render("show.json", %{menu_item: menu_item}) do
    %{data: render_one(menu_item, MenuItemView, "menu_item.json")}
  end

  def render("menu_item.json", %{menu_item: menu_item}) do
    %{id: menu_item.id,
      date: menu_item.date}
  end
end
