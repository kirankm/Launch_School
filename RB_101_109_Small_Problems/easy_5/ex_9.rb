=begin
  input "string with space separated words"
  output string with space separated words. Consecutive repeated characters collapsed

  Question
    1) what should empty string return
    2) Should upper case and lower case be considered
=end

def crunch(str)
  str.squeeze
end

def crunch(str)
  out_str = ''
  str.chars.each { |x| out_str << x if out_str[-1] != x }
  out_str
end

def crunch(str)
  last_char = ''
  str.chars.select do |x|
    ret_val = last_char != x
    last_char = x
    ret_val
  end.join("")
end

def crunch(str)
  out_str = ""
  counter = 0
  while counter < str.length
    out_str << str[counter] if str[counter] != out_str[-1]
    counter += 1
  end
  out_str
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''