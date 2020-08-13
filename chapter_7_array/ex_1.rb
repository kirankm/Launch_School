arr = [1, 3, 5, 7, 9, 11]
number = 3

for x in arr do
  if x == number
    puts "number #{number} is in #{arr}"
  end
end

puts "Method 2"
arr.each {|x| puts "number #{number} is in #{arr}" if x == number}
