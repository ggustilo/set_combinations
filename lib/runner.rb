require 'benchmark'
require_relative 'bistro'

puts "Welcome to Combos Bistro.\nPlease provide a filepath to the menu file you wish to use.\nNote: Any invalid menu items will throw an error - so please check for typos!\n"

filename = gets.chomp
bistro = Bistro.new(filename)
bistro.take_order()


Benchmark.bm(15) do |x|
  x.report("Time to run sets:") { bistro.menu.get_combos() }
end