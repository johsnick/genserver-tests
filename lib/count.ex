defmodule Count do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    send(self(), {:increment})

    {:ok, 0}
  end

  def handle_info({:increment}, state) do
    IO.puts("\rCount: #{state}")

    Process.send_after(self(), {:increment}, 1000)
    {:noreply, state + 1}
  end
end
