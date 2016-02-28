require "set_combos/version.rb"
require 'pry'

module SetCombos
	def find_valid_combo(target, set, current_combo)
	#FIXME: popping off one item is not enough: combo doesn't clear
		set.each_with_index do |obj, i|
			if get_sum(current_combo) == target
				return Combo.new(current_combo)
			else
				current_combo << obj
				if get_sum(current_combo) == target
					combo = Combo.new(current_combo)
					return combo
				elsif get_sum(current_combo) > target
					last = current_combo.pop()
				else #get_sum(current_combo) < target
					find_valid_combo(target, set, current_combo)
				end
			end
		end
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

