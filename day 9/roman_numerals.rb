$roman_numeral_key = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def greet_user
  print "Enter your number to convert: "
  number = gets.to_i
end

def convert_to_roman(number)
  result = ''
  $roman_numeral_key.each_key do |div|
    division_array  = number.divmod(div)
    result << $roman_numeral_key[div] * division_array[0]
    number = division_array[1] 
  end
  result
end
  
num = greet_user
puts "Your result is: #{convert_to_roman(num)}"
