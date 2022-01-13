defmodule Weightlifting.Repo do
  use Ecto.Repo,
    otp_app: :weightlifting,
    adapter: Ecto.Adapters.Postgres
end
