defmodule LunchTracker.Repo.Migrations.RemoveDishesTable do
  use Ecto.Migration

  def change do
  	drop table(:dishes)
  end
end
