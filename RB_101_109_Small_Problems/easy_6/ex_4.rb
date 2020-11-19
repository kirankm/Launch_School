=begin
input array
output Same array with elements reversed
Questions
  Empty array -> Return empty array?

Algorithm
  counter = 0
  while counter < (arr.size/2) - 1
    array[counter] = array[array.length - counter - 1]
    counter += 1
  end
=end

def reverse!(arr)
  counter = 0
  while counter <= (arr.size/2) - 1
    index_1 = counter
    index_2 = arr.size - counter - 1

    arr[index_1], arr[index_2] = arr[index_2], arr[index_1]
    counter += 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

puts list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]


puts list = ['abc']
puts reverse!(list) == ["abc"]
puts list == ["abc"]

puts list = []
puts reverse!(list) == []
puts list == []
