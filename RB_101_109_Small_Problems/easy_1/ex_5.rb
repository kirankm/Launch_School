=begin
  input -> string
  output -> new string with words in reverse order 

  Question 
  1) how to define words (Assume space separated)
  2) empty string output -> empty string(assumption)
  3) Validate for extra space punctuation at end (assumption no)

  examples
  "" -> ""
  "hello" -> "hello"
  "hello world" -> "world hello"
  Data structure
  Use array to store words in string

  Algorithm
  split string into array of words
  reverse array
  join array with space
=end

def reverse_it(str)
  out_str = str.split(" ").reverse.join(" ")
  return out_str.length == str.length ? out_str : str
end

puts reverse_it(" ") == " "
puts reverse_it("") == ""
puts reverse_it("hello") == "hello"
puts reverse_it("Hello World") == "World Hello"