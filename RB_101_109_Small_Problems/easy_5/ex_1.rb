=begin
  input string
  output number
  questions
    should empty string return 0
  algorithm
    convert string to array of chars
    convert each char to it's ascii value and append to array
    return sum of array
=end

def ascii_value(string)
  string.chars.map(&:ord).sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
