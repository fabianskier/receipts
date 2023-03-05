defmodule ReceiptsWeb.Graphql.Operations.Queries.Receipt do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias ReceiptsWeb.Graphql.Resolvers.Receipt

  @desc "Receipts query operations"
  object :receipt_queries do
    @desc "Get a list of receipts, optionally filtered by limit, offset and order"
    field :list_receipts, list_of(:receipt) do
      @desc "Limit the number of receipts returned"
      arg :limit, :integer
      @desc "Number of receipts to skip"
      arg :offset, :integer
      @desc "Order of receipts returned. Default is :asc"
      arg :order, type: :sort_order, default_value: :asc
      resolve &Receipt.list_receipts/3
    end

    @desc "Get a single receipt by id"
    field :get_receipt, :receipt do
      @desc "The id of the receipt"
      arg :id, non_null(:id)
      resolve &Receipt.get_receipt!/3
    end
  end
end
