defmodule AdventOfCode.Day03 do
  def part1(args) do
    sudoBinary =
      Enum.map(args, fn x -> String.codepoints(x) end)
      |> Enum.zip()
      |> Enum.map(fn x -> Tuple.to_list(x) end)
      |> Enum.map(fn x -> convertToInteger(x) end)
      |> Enum.map(fn x -> Enum.sum(x) end)

    gamma = toRegularBinary(sudoBinary)
    epsilon = toInvertedBinary(sudoBinary)

    IO.puts(epsilon)
    IO.puts(gamma)
    epsilon * gamma
  end

  def toRegularBinary(enum) do
    {gamma, _} =
      Enum.map(enum, fn x ->
        if x > 0 do
          1
        else
          0
        end
      end)
      |> Enum.join()
      |> Integer.parse(2)

    gamma
  end

  def toInvertedBinary(enum) do
    {epsilon, _} =
      Enum.map(enum, fn x ->
        if x > 0 do
          0
        else
          1
        end
      end)
      |> Enum.join()
      |> Integer.parse(2)

    epsilon
  end

  def convertToInteger(args) do
    Enum.map(args, fn x ->
      if String.to_integer(x) == 0 do
        -1
      else
        1
      end
    end)
  end

  def part2(args) do
    bits = String.length(Enum.at(args, 0))

    masterList =
      Enum.map(args, fn x -> String.codepoints(x) end)
      |> Enum.map(fn x -> convertToInteger(x) end)

    ox =
      filterList(masterList, 0, bits, :most)
      |> toRegularBinary()

    co =
      filterList(masterList, 0, bits, :least)
      |> toRegularBinary()

    IO.inspect(ox)
    IO.inspect(co)
    ox * co
  end

  def filterList(list, position, bits, searchType) do
    if position < bits && length(list) > 1 do
      zippedList =
        Enum.zip(list)
        |> Enum.map(fn x -> Tuple.to_list(x) end)

      filtered =
        Enum.filter(list, fn x ->
          Enum.at(x, position) == filterCriteria(Enum.at(zippedList, position), searchType)
        end)

      filterList(filtered, position + 1, bits, searchType)
    else
      hd(list)
    end
  end

  def filterCriteria(list, :most) do
    sum = Enum.sum(list)

    if sum >= 0 do
      1
    else
      -1
    end
  end

  def filterCriteria(list, :least) do
    sum = Enum.sum(list)

    if sum >= 0 do
      -1
    else
      1
    end
  end
end
