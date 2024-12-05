package main

import "core:fmt"
import "core:os"
import "core:slice"
import "core:strconv"
import "core:strings"
import "core:text/regex"


main :: proc() {
	lines := read_file("../input/day01")
	group1, group2 := sort_groups(lines)

	fmt.println(partOne(group1, group2))
	fmt.println(partTwo(group1, group2))
}

read_file :: proc(filepath: string) -> []string {
	data, ok := os.read_entire_file(filepath, context.allocator)

	if !ok {
		return nil
	}

	it := string(data)
	return strings.split_lines(it)
}

sort_groups :: proc(lines: []string) -> ([]int, []int) {
	reg, err := regex.create(`^([0-9]{5})[\s]+([0-9]{5})$`)
	group1, group2: [dynamic]int

	for line in lines {
		capture, success := regex.match(reg, line)
		if success {
			num1, _ := strconv.parse_int(capture.groups[1])
			num2, _ := strconv.parse_int(capture.groups[2])
			append(&group1, num1)
			append(&group2, num2)
		}
	}

	slice.sort(group1[:])
	slice.sort(group2[:])

	return group1[:], group2[:]
}

partOne :: proc(group1: []int, group2: []int) -> int {
	sum := 0
	for i in 0 ..< len(group1) {
		sum += abs(group1[i] - group2[i])
	}
	return sum
}

partTwo :: proc(group1: []int, group2: []int) -> int {
	sum := 0
	for i in 0 ..< len(group1) {
		num := 0
		for j in 0 ..< len(group2) {
			if group1[i] > group2[j] {
				continue
			} else if group1[i] == group2[j] {
				num += 1
			} else {
				sum += group1[i] * num
			}
		}
	}
	return sum
}
