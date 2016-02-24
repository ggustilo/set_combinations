
require_relative "set_combos_module"

class Menu
	attr_reader :items

	def initialize(items_array)
		@items = Menu.validate_items(items_array)
	end

	private

	def self.validate_items(items_array)
		items = []
		items_array.each do |item|
			if item.class.name === "MenuItem"
				items << item
			else
				puts "One of your items was invalid.  It was not included.  Please check for errors next time."
				next
			end
		end
		return items
	end
end