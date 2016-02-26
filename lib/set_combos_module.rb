require "set_combos/version.rb" #testing
# require "./set_combos/version.rb" #run app
require 'pry'

module SetCombos

	def subset_sum(target, set, current_combo, evaluated_combos)
		# puts "NUMCOMBOS: #{evaluated_combos.length}"
			if !evaluated_combos.include?(current_combo)
				sum = get_sum(current_combo)
				if sum >= target
					evaluated_combos.push(current_combo)
					current_combo = []
				else
					r = rand(0..set.length - 1)
					next_item = set[r]
					current_combo << next_item
				end
				subset_sum(target, set, current_combo, evaluated_combos)
			end
			evaluated_combos
	end

	def get_sum(current_combo)
		prices = []
		current_combo.each do |item|
			prices << item.price_as_float
		end
		prices.reduce(0, :+)
	end

	class Combo

		attr_accessor :combo

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
			sum = prices.reduce(:+).round(2)
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

