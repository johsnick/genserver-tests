defmodule Chat do
  use Application

  def start(_type, _args) do
    topologies = [
      chat: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]

    children = [
      # List your supervision trees and workers here
      { Cluster.Supervisor, [topologies, [name: Chat.ClusterSupervisor]] },
      { Input, [] },
      { Output, [] },
      # { Count, [] }
    ]

    opts = [strategy: :one_for_one, name: MyApp.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
