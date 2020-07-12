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

Repo.insert! %Pedido{cpf: "123ZABC", data: %Date{day: 1,month: 1,year: 2020 }, duracao:  %Time{hour: 20, minute: 30, second: 00} }
