defmodule LunchTrackerWeb.MenuLoaderController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.{Menu,Dishes}
  alias LunchTracker.Dishes.{DishParser,CategoryParser}
  alias LunchTrackerWeb.AuthController

  plug Guardian.Plug.EnsureAuthenticated, handler: AuthController

  def update_dishes(conn, %{"dishes" => dishes_csv}) do
  	%{ path: csv_temp_path } = dishes_csv

  	DishParser.parse(csv_temp_path)
  	|> Dishes.update_dishes

  	conn
    |> put_status(:ok)
  	|> render("success.json", %{status: "OK"})
  end

  def update_categories(conn, %{"categories" => categories_csv}) do
    %{ path: csv_temp_path } = categories_csv

    CategoryParser.parse(csv_temp_path)
    |> Dishes.update_categories

    conn
    |> put_status(:ok)
    |> render("success.json", %{status: "OK"})
  end

  def create_day_menu(conn, %{"menu" => uploaded_menu_csv, "date" => date}) do
    %{ path: csv_temp_path } = uploaded_menu_csv

    DishParser.parse(csv_temp_path) 
    |> Menu.create_day_menu(date)

    conn
    |> put_status(:ok)
    |> render("success.json", %{status: "OK"})
  end

end