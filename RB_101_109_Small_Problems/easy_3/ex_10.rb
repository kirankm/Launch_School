=begin
  pedac
  Understanding
  - input 
    number
  output: boolean 
  questions
  what is palindromic number (if number converted to string is palindrom)
  is single number always palindromic  (yes, from example)
  can numbers start with 0?

  Examples
  palindromic_number?(34543) == true
  palindromic_number?(123210) == false
  palindromic_number?(22) == true
  palindromic_number?(5) == true

  Data structure
    Since we already have a palindrom function for strings, we can just convert number to string

=end


def palindrome?(obj)
  obj == obj.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true