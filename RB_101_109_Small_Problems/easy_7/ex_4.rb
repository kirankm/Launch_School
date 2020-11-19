def swapcase(word)
  word.chars.map { |x| x.upcase == x ? x.downcase : x.upcase}.join("")
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

