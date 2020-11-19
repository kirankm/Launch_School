=begin
input number
Output number 
    the fibonacci index where the fib num number of digits = input number
Questions
  first 2 digits are 1,0 or 1,1
  for input num == 1 is the answer 0, 1?

Algorithm
  counter = 2
  f1 = 1
  f2 = 1
  while num_of_digits(f2) < input_num
    f1, f2 = f2, f1 + f2
    counter += 1
  end
  counter
=end

def find_fibonacci_index_by_length(len)
  counter = 2
  f1, f2 = 1, 1
  while f2.to_s.length < len
    f1, f2 = f2, f1 + f2
    counter += 1
  end
  counter
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
