#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/7
# Run with: 'ruby solve7.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.read("input7.txt").scan(/\d+/).map(&:to_i)
RANGE = (INPUTS.min..INPUTS.max)

def part_1
  # returns the amount of fuel it takes to
  # move all crabs to that point
  def consider point
    INPUTS.map{ |input|
      (input - point).abs
    }.sum
  end

  RANGE
    .map { |input| consider(input) }
    .min
end

def part_2
  # returns the amount of fuel it takes to
  # move all crabs to that point
  def consider point
    INPUTS.map { |input|
      n = (input - point).abs
      (n*(n + 1)) / 2
    }.sum
  end

  RANGE
    .map { |input| consider(input) }
    .min
end

p part_1
p part_2

