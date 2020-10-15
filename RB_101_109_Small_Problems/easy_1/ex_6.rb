=begin
  input -> string
  output -> new string with words >= 5 written in reverse order. The order of the words to remain same

  Question 
  1) how to define words (Assume space separated)
  2) empty string output -> empty string(assumption)
  3) Validate for extra space punctuation at end (assumption no)

  examples
  "" -> ""
  "hello" -> "olleh"
  "cat" -> "cat"
  'Walk around the block' -> "Walk dnuora the kcolb"
  "hello world" -> "olleh dlrow"
  "Professional" -> "lanoisseforP"

  Data structure
  Use array to store words in string

  Algorithm
  split string into array of words
  reverse array
  join array with space
=end

def reverse_words(str)
  str.split(" ").map {|x| x.length >= 5 ? x.reverse : x}.join(" ")
end

puts reverse_words("Professional") == "lanoisseforP"
puts reverse_words("") == ""
puts reverse_words("hello") == "olleh"
puts reverse_words("Hello World") == "olleH dlroW"
puts reverse_words("Walk around the block") == "Walk dnuora the kcolb"