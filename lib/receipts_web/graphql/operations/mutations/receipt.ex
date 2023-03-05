defmodule ReceiptsWeb.Graphql.Operations.Mutations.Receipt do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias ReceiptsWeb.Graphql.Resolvers.Receipt

  @desc "Receipts mutation operations"
  object :receipt_mutations do
    @desc "Create a new receipt and return it"
    field :create_receipt, :receipt do
      @desc " Fields to crate a receipt with"
      arg :input, non_null(:receipt_input)
      resolve &Receipt.create_receipt/3
    end

    @desc "Update an existing receipt and return it"
    field :update_receipt, :receipt do
      @desc "The id of the receipt to update"
      arg :id, non_null(:id)
      @desc "Fields to update a receipt with"
      arg :input, non_null(:receipt_input)
      resolve &Receipt.update_receipt/3
    end

    @desc "Delete an existing receipt and return it"
    field :delete_receipt, :receipt do
      @desc "The id of the receipt to delete"
      arg :id, non_null(:id)
      resolve &Receipt.delete_receipt/3
    end
  end
end
