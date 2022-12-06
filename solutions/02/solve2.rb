#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/2
# Run with: 'ruby solve2.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.readlines("input2.txt").map do |line|
  command, value = line.split " "
  [command.to_sym, value.to_i]
end

#  Note that (0,0) is the top left, and
#  that increasing x and y represents
#  moving right and down.

def part_1
  x = y = 0

  INPUTS.each do |command, value|
    case command
    when :forward
      x += value
    when :down
      y += value
    when :up
      y -= value
    end
  end

  x * y
end

def part_2
  x = y = aim = 0

  INPUTS.each do |command, value|
    case command
    when :forward
      x += value
      y += aim * value
    when :down
      aim += value
    when :up
      aim -= value
    end
  end

  x * y
end

p part_1
p part_2
