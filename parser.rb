require './log_parser.rb'

parser = LogParser.new(ARGV[0])
parser.parse

puts "---------"
puts "Most visits:"
puts parser.paths_sorted_by_visits
puts "---------"
puts "Most unique visits:"
puts parser.paths_sorted_by_unique_visits
puts "---------"





