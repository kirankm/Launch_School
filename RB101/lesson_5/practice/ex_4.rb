arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
puts arr1.inspect

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4
puts arr2.inspect

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][-1][-1] = 4
puts hsh1.inspect

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2.values[0][:a][-1] = 4
puts hsh2.inspect
