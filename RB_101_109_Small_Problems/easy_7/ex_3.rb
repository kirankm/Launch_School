def word_cap(sentence)
  sentence.split(" ").map(&:capitalize).join(" ")
end

def word_cap(sentence)
  sentence.split(" ").map {|x| capitalize(x)}.join(" ")
end

def capitalize(word)
  word.downcase!
  word[0] = (word[0].ord - 32).chr if word[0].ord.between?(97, 122)
  word
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
