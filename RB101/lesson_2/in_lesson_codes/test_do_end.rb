array = [1, 2, 3]
p array.tap {|x| puts x}.map do |num|
  puts "was here"
  num + 1 
end


p array.tap {|x| puts x}.map { |num|
  puts "here"
  num + 1 
}
