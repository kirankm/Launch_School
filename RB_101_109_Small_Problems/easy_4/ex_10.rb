=begin
  input
   integer > or less than 0
  output signed string
  questions 
    should 0 have + sign
    should positive have + sign or just abs value
=end


def integer_to_string(num)
  string_2_num = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
    "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  num_2_string = string_2_num.keys
  num.digits.reverse.map {|x| num_2_string[x]}.join("")
end

def signed_integer_to_string(num)
  string_out = integer_to_string(num.abs)
  case num <=> 0
  when -1 then string_out.prepend("-")
  when 0 then string_out
  when 1 then string_out.prepend("+")
  end
end


puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
