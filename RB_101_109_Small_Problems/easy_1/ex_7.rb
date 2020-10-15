=begin
  input -> integer > 1
  output -> string of alternating 10; length same as input; start with 1

  Questions
  1) Validate input
  Algorithm
  set counter = 0
  set start_val = 1
  set output_str = ""
  while counter < digit
    output_str << start_val
    flip_start value
    counter += 1
=end

def flip(num)
  num == 0 ? 1 : 0
end

def stringy(num, start_val = 1)
  out_str = ""
  num.times do
    out_str << start_val.to_s
    start_val = flip(start_val)
  end
  out_str
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(8,0) == '01010101'

