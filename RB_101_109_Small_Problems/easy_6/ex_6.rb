def merge(a,b)
  (a + b).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts merge([], [3, 6, 9]) == [3, 6, 9]
puts merge([], []) == []

