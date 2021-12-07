#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/7
# Run with: 'ruby solve7.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input7.txt"
# FILE_NAME = "test.txt"
INPUTS = File.read(FILE_NAME).scan(/\d+/).map(&:to_i)

# O(n^2)
def part_1
  # returns the amount of fuel it takes to
  # move all crabs to that point
  def consider point
    INPUTS.map{ |input| (input - point).abs }.sum
  end

  INPUTS.map { |input|
    consider(input)
  }.min
end

# O(n^2)
def part_2
  # returns the amount of fuel it takes to
  # move all crabs to that point
  def consider point
    INPUTS.map { |input|
      n = (input - point).abs 
      (n*(n + 1)) / 2
    }.sum
  end

  (INPUTS.min..INPUTS.max).map { |input|
    consider(input)
  }.min
end

p part_1
p part_2