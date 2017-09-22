defmodule LunchTracker.Menu.MenuItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Menu.MenuItem
  alias LunchTracker.Dishes.Dish

  schema "menu_items" do
    field :date, :date

    belongs_to :dish, Dish

    timestamps()
  end

  @doc false
  def changeset(%MenuItem{} = menu_item, attrs) do
    menu_item
    |> cast(attrs, [:date, :dish_id])
    |> validate_required([:date])
    |> foreign_key_constraint(:dish_id)
  end
end
