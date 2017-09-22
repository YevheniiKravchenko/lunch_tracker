defmodule LunchTracker.DishesTest do
  use LunchTracker.DataCase

  alias LunchTracker.Dishes

  describe "dishes" do
    alias LunchTracker.Dishes.Dish

    @valid_attrs %{cost: 120.5, quantity: "some quantity", title: "some title"}
    @update_attrs %{cost: 456.7, quantity: "some updated quantity", title: "some updated title"}
    @invalid_attrs %{cost: nil, quantity: nil, title: nil}

    def dish_fixture(attrs \\ %{}) do
      {:ok, dish} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Dishes.create_dish()

      dish
    end

    test "list_dishes/0 returns all dishes" do
      dish = dish_fixture()
      assert Dishes.list_dishes() == [dish]
    end

    test "get_dish!/1 returns the dish with given id" do
      dish = dish_fixture()
      assert Dishes.get_dish!(dish.id) == dish
    end

    test "create_dish/1 with valid data creates a dish" do
      assert {:ok, %Dish{} = dish} = Dishes.create_dish(@valid_attrs)
      assert dish.cost == 120.5
      assert dish.quantity == "some quantity"
      assert dish.title == "some title"
    end

    test "create_dish/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dishes.create_dish(@invalid_attrs)
    end

    test "update_dish/2 with valid data updates the dish" do
      dish = dish_fixture()
      assert {:ok, dish} = Dishes.update_dish(dish, @update_attrs)
      assert %Dish{} = dish
      assert dish.cost == 456.7
      assert dish.quantity == "some updated quantity"
      assert dish.title == "some updated title"
    end

    test "update_dish/2 with invalid data returns error changeset" do
      dish = dish_fixture()
      assert {:error, %Ecto.Changeset{}} = Dishes.update_dish(dish, @invalid_attrs)
      assert dish == Dishes.get_dish!(dish.id)
    end

    test "delete_dish/1 deletes the dish" do
      dish = dish_fixture()
      assert {:ok, %Dish{}} = Dishes.delete_dish(dish)
      assert_raise Ecto.NoResultsError, fn -> Dishes.get_dish!(dish.id) end
    end

    test "change_dish/1 returns a dish changeset" do
      dish = dish_fixture()
      assert %Ecto.Changeset{} = Dishes.change_dish(dish)
    end
  end
end
