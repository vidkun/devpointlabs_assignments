print 'Please enter a string: '
input = gets.chomp
split_string = []
input.each_char { |c| split_string << c }
new_array = []
(split_string.length - 1).downto(0) { |i| new_array << split_string[i] }
# reversed = new_array.join
puts "Your string: #{input}"
puts "reversed is: #{new_array.join}"
if new_array.join == input
	puts 'This is a palindrome.'
else
	puts 'This is NOT a palindrome.'
end