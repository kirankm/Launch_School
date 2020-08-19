count = 1

def odd_status(num)
  return "odd" if num%2 == 1
  return "even"
end

loop do
  puts "#{count} is #{odd_status(count)}"
  break if count == 5
  count += 1
end


