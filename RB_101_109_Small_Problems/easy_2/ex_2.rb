SQMETERS_TO_SQFEET = 10.7639


puts "Enter the length of the room in meters:"
length = gets.chomp

puts "Enter the width of the room in meters:"
width = gets.chomp

sq_mtr = length.to_f * width.to_f
sq_ft = (sq_mtr * SQMETERS_TO_SQFEET).round(2)
puts "The area of the room is #{sq_mtr} square meters (#{sq_ft} square feet)."
