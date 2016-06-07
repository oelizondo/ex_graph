defmodule Graph do
  def leaf(name) do
    receive do
      msg -> IO.puts "#{msg}"
    end
  end

  def node(name) do
    spawn_link(__MODULE__, :leaf, ["leaf 1"])
    spawn_link(__MODULE__, :leaf, ["leaf 2"])
    spawn_link(__MODULE__, :leaf, ["leaf 3"])
    receive do
      msg -> IO.puts "#{name} received: #{msg}"
    end
  end

  def main(name) do
    spawn_link(__MODULE__, :node, ["node 1"])
    spawn_link(__MODULE__, :node, ["node 2"])
    receive do
      msg -> IO.puts "Main received: #{msg}"
    end
  end

  def start do
    spawn_link(__MODULE__, :main, ["main process"])
  end
end