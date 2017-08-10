defmodule LunchTrackerWeb.DishController do
  use LunchTrackerWeb, :controller

  alias LunchTracker.Menu
  alias LunchTracker.Menu.Dish

  action_fallback LunchTrackerWeb.FallbackController

  def index(conn, _params) do
    dishes = Menu.list_dishes()
    render(conn, "index.json", dishes: dishes)
  end

  def create(conn, %{"dish" => dish_params}) do
    with {:ok, %Dish{} = dish} <- Menu.create_dish(dish_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", dish_path(conn, :show, dish))
      |> render("show.json", dish: dish)
    end
  end

  def show(conn, %{"id" => id}) do
    dish = Menu.get_dish!(id)
    render(conn, "show.json", dish: dish)
  end

  def update(conn, %{"id" => id, "dish" => dish_params}) do
    dish = Menu.get_dish!(id)

    with {:ok, %Dish{} = dish} <- Menu.update_dish(dish, dish_params) do
      render(conn, "show.json", dish: dish)
    end
  end

  def delete(conn, %{"id" => id}) do
    dish = Menu.get_dish!(id)
    with {:ok, %Dish{}} <- Menu.delete_dish(dish) do
      send_resp(conn, :no_content, "")
    end
  end
end
