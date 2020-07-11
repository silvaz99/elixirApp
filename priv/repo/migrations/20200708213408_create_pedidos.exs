defmodule HelpProj.Repo.Migrations.CreatePedidos do
  use Ecto.Migration

  def change do
    create table(:pedidos) do
      add :nome, :utc_datetime
      add :descricao, :string

      timestamps()
    end


  end
end
