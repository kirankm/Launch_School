=begin
  Problem Understanding
  Input: Positive Integer
  Output: Array containing each digit in the integer
  
  Questions
  1) Should input be validated for positive, for data type = string 
  
  Example
  0 -> [0]
  puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
  puts digit_list(7) == [7]                     # => true
  puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
  puts digit_list(444) == [4, 4, 4]             

  Algorithms
  Option 1
  1) Convert Number to string
  2) set out_arr = []
  3) Traverse through character in string
  4) Convert character to integer and append to out_arr

  Option 2
  1) set array = []
  2) set power_of_10 = Get the next lowest power of 10 Math.log(n, 10)
  3) set current number = num
  3) loop until power of 10 becomes -1. In each loop
    1) digit = current_number / (10**power_of_10)
    2) current_number = remainder(current_numb/10**power_of_10)
    3) power_of_10 -= 1
    4) append digit to arry

  output _array
=end

def digit_list(num)
  out_arr = []
  num_string = num.to_s
  num_string.chars.each do |x|
    out_arr << x.to_i
  end
  out_arr
end

def digit_list(num)
  num.to_s.chars.map {|x| x.to_i}
end

def digit_list(num) ## Assumes num > 0
  out = []
  power = Math.log(num, 10).to_i
  curr_num = num
  while power >= 0
    divisor = 10**power
    digit = curr_num / divisor
    curr_num = curr_num % divisor
    power -= 1
    out << digit
  end
  out
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             
#puts digit_list(0) == [0]
