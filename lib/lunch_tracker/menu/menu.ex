defmodule LunchTracker.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query, warn: false
  alias LunchTracker.Repo

  # Dishes menu
  alias LunchTracker.Menu.MenuItem

  def create_day_menu(menu, date) do
    menu
    |> Enum.each(fn item -> create_day_menu_item(item, date) end)
  end

  defp create_day_menu_item(item, date) do
    %{
      dish_id: item.id,
      date: date
    }
    |> create_menu_item
  end

  @doc """
  Returns the list of menu_items.

  ## Examples

      iex> list_menu_items()
      [%MenuItem{}, ...]

  """
  def list_menu_items do 
    Repo.all from MenuItem, preload: [:dish]
  end

  def list_menu_items(date) when is_nil(date), do: list_menu_items()

  def list_menu_items(date) do 
    Repo.all from item in MenuItem, where: item.date == ^date, preload: [:dish]
  end


  @doc """
  Gets a single menu_item.

  Raises `Ecto.NoResultsError` if the Menu item does not exist.

  ## Examples

      iex> get_menu_item!(123)
      %MenuItem{}

      iex> get_menu_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_menu_item!(id), do: Repo.get!(MenuItem, id)

  @doc """
  Creates a menu_item.

  ## Examples

      iex> create_menu_item(%{field: value})
      {:ok, %MenuItem{}}

      iex> create_menu_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_menu_item(attrs \\ %{}) do
    %MenuItem{}
    |> MenuItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a menu_item.

  ## Examples

      iex> update_menu_item(menu_item, %{field: new_value})
      {:ok, %MenuItem{}}

      iex> update_menu_item(menu_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_menu_item(%MenuItem{} = menu_item, attrs) do
    menu_item
    |> MenuItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MenuItem.

  ## Examples

      iex> delete_menu_item(menu_item)
      {:ok, %MenuItem{}}

      iex> delete_menu_item(menu_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_menu_item(%MenuItem{} = menu_item) do
    Repo.delete(menu_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking menu_item changes.

  ## Examples

      iex> change_menu_item(menu_item)
      %Ecto.Changeset{source: %MenuItem{}}

  """
  def change_menu_item(%MenuItem{} = menu_item) do
    MenuItem.changeset(menu_item, %{})
  end
end
