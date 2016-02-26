require "set_combos/version.rb" #testing
# require "./set_combos/version.rb" #run app
require 'pry'

module SetCombos


	def subset_sum(target, set, current_combo, evaluated_combos)
		puts "COMBOS: #{evaluated_combos.length}"
		if !evaluated_combos.include?(current_combo)
			sum = 0
			current_combo.each do |item|
				sum += item.price_as_float
			end
			puts "SUM: #{sum}"
			if sum >= target
				puts "PUSHING ANOTHER COMBO"
				evaluated_combos.push(current_combo)
			else
				r = rand(0..set.length-1)
				puts "NEXT ITEM: #{set[r]}"
				current_combo << set[r]
			end
		 		evaluated_combos += subset_sum(target, set, current_combo, evaluated_combos)
		else
			last_item = current_combo.pop()
			puts "ITEM THAT WENT OVER: #{last_item.name}"
			set = set.select{|item| item != last_item}
			puts "SET: #{set}\n"
			if !set.empty?
				r = rand(0..set.length-1)
				current_combo << set[r]
				puts "TRYING AGAIN: #{set[r].name}"
				subset_sum(target, set, current_combo, evaluated_combos)
			else
				return
			end
		end
		evaluated_combos
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

