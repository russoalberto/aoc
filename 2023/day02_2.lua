local io = require 'io'
local input = './input/day02'

local function split_cube(cube)
  local result = {}
  for i in string.gmatch(cube, "%S+") do
    result[#result + 1] = i
  end

  return result
end

local function get_min(cube, min)
  for i = 1, #min do
    if min[i][2] == cube[2] and min[i][1] < tonumber(cube[1]) then
      min[i] = { tonumber(cube[1]), cube[2] }
    end
  end

  return min
end

local function gameNumber(line)
  local min = { { 0, "red" }, { 0, "blue" }, { 0, "green" } }
  for match in line:gmatch("(%d+ %l+)") do
    local cube = split_cube(match)
    min = get_min(cube, min)
  end

  return min[1][1] * min[2][1] * min[3][1]
end


local function main()
  local total = 0
  for line in io.lines(input) do
    total = total + gameNumber(line)
  end
  return total
end

print(main())
