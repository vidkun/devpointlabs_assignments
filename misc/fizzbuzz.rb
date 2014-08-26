# Different implementations of the fizzbuzz test.
# Refactored to achieve the shortest possible implementation
#
# (1..100).each do |n|
# 	if n % 3 == 0
# 		p n % 5 == 0 ? "FizzBuzz" : "Fizz"
# 	elsif n % 5 == 0
# 		p "Buzz"
# 	else
# 		p n
# 	end
# end

# for n in 0...100
# 	p (n%3==0 ? (n%5==0 ? "FizzBuzz" : "Fizz") : (n%5==0 ? "Buzz" : n))
# end

1.upto(100) {|n| p (n%3==0 ? (n%5==0 ? "FizzBuzz" : "Fizz") : (n%5==0 ? "Buzz" : n))}
