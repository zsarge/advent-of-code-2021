#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/18
# Run with: 'ruby solve18.rb'
# using Ruby 2.5.1
# by Zack Sargent

require 'json'

# FILE_NAME = "input18.txt"
FILE_NAME = "test.txt"
# FILE_NAME = "test2.txt"
INPUTS = File.readlines(FILE_NAME)
             .map(&:chomp)
             .map{ |line| JSON.parse line }

class Node
  attr_reader :left
  attr_reader :right

  def initialize l, r
    # p ({left: [l, l.class], right: [r, r.class]})
    if l.is_a? Integer
      @left = l
    else
      @left = Node.new(l[0], l[1])
    end

    if r.is_a? Integer
      @right = r
    else
      @right = Node.new(r[0], r[1])
    end
  end

  def self.jsonify(left, right)
    l = r = ""

    if left.is_a? Integer
      l = left.to_s
    else
      l = self.jsonify(left.left, left.right)
    end

    if right.is_a? Integer
      r = right.to_s
    else
      r = self.jsonify(right.left, right.right)
    end

    # return "{\"left\": #{l}, \"right\": #{r}}"
    return "{ \"l\": #{l}, \"r\": \t#{r}}"
  end

  def to_json
    Node.jsonify @left, @right
  end

end

# to do:
# figure out what in the world resolving means

INPUTS.each do |(left, right)|
  pp [left, right]
  node = Node.new(left, right)
  # pp node
  puts puts JSON.pretty_generate(JSON.parse(node.to_json))
  # count_sub_arrs input
  # pp input
end
