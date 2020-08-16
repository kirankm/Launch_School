puts "Do you want me to print something? (y/n)"

value = gets.chomp

puts value == "y" ? "something" : nil
