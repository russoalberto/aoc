local input = '../input/day01'

local function findFirst(line)
  for i = 1, #line do
    if string.find(string.sub(line, i, i), "%d+") then
      return line:sub(i, i)
    end
  end
end

local function findLast(line)
  for i = #line, 1, -1 do
    if string.find(string.sub(line, i, i), "%d+") then
      return line:sub(i, i)
    end
  end
end

local function main()
  local total = 0
  for line in io.lines(input) do
    total = total + tonumber(findFirst(line) .. findLast(line))
  end
  return total
end

print(main())
