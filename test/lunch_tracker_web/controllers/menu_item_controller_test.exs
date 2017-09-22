defmodule LunchTrackerWeb.MenuItemControllerTest do
  use LunchTrackerWeb.ConnCase

  alias LunchTracker.Menu
  alias LunchTracker.Menu.MenuItem

  @create_attrs %{date: ~D[2010-04-17]}
  @update_attrs %{date: ~D[2011-05-18]}
  @invalid_attrs %{date: nil}

  def fixture(:menu_item) do
    {:ok, menu_item} = Menu.create_menu_item(@create_attrs)
    menu_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all menu_items", %{conn: conn} do
      conn = get conn, menu_item_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create menu_item" do
    test "renders menu_item when data is valid", %{conn: conn} do
      conn = post conn, menu_item_path(conn, :create), menu_item: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, menu_item_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => ~D[2010-04-17]}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, menu_item_path(conn, :create), menu_item: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update menu_item" do
    setup [:create_menu_item]

    test "renders menu_item when data is valid", %{conn: conn, menu_item: %MenuItem{id: id} = menu_item} do
      conn = put conn, menu_item_path(conn, :update, menu_item), menu_item: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, menu_item_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => ~D[2011-05-18]}
    end

    test "renders errors when data is invalid", %{conn: conn, menu_item: menu_item} do
      conn = put conn, menu_item_path(conn, :update, menu_item), menu_item: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete menu_item" do
    setup [:create_menu_item]

    test "deletes chosen menu_item", %{conn: conn, menu_item: menu_item} do
      conn = delete conn, menu_item_path(conn, :delete, menu_item)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, menu_item_path(conn, :show, menu_item)
      end
    end
  end

  defp create_menu_item(_) do
    menu_item = fixture(:menu_item)
    {:ok, menu_item: menu_item}
  end
end
