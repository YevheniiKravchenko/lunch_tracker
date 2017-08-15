defmodule LunchTracker.Menu.MenuOption do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Menu.MenuOption


  schema "menu_options" do
    field :date, :date
    field :cost, :float
    field :cost_without_main, :float

    timestamps()
  end

  @doc false
  def changeset(%MenuOption{} = menu_option, attrs) do
    menu_option
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
