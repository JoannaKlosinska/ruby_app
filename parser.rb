require './log_parser.rb'

parser = LogParser.new(ARGV[0])
parser.parse

puts "---------"
puts "Most visits:"
parser.paths_sorted_by_visits.each { |x| puts x }
puts "---------"
puts "Most unique visits:"
parser.paths_sorted_by_unique_visits.each { |x| puts x }
puts "---------"





