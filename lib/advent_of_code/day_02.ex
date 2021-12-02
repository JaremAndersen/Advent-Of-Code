defmodule AdventOfCode.Day02 do
  def part1(args) do
    {x, y} = Enum.reduce(args, {0, 0}, fn val, acc -> move(val, acc) end) |> IO.inspect()
    x * y
  end

  def move("forward " <> quantity, {x, y}), do: {x + String.to_integer(quantity), y}
  def move("down " <> quantity, {x, y}), do: {x, y + String.to_integer(quantity)}
  def move("up " <> quantity, {x, y}), do: {x, y - String.to_integer(quantity)}

  def part2(args) do
    {x, y, _a} = Enum.reduce(args, {0, 0, 0}, fn val, acc -> move2(val, acc) end) |> IO.inspect()
    x * y
  end

  def move2("forward " <> quantity, {x, y, a}),
    do: {x + String.to_integer(quantity), y + String.to_integer(quantity) * a, a}

  def move2("down " <> quantity, {x, y, a}), do: {x, y, a + String.to_integer(quantity)}
  def move2("up " <> quantity, {x, y, a}), do: {x, y, a - String.to_integer(quantity)}
end
