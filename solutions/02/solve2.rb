#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/2
# Run with: 'ruby solve2.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.readlines("input2.txt").map do |line|
  command, value = line.split " "
  [command.to_sym, value.to_i]
end

def part_1
  x = d = 0

  INPUTS.each do |command, value|
    case command
    when :forward 
      x += value
    when :down
      d += value
    when :up
      d -= value
    end
  end

  x * d
end

p part_1


def part_2
  x = d = aim = 0

  INPUTS.each do |command, value|
    case command
    when :forward 
      x += value
      d += aim * value
    when :down
      aim += value
    when :up
      aim -= value
    end
  end

  x * d
end

p part_2
