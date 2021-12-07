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

# returns the amount of fuel it takes to
# move all crabs to that point
def consider point
  # INPUTS.uniq.map{ (_1 - point).abs }.sum
  INPUTS.map{|input| (input - point).abs }.sum
end

final = INPUTS.map { |input|
  p [input, consider(input)]
}.min_by {|(_, total_fuel)| total_fuel }.last

p :final
p final


# p INPUTS
# p INPUTS.map{ _1 - 2 }
# p INPUTS.map{ (_1 - 2).abs }.sum

