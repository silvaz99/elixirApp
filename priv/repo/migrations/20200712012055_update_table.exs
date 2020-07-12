defmodule HelpProj.Repo.Migrations.UpdateTable do
  use Ecto.Migration

  def change do
    alter table(:pedidos) do
      modify :nome, :date
    end
  end
end
