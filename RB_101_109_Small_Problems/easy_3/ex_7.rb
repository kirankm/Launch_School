def oddities(arr)
  ret_arr = []
  arr.each_with_index do |value, index|
    ret_arr << value if index.even?
  end
  ret_arr
end

def oddities(arr)
  arr.select { |x| arr.index(x).even? }
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
