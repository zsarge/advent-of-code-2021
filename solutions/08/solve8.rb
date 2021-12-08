#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/8
# Run with: 'ruby solve8.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input8.txt"
# FILE_NAME = "test.txt"
INPUTS = File.readlines(FILE_NAME).map{|line| line.split("|").map(&:strip)}

p INPUTS.flat_map {|(input, output)| 
  output.split(" ").flat_map {|digit|
    digit.chars.count
  }
}.count {|chrs| [2,4,3,7].include? chrs}

