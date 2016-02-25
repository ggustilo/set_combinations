require "set_combos/version.rb" #testing
# require "./set_combos/version.rb" #run app
require 'pry'

module SetCombos

	def subset_sum(target, set, current_combo, evaluated_combos)
		puts "COMBOS +++++++++++++++++++++"
		evaluated_combos.each do |combo|
			p combo
		end
		puts "+++++++++++++++++++++++++++\n"
		if !evaluated_combos.include?(current_combo)
			r = rand(0..set.length-1)
			puts "R: #{r} ____________________"
			puts "NEW ITEM: #{set[r]}"
			current_combo << set[r]
			sum = 0
			current_combo.each do |item|
				sum += item.price_as_float
			end
			puts "SUM: #{sum}____________________"
			if sum >= target
				evaluated_combos.push(current_combo)
				# make sure evaluated combos still gets passed
				return
			else
				# set = set.select { |item| item.price_as_float < target-sum }
				# if !set.empty?
					subset_sum(target, set, current_combo, evaluated_combos)
				# else
				# 	evaluated_combos.push(current_combo)
				# 	return
				# end
			end
		else
			return evaluated_combos
		end
		return evaluated_combos
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

