defmodule Receipts.Repo.Migrations.CreateReceipts do
  use Ecto.Migration

  def change do
    create table(:receipts) do
      add :condicion, :text
      add :fecha_emision, :date
      add :impuesto, {:array, :text}
      add :monto_exento, :float
      add :monto_gravado_10, :float
      add :monto_gravado_5, :float
      add :monto_total, :float
      add :numero_comprobante, :text
      add :numero_identificacion, :text
      add :razon_social, :text
      add :timbrado, :integer
      add :tipo_comprobante, :text
      add :tipo_identificacion, :text

      timestamps()
    end
  end
end
