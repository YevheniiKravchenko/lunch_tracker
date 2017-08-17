defmodule LunchTrackerWeb.MenuLoaderController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Menu.Parser
  alias LunchTracker.Menu

  def create(conn, %{"menu" => uploaded_menu_csv, "date" => date}) do
  	%{ path: csv_temp_path } = uploaded_menu_csv

  	Parser.parse(csv_temp_path) 
  	|> Menu.create_menu_items(date)

  	conn
  	|> render("success.json", %{status: "OK"})
  end

end