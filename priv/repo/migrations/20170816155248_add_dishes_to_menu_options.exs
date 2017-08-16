defmodule LunchTracker.Repo.Migrations.AddDishesToMenuOptions do
  use Ecto.Migration

  def change do
  	alter table(:menu_options) do
  		add :main, :string
	    add :side1, :string
	    add :side2, :string
	    add :salad, :string
  	end
  end
end
