def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

puts "Please enter the numerator:"
num = gets.chomp

while !valid_number?(num) do
  puts "Please enter valid numerator:"
  num = gets.chomp
end

puts "Please enter the denominator:"
den = gets.chomp

while (den.to_i == 0) || (!valid_number?(den))  do
  puts "Please enter valid denominator:"
  den = gets.chomp
end

puts "#{num} / #{den} is #{num.to_i/den.to_i}"

