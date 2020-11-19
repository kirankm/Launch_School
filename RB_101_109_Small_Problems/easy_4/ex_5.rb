=begin
input
  integer > 0
output
  integer
questions 
  if 2 should we return 0
    should n be included
algorithm
    start with empty list
    iterate from 1 to n
      check if multiple of 3 or 5
        if true append to list
    sum the list
=end

def multisum(n)
  Array(1..n).each_with_object([]) {|value, arr| arr << value if (value % 3 == 0 ) || (value % 5 == 0)}.sum
end

def multisum(n)
  1.upto(n).reduce(0) do |sum, n| 
    if (n % 3 == 0) || (n % 5 == 0)
      sum + n
    else
      sum
    end
  end
end


puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
