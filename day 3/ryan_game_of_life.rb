require 'pry'
class Game
	def initialize(size=30)
		@size = (size == 0 ? 30 : size)
		@ticks = 1
		# @current_board = Array.new(@size) { Array.new(@size) { (rand(1893) % 5 == 0) ? 'X' : 'O' } }
		# @future_board = Array.new(@size) { Array.new(@size) }
		@current_board = [
			['.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.',],
			['.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.',],
			['.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.',],
			['.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O',],
			['O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O',],
			['.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O',],
			['.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.',],
			['.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.',],
			['.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.',],
			['.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.',],
			['.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O',],
			['O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O',],
			['.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O',],
			['.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.',],
			['.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.',]
		]
		@future_board = [
			['.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.',],
			['.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.',],
			['.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.',],
			['.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O',],
			['O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O',],
			['.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O',],
			['.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.',],
			['.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.',],
			['.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.',],
			['.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.',],
			['.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', 'O', '.', 'O',],
			['O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', '.', '.', 'O',],
			['.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', 'O', 'O', '.', 'O', '.', 'O',],
			['.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', 'O',],
			['.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', 'O', 'O', 'O', 'O', '.',],
			['.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 'O', '.', '.', '.',]
		]
	end

	def alive?(y, x)
		if @current_board[y]
			'X' if @current_board[y][x] == '.'
			'O' if @current_board[y][x] == 'O'
		else
			'.'
		end
	end

	def index_out_of_bounds?(position, upper_bound)
   return (position < 0 || position > upper_bound)
  end

	def check_neigbors(y, x)
		neighbors = {
			top: 					[y-1, x],
			top_right: 		[y-1, x+1],
			right: 				[y, x+1],
			bottom_right: [y+1, x+1],
			bottom: 			[y+1, x],
			bottom_left: 	[y+1, x-1],
			left: 				[y, x-1],
			top_left: 		[y-1, x-1]
		}
		neighbor_state = {
			top: 					'.',
			top_right: 		'.',
			right: 				'.',
			bottom_right: '.',
			bottom: 			'.',
			bottom_left: 	'.',
			left: 				'.',
			top_left: 		'.'
		}
		# neighbors.each { |k, v| neighbor_state[k] = true if alive?(v[0], v[1]) }
		neighbors.each do |k, v| 
			# If the row is out of bounds, then there is nothing to test
				# binding.pry
        next if index_out_of_bounds?(v[0], @size-1)
        # If the column is out of bounds, then there is nothing to test
        next if index_out_of_bounds?(v[1], @size-1)
			if alive?(v[0], v[1])
				neighbor_state[k] = 'O'
			else
				neighbor_state[k] = '.'
			end
		end
		live_neighbor_count = 0
		neighbor_state.each_value { |v| live_neighbor_count += 1 if v == 'O' }
		live_neighbor_count
	end

	def cell_lives(y, x)
		@future_board[y][x] = 'O'
	end

	def cell_dies(y, x)
		@future_board[y][x] = '.'
	end

	def display_board
		# need to display board here
		system("clear")
		@current_board.each do
			# |r| puts r.map { |c| c ? 'O' : 'X' }.join(" ")
			|r| puts r.map { |c| c }.join(" ")
			# puts @current_board.map { |row| row.map { |cell| cell ? 'X' : ' ' }.inspect }
		end
		puts "\nTicks: #{@ticks}"
	end

	def play
		loop do
			display_board
			@current_board.each_with_index do |r, ri| # outer loop to iterate through rows
				row_index = ri.to_i
				r.each_with_index do |c, ci| # inner loop to iterate through columns
					column_index = ci.to_i
					live_neighbor_count = check_neigbors(row_index, column_index) # count the number of live neighbors
					if ( alive?(row_index, column_index) == 'O' ) && live_neighbor_count < 2 # rule 1
						cell_dies(row_index, column_index)
					elsif ( alive?(row_index, column_index)  == 'O') && ( live_neighbor_count == 2 || live_neighbor_count == 3 ) # rule 2
						cell_lives(row_index, column_index)
					elsif ( alive?(row_index, column_index)  == 'O') && live_neighbor_count > 3 # rule 3
						cell_dies(row_index, column_index)
					elsif ( alive?(row_index, column_index) == '.' || alive?(row_index, column_index) == nil) && live_neighbor_count == 3 # rule 4
						cell_lives(row_index, column_index)
					else
						@future_board[row_index][column_index] = @current_board[row_index][column_index]
					end
				end
			end
			if @current_board == @future_board # board is gridlocked. Game over!
				puts "\nGAME OVER!"
				exit!
			else
				@future_board.each_with_index do |row, i|
	        @current_board[i] = row.clone
	      end
				@ticks += 1
				sleep(0.3)
			end
		end
	end
end

# print "How large of a grid do you want: "
# grid_size = gets.to_i
game = Game.new # grid_size
game.play