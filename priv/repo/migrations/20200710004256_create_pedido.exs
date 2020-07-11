defmodule HelpProj.Repo.Migrations.CreatePedido do
  use Ecto.Migration

  def change do
    create table(:pedidosss) do
      add :descricao, :string
      add :nome, :date

      timestamps()
    end
  end
end
