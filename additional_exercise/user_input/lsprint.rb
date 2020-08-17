puts "How many output lines do you want? Enter a number >= 3:"
choice = gets.chomp.to_i

while choice < 3 do
  puts "That's not enough lines."
  puts "How many output lines do you want? Enter a number >= 3:"
  choice = gets.chomp.to_i
end

choice.times {puts "Launch School is the best!"}

