=begin
input sentence, words are space separated
output 
  hash
  keys, number indiciating size of words
  value number of words with size equal to key

questions
  can there be empty string -> should it return empty hash

Algorithm
Convert string into array of word length
Iterate through the array and for each value in the array increase count of value by 0
=end

def word_sizes(sentence)
  sentence.split(" ").map(&:size).each_with_object(Hash.new(0)) { |value, hash| hash[value] += 1 }
end

def word_size(word):
  word.gsub(/[^a-z]/i, "").size
end


puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
