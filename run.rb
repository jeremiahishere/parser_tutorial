require 'parser/current'

require './heuristics/line_count'
require './heuristics/node_count'
require './heuristics/branch_count'
require './heuristics/call_count'
require './heuristics/assignment_count'
require './heuristics/nodes_with_grandchildren'

heuristics = [LineCount, NodeCount, AssignmentCount, BranchCount, CallCount, NodesWithGrandchildren]

filename = ARGV.first

file = File.open(filename)
code = file.read()

parsed_code = Parser::CurrentRuby.parse(code)

heuristic_outputs = []
heuristics.each do |h|
  heuristic_outputs.push(h.new(parsed_code).generate)
end

puts "The code:"
puts code
puts "The parse tree:"
p parsed_code

heuristic_outputs.each { |o| puts o }
