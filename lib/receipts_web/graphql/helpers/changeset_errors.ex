defmodule ReceiptsWeb.Graphql.Helpers.ChangesetErrors do
  @moduledoc """
  Provides `error_details/1` helper function for working with changeset errors.
  """

  @doc """
  Returns the changeset errors as a list of strings.

  ## Parameters

    - changeset: The changeset to get the errors from.

  ## Examples

      iex> changeset = %Ecto.Changeset{errors: [name: {"can't be blank", []}]}
      iex> HqconversionsV2Web.Graphql.Helpers.ChangesetErrors.to_list(changeset)
      ["name can't be blank"]
  """
  def error_details(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
