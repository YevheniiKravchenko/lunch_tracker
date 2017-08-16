defmodule LunchTrackerWeb.MenuLoaderView do
  use LunchTrackerWeb, :view
  alias LunchTrackerWeb.DishView

  def render("success.json", %{status: status}) do
    %{data: %{status: status}}
  end
end
