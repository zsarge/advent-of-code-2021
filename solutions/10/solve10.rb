#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/10
# Run with: 'ruby solve10.rb'
# using Ruby 2.5.1
# by Zack Sargent

# FILE_NAME = "input10.txt"
FILE_NAME = "test.txt"
INPUTS = File.readlines(FILE_NAME).map(&:chomp)

PAIRS = {
  '(' => ')',
  '[' => ']', 
  '{' => '}', 
  '<' => '>', 
}

POINT_VALUE = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

class Chunk
  attr_reader :open, :close, :content
  def initialize line
    return if line.empty?
    p "line: #{line}"
    @open = line[0]
    @close = PAIRS[line[0]]
    @content = 
      if line.size == 2
        nil
      else
        Chunk.new(line.slice(1, line.index(@close) - 1))
      end
  end

  def print
    puts "#{@open}#{@close}" 
    if @content.is_a? Chunk
      @content.print
    end
  end
end

p Chunk.new("{()()()}")
Chunk.new("{()()()}").print

# def chunk_idea line
  # # line.chars.chunk {|char| PAIRS.keys.include? char}.map{|(_, res)| res}.each_slice(2).map{|(a,b)| a.concat(b)}.to_a
  # line.chars.filter{PAIRS.keys.include? _1}.to_a.each do |c|
    # p line
    # line = line.chars.chunk{|ch| ch != PAIRS[c]}.map{|(_,b)| b}
  # end
  # p line
# end

# INPUTS.each do |input|
  # pp chunk_idea input
# end

# def is_corrupted? line
  # p "given #{line}"
  # opens  = line.chars.filter{|char| PAIRS.keys.include? char}
  # closes = line.chars.filter{|char| PAIRS.values.include? char}

  # opens.each do |brace|
    # # p [:opens, opens]
    # puts "brace: #{brace}"
    # p [:close, closes]
    # if closes.include? PAIRS[brace]
      # closes.delete_at(closes.index(PAIRS[brace]) || closes.length)
    # else
      # # p [:missing, PAIRS[brace]]
      # return true
    # end
  # end
  # return false
# end

# def get_score line
# opens  = line.chars.filter{|char| OPENS.include? char}
# closes = line.chars.filter{|char| CLOSES.include? char}

# opens.zip(closes).each do |(open, close)|
# if CLOSES[OPENS.index(open)] != close
# return POINT_VALUE[close]
# end
# end
# 0
# end

# pp INPUTS
# pp INPUTS.take(2).filter{ is_corrupted? _1 }
# p INPUTS.map{|line| get_score line }
