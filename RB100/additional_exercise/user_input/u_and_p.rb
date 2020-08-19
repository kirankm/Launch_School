LOGIN = {mary:"passwd", kiran:"12345678"}


loop do
  puts "Please enter user name:"
  user = gets.chomp
  puts user
  puts "the password is #{LOGIN[user.to_sym]}"
  puts "Please enter your password:"
  pass = gets.chomp

  if LOGIN[user.to_sym] == pass and pass != nil then break end

  puts "Authorization failed!"
end

puts "Welcome!"

