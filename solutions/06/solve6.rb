#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/6
# Run with: 'ruby solve6.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.read("input6.txt").chomp.split(",").map(&:to_i)

# This is basically:
# https://github.com/damyvv/advent-of-code-2021/blob/master/solutions/day06.rb
# In my opinion, this is a really good solution,
# in that operates in constant space complexity.

[80, 256].each do |days|
  cycle = Array.new(9,0)
  input.each {|i| count[i] += 1 }

  days.times do
    # increase the number on the 7th day by the amount on the 0th day
    cycle[7] += cycle[0]
    # move the array along
    cycle.rotate!(1)
  end

  p cycle.sum
end

