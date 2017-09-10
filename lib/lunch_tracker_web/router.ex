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

    resources "/users", UserController, only: [:create]

    post "/login", AuthController, :login
  end

  scope "/api", LunchTrackerWeb do 
    pipe_through :api_auth

    resources "/menu_options", MenuOptionController, except: [:new, :edit]
    post "/load_menu", MenuLoaderController, :create
    resources "/orders", OrderController, except: [:new, :edit]

    get "/logout", AuthController, :logout
  end
end
