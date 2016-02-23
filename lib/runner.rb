
filename = ARGV[0]


file = File.new(filename)
all_input = file.readlines
total_amount = all_input.shift().chomp
menu_items_as_array = []
all_input.each do |item|
	menu_items_as_array << item.chomp
end

if total_amount != nil
	puts "Total amount to spend: #{total_amount}. Is this correct? [y/n]"
end

answer = $stdin.gets.chomp

if answer === "y"

	if menu_items_as_array.empty? != true
		puts "These are the available menu items: "
		 menu_items_as_array.each {|item| puts item}
		puts "Do you wish to proceed? [y/n]"
		proceed = $stdin.gets.chomp
		if proceed === "y"
			# run set_combos on menu
			puts "Finding your available combos..."
		else
			puts "OK, see you next time."
		end
	else
		puts "There was a problem reading your file.  Please try again."
	end
else
	puts "Then please update your input file."
end


