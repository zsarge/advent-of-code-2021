#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/7
# Run with: 'ruby solve7.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input7.txt"
# FILE_NAME = "test.txt"
INPUTS = File.read(FILE_NAME).scan(/\d+/).map(&:to_i)

# def get_cheapest_pos positions
# end

def part_1
  # returns the amount of fuel it takes to
  # move all crabs to that point
  def consider point
    INPUTS.map{ |input| (input - point).abs }.sum
  end

  final = INPUTS.map { |input|
    [input, consider(input)]
  }.min_by{ |(_, total_fuel)| total_fuel }.last
end

# p part_1

# returns the amount of fuel it takes to
# move all crabs to that point
# O(n)
def consider point
  res = INPUTS.map { |input|
    n = (input - point).abs 
    (n*(n + 1)) / 2
  }
  # p res
  res.sum
end

p consider 5

# p INPUTS.sort_desc

final = (INPUTS.min..INPUTS.max).map { |input|
  [input, consider(input)]
}.min_by {|(_, total_fuel)| total_fuel }

p final
p :final
p final.last

# p INPUTS
# p INPUTS.map{ _1 - 2 }
# p INPUTS.map{ (_1 - 2).abs }.sum

# p INPUTS.map{ (_1 - 2).abs }


