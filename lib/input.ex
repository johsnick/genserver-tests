defmodule Input do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok, nil, {:continue, :get_message}}
  end

  # get io input and print it
  def handle_continue(:get_message, _) do
    input = IO.gets("Input: ")

    Output.write(input)
    {:noreply, nil, {:continue, :get_message}}
  end
end
