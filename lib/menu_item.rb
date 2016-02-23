class MenuItem
	attr_reader :price, :name

	def initialize(name, string_price)
		@name = MenuItem.validate_name(name)
		@price = MenuItem.validate_price(string_price)
	end

	def price_as_float
		price_without_dollar_sign_as_arr = price.split(//).slice(1..-1)
		price_without_dollar_sign_as_arr.join().to_f
	end

	def price_as_int
		price_without_dollar_sign_as_arr = price.split(//).slice(1..-1)
		price_without_dollar_sign_as_arr.join().to_i
	end

	def price_without_decimal
		price_without_dollar_sign_as_arr = price.split(//).slice(1..-1).select{|i| i != "."}
		price_without_dollar_sign_as_arr.join().to_i
	end

	private

	def self.validate_price(price)
		if price.class.name === "String" && price.include?("$") && price.length <= 10
			price
		else
			raise "That is not a valid price."
		end
	end

	def self.validate_name(name)
		if name.class.name === "String"
			name
		else
			raise "That is not a valid name."
		end
	end

end
