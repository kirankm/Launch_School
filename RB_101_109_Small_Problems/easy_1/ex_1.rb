=begin
Inputs
  String and count (integer)
Output
  prints string count times. No return value

Questions 
  1) Should string be validated
  2) What if count is 0

Examples
repeat("hello,3") == nil
=end

def repeat(string, count)
  count.times {puts "#{string}"}
  nil
end

repeat("Hello",3)