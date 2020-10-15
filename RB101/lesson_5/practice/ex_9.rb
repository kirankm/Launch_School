arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

out = arr.map do |sub_arr| 
  sub_arr.sort {|a,b| b <=> a}
end
puts out.inspect

