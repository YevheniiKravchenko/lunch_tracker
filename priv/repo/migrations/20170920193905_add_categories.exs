defmodule LunchTracker.Repo.Migrations.AddCategories do
  use Ecto.Migration

  def change do
  	create table(:categories) do
      add :title, :string

      timestamps()
    end

    alter table(:dishes) do 
			add :category_id, references(:categories)
	  end
  end
end
