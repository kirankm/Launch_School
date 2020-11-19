=begin
  input array with integers from 0 to 19
  Output: New array? with the integers sorted

  Questions
    Can numbers repeat

  Algorithm
    Create an array with mapping for each number to it's word equivalent
    For each number in the original array use the mapping as the value to sort by
=end

def alphabetic_number_sort(arr)
  numbers = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, 
    thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)
  #arr.sort_by {|x| numbers[x] }
  arr.sort { |a,b| numbers[a] <=> numbers[b] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
