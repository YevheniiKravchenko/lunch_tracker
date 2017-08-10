defmodule LunchTrackerWeb.MenuOptionControllerTest do
  use LunchTrackerWeb.ConnCase

  alias LunchTracker.Menu
  alias LunchTracker.Menu.MenuOption

  @create_attrs %{date: ~D[2010-04-17]}
  @update_attrs %{date: ~D[2011-05-18]}
  @invalid_attrs %{date: nil}

  def fixture(:menu_option) do
    {:ok, menu_option} = Menu.create_menu_option(@create_attrs)
    menu_option
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all menu_options", %{conn: conn} do
      conn = get conn, menu_option_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create menu_option" do
    test "renders menu_option when data is valid", %{conn: conn} do
      conn = post conn, menu_option_path(conn, :create), menu_option: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, menu_option_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => ~D[2010-04-17]}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, menu_option_path(conn, :create), menu_option: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update menu_option" do
    setup [:create_menu_option]

    test "renders menu_option when data is valid", %{conn: conn, menu_option: %MenuOption{id: id} = menu_option} do
      conn = put conn, menu_option_path(conn, :update, menu_option), menu_option: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, menu_option_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => ~D[2011-05-18]}
    end

    test "renders errors when data is invalid", %{conn: conn, menu_option: menu_option} do
      conn = put conn, menu_option_path(conn, :update, menu_option), menu_option: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete menu_option" do
    setup [:create_menu_option]

    test "deletes chosen menu_option", %{conn: conn, menu_option: menu_option} do
      conn = delete conn, menu_option_path(conn, :delete, menu_option)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, menu_option_path(conn, :show, menu_option)
      end
    end
  end

  defp create_menu_option(_) do
    menu_option = fixture(:menu_option)
    {:ok, menu_option: menu_option}
  end
end
