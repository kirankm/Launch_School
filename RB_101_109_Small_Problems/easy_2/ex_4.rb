require "date"

puts "What is your age?"
curr_age = gets.chomp.to_i

puts "At what age would you like to retire"
retire_age = gets.chomp.to_i

curr_year = Date.today.year
years_remaining = retire_age - curr_age

puts "It's #{curr_year}. You will retire in #{curr_year + years_remaining}"
puts "You have only #{years_remaining} years of work to go!"