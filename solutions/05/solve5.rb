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

def part_1
  inputs = INPUTS.filter {|(x1,y1),(x2,y2)| x1 == x2 || y1 == y2}
  # assumes a square world
  max = inputs.flatten.max + 1
  # max_x, max_y = inputs.flatten(1).reduce{ |(max_x, max_y), (x,y)| 
    # p [max_x, max_y]
    # [[max_x, x].max, [max_y, y].max]
  # }

  @ocean_floor = Array.new(max) {Array.new(max, 0)}
  inputs.each do |(x1,y1), (x2,y2)|
    # puts "given:"
    # p [[x1,y1], [x2,y2]]
    # pp @ocean_floor
    if x1 == x2
      min, max = [y1, y2].minmax
      (min..max).each do |y|
        # p [x1,y]
        @ocean_floor[y][x1] += 1
      end
    else
      # puts "ys equal"
      min, max = [x1, x2].minmax
      (min..max).each do |x|
        # p [x,y1]
        @ocean_floor[y1][x] += 1
      end
    end
  end
  @ocean_floor.flatten.count {_1 >= 2}
end

# def pf
  # puts @ocean_floor.map{_1.join}.join("\n").tr ?0, ?.
# end

def part_2
  # puts "start part 2"
  # pf
  inputs = INPUTS.filter {|(x1,y1),(x2,y2)| x1 != x2 && y1 != y2}
  # inputs = INPUTS.filter {|(x1,y1),(x2,y2)| x1 == x2 || y1 == y2}
  # inputs = INPUTS.filter {|(x1,y1),(x2,y2)| x1 == x2 || y1 == y2}
  # assumes a square world

  # p inputs.take(1)
  # inputs.take(1).each do |(x1,y1), (x2,y2)|
    # p [x1, y1]
    # p [x2, y2]
  # end

  def bi_range a, b
    a < b ? (a..b) : a.downto(b)
  end
  inputs.each do |(x1,y1), (x2,y2)|
      # x1, x2 = [x1, x2].minmax
      # y1, y2 = [y1, y2].minmax
      # x1, y1 = [x1, y1].minmax
      # x2, y2 = [x2, y2].minmax
      # puts "zip start"
      # p [[x1, y1], [x2, y2]]
      # p (x1 < x2 ? (x1..x2) : x1.downto(x2)).zip(y1..y2)
      # puts "zip end"
      bi_range(x1,x2).zip(bi_range(y1, y2)).each do |x,y|
      # (x1..x2).zip(y1..y2).each do |x,y|
        # p [x,y]
        @ocean_floor[y][x] += 1
      end
      # pf
  end

  # puts "end part 2"

  @ocean_floor.flatten.count {_1 >= 2}
end

p part_1
p part_2
# p INPUTS
