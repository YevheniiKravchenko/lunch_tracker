defmodule LunchTracker.Menu do
  @moduledoc """
  The Menu context.
  """
  
  import Ecto.Query, warn: false
  alias LunchTracker.Repo

  alias LunchTracker.Menu.MenuOption

  @doc """
  Returns the list of menu_options.

  ## Examples

      iex> list_menu_options()
      [%MenuOption{}, ...]

  """
  def list_menu_options do
    Repo.all(MenuOption)
  end

  @doc """
  Gets a single menu_option.

  Raises `Ecto.NoResultsError` if the Menu option does not exist.

  ## Examples

      iex> get_menu_option!(123)
      %MenuOption{}

      iex> get_menu_option!(456)
      ** (Ecto.NoResultsError)

  """
  def get_menu_option!(id), do: Repo.get!(MenuOption, id)

  @doc """
  Creates a menu_option.

  ## Examples

      iex> create_menu_option(%{field: value})
      {:ok, %MenuOption{}}

      iex> create_menu_option(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_menu_option(attrs \\ %{}) do
    %MenuOption{}
    |> MenuOption.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a menu_option.

  ## Examples

      iex> update_menu_option(menu_option, %{field: new_value})
      {:ok, %MenuOption{}}

      iex> update_menu_option(menu_option, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_menu_option(%MenuOption{} = menu_option, attrs) do
    menu_option
    |> MenuOption.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MenuOption.

  ## Examples

      iex> delete_menu_option(menu_option)
      {:ok, %MenuOption{}}

      iex> delete_menu_option(menu_option)
      {:error, %Ecto.Changeset{}}

  """
  def delete_menu_option(%MenuOption{} = menu_option) do
    Repo.delete(menu_option)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking menu_option changes.

  ## Examples

      iex> change_menu_option(menu_option)
      %Ecto.Changeset{source: %MenuOption{}}

  """
  def change_menu_option(%MenuOption{} = menu_option) do
    MenuOption.changeset(menu_option, %{})
  end

  def create_menu_items(menu, date) do
    menu
    |> Enum.each(fn item -> create_menu_item(item, date) end)
  end

  defp create_menu_item(item, date) do
    create_menu_option(%{ item | date: date })
  end
end
