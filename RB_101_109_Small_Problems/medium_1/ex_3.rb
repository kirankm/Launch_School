=begin
  input number (integer)
  Output different number (integer)

  Questions
    How to treat 30 is the rotated value 3?
    Only positive number?

  Algorithm
    counter = number of digits in number
    while counter > 0
      number = rotate_rightmost_digit(number, counter)
      counter -= 1
    end
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

def max_rotation(number)
  counter = number.to_s.length
  while counter > 0
    number = rotate_rightmost_digits(number, counter)
    counter -= 1
  end
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(8_703_529_146) == 7_321_609_845
puts max_rotation(105)
