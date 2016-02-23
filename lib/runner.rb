require_relative 'bistro'

filename = ARGV[0]
bistro = Bistro.new(filename)
bistro.take_order()
