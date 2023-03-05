defmodule ReceiptsWeb.Graphql.Types.Receipt do
  @moduledoc false

  use Absinthe.Schema.Notation

  import_types ReceiptsWeb.Graphql.Enums.SortOrder
  import_types Absinthe.Type.Custom

  @desc "Receipt type"
  object :receipt do
    field :id, :id
    field :condicion, :string
    field :fecha_emision, :date
    field :impuesto, list_of(:string)
    field :monto_exento, :float
    field :monto_gravado_10, :float
    field :monto_gravado_5, :float
    field :monto_total, :float
    field :numero_comprobante, :string
    field :numero_identificacion, :string
    field :razon_social, :string
    field :timbrado, :integer
    field :tipo_comprobante, :string
    field :tipo_identificacion, :string
  end

  @desc "Receipt input type"
  input_object :receipt_input do
    field :condicion, :string
    field :fecha_emision, :date
    field :impuesto, list_of(:string)
    field :monto_exento, :float
    field :monto_gravado_10, :float
    field :monto_gravado_5, :float
    field :monto_total, :float
    field :numero_comprobante, :string
    field :numero_identificacion, :string
    field :razon_social, :string
    field :timbrado, :integer
    field :tipo_comprobante, :string
    field :tipo_identificacion, :string
  end
end
