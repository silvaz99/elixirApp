defmodule HelpProjWeb.PedidoControllerTest do
  use HelpProjWeb.ConnCase

  alias HelpProj.Directory
  alias HelpProj.Directory.Pedido

  @create_attrs %{
    descricao: "some descricao",
    nome: "some nome"
  }
  @update_attrs %{
    descricao: "some updated descricao",
    nome: "some updated nome"
  }
  @invalid_attrs %{descricao: nil, nome: nil}

  def fixture(:pedido) do
    {:ok, pedido} = Directory.create_pedido(@create_attrs)
    pedido
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pedidos", %{conn: conn} do
      conn = get(conn, Routes.pedido_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pedido" do
    test "renders pedido when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pedido_path(conn, :create), pedido: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pedido_path(conn, :show, id))

      assert %{
               "id" => id,
               "descricao" => "some descricao",
               "nome" => "some nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pedido_path(conn, :create), pedido: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pedido" do
    setup [:create_pedido]

    test "renders pedido when data is valid", %{conn: conn, pedido: %Pedido{id: id} = pedido} do
      conn = put(conn, Routes.pedido_path(conn, :update, pedido), pedido: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pedido_path(conn, :show, id))

      assert %{
               "id" => id,
               "descricao" => "some updated descricao",
               "nome" => "some updated nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pedido: pedido} do
      conn = put(conn, Routes.pedido_path(conn, :update, pedido), pedido: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pedido" do
    setup [:create_pedido]

    test "deletes chosen pedido", %{conn: conn, pedido: pedido} do
      conn = delete(conn, Routes.pedido_path(conn, :delete, pedido))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pedido_path(conn, :show, pedido))
      end
    end
  end

  defp create_pedido(_) do
    pedido = fixture(:pedido)
    %{pedido: pedido}
  end
end
