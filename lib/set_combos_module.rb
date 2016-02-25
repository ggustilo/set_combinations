# require "set_combos/version.rb" #testing
require "./set_combos/version.rb" #run app
require 'pry'

module SetCombos

	def calculate_combinations_that_sum_to_total(target, set, working_combo, all_combos, valid_combos)
		puts working_combo
		puts working_combo.combo.length
		if all_combos.include?(working_combo)
			#take off the last item and send it through again
		else
			all_combos << working_combo
			sum = working_combo.get_sum()
			if sum > target
				# take off the last item and send it through again
			elsif sum == target
				valid_combos << working_combo
			else 
				r = rand(0..set.length-1)
				working_combo.combo << set[r]
				new_working_combo = Combo.new(working_combo.combo)
				calculate_combinations_that_sum_to_total(target, set, new_working_combo, all_combos, valid_combos)
			end
		end
		puts all_combos.length
		valid_combos
	end


	class Combo

		attr_accessor :combo

		def initialize(items_array)
			@combo = items_array
		end

		def get_sum
			prices = []
			combo.each do |item|
				prices << item.price_as_float
			end
			prices.reduce(0, :+)
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

