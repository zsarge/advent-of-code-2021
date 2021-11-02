# Run this script to create a new solution
# Run by using 'ruby addSolution.rb {challenge number}'
# or by just 'ruby addSolution.rb'
#
# This assumes you are running a linux like system.

require 'open-uri'
require 'nokogiri'

# Get text from internet -----
def getProblemText(num, language)
  url = "https://projecteuler.net/problem=#{num}"
  doc = Nokogiri::HTML(URI.open(url))
  content = doc.css('div.problem_content')
  if language == "hs" || language == "java"
    comment = ""
  else
    comment = "# "
  end
  return content.text.gsub("\r","").gsub("\n", "\n#{comment}").chomp
end

# Take input ----------------
problemNumber = ""
extension = ""

if ARGV.length == 0
  puts "enter the challenge number"
  problemNumber = gets.chomp

  puts "enter the file extension"
  extension = gets.chomp

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

if extension == ""
  extension = rb
end

# Create file ---------------
unless File.directory?("solutions")
  puts "no solutions directory found. are you running this from the right directory?"
  exit(1)
end
filename = "solve#{problemNumber}.#{extension}"
path = "solutions/#{problemNumber.rjust(3, "0")}"

# do not overwrite existing files
if File.file?("#{path}/#{filename}")
  puts "File Exists. Exiting"
  exit(1)
end

# pick template based on extension
if extension == "rb"
  template = "\
# https://projecteuler.net/problem=#{problemNumber}
# Run with: 'ruby #{filename}'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:
#{getProblemText(problemNumber, extension)}
puts 'Hello World!'
"
elsif extension == "py"
  template = "\
# https://projecteuler.net/problem=#{problemNumber}
# Run with: 'python #{filename}'
# using Python 3.6.9
# by Zack Sargent

\"\"\"
Prompt:

#{getProblemText(problemNumber, extension)}
\"\"\"

def main():
  print('Hello World!')

if __name__ == \"__main__\":
  main()

"
elsif extension == "hs"
  template = "\
-- https://projecteuler.net/problem=#{problemNumber}
-- Run with: 'ghc #{filename} && ./#{filename[0..filename.size-4]}' or 'runhaskell #{filename}'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:
#{getProblemText(problemNumber, extension)}
-}

main = putStrLn \"Hello World\"
"
elsif extension == "java"
  template = "\
// https://projecteuler.net/problem=#{problemNumber}
// Run with: 'javac #{filename} && java Solve#{problemNumber}'
// using openjdk version 11.0.10 and javac 11.0.10
// by Zack Sargent

/* Prompt:

#{getProblemText(problemNumber, extension)}
*/

class Solve#{problemNumber} {
    public static void main(String[] args) {
        System.out.println(\"Hello, World!\");
    }
}

"
end

Dir.mkdir(path) unless File.directory?(path)

File.write("#{path}/#{filename}", template, mode: "w")

puts "created #{path}/#{filename}"
