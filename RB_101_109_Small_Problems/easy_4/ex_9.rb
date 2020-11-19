=begin
  input
    number (non negative)
  output
    string
  questions (check validity of input)
  create a mapping between number and number in string form
  get digits of the number
  ensure that the order is in the same order as number
  convert each digits to corresponding string using the mapping
  join the characters in the resulting array
=end

def integer_to_string(num)
  string_2_num = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
    "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  num_2_string = string_2_num.keys
  num.digits.reverse.map {|x| num_2_string[x]}.join("")
end

def integer_to_string(num)
  string_2_num = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
    "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  num_2_string = string_2_num.keys

  output = ""
  loop do
    num, remainder = num.divmod(10)
    output.prepend(num_2_string[remainder])
    break if num == 0
  end
  return output
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
