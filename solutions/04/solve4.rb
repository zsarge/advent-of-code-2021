#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/4
# Run with: 'ruby solve4.rb'
# using Ruby 2.5.1
# by Zack Sargent

class Bingo
  @card
  @values
  @marked

  def initialize card
    @card = card
    @values = card.flatten
    @marked = []
  end

  def print
    puts "card:"
    pp @card
    puts "values:"
    p @values
    puts "marked:"
    p @marked
  end

  def contains? num
    @values.include? num
  end

  def mark num
    if @values.include? num
      @marked << num
      @card = @card.map {|col| col.map {|value| value == num ? "#" : value}}
    end
  end

  def won?
    valid = ->(line) {line.count { _1 == "#" } == line.size}
    @card.any?(&valid)
    @card.transpose.any?(&valid)
  end

  def answer
    unmarked = @values - @marked
    unmarked.sum * @marked.last
  end
end

FILE_NAME = "input4.txt"
# FILE_NAME = "test.txt"

INPUTS = File.readlines(FILE_NAME)
$given = INPUTS.first.chomp.split(",").map &:to_i
$boards = INPUTS
  .drop(1)
  .map(&:chomp)
  .filter{ !_1.empty? }
  .each_slice(5)
  .map {|arr| arr.map {_1.split(" ").map(&:to_i)}}
  .map { Bingo.new(_1) }


def part_1
  $given.each do |num|
    $boards.each do |board|
      if board.won?
        # board.print
        # puts "WON!!"
        return board
      end
      board.mark num
      # board.print
      # puts "---"
    end
  end
end

p part_1.answer

# p INPUTS
# p selected
# pp boards
