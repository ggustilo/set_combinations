require "set_combos/version.rb" #testing
# require "./set_combos/version.rb" #run app
require 'pry'
module SetCombos

	def calculate_combinations(target_number, set)

	end

	class Combo

		attr_reader :combo

		def initialize(items_array)
			@combo = items_array
		end

		def same?(another_combo)
			self.combo.sort.each_with_index do |item, index|
				if item == another_combo.combo.sort[index]
					next
				else
					return false
				end
			end
			true
		end

		def sums_to_total?(total)
			prices = []
			self.combo.each do |item|
				prices << item.price_as_float
			end
			sum = prices.reduce(:+)
			if sum == total
				true
			else
				false
			end
		end

		def to_s
			self.combo.each do |item|
					puts item
			end
		end

	end


end

