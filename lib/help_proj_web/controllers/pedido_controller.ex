defmodule HelpProjWeb.PedidoController do
  use HelpProjWeb, :controller

  alias HelpProj.Directory
  alias HelpProj.Directory.Pedido

  action_fallback HelpProjWeb.FallbackController

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    pedidos = Directory.list_pedidos()
    render(conn, "index.json", pedidos: pedidos, token: get_csrf_token())
  end

  @spec create(any, map) :: any
  def create(conn, %{"pedido" => pedido_params}) do
    with {:ok, %Pedido{} = pedido} <- Directory.create_pedido(pedido_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pedido_path(conn, :show, pedido))
      |> render("show.json", pedido: pedido)
    end
  end

  def show(conn, %{"id" => id}) do
    pedido = Directory.get_pedido!(id)
    render(conn, "show.json", pedido: pedido)
  end

  def update(conn, %{"id" => id, "pedido" => pedido_params}) do
    pedido = Directory.get_pedido!(id)

    with {:ok, %Pedido{} = pedido} <- Directory.update_pedido(pedido, pedido_params) do
      render(conn, "show.json", pedido: pedido)
    end
  end

  def delete(conn, %{"id" => id}) do
    pedido = Directory.get_pedido!(id)

    with {:ok, %Pedido{}} <- Directory.delete_pedido(pedido) do
      send_resp(conn, :no_content, "")
    end
  end
end
