defmodule HelpProj.Repo.Migrations.DropTable do
  use Ecto.Migration

  def change do
    drop table(:pedidos)
  end
end
