puts "What is the bill?" 
bill = gets.chomp
puts "What is the tip percentage?"
tip_rate = gets.chomp

tip = bill.to_f * tip_rate.to_f * 0.01
total = bill.to_f + tip


puts "The tip is $#{tip}"
puts "The total is $#{total}"


