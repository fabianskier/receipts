defmodule ReceiptsWeb.Graphql.Resolvers.Receipt do
  @moduledoc false

  alias Receipts.Core
  alias ReceiptsWeb.Graphql.Helpers.ChangesetErrors

  def list_receipts(_parent, args, _resolution) do
    case Core.list_receipts(args) do
      [] ->
        {:error, %{message: "No receipts found", details: %{error: "No receipts found"}}}
      receipts ->
        {:ok, receipts}
    end
  end

  def get_receipt!(_parent, args, _resolution) do
    try do
      {:ok, Core.get_receipt!(args.id)}
    rescue
      Ecto.NoResultsError ->
        {:error, %{message: "Receipt not found", details: %{id: args.id}}}
    end
  end

  def create_receipt(_parent, args, _resolution) do
    case Core.create_receipt(args.input) do
      {:ok, receipt} ->
        {:ok, receipt}
      {:error, changeset} ->
        {:error, %{message: "Could not create receipt", details: ChangesetErrors.error_details(changeset)}}
    end
  end

  def update_receipt(_parent, args, _resolution) do
    try do
      receipt = Core.get_receipt!(args.id)
      case Core.update_receipt(receipt, args.input) do
        {:ok, receipt} ->
          {:ok, receipt}
        {:error, changeset} ->
          {:error, %{message: "Could not update receipt", details: ChangesetErrors.error_details(changeset)}}
      end
    rescue
      Ecto.NoResultsError ->
        {:error, %{message: "Receipt not found", details: %{id: args.id}}}
    end
  end

  def delete_receipt(_parent, args, _resolution) do
    try do
      receipt = Core.get_receipt!(args.id)
      case Core.delete_receipt(receipt) do
        {:ok, receipt} ->
          {:ok, receipt}
        {:error, changeset} ->
          {:error, %{message: "Could not delete receipt", details: ChangesetErrors.error_details(changeset)}}
      end
    rescue
      Ecto.NoResultsError ->
        {:error, %{message: "Receipt not found", details: %{id: args.id}}}
    end
  end
end
