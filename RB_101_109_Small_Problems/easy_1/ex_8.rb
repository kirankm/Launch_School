=begin
  Input: array of Integers, all positive. At least one element
  Output: Average (integer division)

  Questions
  1) Input validation
    1a) Array size validation
    1b) All integers are positive validation
  Algorithm
  Get sum of all elements in array
  Get length of array
  average = Sum / length

  Examples
  average([1, 6]) == 3
  average([1, 5, 87, 45, 8, 8]) == 25
  average([9, 47, 23, 95, 16, 52]) == 40

=end

def average(arr)
  arr.sum.to_f/ arr.length
end

puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) # == 25.0
puts average([9, 47, 23, 95, 16, 52]) #== 40
