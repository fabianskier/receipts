defmodule Receipts.Core.Receipt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receipts" do
    field :fecha_emision, :date
    field :monto_exento, :float
    field :monto_gravado_10, :float
    field :monto_total, :float
    field :numero_comprobante, :string
    field :numero_identificacion, :string
    field :razon_social, :string
    field :timbrado, :integer

    timestamps()
  end

  @doc false
  def changeset(receipt, attrs) do
    receipt
    |> cast(attrs, [:fecha_emision, :timbrado, :numero_comprobante, :numero_identificacion, :razon_social, :monto_gravado_10, :monto_gravado_10, :monto_exento, :monto_total])
    |> validate_required([:fecha_emision, :timbrado, :numero_comprobante, :numero_identificacion, :razon_social, :monto_gravado_10, :monto_gravado_10, :monto_exento, :monto_total])
  end
end
