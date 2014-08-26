# Homework:
# write a ruby script that gets a number from a user and return whether it is an even or odd number.
# extra credit: also tell whether it is divisible by three.	

print "Please enter a number: "

number = gets.chomp
puts number + " " + (number.to_i.%(2).zero? ? "is " : "is not ") + "divisible by 2." 
puts number + " " + (number.to_i.%(3).zero? ? "is " : "is not ") + "divisible by 3." 