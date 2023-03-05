defmodule Receipts.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Receipts.Core` context.
  """

  @doc """
  Generate a constant.
  """
  def constant_fixture(attrs \\ %{}) do
    {:ok, constant} =
      attrs
      |> Enum.into(%{
        key: "some key",
        value: "some value"
      })
      |> Receipts.Core.create_constant()

    constant
  end

  @doc """
  Generate a receipt.
  """
  def receipt_fixture(attrs \\ %{}) do
    {:ok, receipt} =
      attrs
      |> Enum.into(%{
        fecha_emision: ~D[2023-03-04],
        monto_exento: 120.5,
        monto_gravado_10: 120.5,
        monto_total: 120.5,
        numero_comprobante: "some numero_comprobante",
        numero_identificacion: "some numero_identificacion",
        razon_social: "some razon_social",
        timbrado: 42
      })
      |> Receipts.Core.create_receipt()

    receipt
  end
end
