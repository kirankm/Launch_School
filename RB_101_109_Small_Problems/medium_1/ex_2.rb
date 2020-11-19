=begin
  input
    number -> integer
    digit_to_rotate -> integer
  output
    new integer with digits rotated

  Questions
    Validation? can number of digits to rotate be greater than original number of digits
    
  Algorithm
  get the digits of the array
  n = number of digits to rotate
  static_part = 0 to length - n elements
  moving part = length - n to last element
  output = static_part + rotate_array(moving_part)
  convert output to number and return
=end


def rotate_array(arr)
  arr[1, arr.length - 1] + arr[0, 1]
end

def rotate_rightmost_digits(num, digits_to_rotate)
  digits = num.digits.reverse
  static_digits = digits.length - digits_to_rotate
  static_part = digits[0, static_digits]
  moving_part = digits[(static_digits)..-1]
  rotated_number_array = static_part + rotate_array(moving_part)
  rotated_number_array.join("").to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

