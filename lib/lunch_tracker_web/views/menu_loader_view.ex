defmodule LunchTrackerWeb.MenuLoaderView do
  use LunchTrackerWeb, :view

  def render("success.json", %{status: status}) do
    %{data: %{status: status}}
  end
end
