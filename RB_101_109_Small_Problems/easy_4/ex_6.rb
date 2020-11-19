=begin
input
  array of numbers (0 or more numbers)
output
  array of numbers [each number is a running total]
Questions
What if no number what to return 

Algorithm
  Set initial adder  = 0
  initialize an empty array
  iterate through the array
    new_el = curr_el + adder
    adder = new_el
    append new_el to the array
    return the array
=end

def running_total(arr)
  out_arr = []
  adder = 0
  for el in arr
    new_el = el + adder
    out_arr << new_el
    adder = new_el
  end
  out_arr
end

def running_total(arr)
  adder = 0
  arr.map {|x| adder += x }
end

def running_total(arr)
  arr.each_with_object([]) { |value, arr| arr << (value + arr.last.to_i)}
end

def running_total(arr)
  arr.inject([]) { |arr, n| arr << (arr.last.to_i + n) }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []


