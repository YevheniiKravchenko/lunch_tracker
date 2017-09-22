defmodule LunchTracker.Repo.Migrations.CreateMenuItems do
  use Ecto.Migration

  def change do
    create table(:menu_items) do
      add :date, :date
      add :dish_id, references(:dishes, on_delete: :nothing)

      timestamps()
    end

    create index(:menu_items, [:dish_id])
  end
end
