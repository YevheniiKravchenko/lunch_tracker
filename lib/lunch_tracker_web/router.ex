defmodule LunchTrackerWeb.Router do
  use LunchTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do 
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", LunchTrackerWeb do
    pipe_through :api

    post "/register", AuthController, :register
    post "/login", AuthController, :login
  end

  scope "/api", LunchTrackerWeb do 
    pipe_through :api_auth

    get "/profile", UserController, :get_profile
    post "/profile", UserController, :update_profile

    post "/upload_dishes", MenuLoaderController, :update_dishes
    post "/upload_categories", MenuLoaderController, :update_categories
    post "/upload_day_menu", MenuLoaderController, :create_day_menu

    resources "/dishes", DishController, except: [:new, :edit]
    resources "/menu_items", MenuItemController, except: [:new, :edit]

    get "/logout", AuthController, :logout
  end
end
