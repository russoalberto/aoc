local io = require 'io'
local input = '../input/day04'

local function split_numbers(line)
  local numbers = {}
  for str in string.gmatch(line, "([^%:%s%|]+)") do
    table.insert(numbers, str)
  end

  return numbers
end

local function contains(tab, val)
  for _, v in pairs(tab) do
    if v == val then
      return true
    end
  end
  return false
end

local function get_points(win_numbers, numbers)
  local points = 0
  for _, n in pairs(numbers) do
    if contains(win_numbers, n) then
      points = points + (points > 1 and points or 1)
    end
  end
  return points
end

local function main()
  local total = 0
  for line in io.lines(input) do
    local numbers = split_numbers(line)
    total = total + get_points({ table.unpack(numbers, 3, 12) }, { table.unpack(numbers, 13) })
  end
  print(total)
end

main()
