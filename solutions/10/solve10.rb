#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/10
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

# @param [String] line
# @return [Array] (illegal_character_point_value, total_score)
def process line
  stack = []
  line.chars.each do |char|
    if GET_OPENER.values.include? char
      stack << char
    else
      if stack.last == GET_OPENER[char]
        stack.pop
      else
        # return the point value of the invalid closing brace
        return [POINT_VALUE_1[char], nil]
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
  return [nil, total]
end

# part 1
p INPUTS.filter_map {|input|
  invalid_character, _ = process(input)
  invalid_character # will be nil for incomplete lines
}.sum

# part 2
scores = INPUTS.filter_map {|input|
  pt1, total_score = process(input)
  total_score if !pt1
}.sort

p scores[scores.size/2]
