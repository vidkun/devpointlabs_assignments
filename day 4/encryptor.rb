require 'optparse'
# require 'pry'

class Encryptor
  def build_cipher(num)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(num)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_string(string, num)
    cipher_key = self.build_cipher(num)
    return string.split("").collect { |ch| cipher_key[ch] }.join("")
  end

  def decrypt_string(string, num)
    cipher_key = self.build_cipher(-num)
    return string.split("").collect { |ch| cipher_key[ch] }.join("")
  end

  def encrypt_file(filename, num)
    fa = []
    File.open(filename, "r").each_line do |line|
      fa << self.encrypt_string(line, num)
    end
    fa
  end

  def decrypt_file(filename, num)
   fa = []
    File.open(filename, "r").each_line do |line|
      fa << self.decrypt_string(line, num)
    end
  fa
  end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby crypto.rb [options]"
  opts.on('-r', '--rotation NUMBER', 'enter desired number of rotations') { |v| options[:rotation] = v.to_i }
  opts.on('-a', '--action encrypt|decrypt', "Action: 'encrypt' or 'decrypt'") { |v| options[:action] = v }
  opts.on('-i', '--input NAME', "Input name: 'console' or filename") { |v| options[:input_name] = v }
  opts.on('-o', '--output NAME', "Output name: 'console' or filename") { |v| options[:output_name] = v }
end.parse!
# puts options

e = Encryptor.new
if options[:action].downcase == 'encrypt'
  if options[:input_name].downcase == 'console' # Input from console
    puts 'Please enter your string: '
    message = gets.chomp
    if options[:output_name].downcase == 'console' # Output to console
      puts (options[:rotation].to_i > 0 && options[:rotation] != 13) ? e.encrypt_string(message, options[:rotation].to_i) : e.encrypt_string(message, 13)
    else # Output to a file
      out = File.open(options[:output_name], "w")
      out.write((options[:rotation].to_i > 0 && options[:rotation] != 13) ? e.encrypt_string(message, options[:rotation].to_i) : e.encrypt_string(message, 13))
      out.close
      p "Your encrypted message has been written to the file #{options[:output_name]}"
    end
  else # Input from a file
    if options[:output_name].downcase == 'console'
      s = e.encrypt_file(options[:input_name], (options[:rotation].to_i > 0 && options[:rotation] != 13) ? options[:rotation].to_i : 13)
      s.each {|l| puts l }
    else
      out = File.open(options[:output_name], "w")
      s = (options[:rotation].to_i > 0 && options[:rotation] != 13) ? e.encrypt_file(options[:input_name], options[:rotation].to_i) : e.encrypt_file(options[:input_name], 13)
      s.each {|l| out.write("#{l}\n")}
      out.close
      p "Your encrypted message has been written to the file #{options[:output_name]}"
    end
 
  end
elsif options[:action].downcase == 'decrypt'
  if options[:input_name].downcase == 'console' # Input from console
    puts 'Please enter your string: '
    message = gets.chomp
    if options[:output_name].downcase == 'console' # Output to the console
      puts (options[:rotation].to_i > 0 && options[:rotation] != 13) ? e.decrypt_string(message, options[:rotation].to_i) : e.decrypt_string(message, 13)
    else # Output to a file
      out = File.open(options[:output_name], "w")
      out.write((options[:rotation].to_i > 0 && options[:rotation] != 13) ? e.decrypt_string(message, options[:rotation].to_i) : e.decrypt_string(message, 13))
      out.close
      p "Your decrypted message has been written to the file #{options[:output_name]}"
    end
  else # Input from a file
    if options[:output_name].downcase == 'console' # Output to the console
      s = e.decrypt_file(options[:input_name], (options[:rotation].to_i > 0 && options[:rotation] != 13) ? options[:rotation].to_i : 13)
      s.each {|l| puts l }
    else # Output to a file
      out = File.open(options[:output_name], "w")
      s = (options[:rotation].to_i > 0 && options[:rotation] != 13) ? e.decrypt_file(options[:input_name], options[:rotation].to_i) : e.decrypt_file(options[:input_name], 13)
      s.each {|l| out.write("#{l}\n")}
      out.close
      p "Your decrypted message has been written to the file #{options[:output_name]}"
    end
  end
end
