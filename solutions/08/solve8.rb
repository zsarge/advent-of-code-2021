#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/8
# Run with: 'ruby solve8.rb'
# using Ruby 2.5.1
# by Zack Sargent

# FILE_NAME = "input8.txt"
FILE_NAME = "test.txt"
INPUTS = File.readlines(FILE_NAME).map{|line| line.split("|").map(&:strip)}

# part 1
# p INPUTS.flat_map {|(input, output)| 
  # output.split(" ").map {|digit|
    # digit.chars.count
  # }
# }.count {|chrs| [2,4,3,7].include? chrs}

# INPUTS.take(1).each do |(input, output)|
  # line = input + " | " + output
  # p line
  # p line.split(" ").each { |chunk|
    # case chunk.chars.size
    # when 2
      # line = line.tr(chunk, "CF")
    # when 4
      # line = line.tr(chunk, "BCDF")
    # when 3
      # line = line.tr(chunk, "ACF")
    # when 7
      # line = line.tr(chunk, "ABCDEF")
    # else
      # chunk.to_sym
    # end
  # }
  # p line
  # _, output = line.split("|")
  # p output.strip
# end

# start translating : 
# https://github.com/fee1-dead/aoc/blob/master/src/y2021/d8.rs#L20-L102

# this one breaks it into more analogus functions:
# https://github.com/fspoettel/advent-of-code-2021/blob/master/src/solutions/day08.rs#L5-L186


