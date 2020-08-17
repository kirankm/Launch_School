def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

a = nil
b = nil
loop do 

  while !valid_number?(a) do
    puts "Please enter a positive or negative integer:"
    a = gets.chomp
    #puts "a is #{a} is a #{valid_number?(a)} number"
  end

  while !valid_number?(b) do
    puts "Please enter a positive or negative integer:"
    b = gets.chomp
    #puts "b is #{b}"
  end

  inputs = [a.to_i,b.to_i]
  break if inputs.max > 0 and inputs.min < 0
  puts "Sorry. One integer must be positive, one must be negative.\nPlease start over."
end

puts "#{a} + #{b} = #{a.to_i+b.to_i}"

