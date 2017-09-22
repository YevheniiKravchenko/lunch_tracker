defmodule LunchTrackerWeb.DishController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Dishes
  alias LunchTracker.Dishes.Dish

  action_fallback LunchTrackerWeb.FallbackController

  def index(conn, _params) do
    dishes = Dishes.list_dishes()
    render(conn, "index.json", dishes: dishes)
  end

  def create(conn, %{"dish" => dish_params}) do
    with {:ok, %Dish{} = dish} <- Dishes.create_dish(dish_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", dish_path(conn, :show, dish))
      |> render("show.json", dish: dish)
    end
  end

  def show(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)
    render(conn, "show.json", dish: dish)
  end

  def update(conn, %{"id" => id, "dish" => dish_params}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{} = dish} <- Dishes.update_dish(dish, dish_params) do
      render(conn, "show.json", dish: dish)
    end
  end

  def delete(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)
    with {:ok, %Dish{}} <- Dishes.delete_dish(dish) do
      send_resp(conn, :no_content, "")
    end
  end
end
