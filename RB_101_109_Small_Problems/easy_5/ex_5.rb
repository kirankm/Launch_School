=begin
input sentence with lowercases letters, and other non alphabetic characters
Output sentence with all lower case letters maintained, non alphabetic char replaced by space
 Multiple spaces to be collapsed into single space

Questions
  If starting is space, should it be maintained
  If ending is space should it be maintained

Algorithm
  Replace all non alphabetic character with space
  split on space and join
  If first character was space prepend space
  If Last character was space append space
=end

def cleanup(sentence)
  sentence_trans = sentence.gsub(/[^a-z]/, " ")
  out_sentence = sentence_trans.split(" ").join(" ")
  out_sentence.prepend(" ") if sentence_trans[0] == " "
  out_sentence << " " if sentence_trans[-1] == " "
  out_sentence
end

def cleanup(sentence)
  sentence_trans = replace_non_alphabets(sentence)
  out_sentence = sentence_trans.split(" ").join(" ")
  out_sentence.prepend(" ") if sentence_trans[0] == " "
  out_sentence << " " if sentence_trans[-1] == " "
  out_sentence
end

def replace_non_alphabets(str)
  alphabets = ("a".."z").to_a
  out_str = ""
  for letter in str.chars
    char_to_append = alphabets.include?(letter) ? letter : " "
    out_str << char_to_append
  end
  out_str
end

puts cleanup("---what's my +*& line?") == ' what s my line '
