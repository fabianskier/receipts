defmodule ReceiptsWeb.Graphql.Schema do
  @moduledoc false

  use Absinthe.Schema

  import_types ReceiptsWeb.Graphql.Types.Receipt
  import_types ReceiptsWeb.Graphql.Operations.Queries.Receipt
  import_types ReceiptsWeb.Graphql.Operations.Mutations.Receipt


  query do
    import_fields :receipt_queries
  end

  mutation do
    import_fields :receipt_mutations
  end
end
