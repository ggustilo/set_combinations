require_relative 'menu'
require_relative 'menu_item'

class Bistro

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
					menu.items.each { |item| puts "#{item.name}, #{item.price}"}
					puts "Do you wish to proceed? [y/n]"
					proceed = $stdin.gets.chomp
					if proceed === "y"
						puts "Finding your available combos..."
						menu.get_combos
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










