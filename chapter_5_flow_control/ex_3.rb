puts "give me a number"
num = gets.chomp.to_i

if num < 100
  if num < 50
    puts "between 0 and 50"
  else
    puts "between 50 and 100"
  end
else
  puts "greater than 100"
end

