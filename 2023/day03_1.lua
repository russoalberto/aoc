local io = require 'io'
local input = './input/day03'

local function is_valid_number(adjacents, start, finish)
  for pos = 1, #adjacents do
    if adjacents[pos]:sub(start, finish):match("[^%d%.]") ~= nil then
      return true
    end
  end
  return false
end

local function get_line_total(line, adjacents)
  local line_total = 0
  for i, number, j in line:gmatch("()(%d+)()") do
    if is_valid_number(adjacents, (i > 1 and i - 1 or 1), (j < #line and j or #line)) then
      line_total = line_total + number
    end
  end
  return line_total
end


local function main()
  local lines = {}
  for line in io.lines(input) do
    lines[#lines + 1] = line
  end

  local total = 0
  for i = 1, #lines do
    local adjacents = {
      i > 1 and lines[i - 1] or '',
      lines[i],
      i < #lines and lines[i + 1] or ''
    }
    total = total + get_line_total(lines[i], adjacents)
  end

  print(total)
end

main()
