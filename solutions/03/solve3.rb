#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/3
# Run with: 'ruby solve3.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input3.txt"
# FILE_NAME = "test.txt"

INPUTS = File.readlines(FILE_NAME).map(&:chomp).map { _1.chars.map &:to_i }

def part_1
  gamma = INPUTS.transpose.map(&:reverse).map {|arr| arr.max_by {|i| arr.count(i)}}.join.to_i 2
  epsilon = INPUTS.transpose.map(&:reverse).map {|arr| arr.min_by {|i| arr.count(i)}}.join.to_i 2
  
  gamma * epsilon
end

# CLEAN ME UP

def part_2
  # return an array of the most/least common bits
  def reduce_to_bits array, func
    array.transpose.map(&:reverse).map do |arr|
      ones = arr.count { _1 == 1 }
      zeros = arr.size - ones
      ones.public_send(func, zeros) ? 1 : 0
    end
  end

  # reduce all the numbers in the input to a single value
  def reduce arr, func
    (0...arr[0].size).each do |index|
      selected = reduce_to_bits arr, func

      arr = arr.filter {|arr| arr[index] == selected[index]}

      if arr.size == 1
        break
      end
    end

    arr
  end

  oxygen_arr = reduce INPUTS, :>=
  co2_arr = reduce INPUTS, :<

  co2_arr.join.to_i(2) * oxygen_arr.join.to_i(2)
end

# p part_1
p part_2
