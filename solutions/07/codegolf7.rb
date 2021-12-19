#!/usr/bin/env ruby
# https://adventofcode.com/2020/day/7
# Run with: 'ruby codegolf7.rb'
# using Ruby 2.5.1
# by Zack Sargent

i=File.read("input7.txt").scan(/\d+/).map(&:to_i);[->p{i.map{(_1-p).abs}.sum},->p{i.map{n=(_1-p).abs;(n*(n+1))/2}.sum}].each{|c|p (i.min..i.max).map{c.call _1}.min}

