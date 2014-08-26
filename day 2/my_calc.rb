=begin

A simple calculator program that allows users to choose a mathematical operation, provide 
one or two numbers, and get the correct result printed to the screen
	
=end

# Bring in my calculator class
require "./calculator.rb"
# require "pry"

# Define array of menu options
$menu_options = [
	'Add two numbers',
	'Subtract two numbers',
	'Multiply two numbers',
	'Divide two numbers',
	'Find the square root of a number',
	'Raise one number to the exponent of a second number',
	'Quit the program'
]

def display_menu
	puts "\n**********************************************************"
	puts '         Welcome to my calculator...of DOOM!!'
	puts '**********************************************************'
	# Iterate through menu option array and print them to screen as a menu
	$menu_options.each_with_index {|option, index| puts "  #{index + 1}. #{option}"}
	puts '**********************************************************'
	puts '**********************************************************'
	print 'Please select an option: '
end

def validate_choice(operation)
	if ( operation < 0 || operation > ($menu_options.length - 1) )
		puts "\nERROR: Invalid Option Selected"
		return false
	else
		return true
	end
end

loop do
	display_menu
	# Get user choice, subtract 1 to match indexes, and convert to value for include check in validation
	operation = gets.chomp.to_i - 1
	next unless validate_choice(operation)
	exit! if (operation == 6) # Quit the program
		# exit! # Quit the program
	if (operation == 4) # Square root of a number
		# Get user's number
		print 'Please enter the number you would like the square root for: '
		num = gets.chomp
		# Instantiate new calculator object
		calc = Calculator.new(num)
		puts "\n==> The square root of #{num} is: #{calc.square_root}"
	else
		# Get user's numbers
		print 'Please enter your first number: '
		num1 = gets.chomp
		print 'Please enter you second number: '
		num2 = gets.chomp
		# Instantiate new calculator object
		calc = Calculator.new(num1, num2)
		# Print out results of appropriate method for each possible operation
		case operation
		when 0 then puts "\n==> #{num1} plus #{num2} equals #{calc.add}" # add
		when 1 then puts "\n==> #{num1} minus #{num2} equals #{calc.subtract}" # subtract
		when 2 then puts "\n==> #{num1} times #{num2} equals #{calc.multiply}" # multiply
		when 3 then puts "\n==> #{num1} divided by #{num2} equals #{calc.divide}" # divide
		when 5 then puts "\n==> #{num1} to the power of #{num2} equals #{calc.exponent}" # exponentiation
		end
	end
end