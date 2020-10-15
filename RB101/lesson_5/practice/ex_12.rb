arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

out_hash = {}
arr.map {|x,y| out_hash[x] = y}
puts out_hash 

puts arr.each_with_object ({}) {|(x,y), obj| obj[x] = y}
