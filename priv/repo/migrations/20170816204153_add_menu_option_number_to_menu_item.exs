defmodule LunchTracker.Repo.Migrations.AddMenuOptionNumberToMenuItem do
  use Ecto.Migration

  def change do
  	alter table(:menu_options) do
  		add :option_number, :integer
  	end
  end
end
