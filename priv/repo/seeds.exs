# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HelpProj.Repo.insert!(%HelpProj.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias HelpProj.Repo
alias HelpProj.Directory.Pedido

Repo.insert! %Pedido{nome: "2019-01-13T23:50:07.123Z"
                            |> NaiveDateTime.from_iso8601!()
                            |> NaiveDateTime.truncate(:second) , descricao: "Limpa e chora"}
