defmodule Receipts.Core.Constant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "constants" do
    field :key, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(constant, attrs) do
    constant
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
