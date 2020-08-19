puts "give me a number to start counting from"
num = gets.chomp.to_i

def counter(x)
  puts "Counter value is #{x}"
  if x != 0 
    counter(x -1)
  end
end

counter(num)
