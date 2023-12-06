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

local function get_copies(win_numbers, numbers)
  local copies = 0
  for _, n in pairs(numbers) do
    if contains(win_numbers, n) then
      copies = copies + 1
    end
  end
  return copies
end

local function main()
  local scratch_cards = {}
  local current_card = 1
  for line in io.lines(input) do
    scratch_cards[current_card] = (scratch_cards[current_card] or 0) + 1
    local numbers = split_numbers(line)
    local copies = get_copies({ table.unpack(numbers, 3, 12) }, { table.unpack(numbers, 13) })
    for i = 1, copies do
      scratch_cards[current_card + i] =
         (scratch_cards[current_card + i] or 0) + scratch_cards[current_card]
    end
    current_card = current_card + 1
  end
  local total = 0
  for _, n in pairs(scratch_cards) do
    total = total + n
  end
  print(total)
end

main()
