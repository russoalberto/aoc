local math = require 'math'
local io = require 'io'
local input = '../input/day01'
local validDigits = {
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "%d+"
}

local function findFirst(line)
  local index = math.huge
  local value = ""
  for i = 1, #validDigits do
    local current, _ = string.find(line, validDigits[i])
    if (current and index > current) then
      index = current
      value = i > 9 and string.sub(line, current, current) or tostring(i)
    end
  end

  return value
end

local function findLast(line)
  local reverse = line:reverse()
  local index = math.huge
  local value = ""
  for i = 1, #validDigits do
    local pattern = i > 9 and validDigits[i] or validDigits[i]:reverse()
    local current, _ = string.find(reverse, pattern)
    if (current and index > current) then
      index = current
      value = i > 9 and string.sub(reverse, current, current) or tostring(i)
    end
  end

  return value
end

local function main()
  local total = 0
  for line in io.lines(input) do
    total = total + tonumber(findFirst(line) .. findLast(line))
  end
  return total
end

print(main())
