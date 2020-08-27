def factors(number)
  divisor = min(number,1)
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def min(*values)
  values.min
end
 

puts factors(3)