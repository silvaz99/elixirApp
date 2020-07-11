defmodule HelpProj.DirectoryTest do
  use HelpProj.DataCase

  alias HelpProj.Directory

  describe "pedidos" do
    alias HelpProj.Directory.Pedido

    @valid_attrs %{descricao: "some descricao", nome: "some nome"}
    @update_attrs %{descricao: "some updated descricao", nome: "some updated nome"}
    @invalid_attrs %{descricao: nil, nome: nil}

    def pedido_fixture(attrs \\ %{}) do
      {:ok, pedido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_pedido()

      pedido
    end

    test "list_pedidos/0 returns all pedidos" do
      pedido = pedido_fixture()
      assert Directory.list_pedidos() == [pedido]
    end

    test "get_pedido!/1 returns the pedido with given id" do
      pedido = pedido_fixture()
      assert Directory.get_pedido!(pedido.id) == pedido
    end

    test "create_pedido/1 with valid data creates a pedido" do
      assert {:ok, %Pedido{} = pedido} = Directory.create_pedido(@valid_attrs)
      assert pedido.descricao == "some descricao"
      assert pedido.nome == "some nome"
    end

    test "create_pedido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_pedido(@invalid_attrs)
    end

    test "update_pedido/2 with valid data updates the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{} = pedido} = Directory.update_pedido(pedido, @update_attrs)
      assert pedido.descricao == "some updated descricao"
      assert pedido.nome == "some updated nome"
    end

    test "update_pedido/2 with invalid data returns error changeset" do
      pedido = pedido_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_pedido(pedido, @invalid_attrs)
      assert pedido == Directory.get_pedido!(pedido.id)
    end

    test "delete_pedido/1 deletes the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{}} = Directory.delete_pedido(pedido)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_pedido!(pedido.id) end
    end

    test "change_pedido/1 returns a pedido changeset" do
      pedido = pedido_fixture()
      assert %Ecto.Changeset{} = Directory.change_pedido(pedido)
    end
  end
end
