defmodule WeightliftingWeb.Router do
  use WeightliftingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {WeightliftingWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeightliftingWeb do
    pipe_through :browser

    live "/", HomeLive, :index

    live "/exercises", ExerciseLive.Index, :index
    live "/exercises/new", ExerciseLive.Index, :new
    live "/exercises/:id/edit", ExerciseLive.Index, :edit

    live "/exercises/:id", ExerciseLive.Show, :show
    live "/exercises/:id/show/edit", ExerciseLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeightliftingWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: WeightliftingWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
