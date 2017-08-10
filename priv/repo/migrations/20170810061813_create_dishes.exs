defmodule LunchTracker.Repo.Migrations.CreateDishes do
  use Ecto.Migration

  def change do
    create table(:dishes) do
      add :title, :string

      timestamps()
    end

  end
end
