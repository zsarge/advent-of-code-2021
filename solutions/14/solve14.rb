#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/14
# Run with: 'ruby solve14.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input14.txt"
# FILE_NAME = "test.txt"
INPUTS = File.readlines(FILE_NAME).map(&:chomp)

TEMPLATE = INPUTS[0]
RULES = INPUTS[2..].map{|rule| rule.split(" -> ")}.to_h

def insert input
  output = []
  input.each_cons(2).each do |(this, nxt)| 
    if RULES[this+nxt]
      output << this << RULES[this+nxt]
    else
      output << this
    end
  end
  output << input.last
  output
end

def part1 input
  10.times do |i|
    input = insert input
  end

  min, max = input.tally.to_a.minmax {|(_, a), (_, b)| a - b}
  max.last - min.last
end

p part1 TEMPLATE.chars
