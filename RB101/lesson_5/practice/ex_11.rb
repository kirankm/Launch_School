arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

puts arr.map {|sub_arr| sub_arr.select {|x| x%3 == 0}}.inspect

