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
end
