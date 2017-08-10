defmodule LunchTracker.MenuTest do
  use LunchTracker.DataCase

  alias LunchTracker.Menu

  describe "dishes" do
    alias LunchTracker.Menu.Dish

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def dish_fixture(attrs \\ %{}) do
      {:ok, dish} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_dish()

      dish
    end

    test "list_dishes/0 returns all dishes" do
      dish = dish_fixture()
      assert Menu.list_dishes() == [dish]
    end

    test "get_dish!/1 returns the dish with given id" do
      dish = dish_fixture()
      assert Menu.get_dish!(dish.id) == dish
    end

    test "create_dish/1 with valid data creates a dish" do
      assert {:ok, %Dish{} = dish} = Menu.create_dish(@valid_attrs)
      assert dish.title == "some title"
    end

    test "create_dish/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_dish(@invalid_attrs)
    end

    test "update_dish/2 with valid data updates the dish" do
      dish = dish_fixture()
      assert {:ok, dish} = Menu.update_dish(dish, @update_attrs)
      assert %Dish{} = dish
      assert dish.title == "some updated title"
    end

    test "update_dish/2 with invalid data returns error changeset" do
      dish = dish_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_dish(dish, @invalid_attrs)
      assert dish == Menu.get_dish!(dish.id)
    end

    test "delete_dish/1 deletes the dish" do
      dish = dish_fixture()
      assert {:ok, %Dish{}} = Menu.delete_dish(dish)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_dish!(dish.id) end
    end

    test "change_dish/1 returns a dish changeset" do
      dish = dish_fixture()
      assert %Ecto.Changeset{} = Menu.change_dish(dish)
    end
  end

  describe "menu_options" do
    alias LunchTracker.Menu.MenuOption

    @valid_attrs %{date: ~D[2010-04-17]}
    @update_attrs %{date: ~D[2011-05-18]}
    @invalid_attrs %{date: nil}

    def menu_option_fixture(attrs \\ %{}) do
      {:ok, menu_option} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_menu_option()

      menu_option
    end

    test "list_menu_options/0 returns all menu_options" do
      menu_option = menu_option_fixture()
      assert Menu.list_menu_options() == [menu_option]
    end

    test "get_menu_option!/1 returns the menu_option with given id" do
      menu_option = menu_option_fixture()
      assert Menu.get_menu_option!(menu_option.id) == menu_option
    end

    test "create_menu_option/1 with valid data creates a menu_option" do
      assert {:ok, %MenuOption{} = menu_option} = Menu.create_menu_option(@valid_attrs)
      assert menu_option.date == ~D[2010-04-17]
    end

    test "create_menu_option/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_menu_option(@invalid_attrs)
    end

    test "update_menu_option/2 with valid data updates the menu_option" do
      menu_option = menu_option_fixture()
      assert {:ok, menu_option} = Menu.update_menu_option(menu_option, @update_attrs)
      assert %MenuOption{} = menu_option
      assert menu_option.date == ~D[2011-05-18]
    end

    test "update_menu_option/2 with invalid data returns error changeset" do
      menu_option = menu_option_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_menu_option(menu_option, @invalid_attrs)
      assert menu_option == Menu.get_menu_option!(menu_option.id)
    end

    test "delete_menu_option/1 deletes the menu_option" do
      menu_option = menu_option_fixture()
      assert {:ok, %MenuOption{}} = Menu.delete_menu_option(menu_option)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_menu_option!(menu_option.id) end
    end

    test "change_menu_option/1 returns a menu_option changeset" do
      menu_option = menu_option_fixture()
      assert %Ecto.Changeset{} = Menu.change_menu_option(menu_option)
    end
  end
end
