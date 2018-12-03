defmodule MuElixirCache do

  use Application

  def start(_type, _args) do
    IO.puts "Starting application"
    # List all child processes to be supervised
    children = [
      {UsePlugProxy.Cache,%{}},
      {Plug.Cowboy, scheme: :http, plug: UsePlugProxy, options: [port: 80]}
     ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end

end
