#!/usr/bin/env ruby
# https://adventofcode.com/2021/day/8
# Run with: 'ruby solve8.rb'
# using Ruby 2.5.1
# by Zack Sargent

INPUTS = File.readlines("input8.txt").map{|line| line.split("|").map(&:strip)}

# part 1
p INPUTS.flat_map {|(input, output)|
  output.split(" ").map {|digit|
    digit.chars.count
  }
}.count {|chrs| [2,4,3,7].include? chrs}

# part 2 was inspired by:
# https://github.com/sk1talets/advent-of-code/blob/main/2021/8/script.js
# Interestingly, I seem to get significantly better performance,
# even though we're basically doing the same steps.

known_by_segments_count = {
  2 => 1,
  4 => 4,
  3 => 7,
  7 => 8
}

known_by_appearance = {
  6 => 1,
  4 => 4,
  9 => 5
}

digit_segments = [
  '0,1,2,4,5,6',    #0
  '2,5',            #1
  '0,2,3,4,6',      #2
  '0,2,3,5,6',      #3
  '1,2,3,5',        #4
  '0,1,3,5,6',      #5
  '0,1,3,4,5,6',    #6
  '0,2,5',          #7
  '0,1,2,3,4,5,6',  #8
  '0,1,2,3,5,6',    #9
]

@result = 0

INPUTS.map{|line| line.map{|groups| groups.split(/\s+/) }}.each do |(patterns, values)|
  known_patterns = []
  segment_apperance = {}

  patterns.each do |pattern|
    if known_by_segments_count.include? pattern.size
      digit = known_by_segments_count[pattern.size]
      known_patterns[digit] = pattern.split("")
    end

    pattern.chars.each do |char|
      segment_apperance[char] = segment_apperance.fetch(char, 0) + 1
    end
  end

  segments = []

  segment_apperance.each do |symbol, count|
    if known_by_appearance.include? count
      segments[known_by_appearance[count]] = symbol
    end
  end

  segments[0] = known_patterns[7].filter{|s| !known_patterns[1].include? s}.first
  segments[2] = known_patterns[1].filter{|s| !segments.include? s}.first
  segments[3] = known_patterns[4].filter{|s| !segments.include? s}.first
  segments[6] = known_patterns[8].filter{|s| !segments.include? s}.first

  numeric_value = ''

  values.each do |value|
    value_segments = value.split("").map{|s| segments.index(s)}.sort.join(",")
    digit = digit_segments.index value_segments

    numeric_value.concat(digit.to_s)
  end

  @result += numeric_value.to_i
end

# part 2
p @result

