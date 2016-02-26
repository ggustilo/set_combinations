require_relative 'menu'
require_relative 'menu_item'

class Bistro

	include SetCombos

	attr_reader :menu
	attr_accessor :total_amount

	def initialize(filename)
		@menu = Menu.new(Bistro.setup_menu_items(filename))
		@total_amount = Bistro.get_total_amount(filename)
	end

	def take_order
		if total_amount != nil
			puts "Total amount to spend: #{total_amount}. Is this correct? [y/n]"
		end

		answer = $stdin.gets.chomp

		if answer === "y"
			if menu.items.empty? != true
					puts "These are the available menu items: "
					menu.items.each { |item| puts item }
					puts "Do you wish to proceed? [y/n]"
					proceed = $stdin.gets.chomp
					if proceed === "y"
						puts "Finding your available combos..."
						self.get_combos()
					else
						puts "OK, see you next time."
					end
				else
					puts "There was a problem reading your file.  Please try again."
				end
			else
				puts "Then please update your input file."
			end
	end

	def get_combos
		set = menu.items.select {|item| item.price_as_float <= total_amount}
		combinations = self.subset_sum(total_amount, set, [], [])
		if combinations.empty?
			puts "I'm afraid there are no combos that exactly equal your requested total."
		else
			puts combinations.length
			combinations.each do |combo|
				combo_obj = Combo.new(combo)
				if combo_obj.sums_to_total?(total_amount)
					puts "\n-----------\n"
					puts combo
				else
					next
				end
			end
		end
	end

	private 

	def self.setup_menu_items(filename)
		file = File.new(filename)
		all_input = file.readlines
		throw_away = all_input.shift()
		
		menu_items_array = []
		all_input.each do |item|
			item_object = Bistro.make_item(item.chomp)
			menu_items_array << item_object
		end
		menu_items_array
	end

	def self.get_total_amount(filename)
		file = File.new(filename)
		all_input = file.readlines
		total_amount = all_input.shift().chomp.split(//).slice(1..-1).join().to_f
	end

	def self.make_item(string)
		elements = string.split(',')
		item_name = elements[0]
		item_price = elements[1]
		MenuItem.new(item_name, item_price)
	end

end










