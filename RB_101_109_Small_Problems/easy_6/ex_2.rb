=begin
  Input 
    Array of strings (strings can be lower and upper case)
  Output
    Array of strings (vowels removed)

  Questions
    How to treat empty strings ?
  
  Algorithm
    
=end

VOWELS = %w(a e i o u A E I O U)

def remove_vowel_from_word(word)
  word.chars.select { |x| !VOWELS.include?(x)}.join("")
end

def remove_vowels(array_of_strings)
  array_of_strings.map {|x| remove_vowel_from_word(x)}
end

def remove_vowels(strings)
  strings.map {|str| str.delete('aeiouAEIOU')}
end


puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
