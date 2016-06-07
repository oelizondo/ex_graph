## Graphs in elixir.

This is a simple (hard-coded) example of what a graph would look like in elixir.
Contrary to Languages like C or C++, where the use of pointers is useful; or OO languages 
like Ruby, Elixir uses processes to manage data and state of nodes. In this example
nodes and leaves contain nothing, but essentialy, they should contain data.

### How to

```elixir
# returns the pid of spawning a process that has a chain reaction.

# main -> node -> leaf (the start functions spawns the main process and the main process spawns two nodes. Each node spawns 3 leaves.).

main_pid = Graph.start

# To kill the graph (Processes are bidirectional and if you kill the parent, children die (didn't find a nicer way.)).

Process.exit(main_pid, :kill)

# Iex is restarted.
```