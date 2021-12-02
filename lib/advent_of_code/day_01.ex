defmodule AdventOfCode.Day01 do
  def part1(args) do
    countIncreasing(args, 1)
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
    countIncreasing2(args, 1)
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
end
