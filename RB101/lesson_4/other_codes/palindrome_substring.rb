=begin
PROBLEM:

Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

Test cases:

palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []

Questions
Should input be validated to check if string -> No (assumption)
What to return for emptry string -> Empt array (example)
What to return when no palindrom -> Empty array (example)

Requirements
Explicit
  Given a string return an array with all substrings which are palindrome
  Palindromes are case sensitive
Implicit
  Empty strings returns empty array
  String with no palindrome returns empty array

Psuedo Code Level 1
1) Initialize result array
2) Generate a list of all substrings greater than length 2 for original string and append
     to the result array (generate_substring)
3) Iterate through the array and check if each element is a palindrome
4) Remove elements which are not palindromes
5) Return the result array
=end

def generate_palindrome_substring(str)
  result_array = generate_substring(str)
  result_array.select {|x| is_palindrome(x)}
end

def is_palindrome(str)
  str.reverse == str
end

=begin
Example for substring
substring("halo") -> ["ha", "hal", "halo", "al", "alo", "lo"]

Psuedo Code for generate_substring
set req_len = 2
set result_array = []
while length is less than or equal to length of string
  generate all substring of len = req_Len  (generate_substring_with_length)
  req_len = req_len + 1
end
return result_array
=end

def generate_substring(str)
  result_array = []
  req_len = 2
  while req_len <= str.length do
    result_array.concat(generate_substring_with_length(str, req_len))
    req_len += 1
  end
  result_array
end

=begin
Psuedo Code for generate_substring_with_length
inputs str, len

set result_array = []
set start_index = 0
while start_index <= str.length - len
  Append substring starting with index start_index and length = len
  start_index = start_index + 1
end
return result_array
=end

def generate_substring_with_length(str, len)
  result_array = []
  start_index = 0
  while start_index <= str.length - len do
    result_array.append(str[start_index, len])
    start_index += 1
  end
  return result_array
end

puts generate_substring("halo").inspect
puts generate_substring("goalies").inspect

puts generate_palindrome_substring("supercalifragilisticexpialidocious").inspect
puts generate_palindrome_substring("abcddcbA").inspect
puts generate_palindrome_substring("palindrome").inspect
puts generate_palindrome_substring("").inspect
puts generate_palindrome_substring(" ").inspect
puts generate_palindrome_substring("  ").inspect


