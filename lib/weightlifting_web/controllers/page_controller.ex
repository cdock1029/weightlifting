defmodule WeightliftingWeb.PageController do
  use WeightliftingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
