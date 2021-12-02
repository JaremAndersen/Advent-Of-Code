defmodule AdventOfCode.Day01 do
  def part1(args) do
    countIncreasing(args)
  end

  def countIncreasing(list, count) do
    [first | rest] = list
    [second | _tail] = rest

    cond do
      length(rest) == 1 -> count
      first < second -> countIncreasing(rest, count + 1)
      first > second -> countIncreasing(rest, count)
    end
  end

  def part2(args) do
    countIncreasing2(args)
  end

  def countIncreasing2(list, count) do
    [first | rest] = list
    [second | rest2] = rest
    [third | rest3] = rest2
    [fourth | _tail] = rest3

    cond do
      length(rest) == 3 -> count
      first + second + third < second + third + fourth -> countIncreasing2(rest, count + 1)
      first + second + third >= second + third + fourth -> countIncreasing2(rest, count)
    end
  end

  # holly cow chunk_every makes this so much easier

  def countIncreasing(list) do
    Enum.chunk_every(list, 2, 1, :discard) |> Enum.count(fn [x, y] -> y - x > 0 end)
  end

  def countIncreasing2(input) do
    Enum.chunk_every(input, 3, 1, :discard) |> Enum.map(&Enum.sum/1) |> part1()
  end
end
