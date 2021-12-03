#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/3
# Run with: 'ruby solve3.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input3.txt"
# FILE_NAME = "test.txt"

INPUTS = File.readlines(FILE_NAME).map(&:chomp).map { _1.chars.map &:to_i }

def reduce_to_bits array, bit_criteria
  # rotate the array so the columns become rows
  array.transpose.map(&:reverse).map do |arr|
    # find the most common value according to the bit criteria
    ones = arr.count { _1 == 1 }
    zeros = arr.size - ones
    ones.public_send(bit_criteria, zeros) ? 1 : 0
  end
end

# reduce all the numbers in the of an array to a single value
# based off of the comparison rules
def find_rating arr, bit_criteria
  (0...arr[0].size).each do |index|
    selected = reduce_to_bits(arr, bit_criteria)

    arr = arr.filter {|arr| arr[index] == selected[index]}

    if arr.size == 1
      return arr
    end
  end
end

def part_1
  gamma = reduce_to_bits(INPUTS, :>=).join.to_i(2)
  epsilon = reduce_to_bits(INPUTS, :<).join.to_i(2)
  
  gamma * epsilon
end

def part_2
  oxygen_rating = find_rating(INPUTS, :>=).join.to_i(2)
  co2_rating = find_rating(INPUTS, :<).join.to_i(2)

  oxygen_rating * co2_rating
end

p part_1
p part_2
