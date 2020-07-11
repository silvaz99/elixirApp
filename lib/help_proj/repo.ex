defmodule HelpProj.Repo do
  use Ecto.Repo,
    otp_app: :help_proj,
    adapter: Ecto.Adapters.Postgres
end
