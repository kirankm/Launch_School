def string_to_signed_integer(str)
  digits = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
              "7" => 7, "8" => 8, "9" => 9, "0" => 0}
  sign = "positive"
  if str[0] == "-"
    sign = "negative"
    str = str[1..-1]
  elsif str[0] == "+"
    str = str[1..-1]
  end
  
  num_arr = str.chars.map {|x| digits[x]}.reverse
  result = num_arr.each_with_index.reduce(0) { |memo, (el, index)| 
    memo + el*(10**index) }
  sign == "negative" ? -result : result
end

def string_to_integer(str)
  digits = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
              "7" => 7, "8" => 8, "9" => 9, "0" => 0}
  num_arr = str.chars.map {|x| digits[x]}.reverse
  num_arr.each_with_index.reduce(0) { |memo, (el, index)| 
    memo + el*(10**index) }
end

def string_to_signed_integer(str)
  str_skip_first = str[1..-1]
  num_skip_first = string_to_integer(str_skip_first)
  case str[0]
  when "-" then -num_skip_first
  when "+" then num_skip_first
  else string_to_integer(str)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
