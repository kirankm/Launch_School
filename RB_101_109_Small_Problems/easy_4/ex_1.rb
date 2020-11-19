=begin
 inputs:
  two strings (different lengths)
 output:
  new string with short string long string short string

questions
  1) can string be empty
  2) strings of same length

Algorithm
  Given 2 strings, identify the short and long string
  return concatenation of short + long + short
=end

def short_long_short(str1, str2)
  short, long = short_long(str1, str2)
  short + long + short
end

def short_long(str1, str2)
  return str1, str2 if str1.length < str2.length
  [str2, str1]
end

def short_long_short(str1, str2)
  arr = [str1, str2].sort_by { |e| e.size }
  arr.first + arr.last + arr.first
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
