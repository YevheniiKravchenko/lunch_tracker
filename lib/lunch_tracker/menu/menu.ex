defmodule LunchTracker.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query, warn: false
  alias LunchTracker.Repo

  alias LunchTracker.Menu.Dish

  @doc """
  Returns the list of dishes.

  ## Examples

      iex> list_dishes()
      [%Dish{}, ...]

  """
  def list_dishes do
    Repo.all(Dish)
  end

  @doc """
  Gets a single dish.

  Raises `Ecto.NoResultsError` if the Dish does not exist.

  ## Examples

      iex> get_dish!(123)
      %Dish{}

      iex> get_dish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dish!(id), do: Repo.get!(Dish, id)

  @doc """
  Creates a dish.

  ## Examples

      iex> create_dish(%{field: value})
      {:ok, %Dish{}}

      iex> create_dish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dish(attrs \\ %{}) do
    %Dish{}
    |> Dish.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dish.

  ## Examples

      iex> update_dish(dish, %{field: new_value})
      {:ok, %Dish{}}

      iex> update_dish(dish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dish(%Dish{} = dish, attrs) do
    dish
    |> Dish.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Dish.

  ## Examples

      iex> delete_dish(dish)
      {:ok, %Dish{}}

      iex> delete_dish(dish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dish(%Dish{} = dish) do
    Repo.delete(dish)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dish changes.

  ## Examples

      iex> change_dish(dish)
      %Ecto.Changeset{source: %Dish{}}

  """
  def change_dish(%Dish{} = dish) do
    Dish.changeset(dish, %{})
  end

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
end
