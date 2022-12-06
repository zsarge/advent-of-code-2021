#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/4
# Run with: 'ruby solve4.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.readlines("input4.txt")
$given = INPUTS.first.chomp.split(",").map &:to_i

class Bingo
  @card
  @values
  attr_reader :marked
  @won

  def initialize card
    @card = card
    @values = card.flatten
    @marked = []
    @won = false
  end

  def mark num
    return if @won
    if @values.include? num
      @marked << num
      @card = @card.map {|col| col.map {|value| value == num ? "#" : value}}
    end
  end

  def won?
    return true if @won
    valid = ->(line) {line.count { _1 == "#" } == line.size}
    @won = @card.any?(&valid) || @card.transpose.any?(&valid)
  end

  def answer
    unmarked = @values - @marked
    unmarked.sum * @marked.last
  end
end

# $boards is an array of Bingo objects
$boards = INPUTS
  .drop(1)
  .map(&:chomp)
  .filter{ !_1.empty? }
  .each_slice(5)
  .map {|arr| arr.map {_1.split(" ").map(&:to_i)}}
  .map { Bingo.new(_1) }

def part_1
  # mark off answers until we find a winning board
  $given.each do |num|
    $boards.each do |board|
      board.mark num
      return board.answer if board.won?
    end
  end
end

def find_last_board
  # mark off answers until there is only one board left
  $given.each do |num|
    $boards.each do |board|
      board.mark num
    end

    $boards.delete_if {_1.won?}

    return $boards.first if $boards.size == 1
  end
end

def part_2
  # solve the last board
  last_board = find_last_board
  used = last_board.marked.size-1
  $given.drop(used).each do |num|
    last_board.mark num
    return last_board.answer if last_board.won?
  end
end

p part_1
p part_2

