defmodule HelpProj.Directory.Pedido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pedidos" do
    field :cpf, :string
    field :data, :date
    field :duracao, :time


    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:cpf, :duracao, :data])
    |> validate_required([:cpf, :duracao, :data])
  end
end
