#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/10
# Run with: 'ruby solve10.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.readlines("input10.txt").map(&:chomp)

GET_OPENER = {
  ')' => '(',
  ']' => '[',
  '}' => '{',
  '>' => '<',
}

GET_CLOSER = GET_OPENER.to_a.map(&:reverse).to_h

POINT_VALUE_1 = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

POINT_VALUE_2 = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4,
}

def first_illegal_char input
  stack = []
  input.chars.each do |char|
    if GET_OPENER.values.include? char
      stack << char
    else
      if stack.last == GET_OPENER[char]
        stack.pop
      else
        return char
      end
    end
  end
  return nil # line was valid
end

def get_closing_score line
  # build a stack, like part 1
  stack = []
  line.chars.each do |char|
    if GET_OPENER.values.include? char
      stack << char
    else
      if stack.last == GET_OPENER[char]
        stack.pop
      end
    end
  end

  # close all of the open braces, and calculate the score
  scores = stack.reverse.map{|opener| POINT_VALUE_2[GET_CLOSER[opener]]}

  # calculate final score
  total = 0
  scores.each do |score|
    total *= 5
    total += score
  end
  return total
end

# part 1
p INPUTS.filter_map {|input|
  x = first_illegal_char(input)
  POINT_VALUE_1[x] if x
}.sum

scores = INPUTS.filter_map {|input|
  get_closing_score(input) if !first_illegal_char(input)
}.sort

# part 2
p scores[scores.size/2]
