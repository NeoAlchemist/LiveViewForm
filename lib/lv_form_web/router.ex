defmodule LvFormWeb.Router do
  use LvFormWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", LvFormWeb do
    pipe_through :browser

    live "/", PageLive
  end
end
