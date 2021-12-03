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
  def get_most_common array
    def helper foo
      ones = foo.count { _1 == 1 }
      zeros = foo.size - ones
      if ones >= zeros
        1
      else
        0
      end
    end
    array.transpose.map(&:reverse).map {|arr| helper arr }
  end
  def get_least_common array
    def helper foo
      ones = foo.count { _1 == 1 }
      zeros = foo.size - ones
      if ones < zeros
        1
      else
        0
      end
    end
    array.transpose.map(&:reverse).map {|arr| helper arr }
  end

  oxygen_arr = INPUTS

  (0...oxygen_arr[0].size).each do |index|
    most_common = get_most_common oxygen_arr

    # p "most common"
    # p most_common

    oxygen_arr = oxygen_arr.filter {|arr| arr[index] == most_common[index]}

    p oxygen_arr.size
    if oxygen_arr.size == 1
      break
    end
  end

  co2_arr = INPUTS

  (0...co2_arr[0].size).each do |index|
    least_common = get_least_common co2_arr

    # p "least common"
    # p least_common

    co2_arr = co2_arr.filter {|arr| arr[index] == least_common[index]}

    p co2_arr.size
    if co2_arr.size == 1
      break
    end
  end

  p oxygen_arr
  p co2_arr
  co2_arr.join.to_i(2) * oxygen_arr.join.to_i(2)
end

# p INPUTS.zip INPUTS.map { most_common_bit _1 }
# p part_1
p part_2
