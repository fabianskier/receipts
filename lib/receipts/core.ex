defmodule Receipts.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias Receipts.Repo

  alias Receipts.Core.Constant

  @doc """
  Returns the list of constants.

  ## Examples

      iex> list_constants()
      [%Constant{}, ...]

  """
  def list_constants do
    Repo.all(Constant)
  end

  @doc """
  Gets a single constant.

  Raises `Ecto.NoResultsError` if the Constant does not exist.

  ## Examples

      iex> get_constant!(123)
      %Constant{}

      iex> get_constant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_constant!(id), do: Repo.get!(Constant, id)

  @doc """
  Creates a constant.

  ## Examples

      iex> create_constant(%{field: value})
      {:ok, %Constant{}}

      iex> create_constant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_constant(attrs \\ %{}) do
    %Constant{}
    |> Constant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a constant.

  ## Examples

      iex> update_constant(constant, %{field: new_value})
      {:ok, %Constant{}}

      iex> update_constant(constant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_constant(%Constant{} = constant, attrs) do
    constant
    |> Constant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a constant.

  ## Examples

      iex> delete_constant(constant)
      {:ok, %Constant{}}

      iex> delete_constant(constant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_constant(%Constant{} = constant) do
    Repo.delete(constant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking constant changes.

  ## Examples

      iex> change_constant(constant)
      %Ecto.Changeset{data: %Constant{}}

  """
  def change_constant(%Constant{} = constant, attrs \\ %{}) do
    Constant.changeset(constant, attrs)
  end

  alias Receipts.Core.Receipt

  @doc """
  Returns the list of receipts.

  ## Examples

      iex> list_receipts()
      [%Receipt{}, ...]

  """
  def list_receipts do
    Repo.all(Receipt)
  end

  @doc """
    Returns the list of receipts matching the given `criteria`.

  ## Parameters

    - criteria: The criteria to match the clients with.

  ## Examples

      iex> list_receipts([{:limit, 10}, {:offset, 20}, {:order, :asc}])
      [%Receipt{}, ...]

  """
  def list_receipts(criteria) do
    query = from(p in Receipt)

    Enum.reduce(criteria, query, fn
      {:limit, limit}, query ->
        from(p in query, limit: ^limit)

      {:offset, offset}, query ->
        from(p in query, offset: ^offset)

      {:order, order}, query ->
        from(p in query, order_by: [{^order, :id}])
    end)
    |> Repo.all()
  end

  @doc """
  Gets a single receipt.

  Raises `Ecto.NoResultsError` if the Receipt does not exist.

  ## Examples

      iex> get_receipt!(123)
      %Receipt{}

      iex> get_receipt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receipt!(id), do: Repo.get!(Receipt, id)

  @doc """
  Creates a receipt.

  ## Examples

      iex> create_receipt(%{field: value})
      {:ok, %Receipt{}}

      iex> create_receipt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receipt(attrs \\ %{}) do
    %Receipt{}
    |> Receipt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receipt.

  ## Examples

      iex> update_receipt(receipt, %{field: new_value})
      {:ok, %Receipt{}}

      iex> update_receipt(receipt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receipt(%Receipt{} = receipt, attrs) do
    receipt
    |> Receipt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receipt.

  ## Examples

      iex> delete_receipt(receipt)
      {:ok, %Receipt{}}

      iex> delete_receipt(receipt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receipt(%Receipt{} = receipt) do
    Repo.delete(receipt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receipt changes.

  ## Examples

      iex> change_receipt(receipt)
      %Ecto.Changeset{data: %Receipt{}}

  """
  def change_receipt(%Receipt{} = receipt, attrs \\ %{}) do
    Receipt.changeset(receipt, attrs)
  end
end
