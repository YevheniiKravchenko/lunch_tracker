defmodule LunchTracker.Menu.MenuOption do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Menu.MenuOption
  alias LunchTracker.Orders.Order


  schema "menu_options" do
    field :date, :date
    field :main, :string
    field :side1, :string
    field :side2, :string
    field :salad, :string
    field :cost, :float
    field :cost_without_main, :float
    field :option_number, :integer

    has_many :orders, Order

    timestamps()
  end

  @doc false
  def changeset(%MenuOption{} = menu_option, attrs) do
    menu_option
    |> cast(attrs, [:date, :main, :side1, :side2, :salad, :cost, :cost_without_main, :option_number])
    |> validate_required([:date, :main, :cost, :cost_without_main, :option_number])
  end
end
