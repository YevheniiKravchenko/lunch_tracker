defmodule LunchTracker.Repo.Migrations.AddCostToMenuOptions do
  use Ecto.Migration

  def change do
	alter table(:menu_options) do
		add :cost, :float
		add :cost_without_main, :float
	end
  end
end
