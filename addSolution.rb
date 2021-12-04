# Run this script to create a new solution
# Run by using 'ruby addSolution.rb {challenge number}'
# or by just 'ruby addSolution.rb'
#
# This assumes you are running a linux like system.

YEAR = 2020

# Take input ----------------
problemNumber = ""
extension = ""

if ARGV.length == 0
  puts "enter the challenge number"
  problemNumber = gets.chomp

  puts "enter the file extension"
  extension = gets.chomp
  extension = "rb" if extension.empty?

  puts "create solve#{problemNumber}.#{extension}? (y/n)"
  input = ""

  while input.downcase.count("yn") <= 0
    input = gets.chomp
  end

  return if input.downcase.count("n") >= 1
elsif ARGV.length == 1
  puts "Malformed input. Please have both a number and an extension."
  puts "For example: "
  puts "`ruby addSolution.rb 1 py` will create `./solutions/001/solve1.py`"
  exit(1)
else
  problemNumber = ARGV[0]
  extension = ARGV[1]
end

# Create file ---------------
unless File.directory?("solutions")
  puts "no solutions directory found. are you running this from the right directory?"
  exit(1)
end
filename = "solve#{problemNumber}.#{extension}"
path = "solutions/#{problemNumber.rjust(2, "0")}"
input_file_name = "input#{problemNumber}.txt"

# do not overwrite existing files
if File.file?("#{path}/#{filename}")
  puts "File Exists. Exiting"
  exit(1)
end

# pick template based on extension
if extension == "rb"
  template = "\
#!/usr/bin/env ruby
# https://adventofcode.com/#{YEAR}/day/#{problemNumber}
# Run with: 'ruby #{filename}'
# using Ruby 2.5.1
# by Zack Sargent

FILE_NAME = \"#{input_file_name}\"
# FILE_NAME = \"test.txt\"
INPUTS = File.readlines(FILE_NAME)

p INPUTS
"
else
  template = "no template found"
end

Dir.mkdir(path) unless File.directory?(path)

File.write("#{path}/#{filename}", template, mode: "w")
File.write("#{path}/#{input_file_name}", "PUT INPUT HERE", mode: "w")
File.write("#{path}/test.txt", "PUT TEST INPUT HERE", mode: "w")

puts "created #{path}/#{filename}"
