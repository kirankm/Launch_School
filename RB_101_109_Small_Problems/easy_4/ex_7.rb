=begin
input string with all numeric characters
Output number

Questions
  Empty string? return 0 (currntly assume at least one number is there)

Algorithm
  Have a mapping of chars to digits
  first_power = length of array - 1
  Convert string to array of characters
  Initialize number to 0
  iterate through the array of characters
    Digit = mapping[char]
    number = digit* 10 ** first_power + number
  return number
=end

def string_to_integer(str)
  digits = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
              "7" => 7, "8" => 8, "9" => 9, "0" => 0}
  num_arr = str.chars.map {|x| digits[x]}.reverse
  num_arr.each_with_index.reduce(0) { |memo, (el, index)| 
    memo + el*(10**index) }
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


def hexadecimal_to_integer(hex)
  digits = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
    "7" => 7, "8" => 8, "9" => 9, "0" => 0, "A" => 10, "B" => 11,
    "C" => 12, "D" => 13, "E" => 14, "F" => 15}
  num_arr = hex.upcase.chars.map {|x| digits[x]}
  num_arr.reduce(0) { |total, el| total*16 + el }
end

puts hexadecimal_to_integer('4D9f') == 19871
