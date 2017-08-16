defmodule LunchTrackerWeb.Router do
  use LunchTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LunchTrackerWeb do
    pipe_through :api

    resources "/dishes", DishController, except: [:new, :edit]
    resources "/menu_options", MenuOptionController, except: [:new, :edit]
    post "load_menu", MenuLoaderController, :create
  end
end
