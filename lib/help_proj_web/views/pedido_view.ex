defmodule HelpProjWeb.PedidoView do
  use HelpProjWeb, :view
  alias HelpProjWeb.PedidoView

  def render("index.json", %{pedidos: pedidos}) do
    %{data: render_many(pedidos, PedidoView, "pedido.json")}
  end

  def render("show.json", %{pedido: pedido}) do
    %{data: render_one(pedido, PedidoView, "pedido.json")}
  end

  def render("pedido.json", %{pedido: pedido}) do
    %{id: pedido.id,
      nome: pedido.nome,
      descricao: pedido.descricao}
  end
end
