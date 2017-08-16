defmodule LunchTracker.Menu.MenuOption do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Menu.MenuOption


  schema "menu_options" do
    field :date, :date
    field :main, :string
    field :side1, :string
    field :side2, :string
    field :salad, :string
    field :cost, :float
    field :cost_without_main, :float

    timestamps()
  end

  @doc false
  def changeset(%MenuOption{} = menu_option, attrs) do
    menu_option
    |> cast(attrs, [:date, :main, :side1, :side2, :salad, :cost, :cost_without_main])
    |> validate_required([:date, :main, :cost, :cost_without_main])
  end
end
