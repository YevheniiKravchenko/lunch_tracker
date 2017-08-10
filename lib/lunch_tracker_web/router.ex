defmodule LunchTrackerWeb.Router do
  use LunchTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LunchTrackerWeb do
    pipe_through :api
  end
end
