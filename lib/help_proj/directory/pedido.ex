defmodule HelpProj.Directory.Pedido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :descricao, :string
    field :nome, :naive_datetime


    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:nome, :descricao])
    |> validate_required([:nome, :descricao])
  end
end
