class Calculator

	def initialize(first_num, *params)
		@first_num = first_num
		@second_num = params[0]
	end

	def add
		@first_num.to_i + @second_num.to_i
	end

	def subtract
		@first_num.to_i - @second_num.to_i
	end

	def multiply
		@first_num.to_i * @second_num.to_i
	end

	def divide
		@first_num.to_i / @second_num.to_f
	end

	def square_root
		Math.sqrt(@first_num.to_i)
	end

	def exponent
		@first_num.to_i ** @second_num.to_i
	end

end