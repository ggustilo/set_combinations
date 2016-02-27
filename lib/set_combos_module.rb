require "set_combos/version.rb" #testing
# require "./set_combos/version.rb" #run app
require 'pry'

module SetCombos
	# target = 3 set = [1,2,3]
	def find_valid_combo(target, set, current_combo)
		set.each do |obj|
			# puts "SUM: #{get_sum(current_combo)}"
			if get_sum(current_combo) == target
				# puts "YAY. GOT ONE!"
				# puts "COMBO LENGTH WHEN YAY: #{current_combo.length}"
				return Combo.new(current_combo)
			else
				current_combo << obj
				if get_sum(current_combo) == target
				# puts "YAY. GOT ONE!"
				# puts "COMBO LENGTH WHEN YAY: #{current_combo.length}"
					combo = Combo.new(current_combo)
					current_combo = []
					return combo
				elsif get_sum(current_combo) > target
					# puts "TOO MUCH -- POPPING"
					# puts "COMBO LENGTH BEFORE: #{current_combo.length}"
					last = current_combo.pop()
					# puts "POPPED OFF: #{last}"
					# puts "COMBO LENGTH AFTER: #{current_combo.length}"
					# next
				else #get_sum(current_combo) < target
					# puts "OK, RUN IT AGAIN"
					# puts "CURRENT OBJ: #{obj}"
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

