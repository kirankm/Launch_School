def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false if dot_separated_words.length != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

def is_an_ip_number?(num)
  num.to_i.between?(0,255)
end

puts dot_separated_ip_address?("10.23.32")
puts dot_separated_ip_address?("10.23.32.435")
puts dot_separated_ip_address?("10.23.32.35.33")
puts dot_separated_ip_address?("10.23.32.33")