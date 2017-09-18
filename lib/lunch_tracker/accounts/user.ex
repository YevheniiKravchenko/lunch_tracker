defmodule LunchTracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias LunchTracker.Accounts.User
  alias LunchTracker.Orders.Order

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many :orders, Order

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
  end

  @doc false
  def registration_changeset(%User{} = user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_required(:password)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  @doc false
  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset
    end
  end
end
