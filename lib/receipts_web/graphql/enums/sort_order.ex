defmodule ReceiptsWeb.Graphql.Enums.SortOrder do
  @moduledoc false

  use Absinthe.Schema.Notation

  @desc "Sort order"
  enum :sort_order do
    value :asc, description: "Ascending order"
    value :desc, description: "Descending order"
  end
end
