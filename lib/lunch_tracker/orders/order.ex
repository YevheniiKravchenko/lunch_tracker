defmodule LunchTracker.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Orders.Order
  alias LunchTracker.Accounts.User
  alias LunchTracker.Menu.MenuOption


  schema "orders" do
    field :date, :date
    field :pending, :boolean, default: false

    belongs_to :user, User
    belongs_to :menu_option, MenuOption

    timestamps()
  end

  @doc false
  def changeset(%Order{} = order, attrs) do
    order
    |> cast(attrs, [:date, :pending, :menu_option_id, :user_id])
    |> validate_required([:date, :menu_option_id, :user_id])
  end
end
