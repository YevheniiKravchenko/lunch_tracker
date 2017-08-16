defmodule LunchTrackerWeb.MenuLoaderController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Menu.Parser

  def create(conn, %{"menu" => uploaded_menu_csv}) do
  	%{ path: csv_temp_path } = uploaded_menu_csv

  	Parser.parse(csv_temp_path) |> IO.inspect

  	conn
  	|> render("success.json", %{status: "OK"})
  end

end