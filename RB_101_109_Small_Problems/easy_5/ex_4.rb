=begin
  Input a string with multiple words (space separated)

  Output a string with each word where first and last letters are swapped

  Questions
    Does case matter
    Does every word contain a letter, that is no case of two spaces coming together
=end

def swap_first_last(string)
  string[0], string[-1] = [string[-1], string[0]]
  string
end

def swap(sentence)
  sentence.split(" ").map { |x| swap_first_last(x) }.join(" ")
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'