defmodule Output do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, :ok, name: {:global, __MODULE__})
  end

  def init(:ok) do
    {:ok, nil}
  end

  def handle_info({:message, message}, _) do
    IO.puts("\rOutput: #{message}")
    {:noreply, nil}
  end

  def write(message) do
    pid = :global.whereis_name(__MODULE__)
    send(pid, {:message, message})
  end
end
