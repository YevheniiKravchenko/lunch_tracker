defmodule LunchTracker.Dishes.Dish do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Dishes.Dish
  alias LunchTracker.Dishes.Category

  schema "dishes" do
    field :cost, :float
    field :quantity, :string
    field :title, :string

    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(%Dish{} = dish, attrs) do
    dish
    |> cast(attrs, [:id, :category_id, :title, :cost, :quantity])
    |> validate_required([:title, :cost, :quantity])
    |> foreign_key_constraint(:category_id)
  end
end
