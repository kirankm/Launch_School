def multiply(a,b)
  a*b
end

def square(a)
  multiply(a,a)
end

puts square(5) == 25
puts square(-8) == 64

def power(a,n)
  out = 1
  n.times { out = multiply(out,a) }
  out
end

puts power(5,3) == 125
puts power(-5,3) == -125