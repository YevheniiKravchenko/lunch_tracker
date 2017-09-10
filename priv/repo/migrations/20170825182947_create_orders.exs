defmodule LunchTracker.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :date, :date
      add :pending, :boolean, default: true, null: false
      add :menu_option_id, references(:menu_options, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:menu_option_id])
    create index(:orders, [:user_id])
  end
end
