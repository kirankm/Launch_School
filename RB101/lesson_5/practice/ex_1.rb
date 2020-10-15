arr = ['10', '11', '9', '7', '8']

puts arr.sort {|x,y| y.to_i <=> x.to_i}.inspect
puts arr.sort_by {|x| -1*(x.to_i)}.inspect
