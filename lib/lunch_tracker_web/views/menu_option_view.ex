defmodule LunchTrackerWeb.MenuOptionView do
  use LunchTrackerWeb, :view
  alias LunchTrackerWeb.MenuOptionView

  def render("index.json", %{menu_options: menu_options}) do
    %{data: render_many(menu_options, MenuOptionView, "menu_option.json")}
  end

  def render("show.json", %{menu_option: menu_option}) do
    %{data: render_one(menu_option, MenuOptionView, "menu_option.json")}
  end

  def render("menu_option.json", %{menu_option: menu_option}) do
    %{id: menu_option.id,
      date: menu_option.date}
  end
end
