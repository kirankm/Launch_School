=begin
  
input: Positive Integer
Output: Sum of digits

Questions
1) Input Validation

Algorithm
Convert to String
Get array of individual digits 
convert to array of numbers
Sum array
=end

def sum(num)
  num.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
