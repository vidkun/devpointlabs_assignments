=begin
	
Rock, paper, scissors game that gets a choice from the user, randomly generates its own choice, and displays who won that round.
	
=end

# Get user's choice
user_choice = 0
until ((user_choice.to_i > 0 && user_choice.to_i < 4) || user_choice.to_s.downcase == 'q') do
	print 'Please select a choice (1=Rock, 2=Paper, 3=Scissors, 4=Lizard, 5=Spock, q=quit): '
	user_choice = gets.chomp
end
# if user_choice == 'q'
# 	exit!
# end
# Setup game counters
game_counter = 0
win_counter = 0
loss_counter = 0
tie_counter = 0

while (user_choice != 'q') do
	# Generate computer's choice
	comp_choice = rand(5) + 1
	game_counter += 1

	# For each user choice, check computer's choice and print who won that round.
	if user_choice == 1 # Rock
		case comp_choice
		when 1 # rock
			puts ''
			puts "It's a tie!"
			puts 'You both chose Rock'
			puts ''
			tie_counter += 1
		when 2 # paper
			puts ''
			puts 'Paper covers Rock'
			puts 'Computer wins this round.'
			puts ''
			loss_counter += 1
		when 3 # scissors
			puts ''
			puts 'Rock crushes Scissors'
			puts 'You won this round!'
			puts ''
			win_counter += 1
		when 4 # lizard
			puts ''
			puts 'Rock crushes Lizard'
			puts 'You won this round!'
			puts ''
			win_counter += 1
		when 5 # spock
			puts ''
			puts 'Spock vaporizes Rock'
			puts 'Computer wins this round.'
			puts ''
			loss_counter += 1
		end
	elsif user_choice == 2 # Paper
		case comp_choice
			when 1 # rock
				puts ''
				puts 'Paper covers Rock'
				puts 'You won this round!'
				puts ''
				win_counter += 1
			when 2 # paper
				puts ''
				puts "It's a tie!"
				puts 'You both chose Paper'
				puts ''
				tie_counter += 1
			when 3 # scissors
				puts ''
				puts 'Scissors cut Paper'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 4 # lizard
				puts ''
				puts 'Lizard eats Paper'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 5 # spock
				puts ''
				puts 'Paper disproves Spock'
				puts 'You won this round!'
				puts ''
				win_counter += 1
		end
	elsif user_choice == 3 # Scissors
		case comp_choice
			when 1 # rock
				puts ''
				puts 'Rock crushes Scissors'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 2 # paper
				puts ''
				puts 'Scissors cut Paper'
				puts 'You won this round!'
				puts ''
				win_counter += 1
			when 3 # scissors
				puts ''
				puts "It's a tie!"
				puts 'You both chose scissors'
				puts ''
				tie_counter += 1
			when 4 # lizard
				puts ''
				puts 'Scissors decapitate Lizard'
				puts 'You won this round!'
				puts ''
				win_counter += 1
			when 5 # spock
				puts ''
				puts 'Spock smashes Scissors'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
		end
	elsif user_choice == 4 # Lizard
		case comp_choice
			when 1 # rock
				puts ''
				puts 'Rock crushes Lizard'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 2 # paper
				puts ''
				puts 'Lizard eats Paper'
				puts 'You won this round!'
				puts ''
				win_counter += 1
			when 3 # scissors
				puts ''
				puts 'Scissors decapitate Lizard'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 4 # lizard
				puts ''
				puts "It's a tie!"
				puts 'You both chose Lizard'
				puts ''
				tie_counter += 1
			when 5 # spock
				puts ''
				puts 'Lizard poisons Spock'
				puts 'You won this round!'
				puts ''
				win_counter += 1
		end
	else # Spock
		case comp_choice
			when 1 # rock
				puts ''
				puts 'Spock vaporizes Rock'
				puts 'You won this round!'
				puts ''
				win_counter += 1
			when 2 # paper
				puts ''
				puts 'Paper disproves Spock'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 3 # scissors
				puts ''
				puts 'Spock smashes Scissors'
				puts 'You won this round!'
				puts ''
				win_counter += 1
			when 4 # lizard
				puts ''
				puts 'Lizard poisons Spock'
				puts 'Computer wins this round.'
				puts ''
				loss_counter += 1
			when 5 # spock
				puts ''
				puts "It's a tie!"
				puts 'You both chose Spock'
				puts ''
				tie_counter += 1
		end
	end
	# Play another round
	print 'Please select a choice (1=Rock, 2=Paper, 3=Scissors, 4=Lizard, 5=Spock, q=quit): '
	user_choice = gets.chomp
	until ((user_choice.to_i > 0 && user_choice.to_i < 6) || user_choice.to_s.downcase == 'q') do
		print 'Please select a choice (1=Rock, 2=Paper, 3=Scissors, 4=Lizard, 5=Spock, q=quit): '
		user_choice = gets.chomp
	end
end

# Output game counters
# puts "You won #{win_counter} out of #{game_counter} games."
puts ''
puts "Out of #{game_counter} games:"
puts "\tYou won: #{win_counter}"
puts "\tYou lost: #{loss_counter}"
puts "\tYou tied: #{tie_counter}"
puts ''
