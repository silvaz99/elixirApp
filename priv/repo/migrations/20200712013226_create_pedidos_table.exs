defmodule HelpProj.Repo.Migrations.CreatePedidosTable do
  use Ecto.Migration

  def change do
    create table(:pedidos) do
      add :cpf, :string
      add :data, :date
      add :duracao, :time

      timestamps()
    end
  end
end
