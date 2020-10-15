def palindrome?(obj)
  obj == obj.reverse
end

def real_palindrome?(obj)
  obj = obj.downcase.delete('^a-z0-9')
  palindrome?(obj)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('13a321') == false