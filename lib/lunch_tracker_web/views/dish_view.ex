defmodule LunchTrackerWeb.DishView do
  use LunchTrackerWeb, :view
  alias LunchTrackerWeb.DishView

  def render("index.json", %{dishes: dishes}) do
    %{data: render_many(dishes, DishView, "dish.json")}
  end

  def render("show.json", %{dish: dish}) do
    %{data: render_one(dish, DishView, "dish.json")}
  end

  def render("dish.json", %{dish: dish}) do
    %{id: dish.id,
      title: dish.title,
      cost: dish.cost,
      quantity: dish.quantity}
  end
end
