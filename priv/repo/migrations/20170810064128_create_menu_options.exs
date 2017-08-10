defmodule LunchTracker.Repo.Migrations.CreateMenuOptions do
  use Ecto.Migration

  def change do
    create table(:menu_options) do
      add :date, :date

      timestamps()
    end

  end
end
