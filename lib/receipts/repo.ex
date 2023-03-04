defmodule Receipts.Repo do
  use Ecto.Repo,
    otp_app: :receipts,
    adapter: Ecto.Adapters.Postgres
end
