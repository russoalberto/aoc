local io = require 'io'
local input = '../input/day02'

local max_cubes = {
  { 12, "red" },
  { 13, "green" },
  { 14, "blue" },
}

local function split_cube(cube)
  local result = {}
  for i in cube:gmatch("%S+") do
    result[#result + 1] = i
  end

  return result
end

local function is_valid(cube)
  for i = 1, #max_cubes do
    if (max_cubes[i][2] == cube[2] and max_cubes[i][1] < tonumber(cube[1])) then
      return false
    end
  end
  return true
end


local function game_number(line)
  local num = line:match("(%d+):.+")
  for match in line:gmatch("(%d+ %l+)") do
    local cube = split_cube(match)
    if (not (is_valid(cube))) then
      return 0;
    end
  end
  return tonumber(num)
end


local function main()
  local total = 0
  for line in io.lines(input) do
    total = total + game_number(line)
  end
  return total
end

print(main())
