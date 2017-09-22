defmodule LunchTracker.Dishes.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Dishes.Category
  alias LunchTracker.Dishes.Dish

  schema "categories" do
    field :title, :string

    has_many :dishes, Dish

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:id, :title])
    |> validate_required([:title])
  end
end
