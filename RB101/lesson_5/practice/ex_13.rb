arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
puts arr.sort_by {|sub_arr| sub_arr.select {|x| x.odd?}}.inspect

