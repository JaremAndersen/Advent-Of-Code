defmodule Mix.Tasks.D01.P2 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 2"
  def run(args) do
    input = nil

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> part2 end}),
      else: part2 |> IO.inspect(label: "Part 2 Results")
  end
end
