=begin
  Inputs
    Integer (which can be positive negative or 0)
  Output
    True if Absolute value is odd
  Questions 
    Should input be validated

  Examples
    3 -> true
    2 -> false
    0 -> false
    -0 -> false
    -1 -> true
    -2 -> false
=end

def is_odd?(num)
  num %2 == 1
end

def is_odd?(num) #Using remainder
  num.abs.remainder(2) == 1
end

puts is_odd?(3) == true
puts is_odd?(2) == false
puts is_odd?(0) == false
puts is_odd?(-0) == false
puts is_odd?(-1) == true
puts is_odd?(-2) == false