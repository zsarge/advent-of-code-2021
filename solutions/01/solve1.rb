#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/1
# Run with: 'ruby solve1.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.readlines("input1.txt").map(&:to_i)

def count_increasing arr
  arr.each_cons(2).count{ _2 > _1 }
end

# part 1
p count_increasing INPUTS

# part 2
p count_increasing INPUTS.each_cons(3).map(&:sum)

