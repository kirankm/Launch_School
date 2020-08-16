puts "Do you want me to print something? (y/n)"
out = gets.chomp.downcase

loop do
  break if ["y","n"].include? out
  puts "Invalid input! Please enter y or n"
  out = gets.chomp.downcase
end

puts "something" if out == "y"

  

