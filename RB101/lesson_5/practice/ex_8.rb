hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)

def get_vowel(string)
  string.chars.select {|x| VOWELS.include? x}.join("")
end

test_hsh = {}
hsh.each_with_object(test_hsh) do |(key, value), hash|
  hash[key] = value.map do |x| 
    get_vowel(x)
  end
end

puts hash 
puts test_hsh
