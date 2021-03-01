defmodule Olddragonsheet.Repo do
  use Ecto.Repo,
    otp_app: :olddragonsheet,
    adapter: Ecto.Adapters.Postgres
end
