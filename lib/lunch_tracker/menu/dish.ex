defmodule LunchTracker.Menu.Dish do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Menu.Dish


  schema "dishes" do
    field :title, :string

    belongs_to :menu_option, LunchTracker.Menu.MenuOption, foreign_key: :menu_option_id

    timestamps()
  end

  @doc false
  def changeset(%Dish{} = dish, attrs) do
    dish
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
