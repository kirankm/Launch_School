puts "How old are you?"
age = gets.chomp.to_i

start_val = 10

4.times {
  puts "In #{start_val} years you will be: \n #{age+start_val}"
  start_val += 10
}
