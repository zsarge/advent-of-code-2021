#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/5
# Run with: 'ruby solve5.rb'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = "input5.txt"
# FILE_NAME = "test.txt"
INPUTS = File.readlines(FILE_NAME)
  .map(&:chomp)
  .map{|line| line.split(" -> ")}
  .map{|points| points.map{|point| point.split(",").map(&:to_i)}}

def range a, b
  a < b ? (a..b) : a.downto(b)
end

def part_1
  inputs = INPUTS.filter {|(x1,y1),(x2,y2)| x1 == x2 || y1 == y2}
  # assumes a square world
  max = inputs.flatten.max + 1

  @ocean_floor = Array.new(max) {Array.new(max, 0)}
  inputs.each do |(x1,y1), (x2,y2)|
    if x1 == x2
      range(y1,y2).each do |y|
        @ocean_floor[y][x1] += 1
      end
    else
      range(x1,x2).each do |x|
        @ocean_floor[y1][x] += 1
      end
    end
  end
  @ocean_floor.flatten.count {_1 >= 2}
end

def part_2
  inputs = INPUTS.filter {|(x1,y1),(x2,y2)| x1 != x2 && y1 != y2}

  inputs.each do |(x1,y1), (x2,y2)|
      range(x1,x2).zip(range(y1, y2)).each do |x,y|
        @ocean_floor[y][x] += 1
      end
  end
  @ocean_floor.flatten.count {_1 >= 2}
end

p part_1
p part_2
