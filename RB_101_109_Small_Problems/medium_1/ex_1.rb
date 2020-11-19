=begin
  input
    Array
      Elements can be anything
  Output
    New array, with element order rotated. i.e. first becomes last, second becomes first etc
  Questions
    1) What to return in the case of empty array -> Input will have atleast 1 element
    2) what to return in case the array has one element -> same array
    3) Can the contents of the array be other arrays?

  Algorithm
    1) Create a new array with only elements 1 to array.length 
    2) Append the first element to the array
=end

def rotate_array(arr)
  arr[1, arr.length - 1] + arr[0, 1]
end

def rotate_strings(str)
  rotate_array(str.chars).join("")
end

def rotate_int(num)
  rotate_array(num.to_s.chars).join("").to_i
end


puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   
puts x == [1, 2, 3, 4] 

puts rotate_strings("abcde")
puts rotate_int(1234)