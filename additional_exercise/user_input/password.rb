puts "Please enter your password:"
PASSWORD = "kiran"

entry = gets.chomp

while entry != PASSWORD do
  puts "Invalid password!"
  puts "Please enter your password:"
  entry = gets.chomp
end

puts "Welcome!"
  
