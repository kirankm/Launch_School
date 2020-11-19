=begin
input array
output nested array with 2 arrays
      First array contains first half, (including middle element)
      second array contains remaining
Questions
  if array contains only 1 element
  if empty array

Algorithm
    out_array = [[], []]
    iterate through first half and keep inserting into first array
    Iterate through second half and keep inserting into 


=end

def halvsies(arr)
  return [[], []] if arr.length == 0
  return [arr, []] if arr.length == 1
  [arr[0, (arr.length + 1)/ 2], arr[(arr.length + 1)/ 2, arr.length]]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
