defmodule LunchTracker.Repo.Migrations.AddMenuOptionIdToDishes do
  use Ecto.Migration

  def change do
	alter table(:dishes) do 
		add :menu_option_id, references(:menu_options)
  	end
  end
end
