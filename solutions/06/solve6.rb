#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/6
# Run with: 'ruby solve6.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.read("input6.txt").chomp.split(",").map(&:to_i)

[80, 256].each do |days|
  count = INPUTS.reduce(Array.new(9 ,0)) do |acc, ele| 
	acc[ele] += 1
	acc 
  end

  days.times do
	# increase the number on the 7th day by the amount on the 1st day
	count[7] += count[0]
	# move the array along
	count.rotate!(1)
  end

  p count.sum
end
