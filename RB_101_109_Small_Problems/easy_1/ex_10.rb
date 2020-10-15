=begin
  
Input
  Salary (Int, which is positive)  
  get_bonus (boolean)

  Output
    Int (either 50% or 100% of salary based on boolean value)

  Questions
  1) Input validation
    a) Should 2 nd value be boolean or can we work with it's truthiness
    b) Integer division? 

=end

def calculate_bonus(sal, give_bonus?)
  give_bonus? ? sal * 0.5 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
