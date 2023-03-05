defmodule Receipts.CoreTest do
  use Receipts.DataCase

  alias Receipts.Core

  describe "constants" do
    alias Receipts.Core.Constant

    import Receipts.CoreFixtures

    @invalid_attrs %{key: nil, value: nil}

    test "list_constants/0 returns all constants" do
      constant = constant_fixture()
      assert Core.list_constants() == [constant]
    end

    test "get_constant!/1 returns the constant with given id" do
      constant = constant_fixture()
      assert Core.get_constant!(constant.id) == constant
    end

    test "create_constant/1 with valid data creates a constant" do
      valid_attrs = %{key: "some key", value: "some value"}

      assert {:ok, %Constant{} = constant} = Core.create_constant(valid_attrs)
      assert constant.key == "some key"
      assert constant.value == "some value"
    end

    test "create_constant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_constant(@invalid_attrs)
    end

    test "update_constant/2 with valid data updates the constant" do
      constant = constant_fixture()
      update_attrs = %{key: "some updated key", value: "some updated value"}

      assert {:ok, %Constant{} = constant} = Core.update_constant(constant, update_attrs)
      assert constant.key == "some updated key"
      assert constant.value == "some updated value"
    end

    test "update_constant/2 with invalid data returns error changeset" do
      constant = constant_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_constant(constant, @invalid_attrs)
      assert constant == Core.get_constant!(constant.id)
    end

    test "delete_constant/1 deletes the constant" do
      constant = constant_fixture()
      assert {:ok, %Constant{}} = Core.delete_constant(constant)
      assert_raise Ecto.NoResultsError, fn -> Core.get_constant!(constant.id) end
    end

    test "change_constant/1 returns a constant changeset" do
      constant = constant_fixture()
      assert %Ecto.Changeset{} = Core.change_constant(constant)
    end
  end

  describe "receipts" do
    alias Receipts.Core.Receipt

    import Receipts.CoreFixtures

    @invalid_attrs %{fecha_emision: nil, monto_exento: nil, monto_gravado_10: nil, monto_total: nil, numero_comprobante: nil, numero_identificacion: nil, razon_social: nil, timbrado: nil}

    test "list_receipts/0 returns all receipts" do
      receipt = receipt_fixture()
      assert Core.list_receipts() == [receipt]
    end

    test "get_receipt!/1 returns the receipt with given id" do
      receipt = receipt_fixture()
      assert Core.get_receipt!(receipt.id) == receipt
    end

    test "create_receipt/1 with valid data creates a receipt" do
      valid_attrs = %{fecha_emision: ~D[2023-03-04], monto_exento: 120.5, monto_gravado_10: 120.5, monto_total: 120.5, numero_comprobante: "some numero_comprobante", numero_identificacion: "some numero_identificacion", razon_social: "some razon_social", timbrado: 42}

      assert {:ok, %Receipt{} = receipt} = Core.create_receipt(valid_attrs)
      assert receipt.fecha_emision == ~D[2023-03-04]
      assert receipt.monto_exento == 120.5
      assert receipt.monto_gravado_10 == 120.5
      assert receipt.monto_total == 120.5
      assert receipt.numero_comprobante == "some numero_comprobante"
      assert receipt.numero_identificacion == "some numero_identificacion"
      assert receipt.razon_social == "some razon_social"
      assert receipt.timbrado == 42
    end

    test "create_receipt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_receipt(@invalid_attrs)
    end

    test "update_receipt/2 with valid data updates the receipt" do
      receipt = receipt_fixture()
      update_attrs = %{fecha_emision: ~D[2023-03-05], monto_exento: 456.7, monto_gravado_10: 456.7, monto_total: 456.7, numero_comprobante: "some updated numero_comprobante", numero_identificacion: "some updated numero_identificacion", razon_social: "some updated razon_social", timbrado: 43}

      assert {:ok, %Receipt{} = receipt} = Core.update_receipt(receipt, update_attrs)
      assert receipt.fecha_emision == ~D[2023-03-05]
      assert receipt.monto_exento == 456.7
      assert receipt.monto_gravado_10 == 456.7
      assert receipt.monto_total == 456.7
      assert receipt.numero_comprobante == "some updated numero_comprobante"
      assert receipt.numero_identificacion == "some updated numero_identificacion"
      assert receipt.razon_social == "some updated razon_social"
      assert receipt.timbrado == 43
    end

    test "update_receipt/2 with invalid data returns error changeset" do
      receipt = receipt_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_receipt(receipt, @invalid_attrs)
      assert receipt == Core.get_receipt!(receipt.id)
    end

    test "delete_receipt/1 deletes the receipt" do
      receipt = receipt_fixture()
      assert {:ok, %Receipt{}} = Core.delete_receipt(receipt)
      assert_raise Ecto.NoResultsError, fn -> Core.get_receipt!(receipt.id) end
    end

    test "change_receipt/1 returns a receipt changeset" do
      receipt = receipt_fixture()
      assert %Ecto.Changeset{} = Core.change_receipt(receipt)
    end
  end
end
